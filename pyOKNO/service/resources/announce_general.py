#!/usr/bin/env python
from flask import url_for, g
from common.base import EPBase
from service.resources.authentication import auth
from common.db import TUser, TGeneralAnnounce
import datetime

class EPAnnounceGeneral(EPBase):

    DEFAULT_OFFSET = 0
    DEFAULT_PAGE_SIZE = 10

    @auth.login_required
    def get(self, offset=0, limit=10):
        announces = []
        try:
            query = self.session.query(TGeneralAnnounce, TUser).\
                        order_by(TGeneralAnnounce.data_zamieszczenia.desc()).\
                        filter(TGeneralAnnounce.uzytkownik_id == TUser.uzytkownik_id)
            if query and query.count() > 0:
		if (offset == None) or (offset < 0):
                    offset = EPAnnounceGeneral.DEFAULT_OFFSET
		if (limit == None) or (limit <  0):
                    limit = EPAnnounceGeneral.DEFAULT_PAGE_SIZE
                query = query.offset(offset)
                query = query.limit(limit)
		for gen, user in query:
                    announces.append(
                        {'tytul': gen.tytul,
                         'tresc': gen.tresc,
                         'start': gen.data_zamieszczenia.isoformat(),
                         'autor': '%s %s' % (user.imie_1, user.nazwisko),
                         'id': gen.ogloszenie_ogolne_id})
        finally:
            self.session.close()
        records_size = len(announces)
        if records_size <= 0:
            return ('', 204)
        return super(EPAnnounceGeneral, self).get(
            {'general': announces,
             'uri': url_for('epannouncegeneral', offset=offset+records_size, limit=limit-(limit-records_size)).lower()
             })

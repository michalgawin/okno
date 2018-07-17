#!/usr/bin/env python
from flask import url_for
from common.base import EPBase
from common.db.model.TGeneralAnnounce import TGeneralAnnounce
from common.db.model.TUser import TUser
from service.resources.authentication import __auth__


class EPAnnounceGeneral(EPBase):

    DEFAULT_OFFSET = 0
    DEFAULT_PAGE_SIZE = 10

    @__auth__.login_required
    def get(self, offset=0, limit=10):
        announces = []
        try:
            if (offset == None) or (offset < 0):
                offset = EPAnnounceGeneral.DEFAULT_OFFSET
            if (limit == None) or (limit <  0):
                limit = EPAnnounceGeneral.DEFAULT_PAGE_SIZE
            query = self.session.query(TGeneralAnnounce, TUser).\
                        order_by(TGeneralAnnounce.data_zamieszczenia.desc()).\
                        filter(TGeneralAnnounce.uzytkownik_id == TUser.uzytkownik_id).\
                        offset(offset).limit(limit)
            for gen, user in query:
                announces.append({
                    'tytul': gen.tytul,
                    'tresc': gen.tresc,
                    'start': gen.data_zamieszczenia.isoformat(),
                    'autor': '%s %s' % (user.imie_1, user.nazwisko),
                    'id': gen.ogloszenie_ogolne_id
                })
        finally:
            self.session.close()
        records_size = len(announces)
        if records_size <= 0:
            return ('', 204)
        return super(EPAnnounceGeneral, self).get({
            'general': announces,
            'uri': url_for('epannouncegeneral', offset=offset+records_size-1, limit=limit-(limit-records_size)).lower()
        })

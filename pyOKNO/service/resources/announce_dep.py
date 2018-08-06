#!/usr/bin/env python
from flask import url_for, g
from common.base import EPBase
from common.db.database import SessionDecorator
from common.db.model.TConstAnnounce import TConstAnnounce
from common.db.model.TUser import TUser
from service.resources.authentication import __auth__


class EPAnnounceDep(EPBase):

    DEFAULT_OFFSET = 0
    DEFAULT_PAGE_SIZE = 10

    @__auth__.login_required
    def get(self, id, offset=0, limit=10):
        return self._get(id, offset, limit)

    @SessionDecorator
    def _get(self, id, offset, limit):
        announces = []
        if (offset == None) or (offset < 0):
            offset = EPAnnounceDep.DEFAULT_OFFSET
        if (limit == None) or (limit < 0):
            limit = EPAnnounceDep.DEFAULT_PAGE_SIZE
        query = g.session.query(TConstAnnounce, TUser).\
            order_by(TConstAnnounce._modyfikowal_data.desc()).\
            filter(TConstAnnounce.wydzial_id == id).\
            filter(TConstAnnounce._modyfikowal_id == TUser.uzytkownik_id).\
            offset(offset).limit(limit)
        for con, user in query:
            announces.append({
                'tresc': con.tresc,
                'start': '%s' % con._modyfikowal_data,
                'autor': '%s %s' % (user.imie_1, user.nazwisko)
            })
        records_size = len(announces)
        if records_size <= 0:
            return ('', 204)
        return super(EPAnnounceDep, self).get({
            'announces': announces,
            'uri': url_for('epannouncedep', id=id, offset=offset+records_size, limit=limit-(limit-records_size)).lower()
        })

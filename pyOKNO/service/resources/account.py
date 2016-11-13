#!/usr/bin/env python
from flask import url_for, g
from okno_service.resources.base import EPBase
from okno_service.resources.authentication import auth

class EPAccount(EPBase):
    @auth.login_required
    def get(self):
        return super(EPAccount, self).get(
            {'Name': g.user.imie_1,
             'Lastname': g.user.nazwisko,
             'email': g.user.email,
             'phone': g.user.telefon,
             'birth': '%s' % g.user.data_urodzenia,
             'active': g.user.aktywny,
             'uri': url_for('eptoken').lower()})
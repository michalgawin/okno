#!/usr/bin/env python
from flask import url_for, g

from common.base import EPBase
from auth.resources.authentication import __auth__


class EPToken(EPBase):

    ERR_NOT_LOGGED_IN = {'error': 'User not logged in'}

    @__auth__.login_required
    def post(self):
        if hasattr(g, "user"):
            token = g.user.generate_auth_token()
            return super(EPToken, self).post({
                'token': token,
                'uri': url_for('eptoken')
            })
        return super(EPToken, self).post(EPToken.ERR_NOT_LOGGED_IN)
    
    @__auth__.login_required
    def get(self):
        if hasattr(g, "user"):
            return super(EPToken, self).get({
                'name': g.user.imie_1,
                'lastname': g.user.nazwisko,
                'email': g.user.email,
                'phone': g.user.telefon,
                'birth': '%s' % g.user.data_urodzenia,
                'active': g.user.aktywny,
                'login': g.user.login,
                'logged': 'yes'
            })
        return super(EPToken, self).post(EPToken.ERR_NOT_LOGGED_IN)

#!/usr/bin/env python
from flask import url_for, g

from common.app import FlaskApp
from common.base import EPBase
from auth.resources.authentication import __auth__


class EPToken(EPBase):
    @__auth__.login_required
    def post(self):
        FlaskApp.instance().app.logger.info('got token request|post')
        token = g.user.generate_auth_token()
        return super(EPToken, self).post({
            'token': token,
            'uri': url_for('eptoken')
        })
    
    @__auth__.login_required
    def get(self):
        FlaskApp.instance().app.logger.info('got token request|get')
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

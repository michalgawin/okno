#!/usr/bin/env python
from flask import url_for, g
from common.base import EPBase
from auth.resources.authentication import auth
from .. import app

class EPToken(EPBase):
    @auth.login_required
    def post(self):
        app.logger.info('got token request|post')
        token = g.user.generate_auth_token()
        return super(EPToken, self).post(
            {'token': token,
             'uri': url_for('eptoken'.lower())})
    
    @auth.login_required
    def get(self):
        app.logger.info('got token request|get')
        return super(EPToken, self).get(
            {'Name': g.user.imie_1,
             'Lastname': g.user.nazwisko,
             'email': g.user.email,
             'phone': g.user.telefon,
             'birth': '%s' % g.user.data_urodzenia,
             'active': g.user.aktywny,
             'login': g.user.login,
             'logged': 'yes'})

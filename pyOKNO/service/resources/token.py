#!/usr/bin/env python
from flask import url_for, g
from common.base import EPBase
from service.resources.authentication import auth


class EPToken(EPBase):
    @auth.login_required
    def post(self):
        token = g.user
        return super(EPToken, self).post({
            'token': token,
            'uri': url_for('epwelcome')
        })


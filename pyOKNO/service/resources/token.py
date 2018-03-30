#!/usr/bin/env python
from flask import url_for, g
from common.base import EPBase
from service.resources.authentication import __auth__


class EPToken(EPBase):
    @__auth__.login_required
    def get(self):
        token = g.user
        return super(EPToken, self).post({
            'token': token,
            'uri': url_for('epwelcome')
        })


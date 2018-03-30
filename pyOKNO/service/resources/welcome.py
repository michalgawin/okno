#!/usr/bin/env python
from flask import url_for, g
from common.base import EPBase
from service.resources.authentication import __auth__


class EPWelcome(EPBase):
    @__auth__.login_required
    def get(self):
        return super(EPWelcome, self).get({
            'message': 'Hi %s!' % (g.user['login']),
            'uri': url_for('EPToken'.lower())
        })

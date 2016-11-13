#!/usr/bin/env python
from flask import url_for, g
from common.base import EPBase
from service.resources.authentication import auth

class EPWelcome(EPBase):
    @auth.login_required
    def get(self):
        return super(EPWelcome, self).get(
            {'message': 'Hi %s!' % (g.user.imie_1),
             'uri': url_for('epaccount'.lower()) })

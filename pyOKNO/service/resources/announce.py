#!/usr/bin/env python
from flask import url_for
from common.base import EPBase
from service.resources.authentication import auth


class EPAnnounce(EPBase):
    @auth.login_required
    def get(self):
        return super(EPAnnounce, self).get({
            'announce': ['general', 'const'],
            'uri': url_for('EPAnnounceGeneral'.lower(), offset=0, limit=5).lower()
        })

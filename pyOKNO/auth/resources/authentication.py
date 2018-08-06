#!/usr/bin/env python
from flask import g
from flask_httpauth import HTTPBasicAuth

from common.db.database import SessionDecorator
from common.db.model.TUser import TUser

__auth__ = HTTPBasicAuth()


@__auth__.verify_password
@SessionDecorator
def verify_password(username_or_token, password):
    user = TUser.verify_auth_token(username_or_token)
    if not user:
        user = g.session.query(TUser).filter_by(login=username_or_token).first()
        if not user or not user.verify_password(password):
            g.user = None
            return False
    g.user = user
    return True

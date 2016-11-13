#!/usr/bin/env python
from flask import g
from flask.ext.httpauth import HTTPBasicAuth
from common.db import CDatabase, TUser
from .. import app

auth = HTTPBasicAuth()

@auth.verify_password
def verify_password(username_or_token, password):
    app.logger.info("Token " + username_or_token)
    user = TUser.verify_auth_token(username_or_token)
    if not user:
        try:
            session = CDatabase.get_session()
            user = session.query(TUser).filter_by(login = username_or_token).first()
        finally:
            session.close()
        if not user or not user.verify_password(password):
            return False
    g.user = user
    return True

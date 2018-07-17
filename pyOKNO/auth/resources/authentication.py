#!/usr/bin/env python
from flask import g
from flask_httpauth import HTTPBasicAuth

from common.app import FlaskApp
from common.db.database import CDatabase
from common.db.model.TUser import TUser

__auth__ = HTTPBasicAuth()


@__auth__.verify_password
def verify_password(username_or_token, password):
    FlaskApp.instance().app.logger.info("Token " + username_or_token)
    user = TUser.verify_auth_token(username_or_token)
    if not user:
        session = CDatabase.instance().session
        try:
            user = None
            if session is not None:
                user = session.query(TUser).filter_by(login=username_or_token).first()
        finally:
            if session is not None:
                session.close()
        if not user or not user.verify_password(password):
            return False
    g.user = user
    return True

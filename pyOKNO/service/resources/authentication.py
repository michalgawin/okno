#!/usr/bin/env python
from flask import g
from flask_httpauth import HTTPBasicAuth
from itsdangerous import (TimedJSONWebSignatureSerializer as Serializer, BadSignature, SignatureExpired)

from common.app import FlaskApp

__auth__ = HTTPBasicAuth()


@__auth__.verify_password
def verify_password(token, password):
    s = Serializer(FlaskApp.instance().app.config['SECRET_KEY'])
    try:
        data = s.loads(token)
        g.user = data
    except SignatureExpired:
        return False
    except BadSignature:
        return False
    return True


'''@__auth__.verify_password
def verify_password(username_or_token, password):
    try:
        r = requests.get('http://localhost:6666/token', auth=(username_or_token, ''))
        if r.status_code == 200:
            g.login = json.loads(r.text)['login']
            return True
    except Exception:
        pass
    return False'''

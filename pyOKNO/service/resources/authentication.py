#!/usr/bin/env python
'''
from flask import g
from flask.ext.httpauth import HTTPBasicAuth
from common.db import CDatabase, TUser
import requests, json
from .. import app

auth = HTTPBasicAuth()

@auth.verify_password
def verify_password(username_or_token, password):
    try:
        app.logger.info("token: " + username_or_token)
        r = requests.get('http://localhost:5555/token', auth=(username_or_token, ''))
        if r.status_code == 200:
            g.login = json.loads(r.text)['login']
            return True
    except Exception:
        pass
    return False
'''
from flask import g
from flask.ext.httpauth import HTTPBasicAuth
from itsdangerous import (TimedJSONWebSignatureSerializer as Serializer, BadSignature, SignatureExpired)
from .. import app

auth = HTTPBasicAuth()

@auth.verify_password
def verify_password(token, password):
    s = Serializer(app.config['SECRET_KEY'])
    try:
        data = s.loads(token)
        app.logger.warning(str(data['id']) + ' ' + data['name'] + ' ' + data['lastname'] + ' ' + data['login'])
        g.user = data
    except SignatureExpired:
        return False
    except BadSignature:
        return False
    return True


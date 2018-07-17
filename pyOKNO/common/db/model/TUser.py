#!/usr/bin/env python
import hashlib

from itsdangerous import Serializer, SignatureExpired, BadSignature, TimedJSONWebSignatureSerializer

from common.app import FlaskApp
from common.db.database import CDatabase
from common.db.model.AbstractBase import AbstractBase


class TUser(AbstractBase):

    __tablename__ = 'uzytkownik'

    def generate_auth_token(self, expiration=3600*30):
        s = TimedJSONWebSignatureSerializer(FlaskApp.instance().app.config['SECRET_KEY'], expires_in=expiration)
        return s.dumps({'id': self.uzytkownik_id,
                        'login': self.login})\
            .decode('utf-8')

    @staticmethod
    def verify_auth_token(token):
        s = Serializer(FlaskApp.instance().app.config['SECRET_KEY'])
        try:
            data = s.loads(token)
        except SignatureExpired:
            return None
        except BadSignature:
            return None
        try:
            session = CDatabase.instance().session
            user = session.query(TUser).get(data['id'])
        finally:
            session.close()
        return user

    def verify_password(self, password):
        hash_ = hashlib.md5()
        hash_.update(password.encode('utf-8'))
        return self.haslo == hash_.hexdigest()


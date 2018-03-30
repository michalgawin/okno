#!/usr/bin/env python

import datetime
from itsdangerous import (TimedJSONWebSignatureSerializer
                          as Serializer, BadSignature, SignatureExpired)
from sqlalchemy import *
from sqlalchemy.ext.declarative import declarative_base
import hashlib

from common.app import FlaskApp
from common.database import CDatabase


db_metadata = CDatabase.instance().metadata
db_base = CDatabase.instance().base


class TUser(declarative_base()): #-> specjalnosc_id
    __table__ = Table('uzytkownik', db_metadata, autoload=True)

    def generate_auth_token(self, expiration=3600*30):
        s = Serializer(FlaskApp.instance().app.config['SECRET_KEY'], expires_in=expiration)
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


TStudent = db_base.classes.student_dodatkowe #uzytkownik_id, wydzial_id, specjalnosc_id
TDepartment = db_base.classes.sl_wydzial #nazwa
TSpeciality = db_base.classes.specjalnosc #nazwa, wydzial_id
TSpeciality2Plan = db_base.classes.specjalnosc_plan #specjalnosc_id -> plan_id
TPlan = db_base.classes.plan #nazwa
TSubject2Plan = db_base.classes.plan_pozycja #przedmiot_id -> plan_id, ects
TSubject = db_base.classes.przedmiot

TGeneralAnnounce = db_base.classes.ogloszenie_ogolne
TConstAnnounce = db_base.classes.ogloszenie_stale
TCalendar = db_base.classes.kalendarz_pozycja
TYear = db_base.classes.sl_rok_akademicki

TEmployee = db_base.classes.pracownik_dodatkowe


class TPeriod(declarative_base()):
    __table__ = Table('obc_okres', db_metadata, autoload=True)

    @staticmethod
    def find_current():
        date = datetime.datetime.now()
        return TPeriod.find(date)

    @staticmethod
    def find(date):
        session = CDatabase.instance().session
        try:
            return session.query(TPeriod).\
                filter(TPeriod.data_od <= date).\
                filter(TPeriod.data_do >= date).\
                first().rok_akademicki_id
        finally:
            session.close()


class TSubjectEdition(declarative_base()):
    __table__ = Table('przedmiot_edycja', db_metadata, autoload=True)

    @staticmethod
    def get_current_edition(subject_id):
        session = CDatabase.instance().session
        try:
            academic_year = TPeriod.find_current()
            return session.query(TSubjectEdition).\
                filter(TSubjectEdition.przedmiot_id == subject_id).\
                filter(TSubjectEdition.rok_akademicki_id == academic_year).\
                first().przedmiot_edycja_id
        finally:
            session.close()


class TSubjectEdition2Student(declarative_base()):
    __table__ = Table('przedmiot_edycja_student', db_metadata, autoload=True)
    
    @staticmethod
    def save(subject_edition_id, user_id):
        session = CDatabase.instance().session
        try:
            record = TSubjectEdition2Student(
                przedmiot_edycja_id=subject_edition_id,
                uzytkownik_id=user_id,
                data_zapisu=datetime.datetime.now())
            session.add(record)
            session.flush()
            session.commit()
        finally:
            session.close() 

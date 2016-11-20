#!/usr/bin/env python

from flask import jsonify, g
from itsdangerous import (TimedJSONWebSignatureSerializer
                          as Serializer, BadSignature, SignatureExpired)
from sqlalchemy import *
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine
from sqlalchemy.orm import relationship
from .app import CApp
import md5
import datetime


class CDatabase(object):
    _DB_PATH_PATTERN = 'mysql+mysqldb://root:%s@%s/%s?charset=utf8'
    _DB_PATH = None
    _ENGINE = None

    @classmethod
    def init(cls, address, name, password):
        cls._DB_PATH = cls._DB_PATH_PATTERN % (password, address, name)
        cls._ENGINE = create_engine(cls._DB_PATH, echo=False)

    @classmethod
    def get_engine(cls):
        if not cls._ENGINE:
            cls._ENGINE = create_engine(cls._DB_PATH, echo=False)
        return cls._ENGINE

    @classmethod
    def get_session(cls):
        if not cls._ENGINE:
            cls._ENGINE = create_engine(cls._DB_PATH, echo=False)
        return Session(cls._ENGINE)

CDatabase.init('localhost', 'okno', 'adminq1!')
metadata = MetaData(bind=CDatabase.get_engine())
Base = automap_base()
Base.prepare(CDatabase.get_engine(), reflect=True)

class TUser(declarative_base()): #-> specjalnosc_id
    __table__ = Table('uzytkownik', metadata, autoload=True)

    def generate_auth_token(self, expiration = 3600*30):
        s = Serializer(CApp().get_app().config['SECRET_KEY'], expires_in = expiration)
        return s.dumps({ 'id': self.uzytkownik_id,
                         'login': self.login })

    @staticmethod
    def verify_auth_token(token):
        s = Serializer(CApp().get_app().config['SECRET_KEY'])
        try:
            data = s.loads(token)
        except SignatureExpired:
            return None
        except BadSignature:
            return None
        try:
            session = CDatabase.get_session()
            user = session.query(TUser).get(data['id'])
        finally:
            session.close()
        return user

    def verify_password(self, password):
        hash_ = md5.new()
        hash_.update(password)
        return self.haslo == hash_.hexdigest()

TStudent = Base.classes.student_dodatkowe #uzytkownik_id, wydzial_id, specjalnosc_id
TDepartment = Base.classes.sl_wydzial #nazwa
TSpeciality = Base.classes.specjalnosc #nazwa, wydzial_id
TSpeciality2Plan = Base.classes.specjalnosc_plan #specjalnosc_id -> plan_id
TPlan = Base.classes.plan #nazwa
TSubject2Plan = Base.classes.plan_pozycja #przedmiot_id -> plan_id, ects
TSubject = Base.classes.przedmiot

TGeneralAnnounce = Base.classes.ogloszenie_ogolne
TConstAnnounce = Base.classes.ogloszenie_stale
TCalendar = Base.classes.kalendarz_pozycja
TYear = Base.classes.sl_rok_akademicki

TEmployee = Base.classes.pracownik_dodatkowe

class TPeriod(declarative_base()):
    __table__ = Table('obc_okres', metadata, autoload=True)

    @staticmethod
    def find_current():
        date = datetime.datetime.now()
        return TPeriod.find(date)
    
    @staticmethod
    def find(date):
        session = CDatabase.get_session()
        try:
            return session.query(TPeriod).\
                filter(TPeriod.data_od <= date).\
                filter(TPeriod.data_do >= date).\
                first().rok_akademicki_id
        finally:
            session.close()
    
class TSubjectEdition(declarative_base()):
    __table__ = Table('przedmiot_edycja', metadata, autoload=True)

    @staticmethod
    def get_current_edition(subject_id):
        session = CDatabase.get_session()
        try:
            academic_year = TPeriod.find_current()
            return session.query(TSubjectEdition).\
                filter(TSubjectEdition.przedmiot_id == subject_id).\
                filter(TSubjectEdition.rok_akademicki_id == academic_year).\
                first().przedmiot_edycja_id
        finally:
            session.close()

class TSubjectEdition2Student(declarative_base()):
    __table__ = Table('przedmiot_edycja_student', metadata, autoload=True)
    
    @staticmethod
    def save(subject_edition_id, user_id):
        session = CDatabase.get_session()
        try:
            record = TSubjectEdition2Student(przedmiot_edycja_id=subject_edition_id,
                        uzytkownik_id=user_id,
                        data_zapisu=datetime.datetime.now())
            session.add(record)
            session.flush()
            session.commit()
        finally:
            session.close() 


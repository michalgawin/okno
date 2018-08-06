#!/usr/bin/env python
import sys
import functools

from flask import g
from sqlalchemy import create_engine
from sqlalchemy.exc import OperationalError
from sqlalchemy.ext.declarative import DeferredReflection
from sqlalchemy.orm import Session


from common.app import FlaskApp

try:
    import pymysql
    pymysql.install_as_MySQLdb()
except ImportError as e:
    sys.stderr.write("Cannot import pymysql library (required by docker)\n")


DB_URL_PATTERN = 'mysql+mysqldb://{user}:{password}@{host}/{database}?charset=utf8'
url = DB_URL_PATTERN.format(user='user', password='haslo', host='database', database='okno')
engine = create_engine(url, echo=False)


def lazy_reflection():
    if not getattr(lazy_reflection, "reflected", False):
        try:
            DeferredReflection.prepare(engine)
            setattr(lazy_reflection, "reflected", True)
        except OperationalError as ex:
            FlaskApp.instance().app.logger.error('Cannot connect with database {}'.format(ex.message))
            return False
    return True


def create_session():
    if lazy_reflection():
        return Session(engine)
    return None


class SessionDecorator(object):

    def __init__(self, func):
        self._func = func
        self._obj = None
        self._wrapped = None

    def __call__(self, *args, **kwargs):
        if not self._wrapped:
            SessionDecorator._create_and_get_db_session()
            if self._obj:
                self._wrapped = self._wrap_method(self._func)
                self._wrapped = functools.partial(self._wrapped, self._obj)
            else:
                self._wrapped = self._wrap_function(self._func)
        return self._wrapped(*args, **kwargs)

    def __get__(self, obj, type=None):
        self._obj = obj
        return self

    def _wrap_method(self, method):
        @functools.wraps(method)
        def inner(self, *args, **kwargs):
            return method(self, *args, **kwargs)
        return inner

    def _wrap_function(self, function):
        @functools.wraps(function)
        def inner(*args, **kwargs):
            return function(*args, **kwargs)
        return inner

    @staticmethod
    def _create_and_get_db_session():
        if not hasattr(g, "session"):
            g.session = create_session()
        return g.session


# from sqlalchemy import create_engine, MetaData
# from sqlalchemy.ext.automap import automap_base


# class CDatabase(object):

    # _DB_PATH_PATTERN = 'mysql+mysqldb://{user}:{password}@{host}/{database}?charset=utf8'
    # _db_path = None
    # _prepared = False

    # def __init__(self, user, password, address, database_name):
        # self._metadata = None
        # self._engine = None
        # self._session = None
        # self._base = None
        # self._db_path = self._DB_PATH_PATTERN.format(user=user, password=password, host=address, database=database_name)

    # @classmethod
    # def instance(cls):
    #     if not hasattr(cls, "_instance"):
    #         inst = CDatabase("user", "haslo", "192.168.99.100", "okno")
    #         cls._instance = inst
    #     return cls._instance

    # def get_engine(self):
    #     if self._engine is None:
    #         self._engine = create_engine(self._db_path, echo=False)
    #     return self._engine
    #
    # def set_engine(self, val):
    #     if val is not None:
    #         self._engine = val
    #
    # def get_base(self):
    #     if self._base is None:
    #         self._base = automap_base()
    #     return self._base
    #
    # def set_base(self, val):
    #     if val is not None:
    #         self._base = val
    #
    # def get_metadata(self):
    #     if self._metadata is None:
    #         self._metadata = MetaData(bind=self.engine)
    #     return self._metadata
    #
    # def set_metadata(self, val):
    #     if val is not None:
    #         self._metadata = val

    # def get_session(self):
    #     CDatabase.load_database_schema()
    #
    #     if self._session is None and CDatabase._prepared is True:
    #         self._session = Session(engine)
    #     return self._session
    #
    # def set_session(self, val):
    #     if val is not None:
    #         self._session = val
    #
    # def del_session(self):
    #     if self._session is not None:
    #         self._session.close()
    #     self._session = None

    # @staticmethod
    # def load_database_schema():
    #     if not CDatabase._prepared:
    #         try:
    #             DeferredReflection.prepare(engine)
    #             CDatabase._prepared = True
    #         except OperationalError as ex:
    #             FlaskApp.instance().app.logger.error('Cannot connect with database {}'.format(ex.message))
    #
    # session = property(get_session, set_session, del_session)


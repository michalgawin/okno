#!/usr/bin/env python
import sys

import sqlalchemy
import time
from sqlalchemy import create_engine, MetaData
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session

try:
    import pymysql
    pymysql.install_as_MySQLdb()
except ImportError as e:
    sys.stderr.write("Cannot import pymysql library (required by docker)\n")


class CDatabase(object):

    _DB_PATH_PATTERN = 'mysql+mysqldb://{user}:{password}@{host}/{database}?charset=utf8'
    _db_path = None

    def __init__(self, user, password, address, database_name):
        self._metadata = None
        self._engine = None
        self._session = None
        self._base = None
        self._db_path = self._DB_PATH_PATTERN.format(user=user, password=password, host=address, database=database_name)

    @classmethod
    def instance(cls):
        if not hasattr(cls, "_instance"):
            inst = CDatabase("user", "haslo", "database", "okno")
            inst.connect()
            cls._instance = inst
        return cls._instance

    def connect(self):
        # self.metadata = MetaData(bind=self.get_engine())
        for i in range(0, 60):
            try:
                self.metadata
                self.base
                self.base.prepare(self.engine, reflect=True)
                break
            except sqlalchemy.exc.OperationalError as e:
                sys.stderr.write("\nAttempt to connect with database failed")
                time.sleep(10)
                continue

    def get_engine(self):
        if self._engine is None:
            self._engine = create_engine(self._db_path, echo=False)
        return self._engine

    def set_engine(self, val):
        if val is not None:
            self._engine = val

    def get_base(self):
        if self._base is None:
            self._base = automap_base()
        return self._base

    def set_base(self, val):
        if val is not None:
            self._base = val

    def get_metadata(self):
        if self._metadata is None:
            self._metadata = MetaData(bind=self.engine)
        return self._metadata

    def set_metadata(self, val):
        if val is not None:
            self._metadata = val

    def get_session(self):
        if self._session is None:
            self._session = Session(self.engine)
        return self._session

    def set_session(self, val):
        if val is not None:
            self._session = val

    def del_session(self):
        self._session.close()
        self._session = None

    session = property(get_session, set_session, del_session)
    metadata = property(get_metadata, set_metadata)
    base = property(get_base, set_base)
    engine = property(get_engine, set_engine)

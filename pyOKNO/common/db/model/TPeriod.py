#!/usr/bin/env python
import datetime

from common.db.database import CDatabase
from common.db.model.AbstractBase import AbstractBase


class TPeriod(AbstractBase):

    __tablename__ = 'obc_okres'

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

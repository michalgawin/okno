#!/usr/bin/env python
import datetime

from flask import g

from common.db.database import SessionDecorator
from common.db.model.AbstractBase import AbstractBase


class TPeriod(AbstractBase):

    __tablename__ = 'obc_okres'

    @staticmethod
    def find_current():
        date = datetime.datetime.now()
        return TPeriod.find(date)

    @staticmethod
    @SessionDecorator
    def find(date):
        return g.session.query(TPeriod).\
            filter(TPeriod.data_od <= date).\
            filter(TPeriod.data_do >= date).\
            first().rok_akademicki_id

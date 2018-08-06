#!/usr/bin/env python
from flask import g

from common.db.database import SessionDecorator
from common.db.model.AbstractBase import AbstractBase
from common.db.model.TPeriod import TPeriod


class TSubjectEdition(AbstractBase):

    __tablename__ = 'przedmiot_edycja'

    @staticmethod
    @SessionDecorator
    def get_current_edition(subject_id):
        academic_year = TPeriod.find_current()
        return g.session.query(TSubjectEdition).\
            filter(TSubjectEdition.przedmiot_id == subject_id).\
            filter(TSubjectEdition.rok_akademicki_id == academic_year).\
            first().przedmiot_edycja_id

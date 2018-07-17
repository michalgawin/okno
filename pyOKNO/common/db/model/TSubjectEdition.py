#!/usr/bin/env python
from common.db.database import CDatabase
from common.db.model.AbstractBase import AbstractBase
from common.db.model.TPeriod import TPeriod


class TSubjectEdition(AbstractBase):

    __tablename__ = 'przedmiot_edycja'

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

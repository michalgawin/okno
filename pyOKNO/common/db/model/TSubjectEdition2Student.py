#!/usr/bin/env python
import datetime

from common.db.database import CDatabase
from common.db.model.AbstractBase import AbstractBase


class TSubjectEdition2Student(AbstractBase):

    __tablename__ = 'przedmiot_edycja_student'

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

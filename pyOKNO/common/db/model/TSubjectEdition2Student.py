#!/usr/bin/env python
import datetime

from flask import g

from common.db.database import SessionDecorator
from common.db.model.AbstractBase import AbstractBase


class TSubjectEdition2Student(AbstractBase):

    __tablename__ = 'przedmiot_edycja_student'

    @staticmethod
    @SessionDecorator
    def save(subject_edition_id, user_id):
            record = TSubjectEdition2Student(
                przedmiot_edycja_id=subject_edition_id,
                uzytkownik_id=user_id,
                data_zapisu=datetime.datetime.now())
            g.session.add(record)
            g.session.flush()
            g.session.commit()

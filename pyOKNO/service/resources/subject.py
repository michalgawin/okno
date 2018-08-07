#!/usr/bin/env python
from flask import url_for, g

from common.app import FlaskApp
from common.base import EPBase
from common.db.database import SessionDecorator
from common.db.model.Speciality2Plan import TSpeciality2Plan
from common.db.model.TDepartment import TDepartment
from common.db.model.TPlan import TPlan
from common.db.model.TSpeciality import TSpeciality
from common.db.model.TStudent import TStudent
from common.db.model.TSubject import TSubject
from common.db.model.TSubject2Plan import TSubject2Plan
from common.db.model.TSubjectEdition import TSubjectEdition
from common.db.model.TSubjectEdition2Student import TSubjectEdition2Student
from common.db.model.TUser import TUser
from service.resources.authentication import __auth__
import datetime


class EPSubjects(EPBase):

    @__auth__.login_required
    def get(self):
        return self._get()

    @SessionDecorator
    def _get(self):
        subjects_list = []
        # get all subjects for speciality
        specs = \
            g.session.query(TSpeciality).\
                join(TStudent, TStudent.specjalnosc_id == TSpeciality.specjalnosc_id).\
                join(TUser, TUser.uzytkownik_id == TStudent.uzytkownik_id).\
                filter(TUser.login == g.user['login']).\
                all()
        if not len(specs):
            # get all subjects for departments
            specs = \
                g.session.query(TSpeciality).\
                    join(TDepartment, TDepartment.wydzial_id == TSpeciality.wydzial_id).\
                    join(TStudent, TStudent.wydzial_id == TDepartment.wydzial_id).\
                    join(TUser, TUser.uzytkownik_id == TStudent.uzytkownik_id).\
                    filter(TUser.login == g.user['login']).\
                    all()
        for spec in specs:
            temp = {'name': spec.nazwa, 'plans': []}

            plans = \
                g.session.query(TPlan).\
                    join(TSpeciality2Plan, TSpeciality2Plan.plan_id == TPlan.plan_id).\
                    filter(spec.specjalnosc_id == TSpeciality2Plan.specjalnosc_id).\
                    all()
            for plan in plans:
                temp2 = {'name': plan.nazwa}
                subjects = \
                    g.session.query(TSubject).\
                        join(TSubject2Plan, TSubject2Plan.przedmiot_id == TSubject.przedmiot_id).\
                        join(TPlan, TPlan.plan_id == TSubject2Plan.plan_id).\
                        filter(plan.plan_id == TPlan.plan_id).\
                        all()
                temp2['subjects'] = [{
                    'uri': url_for('epsubject', id=s.przedmiot_id),
                    'name': s.nazwa}
                    for s in subjects
                ]
                temp['plans'].append(temp2)
            subjects_list.append(temp)
        return super(EPSubjects, self).get({
            'subjects': subjects_list
        })


class EPSubject(EPBase):

    @__auth__.login_required
    def get(self, id):
        return self._get(id)

    @SessionDecorator
    def _get(self, id):
        current_date = datetime.datetime.now()
        edition = self.get_current_edition(id)
        subject, user = g.session.query(TSubject, TUser).\
            filter(TSubject.przedmiot_id == id).\
            filter(TSubject.odpowiedzialny_id == TUser.uzytkownik_id).\
            first()
        return self.send_response(subject, user, edition)

    @__auth__.login_required
    def put(self, id):
        self.enroll_on_subject(id)
        return '', 201
    
    def enroll_on_subject(self, subject_id):
        edition = self.get_current_edition(subject_id)
        if edition is not None:
            try:
                TSubjectEdition2Student.save(edition, g.user['id'])
            except Exception as e:
                FlaskApp().app.logger.error('Cannot enroll user on subject edition %s: %s', edition, e)
                raise e
        
    def get_current_edition(self, subject_id):
        try:
            return TSubjectEdition.get_current_edition(subject_id)
        except AttributeError as e:
            FlaskApp().app.logger.error('No current edition of subject %s: %s', subject_id, e)
        return -1 

    def send_response(self, subject, user, enroll):
        if subject and user:
            return super(EPSubject, self).get({
                'nazwa': subject.nazwa,
                'cel': subject.cel_przedmiotu,
                'opis': subject.opis,
                'bibliografia': subject.bibliografia,
                'prowadzacy': '%s %s' % (user.imie_1, user.nazwisko),
                'edycja': enroll,
                'uri': url_for('epsubjects'.lower())
            })
        return {}

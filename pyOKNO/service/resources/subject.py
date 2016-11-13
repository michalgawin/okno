#!/usr/bin/env python
from flask import url_for, g, request
from common.base import EPBase
from service.resources.authentication import auth
from common.db import *
import datetime
from .. import app

class EPSubjects(EPBase):
    @auth.login_required
    def get(self):
        subjects_list = []
        try:
            # get all subjects for speciality
            specs = \
                self.session.query(TSpeciality).\
                    join(TStudent, TStudent.specjalnosc_id == TSpeciality.specjalnosc_id).\
                    join(TUser, TUser.uzytkownik_id == TStudent.uzytkownik_id).\
                    filter(TUser.login == g.user['login']).\
                    all()
            if not len(specs):
                # get all subjects for departments
                specs = \
                    self.session.query(TSpeciality).\
                        join(TDepartment, TDepartment.wydzial_id == TSpeciality.wydzial_id).\
                        join(TStudent, TStudent.wydzial_id == TDepartment.wydzial_id).\
                        join(TUser, TUser.uzytkownik_id == TStudent.uzytkownik_id).\
                        filter(TUser.login == g.user['login']).\
                        all()
            for spec in specs:
                temp = {}
                temp['name'] = spec.nazwa
                temp['plans'] = []

                plans = \
                    self.session.query(TPlan).\
                        join(TSpeciality2Plan, TSpeciality2Plan.plan_id == TPlan.plan_id).\
                        filter(spec.specjalnosc_id == TSpeciality2Plan.specjalnosc_id).\
                        all()
                for plan in plans:
                    temp2 = {}
                    temp2['name'] = plan.nazwa
                    subjects = \
                        self.session.query(TSubject).\
                            join(TSubject2Plan, TSubject2Plan.przedmiot_id == TSubject.przedmiot_id).\
                            join(TPlan, TPlan.plan_id == TSubject2Plan.plan_id).\
                            filter(plan.plan_id == TPlan.plan_id).\
                            all()
                    temp2['subjects'] = [{'uri': url_for('epsubject', id=s.przedmiot_id),
                                          'name': s.nazwa}
                                         for s in subjects]
                    temp['plans'].append(temp2)
                subjects_list.append(temp)
        finally:
            self.session.close()
        return super(EPSubjects, self).get({'subjects': subjects_list})


class EPSubject(EPBase):
    @auth.login_required
    def get(self, id):
        subject_id = id
        subject = None
        user = None
        try:
            current_date = datetime.datetime.now()
            edition = self.get_current_edition(subject_id)
            subject, user = self.session.query(TSubject, TUser).\
                filter(TSubject.przedmiot_id == subject_id).\
                filter(TSubject.odpowiedzialny_id == TUser.uzytkownik_id).\
                first()
        finally:
            self.session.close()
        return self.send_response(subject, user, edition)

    @auth.login_required
    def put(self, id):
        subject = id
        try:
            self.enroll_on_subject(subject)
        finally:
            self.session.close()
        return '', 201
    
    def enroll_on_subject(self, subject):
        edition = self.get_current_edition(subject)
        if edition != None:
            try:
                TSubjectEdition2Student.save(edition, g.user['id'])
            except Exception as e:
                app.logger.error('Cannot enroll user on subject edition %s: %s', edition, e)
                raise e
        
    def get_current_edition(self, subject):
        try:
            return TSubjectEdition.get_current_edition(subject)
        except AttributeError as e:
            app.logger.error('Cannot get id of current edition of subject %s: %s', subject, e)
        return -1 

    def send_response(self, subject, user, enroll):
        if subject and user:
            return super(EPSubject, self).get(
                {'nazwa': subject.nazwa,
                 'cel': subject.cel_przedmiotu,
                 'opis': subject.opis,
                 'bibliografia': subject.bibliografia,
                 'prowadzacy': '%s %s' % (user.imie_1, user.nazwisko),
                 'edycja': enroll,
                 'uri': url_for('epsubjects'.lower())})
        return {}
         

FROM python:3.7

RUN apt-get -qq update
RUN apt-get -qq -y install \
    python-mysqldb \
    default-libmysqlclient-dev

WORKDIR /home

COPY pyOKNO ./pyOKNO

WORKDIR /home/pyOKNO/service

RUN python -m pip install -r requirements.txt

WORKDIR /home/pyOKNO

RUN chmod 777 service_micro.py

CMD ["python", "service_micro.py"]

EXPOSE 7777

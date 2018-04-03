FROM python:latest

RUN apt-get -qq update
RUN apt-get -qq -y install \
    python-mysqldb \
    libmysqlclient-dev

WORKDIR /home

COPY pyOKNO ./pyOKNO

WORKDIR /home/pyOKNO/auth

RUN python -m pip install -r requirements.txt

WORKDIR /home/pyOKNO

RUN chmod 777 auth_micro.py

CMD ["python", "auth_micro.py"]

EXPOSE 6666

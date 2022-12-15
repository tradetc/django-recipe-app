FROM python:3.7-alpine
LABEL name="TradeTC"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app
#RUN cd /app && django-admin startproject app .

RUN adduser -D django
USER django
FROM python:3.7-alpine
LABEL name="TradeTC"

ENV PYTHONUNBUFFERED 1

RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp_build_deps \
        gcc libc-dev linux-headers postgresql-dev
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
RUN apk del .tmp_build_deps

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D django
USER django
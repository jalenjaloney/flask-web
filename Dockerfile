FROM ubuntu:22.04

MAINTAINER Jalen DeLoney "jcdu2023@mymail.pomona.edu"

RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

workdir /app

RUN python3 -m pip install -r requirements.txt

COPY . /app

ENTRYPOINT [ "python3" ]

CMD [ "app.py" ]

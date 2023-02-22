FROM python:3

RUN apt update \
    && apt upgrade \
    && python -m pip install --upgrade pip \
    && apt -y install postgresql-client \
    && useradd -ms /bin/sh etluser \
    && echo "dwh:5432:*:dwh:dwh" > /home/etluser/.pgpass \
    && chown etluser:etluser /home/etluser/.pgpass \
    && chmod 0600 /home/etluser/.pgpass

# Install dbt
# RUN pip install dbt


WORKDIR /app
COPY ./src /app

RUN chgrp -R etluser /app && chmod -R g+w /app

USER etluser

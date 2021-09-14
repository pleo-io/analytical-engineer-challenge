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

# Install Go
#RUN cd /tmp \
#    && wget -q https://golang.org/dl/go1.17.1.linux-amd64.tar.gz \
#    && rm -rf /usr/local/go \
#    && tar -C /usr/local -xzf go1.17.1.linux-amd64.tar.gz && rm /tmp/go1.17.1.linux-amd64.tar.gz \

# Install Kotlin
# RUN cd /tmp \
#     && wget -q https://github.com/JetBrains/kotlin/releases/download/v1.5.30/kotlin-compiler-1.5.30.zip \
#     && cd /usr/local/bin \
#     && unzip /tmp/kotlin-compiler-1.5.30.zip \
#     && rm /tmp/kotlin-compiler-1.5.30.zip \
#     && apt -y install openjdk-11-jre

WORKDIR /app
COPY ./src /app

RUN chgrp -R etluser /app && chmod -R g+w /app

USER etluser

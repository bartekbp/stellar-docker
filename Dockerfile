FROM python:2.7

WORKDIR /data

ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

# override certain libraries to stellar compatible version
RUN mkdir /dependencies
COPY requirements.txt /dependencies
RUN pip install -r /dependencies/requirements.txt

RUN pip install stellar
RUN mkdir /app
COPY bootstrap.sh /app/bootstrap.sh
ENTRYPOINT ["/tini", "--", "/app/bootstrap.sh"]

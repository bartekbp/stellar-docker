FROM python:2.7

WORKDIR /data

# override certain libraries to stellar compatible version
RUN mkdir /dependencies
COPY requirements.txt /dependencies
RUN pip install -r /dependencies/requirements.txt

RUN pip install stellar
RUN mkdir /app
COPY bootstrap.sh /app/bootstrap.sh
ENTRYPOINT ["/app/bootstrap.sh"]

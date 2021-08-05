FROM python:3.8.11-slim


COPY requirements.txt /
RUN pip install -r /requirements.txt

COPY . /celery_worker
#WORKDIR  /celery_worker

#ENTRYPOINT celery -A celery_worker worker --loglevel=info

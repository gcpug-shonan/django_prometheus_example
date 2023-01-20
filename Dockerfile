FROM python:3.11-slim

RUN python -m venv /env --upgrade-deps
ENV PATH /env/bin:$PATH

ADD requirements.txt /app/requirements.txt
RUN /env/bin/pip install -r /app/requirements.txt
ADD . /app

CMD gunicorn -b :$PORT django_prometheus_example.wsgi

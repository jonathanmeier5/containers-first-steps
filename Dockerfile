FROM python:3.7-slim

RUN pip install pipenv

ENV SRC_DIR /usr/local/src/containers-first-steps

WORKDIR ${SRC_DIR}

COPY Pipfile Pipfile.lock ${SRC_DIR}/

RUN pipenv install --system --clear

COPY ./ ${SRC_DIR}/

COPY files/ /
RUN chmod +x /usr/local/bin/*

WORKDIR ${SRC_DIR}/src

CMD ["run-gunicorn"]

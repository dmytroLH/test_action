FROM python:3.10.4-slim-buster
WORKDIR /home/testdir
COPY .  .
ENV PYTHONPATH=${PYTHONPATH}:${PWD}


RUN pip3 install poetry
RUN poetry config virtualenvs.create false
RUN poetry config virtualenvs.in-project true
RUN poetry install --only main --no-root

RUN groupadd user && useradd -g user user
RUN chown -R user:user /home/testdir
USER user
FROM python:3

ARG ENV_NAME

WORKDIR /code
COPY env/$ENV_NAME/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

CMD ["echo", "'Welcome to docker-env!'"]

FROM python:3

WORKDIR /code
COPY docker-env-python-requirements.txt ./
RUN pip install --no-cache-dir -r docker-env-python-requirements.txt

CMD ["echo", "'Welcome to docker-env!'"]

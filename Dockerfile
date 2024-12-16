# syntax=docker/dockerfile:1
# If docker container is not able to download package then check the DNS config for your docker server [daemon or desktop]
# go to Docker Desktop-->setting->Docker-Engine
# add dns value in daemon.json "dns": ["8.8.8.8"] and restart the application
FROM python:3.10-alpine
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run", "--debug"]
FROM python:3.8-slim-buster

RUN apt-get update -y \
 && apt-get install -y --no-install-recommends \
      build-essential \
      gcc \
      libzstd-dev \
      awscli \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt /app/

RUN python3 -m pip install --upgrade pip \
 && pip install -r requirements.txt

COPY . /app

CMD ["python3", "app.py"]

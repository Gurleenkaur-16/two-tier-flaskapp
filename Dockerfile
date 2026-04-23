FROM python:3.12-slim

WORKDIR ./app

RUN apt-get update && apt-get install -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install -r requirements.txt

RUN pip install mysqlclient

COPY . .

EXPOSE 5000

CMD ["python" ,"app.py"]


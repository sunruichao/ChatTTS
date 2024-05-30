FROM python:3.8-slim

RUN apt-get update && apt-get install -y gcc libgomp1 && apt-get clean

WORKDIR /app

COPY requirements.txt .

RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
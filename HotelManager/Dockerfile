FROM python:3.10
LABEL Version = "1.0.1"
ENV PYTHONUNBUFFERED 1
WORKDIR /app
COPY . .
RUN pip install -U pip
RUN pip install -r requirements.txt
EXPOSE 8000
CMD ["gunicorn", "HotelManager.wsgi", ":8000"]

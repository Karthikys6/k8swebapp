From python:2.7-alpine
WORKDIR /app
COPY /source /app
RUN pip install -r requirements.txt
EXPOSE 5000
ENTRYPOINT ["python", "App.py"]
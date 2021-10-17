# FROM python:3.8.2-slim-buster

# WORKDIR /finalproject1 

# COPY requirements.txt requirements.txt 
# RUN python3 -m pip install -r requirements.txt


# COPY . .
# EXPOSE 8000
# CMD ["python3","manage.py","runserver","0.0.0.0:8000"]


FROM scratch
ADD alpine-minirootfs-3.14.2-x86_64.tar.gz /
EXPOSE 8000
RUN apk add --update gcc python3 python3-dev py3-pip build-base
RUN python3 -m pip install --upgrade --no-cache-dir pip
# RUN python3 -m pip install --no-cache-dir Pillow
# COPY . /finalproject
WORKDIR /finalproject 
COPY requirements.txt requirements.txt
RUN python3 -m pip install --no-cache-dir -r requirements.txt
COPY . .
ENTRYPOINT ["python3","manage.py","runserver","0.0.0.0:8000"]


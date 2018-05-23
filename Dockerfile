FROM ruby:2.3

COPY requirements.txt ./
RUN apt-get update && apt-get install -y python3 python3-pip build-essential
RUN pip3 install -r requirements.txt
RUN gem install --no-ri --no-rdoc fpm

COPY openapi-linter.py .
COPY openapi.yaml .
COPY build-docs.sh .
COPY linode-docs.postinst .
COPY linode-logo.svg .
COPY linode-logo-white.svg .
COPY redoc.standalone.js .
COPY favicon.ico .
COPY changelog/ .

CMD ["python", "openapi-linter.py", "openapi.yaml"]
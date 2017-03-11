## BUILDING
##   (from project root directory)
##   $ docker build -t python-for-edisonliang-docker-flask .
##
## RUNNING
##   $ docker run python-for-edisonliang-docker-flask

FROM gcr.io/stacksmith-images/minideb-buildpack:jessie-r11

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="827ilb7" \
    STACKSMITH_STACK_NAME="Python for EdisonLiang/docker-flask" \
    STACKSMITH_STACK_PRIVATE="1"

# Install required system packages
RUN install_packages libc6 libssl1.0.0 libncurses5 libtinfo5 zlib1g libsqlite3-0 libreadline6

RUN bitnami-pkg install python-2.7.13-0 --checksum 7f5aac196054c7eb04c981243b4ddf37020cc3eb8a7cdc69d72da57212b21573

ENV PATH=/opt/bitnami/python/bin:$PATH

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# Python base template
COPY . /app
WORKDIR /app

RUN pip install -r requirements.txt

CMD ["python"]

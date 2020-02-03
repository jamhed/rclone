FROM alpine:3.11.3
RUN apk --no-cache add ca-certificates openssl curl bash unzip
RUN curl -s https://rclone.org/install.sh | /bin/bash

RUN addgroup -S app && \
	adduser -S app -G app -h /home/app -D && \
	chown app:app /home/app

ENV RCLONE_CONFIG_S3_TYPE=s3
ENV RCLONE_S3_PROVIDER=AWS
ENV RCLONE_S3_REGION=us-east-1
ENV RCLONE_S3_ENDPOINT=""
ENV RCLONE_CONFIG_S3_ACCESS_KEY_ID=""
ENV RCLONE_CONFIG_S3_SECRET_ACCESS_KEY=""
ENV LOCATION=""
ENV DOWNLOAD=""

VOLUME /mnt/private

WORKDIR /home/app
USER app

COPY entry.sh entry.sh

ENTRYPOINT ["./entry.sh"]

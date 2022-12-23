## Uses a base image with maven plugins pre-downloaded for performance reasons
FROM ghcr.io/nvoxland/jar-download-action:v1

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
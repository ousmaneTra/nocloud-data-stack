ARG BASE_IMAGE=quay.io/jupyter/scipy-notebook
ARG TAG=latest
FROM ${BASE_IMAGE}:${TAG}

ENV LANG=C.UTF-8

USER root

# Install Python Packages & Requirements (Done near end to avoid invalidating cache)
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt \
    && rm -rf /tmp/requirements.txt

# Switch back to jovyan to avoid accidental container runs as root
USER ${NB_UID}
ARG TAG=latest
FROM apachesuperset.docker.scarf.sh/apache/superset:${TAG}

USER root
ADD requirements.txt /superset-requirements.txt
RUN pip install -r /superset-requirements.txt --no-cache-dir \
    && rm -rf /superset-requirements.txt

USER superset
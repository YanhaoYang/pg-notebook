# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

FROM jupyter/base-notebook

MAINTAINER Jupyter Project <jupyter@googlegroups.com>

USER root

# Install all OS dependencies for fully functional notebook server
RUN apt-get update && apt-get install -yq --no-install-recommends \
    build-essential \
    python-dev \
    postgresql \
    libpq-dev \
    postgresql-client \
    postgresql-client-common \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install psycopg2
RUN pip install ipython-sql

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_USER

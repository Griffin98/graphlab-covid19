# Original Copyright
# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

ARG BASE_CONTAINER=jupyter/scipy-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Dhyey Patel, Negin Mohammad Zadeh"

# Install turicreate aka Graphlab
RUN pip install --quiet --no-cache-dir --ignore-installed \
    'turicreate' \
    'numpy==1.18.5' \
    'requests' \
    'pandas' \
    && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

RUN conda install --quiet --yes \
    'matplotlib' \
    'plotly' \
    'seaborn' \
    && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

RUN pip uninstall -y attr

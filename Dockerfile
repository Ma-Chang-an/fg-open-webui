FROM ghcr.io/open-webui/open-webui:ollama

ENV HF_ENDPOINT=https://hf-mirror.com
ENV OLLAMA_MODELS=/mnt/data/models
ENV PORT=8000
ENV DATA_DIR=/mnt/data/data
ENV HF_HOME=/app/backend/data/cache/embedding/models
ENV SENTENCE_TRANSFORMERS_HOME=/app/backend/data/cache/embedding/models
ENV HOME=/home/paas
ENV GROUP_ID=1003
ENV USER_ID=1003
ENV GROUP_NAME=paas
ENV USER_NAME=paas

RUN groupadd -g ${GROUP_ID} ${GROUP_NAME} && \
    useradd -m -u ${USER_ID} -g ${GROUP_ID} ${USER_NAME}

RUN chown -R ${USER_ID}:${GROUP_ID} /app

WORKDIR /

COPY --chown=${USER_ID}:${GROUP_ID} --chmod=a+x ./entrypoint.sh /entrypoint.sh

EXPOSE 8000

CMD [ "bash", "/entrypoint.sh"]
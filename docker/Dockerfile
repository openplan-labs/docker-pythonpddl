FROM python:3.12-slim

LABEL maintainer="Erwin Lejeune <erwin.lejeune15@gmail.com>"
LABEL org.opencontainers.image.source="https://github.com/openplan-labs/docker-pythonpddl"
LABEL org.opencontainers.image.description="PythonPDDL (jupyddl) in a container — parse, ground and solve PDDL instances"
LABEL org.opencontainers.image.licenses="Apache-2.0"

COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt && rm /tmp/requirements.txt

WORKDIR /workspace

COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["tail", "-f", "/dev/null"]

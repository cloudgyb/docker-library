################################################################################
# This Dockerfile was generated from the template at distribution/src/docker/Dockerfile
#
# Beginning of multi stage Dockerfile
################################################################################

################################################################################
# Build stage 0 `builder`:
# Extract Elasticsearch artifact
################################################################################

FROM centos:8 AS builder

ENV ES_VERSION 7.10.1
# `tini` is a tiny but valid init for containers. This is used to cleanly
# control how ES and any child processes are shut down.
COPY tini/* /tini/
RUN set -eux ; \
    tini_bin="" ; \
    case "$(arch)" in \
        aarch64) tini_bin='tini-arm64' ;; \
        x86_64)  tini_bin='tini-amd64' ;; \
        *) echo >&2 ; echo >&2 "Unsupported architecture $(arch)" ; echo >&2 ; exit 1 ;; \
    esac ; \
    mv /tini/${tini_bin} /bin/tini ; \
    chmod +x /bin/tini

RUN mkdir /usr/share/elasticsearch
WORKDIR /usr/share/elasticsearch

COPY package/elasticsearch-${ES_VERSION}-linux-*.tar.gz /opt/
RUN tar -zxf /opt/elasticsearch-${ES_VERSION}-linux-"$(arch)".tar.gz --strip-components=1 && \
    rm -rf /opt/*.tar.gz

# The distribution includes a `config` directory, no need to create it
COPY config/elasticsearch.yml config/
COPY config/log4j2.properties config/log4j2.docker.properties

# 1. Configure the distribution for Docker
# 2. Ensure directories are created. Most already are, but make sure
# 3. Apply correct permissions
# 4. Move the distribution's default logging config aside
# 5. Move the generated docker logging config so that it is the default
# 6. Apply more correct permissions
# 7. The JDK's directories' permissions don't allow `java` to be executed under a different
#    group to the default. Fix this.
# 8. Ensure that there are no files with setuid or setgid, in order to mitigate "stackclash" attacks.
# 9. Ensure all files are world-readable by default. It should be possible to
#    examine the contents of the image under any UID:GID
RUN sed -i -e 's/ES_DISTRIBUTION_TYPE=tar/ES_DISTRIBUTION_TYPE=docker/' bin/elasticsearch-env && \
    mkdir -p config/jvm.options.d data logs plugins && \
    chmod 0775 config config/jvm.options.d data logs plugins && \
    mv config/log4j2.properties config/log4j2.file.properties && \
    mv config/log4j2.docker.properties config/log4j2.properties && \
    chmod 0660 config/elasticsearch.yml config/log4j2*.properties && \
    find ./jdk -type d -exec chmod 0755 {} + && \
    find . -xdev -perm -4000 -exec chmod ug-s {} + && \
    find . -type f -exec chmod o+r {} +

################################################################################
# Build stage 1 (the actual Elasticsearch image):
#
# Copy elasticsearch from stage 0
# Add entrypoint
################################################################################

FROM centos:8

RUN for iter in {1..10}; do \
      yum update --setopt=tsflags=nodocs -y && \
      yum install --setopt=tsflags=nodocs -y \
      nc shadow-utils zip unzip  && \
      yum clean all && \
      exit_code=0 && break || \
        exit_code=$? && echo "yum error: retry $iter in 10s" && sleep 10; \
    done; \
    exit $exit_code

RUN groupadd -g 1000 elasticsearch && \
    adduser -u 1000 -g 1000 -G 0 -d /usr/share/elasticsearch elasticsearch && \
    chmod 0775 /usr/share/elasticsearch && \
    chown -R 1000:0 /usr/share/elasticsearch

ENV ELASTIC_CONTAINER true

WORKDIR /usr/share/elasticsearch
COPY --from=builder --chown=1000:0 /usr/share/elasticsearch /usr/share/elasticsearch
COPY --from=builder --chown=0:0 /bin/tini /bin/tini

ENV PATH /usr/share/elasticsearch/bin:$PATH

COPY bin/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

# Copy init script file to /init.script.d/
COPY init.script.d/* /init.script.d/

# 1. Sync the user and group permissions of /etc/passwd
# 2. Set correct permissions of the entrypoint
# 3. Ensure that there are no files with setuid or setgid, in order to mitigate "stackclash" attacks.
#    We've already run this in previous layers so it ought to be a no-op.
# 4. Replace OpenJDK's built-in CA certificate keystore with the one from the OS
#    vendor. The latter is superior in several ways.
#    REF: https://github.com/elastic/elasticsearch-docker/issues/171
RUN chmod g=u /etc/passwd && \
    chmod 0775 /usr/local/bin/docker-entrypoint.sh && \
    find / -xdev -perm -4000 -exec chmod ug-s {} + && \
    ln -sf /etc/pki/ca-trust/extracted/java/cacerts /usr/share/elasticsearch/jdk/lib/security/cacerts

EXPOSE 9200 9300

LABEL org.label-schema.build-date="2021-07-14T18:33:36.673943207Z" \
  org.label-schema.license="Elastic-License-2.0" \
  org.label-schema.name="Elasticsearch" \
  org.label-schema.schema-version="1.0" \
  org.label-schema.url="https://www.elastic.co/products/elasticsearch" \
  org.label-schema.usage="https://www.elastic.co/guide/en/elasticsearch/reference/index.html" \
  org.label-schema.vcs-ref="c5f60e894ca0c61cdbae4f5a686d9f08bcefc942" \
  org.label-schema.vcs-url="https://github.com/elastic/elasticsearch" \
  org.label-schema.vendor="Elastic" \
  org.label-schema.version="7.10.1" \
  org.opencontainers.image.created="2021-07-14T18:33:36.673943207Z" \
  org.opencontainers.image.documentation="https://www.elastic.co/guide/en/elasticsearch/reference/index.html" \
  org.opencontainers.image.licenses="Elastic-License-2.0" \
  org.opencontainers.image.revision="c5f60e894ca0c61cdbae4f5a686d9f08bcefc942" \
  org.opencontainers.image.source="https://github.com/elastic/elasticsearch" \
  org.opencontainers.image.title="Elasticsearch" \
  org.opencontainers.image.url="https://www.elastic.co/products/elasticsearch" \
  org.opencontainers.image.vendor="Elastic" \
  org.opencontainers.image.version="7.10.1"

ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/docker-entrypoint.sh"]
# Dummy overridable parameter parsed by entrypoint
CMD ["eswrapper"]

################################################################################
# End of multi-stage Dockerfile
################################################################################
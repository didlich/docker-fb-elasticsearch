
# use base image
FROM alpine-elasticsearch

# Set environment variables
ENV PKG_NAME elasticsearch
# as used in alpine-elasticsearch
ENV ELASTICSEARCH_VERSION 1.7.1

ENV ELASTICSEARCH_BIN_DIR /usr/share/elasticsearch/bin
ENV ELASTICSEARCH_DATA_DIR /usr/share/elasticsearch/data

ENV ES_PLUGIN_ANALYSIS_COMBO_VER 1.5.1
ENV ES_PLUGIN_MAPPER_ATTACHMENTS_VER 2.7.0

# Install plugins
RUN $ELASTICSEARCH_BIN_DIR/plugin -install com.yakaz.elasticsearch.plugins/elasticsearch-analysis-combo/$ES_PLUGIN_ANALYSIS_COMBO_VER
RUN $ELASTICSEARCH_BIN_DIR/plugin -install elasticsearch/elasticsearch-mapper-attachments/$ES_PLUGIN_MAPPER_ATTACHMENTS_VER


# Add files
COPY config ./config
COPY docker-entrypoint.sh /

# Specify Volume
VOLUME ["/usr/share/elasticsearch/data"]


# Exposes
EXPOSE 9200
EXPOSE 9300

USER nobody

# CMD
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["elasticsearch"]
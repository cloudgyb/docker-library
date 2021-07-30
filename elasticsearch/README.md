# 自定义Elasticsearch镜像

仅仅是在[Elasticsearch官方docker镜像构建](https://github.com/elastic/dockerfiles/tree/7.13/elasticsearch) 的基础之上增加一些额外的功能，
例如：支持挂载初始化脚本目录，当es容器启动时自动创建一些索引模板等。
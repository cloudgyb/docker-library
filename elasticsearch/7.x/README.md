# 根据需要自定义elasticsearch镜像

基于elasticsearch版本：7.x

## 特性
- 支持挂载初始化脚本
- 支持elasticsearch数据初始化
- 构建时将默认初始化脚本打进镜像内，如果启动容器时没有挂载初始化脚本目录则自动执行默认初始化脚本

## 构建上下文目录
构建的依赖均已下载到该目录下：
- bin: docker容器的启动脚本docker-entrypoint.sh
- config: es的配置文件
- init.script.d: 镜像构建时的要拷贝的数据初始化脚本（这些脚本在容器启动时被自动执行）
- package: es离线安装包（构建前需要先下载elasticsearch-7.10.1-linux-x86_64.tar.gz,见文档[package/README.md](package/README.md)）
- tini: tini工具包


## 初始化脚本
容器的`/init.script.d/`目录作为es的初始化脚本（一般是可执行的shell脚本）存放目录，当容器启动时会自动执行该目录下的脚本。<br>
镜像在构建时中会将构建上下文中的`init.script.d`目录的文件拷贝至`/init.script.d/`中。

如果你在启动容器时，挂载了本地目录到`/init.script.d/`将覆盖掉镜像中已有的脚本文件，也就是说镜像中原有的初始化脚本就会失效！<br>
例如：
```shell
docker run --name es -v /home/gyb/es-init/:/init.script.d/ es:7.10.1
```
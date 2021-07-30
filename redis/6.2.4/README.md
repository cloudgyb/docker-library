# 根据需要自定义Redis镜像

基于redis版本：6.2.4

## 特性
   - 支持挂载初始化脚本
   - 支持redis数据初始化

## 构建上下文目录
redis构建的依赖均已下载到该目录下：
   - gosu: gosu离线安装包
   - redis: redis离线安装包
   - init.script.d: 镜像构建时的要拷贝的数据初始化脚本（这些脚本在容器启动时被自动执行）


## 初始化脚本
容器的`/init.script.d/`目录作为redis的初始化脚本（一般是可执行的shell脚本）存放目录，当容器启动时会自动执行该目录下的脚本。<br>
镜像在构建时中会将构建上下文中的`init.script.d`目录的文件拷贝至`/init.script.d/`中。

如果你在启动容器时，挂载了本地目录到`/init.script.d/`将覆盖掉镜像中已有的脚本文件，也就是说镜像中原有的初始化脚本就会失效！<br>
例如：
```shell
docker run --name redis -v /home/gyb/test/:/init.script.d/ redis:6.2.4
```

## redis持久化文件
redis数据库文件dump.rdb(默认文件名)默认存放在`/data`目录。<br>
当然你也可以将/data目录挂载到本地目录：
```shell
docker run --name redis -v /home/gyb/test/:/data/ redis:6.2.4
```

## 自定义redis配置
在容器中默认没有`redis.conf`等配置文件，如果你要自定义redis配置，需要在容器启动时将redis配置文件挂载到容器中，
假设你的配置文件为`/home/gyb/redis/conf/redis.conf`挂载到`/etc/redis/conf`下，然后通过下面的命令使其生效：

```shell
docker run --name redis -v /home/gyb/redis/conf:/etc/redis/conf redis:6.2.4 /etc/redis/conf/redis.conf
```

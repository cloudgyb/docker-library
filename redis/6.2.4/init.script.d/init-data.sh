redis-cli set config.logger.level "debug"
redis-cli set config.rabbitmq "{\"hostname\": \"10.156.10.6\",\"port\": 5672,\"username\": \"admin\",\"password\": \"db_Fans@2020\"}"
redis-cli set config.es "{\"node\": \"http://10.156.10.2:9200\"}"
redis-cli set config.mysql "{\"host\": \"10.156.10.4\",\"user\": \"root\",\"password\": \"db_Fans@2020\",\"port\": 3306,\"database\": \"smp\",\"connectionLimit\": 10}"
redis-cli save

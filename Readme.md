### Docker version github.com/mattes/migrate v2 for mysql

```php
docker run --rm \
	-v `pwd`:/migrations
	-e BD_HOST=db \
	-e DB_PORT=3306 \
	-e TIMEOUT=30 \
	sokyrko/migrate  -database "mysql://root:root@tcp(host:port)/db" -path migrations/ up```

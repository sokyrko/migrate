### Docker version github.com/mattes/migrate v2 for mysql

```bash
docker run --rm \
	-v `pwd`/migrations:/migrations \
	-e BD_HOST=db \
	-e DB_PORT=3306 \
	-e DB_USER=root \
	-e DB_PASS=root \
	-e TIMEOUT=30 \
	sokyrko/migrate  -database "mysql://root:root@tcp(db:3306)/db" -path migrations/ up
```

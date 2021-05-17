docker build --no-cache -f SQL\Dockerfile.PostgreSql -t lb4/postgre-sql ../SQL

docker build --no-cache -f Dockerfile -t lb4/app ../..

FROM postgres:16.4
COPY *.sql /docker-entrypoint-initdb.d/
# Day 1 - PostgreSQL local lab

## Setup
- Ran PostgreSQL 16 in Docker
- Container name: pg-lab
- Port: 5432
- Database created: labdb

## Commands used
```bash
docker run --name pg-lab -e cd ~/projects/active/cloud-dba-postgres-labs/week-01/data
curl -L -o dvdrental.tar.gz https://github.com/devrimgunduz/pagila/releases/download/v3.3/dvdrental.tar.gz
tar -xzf dvdrental.tar.gzPOSTGRES_PASSWORD set via environment variable -p 5432:5432 -d postgres:16
docker ps
psql -h localhost -U postgres

SELECT version();
CREATE DATABASE labdb;
\c labdb
\l
Commit and push:

```bash
git add .
git commit -m "day 1 - run postgres locally with docker"
git push


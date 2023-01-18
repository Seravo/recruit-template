APT_PROXY ?=
SUDO ?=

all:

purge:
	$(SUDO) docker-compose down -v --remove-orphans

stop:
	$(SUDO) docker-compose down

build:
	$(SUDO) docker-compose build

run: build
	$(SUDO) docker-compose up -d

develop: run
	$(SUDO) docker-compose logs --follow

test:
	@$(SUDO) docker-compose exec api pytest tests -vv

reload:
	@$(SUDO) docker-compose exec api reload-gunicorn

exec:
	@$(SUDO) docker-compose exec api bash
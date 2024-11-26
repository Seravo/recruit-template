APT_PROXY ?=
SUDO ?=
PYTHON3 ?= python3.10

all:

purge:
	$(SUDO) docker compose down -v --remove-orphans

stop:
	$(SUDO) docker compose down

build:
	$(SUDO) docker compose build

run: build
	$(SUDO) docker compose up -d

develop: run
	$(SUDO) docker compose logs --follow

reload:
	@$(SUDO) docker compose exec api reload-gunicorn

exec:
	@$(SUDO) docker compose exec api bash

ve:
	${PYTHON3} -m venv ve
	ve/bin/pip install -r requirements.txt

unittest: ve
	ve/bin/pytest -v tests

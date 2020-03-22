PYEXEC ?= python3.8

setup := $(PYEXEC) setup.pytest
package := catan
packagedir := src/$(subst .,/,$(package))
testsdir := tests

.PHONY: check
check:
	$(PYEXEC) -m pytest --cov=catan -vvv $(PYTEST_ARGS) $(tests_dir)

.PHONY: lint
lint:
	$(PYEXEC) -m black noxfile.py setup.py src tests

.PHONY: lint-check
lint-check:
	$(PYEXEC) -m black --check --verbose noxfile.py setup.py src tests
	$(PYEXEC) -m pylint $(packagedir) --rcfile=.pylintrc
	$(PYEXEC) -m flake8 $(packagedir) --config=.flake8

.PHONY: ci
ci:
	$(PYEXEC) -m pip install nox
	$(PYEXEC) -m nox

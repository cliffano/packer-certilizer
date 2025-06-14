version ?= 1.0.1-pre.0

ci: clean deps lint build-docker test-docker

define python_venv
	. .venv/bin/activate && $(1)
endef

clean:
	rm -rf logs/

stage:
	mkdir -p logs/

deps:
	python3 -m venv .venv
	$(call python_venv,python3 -m pip install -r requirements.txt)
	packer plugins install github.com/hashicorp/docker 1.1.1
	packer plugins install github.com/hashicorp/ansible 1.1.3

deps-upgrade:
	python3 -m venv .venv
	$(call python_venv,python3 -m pip install -r requirements-dev.txt)
	$(call python_venv,pip-compile --upgrade)

lint:
	packer validate -syntax-only templates/packer/docker.pkr.hcl
	$(call python_venv,ansible-lint provisioners/ansible/*.yaml)
	$(call python_venv,yamllint conf/ansible/*.yaml provisioners/ansible/*.yaml)
	find conf/ -type f -name "*.json" | while IFS= read -r file; do echo "> $$file"; python3 -m json.tool "$$file"; done
	# shellcheck provisioners/shell/*.sh

build-docker: stage
	PACKER_LOG_PATH=logs/packer-$@.log \
		PACKER_LOG=1 \
		PACKER_TMP_DIR=/tmp \
		packer build \
		-var-file=conf/packer/docker.json \
		-var 'version=$(version)' \
		templates/packer/docker.pkr.hcl

test-docker:
	$(call python_venv,py.test -v test/testinfra/docker.py)

publish-docker:
	docker image push cliffano/certilizer:latest
	docker image push cliffano/certilizer:$(version)

release-major:
	rtk release --release-increment-type major

release-minor:
	rtk release --release-increment-type minor

release-patch:
	rtk release --release-increment-type patch

.PHONY: ci clean stage deps lint build-docker test-docker publish-docker release-major release-minor release-patch

.PHONY: set-dev-env
set-dev-env: export ENV = dev
set-dev-env:
	@sh scripts/set_env.sh

.PHONY: set-prod-env
set-prod-env: export ENV = prod
set-prod-env:
	@sh scripts/set_env.sh

.PHONY: unit-test
unit-test:
	flutter test

.PHONY: integration-test
integration-test:
	flutter drive --target=test_driver/app.dart
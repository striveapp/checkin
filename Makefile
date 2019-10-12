.PHONY: set-dev-env
set-dev-env: export ENV = dev
set-dev-env:
	@sh scripts/set_env.sh
	@flutter clean

.PHONY: set-prod-env
set-prod-env: export ENV = prod
set-prod-env:
	@sh scripts/set_env.sh
	@flutter clean

.PHONY: unit-test
unit-test:
	flutter test

.PHONY: integration-test
integration-test:
	flutter drive --keep-app-running --target=test_driver/app.dart
#	flutter drive --keep-app-running --no-build --target=test_driver/app.dart

#.PHONY: integration-test-ci
#integration-test:
#	flutter drive --target=test_driver/app.dart
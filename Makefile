PID_FILE ?= /tmp/flutter-hot-reload.pid
VM_PORT ?= 8888
envars = VM_SERVICE_URL=http://127.0.0.1:$(VM_PORT)

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

.PHONY: run-fast
run-fast:
	$(info *** STARTING APP ***)
	flutter run -d $$(flutter devices | tail -1 | awk -F '•' '{print $$2}' | xargs) --target=test_driver/journeys/journeys.dart --host-vmservice-port $(VM_PORT) \
	 --disable-service-auth-codes --use-application-binary=test_driver/build/run-fast-app-debug.apk --pid-file $(PID_FILE)

.PHONY: integration-test
integration-test:
	$(info ---------------------)
	$(info INTEGRATION TESTS)
	$(info ---------------------)
	@kill -USR2 $$(cat $(PID_FILE))
	@sleep 2
	$(envars) dart test_driver/journeys/journeys_test.dart

.PHONY: codegen-runner
codegen-runner:
	flutter pub run build_runner watch --delete-conflicting-outputs
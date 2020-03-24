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
	flutter run -d emulator-5554 --fast-start --target=test_driver/journeys/attend.dart --host-vmservice-port $(VM_PORT) --disable-service-auth-codes

.PHONY: integration-test
integration-test: run-fast
	gcloud --project=checkin-test-fba3d firestore import gs://checkin-test-fba3d-firestore-backups/seed --async
	$(envars) dart test_driver/journeys/attend_test.dart

.PHONY: codegen-runner
codegen-runner:
	flutter pub run build_runner watch --delete-conflicting-outputs
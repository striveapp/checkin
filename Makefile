PID_FILE ?= /tmp/flutter-hot-reload.pid
VM_PORT ?= 8888
envars = VM_SERVICE_URL=http://127.0.0.1:$(VM_PORT)
APK ?= ./build/app/outputs/bundle/prodRelease/app-prod-release-universal.apk

.PHONY: set-dev
set-dev: export FLAVOR = dev
set-dev:
	@sh scripts/set_env.sh
	@flutter clean

.PHONY: set-prod
set-prod: export FLAVOR = prod
set-prod:
	@sh scripts/set_env.sh
	@flutter clean

.PHONY: set-key-properties
set-key-properties:
	@sh scripts/set_key_properties.sh

.PHONY: unit-test
unit-test:
	flutter test

.PHONY: smoke-test-android
smoke-test-android:
	sh scripts/smoke_test.sh --apk $(APK)

.PHONY: run-fast
run-fast:
	$(info *** STARTING APP ***)
	flutter run -d $$(flutter devices | grep android | awk -F '•' '{print $$2}' | xargs) --target=test_driver/journeys/journeys.dart --host-vmservice-port $(VM_PORT) \
	 --disable-service-auth-codes --use-application-binary=test_driver/build/run-fast-app-debug.apk --pid-file $(PID_FILE)

.PHONY: integration-test
integration-test:
	$(info ---------------------)
	$(info INTEGRATION TESTS)
	$(info ---------------------)
	@kill -USR2 $$(cat $(PID_FILE))
	@sleep 2
	$(envars) dart test_driver/journeys/journeys_test.dart

.PHONY: driver-test
driver-test:
	flutter drive --flavor=dev --target=test_driver/journeys/journeys.dart

.PHONY: new-integration-test
new-integration-test:
	flutter drive --flavor=dev --driver=test_driver/journeys-v2/init.dart --target=test_driver/journeys-v2/app_test.dart

.PHONY: codegen-runner
codegen-runner:
	flutter pub run build_runner watch --delete-conflicting-outputs

.PHONY: create-app-icons
create-app-icons:
	@flutter pub get
	dart run flutter_launcher_icons:main

.PHONY: generate-splash-screen
generate-splash-screen:
	@flutter pub get
	flutter clean
	dart run flutter_native_splash:create

.PHONY: start-debug-view
start-debug-view:
	$(info ---------------------)
	$(info Starting the debug view)
	$(info ---------------------)
	@adb shell setprop debug.firebase.analytics.app com.arya.checkin
	@echo "DebugView open in: https://console.firebase.google.com/u/1/project/checkin-test-fba3d/analytics/app/android:com.arya.checkin/debugview"
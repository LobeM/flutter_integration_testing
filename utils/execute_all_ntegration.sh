#!/bin/bash
set -o pipefail

# flutter drive only supports one device at a time, so run one
# instance per device in parallel and prefix their output.
DEVICES=("iPhone" "emulator-5554")

run_tests() {
    flutter drive \
        --driver=test_driver/integration_test_driver.dart \
        --target=integration_test/app_test.dart \
        -d "$1" 2>&1 | sed "s/^/[$1] /"
}

pids=()
for device in "${DEVICES[@]}"; do
    run_tests "$device" &
    pids+=($!)
done

exit_code=0
for pid in "${pids[@]}"; do
    wait "$pid" || exit_code=1
done

exit $exit_code

# flutter drive \
#     --driver=test_driver/integration_test_driver.dart \
#     --target=integration_test/app_test.dart \
#     -d iPhone
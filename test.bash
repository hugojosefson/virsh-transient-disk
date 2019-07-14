#!/usr/bin/env bash

TRUE=0
FALSE=1

function test_that_uuid_changed() {
  local input_uuid="$(cat test/dev-dispvm.xml | grep uuid)"
  local output_uuid="$(cat test/dev-dispvm.xml | ./transient-disk.js --name new-transient | grep uuid)"
  if [[ "${input_uuid}" == "${output_uuid}" ]]; then
    fail "The UUID did not change!"
  fi
}

function test_that_only_uuid_is_different_from_a_previous_run() {
  cat test/dev-dispvm.xml \
    | ./transient-disk.js --name new-transient \
    | grep -v uuid \
    | diff -u test/expected-without-uuid.xml -
  if [[ $? -ne 0 ]]; then
    fail "\nSomething other than UUID is wrong!"
  fi
}

function fail() {
  local message="${1}"
  echo -e "${message}\nTEST FAILED.\n" >&2
  exit 1
}

echo
echo Output UUID should differ every time, and the rest should be as the output of a previous run.
echo

test_that_uuid_changed
test_that_only_uuid_is_different_from_a_previous_run

echo 'TESTS PASSED.'
echo

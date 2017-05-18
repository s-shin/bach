#!/bin/bash
set -eu
eval "$(bach)"

. "$(bach.find_module config)"

eval "$(bach.load_config test/fixtures/sample.yml)"
echo "$(config.foo.bar)"

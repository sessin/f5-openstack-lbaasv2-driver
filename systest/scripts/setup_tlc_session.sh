#!/usr/bin/env bash

# Copyright 2017 F5 Networks Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -ex

# Run the setup & commands for the session
/tools/bin/tlc --session ${TEST_SESSION} --config ${TLC_FILE} --debug setup
/tools/bin/tlc --session ${TEST_SESSION} --debug cmd ready
/tools/bin/tlc --session ${TEST_SESSION} --debug cmd test_env
/tools/bin/tlc --session ${TEST_SESSION} --debug cmd lbaasv2

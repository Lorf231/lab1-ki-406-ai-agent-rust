#!/usr/bin/env bash
set -euo pipefail

cargo build --release
cargo test

[[ -x target/release/hello ]]

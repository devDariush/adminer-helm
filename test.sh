#!/usr/bin/env bash

set -euo pipefail

ROOT=$(pwd)

echo "running adminer-chart tests..."
cd $ROOT/charts/
helm unittest -f 'adminer-chart/tests/*_test.yaml' .

echo "running postgres-chart tests..."
cd $ROOT/charts/
helm unittest -f 'postgres-chart/tests/*_test.yaml' .

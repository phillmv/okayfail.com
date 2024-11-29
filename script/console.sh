#!/bin/bash

set -e


mkdir -p /tmp/okfail-data
DATA_FOLDER=/tmp/okfail-data ARQUIVO_PORT=13458 ~/code/arquivo/bin/start-mawl console `realpath ~/code/okayfail.com/source/` `realpath ~/code/okayfail.com/output/`

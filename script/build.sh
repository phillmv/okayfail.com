#!/bin/bash

set -e


mkdir -p /tmp/okfail-data
rm -rf /tmp/okfail-data/*
rm -rf ~/code/okayfail.com/output/*
DATA_FOLDER=/tmp/okfail-data ARQUIVO_PORT=13457 ~/code/arquivo/bin/start-mawl build `realpath ~/code/okayfail.com/source/` `realpath ~/code/okayfail.com/output/`

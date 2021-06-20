#!/bin/sh -l

pip install -r requirements-crawl.txt
pip install .

python -m conrad run crawler $1

FILENAME="data/`echo $1 | awk '{print tolower($0)}' | sed -e 's/crawler//g'`.json"
python -m conrad import -f $FILENAME

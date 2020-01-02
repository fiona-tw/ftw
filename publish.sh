#!/bin/bash

# builds `dist/` according to `setup.py`
python3 setup.py sdist bdist_wheel

# publishes to pypi the version defined in `setup.py`
# Note: Will error if this version already exists!
python3 -m twine upload dist/* || echo "

################################ PUBLISH FAILED ###############################

"; exit 1

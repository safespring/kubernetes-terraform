#/bin/bash

set -e

cd

if [[ -e $HOME/.bootstrapped ]]; then
  exit 0
fi

PYPY_VERSION=6.0.0

if [[ -e $HOME/pypy-$PYPY_VERSION-linux_x86_64-portable.tar.bz2 ]]; then
  tar -xjf $HOME/pypy-$PYPY_VERSION-linux_x86_64-portable.tar.bz2
  rm -rf $HOME/pypy-$PYPY_VERSION-linux_x86_64-portable.tar.bz2
else
  wget -O - https://bitbucket.org/squeaky/portable-pypy/downloads/pypy-$PYPY_VERSION-linux_x86_64-portable.tar.bz2 |tar -xjf -
fi

mv -n pypy-$PYPY_VERSION-linux_x86_64-portable pypy

mkdir -p $HOME/bin

cat > $HOME/bin/python <<EOF
#!/bin/bash
LD_LIBRARY_PATH=$HOME/pypy/lib:$LD_LIBRARY_PATH exec $HOME/pypy/bin/pypy "\$@"
EOF

chmod +x $HOME/bin/python
$HOME/bin/python --version

touch $HOME/.bootstrapped
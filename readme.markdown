# Nim C Sources

This repo contains the C sources required to bootstrap the [Nim](https://github.com/nim-lang/Nim/)
compiler. Building these will **not** result in the latest compiler
being built, these C sources should be used in conjuction with ``koch``.

```bash
$ git clone git://github.com/nim-lang/Nim.git
$ cd Nim
$ git clone --depth 1 git://github.com/nim-lang/csources
$ cd csources && sh build.sh # or .bat for Windows
$ cd ..
$ bin/nim c koch
$ ./koch boot -d:release
```

This repository is archived because it's frozen, HEAD of csources can build Nim version 1 and any later version.

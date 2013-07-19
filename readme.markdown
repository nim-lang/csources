# Nimrod C Sources

This repo contains the C sources required to bootstrap the [Nimrod](https://githbub.com/Araq/nimrod/)
compiler. Building these will **not** result in the latest compiler
being built, these C sources should be used in conjuction with ``koch``.

```bash
$ git clone https://github.com/Araq/Nimrod
$ cd Nimrod
$ git clone https://github.com/nimrod-code/csources
$ cd csources && sh build.sh # or .bat for Windows
$ cd ..
$ bin/nimrod c koch
$ ./koch boot -d:release
```

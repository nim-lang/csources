#! /bin/sh
# Generated from niminst
# Template is in tools/buildsh.tmpl
# To regenerate run ``niminst csource`` or ``koch csource``

set -e

while :
do
  case "$1" in
    --extraBuildArgs)
      extraBuildArgs=" $2"
      shift 2
      ;;
    --) # End of all options
      shift
      break;
      ;;
    -*)
      echo "Error: Unknown option: $1" >&2
      exit 1
      ;;
    *)  # No more options
      break
      ;;
  esac
done

CC="gcc"
LINKER="gcc"
COMP_FLAGS="-w$extraBuildArgs"
LINK_FLAGS=""
# platform detection
ucpu=`uname -m`
uos=`uname`
# bin dir detection
binDir=bin

if [ -s ../koch.nim ]; then
  binDir="../bin"
fi

if [ ! -d $binDir ]; then
  mkdir $binDir
fi

# convert to lower case:
ucpu=`echo $ucpu | tr "[:upper:]" "[:lower:]"`
uos=`echo $uos | tr "[:upper:]" "[:lower:]"`

case $uos in
  *linux* ) 
    myos="linux" 
    LINK_FLAGS="$LINK_FLAGS -ldl -lm"
    ;;
  *freebsd* ) 
    myos="freebsd"
    LINK_FLAGS="$LINK_FLAGS -lm"
    ;;
  *openbsd* )
    myos="openbsd" 
    LINK_FLAGS="$LINK_FLAGS -lm"
    ;;
  *netbsd* )
    myos="netbsd"
    LINK_FLAGS="$LINK_FLAGS -lm"
    ;;
  *darwin* ) 
    myos="macosx"
    CC="clang"
    LINKER="clang"
    LINK_FLAGS="$LINK_FLAGS -ldl -lm"
    if [ "$HOSTTYPE" = "x86_64" ] ; then
      ucpu="amd64"
    fi
    ;;
  *aix* )
    myos="aix"
    LINK_FLAGS="$LINK_FLAGS -ldl -lm"    
    ;;
  *solaris* | *sun* ) 
    myos="solaris"
    LINK_FLAGS="$LINK_FLAGS -ldl -lm -lsocket -lnsl"
    ;;
  *haiku* )
    myos="haiku"
    ;;
  *) 
    echo "Error: unknown operating system: $uos"
    exit 1
    ;;
esac

case $ucpu in
  *i386* | *i486* | *i586* | *i686* | *bepc* | *i86pc* ) 
    mycpu="i386" ;;
  *amd*64* | *x86-64* | *x86_64* ) 
    mycpu="amd64" ;;
  *sparc*|*sun* ) 
    mycpu="sparc" ;;
  *ppc64* ) 
    if [ "$myos" = "linux" ] ; then
      COMP_FLAGS="$COMP_FLAGS -m64"
      LINK_FLAGS="$LINK_FLAGS -m64"
    fi
    mycpu="powerpc64" ;;
  *power*|*Power*|*ppc* ) 
    mycpu="powerpc" ;;
  *mips* ) 
    mycpu="mips" ;;
  *arm*|*armv6l* )
    mycpu="arm" ;;
  *) 
    echo "Error: unknown processor: $ucpu"
    exit 1
    ;;
esac

# call the compiler:

case $myos in
windows) 
  case $mycpu in
  i386)
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/nimrod.c -o src/1_1/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/nimrod.c -o src/1_1/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/system.c -o src/1_1/system.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/system.c -o src/1_1/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/commands.c -o src/1_1/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/commands.c -o src/1_1/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/os.c -o src/1_1/os.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/os.c -o src/1_1/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/strutils.c -o src/1_1/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/strutils.c -o src/1_1/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/parseutils.c -o src/1_1/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/parseutils.c -o src/1_1/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/times.c -o src/1_1/times.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/times.c -o src/1_1/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/winlean.c -o src/1_1/winlean.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/winlean.c -o src/1_1/winlean.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/msgs.c -o src/1_1/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/msgs.c -o src/1_1/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/options.c -o src/1_1/options.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/options.c -o src/1_1/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/lists.c -o src/1_1/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/lists.c -o src/1_1/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/strtabs.c -o src/1_1/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/strtabs.c -o src/1_1/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/hashes.c -o src/1_1/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/hashes.c -o src/1_1/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/tables.c -o src/1_1/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/tables.c -o src/1_1/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/math.c -o src/1_1/math.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/math.c -o src/1_1/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/sockets.c -o src/1_1/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/sockets.c -o src/1_1/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/ropes.c -o src/1_1/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/ropes.c -o src/1_1/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/platform.c -o src/1_1/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/platform.c -o src/1_1/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/crc.c -o src/1_1/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/crc.c -o src/1_1/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/nversion.c -o src/1_1/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/nversion.c -o src/1_1/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/condsyms.c -o src/1_1/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/condsyms.c -o src/1_1/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/idents.c -o src/1_1/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/idents.c -o src/1_1/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/extccomp.c -o src/1_1/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/extccomp.c -o src/1_1/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/osproc.c -o src/1_1/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/osproc.c -o src/1_1/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/streams.c -o src/1_1/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/streams.c -o src/1_1/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/wordrecg.c -o src/1_1/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/wordrecg.c -o src/1_1/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/babelcmd.c -o src/1_1/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/babelcmd.c -o src/1_1/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/lexer.c -o src/1_1/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/lexer.c -o src/1_1/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/nimlexbase.c -o src/1_1/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/nimlexbase.c -o src/1_1/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/llstream.c -o src/1_1/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/llstream.c -o src/1_1/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/nimconf.c -o src/1_1/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/nimconf.c -o src/1_1/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/main.c -o src/1_1/main.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/main.c -o src/1_1/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/ast.c -o src/1_1/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/ast.c -o src/1_1/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/intsets.c -o src/1_1/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/intsets.c -o src/1_1/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/idgen.c -o src/1_1/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/idgen.c -o src/1_1/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/astalgo.c -o src/1_1/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/astalgo.c -o src/1_1/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/rodutils.c -o src/1_1/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/rodutils.c -o src/1_1/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/syntaxes.c -o src/1_1/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/syntaxes.c -o src/1_1/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/parser.c -o src/1_1/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/parser.c -o src/1_1/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/pbraces.c -o src/1_1/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/pbraces.c -o src/1_1/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/filters.c -o src/1_1/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/filters.c -o src/1_1/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/renderer.c -o src/1_1/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/renderer.c -o src/1_1/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/filter_tmpl.c -o src/1_1/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/filter_tmpl.c -o src/1_1/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/rodread.c -o src/1_1/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/rodread.c -o src/1_1/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/types.c -o src/1_1/types.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/types.c -o src/1_1/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/trees.c -o src/1_1/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/trees.c -o src/1_1/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/memfiles.c -o src/1_1/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/memfiles.c -o src/1_1/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/rodwrite.c -o src/1_1/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/rodwrite.c -o src/1_1/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/passes.c -o src/1_1/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/passes.c -o src/1_1/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/magicsys.c -o src/1_1/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/magicsys.c -o src/1_1/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/nimsets.c -o src/1_1/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/nimsets.c -o src/1_1/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/bitsets.c -o src/1_1/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/bitsets.c -o src/1_1/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/semthreads.c -o src/1_1/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/semthreads.c -o src/1_1/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/importer.c -o src/1_1/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/importer.c -o src/1_1/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/lookups.c -o src/1_1/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/lookups.c -o src/1_1/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/semdata.c -o src/1_1/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/semdata.c -o src/1_1/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/treetab.c -o src/1_1/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/treetab.c -o src/1_1/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/evals.c -o src/1_1/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/evals.c -o src/1_1/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/semfold.c -o src/1_1/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/semfold.c -o src/1_1/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/saturate.c -o src/1_1/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/saturate.c -o src/1_1/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/transf.c -o src/1_1/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/transf.c -o src/1_1/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/cgmeth.c -o src/1_1/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/cgmeth.c -o src/1_1/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/sempass2.c -o src/1_1/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/sempass2.c -o src/1_1/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/guards.c -o src/1_1/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/guards.c -o src/1_1/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/lambdalifting.c -o src/1_1/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/lambdalifting.c -o src/1_1/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/evaltempl.c -o src/1_1/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/evaltempl.c -o src/1_1/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/sem.c -o src/1_1/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/sem.c -o src/1_1/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/procfind.c -o src/1_1/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/procfind.c -o src/1_1/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/pragmas.c -o src/1_1/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/pragmas.c -o src/1_1/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/semtypinst.c -o src/1_1/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/semtypinst.c -o src/1_1/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/sigmatch.c -o src/1_1/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/sigmatch.c -o src/1_1/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/parampatterns.c -o src/1_1/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/parampatterns.c -o src/1_1/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/docgen.c -o src/1_1/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/docgen.c -o src/1_1/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/rstast.c -o src/1_1/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/rstast.c -o src/1_1/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/rst.c -o src/1_1/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/rst.c -o src/1_1/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/rstgen.c -o src/1_1/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/rstgen.c -o src/1_1/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/highlite.c -o src/1_1/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/highlite.c -o src/1_1/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/algorithm.c -o src/1_1/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/algorithm.c -o src/1_1/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/sequtils.c -o src/1_1/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/sequtils.c -o src/1_1/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/aliases.c -o src/1_1/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/aliases.c -o src/1_1/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/patterns.c -o src/1_1/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/patterns.c -o src/1_1/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/cgen.c -o src/1_1/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/cgen.c -o src/1_1/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/ccgutils.c -o src/1_1/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/ccgutils.c -o src/1_1/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/cgendata.c -o src/1_1/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/cgendata.c -o src/1_1/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/ccgmerge.c -o src/1_1/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/ccgmerge.c -o src/1_1/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/jsgen.c -o src/1_1/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/jsgen.c -o src/1_1/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/json.c -o src/1_1/json.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/json.c -o src/1_1/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/lexbase.c -o src/1_1/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/lexbase.c -o src/1_1/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/unicode.c -o src/1_1/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/unicode.c -o src/1_1/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/passaux.c -o src/1_1/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/passaux.c -o src/1_1/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/depends.c -o src/1_1/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/depends.c -o src/1_1/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/docgen2.c -o src/1_1/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/docgen2.c -o src/1_1/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/service.c -o src/1_1/service.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/service.c -o src/1_1/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/parseopt.c -o src/1_1/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/parseopt.c -o src/1_1/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/modules.c -o src/1_1/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/modules.c -o src/1_1/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_1/pretty.c -o src/1_1/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/1_1/pretty.c -o src/1_1/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/1_1/nimrod.o \
src/1_1/system.o \
src/1_1/commands.o \
src/1_1/os.o \
src/1_1/strutils.o \
src/1_1/parseutils.o \
src/1_1/times.o \
src/1_1/winlean.o \
src/1_1/msgs.o \
src/1_1/options.o \
src/1_1/lists.o \
src/1_1/strtabs.o \
src/1_1/hashes.o \
src/1_1/tables.o \
src/1_1/math.o \
src/1_1/sockets.o \
src/1_1/ropes.o \
src/1_1/platform.o \
src/1_1/crc.o \
src/1_1/nversion.o \
src/1_1/condsyms.o \
src/1_1/idents.o \
src/1_1/extccomp.o \
src/1_1/osproc.o \
src/1_1/streams.o \
src/1_1/wordrecg.o \
src/1_1/babelcmd.o \
src/1_1/lexer.o \
src/1_1/nimlexbase.o \
src/1_1/llstream.o \
src/1_1/nimconf.o \
src/1_1/main.o \
src/1_1/ast.o \
src/1_1/intsets.o \
src/1_1/idgen.o \
src/1_1/astalgo.o \
src/1_1/rodutils.o \
src/1_1/syntaxes.o \
src/1_1/parser.o \
src/1_1/pbraces.o \
src/1_1/filters.o \
src/1_1/renderer.o \
src/1_1/filter_tmpl.o \
src/1_1/rodread.o \
src/1_1/types.o \
src/1_1/trees.o \
src/1_1/memfiles.o \
src/1_1/rodwrite.o \
src/1_1/passes.o \
src/1_1/magicsys.o \
src/1_1/nimsets.o \
src/1_1/bitsets.o \
src/1_1/semthreads.o \
src/1_1/importer.o \
src/1_1/lookups.o \
src/1_1/semdata.o \
src/1_1/treetab.o \
src/1_1/evals.o \
src/1_1/semfold.o \
src/1_1/saturate.o \
src/1_1/transf.o \
src/1_1/cgmeth.o \
src/1_1/sempass2.o \
src/1_1/guards.o \
src/1_1/lambdalifting.o \
src/1_1/evaltempl.o \
src/1_1/sem.o \
src/1_1/procfind.o \
src/1_1/pragmas.o \
src/1_1/semtypinst.o \
src/1_1/sigmatch.o \
src/1_1/parampatterns.o \
src/1_1/docgen.o \
src/1_1/rstast.o \
src/1_1/rst.o \
src/1_1/rstgen.o \
src/1_1/highlite.o \
src/1_1/algorithm.o \
src/1_1/sequtils.o \
src/1_1/aliases.o \
src/1_1/patterns.o \
src/1_1/cgen.o \
src/1_1/ccgutils.o \
src/1_1/cgendata.o \
src/1_1/ccgmerge.o \
src/1_1/jsgen.o \
src/1_1/json.o \
src/1_1/lexbase.o \
src/1_1/unicode.o \
src/1_1/passaux.o \
src/1_1/depends.o \
src/1_1/docgen2.o \
src/1_1/service.o \
src/1_1/parseopt.o \
src/1_1/modules.o \
src/1_1/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/1_1/nimrod.o \
src/1_1/system.o \
src/1_1/commands.o \
src/1_1/os.o \
src/1_1/strutils.o \
src/1_1/parseutils.o \
src/1_1/times.o \
src/1_1/winlean.o \
src/1_1/msgs.o \
src/1_1/options.o \
src/1_1/lists.o \
src/1_1/strtabs.o \
src/1_1/hashes.o \
src/1_1/tables.o \
src/1_1/math.o \
src/1_1/sockets.o \
src/1_1/ropes.o \
src/1_1/platform.o \
src/1_1/crc.o \
src/1_1/nversion.o \
src/1_1/condsyms.o \
src/1_1/idents.o \
src/1_1/extccomp.o \
src/1_1/osproc.o \
src/1_1/streams.o \
src/1_1/wordrecg.o \
src/1_1/babelcmd.o \
src/1_1/lexer.o \
src/1_1/nimlexbase.o \
src/1_1/llstream.o \
src/1_1/nimconf.o \
src/1_1/main.o \
src/1_1/ast.o \
src/1_1/intsets.o \
src/1_1/idgen.o \
src/1_1/astalgo.o \
src/1_1/rodutils.o \
src/1_1/syntaxes.o \
src/1_1/parser.o \
src/1_1/pbraces.o \
src/1_1/filters.o \
src/1_1/renderer.o \
src/1_1/filter_tmpl.o \
src/1_1/rodread.o \
src/1_1/types.o \
src/1_1/trees.o \
src/1_1/memfiles.o \
src/1_1/rodwrite.o \
src/1_1/passes.o \
src/1_1/magicsys.o \
src/1_1/nimsets.o \
src/1_1/bitsets.o \
src/1_1/semthreads.o \
src/1_1/importer.o \
src/1_1/lookups.o \
src/1_1/semdata.o \
src/1_1/treetab.o \
src/1_1/evals.o \
src/1_1/semfold.o \
src/1_1/saturate.o \
src/1_1/transf.o \
src/1_1/cgmeth.o \
src/1_1/sempass2.o \
src/1_1/guards.o \
src/1_1/lambdalifting.o \
src/1_1/evaltempl.o \
src/1_1/sem.o \
src/1_1/procfind.o \
src/1_1/pragmas.o \
src/1_1/semtypinst.o \
src/1_1/sigmatch.o \
src/1_1/parampatterns.o \
src/1_1/docgen.o \
src/1_1/rstast.o \
src/1_1/rst.o \
src/1_1/rstgen.o \
src/1_1/highlite.o \
src/1_1/algorithm.o \
src/1_1/sequtils.o \
src/1_1/aliases.o \
src/1_1/patterns.o \
src/1_1/cgen.o \
src/1_1/ccgutils.o \
src/1_1/cgendata.o \
src/1_1/ccgmerge.o \
src/1_1/jsgen.o \
src/1_1/json.o \
src/1_1/lexbase.o \
src/1_1/unicode.o \
src/1_1/passaux.o \
src/1_1/depends.o \
src/1_1/docgen2.o \
src/1_1/service.o \
src/1_1/parseopt.o \
src/1_1/modules.o \
src/1_1/pretty.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/nimrod.c -o src/1_2/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/nimrod.c -o src/1_2/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/system.c -o src/1_2/system.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/system.c -o src/1_2/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/commands.c -o src/1_2/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/commands.c -o src/1_2/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/os.c -o src/1_2/os.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/os.c -o src/1_2/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/strutils.c -o src/1_2/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/strutils.c -o src/1_2/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/parseutils.c -o src/1_2/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/parseutils.c -o src/1_2/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/times.c -o src/1_2/times.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/times.c -o src/1_2/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/winlean.c -o src/1_2/winlean.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/winlean.c -o src/1_2/winlean.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/msgs.c -o src/1_2/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/msgs.c -o src/1_2/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/options.c -o src/1_2/options.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/options.c -o src/1_2/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/lists.c -o src/1_2/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/lists.c -o src/1_2/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/strtabs.c -o src/1_2/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/strtabs.c -o src/1_2/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/hashes.c -o src/1_2/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/hashes.c -o src/1_2/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/tables.c -o src/1_2/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/tables.c -o src/1_2/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/math.c -o src/1_2/math.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/math.c -o src/1_2/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/sockets.c -o src/1_2/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/sockets.c -o src/1_2/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/ropes.c -o src/1_2/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/ropes.c -o src/1_2/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/platform.c -o src/1_2/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/platform.c -o src/1_2/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/crc.c -o src/1_2/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/crc.c -o src/1_2/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/nversion.c -o src/1_2/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/nversion.c -o src/1_2/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/condsyms.c -o src/1_2/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/condsyms.c -o src/1_2/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/idents.c -o src/1_2/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/idents.c -o src/1_2/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/extccomp.c -o src/1_2/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/extccomp.c -o src/1_2/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/osproc.c -o src/1_2/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/osproc.c -o src/1_2/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/streams.c -o src/1_2/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/streams.c -o src/1_2/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/wordrecg.c -o src/1_2/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/wordrecg.c -o src/1_2/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/babelcmd.c -o src/1_2/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/babelcmd.c -o src/1_2/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/lexer.c -o src/1_2/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/lexer.c -o src/1_2/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/nimlexbase.c -o src/1_2/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/nimlexbase.c -o src/1_2/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/llstream.c -o src/1_2/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/llstream.c -o src/1_2/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/nimconf.c -o src/1_2/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/nimconf.c -o src/1_2/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/main.c -o src/1_2/main.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/main.c -o src/1_2/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/ast.c -o src/1_2/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/ast.c -o src/1_2/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/intsets.c -o src/1_2/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/intsets.c -o src/1_2/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/idgen.c -o src/1_2/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/idgen.c -o src/1_2/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/astalgo.c -o src/1_2/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/astalgo.c -o src/1_2/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/rodutils.c -o src/1_2/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/rodutils.c -o src/1_2/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/syntaxes.c -o src/1_2/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/syntaxes.c -o src/1_2/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/parser.c -o src/1_2/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/parser.c -o src/1_2/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/pbraces.c -o src/1_2/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/pbraces.c -o src/1_2/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/filters.c -o src/1_2/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/filters.c -o src/1_2/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/renderer.c -o src/1_2/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/renderer.c -o src/1_2/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/filter_tmpl.c -o src/1_2/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/filter_tmpl.c -o src/1_2/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/rodread.c -o src/1_2/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/rodread.c -o src/1_2/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/types.c -o src/1_2/types.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/types.c -o src/1_2/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/trees.c -o src/1_2/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/trees.c -o src/1_2/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/memfiles.c -o src/1_2/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/memfiles.c -o src/1_2/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/rodwrite.c -o src/1_2/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/rodwrite.c -o src/1_2/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/passes.c -o src/1_2/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/passes.c -o src/1_2/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/magicsys.c -o src/1_2/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/magicsys.c -o src/1_2/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/nimsets.c -o src/1_2/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/nimsets.c -o src/1_2/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/bitsets.c -o src/1_2/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/bitsets.c -o src/1_2/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/semthreads.c -o src/1_2/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/semthreads.c -o src/1_2/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/importer.c -o src/1_2/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/importer.c -o src/1_2/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/lookups.c -o src/1_2/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/lookups.c -o src/1_2/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/semdata.c -o src/1_2/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/semdata.c -o src/1_2/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/treetab.c -o src/1_2/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/treetab.c -o src/1_2/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/evals.c -o src/1_2/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/evals.c -o src/1_2/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/semfold.c -o src/1_2/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/semfold.c -o src/1_2/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/saturate.c -o src/1_2/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/saturate.c -o src/1_2/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/transf.c -o src/1_2/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/transf.c -o src/1_2/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/cgmeth.c -o src/1_2/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/cgmeth.c -o src/1_2/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/sempass2.c -o src/1_2/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/sempass2.c -o src/1_2/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/guards.c -o src/1_2/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/guards.c -o src/1_2/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/lambdalifting.c -o src/1_2/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/lambdalifting.c -o src/1_2/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/evaltempl.c -o src/1_2/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/evaltempl.c -o src/1_2/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/sem.c -o src/1_2/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/sem.c -o src/1_2/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/procfind.c -o src/1_2/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/procfind.c -o src/1_2/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/pragmas.c -o src/1_2/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/pragmas.c -o src/1_2/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/semtypinst.c -o src/1_2/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/semtypinst.c -o src/1_2/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/sigmatch.c -o src/1_2/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/sigmatch.c -o src/1_2/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/parampatterns.c -o src/1_2/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/parampatterns.c -o src/1_2/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/docgen.c -o src/1_2/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/docgen.c -o src/1_2/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/rstast.c -o src/1_2/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/rstast.c -o src/1_2/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/rst.c -o src/1_2/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/rst.c -o src/1_2/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/rstgen.c -o src/1_2/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/rstgen.c -o src/1_2/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/highlite.c -o src/1_2/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/highlite.c -o src/1_2/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/algorithm.c -o src/1_2/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/algorithm.c -o src/1_2/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/sequtils.c -o src/1_2/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/sequtils.c -o src/1_2/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/aliases.c -o src/1_2/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/aliases.c -o src/1_2/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/patterns.c -o src/1_2/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/patterns.c -o src/1_2/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/cgen.c -o src/1_2/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/cgen.c -o src/1_2/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/ccgutils.c -o src/1_2/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/ccgutils.c -o src/1_2/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/cgendata.c -o src/1_2/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/cgendata.c -o src/1_2/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/ccgmerge.c -o src/1_2/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/ccgmerge.c -o src/1_2/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/jsgen.c -o src/1_2/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/jsgen.c -o src/1_2/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/json.c -o src/1_2/json.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/json.c -o src/1_2/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/lexbase.c -o src/1_2/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/lexbase.c -o src/1_2/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/unicode.c -o src/1_2/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/unicode.c -o src/1_2/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/passaux.c -o src/1_2/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/passaux.c -o src/1_2/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/depends.c -o src/1_2/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/depends.c -o src/1_2/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/docgen2.c -o src/1_2/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/docgen2.c -o src/1_2/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/service.c -o src/1_2/service.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/service.c -o src/1_2/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/parseopt.c -o src/1_2/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/parseopt.c -o src/1_2/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/modules.c -o src/1_2/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/modules.c -o src/1_2/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_2/pretty.c -o src/1_2/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/1_2/pretty.c -o src/1_2/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/1_2/nimrod.o \
src/1_2/system.o \
src/1_2/commands.o \
src/1_2/os.o \
src/1_2/strutils.o \
src/1_2/parseutils.o \
src/1_2/times.o \
src/1_2/winlean.o \
src/1_2/msgs.o \
src/1_2/options.o \
src/1_2/lists.o \
src/1_2/strtabs.o \
src/1_2/hashes.o \
src/1_2/tables.o \
src/1_2/math.o \
src/1_2/sockets.o \
src/1_2/ropes.o \
src/1_2/platform.o \
src/1_2/crc.o \
src/1_2/nversion.o \
src/1_2/condsyms.o \
src/1_2/idents.o \
src/1_2/extccomp.o \
src/1_2/osproc.o \
src/1_2/streams.o \
src/1_2/wordrecg.o \
src/1_2/babelcmd.o \
src/1_2/lexer.o \
src/1_2/nimlexbase.o \
src/1_2/llstream.o \
src/1_2/nimconf.o \
src/1_2/main.o \
src/1_2/ast.o \
src/1_2/intsets.o \
src/1_2/idgen.o \
src/1_2/astalgo.o \
src/1_2/rodutils.o \
src/1_2/syntaxes.o \
src/1_2/parser.o \
src/1_2/pbraces.o \
src/1_2/filters.o \
src/1_2/renderer.o \
src/1_2/filter_tmpl.o \
src/1_2/rodread.o \
src/1_2/types.o \
src/1_2/trees.o \
src/1_2/memfiles.o \
src/1_2/rodwrite.o \
src/1_2/passes.o \
src/1_2/magicsys.o \
src/1_2/nimsets.o \
src/1_2/bitsets.o \
src/1_2/semthreads.o \
src/1_2/importer.o \
src/1_2/lookups.o \
src/1_2/semdata.o \
src/1_2/treetab.o \
src/1_2/evals.o \
src/1_2/semfold.o \
src/1_2/saturate.o \
src/1_2/transf.o \
src/1_2/cgmeth.o \
src/1_2/sempass2.o \
src/1_2/guards.o \
src/1_2/lambdalifting.o \
src/1_2/evaltempl.o \
src/1_2/sem.o \
src/1_2/procfind.o \
src/1_2/pragmas.o \
src/1_2/semtypinst.o \
src/1_2/sigmatch.o \
src/1_2/parampatterns.o \
src/1_2/docgen.o \
src/1_2/rstast.o \
src/1_2/rst.o \
src/1_2/rstgen.o \
src/1_2/highlite.o \
src/1_2/algorithm.o \
src/1_2/sequtils.o \
src/1_2/aliases.o \
src/1_2/patterns.o \
src/1_2/cgen.o \
src/1_2/ccgutils.o \
src/1_2/cgendata.o \
src/1_2/ccgmerge.o \
src/1_2/jsgen.o \
src/1_2/json.o \
src/1_2/lexbase.o \
src/1_2/unicode.o \
src/1_2/passaux.o \
src/1_2/depends.o \
src/1_2/docgen2.o \
src/1_2/service.o \
src/1_2/parseopt.o \
src/1_2/modules.o \
src/1_2/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/1_2/nimrod.o \
src/1_2/system.o \
src/1_2/commands.o \
src/1_2/os.o \
src/1_2/strutils.o \
src/1_2/parseutils.o \
src/1_2/times.o \
src/1_2/winlean.o \
src/1_2/msgs.o \
src/1_2/options.o \
src/1_2/lists.o \
src/1_2/strtabs.o \
src/1_2/hashes.o \
src/1_2/tables.o \
src/1_2/math.o \
src/1_2/sockets.o \
src/1_2/ropes.o \
src/1_2/platform.o \
src/1_2/crc.o \
src/1_2/nversion.o \
src/1_2/condsyms.o \
src/1_2/idents.o \
src/1_2/extccomp.o \
src/1_2/osproc.o \
src/1_2/streams.o \
src/1_2/wordrecg.o \
src/1_2/babelcmd.o \
src/1_2/lexer.o \
src/1_2/nimlexbase.o \
src/1_2/llstream.o \
src/1_2/nimconf.o \
src/1_2/main.o \
src/1_2/ast.o \
src/1_2/intsets.o \
src/1_2/idgen.o \
src/1_2/astalgo.o \
src/1_2/rodutils.o \
src/1_2/syntaxes.o \
src/1_2/parser.o \
src/1_2/pbraces.o \
src/1_2/filters.o \
src/1_2/renderer.o \
src/1_2/filter_tmpl.o \
src/1_2/rodread.o \
src/1_2/types.o \
src/1_2/trees.o \
src/1_2/memfiles.o \
src/1_2/rodwrite.o \
src/1_2/passes.o \
src/1_2/magicsys.o \
src/1_2/nimsets.o \
src/1_2/bitsets.o \
src/1_2/semthreads.o \
src/1_2/importer.o \
src/1_2/lookups.o \
src/1_2/semdata.o \
src/1_2/treetab.o \
src/1_2/evals.o \
src/1_2/semfold.o \
src/1_2/saturate.o \
src/1_2/transf.o \
src/1_2/cgmeth.o \
src/1_2/sempass2.o \
src/1_2/guards.o \
src/1_2/lambdalifting.o \
src/1_2/evaltempl.o \
src/1_2/sem.o \
src/1_2/procfind.o \
src/1_2/pragmas.o \
src/1_2/semtypinst.o \
src/1_2/sigmatch.o \
src/1_2/parampatterns.o \
src/1_2/docgen.o \
src/1_2/rstast.o \
src/1_2/rst.o \
src/1_2/rstgen.o \
src/1_2/highlite.o \
src/1_2/algorithm.o \
src/1_2/sequtils.o \
src/1_2/aliases.o \
src/1_2/patterns.o \
src/1_2/cgen.o \
src/1_2/ccgutils.o \
src/1_2/cgendata.o \
src/1_2/ccgmerge.o \
src/1_2/jsgen.o \
src/1_2/json.o \
src/1_2/lexbase.o \
src/1_2/unicode.o \
src/1_2/passaux.o \
src/1_2/depends.o \
src/1_2/docgen2.o \
src/1_2/service.o \
src/1_2/parseopt.o \
src/1_2/modules.o \
src/1_2/pretty.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/nimrod.c -o src/1_3/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/nimrod.c -o src/1_3/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/system.c -o src/1_3/system.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/system.c -o src/1_3/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/commands.c -o src/1_3/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/commands.c -o src/1_3/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/os.c -o src/1_3/os.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/os.c -o src/1_3/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/strutils.c -o src/1_3/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/strutils.c -o src/1_3/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/parseutils.c -o src/1_3/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/parseutils.c -o src/1_3/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/times.c -o src/1_3/times.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/times.c -o src/1_3/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/winlean.c -o src/1_3/winlean.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/winlean.c -o src/1_3/winlean.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/msgs.c -o src/1_3/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/msgs.c -o src/1_3/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/options.c -o src/1_3/options.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/options.c -o src/1_3/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/lists.c -o src/1_3/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/lists.c -o src/1_3/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/strtabs.c -o src/1_3/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/strtabs.c -o src/1_3/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/hashes.c -o src/1_3/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/hashes.c -o src/1_3/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/tables.c -o src/1_3/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/tables.c -o src/1_3/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/math.c -o src/1_3/math.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/math.c -o src/1_3/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/sockets.c -o src/1_3/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/sockets.c -o src/1_3/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/ropes.c -o src/1_3/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/ropes.c -o src/1_3/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/platform.c -o src/1_3/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/platform.c -o src/1_3/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/crc.c -o src/1_3/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/crc.c -o src/1_3/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/nversion.c -o src/1_3/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/nversion.c -o src/1_3/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/condsyms.c -o src/1_3/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/condsyms.c -o src/1_3/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/idents.c -o src/1_3/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/idents.c -o src/1_3/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/extccomp.c -o src/1_3/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/extccomp.c -o src/1_3/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/osproc.c -o src/1_3/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/osproc.c -o src/1_3/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/streams.c -o src/1_3/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/streams.c -o src/1_3/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/wordrecg.c -o src/1_3/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/wordrecg.c -o src/1_3/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/babelcmd.c -o src/1_3/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/babelcmd.c -o src/1_3/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/lexer.c -o src/1_3/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/lexer.c -o src/1_3/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/nimlexbase.c -o src/1_3/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/nimlexbase.c -o src/1_3/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/llstream.c -o src/1_3/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/llstream.c -o src/1_3/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/nimconf.c -o src/1_3/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/nimconf.c -o src/1_3/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/main.c -o src/1_3/main.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/main.c -o src/1_3/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/ast.c -o src/1_3/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/ast.c -o src/1_3/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/intsets.c -o src/1_3/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/intsets.c -o src/1_3/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/idgen.c -o src/1_3/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/idgen.c -o src/1_3/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/astalgo.c -o src/1_3/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/astalgo.c -o src/1_3/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/rodutils.c -o src/1_3/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/rodutils.c -o src/1_3/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/syntaxes.c -o src/1_3/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/syntaxes.c -o src/1_3/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/parser.c -o src/1_3/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/parser.c -o src/1_3/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/pbraces.c -o src/1_3/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/pbraces.c -o src/1_3/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/filters.c -o src/1_3/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/filters.c -o src/1_3/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/renderer.c -o src/1_3/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/renderer.c -o src/1_3/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/filter_tmpl.c -o src/1_3/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/filter_tmpl.c -o src/1_3/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/rodread.c -o src/1_3/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/rodread.c -o src/1_3/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/types.c -o src/1_3/types.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/types.c -o src/1_3/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/trees.c -o src/1_3/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/trees.c -o src/1_3/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/memfiles.c -o src/1_3/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/memfiles.c -o src/1_3/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/rodwrite.c -o src/1_3/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/rodwrite.c -o src/1_3/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/passes.c -o src/1_3/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/passes.c -o src/1_3/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/magicsys.c -o src/1_3/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/magicsys.c -o src/1_3/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/nimsets.c -o src/1_3/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/nimsets.c -o src/1_3/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/bitsets.c -o src/1_3/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/bitsets.c -o src/1_3/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/semthreads.c -o src/1_3/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/semthreads.c -o src/1_3/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/importer.c -o src/1_3/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/importer.c -o src/1_3/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/lookups.c -o src/1_3/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/lookups.c -o src/1_3/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/semdata.c -o src/1_3/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/semdata.c -o src/1_3/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/treetab.c -o src/1_3/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/treetab.c -o src/1_3/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/evals.c -o src/1_3/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/evals.c -o src/1_3/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/semfold.c -o src/1_3/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/semfold.c -o src/1_3/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/saturate.c -o src/1_3/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/saturate.c -o src/1_3/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/transf.c -o src/1_3/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/transf.c -o src/1_3/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/cgmeth.c -o src/1_3/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/cgmeth.c -o src/1_3/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/sempass2.c -o src/1_3/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/sempass2.c -o src/1_3/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/guards.c -o src/1_3/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/guards.c -o src/1_3/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/lambdalifting.c -o src/1_3/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/lambdalifting.c -o src/1_3/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/evaltempl.c -o src/1_3/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/evaltempl.c -o src/1_3/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/sem.c -o src/1_3/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/sem.c -o src/1_3/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/procfind.c -o src/1_3/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/procfind.c -o src/1_3/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/pragmas.c -o src/1_3/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/pragmas.c -o src/1_3/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/semtypinst.c -o src/1_3/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/semtypinst.c -o src/1_3/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/sigmatch.c -o src/1_3/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/sigmatch.c -o src/1_3/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/parampatterns.c -o src/1_3/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/parampatterns.c -o src/1_3/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/docgen.c -o src/1_3/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/docgen.c -o src/1_3/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/rstast.c -o src/1_3/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/rstast.c -o src/1_3/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/rst.c -o src/1_3/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/rst.c -o src/1_3/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/rstgen.c -o src/1_3/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/rstgen.c -o src/1_3/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/highlite.c -o src/1_3/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/highlite.c -o src/1_3/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/algorithm.c -o src/1_3/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/algorithm.c -o src/1_3/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/sequtils.c -o src/1_3/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/sequtils.c -o src/1_3/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/aliases.c -o src/1_3/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/aliases.c -o src/1_3/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/patterns.c -o src/1_3/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/patterns.c -o src/1_3/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/cgen.c -o src/1_3/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/cgen.c -o src/1_3/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/ccgutils.c -o src/1_3/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/ccgutils.c -o src/1_3/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/cgendata.c -o src/1_3/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/cgendata.c -o src/1_3/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/ccgmerge.c -o src/1_3/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/ccgmerge.c -o src/1_3/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/jsgen.c -o src/1_3/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/jsgen.c -o src/1_3/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/json.c -o src/1_3/json.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/json.c -o src/1_3/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/lexbase.c -o src/1_3/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/lexbase.c -o src/1_3/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/unicode.c -o src/1_3/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/unicode.c -o src/1_3/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/passaux.c -o src/1_3/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/passaux.c -o src/1_3/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/depends.c -o src/1_3/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/depends.c -o src/1_3/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/docgen2.c -o src/1_3/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/docgen2.c -o src/1_3/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/service.c -o src/1_3/service.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/service.c -o src/1_3/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/parseopt.c -o src/1_3/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/parseopt.c -o src/1_3/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/modules.c -o src/1_3/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/modules.c -o src/1_3/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_3/pretty.c -o src/1_3/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/1_3/pretty.c -o src/1_3/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/1_3/nimrod.o \
src/1_3/system.o \
src/1_3/commands.o \
src/1_3/os.o \
src/1_3/strutils.o \
src/1_3/parseutils.o \
src/1_3/times.o \
src/1_3/winlean.o \
src/1_3/msgs.o \
src/1_3/options.o \
src/1_3/lists.o \
src/1_3/strtabs.o \
src/1_3/hashes.o \
src/1_3/tables.o \
src/1_3/math.o \
src/1_3/sockets.o \
src/1_3/ropes.o \
src/1_3/platform.o \
src/1_3/crc.o \
src/1_3/nversion.o \
src/1_3/condsyms.o \
src/1_3/idents.o \
src/1_3/extccomp.o \
src/1_3/osproc.o \
src/1_3/streams.o \
src/1_3/wordrecg.o \
src/1_3/babelcmd.o \
src/1_3/lexer.o \
src/1_3/nimlexbase.o \
src/1_3/llstream.o \
src/1_3/nimconf.o \
src/1_3/main.o \
src/1_3/ast.o \
src/1_3/intsets.o \
src/1_3/idgen.o \
src/1_3/astalgo.o \
src/1_3/rodutils.o \
src/1_3/syntaxes.o \
src/1_3/parser.o \
src/1_3/pbraces.o \
src/1_3/filters.o \
src/1_3/renderer.o \
src/1_3/filter_tmpl.o \
src/1_3/rodread.o \
src/1_3/types.o \
src/1_3/trees.o \
src/1_3/memfiles.o \
src/1_3/rodwrite.o \
src/1_3/passes.o \
src/1_3/magicsys.o \
src/1_3/nimsets.o \
src/1_3/bitsets.o \
src/1_3/semthreads.o \
src/1_3/importer.o \
src/1_3/lookups.o \
src/1_3/semdata.o \
src/1_3/treetab.o \
src/1_3/evals.o \
src/1_3/semfold.o \
src/1_3/saturate.o \
src/1_3/transf.o \
src/1_3/cgmeth.o \
src/1_3/sempass2.o \
src/1_3/guards.o \
src/1_3/lambdalifting.o \
src/1_3/evaltempl.o \
src/1_3/sem.o \
src/1_3/procfind.o \
src/1_3/pragmas.o \
src/1_3/semtypinst.o \
src/1_3/sigmatch.o \
src/1_3/parampatterns.o \
src/1_3/docgen.o \
src/1_3/rstast.o \
src/1_3/rst.o \
src/1_3/rstgen.o \
src/1_3/highlite.o \
src/1_3/algorithm.o \
src/1_3/sequtils.o \
src/1_3/aliases.o \
src/1_3/patterns.o \
src/1_3/cgen.o \
src/1_3/ccgutils.o \
src/1_3/cgendata.o \
src/1_3/ccgmerge.o \
src/1_3/jsgen.o \
src/1_3/json.o \
src/1_3/lexbase.o \
src/1_3/unicode.o \
src/1_3/passaux.o \
src/1_3/depends.o \
src/1_3/docgen2.o \
src/1_3/service.o \
src/1_3/parseopt.o \
src/1_3/modules.o \
src/1_3/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/1_3/nimrod.o \
src/1_3/system.o \
src/1_3/commands.o \
src/1_3/os.o \
src/1_3/strutils.o \
src/1_3/parseutils.o \
src/1_3/times.o \
src/1_3/winlean.o \
src/1_3/msgs.o \
src/1_3/options.o \
src/1_3/lists.o \
src/1_3/strtabs.o \
src/1_3/hashes.o \
src/1_3/tables.o \
src/1_3/math.o \
src/1_3/sockets.o \
src/1_3/ropes.o \
src/1_3/platform.o \
src/1_3/crc.o \
src/1_3/nversion.o \
src/1_3/condsyms.o \
src/1_3/idents.o \
src/1_3/extccomp.o \
src/1_3/osproc.o \
src/1_3/streams.o \
src/1_3/wordrecg.o \
src/1_3/babelcmd.o \
src/1_3/lexer.o \
src/1_3/nimlexbase.o \
src/1_3/llstream.o \
src/1_3/nimconf.o \
src/1_3/main.o \
src/1_3/ast.o \
src/1_3/intsets.o \
src/1_3/idgen.o \
src/1_3/astalgo.o \
src/1_3/rodutils.o \
src/1_3/syntaxes.o \
src/1_3/parser.o \
src/1_3/pbraces.o \
src/1_3/filters.o \
src/1_3/renderer.o \
src/1_3/filter_tmpl.o \
src/1_3/rodread.o \
src/1_3/types.o \
src/1_3/trees.o \
src/1_3/memfiles.o \
src/1_3/rodwrite.o \
src/1_3/passes.o \
src/1_3/magicsys.o \
src/1_3/nimsets.o \
src/1_3/bitsets.o \
src/1_3/semthreads.o \
src/1_3/importer.o \
src/1_3/lookups.o \
src/1_3/semdata.o \
src/1_3/treetab.o \
src/1_3/evals.o \
src/1_3/semfold.o \
src/1_3/saturate.o \
src/1_3/transf.o \
src/1_3/cgmeth.o \
src/1_3/sempass2.o \
src/1_3/guards.o \
src/1_3/lambdalifting.o \
src/1_3/evaltempl.o \
src/1_3/sem.o \
src/1_3/procfind.o \
src/1_3/pragmas.o \
src/1_3/semtypinst.o \
src/1_3/sigmatch.o \
src/1_3/parampatterns.o \
src/1_3/docgen.o \
src/1_3/rstast.o \
src/1_3/rst.o \
src/1_3/rstgen.o \
src/1_3/highlite.o \
src/1_3/algorithm.o \
src/1_3/sequtils.o \
src/1_3/aliases.o \
src/1_3/patterns.o \
src/1_3/cgen.o \
src/1_3/ccgutils.o \
src/1_3/cgendata.o \
src/1_3/ccgmerge.o \
src/1_3/jsgen.o \
src/1_3/json.o \
src/1_3/lexbase.o \
src/1_3/unicode.o \
src/1_3/passaux.o \
src/1_3/depends.o \
src/1_3/docgen2.o \
src/1_3/service.o \
src/1_3/parseopt.o \
src/1_3/modules.o \
src/1_3/pretty.o $LINK_FLAGS
    ;;
  arm)
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/nimrod.c -o src/1_4/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/nimrod.c -o src/1_4/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/system.c -o src/1_4/system.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/system.c -o src/1_4/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/commands.c -o src/1_4/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/commands.c -o src/1_4/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/os.c -o src/1_4/os.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/os.c -o src/1_4/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/strutils.c -o src/1_4/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/strutils.c -o src/1_4/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/parseutils.c -o src/1_4/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/parseutils.c -o src/1_4/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/times.c -o src/1_4/times.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/times.c -o src/1_4/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/winlean.c -o src/1_4/winlean.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/winlean.c -o src/1_4/winlean.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/msgs.c -o src/1_4/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/msgs.c -o src/1_4/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/options.c -o src/1_4/options.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/options.c -o src/1_4/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/lists.c -o src/1_4/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/lists.c -o src/1_4/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/strtabs.c -o src/1_4/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/strtabs.c -o src/1_4/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/hashes.c -o src/1_4/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/hashes.c -o src/1_4/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/tables.c -o src/1_4/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/tables.c -o src/1_4/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/math.c -o src/1_4/math.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/math.c -o src/1_4/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/sockets.c -o src/1_4/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/sockets.c -o src/1_4/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/ropes.c -o src/1_4/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/ropes.c -o src/1_4/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/platform.c -o src/1_4/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/platform.c -o src/1_4/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/crc.c -o src/1_4/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/crc.c -o src/1_4/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/nversion.c -o src/1_4/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/nversion.c -o src/1_4/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/condsyms.c -o src/1_4/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/condsyms.c -o src/1_4/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/idents.c -o src/1_4/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/idents.c -o src/1_4/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/extccomp.c -o src/1_4/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/extccomp.c -o src/1_4/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/osproc.c -o src/1_4/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/osproc.c -o src/1_4/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/streams.c -o src/1_4/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/streams.c -o src/1_4/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/wordrecg.c -o src/1_4/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/wordrecg.c -o src/1_4/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/babelcmd.c -o src/1_4/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/babelcmd.c -o src/1_4/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/lexer.c -o src/1_4/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/lexer.c -o src/1_4/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/nimlexbase.c -o src/1_4/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/nimlexbase.c -o src/1_4/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/llstream.c -o src/1_4/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/llstream.c -o src/1_4/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/nimconf.c -o src/1_4/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/nimconf.c -o src/1_4/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/main.c -o src/1_4/main.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/main.c -o src/1_4/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/ast.c -o src/1_4/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/ast.c -o src/1_4/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/intsets.c -o src/1_4/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/intsets.c -o src/1_4/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/idgen.c -o src/1_4/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/idgen.c -o src/1_4/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/astalgo.c -o src/1_4/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/astalgo.c -o src/1_4/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/rodutils.c -o src/1_4/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/rodutils.c -o src/1_4/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/syntaxes.c -o src/1_4/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/syntaxes.c -o src/1_4/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/parser.c -o src/1_4/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/parser.c -o src/1_4/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/pbraces.c -o src/1_4/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/pbraces.c -o src/1_4/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/filters.c -o src/1_4/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/filters.c -o src/1_4/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/renderer.c -o src/1_4/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/renderer.c -o src/1_4/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/filter_tmpl.c -o src/1_4/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/filter_tmpl.c -o src/1_4/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/rodread.c -o src/1_4/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/rodread.c -o src/1_4/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/types.c -o src/1_4/types.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/types.c -o src/1_4/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/trees.c -o src/1_4/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/trees.c -o src/1_4/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/memfiles.c -o src/1_4/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/memfiles.c -o src/1_4/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/rodwrite.c -o src/1_4/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/rodwrite.c -o src/1_4/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/passes.c -o src/1_4/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/passes.c -o src/1_4/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/magicsys.c -o src/1_4/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/magicsys.c -o src/1_4/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/nimsets.c -o src/1_4/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/nimsets.c -o src/1_4/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/bitsets.c -o src/1_4/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/bitsets.c -o src/1_4/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/semthreads.c -o src/1_4/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/semthreads.c -o src/1_4/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/importer.c -o src/1_4/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/importer.c -o src/1_4/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/lookups.c -o src/1_4/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/lookups.c -o src/1_4/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/semdata.c -o src/1_4/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/semdata.c -o src/1_4/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/treetab.c -o src/1_4/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/treetab.c -o src/1_4/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/evals.c -o src/1_4/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/evals.c -o src/1_4/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/semfold.c -o src/1_4/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/semfold.c -o src/1_4/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/saturate.c -o src/1_4/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/saturate.c -o src/1_4/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/transf.c -o src/1_4/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/transf.c -o src/1_4/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/cgmeth.c -o src/1_4/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/cgmeth.c -o src/1_4/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/sempass2.c -o src/1_4/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/sempass2.c -o src/1_4/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/guards.c -o src/1_4/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/guards.c -o src/1_4/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/lambdalifting.c -o src/1_4/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/lambdalifting.c -o src/1_4/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/evaltempl.c -o src/1_4/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/evaltempl.c -o src/1_4/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/sem.c -o src/1_4/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/sem.c -o src/1_4/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/procfind.c -o src/1_4/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/procfind.c -o src/1_4/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/pragmas.c -o src/1_4/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/pragmas.c -o src/1_4/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/semtypinst.c -o src/1_4/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/semtypinst.c -o src/1_4/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/sigmatch.c -o src/1_4/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/sigmatch.c -o src/1_4/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/parampatterns.c -o src/1_4/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/parampatterns.c -o src/1_4/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/docgen.c -o src/1_4/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/docgen.c -o src/1_4/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/rstast.c -o src/1_4/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/rstast.c -o src/1_4/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/rst.c -o src/1_4/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/rst.c -o src/1_4/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/rstgen.c -o src/1_4/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/rstgen.c -o src/1_4/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/highlite.c -o src/1_4/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/highlite.c -o src/1_4/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/algorithm.c -o src/1_4/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/algorithm.c -o src/1_4/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/sequtils.c -o src/1_4/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/sequtils.c -o src/1_4/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/aliases.c -o src/1_4/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/aliases.c -o src/1_4/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/patterns.c -o src/1_4/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/patterns.c -o src/1_4/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/cgen.c -o src/1_4/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/cgen.c -o src/1_4/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/ccgutils.c -o src/1_4/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/ccgutils.c -o src/1_4/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/cgendata.c -o src/1_4/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/cgendata.c -o src/1_4/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/ccgmerge.c -o src/1_4/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/ccgmerge.c -o src/1_4/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/jsgen.c -o src/1_4/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/jsgen.c -o src/1_4/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/json.c -o src/1_4/json.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/json.c -o src/1_4/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/lexbase.c -o src/1_4/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/lexbase.c -o src/1_4/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/unicode.c -o src/1_4/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/unicode.c -o src/1_4/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/passaux.c -o src/1_4/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/passaux.c -o src/1_4/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/depends.c -o src/1_4/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/depends.c -o src/1_4/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/docgen2.c -o src/1_4/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/docgen2.c -o src/1_4/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/service.c -o src/1_4/service.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/service.c -o src/1_4/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/parseopt.c -o src/1_4/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/parseopt.c -o src/1_4/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/modules.c -o src/1_4/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/modules.c -o src/1_4/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/1_4/pretty.c -o src/1_4/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/1_4/pretty.c -o src/1_4/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/1_4/nimrod.o \
src/1_4/system.o \
src/1_4/commands.o \
src/1_4/os.o \
src/1_4/strutils.o \
src/1_4/parseutils.o \
src/1_4/times.o \
src/1_4/winlean.o \
src/1_4/msgs.o \
src/1_4/options.o \
src/1_4/lists.o \
src/1_4/strtabs.o \
src/1_4/hashes.o \
src/1_4/tables.o \
src/1_4/math.o \
src/1_4/sockets.o \
src/1_4/ropes.o \
src/1_4/platform.o \
src/1_4/crc.o \
src/1_4/nversion.o \
src/1_4/condsyms.o \
src/1_4/idents.o \
src/1_4/extccomp.o \
src/1_4/osproc.o \
src/1_4/streams.o \
src/1_4/wordrecg.o \
src/1_4/babelcmd.o \
src/1_4/lexer.o \
src/1_4/nimlexbase.o \
src/1_4/llstream.o \
src/1_4/nimconf.o \
src/1_4/main.o \
src/1_4/ast.o \
src/1_4/intsets.o \
src/1_4/idgen.o \
src/1_4/astalgo.o \
src/1_4/rodutils.o \
src/1_4/syntaxes.o \
src/1_4/parser.o \
src/1_4/pbraces.o \
src/1_4/filters.o \
src/1_4/renderer.o \
src/1_4/filter_tmpl.o \
src/1_4/rodread.o \
src/1_4/types.o \
src/1_4/trees.o \
src/1_4/memfiles.o \
src/1_4/rodwrite.o \
src/1_4/passes.o \
src/1_4/magicsys.o \
src/1_4/nimsets.o \
src/1_4/bitsets.o \
src/1_4/semthreads.o \
src/1_4/importer.o \
src/1_4/lookups.o \
src/1_4/semdata.o \
src/1_4/treetab.o \
src/1_4/evals.o \
src/1_4/semfold.o \
src/1_4/saturate.o \
src/1_4/transf.o \
src/1_4/cgmeth.o \
src/1_4/sempass2.o \
src/1_4/guards.o \
src/1_4/lambdalifting.o \
src/1_4/evaltempl.o \
src/1_4/sem.o \
src/1_4/procfind.o \
src/1_4/pragmas.o \
src/1_4/semtypinst.o \
src/1_4/sigmatch.o \
src/1_4/parampatterns.o \
src/1_4/docgen.o \
src/1_4/rstast.o \
src/1_4/rst.o \
src/1_4/rstgen.o \
src/1_4/highlite.o \
src/1_4/algorithm.o \
src/1_4/sequtils.o \
src/1_4/aliases.o \
src/1_4/patterns.o \
src/1_4/cgen.o \
src/1_4/ccgutils.o \
src/1_4/cgendata.o \
src/1_4/ccgmerge.o \
src/1_4/jsgen.o \
src/1_4/json.o \
src/1_4/lexbase.o \
src/1_4/unicode.o \
src/1_4/passaux.o \
src/1_4/depends.o \
src/1_4/docgen2.o \
src/1_4/service.o \
src/1_4/parseopt.o \
src/1_4/modules.o \
src/1_4/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/1_4/nimrod.o \
src/1_4/system.o \
src/1_4/commands.o \
src/1_4/os.o \
src/1_4/strutils.o \
src/1_4/parseutils.o \
src/1_4/times.o \
src/1_4/winlean.o \
src/1_4/msgs.o \
src/1_4/options.o \
src/1_4/lists.o \
src/1_4/strtabs.o \
src/1_4/hashes.o \
src/1_4/tables.o \
src/1_4/math.o \
src/1_4/sockets.o \
src/1_4/ropes.o \
src/1_4/platform.o \
src/1_4/crc.o \
src/1_4/nversion.o \
src/1_4/condsyms.o \
src/1_4/idents.o \
src/1_4/extccomp.o \
src/1_4/osproc.o \
src/1_4/streams.o \
src/1_4/wordrecg.o \
src/1_4/babelcmd.o \
src/1_4/lexer.o \
src/1_4/nimlexbase.o \
src/1_4/llstream.o \
src/1_4/nimconf.o \
src/1_4/main.o \
src/1_4/ast.o \
src/1_4/intsets.o \
src/1_4/idgen.o \
src/1_4/astalgo.o \
src/1_4/rodutils.o \
src/1_4/syntaxes.o \
src/1_4/parser.o \
src/1_4/pbraces.o \
src/1_4/filters.o \
src/1_4/renderer.o \
src/1_4/filter_tmpl.o \
src/1_4/rodread.o \
src/1_4/types.o \
src/1_4/trees.o \
src/1_4/memfiles.o \
src/1_4/rodwrite.o \
src/1_4/passes.o \
src/1_4/magicsys.o \
src/1_4/nimsets.o \
src/1_4/bitsets.o \
src/1_4/semthreads.o \
src/1_4/importer.o \
src/1_4/lookups.o \
src/1_4/semdata.o \
src/1_4/treetab.o \
src/1_4/evals.o \
src/1_4/semfold.o \
src/1_4/saturate.o \
src/1_4/transf.o \
src/1_4/cgmeth.o \
src/1_4/sempass2.o \
src/1_4/guards.o \
src/1_4/lambdalifting.o \
src/1_4/evaltempl.o \
src/1_4/sem.o \
src/1_4/procfind.o \
src/1_4/pragmas.o \
src/1_4/semtypinst.o \
src/1_4/sigmatch.o \
src/1_4/parampatterns.o \
src/1_4/docgen.o \
src/1_4/rstast.o \
src/1_4/rst.o \
src/1_4/rstgen.o \
src/1_4/highlite.o \
src/1_4/algorithm.o \
src/1_4/sequtils.o \
src/1_4/aliases.o \
src/1_4/patterns.o \
src/1_4/cgen.o \
src/1_4/ccgutils.o \
src/1_4/cgendata.o \
src/1_4/ccgmerge.o \
src/1_4/jsgen.o \
src/1_4/json.o \
src/1_4/lexbase.o \
src/1_4/unicode.o \
src/1_4/passaux.o \
src/1_4/depends.o \
src/1_4/docgen2.o \
src/1_4/service.o \
src/1_4/parseopt.o \
src/1_4/modules.o \
src/1_4/pretty.o $LINK_FLAGS
    ;;
  *)
    echo "Error: no C code generated for: [$myos: $mycpu]"
    exit 1
    ;;
  esac
  ;;
linux) 
  case $mycpu in
  i386)
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/nimrod.c -o src/2_1/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/nimrod.c -o src/2_1/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/system.c -o src/2_1/system.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/system.c -o src/2_1/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/commands.c -o src/2_1/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/commands.c -o src/2_1/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/os.c -o src/2_1/os.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/os.c -o src/2_1/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/strutils.c -o src/2_1/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/strutils.c -o src/2_1/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/parseutils.c -o src/2_1/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/parseutils.c -o src/2_1/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/times.c -o src/2_1/times.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/times.c -o src/2_1/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/posix.c -o src/2_1/posix.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/posix.c -o src/2_1/posix.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/msgs.c -o src/2_1/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/msgs.c -o src/2_1/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/options.c -o src/2_1/options.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/options.c -o src/2_1/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/lists.c -o src/2_1/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/lists.c -o src/2_1/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/strtabs.c -o src/2_1/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/strtabs.c -o src/2_1/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/hashes.c -o src/2_1/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/hashes.c -o src/2_1/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/tables.c -o src/2_1/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/tables.c -o src/2_1/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/math.c -o src/2_1/math.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/math.c -o src/2_1/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/sockets.c -o src/2_1/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/sockets.c -o src/2_1/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/ropes.c -o src/2_1/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/ropes.c -o src/2_1/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/platform.c -o src/2_1/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/platform.c -o src/2_1/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/crc.c -o src/2_1/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/crc.c -o src/2_1/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/nversion.c -o src/2_1/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/nversion.c -o src/2_1/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/condsyms.c -o src/2_1/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/condsyms.c -o src/2_1/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/idents.c -o src/2_1/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/idents.c -o src/2_1/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/extccomp.c -o src/2_1/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/extccomp.c -o src/2_1/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/osproc.c -o src/2_1/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/osproc.c -o src/2_1/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/streams.c -o src/2_1/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/streams.c -o src/2_1/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/wordrecg.c -o src/2_1/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/wordrecg.c -o src/2_1/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/babelcmd.c -o src/2_1/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/babelcmd.c -o src/2_1/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/lexer.c -o src/2_1/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/lexer.c -o src/2_1/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/nimlexbase.c -o src/2_1/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/nimlexbase.c -o src/2_1/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/llstream.c -o src/2_1/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/llstream.c -o src/2_1/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/nimconf.c -o src/2_1/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/nimconf.c -o src/2_1/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/main.c -o src/2_1/main.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/main.c -o src/2_1/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/ast.c -o src/2_1/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/ast.c -o src/2_1/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/intsets.c -o src/2_1/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/intsets.c -o src/2_1/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/idgen.c -o src/2_1/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/idgen.c -o src/2_1/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/astalgo.c -o src/2_1/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/astalgo.c -o src/2_1/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/rodutils.c -o src/2_1/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/rodutils.c -o src/2_1/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/syntaxes.c -o src/2_1/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/syntaxes.c -o src/2_1/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/parser.c -o src/2_1/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/parser.c -o src/2_1/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/pbraces.c -o src/2_1/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/pbraces.c -o src/2_1/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/filters.c -o src/2_1/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/filters.c -o src/2_1/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/renderer.c -o src/2_1/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/renderer.c -o src/2_1/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/filter_tmpl.c -o src/2_1/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/filter_tmpl.c -o src/2_1/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/rodread.c -o src/2_1/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/rodread.c -o src/2_1/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/types.c -o src/2_1/types.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/types.c -o src/2_1/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/trees.c -o src/2_1/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/trees.c -o src/2_1/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/memfiles.c -o src/2_1/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/memfiles.c -o src/2_1/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/rodwrite.c -o src/2_1/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/rodwrite.c -o src/2_1/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/passes.c -o src/2_1/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/passes.c -o src/2_1/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/magicsys.c -o src/2_1/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/magicsys.c -o src/2_1/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/nimsets.c -o src/2_1/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/nimsets.c -o src/2_1/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/bitsets.c -o src/2_1/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/bitsets.c -o src/2_1/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/semthreads.c -o src/2_1/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/semthreads.c -o src/2_1/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/importer.c -o src/2_1/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/importer.c -o src/2_1/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/lookups.c -o src/2_1/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/lookups.c -o src/2_1/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/semdata.c -o src/2_1/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/semdata.c -o src/2_1/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/treetab.c -o src/2_1/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/treetab.c -o src/2_1/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/evals.c -o src/2_1/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/evals.c -o src/2_1/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/semfold.c -o src/2_1/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/semfold.c -o src/2_1/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/saturate.c -o src/2_1/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/saturate.c -o src/2_1/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/transf.c -o src/2_1/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/transf.c -o src/2_1/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/cgmeth.c -o src/2_1/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/cgmeth.c -o src/2_1/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/sempass2.c -o src/2_1/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/sempass2.c -o src/2_1/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/guards.c -o src/2_1/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/guards.c -o src/2_1/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/lambdalifting.c -o src/2_1/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/lambdalifting.c -o src/2_1/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/evaltempl.c -o src/2_1/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/evaltempl.c -o src/2_1/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/sem.c -o src/2_1/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/sem.c -o src/2_1/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/procfind.c -o src/2_1/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/procfind.c -o src/2_1/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/pragmas.c -o src/2_1/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/pragmas.c -o src/2_1/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/semtypinst.c -o src/2_1/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/semtypinst.c -o src/2_1/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/sigmatch.c -o src/2_1/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/sigmatch.c -o src/2_1/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/parampatterns.c -o src/2_1/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/parampatterns.c -o src/2_1/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/docgen.c -o src/2_1/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/docgen.c -o src/2_1/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/rstast.c -o src/2_1/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/rstast.c -o src/2_1/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/rst.c -o src/2_1/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/rst.c -o src/2_1/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/rstgen.c -o src/2_1/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/rstgen.c -o src/2_1/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/highlite.c -o src/2_1/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/highlite.c -o src/2_1/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/algorithm.c -o src/2_1/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/algorithm.c -o src/2_1/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/sequtils.c -o src/2_1/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/sequtils.c -o src/2_1/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/aliases.c -o src/2_1/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/aliases.c -o src/2_1/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/patterns.c -o src/2_1/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/patterns.c -o src/2_1/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/cgen.c -o src/2_1/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/cgen.c -o src/2_1/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/ccgutils.c -o src/2_1/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/ccgutils.c -o src/2_1/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/cgendata.c -o src/2_1/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/cgendata.c -o src/2_1/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/ccgmerge.c -o src/2_1/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/ccgmerge.c -o src/2_1/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/jsgen.c -o src/2_1/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/jsgen.c -o src/2_1/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/json.c -o src/2_1/json.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/json.c -o src/2_1/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/lexbase.c -o src/2_1/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/lexbase.c -o src/2_1/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/unicode.c -o src/2_1/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/unicode.c -o src/2_1/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/passaux.c -o src/2_1/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/passaux.c -o src/2_1/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/depends.c -o src/2_1/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/depends.c -o src/2_1/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/docgen2.c -o src/2_1/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/docgen2.c -o src/2_1/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/service.c -o src/2_1/service.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/service.c -o src/2_1/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/parseopt.c -o src/2_1/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/parseopt.c -o src/2_1/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/modules.c -o src/2_1/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/modules.c -o src/2_1/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_1/pretty.c -o src/2_1/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/2_1/pretty.c -o src/2_1/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/2_1/nimrod.o \
src/2_1/system.o \
src/2_1/commands.o \
src/2_1/os.o \
src/2_1/strutils.o \
src/2_1/parseutils.o \
src/2_1/times.o \
src/2_1/posix.o \
src/2_1/msgs.o \
src/2_1/options.o \
src/2_1/lists.o \
src/2_1/strtabs.o \
src/2_1/hashes.o \
src/2_1/tables.o \
src/2_1/math.o \
src/2_1/sockets.o \
src/2_1/ropes.o \
src/2_1/platform.o \
src/2_1/crc.o \
src/2_1/nversion.o \
src/2_1/condsyms.o \
src/2_1/idents.o \
src/2_1/extccomp.o \
src/2_1/osproc.o \
src/2_1/streams.o \
src/2_1/wordrecg.o \
src/2_1/babelcmd.o \
src/2_1/lexer.o \
src/2_1/nimlexbase.o \
src/2_1/llstream.o \
src/2_1/nimconf.o \
src/2_1/main.o \
src/2_1/ast.o \
src/2_1/intsets.o \
src/2_1/idgen.o \
src/2_1/astalgo.o \
src/2_1/rodutils.o \
src/2_1/syntaxes.o \
src/2_1/parser.o \
src/2_1/pbraces.o \
src/2_1/filters.o \
src/2_1/renderer.o \
src/2_1/filter_tmpl.o \
src/2_1/rodread.o \
src/2_1/types.o \
src/2_1/trees.o \
src/2_1/memfiles.o \
src/2_1/rodwrite.o \
src/2_1/passes.o \
src/2_1/magicsys.o \
src/2_1/nimsets.o \
src/2_1/bitsets.o \
src/2_1/semthreads.o \
src/2_1/importer.o \
src/2_1/lookups.o \
src/2_1/semdata.o \
src/2_1/treetab.o \
src/2_1/evals.o \
src/2_1/semfold.o \
src/2_1/saturate.o \
src/2_1/transf.o \
src/2_1/cgmeth.o \
src/2_1/sempass2.o \
src/2_1/guards.o \
src/2_1/lambdalifting.o \
src/2_1/evaltempl.o \
src/2_1/sem.o \
src/2_1/procfind.o \
src/2_1/pragmas.o \
src/2_1/semtypinst.o \
src/2_1/sigmatch.o \
src/2_1/parampatterns.o \
src/2_1/docgen.o \
src/2_1/rstast.o \
src/2_1/rst.o \
src/2_1/rstgen.o \
src/2_1/highlite.o \
src/2_1/algorithm.o \
src/2_1/sequtils.o \
src/2_1/aliases.o \
src/2_1/patterns.o \
src/2_1/cgen.o \
src/2_1/ccgutils.o \
src/2_1/cgendata.o \
src/2_1/ccgmerge.o \
src/2_1/jsgen.o \
src/2_1/json.o \
src/2_1/lexbase.o \
src/2_1/unicode.o \
src/2_1/passaux.o \
src/2_1/depends.o \
src/2_1/docgen2.o \
src/2_1/service.o \
src/2_1/parseopt.o \
src/2_1/modules.o \
src/2_1/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/2_1/nimrod.o \
src/2_1/system.o \
src/2_1/commands.o \
src/2_1/os.o \
src/2_1/strutils.o \
src/2_1/parseutils.o \
src/2_1/times.o \
src/2_1/posix.o \
src/2_1/msgs.o \
src/2_1/options.o \
src/2_1/lists.o \
src/2_1/strtabs.o \
src/2_1/hashes.o \
src/2_1/tables.o \
src/2_1/math.o \
src/2_1/sockets.o \
src/2_1/ropes.o \
src/2_1/platform.o \
src/2_1/crc.o \
src/2_1/nversion.o \
src/2_1/condsyms.o \
src/2_1/idents.o \
src/2_1/extccomp.o \
src/2_1/osproc.o \
src/2_1/streams.o \
src/2_1/wordrecg.o \
src/2_1/babelcmd.o \
src/2_1/lexer.o \
src/2_1/nimlexbase.o \
src/2_1/llstream.o \
src/2_1/nimconf.o \
src/2_1/main.o \
src/2_1/ast.o \
src/2_1/intsets.o \
src/2_1/idgen.o \
src/2_1/astalgo.o \
src/2_1/rodutils.o \
src/2_1/syntaxes.o \
src/2_1/parser.o \
src/2_1/pbraces.o \
src/2_1/filters.o \
src/2_1/renderer.o \
src/2_1/filter_tmpl.o \
src/2_1/rodread.o \
src/2_1/types.o \
src/2_1/trees.o \
src/2_1/memfiles.o \
src/2_1/rodwrite.o \
src/2_1/passes.o \
src/2_1/magicsys.o \
src/2_1/nimsets.o \
src/2_1/bitsets.o \
src/2_1/semthreads.o \
src/2_1/importer.o \
src/2_1/lookups.o \
src/2_1/semdata.o \
src/2_1/treetab.o \
src/2_1/evals.o \
src/2_1/semfold.o \
src/2_1/saturate.o \
src/2_1/transf.o \
src/2_1/cgmeth.o \
src/2_1/sempass2.o \
src/2_1/guards.o \
src/2_1/lambdalifting.o \
src/2_1/evaltempl.o \
src/2_1/sem.o \
src/2_1/procfind.o \
src/2_1/pragmas.o \
src/2_1/semtypinst.o \
src/2_1/sigmatch.o \
src/2_1/parampatterns.o \
src/2_1/docgen.o \
src/2_1/rstast.o \
src/2_1/rst.o \
src/2_1/rstgen.o \
src/2_1/highlite.o \
src/2_1/algorithm.o \
src/2_1/sequtils.o \
src/2_1/aliases.o \
src/2_1/patterns.o \
src/2_1/cgen.o \
src/2_1/ccgutils.o \
src/2_1/cgendata.o \
src/2_1/ccgmerge.o \
src/2_1/jsgen.o \
src/2_1/json.o \
src/2_1/lexbase.o \
src/2_1/unicode.o \
src/2_1/passaux.o \
src/2_1/depends.o \
src/2_1/docgen2.o \
src/2_1/service.o \
src/2_1/parseopt.o \
src/2_1/modules.o \
src/2_1/pretty.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/nimrod.c -o src/2_2/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/nimrod.c -o src/2_2/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/system.c -o src/2_2/system.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/system.c -o src/2_2/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/commands.c -o src/2_2/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/commands.c -o src/2_2/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/os.c -o src/2_2/os.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/os.c -o src/2_2/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/strutils.c -o src/2_2/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/strutils.c -o src/2_2/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/parseutils.c -o src/2_2/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/parseutils.c -o src/2_2/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/times.c -o src/2_2/times.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/times.c -o src/2_2/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/posix.c -o src/2_2/posix.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/posix.c -o src/2_2/posix.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/msgs.c -o src/2_2/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/msgs.c -o src/2_2/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/options.c -o src/2_2/options.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/options.c -o src/2_2/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/lists.c -o src/2_2/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/lists.c -o src/2_2/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/strtabs.c -o src/2_2/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/strtabs.c -o src/2_2/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/hashes.c -o src/2_2/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/hashes.c -o src/2_2/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/tables.c -o src/2_2/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/tables.c -o src/2_2/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/math.c -o src/2_2/math.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/math.c -o src/2_2/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/sockets.c -o src/2_2/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/sockets.c -o src/2_2/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/ropes.c -o src/2_2/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/ropes.c -o src/2_2/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/platform.c -o src/2_2/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/platform.c -o src/2_2/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/crc.c -o src/2_2/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/crc.c -o src/2_2/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/nversion.c -o src/2_2/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/nversion.c -o src/2_2/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/condsyms.c -o src/2_2/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/condsyms.c -o src/2_2/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/idents.c -o src/2_2/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/idents.c -o src/2_2/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/extccomp.c -o src/2_2/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/extccomp.c -o src/2_2/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/osproc.c -o src/2_2/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/osproc.c -o src/2_2/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/streams.c -o src/2_2/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/streams.c -o src/2_2/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/wordrecg.c -o src/2_2/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/wordrecg.c -o src/2_2/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/babelcmd.c -o src/2_2/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/babelcmd.c -o src/2_2/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/lexer.c -o src/2_2/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/lexer.c -o src/2_2/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/nimlexbase.c -o src/2_2/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/nimlexbase.c -o src/2_2/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/llstream.c -o src/2_2/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/llstream.c -o src/2_2/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/nimconf.c -o src/2_2/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/nimconf.c -o src/2_2/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/main.c -o src/2_2/main.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/main.c -o src/2_2/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/ast.c -o src/2_2/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/ast.c -o src/2_2/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/intsets.c -o src/2_2/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/intsets.c -o src/2_2/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/idgen.c -o src/2_2/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/idgen.c -o src/2_2/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/astalgo.c -o src/2_2/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/astalgo.c -o src/2_2/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/rodutils.c -o src/2_2/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/rodutils.c -o src/2_2/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/syntaxes.c -o src/2_2/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/syntaxes.c -o src/2_2/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/parser.c -o src/2_2/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/parser.c -o src/2_2/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/pbraces.c -o src/2_2/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/pbraces.c -o src/2_2/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/filters.c -o src/2_2/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/filters.c -o src/2_2/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/renderer.c -o src/2_2/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/renderer.c -o src/2_2/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/filter_tmpl.c -o src/2_2/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/filter_tmpl.c -o src/2_2/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/rodread.c -o src/2_2/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/rodread.c -o src/2_2/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/types.c -o src/2_2/types.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/types.c -o src/2_2/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/trees.c -o src/2_2/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/trees.c -o src/2_2/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/memfiles.c -o src/2_2/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/memfiles.c -o src/2_2/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/rodwrite.c -o src/2_2/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/rodwrite.c -o src/2_2/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/passes.c -o src/2_2/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/passes.c -o src/2_2/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/magicsys.c -o src/2_2/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/magicsys.c -o src/2_2/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/nimsets.c -o src/2_2/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/nimsets.c -o src/2_2/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/bitsets.c -o src/2_2/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/bitsets.c -o src/2_2/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/semthreads.c -o src/2_2/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/semthreads.c -o src/2_2/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/importer.c -o src/2_2/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/importer.c -o src/2_2/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/lookups.c -o src/2_2/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/lookups.c -o src/2_2/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/semdata.c -o src/2_2/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/semdata.c -o src/2_2/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/treetab.c -o src/2_2/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/treetab.c -o src/2_2/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/evals.c -o src/2_2/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/evals.c -o src/2_2/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/semfold.c -o src/2_2/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/semfold.c -o src/2_2/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/saturate.c -o src/2_2/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/saturate.c -o src/2_2/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/transf.c -o src/2_2/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/transf.c -o src/2_2/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/cgmeth.c -o src/2_2/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/cgmeth.c -o src/2_2/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/sempass2.c -o src/2_2/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/sempass2.c -o src/2_2/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/guards.c -o src/2_2/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/guards.c -o src/2_2/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/lambdalifting.c -o src/2_2/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/lambdalifting.c -o src/2_2/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/evaltempl.c -o src/2_2/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/evaltempl.c -o src/2_2/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/sem.c -o src/2_2/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/sem.c -o src/2_2/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/procfind.c -o src/2_2/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/procfind.c -o src/2_2/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/pragmas.c -o src/2_2/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/pragmas.c -o src/2_2/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/semtypinst.c -o src/2_2/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/semtypinst.c -o src/2_2/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/sigmatch.c -o src/2_2/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/sigmatch.c -o src/2_2/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/parampatterns.c -o src/2_2/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/parampatterns.c -o src/2_2/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/docgen.c -o src/2_2/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/docgen.c -o src/2_2/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/rstast.c -o src/2_2/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/rstast.c -o src/2_2/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/rst.c -o src/2_2/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/rst.c -o src/2_2/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/rstgen.c -o src/2_2/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/rstgen.c -o src/2_2/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/highlite.c -o src/2_2/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/highlite.c -o src/2_2/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/algorithm.c -o src/2_2/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/algorithm.c -o src/2_2/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/sequtils.c -o src/2_2/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/sequtils.c -o src/2_2/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/aliases.c -o src/2_2/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/aliases.c -o src/2_2/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/patterns.c -o src/2_2/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/patterns.c -o src/2_2/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/cgen.c -o src/2_2/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/cgen.c -o src/2_2/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/ccgutils.c -o src/2_2/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/ccgutils.c -o src/2_2/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/cgendata.c -o src/2_2/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/cgendata.c -o src/2_2/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/ccgmerge.c -o src/2_2/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/ccgmerge.c -o src/2_2/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/jsgen.c -o src/2_2/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/jsgen.c -o src/2_2/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/json.c -o src/2_2/json.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/json.c -o src/2_2/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/lexbase.c -o src/2_2/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/lexbase.c -o src/2_2/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/unicode.c -o src/2_2/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/unicode.c -o src/2_2/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/passaux.c -o src/2_2/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/passaux.c -o src/2_2/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/depends.c -o src/2_2/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/depends.c -o src/2_2/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/docgen2.c -o src/2_2/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/docgen2.c -o src/2_2/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/service.c -o src/2_2/service.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/service.c -o src/2_2/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/parseopt.c -o src/2_2/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/parseopt.c -o src/2_2/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/modules.c -o src/2_2/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/modules.c -o src/2_2/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_2/pretty.c -o src/2_2/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/2_2/pretty.c -o src/2_2/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/2_2/nimrod.o \
src/2_2/system.o \
src/2_2/commands.o \
src/2_2/os.o \
src/2_2/strutils.o \
src/2_2/parseutils.o \
src/2_2/times.o \
src/2_2/posix.o \
src/2_2/msgs.o \
src/2_2/options.o \
src/2_2/lists.o \
src/2_2/strtabs.o \
src/2_2/hashes.o \
src/2_2/tables.o \
src/2_2/math.o \
src/2_2/sockets.o \
src/2_2/ropes.o \
src/2_2/platform.o \
src/2_2/crc.o \
src/2_2/nversion.o \
src/2_2/condsyms.o \
src/2_2/idents.o \
src/2_2/extccomp.o \
src/2_2/osproc.o \
src/2_2/streams.o \
src/2_2/wordrecg.o \
src/2_2/babelcmd.o \
src/2_2/lexer.o \
src/2_2/nimlexbase.o \
src/2_2/llstream.o \
src/2_2/nimconf.o \
src/2_2/main.o \
src/2_2/ast.o \
src/2_2/intsets.o \
src/2_2/idgen.o \
src/2_2/astalgo.o \
src/2_2/rodutils.o \
src/2_2/syntaxes.o \
src/2_2/parser.o \
src/2_2/pbraces.o \
src/2_2/filters.o \
src/2_2/renderer.o \
src/2_2/filter_tmpl.o \
src/2_2/rodread.o \
src/2_2/types.o \
src/2_2/trees.o \
src/2_2/memfiles.o \
src/2_2/rodwrite.o \
src/2_2/passes.o \
src/2_2/magicsys.o \
src/2_2/nimsets.o \
src/2_2/bitsets.o \
src/2_2/semthreads.o \
src/2_2/importer.o \
src/2_2/lookups.o \
src/2_2/semdata.o \
src/2_2/treetab.o \
src/2_2/evals.o \
src/2_2/semfold.o \
src/2_2/saturate.o \
src/2_2/transf.o \
src/2_2/cgmeth.o \
src/2_2/sempass2.o \
src/2_2/guards.o \
src/2_2/lambdalifting.o \
src/2_2/evaltempl.o \
src/2_2/sem.o \
src/2_2/procfind.o \
src/2_2/pragmas.o \
src/2_2/semtypinst.o \
src/2_2/sigmatch.o \
src/2_2/parampatterns.o \
src/2_2/docgen.o \
src/2_2/rstast.o \
src/2_2/rst.o \
src/2_2/rstgen.o \
src/2_2/highlite.o \
src/2_2/algorithm.o \
src/2_2/sequtils.o \
src/2_2/aliases.o \
src/2_2/patterns.o \
src/2_2/cgen.o \
src/2_2/ccgutils.o \
src/2_2/cgendata.o \
src/2_2/ccgmerge.o \
src/2_2/jsgen.o \
src/2_2/json.o \
src/2_2/lexbase.o \
src/2_2/unicode.o \
src/2_2/passaux.o \
src/2_2/depends.o \
src/2_2/docgen2.o \
src/2_2/service.o \
src/2_2/parseopt.o \
src/2_2/modules.o \
src/2_2/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/2_2/nimrod.o \
src/2_2/system.o \
src/2_2/commands.o \
src/2_2/os.o \
src/2_2/strutils.o \
src/2_2/parseutils.o \
src/2_2/times.o \
src/2_2/posix.o \
src/2_2/msgs.o \
src/2_2/options.o \
src/2_2/lists.o \
src/2_2/strtabs.o \
src/2_2/hashes.o \
src/2_2/tables.o \
src/2_2/math.o \
src/2_2/sockets.o \
src/2_2/ropes.o \
src/2_2/platform.o \
src/2_2/crc.o \
src/2_2/nversion.o \
src/2_2/condsyms.o \
src/2_2/idents.o \
src/2_2/extccomp.o \
src/2_2/osproc.o \
src/2_2/streams.o \
src/2_2/wordrecg.o \
src/2_2/babelcmd.o \
src/2_2/lexer.o \
src/2_2/nimlexbase.o \
src/2_2/llstream.o \
src/2_2/nimconf.o \
src/2_2/main.o \
src/2_2/ast.o \
src/2_2/intsets.o \
src/2_2/idgen.o \
src/2_2/astalgo.o \
src/2_2/rodutils.o \
src/2_2/syntaxes.o \
src/2_2/parser.o \
src/2_2/pbraces.o \
src/2_2/filters.o \
src/2_2/renderer.o \
src/2_2/filter_tmpl.o \
src/2_2/rodread.o \
src/2_2/types.o \
src/2_2/trees.o \
src/2_2/memfiles.o \
src/2_2/rodwrite.o \
src/2_2/passes.o \
src/2_2/magicsys.o \
src/2_2/nimsets.o \
src/2_2/bitsets.o \
src/2_2/semthreads.o \
src/2_2/importer.o \
src/2_2/lookups.o \
src/2_2/semdata.o \
src/2_2/treetab.o \
src/2_2/evals.o \
src/2_2/semfold.o \
src/2_2/saturate.o \
src/2_2/transf.o \
src/2_2/cgmeth.o \
src/2_2/sempass2.o \
src/2_2/guards.o \
src/2_2/lambdalifting.o \
src/2_2/evaltempl.o \
src/2_2/sem.o \
src/2_2/procfind.o \
src/2_2/pragmas.o \
src/2_2/semtypinst.o \
src/2_2/sigmatch.o \
src/2_2/parampatterns.o \
src/2_2/docgen.o \
src/2_2/rstast.o \
src/2_2/rst.o \
src/2_2/rstgen.o \
src/2_2/highlite.o \
src/2_2/algorithm.o \
src/2_2/sequtils.o \
src/2_2/aliases.o \
src/2_2/patterns.o \
src/2_2/cgen.o \
src/2_2/ccgutils.o \
src/2_2/cgendata.o \
src/2_2/ccgmerge.o \
src/2_2/jsgen.o \
src/2_2/json.o \
src/2_2/lexbase.o \
src/2_2/unicode.o \
src/2_2/passaux.o \
src/2_2/depends.o \
src/2_2/docgen2.o \
src/2_2/service.o \
src/2_2/parseopt.o \
src/2_2/modules.o \
src/2_2/pretty.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/nimrod.c -o src/2_3/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/nimrod.c -o src/2_3/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/system.c -o src/2_3/system.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/system.c -o src/2_3/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/commands.c -o src/2_3/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/commands.c -o src/2_3/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/os.c -o src/2_3/os.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/os.c -o src/2_3/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/strutils.c -o src/2_3/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/strutils.c -o src/2_3/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/parseutils.c -o src/2_3/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/parseutils.c -o src/2_3/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/times.c -o src/2_3/times.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/times.c -o src/2_3/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/posix.c -o src/2_3/posix.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/posix.c -o src/2_3/posix.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/msgs.c -o src/2_3/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/msgs.c -o src/2_3/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/options.c -o src/2_3/options.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/options.c -o src/2_3/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/lists.c -o src/2_3/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/lists.c -o src/2_3/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/strtabs.c -o src/2_3/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/strtabs.c -o src/2_3/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/hashes.c -o src/2_3/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/hashes.c -o src/2_3/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/tables.c -o src/2_3/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/tables.c -o src/2_3/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/math.c -o src/2_3/math.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/math.c -o src/2_3/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/sockets.c -o src/2_3/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/sockets.c -o src/2_3/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/ropes.c -o src/2_3/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/ropes.c -o src/2_3/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/platform.c -o src/2_3/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/platform.c -o src/2_3/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/crc.c -o src/2_3/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/crc.c -o src/2_3/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/nversion.c -o src/2_3/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/nversion.c -o src/2_3/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/condsyms.c -o src/2_3/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/condsyms.c -o src/2_3/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/idents.c -o src/2_3/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/idents.c -o src/2_3/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/extccomp.c -o src/2_3/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/extccomp.c -o src/2_3/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/osproc.c -o src/2_3/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/osproc.c -o src/2_3/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/streams.c -o src/2_3/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/streams.c -o src/2_3/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/wordrecg.c -o src/2_3/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/wordrecg.c -o src/2_3/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/babelcmd.c -o src/2_3/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/babelcmd.c -o src/2_3/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/lexer.c -o src/2_3/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/lexer.c -o src/2_3/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/nimlexbase.c -o src/2_3/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/nimlexbase.c -o src/2_3/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/llstream.c -o src/2_3/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/llstream.c -o src/2_3/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/nimconf.c -o src/2_3/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/nimconf.c -o src/2_3/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/main.c -o src/2_3/main.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/main.c -o src/2_3/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/ast.c -o src/2_3/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/ast.c -o src/2_3/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/intsets.c -o src/2_3/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/intsets.c -o src/2_3/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/idgen.c -o src/2_3/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/idgen.c -o src/2_3/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/astalgo.c -o src/2_3/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/astalgo.c -o src/2_3/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/rodutils.c -o src/2_3/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/rodutils.c -o src/2_3/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/syntaxes.c -o src/2_3/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/syntaxes.c -o src/2_3/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/parser.c -o src/2_3/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/parser.c -o src/2_3/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/pbraces.c -o src/2_3/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/pbraces.c -o src/2_3/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/filters.c -o src/2_3/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/filters.c -o src/2_3/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/renderer.c -o src/2_3/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/renderer.c -o src/2_3/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/filter_tmpl.c -o src/2_3/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/filter_tmpl.c -o src/2_3/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/rodread.c -o src/2_3/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/rodread.c -o src/2_3/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/types.c -o src/2_3/types.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/types.c -o src/2_3/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/trees.c -o src/2_3/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/trees.c -o src/2_3/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/memfiles.c -o src/2_3/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/memfiles.c -o src/2_3/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/rodwrite.c -o src/2_3/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/rodwrite.c -o src/2_3/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/passes.c -o src/2_3/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/passes.c -o src/2_3/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/magicsys.c -o src/2_3/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/magicsys.c -o src/2_3/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/nimsets.c -o src/2_3/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/nimsets.c -o src/2_3/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/bitsets.c -o src/2_3/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/bitsets.c -o src/2_3/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/semthreads.c -o src/2_3/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/semthreads.c -o src/2_3/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/importer.c -o src/2_3/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/importer.c -o src/2_3/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/lookups.c -o src/2_3/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/lookups.c -o src/2_3/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/semdata.c -o src/2_3/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/semdata.c -o src/2_3/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/treetab.c -o src/2_3/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/treetab.c -o src/2_3/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/evals.c -o src/2_3/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/evals.c -o src/2_3/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/semfold.c -o src/2_3/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/semfold.c -o src/2_3/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/saturate.c -o src/2_3/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/saturate.c -o src/2_3/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/transf.c -o src/2_3/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/transf.c -o src/2_3/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/cgmeth.c -o src/2_3/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/cgmeth.c -o src/2_3/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/sempass2.c -o src/2_3/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/sempass2.c -o src/2_3/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/guards.c -o src/2_3/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/guards.c -o src/2_3/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/lambdalifting.c -o src/2_3/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/lambdalifting.c -o src/2_3/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/evaltempl.c -o src/2_3/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/evaltempl.c -o src/2_3/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/sem.c -o src/2_3/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/sem.c -o src/2_3/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/procfind.c -o src/2_3/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/procfind.c -o src/2_3/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/pragmas.c -o src/2_3/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/pragmas.c -o src/2_3/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/semtypinst.c -o src/2_3/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/semtypinst.c -o src/2_3/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/sigmatch.c -o src/2_3/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/sigmatch.c -o src/2_3/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/parampatterns.c -o src/2_3/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/parampatterns.c -o src/2_3/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/docgen.c -o src/2_3/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/docgen.c -o src/2_3/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/rstast.c -o src/2_3/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/rstast.c -o src/2_3/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/rst.c -o src/2_3/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/rst.c -o src/2_3/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/rstgen.c -o src/2_3/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/rstgen.c -o src/2_3/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/highlite.c -o src/2_3/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/highlite.c -o src/2_3/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/algorithm.c -o src/2_3/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/algorithm.c -o src/2_3/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/sequtils.c -o src/2_3/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/sequtils.c -o src/2_3/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/aliases.c -o src/2_3/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/aliases.c -o src/2_3/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/patterns.c -o src/2_3/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/patterns.c -o src/2_3/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/cgen.c -o src/2_3/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/cgen.c -o src/2_3/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/ccgutils.c -o src/2_3/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/ccgutils.c -o src/2_3/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/cgendata.c -o src/2_3/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/cgendata.c -o src/2_3/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/ccgmerge.c -o src/2_3/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/ccgmerge.c -o src/2_3/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/jsgen.c -o src/2_3/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/jsgen.c -o src/2_3/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/json.c -o src/2_3/json.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/json.c -o src/2_3/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/lexbase.c -o src/2_3/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/lexbase.c -o src/2_3/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/unicode.c -o src/2_3/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/unicode.c -o src/2_3/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/passaux.c -o src/2_3/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/passaux.c -o src/2_3/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/depends.c -o src/2_3/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/depends.c -o src/2_3/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/docgen2.c -o src/2_3/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/docgen2.c -o src/2_3/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/service.c -o src/2_3/service.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/service.c -o src/2_3/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/parseopt.c -o src/2_3/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/parseopt.c -o src/2_3/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/modules.c -o src/2_3/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/modules.c -o src/2_3/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_3/pretty.c -o src/2_3/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/2_3/pretty.c -o src/2_3/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/2_3/nimrod.o \
src/2_3/system.o \
src/2_3/commands.o \
src/2_3/os.o \
src/2_3/strutils.o \
src/2_3/parseutils.o \
src/2_3/times.o \
src/2_3/posix.o \
src/2_3/msgs.o \
src/2_3/options.o \
src/2_3/lists.o \
src/2_3/strtabs.o \
src/2_3/hashes.o \
src/2_3/tables.o \
src/2_3/math.o \
src/2_3/sockets.o \
src/2_3/ropes.o \
src/2_3/platform.o \
src/2_3/crc.o \
src/2_3/nversion.o \
src/2_3/condsyms.o \
src/2_3/idents.o \
src/2_3/extccomp.o \
src/2_3/osproc.o \
src/2_3/streams.o \
src/2_3/wordrecg.o \
src/2_3/babelcmd.o \
src/2_3/lexer.o \
src/2_3/nimlexbase.o \
src/2_3/llstream.o \
src/2_3/nimconf.o \
src/2_3/main.o \
src/2_3/ast.o \
src/2_3/intsets.o \
src/2_3/idgen.o \
src/2_3/astalgo.o \
src/2_3/rodutils.o \
src/2_3/syntaxes.o \
src/2_3/parser.o \
src/2_3/pbraces.o \
src/2_3/filters.o \
src/2_3/renderer.o \
src/2_3/filter_tmpl.o \
src/2_3/rodread.o \
src/2_3/types.o \
src/2_3/trees.o \
src/2_3/memfiles.o \
src/2_3/rodwrite.o \
src/2_3/passes.o \
src/2_3/magicsys.o \
src/2_3/nimsets.o \
src/2_3/bitsets.o \
src/2_3/semthreads.o \
src/2_3/importer.o \
src/2_3/lookups.o \
src/2_3/semdata.o \
src/2_3/treetab.o \
src/2_3/evals.o \
src/2_3/semfold.o \
src/2_3/saturate.o \
src/2_3/transf.o \
src/2_3/cgmeth.o \
src/2_3/sempass2.o \
src/2_3/guards.o \
src/2_3/lambdalifting.o \
src/2_3/evaltempl.o \
src/2_3/sem.o \
src/2_3/procfind.o \
src/2_3/pragmas.o \
src/2_3/semtypinst.o \
src/2_3/sigmatch.o \
src/2_3/parampatterns.o \
src/2_3/docgen.o \
src/2_3/rstast.o \
src/2_3/rst.o \
src/2_3/rstgen.o \
src/2_3/highlite.o \
src/2_3/algorithm.o \
src/2_3/sequtils.o \
src/2_3/aliases.o \
src/2_3/patterns.o \
src/2_3/cgen.o \
src/2_3/ccgutils.o \
src/2_3/cgendata.o \
src/2_3/ccgmerge.o \
src/2_3/jsgen.o \
src/2_3/json.o \
src/2_3/lexbase.o \
src/2_3/unicode.o \
src/2_3/passaux.o \
src/2_3/depends.o \
src/2_3/docgen2.o \
src/2_3/service.o \
src/2_3/parseopt.o \
src/2_3/modules.o \
src/2_3/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/2_3/nimrod.o \
src/2_3/system.o \
src/2_3/commands.o \
src/2_3/os.o \
src/2_3/strutils.o \
src/2_3/parseutils.o \
src/2_3/times.o \
src/2_3/posix.o \
src/2_3/msgs.o \
src/2_3/options.o \
src/2_3/lists.o \
src/2_3/strtabs.o \
src/2_3/hashes.o \
src/2_3/tables.o \
src/2_3/math.o \
src/2_3/sockets.o \
src/2_3/ropes.o \
src/2_3/platform.o \
src/2_3/crc.o \
src/2_3/nversion.o \
src/2_3/condsyms.o \
src/2_3/idents.o \
src/2_3/extccomp.o \
src/2_3/osproc.o \
src/2_3/streams.o \
src/2_3/wordrecg.o \
src/2_3/babelcmd.o \
src/2_3/lexer.o \
src/2_3/nimlexbase.o \
src/2_3/llstream.o \
src/2_3/nimconf.o \
src/2_3/main.o \
src/2_3/ast.o \
src/2_3/intsets.o \
src/2_3/idgen.o \
src/2_3/astalgo.o \
src/2_3/rodutils.o \
src/2_3/syntaxes.o \
src/2_3/parser.o \
src/2_3/pbraces.o \
src/2_3/filters.o \
src/2_3/renderer.o \
src/2_3/filter_tmpl.o \
src/2_3/rodread.o \
src/2_3/types.o \
src/2_3/trees.o \
src/2_3/memfiles.o \
src/2_3/rodwrite.o \
src/2_3/passes.o \
src/2_3/magicsys.o \
src/2_3/nimsets.o \
src/2_3/bitsets.o \
src/2_3/semthreads.o \
src/2_3/importer.o \
src/2_3/lookups.o \
src/2_3/semdata.o \
src/2_3/treetab.o \
src/2_3/evals.o \
src/2_3/semfold.o \
src/2_3/saturate.o \
src/2_3/transf.o \
src/2_3/cgmeth.o \
src/2_3/sempass2.o \
src/2_3/guards.o \
src/2_3/lambdalifting.o \
src/2_3/evaltempl.o \
src/2_3/sem.o \
src/2_3/procfind.o \
src/2_3/pragmas.o \
src/2_3/semtypinst.o \
src/2_3/sigmatch.o \
src/2_3/parampatterns.o \
src/2_3/docgen.o \
src/2_3/rstast.o \
src/2_3/rst.o \
src/2_3/rstgen.o \
src/2_3/highlite.o \
src/2_3/algorithm.o \
src/2_3/sequtils.o \
src/2_3/aliases.o \
src/2_3/patterns.o \
src/2_3/cgen.o \
src/2_3/ccgutils.o \
src/2_3/cgendata.o \
src/2_3/ccgmerge.o \
src/2_3/jsgen.o \
src/2_3/json.o \
src/2_3/lexbase.o \
src/2_3/unicode.o \
src/2_3/passaux.o \
src/2_3/depends.o \
src/2_3/docgen2.o \
src/2_3/service.o \
src/2_3/parseopt.o \
src/2_3/modules.o \
src/2_3/pretty.o $LINK_FLAGS
    ;;
  arm)
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/nimrod.c -o src/2_4/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/nimrod.c -o src/2_4/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/system.c -o src/2_4/system.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/system.c -o src/2_4/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/commands.c -o src/2_4/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/commands.c -o src/2_4/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/os.c -o src/2_4/os.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/os.c -o src/2_4/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/strutils.c -o src/2_4/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/strutils.c -o src/2_4/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/parseutils.c -o src/2_4/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/parseutils.c -o src/2_4/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/times.c -o src/2_4/times.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/times.c -o src/2_4/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/posix.c -o src/2_4/posix.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/posix.c -o src/2_4/posix.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/msgs.c -o src/2_4/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/msgs.c -o src/2_4/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/options.c -o src/2_4/options.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/options.c -o src/2_4/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/lists.c -o src/2_4/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/lists.c -o src/2_4/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/strtabs.c -o src/2_4/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/strtabs.c -o src/2_4/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/hashes.c -o src/2_4/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/hashes.c -o src/2_4/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/tables.c -o src/2_4/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/tables.c -o src/2_4/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/math.c -o src/2_4/math.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/math.c -o src/2_4/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/sockets.c -o src/2_4/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/sockets.c -o src/2_4/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/ropes.c -o src/2_4/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/ropes.c -o src/2_4/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/platform.c -o src/2_4/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/platform.c -o src/2_4/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/crc.c -o src/2_4/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/crc.c -o src/2_4/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/nversion.c -o src/2_4/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/nversion.c -o src/2_4/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/condsyms.c -o src/2_4/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/condsyms.c -o src/2_4/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/idents.c -o src/2_4/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/idents.c -o src/2_4/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/extccomp.c -o src/2_4/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/extccomp.c -o src/2_4/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/osproc.c -o src/2_4/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/osproc.c -o src/2_4/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/streams.c -o src/2_4/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/streams.c -o src/2_4/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/wordrecg.c -o src/2_4/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/wordrecg.c -o src/2_4/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/babelcmd.c -o src/2_4/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/babelcmd.c -o src/2_4/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/lexer.c -o src/2_4/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/lexer.c -o src/2_4/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/nimlexbase.c -o src/2_4/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/nimlexbase.c -o src/2_4/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/llstream.c -o src/2_4/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/llstream.c -o src/2_4/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/nimconf.c -o src/2_4/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/nimconf.c -o src/2_4/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/main.c -o src/2_4/main.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/main.c -o src/2_4/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/ast.c -o src/2_4/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/ast.c -o src/2_4/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/intsets.c -o src/2_4/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/intsets.c -o src/2_4/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/idgen.c -o src/2_4/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/idgen.c -o src/2_4/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/astalgo.c -o src/2_4/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/astalgo.c -o src/2_4/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/rodutils.c -o src/2_4/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/rodutils.c -o src/2_4/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/syntaxes.c -o src/2_4/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/syntaxes.c -o src/2_4/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/parser.c -o src/2_4/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/parser.c -o src/2_4/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/pbraces.c -o src/2_4/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/pbraces.c -o src/2_4/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/filters.c -o src/2_4/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/filters.c -o src/2_4/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/renderer.c -o src/2_4/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/renderer.c -o src/2_4/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/filter_tmpl.c -o src/2_4/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/filter_tmpl.c -o src/2_4/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/rodread.c -o src/2_4/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/rodread.c -o src/2_4/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/types.c -o src/2_4/types.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/types.c -o src/2_4/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/trees.c -o src/2_4/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/trees.c -o src/2_4/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/memfiles.c -o src/2_4/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/memfiles.c -o src/2_4/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/rodwrite.c -o src/2_4/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/rodwrite.c -o src/2_4/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/passes.c -o src/2_4/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/passes.c -o src/2_4/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/magicsys.c -o src/2_4/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/magicsys.c -o src/2_4/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/nimsets.c -o src/2_4/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/nimsets.c -o src/2_4/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/bitsets.c -o src/2_4/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/bitsets.c -o src/2_4/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/semthreads.c -o src/2_4/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/semthreads.c -o src/2_4/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/importer.c -o src/2_4/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/importer.c -o src/2_4/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/lookups.c -o src/2_4/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/lookups.c -o src/2_4/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/semdata.c -o src/2_4/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/semdata.c -o src/2_4/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/treetab.c -o src/2_4/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/treetab.c -o src/2_4/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/evals.c -o src/2_4/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/evals.c -o src/2_4/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/semfold.c -o src/2_4/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/semfold.c -o src/2_4/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/saturate.c -o src/2_4/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/saturate.c -o src/2_4/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/transf.c -o src/2_4/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/transf.c -o src/2_4/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/cgmeth.c -o src/2_4/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/cgmeth.c -o src/2_4/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/sempass2.c -o src/2_4/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/sempass2.c -o src/2_4/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/guards.c -o src/2_4/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/guards.c -o src/2_4/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/lambdalifting.c -o src/2_4/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/lambdalifting.c -o src/2_4/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/evaltempl.c -o src/2_4/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/evaltempl.c -o src/2_4/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/sem.c -o src/2_4/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/sem.c -o src/2_4/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/procfind.c -o src/2_4/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/procfind.c -o src/2_4/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/pragmas.c -o src/2_4/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/pragmas.c -o src/2_4/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/semtypinst.c -o src/2_4/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/semtypinst.c -o src/2_4/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/sigmatch.c -o src/2_4/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/sigmatch.c -o src/2_4/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/parampatterns.c -o src/2_4/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/parampatterns.c -o src/2_4/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/docgen.c -o src/2_4/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/docgen.c -o src/2_4/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/rstast.c -o src/2_4/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/rstast.c -o src/2_4/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/rst.c -o src/2_4/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/rst.c -o src/2_4/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/rstgen.c -o src/2_4/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/rstgen.c -o src/2_4/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/highlite.c -o src/2_4/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/highlite.c -o src/2_4/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/algorithm.c -o src/2_4/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/algorithm.c -o src/2_4/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/sequtils.c -o src/2_4/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/sequtils.c -o src/2_4/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/aliases.c -o src/2_4/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/aliases.c -o src/2_4/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/patterns.c -o src/2_4/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/patterns.c -o src/2_4/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/cgen.c -o src/2_4/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/cgen.c -o src/2_4/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/ccgutils.c -o src/2_4/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/ccgutils.c -o src/2_4/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/cgendata.c -o src/2_4/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/cgendata.c -o src/2_4/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/ccgmerge.c -o src/2_4/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/ccgmerge.c -o src/2_4/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/jsgen.c -o src/2_4/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/jsgen.c -o src/2_4/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/json.c -o src/2_4/json.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/json.c -o src/2_4/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/lexbase.c -o src/2_4/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/lexbase.c -o src/2_4/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/unicode.c -o src/2_4/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/unicode.c -o src/2_4/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/passaux.c -o src/2_4/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/passaux.c -o src/2_4/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/depends.c -o src/2_4/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/depends.c -o src/2_4/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/docgen2.c -o src/2_4/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/docgen2.c -o src/2_4/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/service.c -o src/2_4/service.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/service.c -o src/2_4/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/parseopt.c -o src/2_4/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/parseopt.c -o src/2_4/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/modules.c -o src/2_4/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/modules.c -o src/2_4/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/2_4/pretty.c -o src/2_4/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/2_4/pretty.c -o src/2_4/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/2_4/nimrod.o \
src/2_4/system.o \
src/2_4/commands.o \
src/2_4/os.o \
src/2_4/strutils.o \
src/2_4/parseutils.o \
src/2_4/times.o \
src/2_4/posix.o \
src/2_4/msgs.o \
src/2_4/options.o \
src/2_4/lists.o \
src/2_4/strtabs.o \
src/2_4/hashes.o \
src/2_4/tables.o \
src/2_4/math.o \
src/2_4/sockets.o \
src/2_4/ropes.o \
src/2_4/platform.o \
src/2_4/crc.o \
src/2_4/nversion.o \
src/2_4/condsyms.o \
src/2_4/idents.o \
src/2_4/extccomp.o \
src/2_4/osproc.o \
src/2_4/streams.o \
src/2_4/wordrecg.o \
src/2_4/babelcmd.o \
src/2_4/lexer.o \
src/2_4/nimlexbase.o \
src/2_4/llstream.o \
src/2_4/nimconf.o \
src/2_4/main.o \
src/2_4/ast.o \
src/2_4/intsets.o \
src/2_4/idgen.o \
src/2_4/astalgo.o \
src/2_4/rodutils.o \
src/2_4/syntaxes.o \
src/2_4/parser.o \
src/2_4/pbraces.o \
src/2_4/filters.o \
src/2_4/renderer.o \
src/2_4/filter_tmpl.o \
src/2_4/rodread.o \
src/2_4/types.o \
src/2_4/trees.o \
src/2_4/memfiles.o \
src/2_4/rodwrite.o \
src/2_4/passes.o \
src/2_4/magicsys.o \
src/2_4/nimsets.o \
src/2_4/bitsets.o \
src/2_4/semthreads.o \
src/2_4/importer.o \
src/2_4/lookups.o \
src/2_4/semdata.o \
src/2_4/treetab.o \
src/2_4/evals.o \
src/2_4/semfold.o \
src/2_4/saturate.o \
src/2_4/transf.o \
src/2_4/cgmeth.o \
src/2_4/sempass2.o \
src/2_4/guards.o \
src/2_4/lambdalifting.o \
src/2_4/evaltempl.o \
src/2_4/sem.o \
src/2_4/procfind.o \
src/2_4/pragmas.o \
src/2_4/semtypinst.o \
src/2_4/sigmatch.o \
src/2_4/parampatterns.o \
src/2_4/docgen.o \
src/2_4/rstast.o \
src/2_4/rst.o \
src/2_4/rstgen.o \
src/2_4/highlite.o \
src/2_4/algorithm.o \
src/2_4/sequtils.o \
src/2_4/aliases.o \
src/2_4/patterns.o \
src/2_4/cgen.o \
src/2_4/ccgutils.o \
src/2_4/cgendata.o \
src/2_4/ccgmerge.o \
src/2_4/jsgen.o \
src/2_4/json.o \
src/2_4/lexbase.o \
src/2_4/unicode.o \
src/2_4/passaux.o \
src/2_4/depends.o \
src/2_4/docgen2.o \
src/2_4/service.o \
src/2_4/parseopt.o \
src/2_4/modules.o \
src/2_4/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/2_4/nimrod.o \
src/2_4/system.o \
src/2_4/commands.o \
src/2_4/os.o \
src/2_4/strutils.o \
src/2_4/parseutils.o \
src/2_4/times.o \
src/2_4/posix.o \
src/2_4/msgs.o \
src/2_4/options.o \
src/2_4/lists.o \
src/2_4/strtabs.o \
src/2_4/hashes.o \
src/2_4/tables.o \
src/2_4/math.o \
src/2_4/sockets.o \
src/2_4/ropes.o \
src/2_4/platform.o \
src/2_4/crc.o \
src/2_4/nversion.o \
src/2_4/condsyms.o \
src/2_4/idents.o \
src/2_4/extccomp.o \
src/2_4/osproc.o \
src/2_4/streams.o \
src/2_4/wordrecg.o \
src/2_4/babelcmd.o \
src/2_4/lexer.o \
src/2_4/nimlexbase.o \
src/2_4/llstream.o \
src/2_4/nimconf.o \
src/2_4/main.o \
src/2_4/ast.o \
src/2_4/intsets.o \
src/2_4/idgen.o \
src/2_4/astalgo.o \
src/2_4/rodutils.o \
src/2_4/syntaxes.o \
src/2_4/parser.o \
src/2_4/pbraces.o \
src/2_4/filters.o \
src/2_4/renderer.o \
src/2_4/filter_tmpl.o \
src/2_4/rodread.o \
src/2_4/types.o \
src/2_4/trees.o \
src/2_4/memfiles.o \
src/2_4/rodwrite.o \
src/2_4/passes.o \
src/2_4/magicsys.o \
src/2_4/nimsets.o \
src/2_4/bitsets.o \
src/2_4/semthreads.o \
src/2_4/importer.o \
src/2_4/lookups.o \
src/2_4/semdata.o \
src/2_4/treetab.o \
src/2_4/evals.o \
src/2_4/semfold.o \
src/2_4/saturate.o \
src/2_4/transf.o \
src/2_4/cgmeth.o \
src/2_4/sempass2.o \
src/2_4/guards.o \
src/2_4/lambdalifting.o \
src/2_4/evaltempl.o \
src/2_4/sem.o \
src/2_4/procfind.o \
src/2_4/pragmas.o \
src/2_4/semtypinst.o \
src/2_4/sigmatch.o \
src/2_4/parampatterns.o \
src/2_4/docgen.o \
src/2_4/rstast.o \
src/2_4/rst.o \
src/2_4/rstgen.o \
src/2_4/highlite.o \
src/2_4/algorithm.o \
src/2_4/sequtils.o \
src/2_4/aliases.o \
src/2_4/patterns.o \
src/2_4/cgen.o \
src/2_4/ccgutils.o \
src/2_4/cgendata.o \
src/2_4/ccgmerge.o \
src/2_4/jsgen.o \
src/2_4/json.o \
src/2_4/lexbase.o \
src/2_4/unicode.o \
src/2_4/passaux.o \
src/2_4/depends.o \
src/2_4/docgen2.o \
src/2_4/service.o \
src/2_4/parseopt.o \
src/2_4/modules.o \
src/2_4/pretty.o $LINK_FLAGS
    ;;
  *)
    echo "Error: no C code generated for: [$myos: $mycpu]"
    exit 1
    ;;
  esac
  ;;
macosx) 
  case $mycpu in
  i386)
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/nimrod.c -o src/3_1/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/nimrod.c -o src/3_1/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/system.c -o src/3_1/system.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/system.c -o src/3_1/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/commands.c -o src/3_1/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/commands.c -o src/3_1/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/os.c -o src/3_1/os.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/os.c -o src/3_1/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/strutils.c -o src/3_1/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/strutils.c -o src/3_1/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/parseutils.c -o src/3_1/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/parseutils.c -o src/3_1/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/times.c -o src/3_1/times.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/times.c -o src/3_1/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/posix.c -o src/3_1/posix.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/posix.c -o src/3_1/posix.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/msgs.c -o src/3_1/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/msgs.c -o src/3_1/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/options.c -o src/3_1/options.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/options.c -o src/3_1/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/lists.c -o src/3_1/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/lists.c -o src/3_1/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/strtabs.c -o src/3_1/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/strtabs.c -o src/3_1/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/hashes.c -o src/3_1/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/hashes.c -o src/3_1/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/tables.c -o src/3_1/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/tables.c -o src/3_1/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/math.c -o src/3_1/math.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/math.c -o src/3_1/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/sockets.c -o src/3_1/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/sockets.c -o src/3_1/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/ropes.c -o src/3_1/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/ropes.c -o src/3_1/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/platform.c -o src/3_1/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/platform.c -o src/3_1/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/crc.c -o src/3_1/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/crc.c -o src/3_1/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/nversion.c -o src/3_1/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/nversion.c -o src/3_1/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/condsyms.c -o src/3_1/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/condsyms.c -o src/3_1/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/idents.c -o src/3_1/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/idents.c -o src/3_1/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/extccomp.c -o src/3_1/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/extccomp.c -o src/3_1/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/osproc.c -o src/3_1/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/osproc.c -o src/3_1/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/streams.c -o src/3_1/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/streams.c -o src/3_1/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/wordrecg.c -o src/3_1/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/wordrecg.c -o src/3_1/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/babelcmd.c -o src/3_1/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/babelcmd.c -o src/3_1/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/lexer.c -o src/3_1/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/lexer.c -o src/3_1/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/nimlexbase.c -o src/3_1/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/nimlexbase.c -o src/3_1/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/llstream.c -o src/3_1/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/llstream.c -o src/3_1/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/nimconf.c -o src/3_1/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/nimconf.c -o src/3_1/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/main.c -o src/3_1/main.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/main.c -o src/3_1/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/ast.c -o src/3_1/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/ast.c -o src/3_1/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/intsets.c -o src/3_1/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/intsets.c -o src/3_1/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/idgen.c -o src/3_1/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/idgen.c -o src/3_1/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/astalgo.c -o src/3_1/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/astalgo.c -o src/3_1/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/rodutils.c -o src/3_1/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/rodutils.c -o src/3_1/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/syntaxes.c -o src/3_1/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/syntaxes.c -o src/3_1/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/parser.c -o src/3_1/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/parser.c -o src/3_1/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/pbraces.c -o src/3_1/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/pbraces.c -o src/3_1/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/filters.c -o src/3_1/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/filters.c -o src/3_1/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/renderer.c -o src/3_1/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/renderer.c -o src/3_1/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/filter_tmpl.c -o src/3_1/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/filter_tmpl.c -o src/3_1/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/rodread.c -o src/3_1/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/rodread.c -o src/3_1/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/types.c -o src/3_1/types.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/types.c -o src/3_1/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/trees.c -o src/3_1/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/trees.c -o src/3_1/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/memfiles.c -o src/3_1/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/memfiles.c -o src/3_1/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/rodwrite.c -o src/3_1/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/rodwrite.c -o src/3_1/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/passes.c -o src/3_1/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/passes.c -o src/3_1/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/magicsys.c -o src/3_1/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/magicsys.c -o src/3_1/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/nimsets.c -o src/3_1/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/nimsets.c -o src/3_1/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/bitsets.c -o src/3_1/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/bitsets.c -o src/3_1/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/semthreads.c -o src/3_1/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/semthreads.c -o src/3_1/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/importer.c -o src/3_1/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/importer.c -o src/3_1/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/lookups.c -o src/3_1/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/lookups.c -o src/3_1/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/semdata.c -o src/3_1/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/semdata.c -o src/3_1/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/treetab.c -o src/3_1/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/treetab.c -o src/3_1/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/evals.c -o src/3_1/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/evals.c -o src/3_1/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/semfold.c -o src/3_1/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/semfold.c -o src/3_1/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/saturate.c -o src/3_1/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/saturate.c -o src/3_1/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/transf.c -o src/3_1/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/transf.c -o src/3_1/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/cgmeth.c -o src/3_1/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/cgmeth.c -o src/3_1/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/sempass2.c -o src/3_1/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/sempass2.c -o src/3_1/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/guards.c -o src/3_1/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/guards.c -o src/3_1/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/lambdalifting.c -o src/3_1/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/lambdalifting.c -o src/3_1/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/evaltempl.c -o src/3_1/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/evaltempl.c -o src/3_1/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/sem.c -o src/3_1/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/sem.c -o src/3_1/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/procfind.c -o src/3_1/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/procfind.c -o src/3_1/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/pragmas.c -o src/3_1/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/pragmas.c -o src/3_1/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/semtypinst.c -o src/3_1/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/semtypinst.c -o src/3_1/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/sigmatch.c -o src/3_1/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/sigmatch.c -o src/3_1/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/parampatterns.c -o src/3_1/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/parampatterns.c -o src/3_1/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/docgen.c -o src/3_1/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/docgen.c -o src/3_1/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/rstast.c -o src/3_1/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/rstast.c -o src/3_1/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/rst.c -o src/3_1/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/rst.c -o src/3_1/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/rstgen.c -o src/3_1/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/rstgen.c -o src/3_1/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/highlite.c -o src/3_1/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/highlite.c -o src/3_1/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/algorithm.c -o src/3_1/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/algorithm.c -o src/3_1/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/sequtils.c -o src/3_1/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/sequtils.c -o src/3_1/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/aliases.c -o src/3_1/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/aliases.c -o src/3_1/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/patterns.c -o src/3_1/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/patterns.c -o src/3_1/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/cgen.c -o src/3_1/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/cgen.c -o src/3_1/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/ccgutils.c -o src/3_1/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/ccgutils.c -o src/3_1/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/cgendata.c -o src/3_1/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/cgendata.c -o src/3_1/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/ccgmerge.c -o src/3_1/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/ccgmerge.c -o src/3_1/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/jsgen.c -o src/3_1/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/jsgen.c -o src/3_1/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/json.c -o src/3_1/json.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/json.c -o src/3_1/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/lexbase.c -o src/3_1/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/lexbase.c -o src/3_1/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/unicode.c -o src/3_1/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/unicode.c -o src/3_1/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/passaux.c -o src/3_1/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/passaux.c -o src/3_1/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/depends.c -o src/3_1/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/depends.c -o src/3_1/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/docgen2.c -o src/3_1/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/docgen2.c -o src/3_1/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/service.c -o src/3_1/service.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/service.c -o src/3_1/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/parseopt.c -o src/3_1/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/parseopt.c -o src/3_1/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/modules.c -o src/3_1/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/modules.c -o src/3_1/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_1/pretty.c -o src/3_1/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/3_1/pretty.c -o src/3_1/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/3_1/nimrod.o \
src/3_1/system.o \
src/3_1/commands.o \
src/3_1/os.o \
src/3_1/strutils.o \
src/3_1/parseutils.o \
src/3_1/times.o \
src/3_1/posix.o \
src/3_1/msgs.o \
src/3_1/options.o \
src/3_1/lists.o \
src/3_1/strtabs.o \
src/3_1/hashes.o \
src/3_1/tables.o \
src/3_1/math.o \
src/3_1/sockets.o \
src/3_1/ropes.o \
src/3_1/platform.o \
src/3_1/crc.o \
src/3_1/nversion.o \
src/3_1/condsyms.o \
src/3_1/idents.o \
src/3_1/extccomp.o \
src/3_1/osproc.o \
src/3_1/streams.o \
src/3_1/wordrecg.o \
src/3_1/babelcmd.o \
src/3_1/lexer.o \
src/3_1/nimlexbase.o \
src/3_1/llstream.o \
src/3_1/nimconf.o \
src/3_1/main.o \
src/3_1/ast.o \
src/3_1/intsets.o \
src/3_1/idgen.o \
src/3_1/astalgo.o \
src/3_1/rodutils.o \
src/3_1/syntaxes.o \
src/3_1/parser.o \
src/3_1/pbraces.o \
src/3_1/filters.o \
src/3_1/renderer.o \
src/3_1/filter_tmpl.o \
src/3_1/rodread.o \
src/3_1/types.o \
src/3_1/trees.o \
src/3_1/memfiles.o \
src/3_1/rodwrite.o \
src/3_1/passes.o \
src/3_1/magicsys.o \
src/3_1/nimsets.o \
src/3_1/bitsets.o \
src/3_1/semthreads.o \
src/3_1/importer.o \
src/3_1/lookups.o \
src/3_1/semdata.o \
src/3_1/treetab.o \
src/3_1/evals.o \
src/3_1/semfold.o \
src/3_1/saturate.o \
src/3_1/transf.o \
src/3_1/cgmeth.o \
src/3_1/sempass2.o \
src/3_1/guards.o \
src/3_1/lambdalifting.o \
src/3_1/evaltempl.o \
src/3_1/sem.o \
src/3_1/procfind.o \
src/3_1/pragmas.o \
src/3_1/semtypinst.o \
src/3_1/sigmatch.o \
src/3_1/parampatterns.o \
src/3_1/docgen.o \
src/3_1/rstast.o \
src/3_1/rst.o \
src/3_1/rstgen.o \
src/3_1/highlite.o \
src/3_1/algorithm.o \
src/3_1/sequtils.o \
src/3_1/aliases.o \
src/3_1/patterns.o \
src/3_1/cgen.o \
src/3_1/ccgutils.o \
src/3_1/cgendata.o \
src/3_1/ccgmerge.o \
src/3_1/jsgen.o \
src/3_1/json.o \
src/3_1/lexbase.o \
src/3_1/unicode.o \
src/3_1/passaux.o \
src/3_1/depends.o \
src/3_1/docgen2.o \
src/3_1/service.o \
src/3_1/parseopt.o \
src/3_1/modules.o \
src/3_1/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/3_1/nimrod.o \
src/3_1/system.o \
src/3_1/commands.o \
src/3_1/os.o \
src/3_1/strutils.o \
src/3_1/parseutils.o \
src/3_1/times.o \
src/3_1/posix.o \
src/3_1/msgs.o \
src/3_1/options.o \
src/3_1/lists.o \
src/3_1/strtabs.o \
src/3_1/hashes.o \
src/3_1/tables.o \
src/3_1/math.o \
src/3_1/sockets.o \
src/3_1/ropes.o \
src/3_1/platform.o \
src/3_1/crc.o \
src/3_1/nversion.o \
src/3_1/condsyms.o \
src/3_1/idents.o \
src/3_1/extccomp.o \
src/3_1/osproc.o \
src/3_1/streams.o \
src/3_1/wordrecg.o \
src/3_1/babelcmd.o \
src/3_1/lexer.o \
src/3_1/nimlexbase.o \
src/3_1/llstream.o \
src/3_1/nimconf.o \
src/3_1/main.o \
src/3_1/ast.o \
src/3_1/intsets.o \
src/3_1/idgen.o \
src/3_1/astalgo.o \
src/3_1/rodutils.o \
src/3_1/syntaxes.o \
src/3_1/parser.o \
src/3_1/pbraces.o \
src/3_1/filters.o \
src/3_1/renderer.o \
src/3_1/filter_tmpl.o \
src/3_1/rodread.o \
src/3_1/types.o \
src/3_1/trees.o \
src/3_1/memfiles.o \
src/3_1/rodwrite.o \
src/3_1/passes.o \
src/3_1/magicsys.o \
src/3_1/nimsets.o \
src/3_1/bitsets.o \
src/3_1/semthreads.o \
src/3_1/importer.o \
src/3_1/lookups.o \
src/3_1/semdata.o \
src/3_1/treetab.o \
src/3_1/evals.o \
src/3_1/semfold.o \
src/3_1/saturate.o \
src/3_1/transf.o \
src/3_1/cgmeth.o \
src/3_1/sempass2.o \
src/3_1/guards.o \
src/3_1/lambdalifting.o \
src/3_1/evaltempl.o \
src/3_1/sem.o \
src/3_1/procfind.o \
src/3_1/pragmas.o \
src/3_1/semtypinst.o \
src/3_1/sigmatch.o \
src/3_1/parampatterns.o \
src/3_1/docgen.o \
src/3_1/rstast.o \
src/3_1/rst.o \
src/3_1/rstgen.o \
src/3_1/highlite.o \
src/3_1/algorithm.o \
src/3_1/sequtils.o \
src/3_1/aliases.o \
src/3_1/patterns.o \
src/3_1/cgen.o \
src/3_1/ccgutils.o \
src/3_1/cgendata.o \
src/3_1/ccgmerge.o \
src/3_1/jsgen.o \
src/3_1/json.o \
src/3_1/lexbase.o \
src/3_1/unicode.o \
src/3_1/passaux.o \
src/3_1/depends.o \
src/3_1/docgen2.o \
src/3_1/service.o \
src/3_1/parseopt.o \
src/3_1/modules.o \
src/3_1/pretty.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/nimrod.c -o src/3_2/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/nimrod.c -o src/3_2/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/system.c -o src/3_2/system.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/system.c -o src/3_2/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/commands.c -o src/3_2/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/commands.c -o src/3_2/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/os.c -o src/3_2/os.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/os.c -o src/3_2/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/strutils.c -o src/3_2/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/strutils.c -o src/3_2/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/parseutils.c -o src/3_2/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/parseutils.c -o src/3_2/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/times.c -o src/3_2/times.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/times.c -o src/3_2/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/posix.c -o src/3_2/posix.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/posix.c -o src/3_2/posix.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/msgs.c -o src/3_2/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/msgs.c -o src/3_2/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/options.c -o src/3_2/options.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/options.c -o src/3_2/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/lists.c -o src/3_2/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/lists.c -o src/3_2/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/strtabs.c -o src/3_2/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/strtabs.c -o src/3_2/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/hashes.c -o src/3_2/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/hashes.c -o src/3_2/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/tables.c -o src/3_2/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/tables.c -o src/3_2/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/math.c -o src/3_2/math.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/math.c -o src/3_2/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/sockets.c -o src/3_2/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/sockets.c -o src/3_2/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/ropes.c -o src/3_2/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/ropes.c -o src/3_2/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/platform.c -o src/3_2/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/platform.c -o src/3_2/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/crc.c -o src/3_2/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/crc.c -o src/3_2/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/nversion.c -o src/3_2/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/nversion.c -o src/3_2/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/condsyms.c -o src/3_2/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/condsyms.c -o src/3_2/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/idents.c -o src/3_2/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/idents.c -o src/3_2/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/extccomp.c -o src/3_2/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/extccomp.c -o src/3_2/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/osproc.c -o src/3_2/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/osproc.c -o src/3_2/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/streams.c -o src/3_2/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/streams.c -o src/3_2/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/wordrecg.c -o src/3_2/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/wordrecg.c -o src/3_2/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/babelcmd.c -o src/3_2/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/babelcmd.c -o src/3_2/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/lexer.c -o src/3_2/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/lexer.c -o src/3_2/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/nimlexbase.c -o src/3_2/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/nimlexbase.c -o src/3_2/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/llstream.c -o src/3_2/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/llstream.c -o src/3_2/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/nimconf.c -o src/3_2/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/nimconf.c -o src/3_2/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/main.c -o src/3_2/main.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/main.c -o src/3_2/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/ast.c -o src/3_2/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/ast.c -o src/3_2/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/intsets.c -o src/3_2/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/intsets.c -o src/3_2/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/idgen.c -o src/3_2/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/idgen.c -o src/3_2/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/astalgo.c -o src/3_2/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/astalgo.c -o src/3_2/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/rodutils.c -o src/3_2/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/rodutils.c -o src/3_2/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/syntaxes.c -o src/3_2/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/syntaxes.c -o src/3_2/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/parser.c -o src/3_2/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/parser.c -o src/3_2/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/pbraces.c -o src/3_2/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/pbraces.c -o src/3_2/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/filters.c -o src/3_2/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/filters.c -o src/3_2/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/renderer.c -o src/3_2/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/renderer.c -o src/3_2/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/filter_tmpl.c -o src/3_2/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/filter_tmpl.c -o src/3_2/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/rodread.c -o src/3_2/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/rodread.c -o src/3_2/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/types.c -o src/3_2/types.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/types.c -o src/3_2/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/trees.c -o src/3_2/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/trees.c -o src/3_2/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/memfiles.c -o src/3_2/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/memfiles.c -o src/3_2/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/rodwrite.c -o src/3_2/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/rodwrite.c -o src/3_2/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/passes.c -o src/3_2/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/passes.c -o src/3_2/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/magicsys.c -o src/3_2/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/magicsys.c -o src/3_2/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/nimsets.c -o src/3_2/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/nimsets.c -o src/3_2/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/bitsets.c -o src/3_2/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/bitsets.c -o src/3_2/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/semthreads.c -o src/3_2/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/semthreads.c -o src/3_2/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/importer.c -o src/3_2/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/importer.c -o src/3_2/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/lookups.c -o src/3_2/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/lookups.c -o src/3_2/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/semdata.c -o src/3_2/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/semdata.c -o src/3_2/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/treetab.c -o src/3_2/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/treetab.c -o src/3_2/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/evals.c -o src/3_2/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/evals.c -o src/3_2/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/semfold.c -o src/3_2/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/semfold.c -o src/3_2/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/saturate.c -o src/3_2/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/saturate.c -o src/3_2/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/transf.c -o src/3_2/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/transf.c -o src/3_2/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/cgmeth.c -o src/3_2/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/cgmeth.c -o src/3_2/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/sempass2.c -o src/3_2/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/sempass2.c -o src/3_2/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/guards.c -o src/3_2/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/guards.c -o src/3_2/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/lambdalifting.c -o src/3_2/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/lambdalifting.c -o src/3_2/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/evaltempl.c -o src/3_2/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/evaltempl.c -o src/3_2/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/sem.c -o src/3_2/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/sem.c -o src/3_2/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/procfind.c -o src/3_2/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/procfind.c -o src/3_2/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/pragmas.c -o src/3_2/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/pragmas.c -o src/3_2/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/semtypinst.c -o src/3_2/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/semtypinst.c -o src/3_2/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/sigmatch.c -o src/3_2/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/sigmatch.c -o src/3_2/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/parampatterns.c -o src/3_2/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/parampatterns.c -o src/3_2/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/docgen.c -o src/3_2/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/docgen.c -o src/3_2/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/rstast.c -o src/3_2/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/rstast.c -o src/3_2/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/rst.c -o src/3_2/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/rst.c -o src/3_2/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/rstgen.c -o src/3_2/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/rstgen.c -o src/3_2/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/highlite.c -o src/3_2/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/highlite.c -o src/3_2/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/algorithm.c -o src/3_2/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/algorithm.c -o src/3_2/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/sequtils.c -o src/3_2/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/sequtils.c -o src/3_2/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/aliases.c -o src/3_2/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/aliases.c -o src/3_2/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/patterns.c -o src/3_2/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/patterns.c -o src/3_2/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/cgen.c -o src/3_2/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/cgen.c -o src/3_2/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/ccgutils.c -o src/3_2/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/ccgutils.c -o src/3_2/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/cgendata.c -o src/3_2/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/cgendata.c -o src/3_2/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/ccgmerge.c -o src/3_2/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/ccgmerge.c -o src/3_2/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/jsgen.c -o src/3_2/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/jsgen.c -o src/3_2/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/json.c -o src/3_2/json.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/json.c -o src/3_2/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/lexbase.c -o src/3_2/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/lexbase.c -o src/3_2/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/unicode.c -o src/3_2/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/unicode.c -o src/3_2/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/passaux.c -o src/3_2/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/passaux.c -o src/3_2/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/depends.c -o src/3_2/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/depends.c -o src/3_2/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/docgen2.c -o src/3_2/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/docgen2.c -o src/3_2/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/service.c -o src/3_2/service.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/service.c -o src/3_2/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/parseopt.c -o src/3_2/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/parseopt.c -o src/3_2/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/modules.c -o src/3_2/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/modules.c -o src/3_2/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_2/pretty.c -o src/3_2/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/3_2/pretty.c -o src/3_2/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/3_2/nimrod.o \
src/3_2/system.o \
src/3_2/commands.o \
src/3_2/os.o \
src/3_2/strutils.o \
src/3_2/parseutils.o \
src/3_2/times.o \
src/3_2/posix.o \
src/3_2/msgs.o \
src/3_2/options.o \
src/3_2/lists.o \
src/3_2/strtabs.o \
src/3_2/hashes.o \
src/3_2/tables.o \
src/3_2/math.o \
src/3_2/sockets.o \
src/3_2/ropes.o \
src/3_2/platform.o \
src/3_2/crc.o \
src/3_2/nversion.o \
src/3_2/condsyms.o \
src/3_2/idents.o \
src/3_2/extccomp.o \
src/3_2/osproc.o \
src/3_2/streams.o \
src/3_2/wordrecg.o \
src/3_2/babelcmd.o \
src/3_2/lexer.o \
src/3_2/nimlexbase.o \
src/3_2/llstream.o \
src/3_2/nimconf.o \
src/3_2/main.o \
src/3_2/ast.o \
src/3_2/intsets.o \
src/3_2/idgen.o \
src/3_2/astalgo.o \
src/3_2/rodutils.o \
src/3_2/syntaxes.o \
src/3_2/parser.o \
src/3_2/pbraces.o \
src/3_2/filters.o \
src/3_2/renderer.o \
src/3_2/filter_tmpl.o \
src/3_2/rodread.o \
src/3_2/types.o \
src/3_2/trees.o \
src/3_2/memfiles.o \
src/3_2/rodwrite.o \
src/3_2/passes.o \
src/3_2/magicsys.o \
src/3_2/nimsets.o \
src/3_2/bitsets.o \
src/3_2/semthreads.o \
src/3_2/importer.o \
src/3_2/lookups.o \
src/3_2/semdata.o \
src/3_2/treetab.o \
src/3_2/evals.o \
src/3_2/semfold.o \
src/3_2/saturate.o \
src/3_2/transf.o \
src/3_2/cgmeth.o \
src/3_2/sempass2.o \
src/3_2/guards.o \
src/3_2/lambdalifting.o \
src/3_2/evaltempl.o \
src/3_2/sem.o \
src/3_2/procfind.o \
src/3_2/pragmas.o \
src/3_2/semtypinst.o \
src/3_2/sigmatch.o \
src/3_2/parampatterns.o \
src/3_2/docgen.o \
src/3_2/rstast.o \
src/3_2/rst.o \
src/3_2/rstgen.o \
src/3_2/highlite.o \
src/3_2/algorithm.o \
src/3_2/sequtils.o \
src/3_2/aliases.o \
src/3_2/patterns.o \
src/3_2/cgen.o \
src/3_2/ccgutils.o \
src/3_2/cgendata.o \
src/3_2/ccgmerge.o \
src/3_2/jsgen.o \
src/3_2/json.o \
src/3_2/lexbase.o \
src/3_2/unicode.o \
src/3_2/passaux.o \
src/3_2/depends.o \
src/3_2/docgen2.o \
src/3_2/service.o \
src/3_2/parseopt.o \
src/3_2/modules.o \
src/3_2/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/3_2/nimrod.o \
src/3_2/system.o \
src/3_2/commands.o \
src/3_2/os.o \
src/3_2/strutils.o \
src/3_2/parseutils.o \
src/3_2/times.o \
src/3_2/posix.o \
src/3_2/msgs.o \
src/3_2/options.o \
src/3_2/lists.o \
src/3_2/strtabs.o \
src/3_2/hashes.o \
src/3_2/tables.o \
src/3_2/math.o \
src/3_2/sockets.o \
src/3_2/ropes.o \
src/3_2/platform.o \
src/3_2/crc.o \
src/3_2/nversion.o \
src/3_2/condsyms.o \
src/3_2/idents.o \
src/3_2/extccomp.o \
src/3_2/osproc.o \
src/3_2/streams.o \
src/3_2/wordrecg.o \
src/3_2/babelcmd.o \
src/3_2/lexer.o \
src/3_2/nimlexbase.o \
src/3_2/llstream.o \
src/3_2/nimconf.o \
src/3_2/main.o \
src/3_2/ast.o \
src/3_2/intsets.o \
src/3_2/idgen.o \
src/3_2/astalgo.o \
src/3_2/rodutils.o \
src/3_2/syntaxes.o \
src/3_2/parser.o \
src/3_2/pbraces.o \
src/3_2/filters.o \
src/3_2/renderer.o \
src/3_2/filter_tmpl.o \
src/3_2/rodread.o \
src/3_2/types.o \
src/3_2/trees.o \
src/3_2/memfiles.o \
src/3_2/rodwrite.o \
src/3_2/passes.o \
src/3_2/magicsys.o \
src/3_2/nimsets.o \
src/3_2/bitsets.o \
src/3_2/semthreads.o \
src/3_2/importer.o \
src/3_2/lookups.o \
src/3_2/semdata.o \
src/3_2/treetab.o \
src/3_2/evals.o \
src/3_2/semfold.o \
src/3_2/saturate.o \
src/3_2/transf.o \
src/3_2/cgmeth.o \
src/3_2/sempass2.o \
src/3_2/guards.o \
src/3_2/lambdalifting.o \
src/3_2/evaltempl.o \
src/3_2/sem.o \
src/3_2/procfind.o \
src/3_2/pragmas.o \
src/3_2/semtypinst.o \
src/3_2/sigmatch.o \
src/3_2/parampatterns.o \
src/3_2/docgen.o \
src/3_2/rstast.o \
src/3_2/rst.o \
src/3_2/rstgen.o \
src/3_2/highlite.o \
src/3_2/algorithm.o \
src/3_2/sequtils.o \
src/3_2/aliases.o \
src/3_2/patterns.o \
src/3_2/cgen.o \
src/3_2/ccgutils.o \
src/3_2/cgendata.o \
src/3_2/ccgmerge.o \
src/3_2/jsgen.o \
src/3_2/json.o \
src/3_2/lexbase.o \
src/3_2/unicode.o \
src/3_2/passaux.o \
src/3_2/depends.o \
src/3_2/docgen2.o \
src/3_2/service.o \
src/3_2/parseopt.o \
src/3_2/modules.o \
src/3_2/pretty.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/nimrod.c -o src/3_3/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/nimrod.c -o src/3_3/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/system.c -o src/3_3/system.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/system.c -o src/3_3/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/commands.c -o src/3_3/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/commands.c -o src/3_3/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/os.c -o src/3_3/os.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/os.c -o src/3_3/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/strutils.c -o src/3_3/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/strutils.c -o src/3_3/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/parseutils.c -o src/3_3/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/parseutils.c -o src/3_3/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/times.c -o src/3_3/times.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/times.c -o src/3_3/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/posix.c -o src/3_3/posix.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/posix.c -o src/3_3/posix.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/msgs.c -o src/3_3/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/msgs.c -o src/3_3/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/options.c -o src/3_3/options.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/options.c -o src/3_3/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/lists.c -o src/3_3/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/lists.c -o src/3_3/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/strtabs.c -o src/3_3/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/strtabs.c -o src/3_3/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/hashes.c -o src/3_3/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/hashes.c -o src/3_3/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/tables.c -o src/3_3/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/tables.c -o src/3_3/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/math.c -o src/3_3/math.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/math.c -o src/3_3/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/sockets.c -o src/3_3/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/sockets.c -o src/3_3/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/ropes.c -o src/3_3/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/ropes.c -o src/3_3/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/platform.c -o src/3_3/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/platform.c -o src/3_3/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/crc.c -o src/3_3/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/crc.c -o src/3_3/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/nversion.c -o src/3_3/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/nversion.c -o src/3_3/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/condsyms.c -o src/3_3/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/condsyms.c -o src/3_3/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/idents.c -o src/3_3/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/idents.c -o src/3_3/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/extccomp.c -o src/3_3/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/extccomp.c -o src/3_3/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/osproc.c -o src/3_3/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/osproc.c -o src/3_3/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/streams.c -o src/3_3/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/streams.c -o src/3_3/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/wordrecg.c -o src/3_3/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/wordrecg.c -o src/3_3/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/babelcmd.c -o src/3_3/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/babelcmd.c -o src/3_3/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/lexer.c -o src/3_3/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/lexer.c -o src/3_3/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/nimlexbase.c -o src/3_3/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/nimlexbase.c -o src/3_3/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/llstream.c -o src/3_3/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/llstream.c -o src/3_3/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/nimconf.c -o src/3_3/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/nimconf.c -o src/3_3/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/main.c -o src/3_3/main.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/main.c -o src/3_3/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/ast.c -o src/3_3/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/ast.c -o src/3_3/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/intsets.c -o src/3_3/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/intsets.c -o src/3_3/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/idgen.c -o src/3_3/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/idgen.c -o src/3_3/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/astalgo.c -o src/3_3/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/astalgo.c -o src/3_3/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/rodutils.c -o src/3_3/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/rodutils.c -o src/3_3/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/syntaxes.c -o src/3_3/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/syntaxes.c -o src/3_3/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/parser.c -o src/3_3/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/parser.c -o src/3_3/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/pbraces.c -o src/3_3/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/pbraces.c -o src/3_3/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/filters.c -o src/3_3/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/filters.c -o src/3_3/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/renderer.c -o src/3_3/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/renderer.c -o src/3_3/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/filter_tmpl.c -o src/3_3/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/filter_tmpl.c -o src/3_3/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/rodread.c -o src/3_3/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/rodread.c -o src/3_3/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/types.c -o src/3_3/types.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/types.c -o src/3_3/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/trees.c -o src/3_3/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/trees.c -o src/3_3/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/memfiles.c -o src/3_3/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/memfiles.c -o src/3_3/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/rodwrite.c -o src/3_3/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/rodwrite.c -o src/3_3/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/passes.c -o src/3_3/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/passes.c -o src/3_3/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/magicsys.c -o src/3_3/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/magicsys.c -o src/3_3/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/nimsets.c -o src/3_3/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/nimsets.c -o src/3_3/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/bitsets.c -o src/3_3/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/bitsets.c -o src/3_3/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/semthreads.c -o src/3_3/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/semthreads.c -o src/3_3/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/importer.c -o src/3_3/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/importer.c -o src/3_3/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/lookups.c -o src/3_3/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/lookups.c -o src/3_3/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/semdata.c -o src/3_3/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/semdata.c -o src/3_3/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/treetab.c -o src/3_3/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/treetab.c -o src/3_3/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/evals.c -o src/3_3/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/evals.c -o src/3_3/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/semfold.c -o src/3_3/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/semfold.c -o src/3_3/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/saturate.c -o src/3_3/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/saturate.c -o src/3_3/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/transf.c -o src/3_3/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/transf.c -o src/3_3/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/cgmeth.c -o src/3_3/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/cgmeth.c -o src/3_3/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/sempass2.c -o src/3_3/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/sempass2.c -o src/3_3/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/guards.c -o src/3_3/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/guards.c -o src/3_3/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/lambdalifting.c -o src/3_3/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/lambdalifting.c -o src/3_3/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/evaltempl.c -o src/3_3/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/evaltempl.c -o src/3_3/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/sem.c -o src/3_3/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/sem.c -o src/3_3/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/procfind.c -o src/3_3/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/procfind.c -o src/3_3/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/pragmas.c -o src/3_3/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/pragmas.c -o src/3_3/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/semtypinst.c -o src/3_3/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/semtypinst.c -o src/3_3/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/sigmatch.c -o src/3_3/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/sigmatch.c -o src/3_3/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/parampatterns.c -o src/3_3/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/parampatterns.c -o src/3_3/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/docgen.c -o src/3_3/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/docgen.c -o src/3_3/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/rstast.c -o src/3_3/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/rstast.c -o src/3_3/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/rst.c -o src/3_3/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/rst.c -o src/3_3/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/rstgen.c -o src/3_3/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/rstgen.c -o src/3_3/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/highlite.c -o src/3_3/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/highlite.c -o src/3_3/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/algorithm.c -o src/3_3/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/algorithm.c -o src/3_3/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/sequtils.c -o src/3_3/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/sequtils.c -o src/3_3/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/aliases.c -o src/3_3/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/aliases.c -o src/3_3/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/patterns.c -o src/3_3/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/patterns.c -o src/3_3/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/cgen.c -o src/3_3/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/cgen.c -o src/3_3/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/ccgutils.c -o src/3_3/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/ccgutils.c -o src/3_3/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/cgendata.c -o src/3_3/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/cgendata.c -o src/3_3/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/ccgmerge.c -o src/3_3/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/ccgmerge.c -o src/3_3/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/jsgen.c -o src/3_3/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/jsgen.c -o src/3_3/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/json.c -o src/3_3/json.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/json.c -o src/3_3/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/lexbase.c -o src/3_3/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/lexbase.c -o src/3_3/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/unicode.c -o src/3_3/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/unicode.c -o src/3_3/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/passaux.c -o src/3_3/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/passaux.c -o src/3_3/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/depends.c -o src/3_3/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/depends.c -o src/3_3/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/docgen2.c -o src/3_3/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/docgen2.c -o src/3_3/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/service.c -o src/3_3/service.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/service.c -o src/3_3/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/parseopt.c -o src/3_3/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/parseopt.c -o src/3_3/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/modules.c -o src/3_3/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/modules.c -o src/3_3/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_3/pretty.c -o src/3_3/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/3_3/pretty.c -o src/3_3/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/3_3/nimrod.o \
src/3_3/system.o \
src/3_3/commands.o \
src/3_3/os.o \
src/3_3/strutils.o \
src/3_3/parseutils.o \
src/3_3/times.o \
src/3_3/posix.o \
src/3_3/msgs.o \
src/3_3/options.o \
src/3_3/lists.o \
src/3_3/strtabs.o \
src/3_3/hashes.o \
src/3_3/tables.o \
src/3_3/math.o \
src/3_3/sockets.o \
src/3_3/ropes.o \
src/3_3/platform.o \
src/3_3/crc.o \
src/3_3/nversion.o \
src/3_3/condsyms.o \
src/3_3/idents.o \
src/3_3/extccomp.o \
src/3_3/osproc.o \
src/3_3/streams.o \
src/3_3/wordrecg.o \
src/3_3/babelcmd.o \
src/3_3/lexer.o \
src/3_3/nimlexbase.o \
src/3_3/llstream.o \
src/3_3/nimconf.o \
src/3_3/main.o \
src/3_3/ast.o \
src/3_3/intsets.o \
src/3_3/idgen.o \
src/3_3/astalgo.o \
src/3_3/rodutils.o \
src/3_3/syntaxes.o \
src/3_3/parser.o \
src/3_3/pbraces.o \
src/3_3/filters.o \
src/3_3/renderer.o \
src/3_3/filter_tmpl.o \
src/3_3/rodread.o \
src/3_3/types.o \
src/3_3/trees.o \
src/3_3/memfiles.o \
src/3_3/rodwrite.o \
src/3_3/passes.o \
src/3_3/magicsys.o \
src/3_3/nimsets.o \
src/3_3/bitsets.o \
src/3_3/semthreads.o \
src/3_3/importer.o \
src/3_3/lookups.o \
src/3_3/semdata.o \
src/3_3/treetab.o \
src/3_3/evals.o \
src/3_3/semfold.o \
src/3_3/saturate.o \
src/3_3/transf.o \
src/3_3/cgmeth.o \
src/3_3/sempass2.o \
src/3_3/guards.o \
src/3_3/lambdalifting.o \
src/3_3/evaltempl.o \
src/3_3/sem.o \
src/3_3/procfind.o \
src/3_3/pragmas.o \
src/3_3/semtypinst.o \
src/3_3/sigmatch.o \
src/3_3/parampatterns.o \
src/3_3/docgen.o \
src/3_3/rstast.o \
src/3_3/rst.o \
src/3_3/rstgen.o \
src/3_3/highlite.o \
src/3_3/algorithm.o \
src/3_3/sequtils.o \
src/3_3/aliases.o \
src/3_3/patterns.o \
src/3_3/cgen.o \
src/3_3/ccgutils.o \
src/3_3/cgendata.o \
src/3_3/ccgmerge.o \
src/3_3/jsgen.o \
src/3_3/json.o \
src/3_3/lexbase.o \
src/3_3/unicode.o \
src/3_3/passaux.o \
src/3_3/depends.o \
src/3_3/docgen2.o \
src/3_3/service.o \
src/3_3/parseopt.o \
src/3_3/modules.o \
src/3_3/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/3_3/nimrod.o \
src/3_3/system.o \
src/3_3/commands.o \
src/3_3/os.o \
src/3_3/strutils.o \
src/3_3/parseutils.o \
src/3_3/times.o \
src/3_3/posix.o \
src/3_3/msgs.o \
src/3_3/options.o \
src/3_3/lists.o \
src/3_3/strtabs.o \
src/3_3/hashes.o \
src/3_3/tables.o \
src/3_3/math.o \
src/3_3/sockets.o \
src/3_3/ropes.o \
src/3_3/platform.o \
src/3_3/crc.o \
src/3_3/nversion.o \
src/3_3/condsyms.o \
src/3_3/idents.o \
src/3_3/extccomp.o \
src/3_3/osproc.o \
src/3_3/streams.o \
src/3_3/wordrecg.o \
src/3_3/babelcmd.o \
src/3_3/lexer.o \
src/3_3/nimlexbase.o \
src/3_3/llstream.o \
src/3_3/nimconf.o \
src/3_3/main.o \
src/3_3/ast.o \
src/3_3/intsets.o \
src/3_3/idgen.o \
src/3_3/astalgo.o \
src/3_3/rodutils.o \
src/3_3/syntaxes.o \
src/3_3/parser.o \
src/3_3/pbraces.o \
src/3_3/filters.o \
src/3_3/renderer.o \
src/3_3/filter_tmpl.o \
src/3_3/rodread.o \
src/3_3/types.o \
src/3_3/trees.o \
src/3_3/memfiles.o \
src/3_3/rodwrite.o \
src/3_3/passes.o \
src/3_3/magicsys.o \
src/3_3/nimsets.o \
src/3_3/bitsets.o \
src/3_3/semthreads.o \
src/3_3/importer.o \
src/3_3/lookups.o \
src/3_3/semdata.o \
src/3_3/treetab.o \
src/3_3/evals.o \
src/3_3/semfold.o \
src/3_3/saturate.o \
src/3_3/transf.o \
src/3_3/cgmeth.o \
src/3_3/sempass2.o \
src/3_3/guards.o \
src/3_3/lambdalifting.o \
src/3_3/evaltempl.o \
src/3_3/sem.o \
src/3_3/procfind.o \
src/3_3/pragmas.o \
src/3_3/semtypinst.o \
src/3_3/sigmatch.o \
src/3_3/parampatterns.o \
src/3_3/docgen.o \
src/3_3/rstast.o \
src/3_3/rst.o \
src/3_3/rstgen.o \
src/3_3/highlite.o \
src/3_3/algorithm.o \
src/3_3/sequtils.o \
src/3_3/aliases.o \
src/3_3/patterns.o \
src/3_3/cgen.o \
src/3_3/ccgutils.o \
src/3_3/cgendata.o \
src/3_3/ccgmerge.o \
src/3_3/jsgen.o \
src/3_3/json.o \
src/3_3/lexbase.o \
src/3_3/unicode.o \
src/3_3/passaux.o \
src/3_3/depends.o \
src/3_3/docgen2.o \
src/3_3/service.o \
src/3_3/parseopt.o \
src/3_3/modules.o \
src/3_3/pretty.o $LINK_FLAGS
    ;;
  arm)
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/nimrod.c -o src/3_4/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/nimrod.c -o src/3_4/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/system.c -o src/3_4/system.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/system.c -o src/3_4/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/commands.c -o src/3_4/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/commands.c -o src/3_4/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/os.c -o src/3_4/os.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/os.c -o src/3_4/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/strutils.c -o src/3_4/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/strutils.c -o src/3_4/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/parseutils.c -o src/3_4/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/parseutils.c -o src/3_4/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/times.c -o src/3_4/times.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/times.c -o src/3_4/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/posix.c -o src/3_4/posix.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/posix.c -o src/3_4/posix.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/msgs.c -o src/3_4/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/msgs.c -o src/3_4/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/options.c -o src/3_4/options.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/options.c -o src/3_4/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/lists.c -o src/3_4/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/lists.c -o src/3_4/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/strtabs.c -o src/3_4/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/strtabs.c -o src/3_4/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/hashes.c -o src/3_4/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/hashes.c -o src/3_4/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/tables.c -o src/3_4/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/tables.c -o src/3_4/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/math.c -o src/3_4/math.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/math.c -o src/3_4/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/sockets.c -o src/3_4/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/sockets.c -o src/3_4/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/ropes.c -o src/3_4/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/ropes.c -o src/3_4/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/platform.c -o src/3_4/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/platform.c -o src/3_4/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/crc.c -o src/3_4/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/crc.c -o src/3_4/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/nversion.c -o src/3_4/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/nversion.c -o src/3_4/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/condsyms.c -o src/3_4/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/condsyms.c -o src/3_4/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/idents.c -o src/3_4/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/idents.c -o src/3_4/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/extccomp.c -o src/3_4/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/extccomp.c -o src/3_4/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/osproc.c -o src/3_4/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/osproc.c -o src/3_4/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/streams.c -o src/3_4/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/streams.c -o src/3_4/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/wordrecg.c -o src/3_4/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/wordrecg.c -o src/3_4/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/babelcmd.c -o src/3_4/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/babelcmd.c -o src/3_4/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/lexer.c -o src/3_4/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/lexer.c -o src/3_4/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/nimlexbase.c -o src/3_4/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/nimlexbase.c -o src/3_4/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/llstream.c -o src/3_4/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/llstream.c -o src/3_4/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/nimconf.c -o src/3_4/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/nimconf.c -o src/3_4/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/main.c -o src/3_4/main.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/main.c -o src/3_4/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/ast.c -o src/3_4/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/ast.c -o src/3_4/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/intsets.c -o src/3_4/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/intsets.c -o src/3_4/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/idgen.c -o src/3_4/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/idgen.c -o src/3_4/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/astalgo.c -o src/3_4/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/astalgo.c -o src/3_4/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/rodutils.c -o src/3_4/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/rodutils.c -o src/3_4/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/syntaxes.c -o src/3_4/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/syntaxes.c -o src/3_4/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/parser.c -o src/3_4/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/parser.c -o src/3_4/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/pbraces.c -o src/3_4/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/pbraces.c -o src/3_4/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/filters.c -o src/3_4/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/filters.c -o src/3_4/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/renderer.c -o src/3_4/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/renderer.c -o src/3_4/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/filter_tmpl.c -o src/3_4/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/filter_tmpl.c -o src/3_4/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/rodread.c -o src/3_4/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/rodread.c -o src/3_4/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/types.c -o src/3_4/types.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/types.c -o src/3_4/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/trees.c -o src/3_4/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/trees.c -o src/3_4/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/memfiles.c -o src/3_4/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/memfiles.c -o src/3_4/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/rodwrite.c -o src/3_4/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/rodwrite.c -o src/3_4/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/passes.c -o src/3_4/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/passes.c -o src/3_4/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/magicsys.c -o src/3_4/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/magicsys.c -o src/3_4/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/nimsets.c -o src/3_4/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/nimsets.c -o src/3_4/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/bitsets.c -o src/3_4/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/bitsets.c -o src/3_4/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/semthreads.c -o src/3_4/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/semthreads.c -o src/3_4/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/importer.c -o src/3_4/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/importer.c -o src/3_4/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/lookups.c -o src/3_4/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/lookups.c -o src/3_4/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/semdata.c -o src/3_4/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/semdata.c -o src/3_4/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/treetab.c -o src/3_4/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/treetab.c -o src/3_4/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/evals.c -o src/3_4/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/evals.c -o src/3_4/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/semfold.c -o src/3_4/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/semfold.c -o src/3_4/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/saturate.c -o src/3_4/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/saturate.c -o src/3_4/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/transf.c -o src/3_4/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/transf.c -o src/3_4/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/cgmeth.c -o src/3_4/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/cgmeth.c -o src/3_4/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/sempass2.c -o src/3_4/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/sempass2.c -o src/3_4/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/guards.c -o src/3_4/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/guards.c -o src/3_4/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/lambdalifting.c -o src/3_4/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/lambdalifting.c -o src/3_4/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/evaltempl.c -o src/3_4/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/evaltempl.c -o src/3_4/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/sem.c -o src/3_4/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/sem.c -o src/3_4/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/procfind.c -o src/3_4/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/procfind.c -o src/3_4/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/pragmas.c -o src/3_4/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/pragmas.c -o src/3_4/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/semtypinst.c -o src/3_4/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/semtypinst.c -o src/3_4/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/sigmatch.c -o src/3_4/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/sigmatch.c -o src/3_4/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/parampatterns.c -o src/3_4/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/parampatterns.c -o src/3_4/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/docgen.c -o src/3_4/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/docgen.c -o src/3_4/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/rstast.c -o src/3_4/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/rstast.c -o src/3_4/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/rst.c -o src/3_4/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/rst.c -o src/3_4/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/rstgen.c -o src/3_4/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/rstgen.c -o src/3_4/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/highlite.c -o src/3_4/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/highlite.c -o src/3_4/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/algorithm.c -o src/3_4/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/algorithm.c -o src/3_4/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/sequtils.c -o src/3_4/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/sequtils.c -o src/3_4/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/aliases.c -o src/3_4/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/aliases.c -o src/3_4/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/patterns.c -o src/3_4/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/patterns.c -o src/3_4/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/cgen.c -o src/3_4/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/cgen.c -o src/3_4/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/ccgutils.c -o src/3_4/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/ccgutils.c -o src/3_4/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/cgendata.c -o src/3_4/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/cgendata.c -o src/3_4/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/ccgmerge.c -o src/3_4/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/ccgmerge.c -o src/3_4/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/jsgen.c -o src/3_4/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/jsgen.c -o src/3_4/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/json.c -o src/3_4/json.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/json.c -o src/3_4/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/lexbase.c -o src/3_4/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/lexbase.c -o src/3_4/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/unicode.c -o src/3_4/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/unicode.c -o src/3_4/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/passaux.c -o src/3_4/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/passaux.c -o src/3_4/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/depends.c -o src/3_4/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/depends.c -o src/3_4/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/docgen2.c -o src/3_4/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/docgen2.c -o src/3_4/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/service.c -o src/3_4/service.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/service.c -o src/3_4/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/parseopt.c -o src/3_4/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/parseopt.c -o src/3_4/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/modules.c -o src/3_4/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/modules.c -o src/3_4/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/3_4/pretty.c -o src/3_4/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/3_4/pretty.c -o src/3_4/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/3_4/nimrod.o \
src/3_4/system.o \
src/3_4/commands.o \
src/3_4/os.o \
src/3_4/strutils.o \
src/3_4/parseutils.o \
src/3_4/times.o \
src/3_4/posix.o \
src/3_4/msgs.o \
src/3_4/options.o \
src/3_4/lists.o \
src/3_4/strtabs.o \
src/3_4/hashes.o \
src/3_4/tables.o \
src/3_4/math.o \
src/3_4/sockets.o \
src/3_4/ropes.o \
src/3_4/platform.o \
src/3_4/crc.o \
src/3_4/nversion.o \
src/3_4/condsyms.o \
src/3_4/idents.o \
src/3_4/extccomp.o \
src/3_4/osproc.o \
src/3_4/streams.o \
src/3_4/wordrecg.o \
src/3_4/babelcmd.o \
src/3_4/lexer.o \
src/3_4/nimlexbase.o \
src/3_4/llstream.o \
src/3_4/nimconf.o \
src/3_4/main.o \
src/3_4/ast.o \
src/3_4/intsets.o \
src/3_4/idgen.o \
src/3_4/astalgo.o \
src/3_4/rodutils.o \
src/3_4/syntaxes.o \
src/3_4/parser.o \
src/3_4/pbraces.o \
src/3_4/filters.o \
src/3_4/renderer.o \
src/3_4/filter_tmpl.o \
src/3_4/rodread.o \
src/3_4/types.o \
src/3_4/trees.o \
src/3_4/memfiles.o \
src/3_4/rodwrite.o \
src/3_4/passes.o \
src/3_4/magicsys.o \
src/3_4/nimsets.o \
src/3_4/bitsets.o \
src/3_4/semthreads.o \
src/3_4/importer.o \
src/3_4/lookups.o \
src/3_4/semdata.o \
src/3_4/treetab.o \
src/3_4/evals.o \
src/3_4/semfold.o \
src/3_4/saturate.o \
src/3_4/transf.o \
src/3_4/cgmeth.o \
src/3_4/sempass2.o \
src/3_4/guards.o \
src/3_4/lambdalifting.o \
src/3_4/evaltempl.o \
src/3_4/sem.o \
src/3_4/procfind.o \
src/3_4/pragmas.o \
src/3_4/semtypinst.o \
src/3_4/sigmatch.o \
src/3_4/parampatterns.o \
src/3_4/docgen.o \
src/3_4/rstast.o \
src/3_4/rst.o \
src/3_4/rstgen.o \
src/3_4/highlite.o \
src/3_4/algorithm.o \
src/3_4/sequtils.o \
src/3_4/aliases.o \
src/3_4/patterns.o \
src/3_4/cgen.o \
src/3_4/ccgutils.o \
src/3_4/cgendata.o \
src/3_4/ccgmerge.o \
src/3_4/jsgen.o \
src/3_4/json.o \
src/3_4/lexbase.o \
src/3_4/unicode.o \
src/3_4/passaux.o \
src/3_4/depends.o \
src/3_4/docgen2.o \
src/3_4/service.o \
src/3_4/parseopt.o \
src/3_4/modules.o \
src/3_4/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/3_4/nimrod.o \
src/3_4/system.o \
src/3_4/commands.o \
src/3_4/os.o \
src/3_4/strutils.o \
src/3_4/parseutils.o \
src/3_4/times.o \
src/3_4/posix.o \
src/3_4/msgs.o \
src/3_4/options.o \
src/3_4/lists.o \
src/3_4/strtabs.o \
src/3_4/hashes.o \
src/3_4/tables.o \
src/3_4/math.o \
src/3_4/sockets.o \
src/3_4/ropes.o \
src/3_4/platform.o \
src/3_4/crc.o \
src/3_4/nversion.o \
src/3_4/condsyms.o \
src/3_4/idents.o \
src/3_4/extccomp.o \
src/3_4/osproc.o \
src/3_4/streams.o \
src/3_4/wordrecg.o \
src/3_4/babelcmd.o \
src/3_4/lexer.o \
src/3_4/nimlexbase.o \
src/3_4/llstream.o \
src/3_4/nimconf.o \
src/3_4/main.o \
src/3_4/ast.o \
src/3_4/intsets.o \
src/3_4/idgen.o \
src/3_4/astalgo.o \
src/3_4/rodutils.o \
src/3_4/syntaxes.o \
src/3_4/parser.o \
src/3_4/pbraces.o \
src/3_4/filters.o \
src/3_4/renderer.o \
src/3_4/filter_tmpl.o \
src/3_4/rodread.o \
src/3_4/types.o \
src/3_4/trees.o \
src/3_4/memfiles.o \
src/3_4/rodwrite.o \
src/3_4/passes.o \
src/3_4/magicsys.o \
src/3_4/nimsets.o \
src/3_4/bitsets.o \
src/3_4/semthreads.o \
src/3_4/importer.o \
src/3_4/lookups.o \
src/3_4/semdata.o \
src/3_4/treetab.o \
src/3_4/evals.o \
src/3_4/semfold.o \
src/3_4/saturate.o \
src/3_4/transf.o \
src/3_4/cgmeth.o \
src/3_4/sempass2.o \
src/3_4/guards.o \
src/3_4/lambdalifting.o \
src/3_4/evaltempl.o \
src/3_4/sem.o \
src/3_4/procfind.o \
src/3_4/pragmas.o \
src/3_4/semtypinst.o \
src/3_4/sigmatch.o \
src/3_4/parampatterns.o \
src/3_4/docgen.o \
src/3_4/rstast.o \
src/3_4/rst.o \
src/3_4/rstgen.o \
src/3_4/highlite.o \
src/3_4/algorithm.o \
src/3_4/sequtils.o \
src/3_4/aliases.o \
src/3_4/patterns.o \
src/3_4/cgen.o \
src/3_4/ccgutils.o \
src/3_4/cgendata.o \
src/3_4/ccgmerge.o \
src/3_4/jsgen.o \
src/3_4/json.o \
src/3_4/lexbase.o \
src/3_4/unicode.o \
src/3_4/passaux.o \
src/3_4/depends.o \
src/3_4/docgen2.o \
src/3_4/service.o \
src/3_4/parseopt.o \
src/3_4/modules.o \
src/3_4/pretty.o $LINK_FLAGS
    ;;
  *)
    echo "Error: no C code generated for: [$myos: $mycpu]"
    exit 1
    ;;
  esac
  ;;
solaris) 
  case $mycpu in
  i386)
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/nimrod.c -o src/4_1/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/nimrod.c -o src/4_1/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/system.c -o src/4_1/system.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/system.c -o src/4_1/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/commands.c -o src/4_1/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/commands.c -o src/4_1/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/os.c -o src/4_1/os.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/os.c -o src/4_1/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/strutils.c -o src/4_1/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/strutils.c -o src/4_1/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/parseutils.c -o src/4_1/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/parseutils.c -o src/4_1/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/times.c -o src/4_1/times.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/times.c -o src/4_1/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/posix.c -o src/4_1/posix.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/posix.c -o src/4_1/posix.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/msgs.c -o src/4_1/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/msgs.c -o src/4_1/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/options.c -o src/4_1/options.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/options.c -o src/4_1/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/lists.c -o src/4_1/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/lists.c -o src/4_1/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/strtabs.c -o src/4_1/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/strtabs.c -o src/4_1/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/hashes.c -o src/4_1/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/hashes.c -o src/4_1/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/tables.c -o src/4_1/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/tables.c -o src/4_1/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/math.c -o src/4_1/math.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/math.c -o src/4_1/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/sockets.c -o src/4_1/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/sockets.c -o src/4_1/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/ropes.c -o src/4_1/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/ropes.c -o src/4_1/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/platform.c -o src/4_1/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/platform.c -o src/4_1/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/crc.c -o src/4_1/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/crc.c -o src/4_1/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/nversion.c -o src/4_1/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/nversion.c -o src/4_1/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/condsyms.c -o src/4_1/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/condsyms.c -o src/4_1/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/idents.c -o src/4_1/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/idents.c -o src/4_1/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/extccomp.c -o src/4_1/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/extccomp.c -o src/4_1/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/osproc.c -o src/4_1/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/osproc.c -o src/4_1/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/streams.c -o src/4_1/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/streams.c -o src/4_1/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/wordrecg.c -o src/4_1/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/wordrecg.c -o src/4_1/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/babelcmd.c -o src/4_1/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/babelcmd.c -o src/4_1/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/lexer.c -o src/4_1/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/lexer.c -o src/4_1/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/nimlexbase.c -o src/4_1/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/nimlexbase.c -o src/4_1/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/llstream.c -o src/4_1/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/llstream.c -o src/4_1/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/nimconf.c -o src/4_1/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/nimconf.c -o src/4_1/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/main.c -o src/4_1/main.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/main.c -o src/4_1/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/ast.c -o src/4_1/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/ast.c -o src/4_1/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/intsets.c -o src/4_1/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/intsets.c -o src/4_1/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/idgen.c -o src/4_1/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/idgen.c -o src/4_1/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/astalgo.c -o src/4_1/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/astalgo.c -o src/4_1/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/rodutils.c -o src/4_1/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/rodutils.c -o src/4_1/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/syntaxes.c -o src/4_1/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/syntaxes.c -o src/4_1/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/parser.c -o src/4_1/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/parser.c -o src/4_1/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/pbraces.c -o src/4_1/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/pbraces.c -o src/4_1/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/filters.c -o src/4_1/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/filters.c -o src/4_1/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/renderer.c -o src/4_1/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/renderer.c -o src/4_1/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/filter_tmpl.c -o src/4_1/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/filter_tmpl.c -o src/4_1/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/rodread.c -o src/4_1/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/rodread.c -o src/4_1/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/types.c -o src/4_1/types.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/types.c -o src/4_1/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/trees.c -o src/4_1/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/trees.c -o src/4_1/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/memfiles.c -o src/4_1/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/memfiles.c -o src/4_1/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/rodwrite.c -o src/4_1/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/rodwrite.c -o src/4_1/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/passes.c -o src/4_1/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/passes.c -o src/4_1/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/magicsys.c -o src/4_1/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/magicsys.c -o src/4_1/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/nimsets.c -o src/4_1/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/nimsets.c -o src/4_1/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/bitsets.c -o src/4_1/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/bitsets.c -o src/4_1/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/semthreads.c -o src/4_1/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/semthreads.c -o src/4_1/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/importer.c -o src/4_1/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/importer.c -o src/4_1/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/lookups.c -o src/4_1/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/lookups.c -o src/4_1/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/semdata.c -o src/4_1/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/semdata.c -o src/4_1/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/treetab.c -o src/4_1/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/treetab.c -o src/4_1/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/evals.c -o src/4_1/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/evals.c -o src/4_1/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/semfold.c -o src/4_1/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/semfold.c -o src/4_1/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/saturate.c -o src/4_1/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/saturate.c -o src/4_1/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/transf.c -o src/4_1/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/transf.c -o src/4_1/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/cgmeth.c -o src/4_1/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/cgmeth.c -o src/4_1/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/sempass2.c -o src/4_1/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/sempass2.c -o src/4_1/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/guards.c -o src/4_1/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/guards.c -o src/4_1/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/lambdalifting.c -o src/4_1/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/lambdalifting.c -o src/4_1/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/evaltempl.c -o src/4_1/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/evaltempl.c -o src/4_1/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/sem.c -o src/4_1/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/sem.c -o src/4_1/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/procfind.c -o src/4_1/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/procfind.c -o src/4_1/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/pragmas.c -o src/4_1/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/pragmas.c -o src/4_1/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/semtypinst.c -o src/4_1/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/semtypinst.c -o src/4_1/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/sigmatch.c -o src/4_1/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/sigmatch.c -o src/4_1/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/parampatterns.c -o src/4_1/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/parampatterns.c -o src/4_1/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/docgen.c -o src/4_1/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/docgen.c -o src/4_1/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/rstast.c -o src/4_1/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/rstast.c -o src/4_1/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/rst.c -o src/4_1/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/rst.c -o src/4_1/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/rstgen.c -o src/4_1/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/rstgen.c -o src/4_1/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/highlite.c -o src/4_1/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/highlite.c -o src/4_1/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/algorithm.c -o src/4_1/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/algorithm.c -o src/4_1/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/sequtils.c -o src/4_1/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/sequtils.c -o src/4_1/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/aliases.c -o src/4_1/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/aliases.c -o src/4_1/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/patterns.c -o src/4_1/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/patterns.c -o src/4_1/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/cgen.c -o src/4_1/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/cgen.c -o src/4_1/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/ccgutils.c -o src/4_1/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/ccgutils.c -o src/4_1/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/cgendata.c -o src/4_1/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/cgendata.c -o src/4_1/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/ccgmerge.c -o src/4_1/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/ccgmerge.c -o src/4_1/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/jsgen.c -o src/4_1/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/jsgen.c -o src/4_1/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/json.c -o src/4_1/json.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/json.c -o src/4_1/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/lexbase.c -o src/4_1/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/lexbase.c -o src/4_1/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/unicode.c -o src/4_1/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/unicode.c -o src/4_1/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/passaux.c -o src/4_1/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/passaux.c -o src/4_1/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/depends.c -o src/4_1/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/depends.c -o src/4_1/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/docgen2.c -o src/4_1/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/docgen2.c -o src/4_1/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/service.c -o src/4_1/service.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/service.c -o src/4_1/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/parseopt.c -o src/4_1/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/parseopt.c -o src/4_1/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/modules.c -o src/4_1/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/modules.c -o src/4_1/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_1/pretty.c -o src/4_1/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/4_1/pretty.c -o src/4_1/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/4_1/nimrod.o \
src/4_1/system.o \
src/4_1/commands.o \
src/4_1/os.o \
src/4_1/strutils.o \
src/4_1/parseutils.o \
src/4_1/times.o \
src/4_1/posix.o \
src/4_1/msgs.o \
src/4_1/options.o \
src/4_1/lists.o \
src/4_1/strtabs.o \
src/4_1/hashes.o \
src/4_1/tables.o \
src/4_1/math.o \
src/4_1/sockets.o \
src/4_1/ropes.o \
src/4_1/platform.o \
src/4_1/crc.o \
src/4_1/nversion.o \
src/4_1/condsyms.o \
src/4_1/idents.o \
src/4_1/extccomp.o \
src/4_1/osproc.o \
src/4_1/streams.o \
src/4_1/wordrecg.o \
src/4_1/babelcmd.o \
src/4_1/lexer.o \
src/4_1/nimlexbase.o \
src/4_1/llstream.o \
src/4_1/nimconf.o \
src/4_1/main.o \
src/4_1/ast.o \
src/4_1/intsets.o \
src/4_1/idgen.o \
src/4_1/astalgo.o \
src/4_1/rodutils.o \
src/4_1/syntaxes.o \
src/4_1/parser.o \
src/4_1/pbraces.o \
src/4_1/filters.o \
src/4_1/renderer.o \
src/4_1/filter_tmpl.o \
src/4_1/rodread.o \
src/4_1/types.o \
src/4_1/trees.o \
src/4_1/memfiles.o \
src/4_1/rodwrite.o \
src/4_1/passes.o \
src/4_1/magicsys.o \
src/4_1/nimsets.o \
src/4_1/bitsets.o \
src/4_1/semthreads.o \
src/4_1/importer.o \
src/4_1/lookups.o \
src/4_1/semdata.o \
src/4_1/treetab.o \
src/4_1/evals.o \
src/4_1/semfold.o \
src/4_1/saturate.o \
src/4_1/transf.o \
src/4_1/cgmeth.o \
src/4_1/sempass2.o \
src/4_1/guards.o \
src/4_1/lambdalifting.o \
src/4_1/evaltempl.o \
src/4_1/sem.o \
src/4_1/procfind.o \
src/4_1/pragmas.o \
src/4_1/semtypinst.o \
src/4_1/sigmatch.o \
src/4_1/parampatterns.o \
src/4_1/docgen.o \
src/4_1/rstast.o \
src/4_1/rst.o \
src/4_1/rstgen.o \
src/4_1/highlite.o \
src/4_1/algorithm.o \
src/4_1/sequtils.o \
src/4_1/aliases.o \
src/4_1/patterns.o \
src/4_1/cgen.o \
src/4_1/ccgutils.o \
src/4_1/cgendata.o \
src/4_1/ccgmerge.o \
src/4_1/jsgen.o \
src/4_1/json.o \
src/4_1/lexbase.o \
src/4_1/unicode.o \
src/4_1/passaux.o \
src/4_1/depends.o \
src/4_1/docgen2.o \
src/4_1/service.o \
src/4_1/parseopt.o \
src/4_1/modules.o \
src/4_1/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/4_1/nimrod.o \
src/4_1/system.o \
src/4_1/commands.o \
src/4_1/os.o \
src/4_1/strutils.o \
src/4_1/parseutils.o \
src/4_1/times.o \
src/4_1/posix.o \
src/4_1/msgs.o \
src/4_1/options.o \
src/4_1/lists.o \
src/4_1/strtabs.o \
src/4_1/hashes.o \
src/4_1/tables.o \
src/4_1/math.o \
src/4_1/sockets.o \
src/4_1/ropes.o \
src/4_1/platform.o \
src/4_1/crc.o \
src/4_1/nversion.o \
src/4_1/condsyms.o \
src/4_1/idents.o \
src/4_1/extccomp.o \
src/4_1/osproc.o \
src/4_1/streams.o \
src/4_1/wordrecg.o \
src/4_1/babelcmd.o \
src/4_1/lexer.o \
src/4_1/nimlexbase.o \
src/4_1/llstream.o \
src/4_1/nimconf.o \
src/4_1/main.o \
src/4_1/ast.o \
src/4_1/intsets.o \
src/4_1/idgen.o \
src/4_1/astalgo.o \
src/4_1/rodutils.o \
src/4_1/syntaxes.o \
src/4_1/parser.o \
src/4_1/pbraces.o \
src/4_1/filters.o \
src/4_1/renderer.o \
src/4_1/filter_tmpl.o \
src/4_1/rodread.o \
src/4_1/types.o \
src/4_1/trees.o \
src/4_1/memfiles.o \
src/4_1/rodwrite.o \
src/4_1/passes.o \
src/4_1/magicsys.o \
src/4_1/nimsets.o \
src/4_1/bitsets.o \
src/4_1/semthreads.o \
src/4_1/importer.o \
src/4_1/lookups.o \
src/4_1/semdata.o \
src/4_1/treetab.o \
src/4_1/evals.o \
src/4_1/semfold.o \
src/4_1/saturate.o \
src/4_1/transf.o \
src/4_1/cgmeth.o \
src/4_1/sempass2.o \
src/4_1/guards.o \
src/4_1/lambdalifting.o \
src/4_1/evaltempl.o \
src/4_1/sem.o \
src/4_1/procfind.o \
src/4_1/pragmas.o \
src/4_1/semtypinst.o \
src/4_1/sigmatch.o \
src/4_1/parampatterns.o \
src/4_1/docgen.o \
src/4_1/rstast.o \
src/4_1/rst.o \
src/4_1/rstgen.o \
src/4_1/highlite.o \
src/4_1/algorithm.o \
src/4_1/sequtils.o \
src/4_1/aliases.o \
src/4_1/patterns.o \
src/4_1/cgen.o \
src/4_1/ccgutils.o \
src/4_1/cgendata.o \
src/4_1/ccgmerge.o \
src/4_1/jsgen.o \
src/4_1/json.o \
src/4_1/lexbase.o \
src/4_1/unicode.o \
src/4_1/passaux.o \
src/4_1/depends.o \
src/4_1/docgen2.o \
src/4_1/service.o \
src/4_1/parseopt.o \
src/4_1/modules.o \
src/4_1/pretty.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/nimrod.c -o src/4_2/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/nimrod.c -o src/4_2/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/system.c -o src/4_2/system.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/system.c -o src/4_2/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/commands.c -o src/4_2/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/commands.c -o src/4_2/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/os.c -o src/4_2/os.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/os.c -o src/4_2/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/strutils.c -o src/4_2/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/strutils.c -o src/4_2/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/parseutils.c -o src/4_2/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/parseutils.c -o src/4_2/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/times.c -o src/4_2/times.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/times.c -o src/4_2/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/posix.c -o src/4_2/posix.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/posix.c -o src/4_2/posix.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/msgs.c -o src/4_2/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/msgs.c -o src/4_2/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/options.c -o src/4_2/options.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/options.c -o src/4_2/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/lists.c -o src/4_2/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/lists.c -o src/4_2/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/strtabs.c -o src/4_2/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/strtabs.c -o src/4_2/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/hashes.c -o src/4_2/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/hashes.c -o src/4_2/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/tables.c -o src/4_2/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/tables.c -o src/4_2/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/math.c -o src/4_2/math.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/math.c -o src/4_2/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/sockets.c -o src/4_2/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/sockets.c -o src/4_2/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/ropes.c -o src/4_2/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/ropes.c -o src/4_2/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/platform.c -o src/4_2/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/platform.c -o src/4_2/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/crc.c -o src/4_2/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/crc.c -o src/4_2/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/nversion.c -o src/4_2/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/nversion.c -o src/4_2/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/condsyms.c -o src/4_2/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/condsyms.c -o src/4_2/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/idents.c -o src/4_2/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/idents.c -o src/4_2/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/extccomp.c -o src/4_2/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/extccomp.c -o src/4_2/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/osproc.c -o src/4_2/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/osproc.c -o src/4_2/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/streams.c -o src/4_2/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/streams.c -o src/4_2/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/wordrecg.c -o src/4_2/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/wordrecg.c -o src/4_2/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/babelcmd.c -o src/4_2/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/babelcmd.c -o src/4_2/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/lexer.c -o src/4_2/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/lexer.c -o src/4_2/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/nimlexbase.c -o src/4_2/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/nimlexbase.c -o src/4_2/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/llstream.c -o src/4_2/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/llstream.c -o src/4_2/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/nimconf.c -o src/4_2/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/nimconf.c -o src/4_2/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/main.c -o src/4_2/main.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/main.c -o src/4_2/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/ast.c -o src/4_2/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/ast.c -o src/4_2/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/intsets.c -o src/4_2/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/intsets.c -o src/4_2/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/idgen.c -o src/4_2/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/idgen.c -o src/4_2/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/astalgo.c -o src/4_2/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/astalgo.c -o src/4_2/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/rodutils.c -o src/4_2/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/rodutils.c -o src/4_2/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/syntaxes.c -o src/4_2/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/syntaxes.c -o src/4_2/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/parser.c -o src/4_2/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/parser.c -o src/4_2/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/pbraces.c -o src/4_2/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/pbraces.c -o src/4_2/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/filters.c -o src/4_2/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/filters.c -o src/4_2/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/renderer.c -o src/4_2/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/renderer.c -o src/4_2/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/filter_tmpl.c -o src/4_2/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/filter_tmpl.c -o src/4_2/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/rodread.c -o src/4_2/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/rodread.c -o src/4_2/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/types.c -o src/4_2/types.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/types.c -o src/4_2/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/trees.c -o src/4_2/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/trees.c -o src/4_2/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/memfiles.c -o src/4_2/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/memfiles.c -o src/4_2/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/rodwrite.c -o src/4_2/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/rodwrite.c -o src/4_2/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/passes.c -o src/4_2/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/passes.c -o src/4_2/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/magicsys.c -o src/4_2/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/magicsys.c -o src/4_2/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/nimsets.c -o src/4_2/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/nimsets.c -o src/4_2/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/bitsets.c -o src/4_2/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/bitsets.c -o src/4_2/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/semthreads.c -o src/4_2/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/semthreads.c -o src/4_2/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/importer.c -o src/4_2/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/importer.c -o src/4_2/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/lookups.c -o src/4_2/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/lookups.c -o src/4_2/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/semdata.c -o src/4_2/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/semdata.c -o src/4_2/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/treetab.c -o src/4_2/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/treetab.c -o src/4_2/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/evals.c -o src/4_2/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/evals.c -o src/4_2/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/semfold.c -o src/4_2/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/semfold.c -o src/4_2/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/saturate.c -o src/4_2/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/saturate.c -o src/4_2/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/transf.c -o src/4_2/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/transf.c -o src/4_2/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/cgmeth.c -o src/4_2/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/cgmeth.c -o src/4_2/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/sempass2.c -o src/4_2/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/sempass2.c -o src/4_2/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/guards.c -o src/4_2/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/guards.c -o src/4_2/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/lambdalifting.c -o src/4_2/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/lambdalifting.c -o src/4_2/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/evaltempl.c -o src/4_2/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/evaltempl.c -o src/4_2/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/sem.c -o src/4_2/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/sem.c -o src/4_2/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/procfind.c -o src/4_2/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/procfind.c -o src/4_2/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/pragmas.c -o src/4_2/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/pragmas.c -o src/4_2/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/semtypinst.c -o src/4_2/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/semtypinst.c -o src/4_2/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/sigmatch.c -o src/4_2/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/sigmatch.c -o src/4_2/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/parampatterns.c -o src/4_2/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/parampatterns.c -o src/4_2/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/docgen.c -o src/4_2/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/docgen.c -o src/4_2/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/rstast.c -o src/4_2/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/rstast.c -o src/4_2/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/rst.c -o src/4_2/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/rst.c -o src/4_2/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/rstgen.c -o src/4_2/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/rstgen.c -o src/4_2/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/highlite.c -o src/4_2/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/highlite.c -o src/4_2/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/algorithm.c -o src/4_2/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/algorithm.c -o src/4_2/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/sequtils.c -o src/4_2/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/sequtils.c -o src/4_2/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/aliases.c -o src/4_2/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/aliases.c -o src/4_2/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/patterns.c -o src/4_2/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/patterns.c -o src/4_2/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/cgen.c -o src/4_2/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/cgen.c -o src/4_2/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/ccgutils.c -o src/4_2/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/ccgutils.c -o src/4_2/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/cgendata.c -o src/4_2/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/cgendata.c -o src/4_2/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/ccgmerge.c -o src/4_2/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/ccgmerge.c -o src/4_2/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/jsgen.c -o src/4_2/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/jsgen.c -o src/4_2/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/json.c -o src/4_2/json.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/json.c -o src/4_2/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/lexbase.c -o src/4_2/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/lexbase.c -o src/4_2/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/unicode.c -o src/4_2/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/unicode.c -o src/4_2/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/passaux.c -o src/4_2/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/passaux.c -o src/4_2/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/depends.c -o src/4_2/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/depends.c -o src/4_2/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/docgen2.c -o src/4_2/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/docgen2.c -o src/4_2/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/service.c -o src/4_2/service.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/service.c -o src/4_2/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/parseopt.c -o src/4_2/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/parseopt.c -o src/4_2/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/modules.c -o src/4_2/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/modules.c -o src/4_2/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_2/pretty.c -o src/4_2/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/4_2/pretty.c -o src/4_2/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/4_2/nimrod.o \
src/4_2/system.o \
src/4_2/commands.o \
src/4_2/os.o \
src/4_2/strutils.o \
src/4_2/parseutils.o \
src/4_2/times.o \
src/4_2/posix.o \
src/4_2/msgs.o \
src/4_2/options.o \
src/4_2/lists.o \
src/4_2/strtabs.o \
src/4_2/hashes.o \
src/4_2/tables.o \
src/4_2/math.o \
src/4_2/sockets.o \
src/4_2/ropes.o \
src/4_2/platform.o \
src/4_2/crc.o \
src/4_2/nversion.o \
src/4_2/condsyms.o \
src/4_2/idents.o \
src/4_2/extccomp.o \
src/4_2/osproc.o \
src/4_2/streams.o \
src/4_2/wordrecg.o \
src/4_2/babelcmd.o \
src/4_2/lexer.o \
src/4_2/nimlexbase.o \
src/4_2/llstream.o \
src/4_2/nimconf.o \
src/4_2/main.o \
src/4_2/ast.o \
src/4_2/intsets.o \
src/4_2/idgen.o \
src/4_2/astalgo.o \
src/4_2/rodutils.o \
src/4_2/syntaxes.o \
src/4_2/parser.o \
src/4_2/pbraces.o \
src/4_2/filters.o \
src/4_2/renderer.o \
src/4_2/filter_tmpl.o \
src/4_2/rodread.o \
src/4_2/types.o \
src/4_2/trees.o \
src/4_2/memfiles.o \
src/4_2/rodwrite.o \
src/4_2/passes.o \
src/4_2/magicsys.o \
src/4_2/nimsets.o \
src/4_2/bitsets.o \
src/4_2/semthreads.o \
src/4_2/importer.o \
src/4_2/lookups.o \
src/4_2/semdata.o \
src/4_2/treetab.o \
src/4_2/evals.o \
src/4_2/semfold.o \
src/4_2/saturate.o \
src/4_2/transf.o \
src/4_2/cgmeth.o \
src/4_2/sempass2.o \
src/4_2/guards.o \
src/4_2/lambdalifting.o \
src/4_2/evaltempl.o \
src/4_2/sem.o \
src/4_2/procfind.o \
src/4_2/pragmas.o \
src/4_2/semtypinst.o \
src/4_2/sigmatch.o \
src/4_2/parampatterns.o \
src/4_2/docgen.o \
src/4_2/rstast.o \
src/4_2/rst.o \
src/4_2/rstgen.o \
src/4_2/highlite.o \
src/4_2/algorithm.o \
src/4_2/sequtils.o \
src/4_2/aliases.o \
src/4_2/patterns.o \
src/4_2/cgen.o \
src/4_2/ccgutils.o \
src/4_2/cgendata.o \
src/4_2/ccgmerge.o \
src/4_2/jsgen.o \
src/4_2/json.o \
src/4_2/lexbase.o \
src/4_2/unicode.o \
src/4_2/passaux.o \
src/4_2/depends.o \
src/4_2/docgen2.o \
src/4_2/service.o \
src/4_2/parseopt.o \
src/4_2/modules.o \
src/4_2/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/4_2/nimrod.o \
src/4_2/system.o \
src/4_2/commands.o \
src/4_2/os.o \
src/4_2/strutils.o \
src/4_2/parseutils.o \
src/4_2/times.o \
src/4_2/posix.o \
src/4_2/msgs.o \
src/4_2/options.o \
src/4_2/lists.o \
src/4_2/strtabs.o \
src/4_2/hashes.o \
src/4_2/tables.o \
src/4_2/math.o \
src/4_2/sockets.o \
src/4_2/ropes.o \
src/4_2/platform.o \
src/4_2/crc.o \
src/4_2/nversion.o \
src/4_2/condsyms.o \
src/4_2/idents.o \
src/4_2/extccomp.o \
src/4_2/osproc.o \
src/4_2/streams.o \
src/4_2/wordrecg.o \
src/4_2/babelcmd.o \
src/4_2/lexer.o \
src/4_2/nimlexbase.o \
src/4_2/llstream.o \
src/4_2/nimconf.o \
src/4_2/main.o \
src/4_2/ast.o \
src/4_2/intsets.o \
src/4_2/idgen.o \
src/4_2/astalgo.o \
src/4_2/rodutils.o \
src/4_2/syntaxes.o \
src/4_2/parser.o \
src/4_2/pbraces.o \
src/4_2/filters.o \
src/4_2/renderer.o \
src/4_2/filter_tmpl.o \
src/4_2/rodread.o \
src/4_2/types.o \
src/4_2/trees.o \
src/4_2/memfiles.o \
src/4_2/rodwrite.o \
src/4_2/passes.o \
src/4_2/magicsys.o \
src/4_2/nimsets.o \
src/4_2/bitsets.o \
src/4_2/semthreads.o \
src/4_2/importer.o \
src/4_2/lookups.o \
src/4_2/semdata.o \
src/4_2/treetab.o \
src/4_2/evals.o \
src/4_2/semfold.o \
src/4_2/saturate.o \
src/4_2/transf.o \
src/4_2/cgmeth.o \
src/4_2/sempass2.o \
src/4_2/guards.o \
src/4_2/lambdalifting.o \
src/4_2/evaltempl.o \
src/4_2/sem.o \
src/4_2/procfind.o \
src/4_2/pragmas.o \
src/4_2/semtypinst.o \
src/4_2/sigmatch.o \
src/4_2/parampatterns.o \
src/4_2/docgen.o \
src/4_2/rstast.o \
src/4_2/rst.o \
src/4_2/rstgen.o \
src/4_2/highlite.o \
src/4_2/algorithm.o \
src/4_2/sequtils.o \
src/4_2/aliases.o \
src/4_2/patterns.o \
src/4_2/cgen.o \
src/4_2/ccgutils.o \
src/4_2/cgendata.o \
src/4_2/ccgmerge.o \
src/4_2/jsgen.o \
src/4_2/json.o \
src/4_2/lexbase.o \
src/4_2/unicode.o \
src/4_2/passaux.o \
src/4_2/depends.o \
src/4_2/docgen2.o \
src/4_2/service.o \
src/4_2/parseopt.o \
src/4_2/modules.o \
src/4_2/pretty.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/nimrod.c -o src/4_3/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/nimrod.c -o src/4_3/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/system.c -o src/4_3/system.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/system.c -o src/4_3/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/commands.c -o src/4_3/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/commands.c -o src/4_3/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/os.c -o src/4_3/os.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/os.c -o src/4_3/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/strutils.c -o src/4_3/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/strutils.c -o src/4_3/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/parseutils.c -o src/4_3/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/parseutils.c -o src/4_3/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/times.c -o src/4_3/times.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/times.c -o src/4_3/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/posix.c -o src/4_3/posix.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/posix.c -o src/4_3/posix.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/msgs.c -o src/4_3/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/msgs.c -o src/4_3/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/options.c -o src/4_3/options.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/options.c -o src/4_3/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/lists.c -o src/4_3/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/lists.c -o src/4_3/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/strtabs.c -o src/4_3/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/strtabs.c -o src/4_3/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/hashes.c -o src/4_3/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/hashes.c -o src/4_3/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/tables.c -o src/4_3/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/tables.c -o src/4_3/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/math.c -o src/4_3/math.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/math.c -o src/4_3/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/sockets.c -o src/4_3/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/sockets.c -o src/4_3/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/ropes.c -o src/4_3/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/ropes.c -o src/4_3/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/platform.c -o src/4_3/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/platform.c -o src/4_3/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/crc.c -o src/4_3/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/crc.c -o src/4_3/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/nversion.c -o src/4_3/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/nversion.c -o src/4_3/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/condsyms.c -o src/4_3/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/condsyms.c -o src/4_3/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/idents.c -o src/4_3/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/idents.c -o src/4_3/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/extccomp.c -o src/4_3/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/extccomp.c -o src/4_3/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/osproc.c -o src/4_3/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/osproc.c -o src/4_3/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/streams.c -o src/4_3/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/streams.c -o src/4_3/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/wordrecg.c -o src/4_3/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/wordrecg.c -o src/4_3/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/babelcmd.c -o src/4_3/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/babelcmd.c -o src/4_3/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/lexer.c -o src/4_3/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/lexer.c -o src/4_3/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/nimlexbase.c -o src/4_3/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/nimlexbase.c -o src/4_3/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/llstream.c -o src/4_3/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/llstream.c -o src/4_3/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/nimconf.c -o src/4_3/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/nimconf.c -o src/4_3/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/main.c -o src/4_3/main.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/main.c -o src/4_3/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/ast.c -o src/4_3/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/ast.c -o src/4_3/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/intsets.c -o src/4_3/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/intsets.c -o src/4_3/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/idgen.c -o src/4_3/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/idgen.c -o src/4_3/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/astalgo.c -o src/4_3/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/astalgo.c -o src/4_3/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/rodutils.c -o src/4_3/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/rodutils.c -o src/4_3/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/syntaxes.c -o src/4_3/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/syntaxes.c -o src/4_3/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/parser.c -o src/4_3/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/parser.c -o src/4_3/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/pbraces.c -o src/4_3/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/pbraces.c -o src/4_3/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/filters.c -o src/4_3/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/filters.c -o src/4_3/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/renderer.c -o src/4_3/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/renderer.c -o src/4_3/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/filter_tmpl.c -o src/4_3/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/filter_tmpl.c -o src/4_3/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/rodread.c -o src/4_3/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/rodread.c -o src/4_3/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/types.c -o src/4_3/types.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/types.c -o src/4_3/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/trees.c -o src/4_3/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/trees.c -o src/4_3/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/memfiles.c -o src/4_3/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/memfiles.c -o src/4_3/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/rodwrite.c -o src/4_3/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/rodwrite.c -o src/4_3/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/passes.c -o src/4_3/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/passes.c -o src/4_3/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/magicsys.c -o src/4_3/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/magicsys.c -o src/4_3/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/nimsets.c -o src/4_3/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/nimsets.c -o src/4_3/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/bitsets.c -o src/4_3/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/bitsets.c -o src/4_3/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/semthreads.c -o src/4_3/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/semthreads.c -o src/4_3/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/importer.c -o src/4_3/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/importer.c -o src/4_3/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/lookups.c -o src/4_3/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/lookups.c -o src/4_3/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/semdata.c -o src/4_3/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/semdata.c -o src/4_3/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/treetab.c -o src/4_3/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/treetab.c -o src/4_3/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/evals.c -o src/4_3/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/evals.c -o src/4_3/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/semfold.c -o src/4_3/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/semfold.c -o src/4_3/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/saturate.c -o src/4_3/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/saturate.c -o src/4_3/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/transf.c -o src/4_3/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/transf.c -o src/4_3/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/cgmeth.c -o src/4_3/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/cgmeth.c -o src/4_3/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/sempass2.c -o src/4_3/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/sempass2.c -o src/4_3/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/guards.c -o src/4_3/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/guards.c -o src/4_3/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/lambdalifting.c -o src/4_3/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/lambdalifting.c -o src/4_3/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/evaltempl.c -o src/4_3/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/evaltempl.c -o src/4_3/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/sem.c -o src/4_3/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/sem.c -o src/4_3/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/procfind.c -o src/4_3/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/procfind.c -o src/4_3/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/pragmas.c -o src/4_3/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/pragmas.c -o src/4_3/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/semtypinst.c -o src/4_3/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/semtypinst.c -o src/4_3/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/sigmatch.c -o src/4_3/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/sigmatch.c -o src/4_3/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/parampatterns.c -o src/4_3/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/parampatterns.c -o src/4_3/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/docgen.c -o src/4_3/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/docgen.c -o src/4_3/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/rstast.c -o src/4_3/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/rstast.c -o src/4_3/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/rst.c -o src/4_3/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/rst.c -o src/4_3/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/rstgen.c -o src/4_3/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/rstgen.c -o src/4_3/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/highlite.c -o src/4_3/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/highlite.c -o src/4_3/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/algorithm.c -o src/4_3/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/algorithm.c -o src/4_3/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/sequtils.c -o src/4_3/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/sequtils.c -o src/4_3/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/aliases.c -o src/4_3/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/aliases.c -o src/4_3/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/patterns.c -o src/4_3/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/patterns.c -o src/4_3/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/cgen.c -o src/4_3/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/cgen.c -o src/4_3/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/ccgutils.c -o src/4_3/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/ccgutils.c -o src/4_3/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/cgendata.c -o src/4_3/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/cgendata.c -o src/4_3/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/ccgmerge.c -o src/4_3/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/ccgmerge.c -o src/4_3/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/jsgen.c -o src/4_3/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/jsgen.c -o src/4_3/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/json.c -o src/4_3/json.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/json.c -o src/4_3/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/lexbase.c -o src/4_3/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/lexbase.c -o src/4_3/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/unicode.c -o src/4_3/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/unicode.c -o src/4_3/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/passaux.c -o src/4_3/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/passaux.c -o src/4_3/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/depends.c -o src/4_3/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/depends.c -o src/4_3/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/docgen2.c -o src/4_3/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/docgen2.c -o src/4_3/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/service.c -o src/4_3/service.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/service.c -o src/4_3/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/parseopt.c -o src/4_3/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/parseopt.c -o src/4_3/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/modules.c -o src/4_3/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/modules.c -o src/4_3/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_3/pretty.c -o src/4_3/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/4_3/pretty.c -o src/4_3/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/4_3/nimrod.o \
src/4_3/system.o \
src/4_3/commands.o \
src/4_3/os.o \
src/4_3/strutils.o \
src/4_3/parseutils.o \
src/4_3/times.o \
src/4_3/posix.o \
src/4_3/msgs.o \
src/4_3/options.o \
src/4_3/lists.o \
src/4_3/strtabs.o \
src/4_3/hashes.o \
src/4_3/tables.o \
src/4_3/math.o \
src/4_3/sockets.o \
src/4_3/ropes.o \
src/4_3/platform.o \
src/4_3/crc.o \
src/4_3/nversion.o \
src/4_3/condsyms.o \
src/4_3/idents.o \
src/4_3/extccomp.o \
src/4_3/osproc.o \
src/4_3/streams.o \
src/4_3/wordrecg.o \
src/4_3/babelcmd.o \
src/4_3/lexer.o \
src/4_3/nimlexbase.o \
src/4_3/llstream.o \
src/4_3/nimconf.o \
src/4_3/main.o \
src/4_3/ast.o \
src/4_3/intsets.o \
src/4_3/idgen.o \
src/4_3/astalgo.o \
src/4_3/rodutils.o \
src/4_3/syntaxes.o \
src/4_3/parser.o \
src/4_3/pbraces.o \
src/4_3/filters.o \
src/4_3/renderer.o \
src/4_3/filter_tmpl.o \
src/4_3/rodread.o \
src/4_3/types.o \
src/4_3/trees.o \
src/4_3/memfiles.o \
src/4_3/rodwrite.o \
src/4_3/passes.o \
src/4_3/magicsys.o \
src/4_3/nimsets.o \
src/4_3/bitsets.o \
src/4_3/semthreads.o \
src/4_3/importer.o \
src/4_3/lookups.o \
src/4_3/semdata.o \
src/4_3/treetab.o \
src/4_3/evals.o \
src/4_3/semfold.o \
src/4_3/saturate.o \
src/4_3/transf.o \
src/4_3/cgmeth.o \
src/4_3/sempass2.o \
src/4_3/guards.o \
src/4_3/lambdalifting.o \
src/4_3/evaltempl.o \
src/4_3/sem.o \
src/4_3/procfind.o \
src/4_3/pragmas.o \
src/4_3/semtypinst.o \
src/4_3/sigmatch.o \
src/4_3/parampatterns.o \
src/4_3/docgen.o \
src/4_3/rstast.o \
src/4_3/rst.o \
src/4_3/rstgen.o \
src/4_3/highlite.o \
src/4_3/algorithm.o \
src/4_3/sequtils.o \
src/4_3/aliases.o \
src/4_3/patterns.o \
src/4_3/cgen.o \
src/4_3/ccgutils.o \
src/4_3/cgendata.o \
src/4_3/ccgmerge.o \
src/4_3/jsgen.o \
src/4_3/json.o \
src/4_3/lexbase.o \
src/4_3/unicode.o \
src/4_3/passaux.o \
src/4_3/depends.o \
src/4_3/docgen2.o \
src/4_3/service.o \
src/4_3/parseopt.o \
src/4_3/modules.o \
src/4_3/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/4_3/nimrod.o \
src/4_3/system.o \
src/4_3/commands.o \
src/4_3/os.o \
src/4_3/strutils.o \
src/4_3/parseutils.o \
src/4_3/times.o \
src/4_3/posix.o \
src/4_3/msgs.o \
src/4_3/options.o \
src/4_3/lists.o \
src/4_3/strtabs.o \
src/4_3/hashes.o \
src/4_3/tables.o \
src/4_3/math.o \
src/4_3/sockets.o \
src/4_3/ropes.o \
src/4_3/platform.o \
src/4_3/crc.o \
src/4_3/nversion.o \
src/4_3/condsyms.o \
src/4_3/idents.o \
src/4_3/extccomp.o \
src/4_3/osproc.o \
src/4_3/streams.o \
src/4_3/wordrecg.o \
src/4_3/babelcmd.o \
src/4_3/lexer.o \
src/4_3/nimlexbase.o \
src/4_3/llstream.o \
src/4_3/nimconf.o \
src/4_3/main.o \
src/4_3/ast.o \
src/4_3/intsets.o \
src/4_3/idgen.o \
src/4_3/astalgo.o \
src/4_3/rodutils.o \
src/4_3/syntaxes.o \
src/4_3/parser.o \
src/4_3/pbraces.o \
src/4_3/filters.o \
src/4_3/renderer.o \
src/4_3/filter_tmpl.o \
src/4_3/rodread.o \
src/4_3/types.o \
src/4_3/trees.o \
src/4_3/memfiles.o \
src/4_3/rodwrite.o \
src/4_3/passes.o \
src/4_3/magicsys.o \
src/4_3/nimsets.o \
src/4_3/bitsets.o \
src/4_3/semthreads.o \
src/4_3/importer.o \
src/4_3/lookups.o \
src/4_3/semdata.o \
src/4_3/treetab.o \
src/4_3/evals.o \
src/4_3/semfold.o \
src/4_3/saturate.o \
src/4_3/transf.o \
src/4_3/cgmeth.o \
src/4_3/sempass2.o \
src/4_3/guards.o \
src/4_3/lambdalifting.o \
src/4_3/evaltempl.o \
src/4_3/sem.o \
src/4_3/procfind.o \
src/4_3/pragmas.o \
src/4_3/semtypinst.o \
src/4_3/sigmatch.o \
src/4_3/parampatterns.o \
src/4_3/docgen.o \
src/4_3/rstast.o \
src/4_3/rst.o \
src/4_3/rstgen.o \
src/4_3/highlite.o \
src/4_3/algorithm.o \
src/4_3/sequtils.o \
src/4_3/aliases.o \
src/4_3/patterns.o \
src/4_3/cgen.o \
src/4_3/ccgutils.o \
src/4_3/cgendata.o \
src/4_3/ccgmerge.o \
src/4_3/jsgen.o \
src/4_3/json.o \
src/4_3/lexbase.o \
src/4_3/unicode.o \
src/4_3/passaux.o \
src/4_3/depends.o \
src/4_3/docgen2.o \
src/4_3/service.o \
src/4_3/parseopt.o \
src/4_3/modules.o \
src/4_3/pretty.o $LINK_FLAGS
    ;;
  arm)
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/nimrod.c -o src/4_4/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/nimrod.c -o src/4_4/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/system.c -o src/4_4/system.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/system.c -o src/4_4/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/commands.c -o src/4_4/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/commands.c -o src/4_4/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/os.c -o src/4_4/os.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/os.c -o src/4_4/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/strutils.c -o src/4_4/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/strutils.c -o src/4_4/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/parseutils.c -o src/4_4/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/parseutils.c -o src/4_4/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/times.c -o src/4_4/times.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/times.c -o src/4_4/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/posix.c -o src/4_4/posix.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/posix.c -o src/4_4/posix.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/msgs.c -o src/4_4/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/msgs.c -o src/4_4/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/options.c -o src/4_4/options.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/options.c -o src/4_4/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/lists.c -o src/4_4/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/lists.c -o src/4_4/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/strtabs.c -o src/4_4/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/strtabs.c -o src/4_4/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/hashes.c -o src/4_4/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/hashes.c -o src/4_4/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/tables.c -o src/4_4/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/tables.c -o src/4_4/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/math.c -o src/4_4/math.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/math.c -o src/4_4/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/sockets.c -o src/4_4/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/sockets.c -o src/4_4/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/ropes.c -o src/4_4/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/ropes.c -o src/4_4/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/platform.c -o src/4_4/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/platform.c -o src/4_4/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/crc.c -o src/4_4/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/crc.c -o src/4_4/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/nversion.c -o src/4_4/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/nversion.c -o src/4_4/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/condsyms.c -o src/4_4/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/condsyms.c -o src/4_4/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/idents.c -o src/4_4/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/idents.c -o src/4_4/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/extccomp.c -o src/4_4/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/extccomp.c -o src/4_4/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/osproc.c -o src/4_4/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/osproc.c -o src/4_4/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/streams.c -o src/4_4/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/streams.c -o src/4_4/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/wordrecg.c -o src/4_4/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/wordrecg.c -o src/4_4/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/babelcmd.c -o src/4_4/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/babelcmd.c -o src/4_4/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/lexer.c -o src/4_4/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/lexer.c -o src/4_4/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/nimlexbase.c -o src/4_4/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/nimlexbase.c -o src/4_4/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/llstream.c -o src/4_4/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/llstream.c -o src/4_4/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/nimconf.c -o src/4_4/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/nimconf.c -o src/4_4/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/main.c -o src/4_4/main.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/main.c -o src/4_4/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/ast.c -o src/4_4/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/ast.c -o src/4_4/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/intsets.c -o src/4_4/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/intsets.c -o src/4_4/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/idgen.c -o src/4_4/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/idgen.c -o src/4_4/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/astalgo.c -o src/4_4/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/astalgo.c -o src/4_4/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/rodutils.c -o src/4_4/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/rodutils.c -o src/4_4/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/syntaxes.c -o src/4_4/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/syntaxes.c -o src/4_4/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/parser.c -o src/4_4/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/parser.c -o src/4_4/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/pbraces.c -o src/4_4/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/pbraces.c -o src/4_4/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/filters.c -o src/4_4/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/filters.c -o src/4_4/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/renderer.c -o src/4_4/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/renderer.c -o src/4_4/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/filter_tmpl.c -o src/4_4/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/filter_tmpl.c -o src/4_4/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/rodread.c -o src/4_4/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/rodread.c -o src/4_4/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/types.c -o src/4_4/types.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/types.c -o src/4_4/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/trees.c -o src/4_4/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/trees.c -o src/4_4/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/memfiles.c -o src/4_4/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/memfiles.c -o src/4_4/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/rodwrite.c -o src/4_4/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/rodwrite.c -o src/4_4/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/passes.c -o src/4_4/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/passes.c -o src/4_4/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/magicsys.c -o src/4_4/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/magicsys.c -o src/4_4/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/nimsets.c -o src/4_4/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/nimsets.c -o src/4_4/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/bitsets.c -o src/4_4/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/bitsets.c -o src/4_4/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/semthreads.c -o src/4_4/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/semthreads.c -o src/4_4/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/importer.c -o src/4_4/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/importer.c -o src/4_4/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/lookups.c -o src/4_4/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/lookups.c -o src/4_4/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/semdata.c -o src/4_4/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/semdata.c -o src/4_4/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/treetab.c -o src/4_4/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/treetab.c -o src/4_4/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/evals.c -o src/4_4/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/evals.c -o src/4_4/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/semfold.c -o src/4_4/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/semfold.c -o src/4_4/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/saturate.c -o src/4_4/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/saturate.c -o src/4_4/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/transf.c -o src/4_4/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/transf.c -o src/4_4/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/cgmeth.c -o src/4_4/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/cgmeth.c -o src/4_4/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/sempass2.c -o src/4_4/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/sempass2.c -o src/4_4/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/guards.c -o src/4_4/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/guards.c -o src/4_4/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/lambdalifting.c -o src/4_4/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/lambdalifting.c -o src/4_4/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/evaltempl.c -o src/4_4/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/evaltempl.c -o src/4_4/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/sem.c -o src/4_4/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/sem.c -o src/4_4/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/procfind.c -o src/4_4/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/procfind.c -o src/4_4/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/pragmas.c -o src/4_4/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/pragmas.c -o src/4_4/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/semtypinst.c -o src/4_4/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/semtypinst.c -o src/4_4/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/sigmatch.c -o src/4_4/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/sigmatch.c -o src/4_4/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/parampatterns.c -o src/4_4/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/parampatterns.c -o src/4_4/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/docgen.c -o src/4_4/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/docgen.c -o src/4_4/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/rstast.c -o src/4_4/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/rstast.c -o src/4_4/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/rst.c -o src/4_4/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/rst.c -o src/4_4/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/rstgen.c -o src/4_4/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/rstgen.c -o src/4_4/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/highlite.c -o src/4_4/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/highlite.c -o src/4_4/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/algorithm.c -o src/4_4/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/algorithm.c -o src/4_4/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/sequtils.c -o src/4_4/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/sequtils.c -o src/4_4/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/aliases.c -o src/4_4/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/aliases.c -o src/4_4/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/patterns.c -o src/4_4/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/patterns.c -o src/4_4/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/cgen.c -o src/4_4/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/cgen.c -o src/4_4/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/ccgutils.c -o src/4_4/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/ccgutils.c -o src/4_4/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/cgendata.c -o src/4_4/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/cgendata.c -o src/4_4/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/ccgmerge.c -o src/4_4/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/ccgmerge.c -o src/4_4/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/jsgen.c -o src/4_4/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/jsgen.c -o src/4_4/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/json.c -o src/4_4/json.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/json.c -o src/4_4/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/lexbase.c -o src/4_4/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/lexbase.c -o src/4_4/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/unicode.c -o src/4_4/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/unicode.c -o src/4_4/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/passaux.c -o src/4_4/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/passaux.c -o src/4_4/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/depends.c -o src/4_4/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/depends.c -o src/4_4/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/docgen2.c -o src/4_4/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/docgen2.c -o src/4_4/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/service.c -o src/4_4/service.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/service.c -o src/4_4/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/parseopt.c -o src/4_4/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/parseopt.c -o src/4_4/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/modules.c -o src/4_4/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/modules.c -o src/4_4/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/4_4/pretty.c -o src/4_4/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/4_4/pretty.c -o src/4_4/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/4_4/nimrod.o \
src/4_4/system.o \
src/4_4/commands.o \
src/4_4/os.o \
src/4_4/strutils.o \
src/4_4/parseutils.o \
src/4_4/times.o \
src/4_4/posix.o \
src/4_4/msgs.o \
src/4_4/options.o \
src/4_4/lists.o \
src/4_4/strtabs.o \
src/4_4/hashes.o \
src/4_4/tables.o \
src/4_4/math.o \
src/4_4/sockets.o \
src/4_4/ropes.o \
src/4_4/platform.o \
src/4_4/crc.o \
src/4_4/nversion.o \
src/4_4/condsyms.o \
src/4_4/idents.o \
src/4_4/extccomp.o \
src/4_4/osproc.o \
src/4_4/streams.o \
src/4_4/wordrecg.o \
src/4_4/babelcmd.o \
src/4_4/lexer.o \
src/4_4/nimlexbase.o \
src/4_4/llstream.o \
src/4_4/nimconf.o \
src/4_4/main.o \
src/4_4/ast.o \
src/4_4/intsets.o \
src/4_4/idgen.o \
src/4_4/astalgo.o \
src/4_4/rodutils.o \
src/4_4/syntaxes.o \
src/4_4/parser.o \
src/4_4/pbraces.o \
src/4_4/filters.o \
src/4_4/renderer.o \
src/4_4/filter_tmpl.o \
src/4_4/rodread.o \
src/4_4/types.o \
src/4_4/trees.o \
src/4_4/memfiles.o \
src/4_4/rodwrite.o \
src/4_4/passes.o \
src/4_4/magicsys.o \
src/4_4/nimsets.o \
src/4_4/bitsets.o \
src/4_4/semthreads.o \
src/4_4/importer.o \
src/4_4/lookups.o \
src/4_4/semdata.o \
src/4_4/treetab.o \
src/4_4/evals.o \
src/4_4/semfold.o \
src/4_4/saturate.o \
src/4_4/transf.o \
src/4_4/cgmeth.o \
src/4_4/sempass2.o \
src/4_4/guards.o \
src/4_4/lambdalifting.o \
src/4_4/evaltempl.o \
src/4_4/sem.o \
src/4_4/procfind.o \
src/4_4/pragmas.o \
src/4_4/semtypinst.o \
src/4_4/sigmatch.o \
src/4_4/parampatterns.o \
src/4_4/docgen.o \
src/4_4/rstast.o \
src/4_4/rst.o \
src/4_4/rstgen.o \
src/4_4/highlite.o \
src/4_4/algorithm.o \
src/4_4/sequtils.o \
src/4_4/aliases.o \
src/4_4/patterns.o \
src/4_4/cgen.o \
src/4_4/ccgutils.o \
src/4_4/cgendata.o \
src/4_4/ccgmerge.o \
src/4_4/jsgen.o \
src/4_4/json.o \
src/4_4/lexbase.o \
src/4_4/unicode.o \
src/4_4/passaux.o \
src/4_4/depends.o \
src/4_4/docgen2.o \
src/4_4/service.o \
src/4_4/parseopt.o \
src/4_4/modules.o \
src/4_4/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/4_4/nimrod.o \
src/4_4/system.o \
src/4_4/commands.o \
src/4_4/os.o \
src/4_4/strutils.o \
src/4_4/parseutils.o \
src/4_4/times.o \
src/4_4/posix.o \
src/4_4/msgs.o \
src/4_4/options.o \
src/4_4/lists.o \
src/4_4/strtabs.o \
src/4_4/hashes.o \
src/4_4/tables.o \
src/4_4/math.o \
src/4_4/sockets.o \
src/4_4/ropes.o \
src/4_4/platform.o \
src/4_4/crc.o \
src/4_4/nversion.o \
src/4_4/condsyms.o \
src/4_4/idents.o \
src/4_4/extccomp.o \
src/4_4/osproc.o \
src/4_4/streams.o \
src/4_4/wordrecg.o \
src/4_4/babelcmd.o \
src/4_4/lexer.o \
src/4_4/nimlexbase.o \
src/4_4/llstream.o \
src/4_4/nimconf.o \
src/4_4/main.o \
src/4_4/ast.o \
src/4_4/intsets.o \
src/4_4/idgen.o \
src/4_4/astalgo.o \
src/4_4/rodutils.o \
src/4_4/syntaxes.o \
src/4_4/parser.o \
src/4_4/pbraces.o \
src/4_4/filters.o \
src/4_4/renderer.o \
src/4_4/filter_tmpl.o \
src/4_4/rodread.o \
src/4_4/types.o \
src/4_4/trees.o \
src/4_4/memfiles.o \
src/4_4/rodwrite.o \
src/4_4/passes.o \
src/4_4/magicsys.o \
src/4_4/nimsets.o \
src/4_4/bitsets.o \
src/4_4/semthreads.o \
src/4_4/importer.o \
src/4_4/lookups.o \
src/4_4/semdata.o \
src/4_4/treetab.o \
src/4_4/evals.o \
src/4_4/semfold.o \
src/4_4/saturate.o \
src/4_4/transf.o \
src/4_4/cgmeth.o \
src/4_4/sempass2.o \
src/4_4/guards.o \
src/4_4/lambdalifting.o \
src/4_4/evaltempl.o \
src/4_4/sem.o \
src/4_4/procfind.o \
src/4_4/pragmas.o \
src/4_4/semtypinst.o \
src/4_4/sigmatch.o \
src/4_4/parampatterns.o \
src/4_4/docgen.o \
src/4_4/rstast.o \
src/4_4/rst.o \
src/4_4/rstgen.o \
src/4_4/highlite.o \
src/4_4/algorithm.o \
src/4_4/sequtils.o \
src/4_4/aliases.o \
src/4_4/patterns.o \
src/4_4/cgen.o \
src/4_4/ccgutils.o \
src/4_4/cgendata.o \
src/4_4/ccgmerge.o \
src/4_4/jsgen.o \
src/4_4/json.o \
src/4_4/lexbase.o \
src/4_4/unicode.o \
src/4_4/passaux.o \
src/4_4/depends.o \
src/4_4/docgen2.o \
src/4_4/service.o \
src/4_4/parseopt.o \
src/4_4/modules.o \
src/4_4/pretty.o $LINK_FLAGS
    ;;
  *)
    echo "Error: no C code generated for: [$myos: $mycpu]"
    exit 1
    ;;
  esac
  ;;
freebsd) 
  case $mycpu in
  i386)
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/nimrod.c -o src/5_1/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/nimrod.c -o src/5_1/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/system.c -o src/5_1/system.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/system.c -o src/5_1/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/commands.c -o src/5_1/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/commands.c -o src/5_1/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/os.c -o src/5_1/os.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/os.c -o src/5_1/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/strutils.c -o src/5_1/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/strutils.c -o src/5_1/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/parseutils.c -o src/5_1/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/parseutils.c -o src/5_1/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/times.c -o src/5_1/times.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/times.c -o src/5_1/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/posix.c -o src/5_1/posix.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/posix.c -o src/5_1/posix.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/msgs.c -o src/5_1/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/msgs.c -o src/5_1/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/options.c -o src/5_1/options.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/options.c -o src/5_1/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/lists.c -o src/5_1/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/lists.c -o src/5_1/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/strtabs.c -o src/5_1/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/strtabs.c -o src/5_1/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/hashes.c -o src/5_1/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/hashes.c -o src/5_1/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/tables.c -o src/5_1/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/tables.c -o src/5_1/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/math.c -o src/5_1/math.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/math.c -o src/5_1/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/sockets.c -o src/5_1/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/sockets.c -o src/5_1/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/ropes.c -o src/5_1/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/ropes.c -o src/5_1/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/platform.c -o src/5_1/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/platform.c -o src/5_1/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/crc.c -o src/5_1/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/crc.c -o src/5_1/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/nversion.c -o src/5_1/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/nversion.c -o src/5_1/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/condsyms.c -o src/5_1/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/condsyms.c -o src/5_1/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/idents.c -o src/5_1/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/idents.c -o src/5_1/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/extccomp.c -o src/5_1/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/extccomp.c -o src/5_1/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/osproc.c -o src/5_1/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/osproc.c -o src/5_1/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/streams.c -o src/5_1/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/streams.c -o src/5_1/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/wordrecg.c -o src/5_1/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/wordrecg.c -o src/5_1/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/babelcmd.c -o src/5_1/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/babelcmd.c -o src/5_1/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/lexer.c -o src/5_1/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/lexer.c -o src/5_1/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/nimlexbase.c -o src/5_1/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/nimlexbase.c -o src/5_1/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/llstream.c -o src/5_1/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/llstream.c -o src/5_1/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/nimconf.c -o src/5_1/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/nimconf.c -o src/5_1/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/main.c -o src/5_1/main.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/main.c -o src/5_1/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/ast.c -o src/5_1/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/ast.c -o src/5_1/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/intsets.c -o src/5_1/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/intsets.c -o src/5_1/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/idgen.c -o src/5_1/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/idgen.c -o src/5_1/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/astalgo.c -o src/5_1/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/astalgo.c -o src/5_1/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/rodutils.c -o src/5_1/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/rodutils.c -o src/5_1/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/syntaxes.c -o src/5_1/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/syntaxes.c -o src/5_1/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/parser.c -o src/5_1/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/parser.c -o src/5_1/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/pbraces.c -o src/5_1/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/pbraces.c -o src/5_1/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/filters.c -o src/5_1/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/filters.c -o src/5_1/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/renderer.c -o src/5_1/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/renderer.c -o src/5_1/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/filter_tmpl.c -o src/5_1/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/filter_tmpl.c -o src/5_1/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/rodread.c -o src/5_1/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/rodread.c -o src/5_1/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/types.c -o src/5_1/types.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/types.c -o src/5_1/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/trees.c -o src/5_1/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/trees.c -o src/5_1/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/memfiles.c -o src/5_1/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/memfiles.c -o src/5_1/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/rodwrite.c -o src/5_1/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/rodwrite.c -o src/5_1/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/passes.c -o src/5_1/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/passes.c -o src/5_1/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/magicsys.c -o src/5_1/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/magicsys.c -o src/5_1/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/nimsets.c -o src/5_1/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/nimsets.c -o src/5_1/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/bitsets.c -o src/5_1/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/bitsets.c -o src/5_1/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/semthreads.c -o src/5_1/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/semthreads.c -o src/5_1/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/importer.c -o src/5_1/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/importer.c -o src/5_1/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/lookups.c -o src/5_1/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/lookups.c -o src/5_1/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/semdata.c -o src/5_1/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/semdata.c -o src/5_1/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/treetab.c -o src/5_1/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/treetab.c -o src/5_1/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/evals.c -o src/5_1/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/evals.c -o src/5_1/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/semfold.c -o src/5_1/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/semfold.c -o src/5_1/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/saturate.c -o src/5_1/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/saturate.c -o src/5_1/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/transf.c -o src/5_1/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/transf.c -o src/5_1/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/cgmeth.c -o src/5_1/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/cgmeth.c -o src/5_1/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/sempass2.c -o src/5_1/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/sempass2.c -o src/5_1/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/guards.c -o src/5_1/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/guards.c -o src/5_1/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/lambdalifting.c -o src/5_1/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/lambdalifting.c -o src/5_1/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/evaltempl.c -o src/5_1/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/evaltempl.c -o src/5_1/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/sem.c -o src/5_1/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/sem.c -o src/5_1/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/procfind.c -o src/5_1/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/procfind.c -o src/5_1/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/pragmas.c -o src/5_1/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/pragmas.c -o src/5_1/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/semtypinst.c -o src/5_1/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/semtypinst.c -o src/5_1/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/sigmatch.c -o src/5_1/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/sigmatch.c -o src/5_1/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/parampatterns.c -o src/5_1/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/parampatterns.c -o src/5_1/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/docgen.c -o src/5_1/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/docgen.c -o src/5_1/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/rstast.c -o src/5_1/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/rstast.c -o src/5_1/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/rst.c -o src/5_1/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/rst.c -o src/5_1/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/rstgen.c -o src/5_1/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/rstgen.c -o src/5_1/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/highlite.c -o src/5_1/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/highlite.c -o src/5_1/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/algorithm.c -o src/5_1/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/algorithm.c -o src/5_1/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/sequtils.c -o src/5_1/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/sequtils.c -o src/5_1/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/aliases.c -o src/5_1/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/aliases.c -o src/5_1/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/patterns.c -o src/5_1/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/patterns.c -o src/5_1/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/cgen.c -o src/5_1/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/cgen.c -o src/5_1/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/ccgutils.c -o src/5_1/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/ccgutils.c -o src/5_1/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/cgendata.c -o src/5_1/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/cgendata.c -o src/5_1/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/ccgmerge.c -o src/5_1/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/ccgmerge.c -o src/5_1/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/jsgen.c -o src/5_1/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/jsgen.c -o src/5_1/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/json.c -o src/5_1/json.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/json.c -o src/5_1/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/lexbase.c -o src/5_1/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/lexbase.c -o src/5_1/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/unicode.c -o src/5_1/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/unicode.c -o src/5_1/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/passaux.c -o src/5_1/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/passaux.c -o src/5_1/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/depends.c -o src/5_1/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/depends.c -o src/5_1/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/docgen2.c -o src/5_1/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/docgen2.c -o src/5_1/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/service.c -o src/5_1/service.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/service.c -o src/5_1/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/parseopt.c -o src/5_1/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/parseopt.c -o src/5_1/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/modules.c -o src/5_1/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/modules.c -o src/5_1/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_1/pretty.c -o src/5_1/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/5_1/pretty.c -o src/5_1/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/5_1/nimrod.o \
src/5_1/system.o \
src/5_1/commands.o \
src/5_1/os.o \
src/5_1/strutils.o \
src/5_1/parseutils.o \
src/5_1/times.o \
src/5_1/posix.o \
src/5_1/msgs.o \
src/5_1/options.o \
src/5_1/lists.o \
src/5_1/strtabs.o \
src/5_1/hashes.o \
src/5_1/tables.o \
src/5_1/math.o \
src/5_1/sockets.o \
src/5_1/ropes.o \
src/5_1/platform.o \
src/5_1/crc.o \
src/5_1/nversion.o \
src/5_1/condsyms.o \
src/5_1/idents.o \
src/5_1/extccomp.o \
src/5_1/osproc.o \
src/5_1/streams.o \
src/5_1/wordrecg.o \
src/5_1/babelcmd.o \
src/5_1/lexer.o \
src/5_1/nimlexbase.o \
src/5_1/llstream.o \
src/5_1/nimconf.o \
src/5_1/main.o \
src/5_1/ast.o \
src/5_1/intsets.o \
src/5_1/idgen.o \
src/5_1/astalgo.o \
src/5_1/rodutils.o \
src/5_1/syntaxes.o \
src/5_1/parser.o \
src/5_1/pbraces.o \
src/5_1/filters.o \
src/5_1/renderer.o \
src/5_1/filter_tmpl.o \
src/5_1/rodread.o \
src/5_1/types.o \
src/5_1/trees.o \
src/5_1/memfiles.o \
src/5_1/rodwrite.o \
src/5_1/passes.o \
src/5_1/magicsys.o \
src/5_1/nimsets.o \
src/5_1/bitsets.o \
src/5_1/semthreads.o \
src/5_1/importer.o \
src/5_1/lookups.o \
src/5_1/semdata.o \
src/5_1/treetab.o \
src/5_1/evals.o \
src/5_1/semfold.o \
src/5_1/saturate.o \
src/5_1/transf.o \
src/5_1/cgmeth.o \
src/5_1/sempass2.o \
src/5_1/guards.o \
src/5_1/lambdalifting.o \
src/5_1/evaltempl.o \
src/5_1/sem.o \
src/5_1/procfind.o \
src/5_1/pragmas.o \
src/5_1/semtypinst.o \
src/5_1/sigmatch.o \
src/5_1/parampatterns.o \
src/5_1/docgen.o \
src/5_1/rstast.o \
src/5_1/rst.o \
src/5_1/rstgen.o \
src/5_1/highlite.o \
src/5_1/algorithm.o \
src/5_1/sequtils.o \
src/5_1/aliases.o \
src/5_1/patterns.o \
src/5_1/cgen.o \
src/5_1/ccgutils.o \
src/5_1/cgendata.o \
src/5_1/ccgmerge.o \
src/5_1/jsgen.o \
src/5_1/json.o \
src/5_1/lexbase.o \
src/5_1/unicode.o \
src/5_1/passaux.o \
src/5_1/depends.o \
src/5_1/docgen2.o \
src/5_1/service.o \
src/5_1/parseopt.o \
src/5_1/modules.o \
src/5_1/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/5_1/nimrod.o \
src/5_1/system.o \
src/5_1/commands.o \
src/5_1/os.o \
src/5_1/strutils.o \
src/5_1/parseutils.o \
src/5_1/times.o \
src/5_1/posix.o \
src/5_1/msgs.o \
src/5_1/options.o \
src/5_1/lists.o \
src/5_1/strtabs.o \
src/5_1/hashes.o \
src/5_1/tables.o \
src/5_1/math.o \
src/5_1/sockets.o \
src/5_1/ropes.o \
src/5_1/platform.o \
src/5_1/crc.o \
src/5_1/nversion.o \
src/5_1/condsyms.o \
src/5_1/idents.o \
src/5_1/extccomp.o \
src/5_1/osproc.o \
src/5_1/streams.o \
src/5_1/wordrecg.o \
src/5_1/babelcmd.o \
src/5_1/lexer.o \
src/5_1/nimlexbase.o \
src/5_1/llstream.o \
src/5_1/nimconf.o \
src/5_1/main.o \
src/5_1/ast.o \
src/5_1/intsets.o \
src/5_1/idgen.o \
src/5_1/astalgo.o \
src/5_1/rodutils.o \
src/5_1/syntaxes.o \
src/5_1/parser.o \
src/5_1/pbraces.o \
src/5_1/filters.o \
src/5_1/renderer.o \
src/5_1/filter_tmpl.o \
src/5_1/rodread.o \
src/5_1/types.o \
src/5_1/trees.o \
src/5_1/memfiles.o \
src/5_1/rodwrite.o \
src/5_1/passes.o \
src/5_1/magicsys.o \
src/5_1/nimsets.o \
src/5_1/bitsets.o \
src/5_1/semthreads.o \
src/5_1/importer.o \
src/5_1/lookups.o \
src/5_1/semdata.o \
src/5_1/treetab.o \
src/5_1/evals.o \
src/5_1/semfold.o \
src/5_1/saturate.o \
src/5_1/transf.o \
src/5_1/cgmeth.o \
src/5_1/sempass2.o \
src/5_1/guards.o \
src/5_1/lambdalifting.o \
src/5_1/evaltempl.o \
src/5_1/sem.o \
src/5_1/procfind.o \
src/5_1/pragmas.o \
src/5_1/semtypinst.o \
src/5_1/sigmatch.o \
src/5_1/parampatterns.o \
src/5_1/docgen.o \
src/5_1/rstast.o \
src/5_1/rst.o \
src/5_1/rstgen.o \
src/5_1/highlite.o \
src/5_1/algorithm.o \
src/5_1/sequtils.o \
src/5_1/aliases.o \
src/5_1/patterns.o \
src/5_1/cgen.o \
src/5_1/ccgutils.o \
src/5_1/cgendata.o \
src/5_1/ccgmerge.o \
src/5_1/jsgen.o \
src/5_1/json.o \
src/5_1/lexbase.o \
src/5_1/unicode.o \
src/5_1/passaux.o \
src/5_1/depends.o \
src/5_1/docgen2.o \
src/5_1/service.o \
src/5_1/parseopt.o \
src/5_1/modules.o \
src/5_1/pretty.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/nimrod.c -o src/5_2/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/nimrod.c -o src/5_2/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/system.c -o src/5_2/system.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/system.c -o src/5_2/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/commands.c -o src/5_2/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/commands.c -o src/5_2/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/os.c -o src/5_2/os.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/os.c -o src/5_2/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/strutils.c -o src/5_2/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/strutils.c -o src/5_2/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/parseutils.c -o src/5_2/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/parseutils.c -o src/5_2/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/times.c -o src/5_2/times.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/times.c -o src/5_2/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/posix.c -o src/5_2/posix.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/posix.c -o src/5_2/posix.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/msgs.c -o src/5_2/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/msgs.c -o src/5_2/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/options.c -o src/5_2/options.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/options.c -o src/5_2/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/lists.c -o src/5_2/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/lists.c -o src/5_2/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/strtabs.c -o src/5_2/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/strtabs.c -o src/5_2/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/hashes.c -o src/5_2/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/hashes.c -o src/5_2/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/tables.c -o src/5_2/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/tables.c -o src/5_2/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/math.c -o src/5_2/math.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/math.c -o src/5_2/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/sockets.c -o src/5_2/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/sockets.c -o src/5_2/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/ropes.c -o src/5_2/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/ropes.c -o src/5_2/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/platform.c -o src/5_2/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/platform.c -o src/5_2/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/crc.c -o src/5_2/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/crc.c -o src/5_2/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/nversion.c -o src/5_2/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/nversion.c -o src/5_2/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/condsyms.c -o src/5_2/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/condsyms.c -o src/5_2/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/idents.c -o src/5_2/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/idents.c -o src/5_2/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/extccomp.c -o src/5_2/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/extccomp.c -o src/5_2/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/osproc.c -o src/5_2/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/osproc.c -o src/5_2/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/streams.c -o src/5_2/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/streams.c -o src/5_2/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/wordrecg.c -o src/5_2/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/wordrecg.c -o src/5_2/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/babelcmd.c -o src/5_2/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/babelcmd.c -o src/5_2/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/lexer.c -o src/5_2/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/lexer.c -o src/5_2/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/nimlexbase.c -o src/5_2/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/nimlexbase.c -o src/5_2/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/llstream.c -o src/5_2/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/llstream.c -o src/5_2/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/nimconf.c -o src/5_2/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/nimconf.c -o src/5_2/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/main.c -o src/5_2/main.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/main.c -o src/5_2/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/ast.c -o src/5_2/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/ast.c -o src/5_2/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/intsets.c -o src/5_2/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/intsets.c -o src/5_2/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/idgen.c -o src/5_2/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/idgen.c -o src/5_2/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/astalgo.c -o src/5_2/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/astalgo.c -o src/5_2/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/rodutils.c -o src/5_2/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/rodutils.c -o src/5_2/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/syntaxes.c -o src/5_2/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/syntaxes.c -o src/5_2/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/parser.c -o src/5_2/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/parser.c -o src/5_2/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/pbraces.c -o src/5_2/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/pbraces.c -o src/5_2/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/filters.c -o src/5_2/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/filters.c -o src/5_2/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/renderer.c -o src/5_2/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/renderer.c -o src/5_2/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/filter_tmpl.c -o src/5_2/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/filter_tmpl.c -o src/5_2/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/rodread.c -o src/5_2/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/rodread.c -o src/5_2/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/types.c -o src/5_2/types.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/types.c -o src/5_2/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/trees.c -o src/5_2/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/trees.c -o src/5_2/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/memfiles.c -o src/5_2/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/memfiles.c -o src/5_2/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/rodwrite.c -o src/5_2/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/rodwrite.c -o src/5_2/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/passes.c -o src/5_2/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/passes.c -o src/5_2/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/magicsys.c -o src/5_2/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/magicsys.c -o src/5_2/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/nimsets.c -o src/5_2/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/nimsets.c -o src/5_2/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/bitsets.c -o src/5_2/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/bitsets.c -o src/5_2/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/semthreads.c -o src/5_2/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/semthreads.c -o src/5_2/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/importer.c -o src/5_2/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/importer.c -o src/5_2/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/lookups.c -o src/5_2/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/lookups.c -o src/5_2/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/semdata.c -o src/5_2/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/semdata.c -o src/5_2/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/treetab.c -o src/5_2/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/treetab.c -o src/5_2/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/evals.c -o src/5_2/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/evals.c -o src/5_2/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/semfold.c -o src/5_2/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/semfold.c -o src/5_2/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/saturate.c -o src/5_2/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/saturate.c -o src/5_2/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/transf.c -o src/5_2/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/transf.c -o src/5_2/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/cgmeth.c -o src/5_2/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/cgmeth.c -o src/5_2/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/sempass2.c -o src/5_2/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/sempass2.c -o src/5_2/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/guards.c -o src/5_2/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/guards.c -o src/5_2/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/lambdalifting.c -o src/5_2/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/lambdalifting.c -o src/5_2/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/evaltempl.c -o src/5_2/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/evaltempl.c -o src/5_2/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/sem.c -o src/5_2/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/sem.c -o src/5_2/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/procfind.c -o src/5_2/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/procfind.c -o src/5_2/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/pragmas.c -o src/5_2/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/pragmas.c -o src/5_2/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/semtypinst.c -o src/5_2/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/semtypinst.c -o src/5_2/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/sigmatch.c -o src/5_2/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/sigmatch.c -o src/5_2/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/parampatterns.c -o src/5_2/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/parampatterns.c -o src/5_2/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/docgen.c -o src/5_2/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/docgen.c -o src/5_2/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/rstast.c -o src/5_2/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/rstast.c -o src/5_2/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/rst.c -o src/5_2/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/rst.c -o src/5_2/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/rstgen.c -o src/5_2/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/rstgen.c -o src/5_2/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/highlite.c -o src/5_2/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/highlite.c -o src/5_2/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/algorithm.c -o src/5_2/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/algorithm.c -o src/5_2/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/sequtils.c -o src/5_2/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/sequtils.c -o src/5_2/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/aliases.c -o src/5_2/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/aliases.c -o src/5_2/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/patterns.c -o src/5_2/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/patterns.c -o src/5_2/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/cgen.c -o src/5_2/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/cgen.c -o src/5_2/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/ccgutils.c -o src/5_2/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/ccgutils.c -o src/5_2/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/cgendata.c -o src/5_2/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/cgendata.c -o src/5_2/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/ccgmerge.c -o src/5_2/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/ccgmerge.c -o src/5_2/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/jsgen.c -o src/5_2/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/jsgen.c -o src/5_2/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/json.c -o src/5_2/json.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/json.c -o src/5_2/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/lexbase.c -o src/5_2/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/lexbase.c -o src/5_2/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/unicode.c -o src/5_2/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/unicode.c -o src/5_2/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/passaux.c -o src/5_2/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/passaux.c -o src/5_2/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/depends.c -o src/5_2/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/depends.c -o src/5_2/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/docgen2.c -o src/5_2/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/docgen2.c -o src/5_2/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/service.c -o src/5_2/service.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/service.c -o src/5_2/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/parseopt.c -o src/5_2/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/parseopt.c -o src/5_2/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/modules.c -o src/5_2/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/modules.c -o src/5_2/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_2/pretty.c -o src/5_2/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/5_2/pretty.c -o src/5_2/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/5_2/nimrod.o \
src/5_2/system.o \
src/5_2/commands.o \
src/5_2/os.o \
src/5_2/strutils.o \
src/5_2/parseutils.o \
src/5_2/times.o \
src/5_2/posix.o \
src/5_2/msgs.o \
src/5_2/options.o \
src/5_2/lists.o \
src/5_2/strtabs.o \
src/5_2/hashes.o \
src/5_2/tables.o \
src/5_2/math.o \
src/5_2/sockets.o \
src/5_2/ropes.o \
src/5_2/platform.o \
src/5_2/crc.o \
src/5_2/nversion.o \
src/5_2/condsyms.o \
src/5_2/idents.o \
src/5_2/extccomp.o \
src/5_2/osproc.o \
src/5_2/streams.o \
src/5_2/wordrecg.o \
src/5_2/babelcmd.o \
src/5_2/lexer.o \
src/5_2/nimlexbase.o \
src/5_2/llstream.o \
src/5_2/nimconf.o \
src/5_2/main.o \
src/5_2/ast.o \
src/5_2/intsets.o \
src/5_2/idgen.o \
src/5_2/astalgo.o \
src/5_2/rodutils.o \
src/5_2/syntaxes.o \
src/5_2/parser.o \
src/5_2/pbraces.o \
src/5_2/filters.o \
src/5_2/renderer.o \
src/5_2/filter_tmpl.o \
src/5_2/rodread.o \
src/5_2/types.o \
src/5_2/trees.o \
src/5_2/memfiles.o \
src/5_2/rodwrite.o \
src/5_2/passes.o \
src/5_2/magicsys.o \
src/5_2/nimsets.o \
src/5_2/bitsets.o \
src/5_2/semthreads.o \
src/5_2/importer.o \
src/5_2/lookups.o \
src/5_2/semdata.o \
src/5_2/treetab.o \
src/5_2/evals.o \
src/5_2/semfold.o \
src/5_2/saturate.o \
src/5_2/transf.o \
src/5_2/cgmeth.o \
src/5_2/sempass2.o \
src/5_2/guards.o \
src/5_2/lambdalifting.o \
src/5_2/evaltempl.o \
src/5_2/sem.o \
src/5_2/procfind.o \
src/5_2/pragmas.o \
src/5_2/semtypinst.o \
src/5_2/sigmatch.o \
src/5_2/parampatterns.o \
src/5_2/docgen.o \
src/5_2/rstast.o \
src/5_2/rst.o \
src/5_2/rstgen.o \
src/5_2/highlite.o \
src/5_2/algorithm.o \
src/5_2/sequtils.o \
src/5_2/aliases.o \
src/5_2/patterns.o \
src/5_2/cgen.o \
src/5_2/ccgutils.o \
src/5_2/cgendata.o \
src/5_2/ccgmerge.o \
src/5_2/jsgen.o \
src/5_2/json.o \
src/5_2/lexbase.o \
src/5_2/unicode.o \
src/5_2/passaux.o \
src/5_2/depends.o \
src/5_2/docgen2.o \
src/5_2/service.o \
src/5_2/parseopt.o \
src/5_2/modules.o \
src/5_2/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/5_2/nimrod.o \
src/5_2/system.o \
src/5_2/commands.o \
src/5_2/os.o \
src/5_2/strutils.o \
src/5_2/parseutils.o \
src/5_2/times.o \
src/5_2/posix.o \
src/5_2/msgs.o \
src/5_2/options.o \
src/5_2/lists.o \
src/5_2/strtabs.o \
src/5_2/hashes.o \
src/5_2/tables.o \
src/5_2/math.o \
src/5_2/sockets.o \
src/5_2/ropes.o \
src/5_2/platform.o \
src/5_2/crc.o \
src/5_2/nversion.o \
src/5_2/condsyms.o \
src/5_2/idents.o \
src/5_2/extccomp.o \
src/5_2/osproc.o \
src/5_2/streams.o \
src/5_2/wordrecg.o \
src/5_2/babelcmd.o \
src/5_2/lexer.o \
src/5_2/nimlexbase.o \
src/5_2/llstream.o \
src/5_2/nimconf.o \
src/5_2/main.o \
src/5_2/ast.o \
src/5_2/intsets.o \
src/5_2/idgen.o \
src/5_2/astalgo.o \
src/5_2/rodutils.o \
src/5_2/syntaxes.o \
src/5_2/parser.o \
src/5_2/pbraces.o \
src/5_2/filters.o \
src/5_2/renderer.o \
src/5_2/filter_tmpl.o \
src/5_2/rodread.o \
src/5_2/types.o \
src/5_2/trees.o \
src/5_2/memfiles.o \
src/5_2/rodwrite.o \
src/5_2/passes.o \
src/5_2/magicsys.o \
src/5_2/nimsets.o \
src/5_2/bitsets.o \
src/5_2/semthreads.o \
src/5_2/importer.o \
src/5_2/lookups.o \
src/5_2/semdata.o \
src/5_2/treetab.o \
src/5_2/evals.o \
src/5_2/semfold.o \
src/5_2/saturate.o \
src/5_2/transf.o \
src/5_2/cgmeth.o \
src/5_2/sempass2.o \
src/5_2/guards.o \
src/5_2/lambdalifting.o \
src/5_2/evaltempl.o \
src/5_2/sem.o \
src/5_2/procfind.o \
src/5_2/pragmas.o \
src/5_2/semtypinst.o \
src/5_2/sigmatch.o \
src/5_2/parampatterns.o \
src/5_2/docgen.o \
src/5_2/rstast.o \
src/5_2/rst.o \
src/5_2/rstgen.o \
src/5_2/highlite.o \
src/5_2/algorithm.o \
src/5_2/sequtils.o \
src/5_2/aliases.o \
src/5_2/patterns.o \
src/5_2/cgen.o \
src/5_2/ccgutils.o \
src/5_2/cgendata.o \
src/5_2/ccgmerge.o \
src/5_2/jsgen.o \
src/5_2/json.o \
src/5_2/lexbase.o \
src/5_2/unicode.o \
src/5_2/passaux.o \
src/5_2/depends.o \
src/5_2/docgen2.o \
src/5_2/service.o \
src/5_2/parseopt.o \
src/5_2/modules.o \
src/5_2/pretty.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/nimrod.c -o src/5_3/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/nimrod.c -o src/5_3/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/system.c -o src/5_3/system.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/system.c -o src/5_3/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/commands.c -o src/5_3/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/commands.c -o src/5_3/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/os.c -o src/5_3/os.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/os.c -o src/5_3/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/strutils.c -o src/5_3/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/strutils.c -o src/5_3/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/parseutils.c -o src/5_3/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/parseutils.c -o src/5_3/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/times.c -o src/5_3/times.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/times.c -o src/5_3/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/posix.c -o src/5_3/posix.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/posix.c -o src/5_3/posix.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/msgs.c -o src/5_3/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/msgs.c -o src/5_3/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/options.c -o src/5_3/options.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/options.c -o src/5_3/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/lists.c -o src/5_3/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/lists.c -o src/5_3/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/strtabs.c -o src/5_3/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/strtabs.c -o src/5_3/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/hashes.c -o src/5_3/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/hashes.c -o src/5_3/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/tables.c -o src/5_3/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/tables.c -o src/5_3/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/math.c -o src/5_3/math.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/math.c -o src/5_3/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/sockets.c -o src/5_3/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/sockets.c -o src/5_3/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/ropes.c -o src/5_3/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/ropes.c -o src/5_3/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/platform.c -o src/5_3/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/platform.c -o src/5_3/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/crc.c -o src/5_3/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/crc.c -o src/5_3/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/nversion.c -o src/5_3/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/nversion.c -o src/5_3/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/condsyms.c -o src/5_3/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/condsyms.c -o src/5_3/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/idents.c -o src/5_3/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/idents.c -o src/5_3/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/extccomp.c -o src/5_3/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/extccomp.c -o src/5_3/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/osproc.c -o src/5_3/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/osproc.c -o src/5_3/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/streams.c -o src/5_3/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/streams.c -o src/5_3/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/wordrecg.c -o src/5_3/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/wordrecg.c -o src/5_3/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/babelcmd.c -o src/5_3/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/babelcmd.c -o src/5_3/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/lexer.c -o src/5_3/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/lexer.c -o src/5_3/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/nimlexbase.c -o src/5_3/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/nimlexbase.c -o src/5_3/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/llstream.c -o src/5_3/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/llstream.c -o src/5_3/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/nimconf.c -o src/5_3/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/nimconf.c -o src/5_3/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/main.c -o src/5_3/main.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/main.c -o src/5_3/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/ast.c -o src/5_3/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/ast.c -o src/5_3/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/intsets.c -o src/5_3/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/intsets.c -o src/5_3/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/idgen.c -o src/5_3/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/idgen.c -o src/5_3/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/astalgo.c -o src/5_3/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/astalgo.c -o src/5_3/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/rodutils.c -o src/5_3/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/rodutils.c -o src/5_3/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/syntaxes.c -o src/5_3/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/syntaxes.c -o src/5_3/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/parser.c -o src/5_3/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/parser.c -o src/5_3/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/pbraces.c -o src/5_3/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/pbraces.c -o src/5_3/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/filters.c -o src/5_3/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/filters.c -o src/5_3/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/renderer.c -o src/5_3/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/renderer.c -o src/5_3/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/filter_tmpl.c -o src/5_3/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/filter_tmpl.c -o src/5_3/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/rodread.c -o src/5_3/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/rodread.c -o src/5_3/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/types.c -o src/5_3/types.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/types.c -o src/5_3/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/trees.c -o src/5_3/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/trees.c -o src/5_3/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/memfiles.c -o src/5_3/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/memfiles.c -o src/5_3/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/rodwrite.c -o src/5_3/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/rodwrite.c -o src/5_3/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/passes.c -o src/5_3/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/passes.c -o src/5_3/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/magicsys.c -o src/5_3/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/magicsys.c -o src/5_3/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/nimsets.c -o src/5_3/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/nimsets.c -o src/5_3/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/bitsets.c -o src/5_3/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/bitsets.c -o src/5_3/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/semthreads.c -o src/5_3/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/semthreads.c -o src/5_3/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/importer.c -o src/5_3/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/importer.c -o src/5_3/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/lookups.c -o src/5_3/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/lookups.c -o src/5_3/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/semdata.c -o src/5_3/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/semdata.c -o src/5_3/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/treetab.c -o src/5_3/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/treetab.c -o src/5_3/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/evals.c -o src/5_3/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/evals.c -o src/5_3/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/semfold.c -o src/5_3/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/semfold.c -o src/5_3/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/saturate.c -o src/5_3/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/saturate.c -o src/5_3/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/transf.c -o src/5_3/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/transf.c -o src/5_3/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/cgmeth.c -o src/5_3/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/cgmeth.c -o src/5_3/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/sempass2.c -o src/5_3/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/sempass2.c -o src/5_3/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/guards.c -o src/5_3/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/guards.c -o src/5_3/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/lambdalifting.c -o src/5_3/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/lambdalifting.c -o src/5_3/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/evaltempl.c -o src/5_3/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/evaltempl.c -o src/5_3/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/sem.c -o src/5_3/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/sem.c -o src/5_3/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/procfind.c -o src/5_3/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/procfind.c -o src/5_3/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/pragmas.c -o src/5_3/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/pragmas.c -o src/5_3/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/semtypinst.c -o src/5_3/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/semtypinst.c -o src/5_3/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/sigmatch.c -o src/5_3/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/sigmatch.c -o src/5_3/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/parampatterns.c -o src/5_3/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/parampatterns.c -o src/5_3/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/docgen.c -o src/5_3/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/docgen.c -o src/5_3/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/rstast.c -o src/5_3/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/rstast.c -o src/5_3/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/rst.c -o src/5_3/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/rst.c -o src/5_3/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/rstgen.c -o src/5_3/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/rstgen.c -o src/5_3/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/highlite.c -o src/5_3/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/highlite.c -o src/5_3/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/algorithm.c -o src/5_3/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/algorithm.c -o src/5_3/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/sequtils.c -o src/5_3/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/sequtils.c -o src/5_3/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/aliases.c -o src/5_3/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/aliases.c -o src/5_3/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/patterns.c -o src/5_3/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/patterns.c -o src/5_3/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/cgen.c -o src/5_3/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/cgen.c -o src/5_3/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/ccgutils.c -o src/5_3/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/ccgutils.c -o src/5_3/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/cgendata.c -o src/5_3/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/cgendata.c -o src/5_3/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/ccgmerge.c -o src/5_3/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/ccgmerge.c -o src/5_3/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/jsgen.c -o src/5_3/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/jsgen.c -o src/5_3/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/json.c -o src/5_3/json.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/json.c -o src/5_3/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/lexbase.c -o src/5_3/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/lexbase.c -o src/5_3/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/unicode.c -o src/5_3/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/unicode.c -o src/5_3/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/passaux.c -o src/5_3/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/passaux.c -o src/5_3/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/depends.c -o src/5_3/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/depends.c -o src/5_3/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/docgen2.c -o src/5_3/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/docgen2.c -o src/5_3/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/service.c -o src/5_3/service.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/service.c -o src/5_3/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/parseopt.c -o src/5_3/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/parseopt.c -o src/5_3/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/modules.c -o src/5_3/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/modules.c -o src/5_3/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_3/pretty.c -o src/5_3/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/5_3/pretty.c -o src/5_3/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/5_3/nimrod.o \
src/5_3/system.o \
src/5_3/commands.o \
src/5_3/os.o \
src/5_3/strutils.o \
src/5_3/parseutils.o \
src/5_3/times.o \
src/5_3/posix.o \
src/5_3/msgs.o \
src/5_3/options.o \
src/5_3/lists.o \
src/5_3/strtabs.o \
src/5_3/hashes.o \
src/5_3/tables.o \
src/5_3/math.o \
src/5_3/sockets.o \
src/5_3/ropes.o \
src/5_3/platform.o \
src/5_3/crc.o \
src/5_3/nversion.o \
src/5_3/condsyms.o \
src/5_3/idents.o \
src/5_3/extccomp.o \
src/5_3/osproc.o \
src/5_3/streams.o \
src/5_3/wordrecg.o \
src/5_3/babelcmd.o \
src/5_3/lexer.o \
src/5_3/nimlexbase.o \
src/5_3/llstream.o \
src/5_3/nimconf.o \
src/5_3/main.o \
src/5_3/ast.o \
src/5_3/intsets.o \
src/5_3/idgen.o \
src/5_3/astalgo.o \
src/5_3/rodutils.o \
src/5_3/syntaxes.o \
src/5_3/parser.o \
src/5_3/pbraces.o \
src/5_3/filters.o \
src/5_3/renderer.o \
src/5_3/filter_tmpl.o \
src/5_3/rodread.o \
src/5_3/types.o \
src/5_3/trees.o \
src/5_3/memfiles.o \
src/5_3/rodwrite.o \
src/5_3/passes.o \
src/5_3/magicsys.o \
src/5_3/nimsets.o \
src/5_3/bitsets.o \
src/5_3/semthreads.o \
src/5_3/importer.o \
src/5_3/lookups.o \
src/5_3/semdata.o \
src/5_3/treetab.o \
src/5_3/evals.o \
src/5_3/semfold.o \
src/5_3/saturate.o \
src/5_3/transf.o \
src/5_3/cgmeth.o \
src/5_3/sempass2.o \
src/5_3/guards.o \
src/5_3/lambdalifting.o \
src/5_3/evaltempl.o \
src/5_3/sem.o \
src/5_3/procfind.o \
src/5_3/pragmas.o \
src/5_3/semtypinst.o \
src/5_3/sigmatch.o \
src/5_3/parampatterns.o \
src/5_3/docgen.o \
src/5_3/rstast.o \
src/5_3/rst.o \
src/5_3/rstgen.o \
src/5_3/highlite.o \
src/5_3/algorithm.o \
src/5_3/sequtils.o \
src/5_3/aliases.o \
src/5_3/patterns.o \
src/5_3/cgen.o \
src/5_3/ccgutils.o \
src/5_3/cgendata.o \
src/5_3/ccgmerge.o \
src/5_3/jsgen.o \
src/5_3/json.o \
src/5_3/lexbase.o \
src/5_3/unicode.o \
src/5_3/passaux.o \
src/5_3/depends.o \
src/5_3/docgen2.o \
src/5_3/service.o \
src/5_3/parseopt.o \
src/5_3/modules.o \
src/5_3/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/5_3/nimrod.o \
src/5_3/system.o \
src/5_3/commands.o \
src/5_3/os.o \
src/5_3/strutils.o \
src/5_3/parseutils.o \
src/5_3/times.o \
src/5_3/posix.o \
src/5_3/msgs.o \
src/5_3/options.o \
src/5_3/lists.o \
src/5_3/strtabs.o \
src/5_3/hashes.o \
src/5_3/tables.o \
src/5_3/math.o \
src/5_3/sockets.o \
src/5_3/ropes.o \
src/5_3/platform.o \
src/5_3/crc.o \
src/5_3/nversion.o \
src/5_3/condsyms.o \
src/5_3/idents.o \
src/5_3/extccomp.o \
src/5_3/osproc.o \
src/5_3/streams.o \
src/5_3/wordrecg.o \
src/5_3/babelcmd.o \
src/5_3/lexer.o \
src/5_3/nimlexbase.o \
src/5_3/llstream.o \
src/5_3/nimconf.o \
src/5_3/main.o \
src/5_3/ast.o \
src/5_3/intsets.o \
src/5_3/idgen.o \
src/5_3/astalgo.o \
src/5_3/rodutils.o \
src/5_3/syntaxes.o \
src/5_3/parser.o \
src/5_3/pbraces.o \
src/5_3/filters.o \
src/5_3/renderer.o \
src/5_3/filter_tmpl.o \
src/5_3/rodread.o \
src/5_3/types.o \
src/5_3/trees.o \
src/5_3/memfiles.o \
src/5_3/rodwrite.o \
src/5_3/passes.o \
src/5_3/magicsys.o \
src/5_3/nimsets.o \
src/5_3/bitsets.o \
src/5_3/semthreads.o \
src/5_3/importer.o \
src/5_3/lookups.o \
src/5_3/semdata.o \
src/5_3/treetab.o \
src/5_3/evals.o \
src/5_3/semfold.o \
src/5_3/saturate.o \
src/5_3/transf.o \
src/5_3/cgmeth.o \
src/5_3/sempass2.o \
src/5_3/guards.o \
src/5_3/lambdalifting.o \
src/5_3/evaltempl.o \
src/5_3/sem.o \
src/5_3/procfind.o \
src/5_3/pragmas.o \
src/5_3/semtypinst.o \
src/5_3/sigmatch.o \
src/5_3/parampatterns.o \
src/5_3/docgen.o \
src/5_3/rstast.o \
src/5_3/rst.o \
src/5_3/rstgen.o \
src/5_3/highlite.o \
src/5_3/algorithm.o \
src/5_3/sequtils.o \
src/5_3/aliases.o \
src/5_3/patterns.o \
src/5_3/cgen.o \
src/5_3/ccgutils.o \
src/5_3/cgendata.o \
src/5_3/ccgmerge.o \
src/5_3/jsgen.o \
src/5_3/json.o \
src/5_3/lexbase.o \
src/5_3/unicode.o \
src/5_3/passaux.o \
src/5_3/depends.o \
src/5_3/docgen2.o \
src/5_3/service.o \
src/5_3/parseopt.o \
src/5_3/modules.o \
src/5_3/pretty.o $LINK_FLAGS
    ;;
  arm)
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/nimrod.c -o src/5_4/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/nimrod.c -o src/5_4/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/system.c -o src/5_4/system.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/system.c -o src/5_4/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/commands.c -o src/5_4/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/commands.c -o src/5_4/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/os.c -o src/5_4/os.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/os.c -o src/5_4/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/strutils.c -o src/5_4/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/strutils.c -o src/5_4/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/parseutils.c -o src/5_4/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/parseutils.c -o src/5_4/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/times.c -o src/5_4/times.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/times.c -o src/5_4/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/posix.c -o src/5_4/posix.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/posix.c -o src/5_4/posix.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/msgs.c -o src/5_4/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/msgs.c -o src/5_4/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/options.c -o src/5_4/options.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/options.c -o src/5_4/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/lists.c -o src/5_4/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/lists.c -o src/5_4/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/strtabs.c -o src/5_4/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/strtabs.c -o src/5_4/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/hashes.c -o src/5_4/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/hashes.c -o src/5_4/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/tables.c -o src/5_4/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/tables.c -o src/5_4/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/math.c -o src/5_4/math.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/math.c -o src/5_4/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/sockets.c -o src/5_4/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/sockets.c -o src/5_4/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/ropes.c -o src/5_4/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/ropes.c -o src/5_4/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/platform.c -o src/5_4/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/platform.c -o src/5_4/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/crc.c -o src/5_4/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/crc.c -o src/5_4/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/nversion.c -o src/5_4/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/nversion.c -o src/5_4/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/condsyms.c -o src/5_4/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/condsyms.c -o src/5_4/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/idents.c -o src/5_4/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/idents.c -o src/5_4/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/extccomp.c -o src/5_4/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/extccomp.c -o src/5_4/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/osproc.c -o src/5_4/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/osproc.c -o src/5_4/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/streams.c -o src/5_4/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/streams.c -o src/5_4/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/wordrecg.c -o src/5_4/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/wordrecg.c -o src/5_4/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/babelcmd.c -o src/5_4/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/babelcmd.c -o src/5_4/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/lexer.c -o src/5_4/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/lexer.c -o src/5_4/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/nimlexbase.c -o src/5_4/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/nimlexbase.c -o src/5_4/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/llstream.c -o src/5_4/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/llstream.c -o src/5_4/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/nimconf.c -o src/5_4/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/nimconf.c -o src/5_4/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/main.c -o src/5_4/main.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/main.c -o src/5_4/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/ast.c -o src/5_4/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/ast.c -o src/5_4/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/intsets.c -o src/5_4/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/intsets.c -o src/5_4/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/idgen.c -o src/5_4/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/idgen.c -o src/5_4/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/astalgo.c -o src/5_4/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/astalgo.c -o src/5_4/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/rodutils.c -o src/5_4/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/rodutils.c -o src/5_4/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/syntaxes.c -o src/5_4/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/syntaxes.c -o src/5_4/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/parser.c -o src/5_4/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/parser.c -o src/5_4/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/pbraces.c -o src/5_4/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/pbraces.c -o src/5_4/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/filters.c -o src/5_4/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/filters.c -o src/5_4/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/renderer.c -o src/5_4/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/renderer.c -o src/5_4/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/filter_tmpl.c -o src/5_4/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/filter_tmpl.c -o src/5_4/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/rodread.c -o src/5_4/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/rodread.c -o src/5_4/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/types.c -o src/5_4/types.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/types.c -o src/5_4/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/trees.c -o src/5_4/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/trees.c -o src/5_4/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/memfiles.c -o src/5_4/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/memfiles.c -o src/5_4/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/rodwrite.c -o src/5_4/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/rodwrite.c -o src/5_4/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/passes.c -o src/5_4/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/passes.c -o src/5_4/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/magicsys.c -o src/5_4/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/magicsys.c -o src/5_4/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/nimsets.c -o src/5_4/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/nimsets.c -o src/5_4/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/bitsets.c -o src/5_4/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/bitsets.c -o src/5_4/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/semthreads.c -o src/5_4/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/semthreads.c -o src/5_4/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/importer.c -o src/5_4/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/importer.c -o src/5_4/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/lookups.c -o src/5_4/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/lookups.c -o src/5_4/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/semdata.c -o src/5_4/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/semdata.c -o src/5_4/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/treetab.c -o src/5_4/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/treetab.c -o src/5_4/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/evals.c -o src/5_4/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/evals.c -o src/5_4/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/semfold.c -o src/5_4/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/semfold.c -o src/5_4/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/saturate.c -o src/5_4/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/saturate.c -o src/5_4/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/transf.c -o src/5_4/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/transf.c -o src/5_4/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/cgmeth.c -o src/5_4/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/cgmeth.c -o src/5_4/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/sempass2.c -o src/5_4/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/sempass2.c -o src/5_4/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/guards.c -o src/5_4/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/guards.c -o src/5_4/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/lambdalifting.c -o src/5_4/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/lambdalifting.c -o src/5_4/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/evaltempl.c -o src/5_4/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/evaltempl.c -o src/5_4/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/sem.c -o src/5_4/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/sem.c -o src/5_4/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/procfind.c -o src/5_4/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/procfind.c -o src/5_4/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/pragmas.c -o src/5_4/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/pragmas.c -o src/5_4/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/semtypinst.c -o src/5_4/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/semtypinst.c -o src/5_4/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/sigmatch.c -o src/5_4/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/sigmatch.c -o src/5_4/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/parampatterns.c -o src/5_4/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/parampatterns.c -o src/5_4/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/docgen.c -o src/5_4/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/docgen.c -o src/5_4/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/rstast.c -o src/5_4/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/rstast.c -o src/5_4/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/rst.c -o src/5_4/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/rst.c -o src/5_4/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/rstgen.c -o src/5_4/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/rstgen.c -o src/5_4/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/highlite.c -o src/5_4/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/highlite.c -o src/5_4/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/algorithm.c -o src/5_4/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/algorithm.c -o src/5_4/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/sequtils.c -o src/5_4/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/sequtils.c -o src/5_4/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/aliases.c -o src/5_4/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/aliases.c -o src/5_4/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/patterns.c -o src/5_4/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/patterns.c -o src/5_4/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/cgen.c -o src/5_4/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/cgen.c -o src/5_4/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/ccgutils.c -o src/5_4/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/ccgutils.c -o src/5_4/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/cgendata.c -o src/5_4/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/cgendata.c -o src/5_4/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/ccgmerge.c -o src/5_4/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/ccgmerge.c -o src/5_4/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/jsgen.c -o src/5_4/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/jsgen.c -o src/5_4/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/json.c -o src/5_4/json.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/json.c -o src/5_4/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/lexbase.c -o src/5_4/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/lexbase.c -o src/5_4/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/unicode.c -o src/5_4/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/unicode.c -o src/5_4/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/passaux.c -o src/5_4/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/passaux.c -o src/5_4/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/depends.c -o src/5_4/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/depends.c -o src/5_4/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/docgen2.c -o src/5_4/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/docgen2.c -o src/5_4/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/service.c -o src/5_4/service.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/service.c -o src/5_4/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/parseopt.c -o src/5_4/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/parseopt.c -o src/5_4/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/modules.c -o src/5_4/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/modules.c -o src/5_4/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/5_4/pretty.c -o src/5_4/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/5_4/pretty.c -o src/5_4/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/5_4/nimrod.o \
src/5_4/system.o \
src/5_4/commands.o \
src/5_4/os.o \
src/5_4/strutils.o \
src/5_4/parseutils.o \
src/5_4/times.o \
src/5_4/posix.o \
src/5_4/msgs.o \
src/5_4/options.o \
src/5_4/lists.o \
src/5_4/strtabs.o \
src/5_4/hashes.o \
src/5_4/tables.o \
src/5_4/math.o \
src/5_4/sockets.o \
src/5_4/ropes.o \
src/5_4/platform.o \
src/5_4/crc.o \
src/5_4/nversion.o \
src/5_4/condsyms.o \
src/5_4/idents.o \
src/5_4/extccomp.o \
src/5_4/osproc.o \
src/5_4/streams.o \
src/5_4/wordrecg.o \
src/5_4/babelcmd.o \
src/5_4/lexer.o \
src/5_4/nimlexbase.o \
src/5_4/llstream.o \
src/5_4/nimconf.o \
src/5_4/main.o \
src/5_4/ast.o \
src/5_4/intsets.o \
src/5_4/idgen.o \
src/5_4/astalgo.o \
src/5_4/rodutils.o \
src/5_4/syntaxes.o \
src/5_4/parser.o \
src/5_4/pbraces.o \
src/5_4/filters.o \
src/5_4/renderer.o \
src/5_4/filter_tmpl.o \
src/5_4/rodread.o \
src/5_4/types.o \
src/5_4/trees.o \
src/5_4/memfiles.o \
src/5_4/rodwrite.o \
src/5_4/passes.o \
src/5_4/magicsys.o \
src/5_4/nimsets.o \
src/5_4/bitsets.o \
src/5_4/semthreads.o \
src/5_4/importer.o \
src/5_4/lookups.o \
src/5_4/semdata.o \
src/5_4/treetab.o \
src/5_4/evals.o \
src/5_4/semfold.o \
src/5_4/saturate.o \
src/5_4/transf.o \
src/5_4/cgmeth.o \
src/5_4/sempass2.o \
src/5_4/guards.o \
src/5_4/lambdalifting.o \
src/5_4/evaltempl.o \
src/5_4/sem.o \
src/5_4/procfind.o \
src/5_4/pragmas.o \
src/5_4/semtypinst.o \
src/5_4/sigmatch.o \
src/5_4/parampatterns.o \
src/5_4/docgen.o \
src/5_4/rstast.o \
src/5_4/rst.o \
src/5_4/rstgen.o \
src/5_4/highlite.o \
src/5_4/algorithm.o \
src/5_4/sequtils.o \
src/5_4/aliases.o \
src/5_4/patterns.o \
src/5_4/cgen.o \
src/5_4/ccgutils.o \
src/5_4/cgendata.o \
src/5_4/ccgmerge.o \
src/5_4/jsgen.o \
src/5_4/json.o \
src/5_4/lexbase.o \
src/5_4/unicode.o \
src/5_4/passaux.o \
src/5_4/depends.o \
src/5_4/docgen2.o \
src/5_4/service.o \
src/5_4/parseopt.o \
src/5_4/modules.o \
src/5_4/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/5_4/nimrod.o \
src/5_4/system.o \
src/5_4/commands.o \
src/5_4/os.o \
src/5_4/strutils.o \
src/5_4/parseutils.o \
src/5_4/times.o \
src/5_4/posix.o \
src/5_4/msgs.o \
src/5_4/options.o \
src/5_4/lists.o \
src/5_4/strtabs.o \
src/5_4/hashes.o \
src/5_4/tables.o \
src/5_4/math.o \
src/5_4/sockets.o \
src/5_4/ropes.o \
src/5_4/platform.o \
src/5_4/crc.o \
src/5_4/nversion.o \
src/5_4/condsyms.o \
src/5_4/idents.o \
src/5_4/extccomp.o \
src/5_4/osproc.o \
src/5_4/streams.o \
src/5_4/wordrecg.o \
src/5_4/babelcmd.o \
src/5_4/lexer.o \
src/5_4/nimlexbase.o \
src/5_4/llstream.o \
src/5_4/nimconf.o \
src/5_4/main.o \
src/5_4/ast.o \
src/5_4/intsets.o \
src/5_4/idgen.o \
src/5_4/astalgo.o \
src/5_4/rodutils.o \
src/5_4/syntaxes.o \
src/5_4/parser.o \
src/5_4/pbraces.o \
src/5_4/filters.o \
src/5_4/renderer.o \
src/5_4/filter_tmpl.o \
src/5_4/rodread.o \
src/5_4/types.o \
src/5_4/trees.o \
src/5_4/memfiles.o \
src/5_4/rodwrite.o \
src/5_4/passes.o \
src/5_4/magicsys.o \
src/5_4/nimsets.o \
src/5_4/bitsets.o \
src/5_4/semthreads.o \
src/5_4/importer.o \
src/5_4/lookups.o \
src/5_4/semdata.o \
src/5_4/treetab.o \
src/5_4/evals.o \
src/5_4/semfold.o \
src/5_4/saturate.o \
src/5_4/transf.o \
src/5_4/cgmeth.o \
src/5_4/sempass2.o \
src/5_4/guards.o \
src/5_4/lambdalifting.o \
src/5_4/evaltempl.o \
src/5_4/sem.o \
src/5_4/procfind.o \
src/5_4/pragmas.o \
src/5_4/semtypinst.o \
src/5_4/sigmatch.o \
src/5_4/parampatterns.o \
src/5_4/docgen.o \
src/5_4/rstast.o \
src/5_4/rst.o \
src/5_4/rstgen.o \
src/5_4/highlite.o \
src/5_4/algorithm.o \
src/5_4/sequtils.o \
src/5_4/aliases.o \
src/5_4/patterns.o \
src/5_4/cgen.o \
src/5_4/ccgutils.o \
src/5_4/cgendata.o \
src/5_4/ccgmerge.o \
src/5_4/jsgen.o \
src/5_4/json.o \
src/5_4/lexbase.o \
src/5_4/unicode.o \
src/5_4/passaux.o \
src/5_4/depends.o \
src/5_4/docgen2.o \
src/5_4/service.o \
src/5_4/parseopt.o \
src/5_4/modules.o \
src/5_4/pretty.o $LINK_FLAGS
    ;;
  *)
    echo "Error: no C code generated for: [$myos: $mycpu]"
    exit 1
    ;;
  esac
  ;;
netbsd) 
  case $mycpu in
  i386)
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/nimrod.c -o src/6_1/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/nimrod.c -o src/6_1/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/system.c -o src/6_1/system.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/system.c -o src/6_1/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/commands.c -o src/6_1/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/commands.c -o src/6_1/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/os.c -o src/6_1/os.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/os.c -o src/6_1/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/strutils.c -o src/6_1/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/strutils.c -o src/6_1/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/parseutils.c -o src/6_1/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/parseutils.c -o src/6_1/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/times.c -o src/6_1/times.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/times.c -o src/6_1/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/posix.c -o src/6_1/posix.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/posix.c -o src/6_1/posix.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/msgs.c -o src/6_1/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/msgs.c -o src/6_1/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/options.c -o src/6_1/options.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/options.c -o src/6_1/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/lists.c -o src/6_1/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/lists.c -o src/6_1/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/strtabs.c -o src/6_1/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/strtabs.c -o src/6_1/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/hashes.c -o src/6_1/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/hashes.c -o src/6_1/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/tables.c -o src/6_1/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/tables.c -o src/6_1/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/math.c -o src/6_1/math.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/math.c -o src/6_1/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/sockets.c -o src/6_1/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/sockets.c -o src/6_1/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/ropes.c -o src/6_1/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/ropes.c -o src/6_1/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/platform.c -o src/6_1/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/platform.c -o src/6_1/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/crc.c -o src/6_1/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/crc.c -o src/6_1/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/nversion.c -o src/6_1/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/nversion.c -o src/6_1/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/condsyms.c -o src/6_1/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/condsyms.c -o src/6_1/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/idents.c -o src/6_1/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/idents.c -o src/6_1/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/extccomp.c -o src/6_1/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/extccomp.c -o src/6_1/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/osproc.c -o src/6_1/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/osproc.c -o src/6_1/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/streams.c -o src/6_1/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/streams.c -o src/6_1/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/wordrecg.c -o src/6_1/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/wordrecg.c -o src/6_1/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/babelcmd.c -o src/6_1/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/babelcmd.c -o src/6_1/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/lexer.c -o src/6_1/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/lexer.c -o src/6_1/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/nimlexbase.c -o src/6_1/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/nimlexbase.c -o src/6_1/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/llstream.c -o src/6_1/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/llstream.c -o src/6_1/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/nimconf.c -o src/6_1/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/nimconf.c -o src/6_1/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/main.c -o src/6_1/main.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/main.c -o src/6_1/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/ast.c -o src/6_1/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/ast.c -o src/6_1/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/intsets.c -o src/6_1/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/intsets.c -o src/6_1/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/idgen.c -o src/6_1/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/idgen.c -o src/6_1/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/astalgo.c -o src/6_1/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/astalgo.c -o src/6_1/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/rodutils.c -o src/6_1/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/rodutils.c -o src/6_1/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/syntaxes.c -o src/6_1/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/syntaxes.c -o src/6_1/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/parser.c -o src/6_1/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/parser.c -o src/6_1/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/pbraces.c -o src/6_1/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/pbraces.c -o src/6_1/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/filters.c -o src/6_1/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/filters.c -o src/6_1/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/renderer.c -o src/6_1/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/renderer.c -o src/6_1/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/filter_tmpl.c -o src/6_1/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/filter_tmpl.c -o src/6_1/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/rodread.c -o src/6_1/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/rodread.c -o src/6_1/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/types.c -o src/6_1/types.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/types.c -o src/6_1/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/trees.c -o src/6_1/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/trees.c -o src/6_1/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/memfiles.c -o src/6_1/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/memfiles.c -o src/6_1/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/rodwrite.c -o src/6_1/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/rodwrite.c -o src/6_1/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/passes.c -o src/6_1/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/passes.c -o src/6_1/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/magicsys.c -o src/6_1/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/magicsys.c -o src/6_1/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/nimsets.c -o src/6_1/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/nimsets.c -o src/6_1/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/bitsets.c -o src/6_1/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/bitsets.c -o src/6_1/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/semthreads.c -o src/6_1/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/semthreads.c -o src/6_1/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/importer.c -o src/6_1/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/importer.c -o src/6_1/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/lookups.c -o src/6_1/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/lookups.c -o src/6_1/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/semdata.c -o src/6_1/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/semdata.c -o src/6_1/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/treetab.c -o src/6_1/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/treetab.c -o src/6_1/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/evals.c -o src/6_1/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/evals.c -o src/6_1/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/semfold.c -o src/6_1/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/semfold.c -o src/6_1/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/saturate.c -o src/6_1/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/saturate.c -o src/6_1/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/transf.c -o src/6_1/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/transf.c -o src/6_1/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/cgmeth.c -o src/6_1/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/cgmeth.c -o src/6_1/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/sempass2.c -o src/6_1/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/sempass2.c -o src/6_1/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/guards.c -o src/6_1/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/guards.c -o src/6_1/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/lambdalifting.c -o src/6_1/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/lambdalifting.c -o src/6_1/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/evaltempl.c -o src/6_1/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/evaltempl.c -o src/6_1/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/sem.c -o src/6_1/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/sem.c -o src/6_1/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/procfind.c -o src/6_1/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/procfind.c -o src/6_1/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/pragmas.c -o src/6_1/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/pragmas.c -o src/6_1/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/semtypinst.c -o src/6_1/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/semtypinst.c -o src/6_1/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/sigmatch.c -o src/6_1/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/sigmatch.c -o src/6_1/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/parampatterns.c -o src/6_1/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/parampatterns.c -o src/6_1/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/docgen.c -o src/6_1/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/docgen.c -o src/6_1/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/rstast.c -o src/6_1/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/rstast.c -o src/6_1/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/rst.c -o src/6_1/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/rst.c -o src/6_1/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/rstgen.c -o src/6_1/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/rstgen.c -o src/6_1/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/highlite.c -o src/6_1/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/highlite.c -o src/6_1/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/algorithm.c -o src/6_1/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/algorithm.c -o src/6_1/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/sequtils.c -o src/6_1/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/sequtils.c -o src/6_1/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/aliases.c -o src/6_1/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/aliases.c -o src/6_1/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/patterns.c -o src/6_1/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/patterns.c -o src/6_1/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/cgen.c -o src/6_1/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/cgen.c -o src/6_1/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/ccgutils.c -o src/6_1/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/ccgutils.c -o src/6_1/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/cgendata.c -o src/6_1/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/cgendata.c -o src/6_1/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/ccgmerge.c -o src/6_1/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/ccgmerge.c -o src/6_1/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/jsgen.c -o src/6_1/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/jsgen.c -o src/6_1/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/json.c -o src/6_1/json.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/json.c -o src/6_1/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/lexbase.c -o src/6_1/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/lexbase.c -o src/6_1/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/unicode.c -o src/6_1/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/unicode.c -o src/6_1/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/passaux.c -o src/6_1/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/passaux.c -o src/6_1/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/depends.c -o src/6_1/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/depends.c -o src/6_1/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/docgen2.c -o src/6_1/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/docgen2.c -o src/6_1/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/service.c -o src/6_1/service.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/service.c -o src/6_1/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/parseopt.c -o src/6_1/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/parseopt.c -o src/6_1/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/modules.c -o src/6_1/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/modules.c -o src/6_1/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_1/pretty.c -o src/6_1/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/6_1/pretty.c -o src/6_1/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/6_1/nimrod.o \
src/6_1/system.o \
src/6_1/commands.o \
src/6_1/os.o \
src/6_1/strutils.o \
src/6_1/parseutils.o \
src/6_1/times.o \
src/6_1/posix.o \
src/6_1/msgs.o \
src/6_1/options.o \
src/6_1/lists.o \
src/6_1/strtabs.o \
src/6_1/hashes.o \
src/6_1/tables.o \
src/6_1/math.o \
src/6_1/sockets.o \
src/6_1/ropes.o \
src/6_1/platform.o \
src/6_1/crc.o \
src/6_1/nversion.o \
src/6_1/condsyms.o \
src/6_1/idents.o \
src/6_1/extccomp.o \
src/6_1/osproc.o \
src/6_1/streams.o \
src/6_1/wordrecg.o \
src/6_1/babelcmd.o \
src/6_1/lexer.o \
src/6_1/nimlexbase.o \
src/6_1/llstream.o \
src/6_1/nimconf.o \
src/6_1/main.o \
src/6_1/ast.o \
src/6_1/intsets.o \
src/6_1/idgen.o \
src/6_1/astalgo.o \
src/6_1/rodutils.o \
src/6_1/syntaxes.o \
src/6_1/parser.o \
src/6_1/pbraces.o \
src/6_1/filters.o \
src/6_1/renderer.o \
src/6_1/filter_tmpl.o \
src/6_1/rodread.o \
src/6_1/types.o \
src/6_1/trees.o \
src/6_1/memfiles.o \
src/6_1/rodwrite.o \
src/6_1/passes.o \
src/6_1/magicsys.o \
src/6_1/nimsets.o \
src/6_1/bitsets.o \
src/6_1/semthreads.o \
src/6_1/importer.o \
src/6_1/lookups.o \
src/6_1/semdata.o \
src/6_1/treetab.o \
src/6_1/evals.o \
src/6_1/semfold.o \
src/6_1/saturate.o \
src/6_1/transf.o \
src/6_1/cgmeth.o \
src/6_1/sempass2.o \
src/6_1/guards.o \
src/6_1/lambdalifting.o \
src/6_1/evaltempl.o \
src/6_1/sem.o \
src/6_1/procfind.o \
src/6_1/pragmas.o \
src/6_1/semtypinst.o \
src/6_1/sigmatch.o \
src/6_1/parampatterns.o \
src/6_1/docgen.o \
src/6_1/rstast.o \
src/6_1/rst.o \
src/6_1/rstgen.o \
src/6_1/highlite.o \
src/6_1/algorithm.o \
src/6_1/sequtils.o \
src/6_1/aliases.o \
src/6_1/patterns.o \
src/6_1/cgen.o \
src/6_1/ccgutils.o \
src/6_1/cgendata.o \
src/6_1/ccgmerge.o \
src/6_1/jsgen.o \
src/6_1/json.o \
src/6_1/lexbase.o \
src/6_1/unicode.o \
src/6_1/passaux.o \
src/6_1/depends.o \
src/6_1/docgen2.o \
src/6_1/service.o \
src/6_1/parseopt.o \
src/6_1/modules.o \
src/6_1/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/6_1/nimrod.o \
src/6_1/system.o \
src/6_1/commands.o \
src/6_1/os.o \
src/6_1/strutils.o \
src/6_1/parseutils.o \
src/6_1/times.o \
src/6_1/posix.o \
src/6_1/msgs.o \
src/6_1/options.o \
src/6_1/lists.o \
src/6_1/strtabs.o \
src/6_1/hashes.o \
src/6_1/tables.o \
src/6_1/math.o \
src/6_1/sockets.o \
src/6_1/ropes.o \
src/6_1/platform.o \
src/6_1/crc.o \
src/6_1/nversion.o \
src/6_1/condsyms.o \
src/6_1/idents.o \
src/6_1/extccomp.o \
src/6_1/osproc.o \
src/6_1/streams.o \
src/6_1/wordrecg.o \
src/6_1/babelcmd.o \
src/6_1/lexer.o \
src/6_1/nimlexbase.o \
src/6_1/llstream.o \
src/6_1/nimconf.o \
src/6_1/main.o \
src/6_1/ast.o \
src/6_1/intsets.o \
src/6_1/idgen.o \
src/6_1/astalgo.o \
src/6_1/rodutils.o \
src/6_1/syntaxes.o \
src/6_1/parser.o \
src/6_1/pbraces.o \
src/6_1/filters.o \
src/6_1/renderer.o \
src/6_1/filter_tmpl.o \
src/6_1/rodread.o \
src/6_1/types.o \
src/6_1/trees.o \
src/6_1/memfiles.o \
src/6_1/rodwrite.o \
src/6_1/passes.o \
src/6_1/magicsys.o \
src/6_1/nimsets.o \
src/6_1/bitsets.o \
src/6_1/semthreads.o \
src/6_1/importer.o \
src/6_1/lookups.o \
src/6_1/semdata.o \
src/6_1/treetab.o \
src/6_1/evals.o \
src/6_1/semfold.o \
src/6_1/saturate.o \
src/6_1/transf.o \
src/6_1/cgmeth.o \
src/6_1/sempass2.o \
src/6_1/guards.o \
src/6_1/lambdalifting.o \
src/6_1/evaltempl.o \
src/6_1/sem.o \
src/6_1/procfind.o \
src/6_1/pragmas.o \
src/6_1/semtypinst.o \
src/6_1/sigmatch.o \
src/6_1/parampatterns.o \
src/6_1/docgen.o \
src/6_1/rstast.o \
src/6_1/rst.o \
src/6_1/rstgen.o \
src/6_1/highlite.o \
src/6_1/algorithm.o \
src/6_1/sequtils.o \
src/6_1/aliases.o \
src/6_1/patterns.o \
src/6_1/cgen.o \
src/6_1/ccgutils.o \
src/6_1/cgendata.o \
src/6_1/ccgmerge.o \
src/6_1/jsgen.o \
src/6_1/json.o \
src/6_1/lexbase.o \
src/6_1/unicode.o \
src/6_1/passaux.o \
src/6_1/depends.o \
src/6_1/docgen2.o \
src/6_1/service.o \
src/6_1/parseopt.o \
src/6_1/modules.o \
src/6_1/pretty.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/nimrod.c -o src/6_2/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/nimrod.c -o src/6_2/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/system.c -o src/6_2/system.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/system.c -o src/6_2/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/commands.c -o src/6_2/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/commands.c -o src/6_2/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/os.c -o src/6_2/os.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/os.c -o src/6_2/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/strutils.c -o src/6_2/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/strutils.c -o src/6_2/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/parseutils.c -o src/6_2/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/parseutils.c -o src/6_2/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/times.c -o src/6_2/times.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/times.c -o src/6_2/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/posix.c -o src/6_2/posix.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/posix.c -o src/6_2/posix.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/msgs.c -o src/6_2/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/msgs.c -o src/6_2/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/options.c -o src/6_2/options.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/options.c -o src/6_2/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/lists.c -o src/6_2/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/lists.c -o src/6_2/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/strtabs.c -o src/6_2/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/strtabs.c -o src/6_2/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/hashes.c -o src/6_2/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/hashes.c -o src/6_2/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/tables.c -o src/6_2/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/tables.c -o src/6_2/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/math.c -o src/6_2/math.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/math.c -o src/6_2/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/sockets.c -o src/6_2/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/sockets.c -o src/6_2/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/ropes.c -o src/6_2/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/ropes.c -o src/6_2/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/platform.c -o src/6_2/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/platform.c -o src/6_2/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/crc.c -o src/6_2/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/crc.c -o src/6_2/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/nversion.c -o src/6_2/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/nversion.c -o src/6_2/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/condsyms.c -o src/6_2/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/condsyms.c -o src/6_2/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/idents.c -o src/6_2/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/idents.c -o src/6_2/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/extccomp.c -o src/6_2/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/extccomp.c -o src/6_2/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/osproc.c -o src/6_2/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/osproc.c -o src/6_2/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/streams.c -o src/6_2/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/streams.c -o src/6_2/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/wordrecg.c -o src/6_2/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/wordrecg.c -o src/6_2/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/babelcmd.c -o src/6_2/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/babelcmd.c -o src/6_2/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/lexer.c -o src/6_2/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/lexer.c -o src/6_2/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/nimlexbase.c -o src/6_2/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/nimlexbase.c -o src/6_2/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/llstream.c -o src/6_2/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/llstream.c -o src/6_2/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/nimconf.c -o src/6_2/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/nimconf.c -o src/6_2/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/main.c -o src/6_2/main.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/main.c -o src/6_2/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/ast.c -o src/6_2/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/ast.c -o src/6_2/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/intsets.c -o src/6_2/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/intsets.c -o src/6_2/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/idgen.c -o src/6_2/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/idgen.c -o src/6_2/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/astalgo.c -o src/6_2/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/astalgo.c -o src/6_2/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/rodutils.c -o src/6_2/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/rodutils.c -o src/6_2/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/syntaxes.c -o src/6_2/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/syntaxes.c -o src/6_2/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/parser.c -o src/6_2/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/parser.c -o src/6_2/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/pbraces.c -o src/6_2/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/pbraces.c -o src/6_2/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/filters.c -o src/6_2/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/filters.c -o src/6_2/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/renderer.c -o src/6_2/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/renderer.c -o src/6_2/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/filter_tmpl.c -o src/6_2/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/filter_tmpl.c -o src/6_2/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/rodread.c -o src/6_2/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/rodread.c -o src/6_2/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/types.c -o src/6_2/types.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/types.c -o src/6_2/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/trees.c -o src/6_2/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/trees.c -o src/6_2/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/memfiles.c -o src/6_2/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/memfiles.c -o src/6_2/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/rodwrite.c -o src/6_2/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/rodwrite.c -o src/6_2/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/passes.c -o src/6_2/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/passes.c -o src/6_2/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/magicsys.c -o src/6_2/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/magicsys.c -o src/6_2/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/nimsets.c -o src/6_2/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/nimsets.c -o src/6_2/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/bitsets.c -o src/6_2/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/bitsets.c -o src/6_2/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/semthreads.c -o src/6_2/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/semthreads.c -o src/6_2/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/importer.c -o src/6_2/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/importer.c -o src/6_2/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/lookups.c -o src/6_2/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/lookups.c -o src/6_2/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/semdata.c -o src/6_2/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/semdata.c -o src/6_2/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/treetab.c -o src/6_2/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/treetab.c -o src/6_2/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/evals.c -o src/6_2/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/evals.c -o src/6_2/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/semfold.c -o src/6_2/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/semfold.c -o src/6_2/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/saturate.c -o src/6_2/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/saturate.c -o src/6_2/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/transf.c -o src/6_2/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/transf.c -o src/6_2/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/cgmeth.c -o src/6_2/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/cgmeth.c -o src/6_2/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/sempass2.c -o src/6_2/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/sempass2.c -o src/6_2/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/guards.c -o src/6_2/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/guards.c -o src/6_2/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/lambdalifting.c -o src/6_2/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/lambdalifting.c -o src/6_2/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/evaltempl.c -o src/6_2/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/evaltempl.c -o src/6_2/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/sem.c -o src/6_2/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/sem.c -o src/6_2/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/procfind.c -o src/6_2/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/procfind.c -o src/6_2/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/pragmas.c -o src/6_2/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/pragmas.c -o src/6_2/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/semtypinst.c -o src/6_2/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/semtypinst.c -o src/6_2/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/sigmatch.c -o src/6_2/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/sigmatch.c -o src/6_2/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/parampatterns.c -o src/6_2/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/parampatterns.c -o src/6_2/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/docgen.c -o src/6_2/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/docgen.c -o src/6_2/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/rstast.c -o src/6_2/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/rstast.c -o src/6_2/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/rst.c -o src/6_2/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/rst.c -o src/6_2/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/rstgen.c -o src/6_2/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/rstgen.c -o src/6_2/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/highlite.c -o src/6_2/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/highlite.c -o src/6_2/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/algorithm.c -o src/6_2/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/algorithm.c -o src/6_2/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/sequtils.c -o src/6_2/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/sequtils.c -o src/6_2/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/aliases.c -o src/6_2/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/aliases.c -o src/6_2/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/patterns.c -o src/6_2/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/patterns.c -o src/6_2/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/cgen.c -o src/6_2/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/cgen.c -o src/6_2/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/ccgutils.c -o src/6_2/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/ccgutils.c -o src/6_2/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/cgendata.c -o src/6_2/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/cgendata.c -o src/6_2/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/ccgmerge.c -o src/6_2/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/ccgmerge.c -o src/6_2/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/jsgen.c -o src/6_2/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/jsgen.c -o src/6_2/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/json.c -o src/6_2/json.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/json.c -o src/6_2/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/lexbase.c -o src/6_2/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/lexbase.c -o src/6_2/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/unicode.c -o src/6_2/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/unicode.c -o src/6_2/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/passaux.c -o src/6_2/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/passaux.c -o src/6_2/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/depends.c -o src/6_2/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/depends.c -o src/6_2/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/docgen2.c -o src/6_2/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/docgen2.c -o src/6_2/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/service.c -o src/6_2/service.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/service.c -o src/6_2/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/parseopt.c -o src/6_2/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/parseopt.c -o src/6_2/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/modules.c -o src/6_2/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/modules.c -o src/6_2/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_2/pretty.c -o src/6_2/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/6_2/pretty.c -o src/6_2/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/6_2/nimrod.o \
src/6_2/system.o \
src/6_2/commands.o \
src/6_2/os.o \
src/6_2/strutils.o \
src/6_2/parseutils.o \
src/6_2/times.o \
src/6_2/posix.o \
src/6_2/msgs.o \
src/6_2/options.o \
src/6_2/lists.o \
src/6_2/strtabs.o \
src/6_2/hashes.o \
src/6_2/tables.o \
src/6_2/math.o \
src/6_2/sockets.o \
src/6_2/ropes.o \
src/6_2/platform.o \
src/6_2/crc.o \
src/6_2/nversion.o \
src/6_2/condsyms.o \
src/6_2/idents.o \
src/6_2/extccomp.o \
src/6_2/osproc.o \
src/6_2/streams.o \
src/6_2/wordrecg.o \
src/6_2/babelcmd.o \
src/6_2/lexer.o \
src/6_2/nimlexbase.o \
src/6_2/llstream.o \
src/6_2/nimconf.o \
src/6_2/main.o \
src/6_2/ast.o \
src/6_2/intsets.o \
src/6_2/idgen.o \
src/6_2/astalgo.o \
src/6_2/rodutils.o \
src/6_2/syntaxes.o \
src/6_2/parser.o \
src/6_2/pbraces.o \
src/6_2/filters.o \
src/6_2/renderer.o \
src/6_2/filter_tmpl.o \
src/6_2/rodread.o \
src/6_2/types.o \
src/6_2/trees.o \
src/6_2/memfiles.o \
src/6_2/rodwrite.o \
src/6_2/passes.o \
src/6_2/magicsys.o \
src/6_2/nimsets.o \
src/6_2/bitsets.o \
src/6_2/semthreads.o \
src/6_2/importer.o \
src/6_2/lookups.o \
src/6_2/semdata.o \
src/6_2/treetab.o \
src/6_2/evals.o \
src/6_2/semfold.o \
src/6_2/saturate.o \
src/6_2/transf.o \
src/6_2/cgmeth.o \
src/6_2/sempass2.o \
src/6_2/guards.o \
src/6_2/lambdalifting.o \
src/6_2/evaltempl.o \
src/6_2/sem.o \
src/6_2/procfind.o \
src/6_2/pragmas.o \
src/6_2/semtypinst.o \
src/6_2/sigmatch.o \
src/6_2/parampatterns.o \
src/6_2/docgen.o \
src/6_2/rstast.o \
src/6_2/rst.o \
src/6_2/rstgen.o \
src/6_2/highlite.o \
src/6_2/algorithm.o \
src/6_2/sequtils.o \
src/6_2/aliases.o \
src/6_2/patterns.o \
src/6_2/cgen.o \
src/6_2/ccgutils.o \
src/6_2/cgendata.o \
src/6_2/ccgmerge.o \
src/6_2/jsgen.o \
src/6_2/json.o \
src/6_2/lexbase.o \
src/6_2/unicode.o \
src/6_2/passaux.o \
src/6_2/depends.o \
src/6_2/docgen2.o \
src/6_2/service.o \
src/6_2/parseopt.o \
src/6_2/modules.o \
src/6_2/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/6_2/nimrod.o \
src/6_2/system.o \
src/6_2/commands.o \
src/6_2/os.o \
src/6_2/strutils.o \
src/6_2/parseutils.o \
src/6_2/times.o \
src/6_2/posix.o \
src/6_2/msgs.o \
src/6_2/options.o \
src/6_2/lists.o \
src/6_2/strtabs.o \
src/6_2/hashes.o \
src/6_2/tables.o \
src/6_2/math.o \
src/6_2/sockets.o \
src/6_2/ropes.o \
src/6_2/platform.o \
src/6_2/crc.o \
src/6_2/nversion.o \
src/6_2/condsyms.o \
src/6_2/idents.o \
src/6_2/extccomp.o \
src/6_2/osproc.o \
src/6_2/streams.o \
src/6_2/wordrecg.o \
src/6_2/babelcmd.o \
src/6_2/lexer.o \
src/6_2/nimlexbase.o \
src/6_2/llstream.o \
src/6_2/nimconf.o \
src/6_2/main.o \
src/6_2/ast.o \
src/6_2/intsets.o \
src/6_2/idgen.o \
src/6_2/astalgo.o \
src/6_2/rodutils.o \
src/6_2/syntaxes.o \
src/6_2/parser.o \
src/6_2/pbraces.o \
src/6_2/filters.o \
src/6_2/renderer.o \
src/6_2/filter_tmpl.o \
src/6_2/rodread.o \
src/6_2/types.o \
src/6_2/trees.o \
src/6_2/memfiles.o \
src/6_2/rodwrite.o \
src/6_2/passes.o \
src/6_2/magicsys.o \
src/6_2/nimsets.o \
src/6_2/bitsets.o \
src/6_2/semthreads.o \
src/6_2/importer.o \
src/6_2/lookups.o \
src/6_2/semdata.o \
src/6_2/treetab.o \
src/6_2/evals.o \
src/6_2/semfold.o \
src/6_2/saturate.o \
src/6_2/transf.o \
src/6_2/cgmeth.o \
src/6_2/sempass2.o \
src/6_2/guards.o \
src/6_2/lambdalifting.o \
src/6_2/evaltempl.o \
src/6_2/sem.o \
src/6_2/procfind.o \
src/6_2/pragmas.o \
src/6_2/semtypinst.o \
src/6_2/sigmatch.o \
src/6_2/parampatterns.o \
src/6_2/docgen.o \
src/6_2/rstast.o \
src/6_2/rst.o \
src/6_2/rstgen.o \
src/6_2/highlite.o \
src/6_2/algorithm.o \
src/6_2/sequtils.o \
src/6_2/aliases.o \
src/6_2/patterns.o \
src/6_2/cgen.o \
src/6_2/ccgutils.o \
src/6_2/cgendata.o \
src/6_2/ccgmerge.o \
src/6_2/jsgen.o \
src/6_2/json.o \
src/6_2/lexbase.o \
src/6_2/unicode.o \
src/6_2/passaux.o \
src/6_2/depends.o \
src/6_2/docgen2.o \
src/6_2/service.o \
src/6_2/parseopt.o \
src/6_2/modules.o \
src/6_2/pretty.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/nimrod.c -o src/6_3/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/nimrod.c -o src/6_3/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/system.c -o src/6_3/system.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/system.c -o src/6_3/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/commands.c -o src/6_3/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/commands.c -o src/6_3/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/os.c -o src/6_3/os.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/os.c -o src/6_3/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/strutils.c -o src/6_3/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/strutils.c -o src/6_3/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/parseutils.c -o src/6_3/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/parseutils.c -o src/6_3/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/times.c -o src/6_3/times.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/times.c -o src/6_3/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/posix.c -o src/6_3/posix.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/posix.c -o src/6_3/posix.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/msgs.c -o src/6_3/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/msgs.c -o src/6_3/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/options.c -o src/6_3/options.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/options.c -o src/6_3/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/lists.c -o src/6_3/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/lists.c -o src/6_3/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/strtabs.c -o src/6_3/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/strtabs.c -o src/6_3/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/hashes.c -o src/6_3/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/hashes.c -o src/6_3/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/tables.c -o src/6_3/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/tables.c -o src/6_3/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/math.c -o src/6_3/math.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/math.c -o src/6_3/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/sockets.c -o src/6_3/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/sockets.c -o src/6_3/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/ropes.c -o src/6_3/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/ropes.c -o src/6_3/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/platform.c -o src/6_3/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/platform.c -o src/6_3/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/crc.c -o src/6_3/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/crc.c -o src/6_3/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/nversion.c -o src/6_3/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/nversion.c -o src/6_3/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/condsyms.c -o src/6_3/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/condsyms.c -o src/6_3/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/idents.c -o src/6_3/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/idents.c -o src/6_3/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/extccomp.c -o src/6_3/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/extccomp.c -o src/6_3/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/osproc.c -o src/6_3/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/osproc.c -o src/6_3/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/streams.c -o src/6_3/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/streams.c -o src/6_3/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/wordrecg.c -o src/6_3/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/wordrecg.c -o src/6_3/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/babelcmd.c -o src/6_3/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/babelcmd.c -o src/6_3/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/lexer.c -o src/6_3/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/lexer.c -o src/6_3/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/nimlexbase.c -o src/6_3/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/nimlexbase.c -o src/6_3/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/llstream.c -o src/6_3/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/llstream.c -o src/6_3/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/nimconf.c -o src/6_3/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/nimconf.c -o src/6_3/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/main.c -o src/6_3/main.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/main.c -o src/6_3/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/ast.c -o src/6_3/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/ast.c -o src/6_3/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/intsets.c -o src/6_3/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/intsets.c -o src/6_3/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/idgen.c -o src/6_3/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/idgen.c -o src/6_3/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/astalgo.c -o src/6_3/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/astalgo.c -o src/6_3/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/rodutils.c -o src/6_3/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/rodutils.c -o src/6_3/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/syntaxes.c -o src/6_3/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/syntaxes.c -o src/6_3/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/parser.c -o src/6_3/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/parser.c -o src/6_3/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/pbraces.c -o src/6_3/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/pbraces.c -o src/6_3/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/filters.c -o src/6_3/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/filters.c -o src/6_3/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/renderer.c -o src/6_3/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/renderer.c -o src/6_3/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/filter_tmpl.c -o src/6_3/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/filter_tmpl.c -o src/6_3/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/rodread.c -o src/6_3/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/rodread.c -o src/6_3/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/types.c -o src/6_3/types.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/types.c -o src/6_3/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/trees.c -o src/6_3/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/trees.c -o src/6_3/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/memfiles.c -o src/6_3/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/memfiles.c -o src/6_3/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/rodwrite.c -o src/6_3/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/rodwrite.c -o src/6_3/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/passes.c -o src/6_3/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/passes.c -o src/6_3/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/magicsys.c -o src/6_3/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/magicsys.c -o src/6_3/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/nimsets.c -o src/6_3/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/nimsets.c -o src/6_3/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/bitsets.c -o src/6_3/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/bitsets.c -o src/6_3/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/semthreads.c -o src/6_3/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/semthreads.c -o src/6_3/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/importer.c -o src/6_3/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/importer.c -o src/6_3/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/lookups.c -o src/6_3/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/lookups.c -o src/6_3/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/semdata.c -o src/6_3/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/semdata.c -o src/6_3/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/treetab.c -o src/6_3/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/treetab.c -o src/6_3/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/evals.c -o src/6_3/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/evals.c -o src/6_3/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/semfold.c -o src/6_3/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/semfold.c -o src/6_3/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/saturate.c -o src/6_3/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/saturate.c -o src/6_3/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/transf.c -o src/6_3/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/transf.c -o src/6_3/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/cgmeth.c -o src/6_3/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/cgmeth.c -o src/6_3/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/sempass2.c -o src/6_3/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/sempass2.c -o src/6_3/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/guards.c -o src/6_3/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/guards.c -o src/6_3/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/lambdalifting.c -o src/6_3/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/lambdalifting.c -o src/6_3/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/evaltempl.c -o src/6_3/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/evaltempl.c -o src/6_3/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/sem.c -o src/6_3/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/sem.c -o src/6_3/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/procfind.c -o src/6_3/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/procfind.c -o src/6_3/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/pragmas.c -o src/6_3/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/pragmas.c -o src/6_3/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/semtypinst.c -o src/6_3/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/semtypinst.c -o src/6_3/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/sigmatch.c -o src/6_3/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/sigmatch.c -o src/6_3/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/parampatterns.c -o src/6_3/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/parampatterns.c -o src/6_3/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/docgen.c -o src/6_3/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/docgen.c -o src/6_3/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/rstast.c -o src/6_3/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/rstast.c -o src/6_3/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/rst.c -o src/6_3/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/rst.c -o src/6_3/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/rstgen.c -o src/6_3/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/rstgen.c -o src/6_3/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/highlite.c -o src/6_3/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/highlite.c -o src/6_3/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/algorithm.c -o src/6_3/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/algorithm.c -o src/6_3/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/sequtils.c -o src/6_3/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/sequtils.c -o src/6_3/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/aliases.c -o src/6_3/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/aliases.c -o src/6_3/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/patterns.c -o src/6_3/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/patterns.c -o src/6_3/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/cgen.c -o src/6_3/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/cgen.c -o src/6_3/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/ccgutils.c -o src/6_3/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/ccgutils.c -o src/6_3/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/cgendata.c -o src/6_3/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/cgendata.c -o src/6_3/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/ccgmerge.c -o src/6_3/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/ccgmerge.c -o src/6_3/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/jsgen.c -o src/6_3/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/jsgen.c -o src/6_3/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/json.c -o src/6_3/json.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/json.c -o src/6_3/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/lexbase.c -o src/6_3/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/lexbase.c -o src/6_3/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/unicode.c -o src/6_3/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/unicode.c -o src/6_3/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/passaux.c -o src/6_3/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/passaux.c -o src/6_3/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/depends.c -o src/6_3/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/depends.c -o src/6_3/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/docgen2.c -o src/6_3/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/docgen2.c -o src/6_3/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/service.c -o src/6_3/service.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/service.c -o src/6_3/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/parseopt.c -o src/6_3/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/parseopt.c -o src/6_3/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/modules.c -o src/6_3/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/modules.c -o src/6_3/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_3/pretty.c -o src/6_3/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/6_3/pretty.c -o src/6_3/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/6_3/nimrod.o \
src/6_3/system.o \
src/6_3/commands.o \
src/6_3/os.o \
src/6_3/strutils.o \
src/6_3/parseutils.o \
src/6_3/times.o \
src/6_3/posix.o \
src/6_3/msgs.o \
src/6_3/options.o \
src/6_3/lists.o \
src/6_3/strtabs.o \
src/6_3/hashes.o \
src/6_3/tables.o \
src/6_3/math.o \
src/6_3/sockets.o \
src/6_3/ropes.o \
src/6_3/platform.o \
src/6_3/crc.o \
src/6_3/nversion.o \
src/6_3/condsyms.o \
src/6_3/idents.o \
src/6_3/extccomp.o \
src/6_3/osproc.o \
src/6_3/streams.o \
src/6_3/wordrecg.o \
src/6_3/babelcmd.o \
src/6_3/lexer.o \
src/6_3/nimlexbase.o \
src/6_3/llstream.o \
src/6_3/nimconf.o \
src/6_3/main.o \
src/6_3/ast.o \
src/6_3/intsets.o \
src/6_3/idgen.o \
src/6_3/astalgo.o \
src/6_3/rodutils.o \
src/6_3/syntaxes.o \
src/6_3/parser.o \
src/6_3/pbraces.o \
src/6_3/filters.o \
src/6_3/renderer.o \
src/6_3/filter_tmpl.o \
src/6_3/rodread.o \
src/6_3/types.o \
src/6_3/trees.o \
src/6_3/memfiles.o \
src/6_3/rodwrite.o \
src/6_3/passes.o \
src/6_3/magicsys.o \
src/6_3/nimsets.o \
src/6_3/bitsets.o \
src/6_3/semthreads.o \
src/6_3/importer.o \
src/6_3/lookups.o \
src/6_3/semdata.o \
src/6_3/treetab.o \
src/6_3/evals.o \
src/6_3/semfold.o \
src/6_3/saturate.o \
src/6_3/transf.o \
src/6_3/cgmeth.o \
src/6_3/sempass2.o \
src/6_3/guards.o \
src/6_3/lambdalifting.o \
src/6_3/evaltempl.o \
src/6_3/sem.o \
src/6_3/procfind.o \
src/6_3/pragmas.o \
src/6_3/semtypinst.o \
src/6_3/sigmatch.o \
src/6_3/parampatterns.o \
src/6_3/docgen.o \
src/6_3/rstast.o \
src/6_3/rst.o \
src/6_3/rstgen.o \
src/6_3/highlite.o \
src/6_3/algorithm.o \
src/6_3/sequtils.o \
src/6_3/aliases.o \
src/6_3/patterns.o \
src/6_3/cgen.o \
src/6_3/ccgutils.o \
src/6_3/cgendata.o \
src/6_3/ccgmerge.o \
src/6_3/jsgen.o \
src/6_3/json.o \
src/6_3/lexbase.o \
src/6_3/unicode.o \
src/6_3/passaux.o \
src/6_3/depends.o \
src/6_3/docgen2.o \
src/6_3/service.o \
src/6_3/parseopt.o \
src/6_3/modules.o \
src/6_3/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/6_3/nimrod.o \
src/6_3/system.o \
src/6_3/commands.o \
src/6_3/os.o \
src/6_3/strutils.o \
src/6_3/parseutils.o \
src/6_3/times.o \
src/6_3/posix.o \
src/6_3/msgs.o \
src/6_3/options.o \
src/6_3/lists.o \
src/6_3/strtabs.o \
src/6_3/hashes.o \
src/6_3/tables.o \
src/6_3/math.o \
src/6_3/sockets.o \
src/6_3/ropes.o \
src/6_3/platform.o \
src/6_3/crc.o \
src/6_3/nversion.o \
src/6_3/condsyms.o \
src/6_3/idents.o \
src/6_3/extccomp.o \
src/6_3/osproc.o \
src/6_3/streams.o \
src/6_3/wordrecg.o \
src/6_3/babelcmd.o \
src/6_3/lexer.o \
src/6_3/nimlexbase.o \
src/6_3/llstream.o \
src/6_3/nimconf.o \
src/6_3/main.o \
src/6_3/ast.o \
src/6_3/intsets.o \
src/6_3/idgen.o \
src/6_3/astalgo.o \
src/6_3/rodutils.o \
src/6_3/syntaxes.o \
src/6_3/parser.o \
src/6_3/pbraces.o \
src/6_3/filters.o \
src/6_3/renderer.o \
src/6_3/filter_tmpl.o \
src/6_3/rodread.o \
src/6_3/types.o \
src/6_3/trees.o \
src/6_3/memfiles.o \
src/6_3/rodwrite.o \
src/6_3/passes.o \
src/6_3/magicsys.o \
src/6_3/nimsets.o \
src/6_3/bitsets.o \
src/6_3/semthreads.o \
src/6_3/importer.o \
src/6_3/lookups.o \
src/6_3/semdata.o \
src/6_3/treetab.o \
src/6_3/evals.o \
src/6_3/semfold.o \
src/6_3/saturate.o \
src/6_3/transf.o \
src/6_3/cgmeth.o \
src/6_3/sempass2.o \
src/6_3/guards.o \
src/6_3/lambdalifting.o \
src/6_3/evaltempl.o \
src/6_3/sem.o \
src/6_3/procfind.o \
src/6_3/pragmas.o \
src/6_3/semtypinst.o \
src/6_3/sigmatch.o \
src/6_3/parampatterns.o \
src/6_3/docgen.o \
src/6_3/rstast.o \
src/6_3/rst.o \
src/6_3/rstgen.o \
src/6_3/highlite.o \
src/6_3/algorithm.o \
src/6_3/sequtils.o \
src/6_3/aliases.o \
src/6_3/patterns.o \
src/6_3/cgen.o \
src/6_3/ccgutils.o \
src/6_3/cgendata.o \
src/6_3/ccgmerge.o \
src/6_3/jsgen.o \
src/6_3/json.o \
src/6_3/lexbase.o \
src/6_3/unicode.o \
src/6_3/passaux.o \
src/6_3/depends.o \
src/6_3/docgen2.o \
src/6_3/service.o \
src/6_3/parseopt.o \
src/6_3/modules.o \
src/6_3/pretty.o $LINK_FLAGS
    ;;
  arm)
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/nimrod.c -o src/6_4/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/nimrod.c -o src/6_4/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/system.c -o src/6_4/system.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/system.c -o src/6_4/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/commands.c -o src/6_4/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/commands.c -o src/6_4/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/os.c -o src/6_4/os.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/os.c -o src/6_4/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/strutils.c -o src/6_4/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/strutils.c -o src/6_4/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/parseutils.c -o src/6_4/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/parseutils.c -o src/6_4/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/times.c -o src/6_4/times.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/times.c -o src/6_4/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/posix.c -o src/6_4/posix.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/posix.c -o src/6_4/posix.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/msgs.c -o src/6_4/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/msgs.c -o src/6_4/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/options.c -o src/6_4/options.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/options.c -o src/6_4/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/lists.c -o src/6_4/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/lists.c -o src/6_4/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/strtabs.c -o src/6_4/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/strtabs.c -o src/6_4/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/hashes.c -o src/6_4/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/hashes.c -o src/6_4/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/tables.c -o src/6_4/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/tables.c -o src/6_4/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/math.c -o src/6_4/math.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/math.c -o src/6_4/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/sockets.c -o src/6_4/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/sockets.c -o src/6_4/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/ropes.c -o src/6_4/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/ropes.c -o src/6_4/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/platform.c -o src/6_4/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/platform.c -o src/6_4/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/crc.c -o src/6_4/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/crc.c -o src/6_4/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/nversion.c -o src/6_4/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/nversion.c -o src/6_4/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/condsyms.c -o src/6_4/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/condsyms.c -o src/6_4/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/idents.c -o src/6_4/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/idents.c -o src/6_4/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/extccomp.c -o src/6_4/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/extccomp.c -o src/6_4/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/osproc.c -o src/6_4/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/osproc.c -o src/6_4/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/streams.c -o src/6_4/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/streams.c -o src/6_4/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/wordrecg.c -o src/6_4/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/wordrecg.c -o src/6_4/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/babelcmd.c -o src/6_4/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/babelcmd.c -o src/6_4/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/lexer.c -o src/6_4/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/lexer.c -o src/6_4/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/nimlexbase.c -o src/6_4/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/nimlexbase.c -o src/6_4/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/llstream.c -o src/6_4/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/llstream.c -o src/6_4/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/nimconf.c -o src/6_4/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/nimconf.c -o src/6_4/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/main.c -o src/6_4/main.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/main.c -o src/6_4/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/ast.c -o src/6_4/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/ast.c -o src/6_4/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/intsets.c -o src/6_4/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/intsets.c -o src/6_4/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/idgen.c -o src/6_4/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/idgen.c -o src/6_4/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/astalgo.c -o src/6_4/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/astalgo.c -o src/6_4/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/rodutils.c -o src/6_4/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/rodutils.c -o src/6_4/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/syntaxes.c -o src/6_4/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/syntaxes.c -o src/6_4/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/parser.c -o src/6_4/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/parser.c -o src/6_4/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/pbraces.c -o src/6_4/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/pbraces.c -o src/6_4/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/filters.c -o src/6_4/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/filters.c -o src/6_4/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/renderer.c -o src/6_4/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/renderer.c -o src/6_4/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/filter_tmpl.c -o src/6_4/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/filter_tmpl.c -o src/6_4/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/rodread.c -o src/6_4/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/rodread.c -o src/6_4/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/types.c -o src/6_4/types.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/types.c -o src/6_4/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/trees.c -o src/6_4/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/trees.c -o src/6_4/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/memfiles.c -o src/6_4/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/memfiles.c -o src/6_4/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/rodwrite.c -o src/6_4/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/rodwrite.c -o src/6_4/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/passes.c -o src/6_4/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/passes.c -o src/6_4/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/magicsys.c -o src/6_4/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/magicsys.c -o src/6_4/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/nimsets.c -o src/6_4/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/nimsets.c -o src/6_4/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/bitsets.c -o src/6_4/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/bitsets.c -o src/6_4/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/semthreads.c -o src/6_4/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/semthreads.c -o src/6_4/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/importer.c -o src/6_4/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/importer.c -o src/6_4/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/lookups.c -o src/6_4/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/lookups.c -o src/6_4/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/semdata.c -o src/6_4/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/semdata.c -o src/6_4/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/treetab.c -o src/6_4/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/treetab.c -o src/6_4/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/evals.c -o src/6_4/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/evals.c -o src/6_4/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/semfold.c -o src/6_4/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/semfold.c -o src/6_4/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/saturate.c -o src/6_4/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/saturate.c -o src/6_4/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/transf.c -o src/6_4/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/transf.c -o src/6_4/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/cgmeth.c -o src/6_4/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/cgmeth.c -o src/6_4/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/sempass2.c -o src/6_4/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/sempass2.c -o src/6_4/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/guards.c -o src/6_4/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/guards.c -o src/6_4/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/lambdalifting.c -o src/6_4/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/lambdalifting.c -o src/6_4/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/evaltempl.c -o src/6_4/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/evaltempl.c -o src/6_4/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/sem.c -o src/6_4/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/sem.c -o src/6_4/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/procfind.c -o src/6_4/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/procfind.c -o src/6_4/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/pragmas.c -o src/6_4/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/pragmas.c -o src/6_4/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/semtypinst.c -o src/6_4/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/semtypinst.c -o src/6_4/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/sigmatch.c -o src/6_4/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/sigmatch.c -o src/6_4/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/parampatterns.c -o src/6_4/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/parampatterns.c -o src/6_4/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/docgen.c -o src/6_4/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/docgen.c -o src/6_4/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/rstast.c -o src/6_4/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/rstast.c -o src/6_4/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/rst.c -o src/6_4/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/rst.c -o src/6_4/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/rstgen.c -o src/6_4/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/rstgen.c -o src/6_4/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/highlite.c -o src/6_4/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/highlite.c -o src/6_4/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/algorithm.c -o src/6_4/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/algorithm.c -o src/6_4/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/sequtils.c -o src/6_4/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/sequtils.c -o src/6_4/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/aliases.c -o src/6_4/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/aliases.c -o src/6_4/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/patterns.c -o src/6_4/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/patterns.c -o src/6_4/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/cgen.c -o src/6_4/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/cgen.c -o src/6_4/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/ccgutils.c -o src/6_4/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/ccgutils.c -o src/6_4/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/cgendata.c -o src/6_4/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/cgendata.c -o src/6_4/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/ccgmerge.c -o src/6_4/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/ccgmerge.c -o src/6_4/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/jsgen.c -o src/6_4/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/jsgen.c -o src/6_4/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/json.c -o src/6_4/json.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/json.c -o src/6_4/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/lexbase.c -o src/6_4/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/lexbase.c -o src/6_4/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/unicode.c -o src/6_4/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/unicode.c -o src/6_4/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/passaux.c -o src/6_4/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/passaux.c -o src/6_4/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/depends.c -o src/6_4/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/depends.c -o src/6_4/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/docgen2.c -o src/6_4/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/docgen2.c -o src/6_4/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/service.c -o src/6_4/service.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/service.c -o src/6_4/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/parseopt.c -o src/6_4/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/parseopt.c -o src/6_4/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/modules.c -o src/6_4/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/modules.c -o src/6_4/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/6_4/pretty.c -o src/6_4/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/6_4/pretty.c -o src/6_4/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/6_4/nimrod.o \
src/6_4/system.o \
src/6_4/commands.o \
src/6_4/os.o \
src/6_4/strutils.o \
src/6_4/parseutils.o \
src/6_4/times.o \
src/6_4/posix.o \
src/6_4/msgs.o \
src/6_4/options.o \
src/6_4/lists.o \
src/6_4/strtabs.o \
src/6_4/hashes.o \
src/6_4/tables.o \
src/6_4/math.o \
src/6_4/sockets.o \
src/6_4/ropes.o \
src/6_4/platform.o \
src/6_4/crc.o \
src/6_4/nversion.o \
src/6_4/condsyms.o \
src/6_4/idents.o \
src/6_4/extccomp.o \
src/6_4/osproc.o \
src/6_4/streams.o \
src/6_4/wordrecg.o \
src/6_4/babelcmd.o \
src/6_4/lexer.o \
src/6_4/nimlexbase.o \
src/6_4/llstream.o \
src/6_4/nimconf.o \
src/6_4/main.o \
src/6_4/ast.o \
src/6_4/intsets.o \
src/6_4/idgen.o \
src/6_4/astalgo.o \
src/6_4/rodutils.o \
src/6_4/syntaxes.o \
src/6_4/parser.o \
src/6_4/pbraces.o \
src/6_4/filters.o \
src/6_4/renderer.o \
src/6_4/filter_tmpl.o \
src/6_4/rodread.o \
src/6_4/types.o \
src/6_4/trees.o \
src/6_4/memfiles.o \
src/6_4/rodwrite.o \
src/6_4/passes.o \
src/6_4/magicsys.o \
src/6_4/nimsets.o \
src/6_4/bitsets.o \
src/6_4/semthreads.o \
src/6_4/importer.o \
src/6_4/lookups.o \
src/6_4/semdata.o \
src/6_4/treetab.o \
src/6_4/evals.o \
src/6_4/semfold.o \
src/6_4/saturate.o \
src/6_4/transf.o \
src/6_4/cgmeth.o \
src/6_4/sempass2.o \
src/6_4/guards.o \
src/6_4/lambdalifting.o \
src/6_4/evaltempl.o \
src/6_4/sem.o \
src/6_4/procfind.o \
src/6_4/pragmas.o \
src/6_4/semtypinst.o \
src/6_4/sigmatch.o \
src/6_4/parampatterns.o \
src/6_4/docgen.o \
src/6_4/rstast.o \
src/6_4/rst.o \
src/6_4/rstgen.o \
src/6_4/highlite.o \
src/6_4/algorithm.o \
src/6_4/sequtils.o \
src/6_4/aliases.o \
src/6_4/patterns.o \
src/6_4/cgen.o \
src/6_4/ccgutils.o \
src/6_4/cgendata.o \
src/6_4/ccgmerge.o \
src/6_4/jsgen.o \
src/6_4/json.o \
src/6_4/lexbase.o \
src/6_4/unicode.o \
src/6_4/passaux.o \
src/6_4/depends.o \
src/6_4/docgen2.o \
src/6_4/service.o \
src/6_4/parseopt.o \
src/6_4/modules.o \
src/6_4/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/6_4/nimrod.o \
src/6_4/system.o \
src/6_4/commands.o \
src/6_4/os.o \
src/6_4/strutils.o \
src/6_4/parseutils.o \
src/6_4/times.o \
src/6_4/posix.o \
src/6_4/msgs.o \
src/6_4/options.o \
src/6_4/lists.o \
src/6_4/strtabs.o \
src/6_4/hashes.o \
src/6_4/tables.o \
src/6_4/math.o \
src/6_4/sockets.o \
src/6_4/ropes.o \
src/6_4/platform.o \
src/6_4/crc.o \
src/6_4/nversion.o \
src/6_4/condsyms.o \
src/6_4/idents.o \
src/6_4/extccomp.o \
src/6_4/osproc.o \
src/6_4/streams.o \
src/6_4/wordrecg.o \
src/6_4/babelcmd.o \
src/6_4/lexer.o \
src/6_4/nimlexbase.o \
src/6_4/llstream.o \
src/6_4/nimconf.o \
src/6_4/main.o \
src/6_4/ast.o \
src/6_4/intsets.o \
src/6_4/idgen.o \
src/6_4/astalgo.o \
src/6_4/rodutils.o \
src/6_4/syntaxes.o \
src/6_4/parser.o \
src/6_4/pbraces.o \
src/6_4/filters.o \
src/6_4/renderer.o \
src/6_4/filter_tmpl.o \
src/6_4/rodread.o \
src/6_4/types.o \
src/6_4/trees.o \
src/6_4/memfiles.o \
src/6_4/rodwrite.o \
src/6_4/passes.o \
src/6_4/magicsys.o \
src/6_4/nimsets.o \
src/6_4/bitsets.o \
src/6_4/semthreads.o \
src/6_4/importer.o \
src/6_4/lookups.o \
src/6_4/semdata.o \
src/6_4/treetab.o \
src/6_4/evals.o \
src/6_4/semfold.o \
src/6_4/saturate.o \
src/6_4/transf.o \
src/6_4/cgmeth.o \
src/6_4/sempass2.o \
src/6_4/guards.o \
src/6_4/lambdalifting.o \
src/6_4/evaltempl.o \
src/6_4/sem.o \
src/6_4/procfind.o \
src/6_4/pragmas.o \
src/6_4/semtypinst.o \
src/6_4/sigmatch.o \
src/6_4/parampatterns.o \
src/6_4/docgen.o \
src/6_4/rstast.o \
src/6_4/rst.o \
src/6_4/rstgen.o \
src/6_4/highlite.o \
src/6_4/algorithm.o \
src/6_4/sequtils.o \
src/6_4/aliases.o \
src/6_4/patterns.o \
src/6_4/cgen.o \
src/6_4/ccgutils.o \
src/6_4/cgendata.o \
src/6_4/ccgmerge.o \
src/6_4/jsgen.o \
src/6_4/json.o \
src/6_4/lexbase.o \
src/6_4/unicode.o \
src/6_4/passaux.o \
src/6_4/depends.o \
src/6_4/docgen2.o \
src/6_4/service.o \
src/6_4/parseopt.o \
src/6_4/modules.o \
src/6_4/pretty.o $LINK_FLAGS
    ;;
  *)
    echo "Error: no C code generated for: [$myos: $mycpu]"
    exit 1
    ;;
  esac
  ;;
openbsd) 
  case $mycpu in
  i386)
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/nimrod.c -o src/7_1/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/nimrod.c -o src/7_1/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/system.c -o src/7_1/system.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/system.c -o src/7_1/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/commands.c -o src/7_1/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/commands.c -o src/7_1/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/os.c -o src/7_1/os.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/os.c -o src/7_1/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/strutils.c -o src/7_1/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/strutils.c -o src/7_1/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/parseutils.c -o src/7_1/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/parseutils.c -o src/7_1/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/times.c -o src/7_1/times.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/times.c -o src/7_1/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/posix.c -o src/7_1/posix.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/posix.c -o src/7_1/posix.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/msgs.c -o src/7_1/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/msgs.c -o src/7_1/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/options.c -o src/7_1/options.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/options.c -o src/7_1/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/lists.c -o src/7_1/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/lists.c -o src/7_1/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/strtabs.c -o src/7_1/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/strtabs.c -o src/7_1/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/hashes.c -o src/7_1/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/hashes.c -o src/7_1/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/tables.c -o src/7_1/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/tables.c -o src/7_1/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/math.c -o src/7_1/math.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/math.c -o src/7_1/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/sockets.c -o src/7_1/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/sockets.c -o src/7_1/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/ropes.c -o src/7_1/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/ropes.c -o src/7_1/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/platform.c -o src/7_1/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/platform.c -o src/7_1/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/crc.c -o src/7_1/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/crc.c -o src/7_1/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/nversion.c -o src/7_1/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/nversion.c -o src/7_1/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/condsyms.c -o src/7_1/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/condsyms.c -o src/7_1/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/idents.c -o src/7_1/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/idents.c -o src/7_1/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/extccomp.c -o src/7_1/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/extccomp.c -o src/7_1/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/osproc.c -o src/7_1/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/osproc.c -o src/7_1/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/streams.c -o src/7_1/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/streams.c -o src/7_1/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/wordrecg.c -o src/7_1/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/wordrecg.c -o src/7_1/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/babelcmd.c -o src/7_1/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/babelcmd.c -o src/7_1/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/lexer.c -o src/7_1/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/lexer.c -o src/7_1/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/nimlexbase.c -o src/7_1/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/nimlexbase.c -o src/7_1/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/llstream.c -o src/7_1/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/llstream.c -o src/7_1/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/nimconf.c -o src/7_1/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/nimconf.c -o src/7_1/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/main.c -o src/7_1/main.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/main.c -o src/7_1/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/ast.c -o src/7_1/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/ast.c -o src/7_1/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/intsets.c -o src/7_1/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/intsets.c -o src/7_1/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/idgen.c -o src/7_1/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/idgen.c -o src/7_1/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/astalgo.c -o src/7_1/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/astalgo.c -o src/7_1/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/rodutils.c -o src/7_1/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/rodutils.c -o src/7_1/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/syntaxes.c -o src/7_1/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/syntaxes.c -o src/7_1/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/parser.c -o src/7_1/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/parser.c -o src/7_1/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/pbraces.c -o src/7_1/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/pbraces.c -o src/7_1/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/filters.c -o src/7_1/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/filters.c -o src/7_1/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/renderer.c -o src/7_1/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/renderer.c -o src/7_1/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/filter_tmpl.c -o src/7_1/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/filter_tmpl.c -o src/7_1/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/rodread.c -o src/7_1/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/rodread.c -o src/7_1/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/types.c -o src/7_1/types.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/types.c -o src/7_1/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/trees.c -o src/7_1/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/trees.c -o src/7_1/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/memfiles.c -o src/7_1/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/memfiles.c -o src/7_1/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/rodwrite.c -o src/7_1/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/rodwrite.c -o src/7_1/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/passes.c -o src/7_1/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/passes.c -o src/7_1/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/magicsys.c -o src/7_1/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/magicsys.c -o src/7_1/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/nimsets.c -o src/7_1/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/nimsets.c -o src/7_1/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/bitsets.c -o src/7_1/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/bitsets.c -o src/7_1/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/semthreads.c -o src/7_1/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/semthreads.c -o src/7_1/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/importer.c -o src/7_1/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/importer.c -o src/7_1/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/lookups.c -o src/7_1/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/lookups.c -o src/7_1/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/semdata.c -o src/7_1/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/semdata.c -o src/7_1/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/treetab.c -o src/7_1/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/treetab.c -o src/7_1/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/evals.c -o src/7_1/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/evals.c -o src/7_1/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/semfold.c -o src/7_1/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/semfold.c -o src/7_1/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/saturate.c -o src/7_1/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/saturate.c -o src/7_1/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/transf.c -o src/7_1/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/transf.c -o src/7_1/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/cgmeth.c -o src/7_1/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/cgmeth.c -o src/7_1/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/sempass2.c -o src/7_1/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/sempass2.c -o src/7_1/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/guards.c -o src/7_1/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/guards.c -o src/7_1/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/lambdalifting.c -o src/7_1/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/lambdalifting.c -o src/7_1/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/evaltempl.c -o src/7_1/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/evaltempl.c -o src/7_1/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/sem.c -o src/7_1/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/sem.c -o src/7_1/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/procfind.c -o src/7_1/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/procfind.c -o src/7_1/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/pragmas.c -o src/7_1/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/pragmas.c -o src/7_1/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/semtypinst.c -o src/7_1/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/semtypinst.c -o src/7_1/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/sigmatch.c -o src/7_1/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/sigmatch.c -o src/7_1/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/parampatterns.c -o src/7_1/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/parampatterns.c -o src/7_1/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/docgen.c -o src/7_1/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/docgen.c -o src/7_1/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/rstast.c -o src/7_1/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/rstast.c -o src/7_1/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/rst.c -o src/7_1/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/rst.c -o src/7_1/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/rstgen.c -o src/7_1/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/rstgen.c -o src/7_1/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/highlite.c -o src/7_1/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/highlite.c -o src/7_1/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/algorithm.c -o src/7_1/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/algorithm.c -o src/7_1/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/sequtils.c -o src/7_1/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/sequtils.c -o src/7_1/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/aliases.c -o src/7_1/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/aliases.c -o src/7_1/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/patterns.c -o src/7_1/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/patterns.c -o src/7_1/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/cgen.c -o src/7_1/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/cgen.c -o src/7_1/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/ccgutils.c -o src/7_1/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/ccgutils.c -o src/7_1/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/cgendata.c -o src/7_1/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/cgendata.c -o src/7_1/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/ccgmerge.c -o src/7_1/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/ccgmerge.c -o src/7_1/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/jsgen.c -o src/7_1/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/jsgen.c -o src/7_1/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/json.c -o src/7_1/json.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/json.c -o src/7_1/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/lexbase.c -o src/7_1/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/lexbase.c -o src/7_1/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/unicode.c -o src/7_1/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/unicode.c -o src/7_1/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/passaux.c -o src/7_1/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/passaux.c -o src/7_1/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/depends.c -o src/7_1/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/depends.c -o src/7_1/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/docgen2.c -o src/7_1/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/docgen2.c -o src/7_1/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/service.c -o src/7_1/service.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/service.c -o src/7_1/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/parseopt.c -o src/7_1/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/parseopt.c -o src/7_1/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/modules.c -o src/7_1/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/modules.c -o src/7_1/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_1/pretty.c -o src/7_1/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/7_1/pretty.c -o src/7_1/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/7_1/nimrod.o \
src/7_1/system.o \
src/7_1/commands.o \
src/7_1/os.o \
src/7_1/strutils.o \
src/7_1/parseutils.o \
src/7_1/times.o \
src/7_1/posix.o \
src/7_1/msgs.o \
src/7_1/options.o \
src/7_1/lists.o \
src/7_1/strtabs.o \
src/7_1/hashes.o \
src/7_1/tables.o \
src/7_1/math.o \
src/7_1/sockets.o \
src/7_1/ropes.o \
src/7_1/platform.o \
src/7_1/crc.o \
src/7_1/nversion.o \
src/7_1/condsyms.o \
src/7_1/idents.o \
src/7_1/extccomp.o \
src/7_1/osproc.o \
src/7_1/streams.o \
src/7_1/wordrecg.o \
src/7_1/babelcmd.o \
src/7_1/lexer.o \
src/7_1/nimlexbase.o \
src/7_1/llstream.o \
src/7_1/nimconf.o \
src/7_1/main.o \
src/7_1/ast.o \
src/7_1/intsets.o \
src/7_1/idgen.o \
src/7_1/astalgo.o \
src/7_1/rodutils.o \
src/7_1/syntaxes.o \
src/7_1/parser.o \
src/7_1/pbraces.o \
src/7_1/filters.o \
src/7_1/renderer.o \
src/7_1/filter_tmpl.o \
src/7_1/rodread.o \
src/7_1/types.o \
src/7_1/trees.o \
src/7_1/memfiles.o \
src/7_1/rodwrite.o \
src/7_1/passes.o \
src/7_1/magicsys.o \
src/7_1/nimsets.o \
src/7_1/bitsets.o \
src/7_1/semthreads.o \
src/7_1/importer.o \
src/7_1/lookups.o \
src/7_1/semdata.o \
src/7_1/treetab.o \
src/7_1/evals.o \
src/7_1/semfold.o \
src/7_1/saturate.o \
src/7_1/transf.o \
src/7_1/cgmeth.o \
src/7_1/sempass2.o \
src/7_1/guards.o \
src/7_1/lambdalifting.o \
src/7_1/evaltempl.o \
src/7_1/sem.o \
src/7_1/procfind.o \
src/7_1/pragmas.o \
src/7_1/semtypinst.o \
src/7_1/sigmatch.o \
src/7_1/parampatterns.o \
src/7_1/docgen.o \
src/7_1/rstast.o \
src/7_1/rst.o \
src/7_1/rstgen.o \
src/7_1/highlite.o \
src/7_1/algorithm.o \
src/7_1/sequtils.o \
src/7_1/aliases.o \
src/7_1/patterns.o \
src/7_1/cgen.o \
src/7_1/ccgutils.o \
src/7_1/cgendata.o \
src/7_1/ccgmerge.o \
src/7_1/jsgen.o \
src/7_1/json.o \
src/7_1/lexbase.o \
src/7_1/unicode.o \
src/7_1/passaux.o \
src/7_1/depends.o \
src/7_1/docgen2.o \
src/7_1/service.o \
src/7_1/parseopt.o \
src/7_1/modules.o \
src/7_1/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/7_1/nimrod.o \
src/7_1/system.o \
src/7_1/commands.o \
src/7_1/os.o \
src/7_1/strutils.o \
src/7_1/parseutils.o \
src/7_1/times.o \
src/7_1/posix.o \
src/7_1/msgs.o \
src/7_1/options.o \
src/7_1/lists.o \
src/7_1/strtabs.o \
src/7_1/hashes.o \
src/7_1/tables.o \
src/7_1/math.o \
src/7_1/sockets.o \
src/7_1/ropes.o \
src/7_1/platform.o \
src/7_1/crc.o \
src/7_1/nversion.o \
src/7_1/condsyms.o \
src/7_1/idents.o \
src/7_1/extccomp.o \
src/7_1/osproc.o \
src/7_1/streams.o \
src/7_1/wordrecg.o \
src/7_1/babelcmd.o \
src/7_1/lexer.o \
src/7_1/nimlexbase.o \
src/7_1/llstream.o \
src/7_1/nimconf.o \
src/7_1/main.o \
src/7_1/ast.o \
src/7_1/intsets.o \
src/7_1/idgen.o \
src/7_1/astalgo.o \
src/7_1/rodutils.o \
src/7_1/syntaxes.o \
src/7_1/parser.o \
src/7_1/pbraces.o \
src/7_1/filters.o \
src/7_1/renderer.o \
src/7_1/filter_tmpl.o \
src/7_1/rodread.o \
src/7_1/types.o \
src/7_1/trees.o \
src/7_1/memfiles.o \
src/7_1/rodwrite.o \
src/7_1/passes.o \
src/7_1/magicsys.o \
src/7_1/nimsets.o \
src/7_1/bitsets.o \
src/7_1/semthreads.o \
src/7_1/importer.o \
src/7_1/lookups.o \
src/7_1/semdata.o \
src/7_1/treetab.o \
src/7_1/evals.o \
src/7_1/semfold.o \
src/7_1/saturate.o \
src/7_1/transf.o \
src/7_1/cgmeth.o \
src/7_1/sempass2.o \
src/7_1/guards.o \
src/7_1/lambdalifting.o \
src/7_1/evaltempl.o \
src/7_1/sem.o \
src/7_1/procfind.o \
src/7_1/pragmas.o \
src/7_1/semtypinst.o \
src/7_1/sigmatch.o \
src/7_1/parampatterns.o \
src/7_1/docgen.o \
src/7_1/rstast.o \
src/7_1/rst.o \
src/7_1/rstgen.o \
src/7_1/highlite.o \
src/7_1/algorithm.o \
src/7_1/sequtils.o \
src/7_1/aliases.o \
src/7_1/patterns.o \
src/7_1/cgen.o \
src/7_1/ccgutils.o \
src/7_1/cgendata.o \
src/7_1/ccgmerge.o \
src/7_1/jsgen.o \
src/7_1/json.o \
src/7_1/lexbase.o \
src/7_1/unicode.o \
src/7_1/passaux.o \
src/7_1/depends.o \
src/7_1/docgen2.o \
src/7_1/service.o \
src/7_1/parseopt.o \
src/7_1/modules.o \
src/7_1/pretty.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/nimrod.c -o src/7_2/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/nimrod.c -o src/7_2/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/system.c -o src/7_2/system.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/system.c -o src/7_2/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/commands.c -o src/7_2/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/commands.c -o src/7_2/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/os.c -o src/7_2/os.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/os.c -o src/7_2/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/strutils.c -o src/7_2/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/strutils.c -o src/7_2/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/parseutils.c -o src/7_2/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/parseutils.c -o src/7_2/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/times.c -o src/7_2/times.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/times.c -o src/7_2/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/posix.c -o src/7_2/posix.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/posix.c -o src/7_2/posix.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/msgs.c -o src/7_2/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/msgs.c -o src/7_2/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/options.c -o src/7_2/options.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/options.c -o src/7_2/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/lists.c -o src/7_2/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/lists.c -o src/7_2/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/strtabs.c -o src/7_2/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/strtabs.c -o src/7_2/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/hashes.c -o src/7_2/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/hashes.c -o src/7_2/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/tables.c -o src/7_2/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/tables.c -o src/7_2/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/math.c -o src/7_2/math.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/math.c -o src/7_2/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/sockets.c -o src/7_2/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/sockets.c -o src/7_2/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/ropes.c -o src/7_2/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/ropes.c -o src/7_2/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/platform.c -o src/7_2/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/platform.c -o src/7_2/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/crc.c -o src/7_2/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/crc.c -o src/7_2/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/nversion.c -o src/7_2/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/nversion.c -o src/7_2/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/condsyms.c -o src/7_2/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/condsyms.c -o src/7_2/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/idents.c -o src/7_2/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/idents.c -o src/7_2/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/extccomp.c -o src/7_2/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/extccomp.c -o src/7_2/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/osproc.c -o src/7_2/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/osproc.c -o src/7_2/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/streams.c -o src/7_2/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/streams.c -o src/7_2/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/wordrecg.c -o src/7_2/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/wordrecg.c -o src/7_2/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/babelcmd.c -o src/7_2/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/babelcmd.c -o src/7_2/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/lexer.c -o src/7_2/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/lexer.c -o src/7_2/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/nimlexbase.c -o src/7_2/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/nimlexbase.c -o src/7_2/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/llstream.c -o src/7_2/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/llstream.c -o src/7_2/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/nimconf.c -o src/7_2/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/nimconf.c -o src/7_2/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/main.c -o src/7_2/main.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/main.c -o src/7_2/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/ast.c -o src/7_2/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/ast.c -o src/7_2/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/intsets.c -o src/7_2/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/intsets.c -o src/7_2/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/idgen.c -o src/7_2/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/idgen.c -o src/7_2/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/astalgo.c -o src/7_2/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/astalgo.c -o src/7_2/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/rodutils.c -o src/7_2/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/rodutils.c -o src/7_2/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/syntaxes.c -o src/7_2/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/syntaxes.c -o src/7_2/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/parser.c -o src/7_2/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/parser.c -o src/7_2/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/pbraces.c -o src/7_2/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/pbraces.c -o src/7_2/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/filters.c -o src/7_2/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/filters.c -o src/7_2/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/renderer.c -o src/7_2/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/renderer.c -o src/7_2/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/filter_tmpl.c -o src/7_2/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/filter_tmpl.c -o src/7_2/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/rodread.c -o src/7_2/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/rodread.c -o src/7_2/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/types.c -o src/7_2/types.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/types.c -o src/7_2/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/trees.c -o src/7_2/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/trees.c -o src/7_2/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/memfiles.c -o src/7_2/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/memfiles.c -o src/7_2/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/rodwrite.c -o src/7_2/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/rodwrite.c -o src/7_2/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/passes.c -o src/7_2/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/passes.c -o src/7_2/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/magicsys.c -o src/7_2/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/magicsys.c -o src/7_2/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/nimsets.c -o src/7_2/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/nimsets.c -o src/7_2/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/bitsets.c -o src/7_2/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/bitsets.c -o src/7_2/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/semthreads.c -o src/7_2/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/semthreads.c -o src/7_2/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/importer.c -o src/7_2/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/importer.c -o src/7_2/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/lookups.c -o src/7_2/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/lookups.c -o src/7_2/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/semdata.c -o src/7_2/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/semdata.c -o src/7_2/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/treetab.c -o src/7_2/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/treetab.c -o src/7_2/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/evals.c -o src/7_2/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/evals.c -o src/7_2/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/semfold.c -o src/7_2/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/semfold.c -o src/7_2/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/saturate.c -o src/7_2/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/saturate.c -o src/7_2/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/transf.c -o src/7_2/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/transf.c -o src/7_2/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/cgmeth.c -o src/7_2/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/cgmeth.c -o src/7_2/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/sempass2.c -o src/7_2/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/sempass2.c -o src/7_2/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/guards.c -o src/7_2/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/guards.c -o src/7_2/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/lambdalifting.c -o src/7_2/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/lambdalifting.c -o src/7_2/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/evaltempl.c -o src/7_2/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/evaltempl.c -o src/7_2/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/sem.c -o src/7_2/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/sem.c -o src/7_2/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/procfind.c -o src/7_2/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/procfind.c -o src/7_2/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/pragmas.c -o src/7_2/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/pragmas.c -o src/7_2/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/semtypinst.c -o src/7_2/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/semtypinst.c -o src/7_2/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/sigmatch.c -o src/7_2/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/sigmatch.c -o src/7_2/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/parampatterns.c -o src/7_2/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/parampatterns.c -o src/7_2/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/docgen.c -o src/7_2/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/docgen.c -o src/7_2/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/rstast.c -o src/7_2/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/rstast.c -o src/7_2/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/rst.c -o src/7_2/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/rst.c -o src/7_2/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/rstgen.c -o src/7_2/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/rstgen.c -o src/7_2/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/highlite.c -o src/7_2/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/highlite.c -o src/7_2/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/algorithm.c -o src/7_2/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/algorithm.c -o src/7_2/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/sequtils.c -o src/7_2/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/sequtils.c -o src/7_2/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/aliases.c -o src/7_2/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/aliases.c -o src/7_2/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/patterns.c -o src/7_2/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/patterns.c -o src/7_2/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/cgen.c -o src/7_2/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/cgen.c -o src/7_2/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/ccgutils.c -o src/7_2/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/ccgutils.c -o src/7_2/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/cgendata.c -o src/7_2/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/cgendata.c -o src/7_2/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/ccgmerge.c -o src/7_2/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/ccgmerge.c -o src/7_2/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/jsgen.c -o src/7_2/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/jsgen.c -o src/7_2/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/json.c -o src/7_2/json.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/json.c -o src/7_2/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/lexbase.c -o src/7_2/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/lexbase.c -o src/7_2/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/unicode.c -o src/7_2/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/unicode.c -o src/7_2/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/passaux.c -o src/7_2/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/passaux.c -o src/7_2/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/depends.c -o src/7_2/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/depends.c -o src/7_2/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/docgen2.c -o src/7_2/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/docgen2.c -o src/7_2/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/service.c -o src/7_2/service.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/service.c -o src/7_2/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/parseopt.c -o src/7_2/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/parseopt.c -o src/7_2/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/modules.c -o src/7_2/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/modules.c -o src/7_2/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_2/pretty.c -o src/7_2/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/7_2/pretty.c -o src/7_2/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/7_2/nimrod.o \
src/7_2/system.o \
src/7_2/commands.o \
src/7_2/os.o \
src/7_2/strutils.o \
src/7_2/parseutils.o \
src/7_2/times.o \
src/7_2/posix.o \
src/7_2/msgs.o \
src/7_2/options.o \
src/7_2/lists.o \
src/7_2/strtabs.o \
src/7_2/hashes.o \
src/7_2/tables.o \
src/7_2/math.o \
src/7_2/sockets.o \
src/7_2/ropes.o \
src/7_2/platform.o \
src/7_2/crc.o \
src/7_2/nversion.o \
src/7_2/condsyms.o \
src/7_2/idents.o \
src/7_2/extccomp.o \
src/7_2/osproc.o \
src/7_2/streams.o \
src/7_2/wordrecg.o \
src/7_2/babelcmd.o \
src/7_2/lexer.o \
src/7_2/nimlexbase.o \
src/7_2/llstream.o \
src/7_2/nimconf.o \
src/7_2/main.o \
src/7_2/ast.o \
src/7_2/intsets.o \
src/7_2/idgen.o \
src/7_2/astalgo.o \
src/7_2/rodutils.o \
src/7_2/syntaxes.o \
src/7_2/parser.o \
src/7_2/pbraces.o \
src/7_2/filters.o \
src/7_2/renderer.o \
src/7_2/filter_tmpl.o \
src/7_2/rodread.o \
src/7_2/types.o \
src/7_2/trees.o \
src/7_2/memfiles.o \
src/7_2/rodwrite.o \
src/7_2/passes.o \
src/7_2/magicsys.o \
src/7_2/nimsets.o \
src/7_2/bitsets.o \
src/7_2/semthreads.o \
src/7_2/importer.o \
src/7_2/lookups.o \
src/7_2/semdata.o \
src/7_2/treetab.o \
src/7_2/evals.o \
src/7_2/semfold.o \
src/7_2/saturate.o \
src/7_2/transf.o \
src/7_2/cgmeth.o \
src/7_2/sempass2.o \
src/7_2/guards.o \
src/7_2/lambdalifting.o \
src/7_2/evaltempl.o \
src/7_2/sem.o \
src/7_2/procfind.o \
src/7_2/pragmas.o \
src/7_2/semtypinst.o \
src/7_2/sigmatch.o \
src/7_2/parampatterns.o \
src/7_2/docgen.o \
src/7_2/rstast.o \
src/7_2/rst.o \
src/7_2/rstgen.o \
src/7_2/highlite.o \
src/7_2/algorithm.o \
src/7_2/sequtils.o \
src/7_2/aliases.o \
src/7_2/patterns.o \
src/7_2/cgen.o \
src/7_2/ccgutils.o \
src/7_2/cgendata.o \
src/7_2/ccgmerge.o \
src/7_2/jsgen.o \
src/7_2/json.o \
src/7_2/lexbase.o \
src/7_2/unicode.o \
src/7_2/passaux.o \
src/7_2/depends.o \
src/7_2/docgen2.o \
src/7_2/service.o \
src/7_2/parseopt.o \
src/7_2/modules.o \
src/7_2/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/7_2/nimrod.o \
src/7_2/system.o \
src/7_2/commands.o \
src/7_2/os.o \
src/7_2/strutils.o \
src/7_2/parseutils.o \
src/7_2/times.o \
src/7_2/posix.o \
src/7_2/msgs.o \
src/7_2/options.o \
src/7_2/lists.o \
src/7_2/strtabs.o \
src/7_2/hashes.o \
src/7_2/tables.o \
src/7_2/math.o \
src/7_2/sockets.o \
src/7_2/ropes.o \
src/7_2/platform.o \
src/7_2/crc.o \
src/7_2/nversion.o \
src/7_2/condsyms.o \
src/7_2/idents.o \
src/7_2/extccomp.o \
src/7_2/osproc.o \
src/7_2/streams.o \
src/7_2/wordrecg.o \
src/7_2/babelcmd.o \
src/7_2/lexer.o \
src/7_2/nimlexbase.o \
src/7_2/llstream.o \
src/7_2/nimconf.o \
src/7_2/main.o \
src/7_2/ast.o \
src/7_2/intsets.o \
src/7_2/idgen.o \
src/7_2/astalgo.o \
src/7_2/rodutils.o \
src/7_2/syntaxes.o \
src/7_2/parser.o \
src/7_2/pbraces.o \
src/7_2/filters.o \
src/7_2/renderer.o \
src/7_2/filter_tmpl.o \
src/7_2/rodread.o \
src/7_2/types.o \
src/7_2/trees.o \
src/7_2/memfiles.o \
src/7_2/rodwrite.o \
src/7_2/passes.o \
src/7_2/magicsys.o \
src/7_2/nimsets.o \
src/7_2/bitsets.o \
src/7_2/semthreads.o \
src/7_2/importer.o \
src/7_2/lookups.o \
src/7_2/semdata.o \
src/7_2/treetab.o \
src/7_2/evals.o \
src/7_2/semfold.o \
src/7_2/saturate.o \
src/7_2/transf.o \
src/7_2/cgmeth.o \
src/7_2/sempass2.o \
src/7_2/guards.o \
src/7_2/lambdalifting.o \
src/7_2/evaltempl.o \
src/7_2/sem.o \
src/7_2/procfind.o \
src/7_2/pragmas.o \
src/7_2/semtypinst.o \
src/7_2/sigmatch.o \
src/7_2/parampatterns.o \
src/7_2/docgen.o \
src/7_2/rstast.o \
src/7_2/rst.o \
src/7_2/rstgen.o \
src/7_2/highlite.o \
src/7_2/algorithm.o \
src/7_2/sequtils.o \
src/7_2/aliases.o \
src/7_2/patterns.o \
src/7_2/cgen.o \
src/7_2/ccgutils.o \
src/7_2/cgendata.o \
src/7_2/ccgmerge.o \
src/7_2/jsgen.o \
src/7_2/json.o \
src/7_2/lexbase.o \
src/7_2/unicode.o \
src/7_2/passaux.o \
src/7_2/depends.o \
src/7_2/docgen2.o \
src/7_2/service.o \
src/7_2/parseopt.o \
src/7_2/modules.o \
src/7_2/pretty.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/nimrod.c -o src/7_3/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/nimrod.c -o src/7_3/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/system.c -o src/7_3/system.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/system.c -o src/7_3/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/commands.c -o src/7_3/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/commands.c -o src/7_3/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/os.c -o src/7_3/os.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/os.c -o src/7_3/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/strutils.c -o src/7_3/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/strutils.c -o src/7_3/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/parseutils.c -o src/7_3/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/parseutils.c -o src/7_3/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/times.c -o src/7_3/times.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/times.c -o src/7_3/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/posix.c -o src/7_3/posix.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/posix.c -o src/7_3/posix.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/msgs.c -o src/7_3/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/msgs.c -o src/7_3/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/options.c -o src/7_3/options.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/options.c -o src/7_3/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/lists.c -o src/7_3/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/lists.c -o src/7_3/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/strtabs.c -o src/7_3/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/strtabs.c -o src/7_3/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/hashes.c -o src/7_3/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/hashes.c -o src/7_3/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/tables.c -o src/7_3/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/tables.c -o src/7_3/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/math.c -o src/7_3/math.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/math.c -o src/7_3/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/sockets.c -o src/7_3/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/sockets.c -o src/7_3/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/ropes.c -o src/7_3/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/ropes.c -o src/7_3/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/platform.c -o src/7_3/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/platform.c -o src/7_3/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/crc.c -o src/7_3/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/crc.c -o src/7_3/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/nversion.c -o src/7_3/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/nversion.c -o src/7_3/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/condsyms.c -o src/7_3/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/condsyms.c -o src/7_3/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/idents.c -o src/7_3/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/idents.c -o src/7_3/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/extccomp.c -o src/7_3/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/extccomp.c -o src/7_3/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/osproc.c -o src/7_3/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/osproc.c -o src/7_3/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/streams.c -o src/7_3/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/streams.c -o src/7_3/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/wordrecg.c -o src/7_3/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/wordrecg.c -o src/7_3/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/babelcmd.c -o src/7_3/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/babelcmd.c -o src/7_3/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/lexer.c -o src/7_3/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/lexer.c -o src/7_3/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/nimlexbase.c -o src/7_3/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/nimlexbase.c -o src/7_3/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/llstream.c -o src/7_3/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/llstream.c -o src/7_3/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/nimconf.c -o src/7_3/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/nimconf.c -o src/7_3/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/main.c -o src/7_3/main.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/main.c -o src/7_3/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/ast.c -o src/7_3/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/ast.c -o src/7_3/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/intsets.c -o src/7_3/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/intsets.c -o src/7_3/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/idgen.c -o src/7_3/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/idgen.c -o src/7_3/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/astalgo.c -o src/7_3/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/astalgo.c -o src/7_3/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/rodutils.c -o src/7_3/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/rodutils.c -o src/7_3/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/syntaxes.c -o src/7_3/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/syntaxes.c -o src/7_3/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/parser.c -o src/7_3/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/parser.c -o src/7_3/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/pbraces.c -o src/7_3/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/pbraces.c -o src/7_3/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/filters.c -o src/7_3/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/filters.c -o src/7_3/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/renderer.c -o src/7_3/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/renderer.c -o src/7_3/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/filter_tmpl.c -o src/7_3/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/filter_tmpl.c -o src/7_3/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/rodread.c -o src/7_3/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/rodread.c -o src/7_3/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/types.c -o src/7_3/types.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/types.c -o src/7_3/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/trees.c -o src/7_3/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/trees.c -o src/7_3/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/memfiles.c -o src/7_3/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/memfiles.c -o src/7_3/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/rodwrite.c -o src/7_3/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/rodwrite.c -o src/7_3/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/passes.c -o src/7_3/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/passes.c -o src/7_3/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/magicsys.c -o src/7_3/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/magicsys.c -o src/7_3/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/nimsets.c -o src/7_3/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/nimsets.c -o src/7_3/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/bitsets.c -o src/7_3/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/bitsets.c -o src/7_3/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/semthreads.c -o src/7_3/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/semthreads.c -o src/7_3/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/importer.c -o src/7_3/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/importer.c -o src/7_3/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/lookups.c -o src/7_3/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/lookups.c -o src/7_3/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/semdata.c -o src/7_3/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/semdata.c -o src/7_3/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/treetab.c -o src/7_3/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/treetab.c -o src/7_3/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/evals.c -o src/7_3/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/evals.c -o src/7_3/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/semfold.c -o src/7_3/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/semfold.c -o src/7_3/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/saturate.c -o src/7_3/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/saturate.c -o src/7_3/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/transf.c -o src/7_3/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/transf.c -o src/7_3/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/cgmeth.c -o src/7_3/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/cgmeth.c -o src/7_3/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/sempass2.c -o src/7_3/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/sempass2.c -o src/7_3/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/guards.c -o src/7_3/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/guards.c -o src/7_3/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/lambdalifting.c -o src/7_3/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/lambdalifting.c -o src/7_3/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/evaltempl.c -o src/7_3/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/evaltempl.c -o src/7_3/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/sem.c -o src/7_3/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/sem.c -o src/7_3/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/procfind.c -o src/7_3/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/procfind.c -o src/7_3/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/pragmas.c -o src/7_3/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/pragmas.c -o src/7_3/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/semtypinst.c -o src/7_3/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/semtypinst.c -o src/7_3/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/sigmatch.c -o src/7_3/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/sigmatch.c -o src/7_3/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/parampatterns.c -o src/7_3/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/parampatterns.c -o src/7_3/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/docgen.c -o src/7_3/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/docgen.c -o src/7_3/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/rstast.c -o src/7_3/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/rstast.c -o src/7_3/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/rst.c -o src/7_3/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/rst.c -o src/7_3/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/rstgen.c -o src/7_3/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/rstgen.c -o src/7_3/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/highlite.c -o src/7_3/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/highlite.c -o src/7_3/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/algorithm.c -o src/7_3/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/algorithm.c -o src/7_3/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/sequtils.c -o src/7_3/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/sequtils.c -o src/7_3/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/aliases.c -o src/7_3/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/aliases.c -o src/7_3/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/patterns.c -o src/7_3/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/patterns.c -o src/7_3/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/cgen.c -o src/7_3/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/cgen.c -o src/7_3/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/ccgutils.c -o src/7_3/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/ccgutils.c -o src/7_3/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/cgendata.c -o src/7_3/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/cgendata.c -o src/7_3/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/ccgmerge.c -o src/7_3/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/ccgmerge.c -o src/7_3/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/jsgen.c -o src/7_3/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/jsgen.c -o src/7_3/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/json.c -o src/7_3/json.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/json.c -o src/7_3/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/lexbase.c -o src/7_3/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/lexbase.c -o src/7_3/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/unicode.c -o src/7_3/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/unicode.c -o src/7_3/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/passaux.c -o src/7_3/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/passaux.c -o src/7_3/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/depends.c -o src/7_3/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/depends.c -o src/7_3/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/docgen2.c -o src/7_3/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/docgen2.c -o src/7_3/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/service.c -o src/7_3/service.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/service.c -o src/7_3/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/parseopt.c -o src/7_3/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/parseopt.c -o src/7_3/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/modules.c -o src/7_3/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/modules.c -o src/7_3/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_3/pretty.c -o src/7_3/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/7_3/pretty.c -o src/7_3/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/7_3/nimrod.o \
src/7_3/system.o \
src/7_3/commands.o \
src/7_3/os.o \
src/7_3/strutils.o \
src/7_3/parseutils.o \
src/7_3/times.o \
src/7_3/posix.o \
src/7_3/msgs.o \
src/7_3/options.o \
src/7_3/lists.o \
src/7_3/strtabs.o \
src/7_3/hashes.o \
src/7_3/tables.o \
src/7_3/math.o \
src/7_3/sockets.o \
src/7_3/ropes.o \
src/7_3/platform.o \
src/7_3/crc.o \
src/7_3/nversion.o \
src/7_3/condsyms.o \
src/7_3/idents.o \
src/7_3/extccomp.o \
src/7_3/osproc.o \
src/7_3/streams.o \
src/7_3/wordrecg.o \
src/7_3/babelcmd.o \
src/7_3/lexer.o \
src/7_3/nimlexbase.o \
src/7_3/llstream.o \
src/7_3/nimconf.o \
src/7_3/main.o \
src/7_3/ast.o \
src/7_3/intsets.o \
src/7_3/idgen.o \
src/7_3/astalgo.o \
src/7_3/rodutils.o \
src/7_3/syntaxes.o \
src/7_3/parser.o \
src/7_3/pbraces.o \
src/7_3/filters.o \
src/7_3/renderer.o \
src/7_3/filter_tmpl.o \
src/7_3/rodread.o \
src/7_3/types.o \
src/7_3/trees.o \
src/7_3/memfiles.o \
src/7_3/rodwrite.o \
src/7_3/passes.o \
src/7_3/magicsys.o \
src/7_3/nimsets.o \
src/7_3/bitsets.o \
src/7_3/semthreads.o \
src/7_3/importer.o \
src/7_3/lookups.o \
src/7_3/semdata.o \
src/7_3/treetab.o \
src/7_3/evals.o \
src/7_3/semfold.o \
src/7_3/saturate.o \
src/7_3/transf.o \
src/7_3/cgmeth.o \
src/7_3/sempass2.o \
src/7_3/guards.o \
src/7_3/lambdalifting.o \
src/7_3/evaltempl.o \
src/7_3/sem.o \
src/7_3/procfind.o \
src/7_3/pragmas.o \
src/7_3/semtypinst.o \
src/7_3/sigmatch.o \
src/7_3/parampatterns.o \
src/7_3/docgen.o \
src/7_3/rstast.o \
src/7_3/rst.o \
src/7_3/rstgen.o \
src/7_3/highlite.o \
src/7_3/algorithm.o \
src/7_3/sequtils.o \
src/7_3/aliases.o \
src/7_3/patterns.o \
src/7_3/cgen.o \
src/7_3/ccgutils.o \
src/7_3/cgendata.o \
src/7_3/ccgmerge.o \
src/7_3/jsgen.o \
src/7_3/json.o \
src/7_3/lexbase.o \
src/7_3/unicode.o \
src/7_3/passaux.o \
src/7_3/depends.o \
src/7_3/docgen2.o \
src/7_3/service.o \
src/7_3/parseopt.o \
src/7_3/modules.o \
src/7_3/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/7_3/nimrod.o \
src/7_3/system.o \
src/7_3/commands.o \
src/7_3/os.o \
src/7_3/strutils.o \
src/7_3/parseutils.o \
src/7_3/times.o \
src/7_3/posix.o \
src/7_3/msgs.o \
src/7_3/options.o \
src/7_3/lists.o \
src/7_3/strtabs.o \
src/7_3/hashes.o \
src/7_3/tables.o \
src/7_3/math.o \
src/7_3/sockets.o \
src/7_3/ropes.o \
src/7_3/platform.o \
src/7_3/crc.o \
src/7_3/nversion.o \
src/7_3/condsyms.o \
src/7_3/idents.o \
src/7_3/extccomp.o \
src/7_3/osproc.o \
src/7_3/streams.o \
src/7_3/wordrecg.o \
src/7_3/babelcmd.o \
src/7_3/lexer.o \
src/7_3/nimlexbase.o \
src/7_3/llstream.o \
src/7_3/nimconf.o \
src/7_3/main.o \
src/7_3/ast.o \
src/7_3/intsets.o \
src/7_3/idgen.o \
src/7_3/astalgo.o \
src/7_3/rodutils.o \
src/7_3/syntaxes.o \
src/7_3/parser.o \
src/7_3/pbraces.o \
src/7_3/filters.o \
src/7_3/renderer.o \
src/7_3/filter_tmpl.o \
src/7_3/rodread.o \
src/7_3/types.o \
src/7_3/trees.o \
src/7_3/memfiles.o \
src/7_3/rodwrite.o \
src/7_3/passes.o \
src/7_3/magicsys.o \
src/7_3/nimsets.o \
src/7_3/bitsets.o \
src/7_3/semthreads.o \
src/7_3/importer.o \
src/7_3/lookups.o \
src/7_3/semdata.o \
src/7_3/treetab.o \
src/7_3/evals.o \
src/7_3/semfold.o \
src/7_3/saturate.o \
src/7_3/transf.o \
src/7_3/cgmeth.o \
src/7_3/sempass2.o \
src/7_3/guards.o \
src/7_3/lambdalifting.o \
src/7_3/evaltempl.o \
src/7_3/sem.o \
src/7_3/procfind.o \
src/7_3/pragmas.o \
src/7_3/semtypinst.o \
src/7_3/sigmatch.o \
src/7_3/parampatterns.o \
src/7_3/docgen.o \
src/7_3/rstast.o \
src/7_3/rst.o \
src/7_3/rstgen.o \
src/7_3/highlite.o \
src/7_3/algorithm.o \
src/7_3/sequtils.o \
src/7_3/aliases.o \
src/7_3/patterns.o \
src/7_3/cgen.o \
src/7_3/ccgutils.o \
src/7_3/cgendata.o \
src/7_3/ccgmerge.o \
src/7_3/jsgen.o \
src/7_3/json.o \
src/7_3/lexbase.o \
src/7_3/unicode.o \
src/7_3/passaux.o \
src/7_3/depends.o \
src/7_3/docgen2.o \
src/7_3/service.o \
src/7_3/parseopt.o \
src/7_3/modules.o \
src/7_3/pretty.o $LINK_FLAGS
    ;;
  arm)
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/nimrod.c -o src/7_4/nimrod.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/nimrod.c -o src/7_4/nimrod.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/system.c -o src/7_4/system.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/system.c -o src/7_4/system.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/commands.c -o src/7_4/commands.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/commands.c -o src/7_4/commands.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/os.c -o src/7_4/os.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/os.c -o src/7_4/os.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/strutils.c -o src/7_4/strutils.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/strutils.c -o src/7_4/strutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/parseutils.c -o src/7_4/parseutils.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/parseutils.c -o src/7_4/parseutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/times.c -o src/7_4/times.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/times.c -o src/7_4/times.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/posix.c -o src/7_4/posix.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/posix.c -o src/7_4/posix.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/msgs.c -o src/7_4/msgs.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/msgs.c -o src/7_4/msgs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/options.c -o src/7_4/options.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/options.c -o src/7_4/options.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/lists.c -o src/7_4/lists.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/lists.c -o src/7_4/lists.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/strtabs.c -o src/7_4/strtabs.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/strtabs.c -o src/7_4/strtabs.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/hashes.c -o src/7_4/hashes.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/hashes.c -o src/7_4/hashes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/tables.c -o src/7_4/tables.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/tables.c -o src/7_4/tables.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/math.c -o src/7_4/math.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/math.c -o src/7_4/math.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/sockets.c -o src/7_4/sockets.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/sockets.c -o src/7_4/sockets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/ropes.c -o src/7_4/ropes.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/ropes.c -o src/7_4/ropes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/platform.c -o src/7_4/platform.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/platform.c -o src/7_4/platform.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/crc.c -o src/7_4/crc.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/crc.c -o src/7_4/crc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/nversion.c -o src/7_4/nversion.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/nversion.c -o src/7_4/nversion.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/condsyms.c -o src/7_4/condsyms.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/condsyms.c -o src/7_4/condsyms.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/idents.c -o src/7_4/idents.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/idents.c -o src/7_4/idents.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/extccomp.c -o src/7_4/extccomp.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/extccomp.c -o src/7_4/extccomp.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/osproc.c -o src/7_4/osproc.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/osproc.c -o src/7_4/osproc.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/streams.c -o src/7_4/streams.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/streams.c -o src/7_4/streams.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/wordrecg.c -o src/7_4/wordrecg.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/wordrecg.c -o src/7_4/wordrecg.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/babelcmd.c -o src/7_4/babelcmd.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/babelcmd.c -o src/7_4/babelcmd.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/lexer.c -o src/7_4/lexer.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/lexer.c -o src/7_4/lexer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/nimlexbase.c -o src/7_4/nimlexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/nimlexbase.c -o src/7_4/nimlexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/llstream.c -o src/7_4/llstream.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/llstream.c -o src/7_4/llstream.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/nimconf.c -o src/7_4/nimconf.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/nimconf.c -o src/7_4/nimconf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/main.c -o src/7_4/main.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/main.c -o src/7_4/main.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/ast.c -o src/7_4/ast.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/ast.c -o src/7_4/ast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/intsets.c -o src/7_4/intsets.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/intsets.c -o src/7_4/intsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/idgen.c -o src/7_4/idgen.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/idgen.c -o src/7_4/idgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/astalgo.c -o src/7_4/astalgo.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/astalgo.c -o src/7_4/astalgo.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/rodutils.c -o src/7_4/rodutils.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/rodutils.c -o src/7_4/rodutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/syntaxes.c -o src/7_4/syntaxes.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/syntaxes.c -o src/7_4/syntaxes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/parser.c -o src/7_4/parser.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/parser.c -o src/7_4/parser.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/pbraces.c -o src/7_4/pbraces.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/pbraces.c -o src/7_4/pbraces.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/filters.c -o src/7_4/filters.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/filters.c -o src/7_4/filters.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/renderer.c -o src/7_4/renderer.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/renderer.c -o src/7_4/renderer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/filter_tmpl.c -o src/7_4/filter_tmpl.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/filter_tmpl.c -o src/7_4/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/rodread.c -o src/7_4/rodread.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/rodread.c -o src/7_4/rodread.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/types.c -o src/7_4/types.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/types.c -o src/7_4/types.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/trees.c -o src/7_4/trees.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/trees.c -o src/7_4/trees.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/memfiles.c -o src/7_4/memfiles.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/memfiles.c -o src/7_4/memfiles.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/rodwrite.c -o src/7_4/rodwrite.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/rodwrite.c -o src/7_4/rodwrite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/passes.c -o src/7_4/passes.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/passes.c -o src/7_4/passes.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/magicsys.c -o src/7_4/magicsys.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/magicsys.c -o src/7_4/magicsys.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/nimsets.c -o src/7_4/nimsets.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/nimsets.c -o src/7_4/nimsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/bitsets.c -o src/7_4/bitsets.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/bitsets.c -o src/7_4/bitsets.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/semthreads.c -o src/7_4/semthreads.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/semthreads.c -o src/7_4/semthreads.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/importer.c -o src/7_4/importer.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/importer.c -o src/7_4/importer.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/lookups.c -o src/7_4/lookups.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/lookups.c -o src/7_4/lookups.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/semdata.c -o src/7_4/semdata.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/semdata.c -o src/7_4/semdata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/treetab.c -o src/7_4/treetab.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/treetab.c -o src/7_4/treetab.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/evals.c -o src/7_4/evals.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/evals.c -o src/7_4/evals.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/semfold.c -o src/7_4/semfold.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/semfold.c -o src/7_4/semfold.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/saturate.c -o src/7_4/saturate.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/saturate.c -o src/7_4/saturate.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/transf.c -o src/7_4/transf.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/transf.c -o src/7_4/transf.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/cgmeth.c -o src/7_4/cgmeth.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/cgmeth.c -o src/7_4/cgmeth.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/sempass2.c -o src/7_4/sempass2.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/sempass2.c -o src/7_4/sempass2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/guards.c -o src/7_4/guards.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/guards.c -o src/7_4/guards.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/lambdalifting.c -o src/7_4/lambdalifting.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/lambdalifting.c -o src/7_4/lambdalifting.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/evaltempl.c -o src/7_4/evaltempl.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/evaltempl.c -o src/7_4/evaltempl.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/sem.c -o src/7_4/sem.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/sem.c -o src/7_4/sem.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/procfind.c -o src/7_4/procfind.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/procfind.c -o src/7_4/procfind.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/pragmas.c -o src/7_4/pragmas.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/pragmas.c -o src/7_4/pragmas.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/semtypinst.c -o src/7_4/semtypinst.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/semtypinst.c -o src/7_4/semtypinst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/sigmatch.c -o src/7_4/sigmatch.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/sigmatch.c -o src/7_4/sigmatch.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/parampatterns.c -o src/7_4/parampatterns.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/parampatterns.c -o src/7_4/parampatterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/docgen.c -o src/7_4/docgen.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/docgen.c -o src/7_4/docgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/rstast.c -o src/7_4/rstast.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/rstast.c -o src/7_4/rstast.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/rst.c -o src/7_4/rst.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/rst.c -o src/7_4/rst.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/rstgen.c -o src/7_4/rstgen.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/rstgen.c -o src/7_4/rstgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/highlite.c -o src/7_4/highlite.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/highlite.c -o src/7_4/highlite.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/algorithm.c -o src/7_4/algorithm.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/algorithm.c -o src/7_4/algorithm.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/sequtils.c -o src/7_4/sequtils.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/sequtils.c -o src/7_4/sequtils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/aliases.c -o src/7_4/aliases.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/aliases.c -o src/7_4/aliases.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/patterns.c -o src/7_4/patterns.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/patterns.c -o src/7_4/patterns.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/cgen.c -o src/7_4/cgen.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/cgen.c -o src/7_4/cgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/ccgutils.c -o src/7_4/ccgutils.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/ccgutils.c -o src/7_4/ccgutils.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/cgendata.c -o src/7_4/cgendata.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/cgendata.c -o src/7_4/cgendata.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/ccgmerge.c -o src/7_4/ccgmerge.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/ccgmerge.c -o src/7_4/ccgmerge.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/jsgen.c -o src/7_4/jsgen.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/jsgen.c -o src/7_4/jsgen.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/json.c -o src/7_4/json.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/json.c -o src/7_4/json.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/lexbase.c -o src/7_4/lexbase.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/lexbase.c -o src/7_4/lexbase.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/unicode.c -o src/7_4/unicode.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/unicode.c -o src/7_4/unicode.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/passaux.c -o src/7_4/passaux.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/passaux.c -o src/7_4/passaux.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/depends.c -o src/7_4/depends.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/depends.c -o src/7_4/depends.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/docgen2.c -o src/7_4/docgen2.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/docgen2.c -o src/7_4/docgen2.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/service.c -o src/7_4/service.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/service.c -o src/7_4/service.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/parseopt.c -o src/7_4/parseopt.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/parseopt.c -o src/7_4/parseopt.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/modules.c -o src/7_4/modules.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/modules.c -o src/7_4/modules.o
    echo "$CC $COMP_FLAGS -Isrc -c src/7_4/pretty.c -o src/7_4/pretty.o"
    $CC $COMP_FLAGS -Isrc -c src/7_4/pretty.c -o src/7_4/pretty.o
    echo "$LINKER -o $binDir/nimrod  \
src/7_4/nimrod.o \
src/7_4/system.o \
src/7_4/commands.o \
src/7_4/os.o \
src/7_4/strutils.o \
src/7_4/parseutils.o \
src/7_4/times.o \
src/7_4/posix.o \
src/7_4/msgs.o \
src/7_4/options.o \
src/7_4/lists.o \
src/7_4/strtabs.o \
src/7_4/hashes.o \
src/7_4/tables.o \
src/7_4/math.o \
src/7_4/sockets.o \
src/7_4/ropes.o \
src/7_4/platform.o \
src/7_4/crc.o \
src/7_4/nversion.o \
src/7_4/condsyms.o \
src/7_4/idents.o \
src/7_4/extccomp.o \
src/7_4/osproc.o \
src/7_4/streams.o \
src/7_4/wordrecg.o \
src/7_4/babelcmd.o \
src/7_4/lexer.o \
src/7_4/nimlexbase.o \
src/7_4/llstream.o \
src/7_4/nimconf.o \
src/7_4/main.o \
src/7_4/ast.o \
src/7_4/intsets.o \
src/7_4/idgen.o \
src/7_4/astalgo.o \
src/7_4/rodutils.o \
src/7_4/syntaxes.o \
src/7_4/parser.o \
src/7_4/pbraces.o \
src/7_4/filters.o \
src/7_4/renderer.o \
src/7_4/filter_tmpl.o \
src/7_4/rodread.o \
src/7_4/types.o \
src/7_4/trees.o \
src/7_4/memfiles.o \
src/7_4/rodwrite.o \
src/7_4/passes.o \
src/7_4/magicsys.o \
src/7_4/nimsets.o \
src/7_4/bitsets.o \
src/7_4/semthreads.o \
src/7_4/importer.o \
src/7_4/lookups.o \
src/7_4/semdata.o \
src/7_4/treetab.o \
src/7_4/evals.o \
src/7_4/semfold.o \
src/7_4/saturate.o \
src/7_4/transf.o \
src/7_4/cgmeth.o \
src/7_4/sempass2.o \
src/7_4/guards.o \
src/7_4/lambdalifting.o \
src/7_4/evaltempl.o \
src/7_4/sem.o \
src/7_4/procfind.o \
src/7_4/pragmas.o \
src/7_4/semtypinst.o \
src/7_4/sigmatch.o \
src/7_4/parampatterns.o \
src/7_4/docgen.o \
src/7_4/rstast.o \
src/7_4/rst.o \
src/7_4/rstgen.o \
src/7_4/highlite.o \
src/7_4/algorithm.o \
src/7_4/sequtils.o \
src/7_4/aliases.o \
src/7_4/patterns.o \
src/7_4/cgen.o \
src/7_4/ccgutils.o \
src/7_4/cgendata.o \
src/7_4/ccgmerge.o \
src/7_4/jsgen.o \
src/7_4/json.o \
src/7_4/lexbase.o \
src/7_4/unicode.o \
src/7_4/passaux.o \
src/7_4/depends.o \
src/7_4/docgen2.o \
src/7_4/service.o \
src/7_4/parseopt.o \
src/7_4/modules.o \
src/7_4/pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
src/7_4/nimrod.o \
src/7_4/system.o \
src/7_4/commands.o \
src/7_4/os.o \
src/7_4/strutils.o \
src/7_4/parseutils.o \
src/7_4/times.o \
src/7_4/posix.o \
src/7_4/msgs.o \
src/7_4/options.o \
src/7_4/lists.o \
src/7_4/strtabs.o \
src/7_4/hashes.o \
src/7_4/tables.o \
src/7_4/math.o \
src/7_4/sockets.o \
src/7_4/ropes.o \
src/7_4/platform.o \
src/7_4/crc.o \
src/7_4/nversion.o \
src/7_4/condsyms.o \
src/7_4/idents.o \
src/7_4/extccomp.o \
src/7_4/osproc.o \
src/7_4/streams.o \
src/7_4/wordrecg.o \
src/7_4/babelcmd.o \
src/7_4/lexer.o \
src/7_4/nimlexbase.o \
src/7_4/llstream.o \
src/7_4/nimconf.o \
src/7_4/main.o \
src/7_4/ast.o \
src/7_4/intsets.o \
src/7_4/idgen.o \
src/7_4/astalgo.o \
src/7_4/rodutils.o \
src/7_4/syntaxes.o \
src/7_4/parser.o \
src/7_4/pbraces.o \
src/7_4/filters.o \
src/7_4/renderer.o \
src/7_4/filter_tmpl.o \
src/7_4/rodread.o \
src/7_4/types.o \
src/7_4/trees.o \
src/7_4/memfiles.o \
src/7_4/rodwrite.o \
src/7_4/passes.o \
src/7_4/magicsys.o \
src/7_4/nimsets.o \
src/7_4/bitsets.o \
src/7_4/semthreads.o \
src/7_4/importer.o \
src/7_4/lookups.o \
src/7_4/semdata.o \
src/7_4/treetab.o \
src/7_4/evals.o \
src/7_4/semfold.o \
src/7_4/saturate.o \
src/7_4/transf.o \
src/7_4/cgmeth.o \
src/7_4/sempass2.o \
src/7_4/guards.o \
src/7_4/lambdalifting.o \
src/7_4/evaltempl.o \
src/7_4/sem.o \
src/7_4/procfind.o \
src/7_4/pragmas.o \
src/7_4/semtypinst.o \
src/7_4/sigmatch.o \
src/7_4/parampatterns.o \
src/7_4/docgen.o \
src/7_4/rstast.o \
src/7_4/rst.o \
src/7_4/rstgen.o \
src/7_4/highlite.o \
src/7_4/algorithm.o \
src/7_4/sequtils.o \
src/7_4/aliases.o \
src/7_4/patterns.o \
src/7_4/cgen.o \
src/7_4/ccgutils.o \
src/7_4/cgendata.o \
src/7_4/ccgmerge.o \
src/7_4/jsgen.o \
src/7_4/json.o \
src/7_4/lexbase.o \
src/7_4/unicode.o \
src/7_4/passaux.o \
src/7_4/depends.o \
src/7_4/docgen2.o \
src/7_4/service.o \
src/7_4/parseopt.o \
src/7_4/modules.o \
src/7_4/pretty.o $LINK_FLAGS
    ;;
  *)
    echo "Error: no C code generated for: [$myos: $mycpu]"
    exit 1
    ;;
  esac
  ;;
*) 
  echo "Error: no C code generated for: [$myos: $mycpu]"
  exit 1
  ;;
esac

echo "SUCCESS"


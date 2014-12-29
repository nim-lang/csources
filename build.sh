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
COMP_FLAGS="-w -O3 -fno-strict-aliasing$extraBuildArgs"
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
  *freebsd* | *dragonfly* ) 
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
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/nim.c -o c_code/1_1/nim.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nim.c -o c_code/1_1/nim.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_system.c -o c_code/1_1/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_system.c -o c_code/1_1/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/testability.c -o c_code/1_1/testability.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/testability.c -o c_code/1_1/testability.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/commands.c -o c_code/1_1/commands.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/commands.c -o c_code/1_1/commands.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_os.c -o c_code/1_1/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_os.c -o c_code/1_1/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strutils.c -o c_code/1_1/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strutils.c -o c_code/1_1/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parseutils.c -o c_code/1_1/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parseutils.c -o c_code/1_1/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_times.c -o c_code/1_1/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_times.c -o c_code/1_1/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_winlean.c -o c_code/1_1/stdlib_winlean.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_winlean.c -o c_code/1_1/stdlib_winlean.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/msgs.c -o c_code/1_1/msgs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/msgs.c -o c_code/1_1/msgs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/options.c -o c_code/1_1/options.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/options.c -o c_code/1_1/options.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/lists.c -o c_code/1_1/lists.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lists.c -o c_code/1_1/lists.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strtabs.c -o c_code/1_1/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strtabs.c -o c_code/1_1/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_hashes.c -o c_code/1_1/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_hashes.c -o c_code/1_1/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_osproc.c -o c_code/1_1/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_osproc.c -o c_code/1_1/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_streams.c -o c_code/1_1/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_streams.c -o c_code/1_1/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cpuinfo.c -o c_code/1_1/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cpuinfo.c -o c_code/1_1/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sets.c -o c_code/1_1/stdlib_sets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sets.c -o c_code/1_1/stdlib_sets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_math.c -o c_code/1_1/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_math.c -o c_code/1_1/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_tables.c -o c_code/1_1/stdlib_tables.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_tables.c -o c_code/1_1/stdlib_tables.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/ropes.c -o c_code/1_1/ropes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ropes.c -o c_code/1_1/ropes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/platform.c -o c_code/1_1/platform.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/platform.c -o c_code/1_1/platform.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/crc.c -o c_code/1_1/crc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/crc.c -o c_code/1_1/crc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sockets.c -o c_code/1_1/stdlib_sockets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sockets.c -o c_code/1_1/stdlib_sockets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_unsigned.c -o c_code/1_1/stdlib_unsigned.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_unsigned.c -o c_code/1_1/stdlib_unsigned.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/nversion.c -o c_code/1_1/nversion.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nversion.c -o c_code/1_1/nversion.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/condsyms.c -o c_code/1_1/condsyms.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/condsyms.c -o c_code/1_1/condsyms.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/idents.c -o c_code/1_1/idents.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idents.c -o c_code/1_1/idents.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/extccomp.c -o c_code/1_1/extccomp.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/extccomp.c -o c_code/1_1/extccomp.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/wordrecg.c -o c_code/1_1/wordrecg.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/wordrecg.c -o c_code/1_1/wordrecg.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimblecmd.c -o c_code/1_1/nimblecmd.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimblecmd.c -o c_code/1_1/nimblecmd.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parseopt.c -o c_code/1_1/stdlib_parseopt.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parseopt.c -o c_code/1_1/stdlib_parseopt.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/lexer.c -o c_code/1_1/lexer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lexer.c -o c_code/1_1/lexer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimlexbase.c -o c_code/1_1/nimlexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimlexbase.c -o c_code/1_1/nimlexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/llstream.c -o c_code/1_1/llstream.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/llstream.c -o c_code/1_1/llstream.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimconf.c -o c_code/1_1/nimconf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimconf.c -o c_code/1_1/nimconf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/main.c -o c_code/1_1/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/main.c -o c_code/1_1/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/ast.c -o c_code/1_1/ast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ast.c -o c_code/1_1/ast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_intsets.c -o c_code/1_1/stdlib_intsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_intsets.c -o c_code/1_1/stdlib_intsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/idgen.c -o c_code/1_1/idgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idgen.c -o c_code/1_1/idgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/astalgo.c -o c_code/1_1/astalgo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/astalgo.c -o c_code/1_1/astalgo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/rodutils.c -o c_code/1_1/rodutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/rodutils.c -o c_code/1_1/rodutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/syntaxes.c -o c_code/1_1/syntaxes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/syntaxes.c -o c_code/1_1/syntaxes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/parser.c -o c_code/1_1/parser.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parser.c -o c_code/1_1/parser.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/pbraces.c -o c_code/1_1/pbraces.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/pbraces.c -o c_code/1_1/pbraces.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/filters.c -o c_code/1_1/filters.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filters.c -o c_code/1_1/filters.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/renderer.c -o c_code/1_1/renderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/renderer.c -o c_code/1_1/renderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/filter_tmpl.c -o c_code/1_1/filter_tmpl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filter_tmpl.c -o c_code/1_1/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/rodread.c -o c_code/1_1/rodread.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/rodread.c -o c_code/1_1/rodread.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/types.c -o c_code/1_1/types.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/types.c -o c_code/1_1/types.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/trees.c -o c_code/1_1/trees.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/trees.c -o c_code/1_1/trees.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_memfiles.c -o c_code/1_1/stdlib_memfiles.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_memfiles.c -o c_code/1_1/stdlib_memfiles.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/rodwrite.c -o c_code/1_1/rodwrite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/rodwrite.c -o c_code/1_1/rodwrite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/passes.c -o c_code/1_1/passes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passes.c -o c_code/1_1/passes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/magicsys.c -o c_code/1_1/magicsys.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/magicsys.c -o c_code/1_1/magicsys.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimsets.c -o c_code/1_1/nimsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimsets.c -o c_code/1_1/nimsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/bitsets.c -o c_code/1_1/bitsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/bitsets.c -o c_code/1_1/bitsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/importer.c -o c_code/1_1/importer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/importer.c -o c_code/1_1/importer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/lookups.c -o c_code/1_1/lookups.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lookups.c -o c_code/1_1/lookups.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/semdata.c -o c_code/1_1/semdata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semdata.c -o c_code/1_1/semdata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/treetab.c -o c_code/1_1/treetab.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/treetab.c -o c_code/1_1/treetab.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdef.c -o c_code/1_1/vmdef.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdef.c -o c_code/1_1/vmdef.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/prettybase.c -o c_code/1_1/prettybase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/prettybase.c -o c_code/1_1/prettybase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_lexbase.c -o c_code/1_1/stdlib_lexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_lexbase.c -o c_code/1_1/stdlib_lexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/sem.c -o c_code/1_1/sem.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sem.c -o c_code/1_1/sem.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/semfold.c -o c_code/1_1/semfold.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semfold.c -o c_code/1_1/semfold.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/saturate.c -o c_code/1_1/saturate.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/saturate.c -o c_code/1_1/saturate.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/procfind.c -o c_code/1_1/procfind.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/procfind.c -o c_code/1_1/procfind.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/pragmas.c -o c_code/1_1/pragmas.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/pragmas.c -o c_code/1_1/pragmas.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/semtypinst.c -o c_code/1_1/semtypinst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semtypinst.c -o c_code/1_1/semtypinst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/sigmatch.c -o c_code/1_1/sigmatch.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sigmatch.c -o c_code/1_1/sigmatch.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/parampatterns.c -o c_code/1_1/parampatterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parampatterns.c -o c_code/1_1/parampatterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/pretty.c -o c_code/1_1/pretty.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/pretty.c -o c_code/1_1/pretty.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/docgen.c -o c_code/1_1/docgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/docgen.c -o c_code/1_1/docgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/docutils_rstast.c -o c_code/1_1/docutils_rstast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/docutils_rstast.c -o c_code/1_1/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_json.c -o c_code/1_1/stdlib_json.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_json.c -o c_code/1_1/stdlib_json.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_unicode.c -o c_code/1_1/stdlib_unicode.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_unicode.c -o c_code/1_1/stdlib_unicode.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/docutils_rst.c -o c_code/1_1/docutils_rst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/docutils_rst.c -o c_code/1_1/docutils_rst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/docutils_rstgen.c -o c_code/1_1/docutils_rstgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/docutils_rstgen.c -o c_code/1_1/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/docutils_highlite.c -o c_code/1_1/docutils_highlite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/docutils_highlite.c -o c_code/1_1/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sequtils.c -o c_code/1_1/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sequtils.c -o c_code/1_1/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_algorithm.c -o c_code/1_1/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_algorithm.c -o c_code/1_1/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/sempass2.c -o c_code/1_1/sempass2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sempass2.c -o c_code/1_1/sempass2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/guards.c -o c_code/1_1/guards.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/guards.c -o c_code/1_1/guards.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_xmltree.c -o c_code/1_1/stdlib_xmltree.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_xmltree.c -o c_code/1_1/stdlib_xmltree.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_macros.c -o c_code/1_1/stdlib_macros.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_macros.c -o c_code/1_1/stdlib_macros.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cgi.c -o c_code/1_1/stdlib_cgi.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cgi.c -o c_code/1_1/stdlib_cgi.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cookies.c -o c_code/1_1/stdlib_cookies.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cookies.c -o c_code/1_1/stdlib_cookies.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/typesrenderer.c -o c_code/1_1/typesrenderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/typesrenderer.c -o c_code/1_1/typesrenderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/transf.c -o c_code/1_1/transf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/transf.c -o c_code/1_1/transf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgmeth.c -o c_code/1_1/cgmeth.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgmeth.c -o c_code/1_1/cgmeth.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/lambdalifting.c -o c_code/1_1/lambdalifting.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lambdalifting.c -o c_code/1_1/lambdalifting.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/lowerings.c -o c_code/1_1/lowerings.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lowerings.c -o c_code/1_1/lowerings.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/vm.c -o c_code/1_1/vm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vm.c -o c_code/1_1/vm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmgen.c -o c_code/1_1/vmgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmgen.c -o c_code/1_1/vmgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdeps.c -o c_code/1_1/vmdeps.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdeps.c -o c_code/1_1/vmdeps.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/evaltempl.c -o c_code/1_1/evaltempl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/evaltempl.c -o c_code/1_1/evaltempl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/aliases.c -o c_code/1_1/aliases.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/aliases.c -o c_code/1_1/aliases.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/patterns.c -o c_code/1_1/patterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/patterns.c -o c_code/1_1/patterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/semmacrosanity.c -o c_code/1_1/semmacrosanity.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semmacrosanity.c -o c_code/1_1/semmacrosanity.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/semparallel.c -o c_code/1_1/semparallel.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semparallel.c -o c_code/1_1/semparallel.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgen.c -o c_code/1_1/cgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgen.c -o c_code/1_1/cgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgutils.c -o c_code/1_1/ccgutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgutils.c -o c_code/1_1/ccgutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgendata.c -o c_code/1_1/cgendata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgendata.c -o c_code/1_1/cgendata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgmerge.c -o c_code/1_1/ccgmerge.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgmerge.c -o c_code/1_1/ccgmerge.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/jsgen.c -o c_code/1_1/jsgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/jsgen.c -o c_code/1_1/jsgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/passaux.c -o c_code/1_1/passaux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passaux.c -o c_code/1_1/passaux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/depends.c -o c_code/1_1/depends.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/depends.c -o c_code/1_1/depends.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/docgen2.c -o c_code/1_1/docgen2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/docgen2.c -o c_code/1_1/docgen2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/service.c -o c_code/1_1/service.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/service.c -o c_code/1_1/service.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/modules.c -o c_code/1_1/modules.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modules.c -o c_code/1_1/modules.o
    echo "$LINKER -o $binDir/nim  \
c_code/1_1/nim.o \
c_code/1_1/stdlib_system.o \
c_code/1_1/testability.o \
c_code/1_1/commands.o \
c_code/1_1/stdlib_os.o \
c_code/1_1/stdlib_strutils.o \
c_code/1_1/stdlib_parseutils.o \
c_code/1_1/stdlib_times.o \
c_code/1_1/stdlib_winlean.o \
c_code/1_1/msgs.o \
c_code/1_1/options.o \
c_code/1_1/lists.o \
c_code/1_1/stdlib_strtabs.o \
c_code/1_1/stdlib_hashes.o \
c_code/1_1/stdlib_osproc.o \
c_code/1_1/stdlib_streams.o \
c_code/1_1/stdlib_cpuinfo.o \
c_code/1_1/stdlib_sets.o \
c_code/1_1/stdlib_math.o \
c_code/1_1/stdlib_tables.o \
c_code/1_1/ropes.o \
c_code/1_1/platform.o \
c_code/1_1/crc.o \
c_code/1_1/stdlib_sockets.o \
c_code/1_1/stdlib_unsigned.o \
c_code/1_1/nversion.o \
c_code/1_1/condsyms.o \
c_code/1_1/idents.o \
c_code/1_1/extccomp.o \
c_code/1_1/wordrecg.o \
c_code/1_1/nimblecmd.o \
c_code/1_1/stdlib_parseopt.o \
c_code/1_1/lexer.o \
c_code/1_1/nimlexbase.o \
c_code/1_1/llstream.o \
c_code/1_1/nimconf.o \
c_code/1_1/main.o \
c_code/1_1/ast.o \
c_code/1_1/stdlib_intsets.o \
c_code/1_1/idgen.o \
c_code/1_1/astalgo.o \
c_code/1_1/rodutils.o \
c_code/1_1/syntaxes.o \
c_code/1_1/parser.o \
c_code/1_1/pbraces.o \
c_code/1_1/filters.o \
c_code/1_1/renderer.o \
c_code/1_1/filter_tmpl.o \
c_code/1_1/rodread.o \
c_code/1_1/types.o \
c_code/1_1/trees.o \
c_code/1_1/stdlib_memfiles.o \
c_code/1_1/rodwrite.o \
c_code/1_1/passes.o \
c_code/1_1/magicsys.o \
c_code/1_1/nimsets.o \
c_code/1_1/bitsets.o \
c_code/1_1/importer.o \
c_code/1_1/lookups.o \
c_code/1_1/semdata.o \
c_code/1_1/treetab.o \
c_code/1_1/vmdef.o \
c_code/1_1/prettybase.o \
c_code/1_1/stdlib_lexbase.o \
c_code/1_1/sem.o \
c_code/1_1/semfold.o \
c_code/1_1/saturate.o \
c_code/1_1/procfind.o \
c_code/1_1/pragmas.o \
c_code/1_1/semtypinst.o \
c_code/1_1/sigmatch.o \
c_code/1_1/parampatterns.o \
c_code/1_1/pretty.o \
c_code/1_1/docgen.o \
c_code/1_1/docutils_rstast.o \
c_code/1_1/stdlib_json.o \
c_code/1_1/stdlib_unicode.o \
c_code/1_1/docutils_rst.o \
c_code/1_1/docutils_rstgen.o \
c_code/1_1/docutils_highlite.o \
c_code/1_1/stdlib_sequtils.o \
c_code/1_1/stdlib_algorithm.o \
c_code/1_1/sempass2.o \
c_code/1_1/guards.o \
c_code/1_1/stdlib_xmltree.o \
c_code/1_1/stdlib_macros.o \
c_code/1_1/stdlib_cgi.o \
c_code/1_1/stdlib_cookies.o \
c_code/1_1/typesrenderer.o \
c_code/1_1/transf.o \
c_code/1_1/cgmeth.o \
c_code/1_1/lambdalifting.o \
c_code/1_1/lowerings.o \
c_code/1_1/vm.o \
c_code/1_1/vmgen.o \
c_code/1_1/vmdeps.o \
c_code/1_1/evaltempl.o \
c_code/1_1/aliases.o \
c_code/1_1/patterns.o \
c_code/1_1/semmacrosanity.o \
c_code/1_1/semparallel.o \
c_code/1_1/cgen.o \
c_code/1_1/ccgutils.o \
c_code/1_1/cgendata.o \
c_code/1_1/ccgmerge.o \
c_code/1_1/jsgen.o \
c_code/1_1/passaux.o \
c_code/1_1/depends.o \
c_code/1_1/docgen2.o \
c_code/1_1/service.o \
c_code/1_1/modules.o $LINK_FLAGS"
    $LINKER -o $binDir/nim  \
c_code/1_1/nim.o \
c_code/1_1/stdlib_system.o \
c_code/1_1/testability.o \
c_code/1_1/commands.o \
c_code/1_1/stdlib_os.o \
c_code/1_1/stdlib_strutils.o \
c_code/1_1/stdlib_parseutils.o \
c_code/1_1/stdlib_times.o \
c_code/1_1/stdlib_winlean.o \
c_code/1_1/msgs.o \
c_code/1_1/options.o \
c_code/1_1/lists.o \
c_code/1_1/stdlib_strtabs.o \
c_code/1_1/stdlib_hashes.o \
c_code/1_1/stdlib_osproc.o \
c_code/1_1/stdlib_streams.o \
c_code/1_1/stdlib_cpuinfo.o \
c_code/1_1/stdlib_sets.o \
c_code/1_1/stdlib_math.o \
c_code/1_1/stdlib_tables.o \
c_code/1_1/ropes.o \
c_code/1_1/platform.o \
c_code/1_1/crc.o \
c_code/1_1/stdlib_sockets.o \
c_code/1_1/stdlib_unsigned.o \
c_code/1_1/nversion.o \
c_code/1_1/condsyms.o \
c_code/1_1/idents.o \
c_code/1_1/extccomp.o \
c_code/1_1/wordrecg.o \
c_code/1_1/nimblecmd.o \
c_code/1_1/stdlib_parseopt.o \
c_code/1_1/lexer.o \
c_code/1_1/nimlexbase.o \
c_code/1_1/llstream.o \
c_code/1_1/nimconf.o \
c_code/1_1/main.o \
c_code/1_1/ast.o \
c_code/1_1/stdlib_intsets.o \
c_code/1_1/idgen.o \
c_code/1_1/astalgo.o \
c_code/1_1/rodutils.o \
c_code/1_1/syntaxes.o \
c_code/1_1/parser.o \
c_code/1_1/pbraces.o \
c_code/1_1/filters.o \
c_code/1_1/renderer.o \
c_code/1_1/filter_tmpl.o \
c_code/1_1/rodread.o \
c_code/1_1/types.o \
c_code/1_1/trees.o \
c_code/1_1/stdlib_memfiles.o \
c_code/1_1/rodwrite.o \
c_code/1_1/passes.o \
c_code/1_1/magicsys.o \
c_code/1_1/nimsets.o \
c_code/1_1/bitsets.o \
c_code/1_1/importer.o \
c_code/1_1/lookups.o \
c_code/1_1/semdata.o \
c_code/1_1/treetab.o \
c_code/1_1/vmdef.o \
c_code/1_1/prettybase.o \
c_code/1_1/stdlib_lexbase.o \
c_code/1_1/sem.o \
c_code/1_1/semfold.o \
c_code/1_1/saturate.o \
c_code/1_1/procfind.o \
c_code/1_1/pragmas.o \
c_code/1_1/semtypinst.o \
c_code/1_1/sigmatch.o \
c_code/1_1/parampatterns.o \
c_code/1_1/pretty.o \
c_code/1_1/docgen.o \
c_code/1_1/docutils_rstast.o \
c_code/1_1/stdlib_json.o \
c_code/1_1/stdlib_unicode.o \
c_code/1_1/docutils_rst.o \
c_code/1_1/docutils_rstgen.o \
c_code/1_1/docutils_highlite.o \
c_code/1_1/stdlib_sequtils.o \
c_code/1_1/stdlib_algorithm.o \
c_code/1_1/sempass2.o \
c_code/1_1/guards.o \
c_code/1_1/stdlib_xmltree.o \
c_code/1_1/stdlib_macros.o \
c_code/1_1/stdlib_cgi.o \
c_code/1_1/stdlib_cookies.o \
c_code/1_1/typesrenderer.o \
c_code/1_1/transf.o \
c_code/1_1/cgmeth.o \
c_code/1_1/lambdalifting.o \
c_code/1_1/lowerings.o \
c_code/1_1/vm.o \
c_code/1_1/vmgen.o \
c_code/1_1/vmdeps.o \
c_code/1_1/evaltempl.o \
c_code/1_1/aliases.o \
c_code/1_1/patterns.o \
c_code/1_1/semmacrosanity.o \
c_code/1_1/semparallel.o \
c_code/1_1/cgen.o \
c_code/1_1/ccgutils.o \
c_code/1_1/cgendata.o \
c_code/1_1/ccgmerge.o \
c_code/1_1/jsgen.o \
c_code/1_1/passaux.o \
c_code/1_1/depends.o \
c_code/1_1/docgen2.o \
c_code/1_1/service.o \
c_code/1_1/modules.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/nim.c -o c_code/1_2/nim.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nim.c -o c_code/1_2/nim.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_system.c -o c_code/1_2/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_system.c -o c_code/1_2/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/testability.c -o c_code/1_2/testability.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/testability.c -o c_code/1_2/testability.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/commands.c -o c_code/1_2/commands.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/commands.c -o c_code/1_2/commands.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_os.c -o c_code/1_2/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_os.c -o c_code/1_2/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strutils.c -o c_code/1_2/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strutils.c -o c_code/1_2/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parseutils.c -o c_code/1_2/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parseutils.c -o c_code/1_2/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_times.c -o c_code/1_2/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_times.c -o c_code/1_2/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_winlean.c -o c_code/1_2/stdlib_winlean.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_winlean.c -o c_code/1_2/stdlib_winlean.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/msgs.c -o c_code/1_2/msgs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/msgs.c -o c_code/1_2/msgs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/options.c -o c_code/1_2/options.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/options.c -o c_code/1_2/options.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/lists.c -o c_code/1_2/lists.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lists.c -o c_code/1_2/lists.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strtabs.c -o c_code/1_2/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strtabs.c -o c_code/1_2/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_hashes.c -o c_code/1_2/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_hashes.c -o c_code/1_2/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_osproc.c -o c_code/1_2/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_osproc.c -o c_code/1_2/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_streams.c -o c_code/1_2/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_streams.c -o c_code/1_2/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cpuinfo.c -o c_code/1_2/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cpuinfo.c -o c_code/1_2/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sets.c -o c_code/1_2/stdlib_sets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sets.c -o c_code/1_2/stdlib_sets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_math.c -o c_code/1_2/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_math.c -o c_code/1_2/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_tables.c -o c_code/1_2/stdlib_tables.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_tables.c -o c_code/1_2/stdlib_tables.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/ropes.c -o c_code/1_2/ropes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ropes.c -o c_code/1_2/ropes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/platform.c -o c_code/1_2/platform.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/platform.c -o c_code/1_2/platform.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/crc.c -o c_code/1_2/crc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/crc.c -o c_code/1_2/crc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sockets.c -o c_code/1_2/stdlib_sockets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sockets.c -o c_code/1_2/stdlib_sockets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_unsigned.c -o c_code/1_2/stdlib_unsigned.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_unsigned.c -o c_code/1_2/stdlib_unsigned.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/nversion.c -o c_code/1_2/nversion.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nversion.c -o c_code/1_2/nversion.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/condsyms.c -o c_code/1_2/condsyms.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/condsyms.c -o c_code/1_2/condsyms.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/idents.c -o c_code/1_2/idents.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idents.c -o c_code/1_2/idents.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/extccomp.c -o c_code/1_2/extccomp.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/extccomp.c -o c_code/1_2/extccomp.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/wordrecg.c -o c_code/1_2/wordrecg.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/wordrecg.c -o c_code/1_2/wordrecg.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimblecmd.c -o c_code/1_2/nimblecmd.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimblecmd.c -o c_code/1_2/nimblecmd.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parseopt.c -o c_code/1_2/stdlib_parseopt.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parseopt.c -o c_code/1_2/stdlib_parseopt.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/lexer.c -o c_code/1_2/lexer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lexer.c -o c_code/1_2/lexer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimlexbase.c -o c_code/1_2/nimlexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimlexbase.c -o c_code/1_2/nimlexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/llstream.c -o c_code/1_2/llstream.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/llstream.c -o c_code/1_2/llstream.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimconf.c -o c_code/1_2/nimconf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimconf.c -o c_code/1_2/nimconf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/main.c -o c_code/1_2/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/main.c -o c_code/1_2/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/ast.c -o c_code/1_2/ast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ast.c -o c_code/1_2/ast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_intsets.c -o c_code/1_2/stdlib_intsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_intsets.c -o c_code/1_2/stdlib_intsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/idgen.c -o c_code/1_2/idgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idgen.c -o c_code/1_2/idgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/astalgo.c -o c_code/1_2/astalgo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/astalgo.c -o c_code/1_2/astalgo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/rodutils.c -o c_code/1_2/rodutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/rodutils.c -o c_code/1_2/rodutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/syntaxes.c -o c_code/1_2/syntaxes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/syntaxes.c -o c_code/1_2/syntaxes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/parser.c -o c_code/1_2/parser.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parser.c -o c_code/1_2/parser.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/pbraces.c -o c_code/1_2/pbraces.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/pbraces.c -o c_code/1_2/pbraces.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/filters.c -o c_code/1_2/filters.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filters.c -o c_code/1_2/filters.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/renderer.c -o c_code/1_2/renderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/renderer.c -o c_code/1_2/renderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/filter_tmpl.c -o c_code/1_2/filter_tmpl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filter_tmpl.c -o c_code/1_2/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/rodread.c -o c_code/1_2/rodread.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/rodread.c -o c_code/1_2/rodread.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/types.c -o c_code/1_2/types.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/types.c -o c_code/1_2/types.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/trees.c -o c_code/1_2/trees.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/trees.c -o c_code/1_2/trees.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_memfiles.c -o c_code/1_2/stdlib_memfiles.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_memfiles.c -o c_code/1_2/stdlib_memfiles.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/rodwrite.c -o c_code/1_2/rodwrite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/rodwrite.c -o c_code/1_2/rodwrite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/passes.c -o c_code/1_2/passes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passes.c -o c_code/1_2/passes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/magicsys.c -o c_code/1_2/magicsys.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/magicsys.c -o c_code/1_2/magicsys.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimsets.c -o c_code/1_2/nimsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimsets.c -o c_code/1_2/nimsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/bitsets.c -o c_code/1_2/bitsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/bitsets.c -o c_code/1_2/bitsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/importer.c -o c_code/1_2/importer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/importer.c -o c_code/1_2/importer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/lookups.c -o c_code/1_2/lookups.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lookups.c -o c_code/1_2/lookups.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/semdata.c -o c_code/1_2/semdata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semdata.c -o c_code/1_2/semdata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/treetab.c -o c_code/1_2/treetab.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/treetab.c -o c_code/1_2/treetab.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdef.c -o c_code/1_2/vmdef.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdef.c -o c_code/1_2/vmdef.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/prettybase.c -o c_code/1_2/prettybase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/prettybase.c -o c_code/1_2/prettybase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_lexbase.c -o c_code/1_2/stdlib_lexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_lexbase.c -o c_code/1_2/stdlib_lexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/sem.c -o c_code/1_2/sem.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sem.c -o c_code/1_2/sem.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/semfold.c -o c_code/1_2/semfold.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semfold.c -o c_code/1_2/semfold.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/saturate.c -o c_code/1_2/saturate.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/saturate.c -o c_code/1_2/saturate.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/procfind.c -o c_code/1_2/procfind.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/procfind.c -o c_code/1_2/procfind.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/pragmas.c -o c_code/1_2/pragmas.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/pragmas.c -o c_code/1_2/pragmas.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/semtypinst.c -o c_code/1_2/semtypinst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semtypinst.c -o c_code/1_2/semtypinst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/sigmatch.c -o c_code/1_2/sigmatch.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sigmatch.c -o c_code/1_2/sigmatch.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/parampatterns.c -o c_code/1_2/parampatterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parampatterns.c -o c_code/1_2/parampatterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/pretty.c -o c_code/1_2/pretty.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/pretty.c -o c_code/1_2/pretty.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/docgen.c -o c_code/1_2/docgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/docgen.c -o c_code/1_2/docgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/docutils_rstast.c -o c_code/1_2/docutils_rstast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/docutils_rstast.c -o c_code/1_2/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_json.c -o c_code/1_2/stdlib_json.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_json.c -o c_code/1_2/stdlib_json.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_unicode.c -o c_code/1_2/stdlib_unicode.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_unicode.c -o c_code/1_2/stdlib_unicode.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/docutils_rst.c -o c_code/1_2/docutils_rst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/docutils_rst.c -o c_code/1_2/docutils_rst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/docutils_rstgen.c -o c_code/1_2/docutils_rstgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/docutils_rstgen.c -o c_code/1_2/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/docutils_highlite.c -o c_code/1_2/docutils_highlite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/docutils_highlite.c -o c_code/1_2/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sequtils.c -o c_code/1_2/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sequtils.c -o c_code/1_2/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_algorithm.c -o c_code/1_2/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_algorithm.c -o c_code/1_2/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/sempass2.c -o c_code/1_2/sempass2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sempass2.c -o c_code/1_2/sempass2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/guards.c -o c_code/1_2/guards.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/guards.c -o c_code/1_2/guards.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_xmltree.c -o c_code/1_2/stdlib_xmltree.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_xmltree.c -o c_code/1_2/stdlib_xmltree.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_macros.c -o c_code/1_2/stdlib_macros.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_macros.c -o c_code/1_2/stdlib_macros.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cgi.c -o c_code/1_2/stdlib_cgi.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cgi.c -o c_code/1_2/stdlib_cgi.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cookies.c -o c_code/1_2/stdlib_cookies.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cookies.c -o c_code/1_2/stdlib_cookies.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/typesrenderer.c -o c_code/1_2/typesrenderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/typesrenderer.c -o c_code/1_2/typesrenderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/transf.c -o c_code/1_2/transf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/transf.c -o c_code/1_2/transf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgmeth.c -o c_code/1_2/cgmeth.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgmeth.c -o c_code/1_2/cgmeth.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/lambdalifting.c -o c_code/1_2/lambdalifting.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lambdalifting.c -o c_code/1_2/lambdalifting.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/lowerings.c -o c_code/1_2/lowerings.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lowerings.c -o c_code/1_2/lowerings.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/vm.c -o c_code/1_2/vm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vm.c -o c_code/1_2/vm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmgen.c -o c_code/1_2/vmgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmgen.c -o c_code/1_2/vmgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdeps.c -o c_code/1_2/vmdeps.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdeps.c -o c_code/1_2/vmdeps.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/evaltempl.c -o c_code/1_2/evaltempl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/evaltempl.c -o c_code/1_2/evaltempl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/aliases.c -o c_code/1_2/aliases.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/aliases.c -o c_code/1_2/aliases.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/patterns.c -o c_code/1_2/patterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/patterns.c -o c_code/1_2/patterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/semmacrosanity.c -o c_code/1_2/semmacrosanity.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semmacrosanity.c -o c_code/1_2/semmacrosanity.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/semparallel.c -o c_code/1_2/semparallel.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semparallel.c -o c_code/1_2/semparallel.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgen.c -o c_code/1_2/cgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgen.c -o c_code/1_2/cgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgutils.c -o c_code/1_2/ccgutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgutils.c -o c_code/1_2/ccgutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgendata.c -o c_code/1_2/cgendata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgendata.c -o c_code/1_2/cgendata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgmerge.c -o c_code/1_2/ccgmerge.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgmerge.c -o c_code/1_2/ccgmerge.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/jsgen.c -o c_code/1_2/jsgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/jsgen.c -o c_code/1_2/jsgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/passaux.c -o c_code/1_2/passaux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passaux.c -o c_code/1_2/passaux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/depends.c -o c_code/1_2/depends.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/depends.c -o c_code/1_2/depends.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/docgen2.c -o c_code/1_2/docgen2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/docgen2.c -o c_code/1_2/docgen2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/service.c -o c_code/1_2/service.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/service.c -o c_code/1_2/service.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/modules.c -o c_code/1_2/modules.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modules.c -o c_code/1_2/modules.o
    echo "$LINKER -o $binDir/nim  \
c_code/1_2/nim.o \
c_code/1_2/stdlib_system.o \
c_code/1_2/testability.o \
c_code/1_2/commands.o \
c_code/1_2/stdlib_os.o \
c_code/1_2/stdlib_strutils.o \
c_code/1_2/stdlib_parseutils.o \
c_code/1_2/stdlib_times.o \
c_code/1_2/stdlib_winlean.o \
c_code/1_2/msgs.o \
c_code/1_2/options.o \
c_code/1_2/lists.o \
c_code/1_2/stdlib_strtabs.o \
c_code/1_2/stdlib_hashes.o \
c_code/1_2/stdlib_osproc.o \
c_code/1_2/stdlib_streams.o \
c_code/1_2/stdlib_cpuinfo.o \
c_code/1_2/stdlib_sets.o \
c_code/1_2/stdlib_math.o \
c_code/1_2/stdlib_tables.o \
c_code/1_2/ropes.o \
c_code/1_2/platform.o \
c_code/1_2/crc.o \
c_code/1_2/stdlib_sockets.o \
c_code/1_2/stdlib_unsigned.o \
c_code/1_2/nversion.o \
c_code/1_2/condsyms.o \
c_code/1_2/idents.o \
c_code/1_2/extccomp.o \
c_code/1_2/wordrecg.o \
c_code/1_2/nimblecmd.o \
c_code/1_2/stdlib_parseopt.o \
c_code/1_2/lexer.o \
c_code/1_2/nimlexbase.o \
c_code/1_2/llstream.o \
c_code/1_2/nimconf.o \
c_code/1_2/main.o \
c_code/1_2/ast.o \
c_code/1_2/stdlib_intsets.o \
c_code/1_2/idgen.o \
c_code/1_2/astalgo.o \
c_code/1_2/rodutils.o \
c_code/1_2/syntaxes.o \
c_code/1_2/parser.o \
c_code/1_2/pbraces.o \
c_code/1_2/filters.o \
c_code/1_2/renderer.o \
c_code/1_2/filter_tmpl.o \
c_code/1_2/rodread.o \
c_code/1_2/types.o \
c_code/1_2/trees.o \
c_code/1_2/stdlib_memfiles.o \
c_code/1_2/rodwrite.o \
c_code/1_2/passes.o \
c_code/1_2/magicsys.o \
c_code/1_2/nimsets.o \
c_code/1_2/bitsets.o \
c_code/1_2/importer.o \
c_code/1_2/lookups.o \
c_code/1_2/semdata.o \
c_code/1_2/treetab.o \
c_code/1_2/vmdef.o \
c_code/1_2/prettybase.o \
c_code/1_2/stdlib_lexbase.o \
c_code/1_2/sem.o \
c_code/1_2/semfold.o \
c_code/1_2/saturate.o \
c_code/1_2/procfind.o \
c_code/1_2/pragmas.o \
c_code/1_2/semtypinst.o \
c_code/1_2/sigmatch.o \
c_code/1_2/parampatterns.o \
c_code/1_2/pretty.o \
c_code/1_2/docgen.o \
c_code/1_2/docutils_rstast.o \
c_code/1_2/stdlib_json.o \
c_code/1_2/stdlib_unicode.o \
c_code/1_2/docutils_rst.o \
c_code/1_2/docutils_rstgen.o \
c_code/1_2/docutils_highlite.o \
c_code/1_2/stdlib_sequtils.o \
c_code/1_2/stdlib_algorithm.o \
c_code/1_2/sempass2.o \
c_code/1_2/guards.o \
c_code/1_2/stdlib_xmltree.o \
c_code/1_2/stdlib_macros.o \
c_code/1_2/stdlib_cgi.o \
c_code/1_2/stdlib_cookies.o \
c_code/1_2/typesrenderer.o \
c_code/1_2/transf.o \
c_code/1_2/cgmeth.o \
c_code/1_2/lambdalifting.o \
c_code/1_2/lowerings.o \
c_code/1_2/vm.o \
c_code/1_2/vmgen.o \
c_code/1_2/vmdeps.o \
c_code/1_2/evaltempl.o \
c_code/1_2/aliases.o \
c_code/1_2/patterns.o \
c_code/1_2/semmacrosanity.o \
c_code/1_2/semparallel.o \
c_code/1_2/cgen.o \
c_code/1_2/ccgutils.o \
c_code/1_2/cgendata.o \
c_code/1_2/ccgmerge.o \
c_code/1_2/jsgen.o \
c_code/1_2/passaux.o \
c_code/1_2/depends.o \
c_code/1_2/docgen2.o \
c_code/1_2/service.o \
c_code/1_2/modules.o $LINK_FLAGS"
    $LINKER -o $binDir/nim  \
c_code/1_2/nim.o \
c_code/1_2/stdlib_system.o \
c_code/1_2/testability.o \
c_code/1_2/commands.o \
c_code/1_2/stdlib_os.o \
c_code/1_2/stdlib_strutils.o \
c_code/1_2/stdlib_parseutils.o \
c_code/1_2/stdlib_times.o \
c_code/1_2/stdlib_winlean.o \
c_code/1_2/msgs.o \
c_code/1_2/options.o \
c_code/1_2/lists.o \
c_code/1_2/stdlib_strtabs.o \
c_code/1_2/stdlib_hashes.o \
c_code/1_2/stdlib_osproc.o \
c_code/1_2/stdlib_streams.o \
c_code/1_2/stdlib_cpuinfo.o \
c_code/1_2/stdlib_sets.o \
c_code/1_2/stdlib_math.o \
c_code/1_2/stdlib_tables.o \
c_code/1_2/ropes.o \
c_code/1_2/platform.o \
c_code/1_2/crc.o \
c_code/1_2/stdlib_sockets.o \
c_code/1_2/stdlib_unsigned.o \
c_code/1_2/nversion.o \
c_code/1_2/condsyms.o \
c_code/1_2/idents.o \
c_code/1_2/extccomp.o \
c_code/1_2/wordrecg.o \
c_code/1_2/nimblecmd.o \
c_code/1_2/stdlib_parseopt.o \
c_code/1_2/lexer.o \
c_code/1_2/nimlexbase.o \
c_code/1_2/llstream.o \
c_code/1_2/nimconf.o \
c_code/1_2/main.o \
c_code/1_2/ast.o \
c_code/1_2/stdlib_intsets.o \
c_code/1_2/idgen.o \
c_code/1_2/astalgo.o \
c_code/1_2/rodutils.o \
c_code/1_2/syntaxes.o \
c_code/1_2/parser.o \
c_code/1_2/pbraces.o \
c_code/1_2/filters.o \
c_code/1_2/renderer.o \
c_code/1_2/filter_tmpl.o \
c_code/1_2/rodread.o \
c_code/1_2/types.o \
c_code/1_2/trees.o \
c_code/1_2/stdlib_memfiles.o \
c_code/1_2/rodwrite.o \
c_code/1_2/passes.o \
c_code/1_2/magicsys.o \
c_code/1_2/nimsets.o \
c_code/1_2/bitsets.o \
c_code/1_2/importer.o \
c_code/1_2/lookups.o \
c_code/1_2/semdata.o \
c_code/1_2/treetab.o \
c_code/1_2/vmdef.o \
c_code/1_2/prettybase.o \
c_code/1_2/stdlib_lexbase.o \
c_code/1_2/sem.o \
c_code/1_2/semfold.o \
c_code/1_2/saturate.o \
c_code/1_2/procfind.o \
c_code/1_2/pragmas.o \
c_code/1_2/semtypinst.o \
c_code/1_2/sigmatch.o \
c_code/1_2/parampatterns.o \
c_code/1_2/pretty.o \
c_code/1_2/docgen.o \
c_code/1_2/docutils_rstast.o \
c_code/1_2/stdlib_json.o \
c_code/1_2/stdlib_unicode.o \
c_code/1_2/docutils_rst.o \
c_code/1_2/docutils_rstgen.o \
c_code/1_2/docutils_highlite.o \
c_code/1_2/stdlib_sequtils.o \
c_code/1_2/stdlib_algorithm.o \
c_code/1_2/sempass2.o \
c_code/1_2/guards.o \
c_code/1_2/stdlib_xmltree.o \
c_code/1_2/stdlib_macros.o \
c_code/1_2/stdlib_cgi.o \
c_code/1_2/stdlib_cookies.o \
c_code/1_2/typesrenderer.o \
c_code/1_2/transf.o \
c_code/1_2/cgmeth.o \
c_code/1_2/lambdalifting.o \
c_code/1_2/lowerings.o \
c_code/1_2/vm.o \
c_code/1_2/vmgen.o \
c_code/1_2/vmdeps.o \
c_code/1_2/evaltempl.o \
c_code/1_2/aliases.o \
c_code/1_2/patterns.o \
c_code/1_2/semmacrosanity.o \
c_code/1_2/semparallel.o \
c_code/1_2/cgen.o \
c_code/1_2/ccgutils.o \
c_code/1_2/cgendata.o \
c_code/1_2/ccgmerge.o \
c_code/1_2/jsgen.o \
c_code/1_2/passaux.o \
c_code/1_2/depends.o \
c_code/1_2/docgen2.o \
c_code/1_2/service.o \
c_code/1_2/modules.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
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
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/nim.c -o c_code/2_1/nim.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nim.c -o c_code/2_1/nim.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_system.c -o c_code/2_1/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_system.c -o c_code/2_1/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/testability.c -o c_code/2_1/testability.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/testability.c -o c_code/2_1/testability.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/commands.c -o c_code/2_1/commands.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/commands.c -o c_code/2_1/commands.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_os.c -o c_code/2_1/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_os.c -o c_code/2_1/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.c -o c_code/2_1/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.c -o c_code/2_1/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.c -o c_code/2_1/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.c -o c_code/2_1/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_times.c -o c_code/2_1/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_times.c -o c_code/2_1/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_posix.c -o c_code/2_1/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_posix.c -o c_code/2_1/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/msgs.c -o c_code/2_1/msgs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/msgs.c -o c_code/2_1/msgs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/options.c -o c_code/2_1/options.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/options.c -o c_code/2_1/options.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/lists.c -o c_code/2_1/lists.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/lists.c -o c_code/2_1/lists.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strtabs.c -o c_code/2_1/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strtabs.c -o c_code/2_1/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_hashes.c -o c_code/2_1/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_hashes.c -o c_code/2_1/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_osproc.c -o c_code/2_1/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_osproc.c -o c_code/2_1/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_streams.c -o c_code/2_1/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_streams.c -o c_code/2_1/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cpuinfo.c -o c_code/2_1/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cpuinfo.c -o c_code/2_1/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_linux.c -o c_code/2_1/stdlib_linux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_linux.c -o c_code/2_1/stdlib_linux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sets.c -o c_code/2_1/stdlib_sets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sets.c -o c_code/2_1/stdlib_sets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.c -o c_code/2_1/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.c -o c_code/2_1/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_tables.c -o c_code/2_1/stdlib_tables.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_tables.c -o c_code/2_1/stdlib_tables.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/ropes.c -o c_code/2_1/ropes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/ropes.c -o c_code/2_1/ropes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/platform.c -o c_code/2_1/platform.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/platform.c -o c_code/2_1/platform.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/crc.c -o c_code/2_1/crc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/crc.c -o c_code/2_1/crc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sockets.c -o c_code/2_1/stdlib_sockets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sockets.c -o c_code/2_1/stdlib_sockets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unsigned.c -o c_code/2_1/stdlib_unsigned.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unsigned.c -o c_code/2_1/stdlib_unsigned.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/nversion.c -o c_code/2_1/nversion.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nversion.c -o c_code/2_1/nversion.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/condsyms.c -o c_code/2_1/condsyms.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/condsyms.c -o c_code/2_1/condsyms.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/idents.c -o c_code/2_1/idents.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/idents.c -o c_code/2_1/idents.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/extccomp.c -o c_code/2_1/extccomp.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/extccomp.c -o c_code/2_1/extccomp.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/wordrecg.c -o c_code/2_1/wordrecg.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/wordrecg.c -o c_code/2_1/wordrecg.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimblecmd.c -o c_code/2_1/nimblecmd.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimblecmd.c -o c_code/2_1/nimblecmd.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.c -o c_code/2_1/stdlib_parseopt.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.c -o c_code/2_1/stdlib_parseopt.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/lexer.c -o c_code/2_1/lexer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/lexer.c -o c_code/2_1/lexer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimlexbase.c -o c_code/2_1/nimlexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimlexbase.c -o c_code/2_1/nimlexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/llstream.c -o c_code/2_1/llstream.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/llstream.c -o c_code/2_1/llstream.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimconf.c -o c_code/2_1/nimconf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimconf.c -o c_code/2_1/nimconf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/main.c -o c_code/2_1/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/main.c -o c_code/2_1/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/ast.c -o c_code/2_1/ast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/ast.c -o c_code/2_1/ast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_intsets.c -o c_code/2_1/stdlib_intsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_intsets.c -o c_code/2_1/stdlib_intsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/idgen.c -o c_code/2_1/idgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/idgen.c -o c_code/2_1/idgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/astalgo.c -o c_code/2_1/astalgo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/astalgo.c -o c_code/2_1/astalgo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/rodutils.c -o c_code/2_1/rodutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/rodutils.c -o c_code/2_1/rodutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/syntaxes.c -o c_code/2_1/syntaxes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/syntaxes.c -o c_code/2_1/syntaxes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/parser.c -o c_code/2_1/parser.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/parser.c -o c_code/2_1/parser.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/pbraces.c -o c_code/2_1/pbraces.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pbraces.c -o c_code/2_1/pbraces.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/filters.c -o c_code/2_1/filters.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/filters.c -o c_code/2_1/filters.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/renderer.c -o c_code/2_1/renderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/renderer.c -o c_code/2_1/renderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/filter_tmpl.c -o c_code/2_1/filter_tmpl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/filter_tmpl.c -o c_code/2_1/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/rodread.c -o c_code/2_1/rodread.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/rodread.c -o c_code/2_1/rodread.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/types.c -o c_code/2_1/types.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/types.c -o c_code/2_1/types.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/trees.c -o c_code/2_1/trees.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/trees.c -o c_code/2_1/trees.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_memfiles.c -o c_code/2_1/stdlib_memfiles.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_memfiles.c -o c_code/2_1/stdlib_memfiles.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/rodwrite.c -o c_code/2_1/rodwrite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/rodwrite.c -o c_code/2_1/rodwrite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/passes.c -o c_code/2_1/passes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/passes.c -o c_code/2_1/passes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/magicsys.c -o c_code/2_1/magicsys.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/magicsys.c -o c_code/2_1/magicsys.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimsets.c -o c_code/2_1/nimsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimsets.c -o c_code/2_1/nimsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/bitsets.c -o c_code/2_1/bitsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/bitsets.c -o c_code/2_1/bitsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/importer.c -o c_code/2_1/importer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/importer.c -o c_code/2_1/importer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/lookups.c -o c_code/2_1/lookups.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/lookups.c -o c_code/2_1/lookups.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/semdata.c -o c_code/2_1/semdata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/semdata.c -o c_code/2_1/semdata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/treetab.c -o c_code/2_1/treetab.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/treetab.c -o c_code/2_1/treetab.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/vmdef.c -o c_code/2_1/vmdef.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/vmdef.c -o c_code/2_1/vmdef.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/prettybase.c -o c_code/2_1/prettybase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/prettybase.c -o c_code/2_1/prettybase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.c -o c_code/2_1/stdlib_lexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.c -o c_code/2_1/stdlib_lexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/sem.c -o c_code/2_1/sem.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/sem.c -o c_code/2_1/sem.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/semfold.c -o c_code/2_1/semfold.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/semfold.c -o c_code/2_1/semfold.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/saturate.c -o c_code/2_1/saturate.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/saturate.c -o c_code/2_1/saturate.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/procfind.c -o c_code/2_1/procfind.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/procfind.c -o c_code/2_1/procfind.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/pragmas.c -o c_code/2_1/pragmas.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pragmas.c -o c_code/2_1/pragmas.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/semtypinst.c -o c_code/2_1/semtypinst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/semtypinst.c -o c_code/2_1/semtypinst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/sigmatch.c -o c_code/2_1/sigmatch.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/sigmatch.c -o c_code/2_1/sigmatch.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/parampatterns.c -o c_code/2_1/parampatterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/parampatterns.c -o c_code/2_1/parampatterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/pretty.c -o c_code/2_1/pretty.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pretty.c -o c_code/2_1/pretty.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/docgen.c -o c_code/2_1/docgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docgen.c -o c_code/2_1/docgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rstast.c -o c_code/2_1/docutils_rstast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rstast.c -o c_code/2_1/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_json.c -o c_code/2_1/stdlib_json.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_json.c -o c_code/2_1/stdlib_json.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.c -o c_code/2_1/stdlib_unicode.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.c -o c_code/2_1/stdlib_unicode.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rst.c -o c_code/2_1/docutils_rst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rst.c -o c_code/2_1/docutils_rst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rstgen.c -o c_code/2_1/docutils_rstgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rstgen.c -o c_code/2_1/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_highlite.c -o c_code/2_1/docutils_highlite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_highlite.c -o c_code/2_1/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sequtils.c -o c_code/2_1/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sequtils.c -o c_code/2_1/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_algorithm.c -o c_code/2_1/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_algorithm.c -o c_code/2_1/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/sempass2.c -o c_code/2_1/sempass2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/sempass2.c -o c_code/2_1/sempass2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/guards.c -o c_code/2_1/guards.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/guards.c -o c_code/2_1/guards.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_xmltree.c -o c_code/2_1/stdlib_xmltree.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_xmltree.c -o c_code/2_1/stdlib_xmltree.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_macros.c -o c_code/2_1/stdlib_macros.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_macros.c -o c_code/2_1/stdlib_macros.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cgi.c -o c_code/2_1/stdlib_cgi.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cgi.c -o c_code/2_1/stdlib_cgi.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cookies.c -o c_code/2_1/stdlib_cookies.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cookies.c -o c_code/2_1/stdlib_cookies.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/typesrenderer.c -o c_code/2_1/typesrenderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/typesrenderer.c -o c_code/2_1/typesrenderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/transf.c -o c_code/2_1/transf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/transf.c -o c_code/2_1/transf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/cgmeth.c -o c_code/2_1/cgmeth.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/cgmeth.c -o c_code/2_1/cgmeth.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/lambdalifting.c -o c_code/2_1/lambdalifting.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/lambdalifting.c -o c_code/2_1/lambdalifting.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/lowerings.c -o c_code/2_1/lowerings.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/lowerings.c -o c_code/2_1/lowerings.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/vm.c -o c_code/2_1/vm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/vm.c -o c_code/2_1/vm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/vmgen.c -o c_code/2_1/vmgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/vmgen.c -o c_code/2_1/vmgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/vmdeps.c -o c_code/2_1/vmdeps.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/vmdeps.c -o c_code/2_1/vmdeps.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/evaltempl.c -o c_code/2_1/evaltempl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/evaltempl.c -o c_code/2_1/evaltempl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/aliases.c -o c_code/2_1/aliases.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/aliases.c -o c_code/2_1/aliases.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/patterns.c -o c_code/2_1/patterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/patterns.c -o c_code/2_1/patterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/semmacrosanity.c -o c_code/2_1/semmacrosanity.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/semmacrosanity.c -o c_code/2_1/semmacrosanity.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/semparallel.c -o c_code/2_1/semparallel.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/semparallel.c -o c_code/2_1/semparallel.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/cgen.c -o c_code/2_1/cgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/cgen.c -o c_code/2_1/cgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/ccgutils.c -o c_code/2_1/ccgutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/ccgutils.c -o c_code/2_1/ccgutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/cgendata.c -o c_code/2_1/cgendata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/cgendata.c -o c_code/2_1/cgendata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/ccgmerge.c -o c_code/2_1/ccgmerge.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/ccgmerge.c -o c_code/2_1/ccgmerge.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/jsgen.c -o c_code/2_1/jsgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/jsgen.c -o c_code/2_1/jsgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/passaux.c -o c_code/2_1/passaux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/passaux.c -o c_code/2_1/passaux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/depends.c -o c_code/2_1/depends.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/depends.c -o c_code/2_1/depends.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/docgen2.c -o c_code/2_1/docgen2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docgen2.c -o c_code/2_1/docgen2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/service.c -o c_code/2_1/service.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/service.c -o c_code/2_1/service.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/modules.c -o c_code/2_1/modules.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/modules.c -o c_code/2_1/modules.o
    echo "$LINKER -o $binDir/nim  \
c_code/2_1/nim.o \
c_code/2_1/stdlib_system.o \
c_code/2_1/testability.o \
c_code/2_1/commands.o \
c_code/2_1/stdlib_os.o \
c_code/2_1/stdlib_strutils.o \
c_code/2_1/stdlib_parseutils.o \
c_code/2_1/stdlib_times.o \
c_code/2_1/stdlib_posix.o \
c_code/2_1/msgs.o \
c_code/2_1/options.o \
c_code/2_1/lists.o \
c_code/2_1/stdlib_strtabs.o \
c_code/2_1/stdlib_hashes.o \
c_code/2_1/stdlib_osproc.o \
c_code/2_1/stdlib_streams.o \
c_code/2_1/stdlib_cpuinfo.o \
c_code/2_1/stdlib_linux.o \
c_code/2_1/stdlib_sets.o \
c_code/2_1/stdlib_math.o \
c_code/2_1/stdlib_tables.o \
c_code/2_1/ropes.o \
c_code/2_1/platform.o \
c_code/2_1/crc.o \
c_code/2_1/stdlib_sockets.o \
c_code/2_1/stdlib_unsigned.o \
c_code/2_1/nversion.o \
c_code/2_1/condsyms.o \
c_code/2_1/idents.o \
c_code/2_1/extccomp.o \
c_code/2_1/wordrecg.o \
c_code/2_1/nimblecmd.o \
c_code/2_1/stdlib_parseopt.o \
c_code/2_1/lexer.o \
c_code/2_1/nimlexbase.o \
c_code/2_1/llstream.o \
c_code/2_1/nimconf.o \
c_code/2_1/main.o \
c_code/2_1/ast.o \
c_code/2_1/stdlib_intsets.o \
c_code/2_1/idgen.o \
c_code/2_1/astalgo.o \
c_code/2_1/rodutils.o \
c_code/2_1/syntaxes.o \
c_code/2_1/parser.o \
c_code/2_1/pbraces.o \
c_code/2_1/filters.o \
c_code/2_1/renderer.o \
c_code/2_1/filter_tmpl.o \
c_code/2_1/rodread.o \
c_code/2_1/types.o \
c_code/2_1/trees.o \
c_code/2_1/stdlib_memfiles.o \
c_code/2_1/rodwrite.o \
c_code/2_1/passes.o \
c_code/2_1/magicsys.o \
c_code/2_1/nimsets.o \
c_code/2_1/bitsets.o \
c_code/2_1/importer.o \
c_code/2_1/lookups.o \
c_code/2_1/semdata.o \
c_code/2_1/treetab.o \
c_code/2_1/vmdef.o \
c_code/2_1/prettybase.o \
c_code/2_1/stdlib_lexbase.o \
c_code/2_1/sem.o \
c_code/2_1/semfold.o \
c_code/2_1/saturate.o \
c_code/2_1/procfind.o \
c_code/2_1/pragmas.o \
c_code/2_1/semtypinst.o \
c_code/2_1/sigmatch.o \
c_code/2_1/parampatterns.o \
c_code/2_1/pretty.o \
c_code/2_1/docgen.o \
c_code/2_1/docutils_rstast.o \
c_code/2_1/stdlib_json.o \
c_code/2_1/stdlib_unicode.o \
c_code/2_1/docutils_rst.o \
c_code/2_1/docutils_rstgen.o \
c_code/2_1/docutils_highlite.o \
c_code/2_1/stdlib_sequtils.o \
c_code/2_1/stdlib_algorithm.o \
c_code/2_1/sempass2.o \
c_code/2_1/guards.o \
c_code/2_1/stdlib_xmltree.o \
c_code/2_1/stdlib_macros.o \
c_code/2_1/stdlib_cgi.o \
c_code/2_1/stdlib_cookies.o \
c_code/2_1/typesrenderer.o \
c_code/2_1/transf.o \
c_code/2_1/cgmeth.o \
c_code/2_1/lambdalifting.o \
c_code/2_1/lowerings.o \
c_code/2_1/vm.o \
c_code/2_1/vmgen.o \
c_code/2_1/vmdeps.o \
c_code/2_1/evaltempl.o \
c_code/2_1/aliases.o \
c_code/2_1/patterns.o \
c_code/2_1/semmacrosanity.o \
c_code/2_1/semparallel.o \
c_code/2_1/cgen.o \
c_code/2_1/ccgutils.o \
c_code/2_1/cgendata.o \
c_code/2_1/ccgmerge.o \
c_code/2_1/jsgen.o \
c_code/2_1/passaux.o \
c_code/2_1/depends.o \
c_code/2_1/docgen2.o \
c_code/2_1/service.o \
c_code/2_1/modules.o $LINK_FLAGS"
    $LINKER -o $binDir/nim  \
c_code/2_1/nim.o \
c_code/2_1/stdlib_system.o \
c_code/2_1/testability.o \
c_code/2_1/commands.o \
c_code/2_1/stdlib_os.o \
c_code/2_1/stdlib_strutils.o \
c_code/2_1/stdlib_parseutils.o \
c_code/2_1/stdlib_times.o \
c_code/2_1/stdlib_posix.o \
c_code/2_1/msgs.o \
c_code/2_1/options.o \
c_code/2_1/lists.o \
c_code/2_1/stdlib_strtabs.o \
c_code/2_1/stdlib_hashes.o \
c_code/2_1/stdlib_osproc.o \
c_code/2_1/stdlib_streams.o \
c_code/2_1/stdlib_cpuinfo.o \
c_code/2_1/stdlib_linux.o \
c_code/2_1/stdlib_sets.o \
c_code/2_1/stdlib_math.o \
c_code/2_1/stdlib_tables.o \
c_code/2_1/ropes.o \
c_code/2_1/platform.o \
c_code/2_1/crc.o \
c_code/2_1/stdlib_sockets.o \
c_code/2_1/stdlib_unsigned.o \
c_code/2_1/nversion.o \
c_code/2_1/condsyms.o \
c_code/2_1/idents.o \
c_code/2_1/extccomp.o \
c_code/2_1/wordrecg.o \
c_code/2_1/nimblecmd.o \
c_code/2_1/stdlib_parseopt.o \
c_code/2_1/lexer.o \
c_code/2_1/nimlexbase.o \
c_code/2_1/llstream.o \
c_code/2_1/nimconf.o \
c_code/2_1/main.o \
c_code/2_1/ast.o \
c_code/2_1/stdlib_intsets.o \
c_code/2_1/idgen.o \
c_code/2_1/astalgo.o \
c_code/2_1/rodutils.o \
c_code/2_1/syntaxes.o \
c_code/2_1/parser.o \
c_code/2_1/pbraces.o \
c_code/2_1/filters.o \
c_code/2_1/renderer.o \
c_code/2_1/filter_tmpl.o \
c_code/2_1/rodread.o \
c_code/2_1/types.o \
c_code/2_1/trees.o \
c_code/2_1/stdlib_memfiles.o \
c_code/2_1/rodwrite.o \
c_code/2_1/passes.o \
c_code/2_1/magicsys.o \
c_code/2_1/nimsets.o \
c_code/2_1/bitsets.o \
c_code/2_1/importer.o \
c_code/2_1/lookups.o \
c_code/2_1/semdata.o \
c_code/2_1/treetab.o \
c_code/2_1/vmdef.o \
c_code/2_1/prettybase.o \
c_code/2_1/stdlib_lexbase.o \
c_code/2_1/sem.o \
c_code/2_1/semfold.o \
c_code/2_1/saturate.o \
c_code/2_1/procfind.o \
c_code/2_1/pragmas.o \
c_code/2_1/semtypinst.o \
c_code/2_1/sigmatch.o \
c_code/2_1/parampatterns.o \
c_code/2_1/pretty.o \
c_code/2_1/docgen.o \
c_code/2_1/docutils_rstast.o \
c_code/2_1/stdlib_json.o \
c_code/2_1/stdlib_unicode.o \
c_code/2_1/docutils_rst.o \
c_code/2_1/docutils_rstgen.o \
c_code/2_1/docutils_highlite.o \
c_code/2_1/stdlib_sequtils.o \
c_code/2_1/stdlib_algorithm.o \
c_code/2_1/sempass2.o \
c_code/2_1/guards.o \
c_code/2_1/stdlib_xmltree.o \
c_code/2_1/stdlib_macros.o \
c_code/2_1/stdlib_cgi.o \
c_code/2_1/stdlib_cookies.o \
c_code/2_1/typesrenderer.o \
c_code/2_1/transf.o \
c_code/2_1/cgmeth.o \
c_code/2_1/lambdalifting.o \
c_code/2_1/lowerings.o \
c_code/2_1/vm.o \
c_code/2_1/vmgen.o \
c_code/2_1/vmdeps.o \
c_code/2_1/evaltempl.o \
c_code/2_1/aliases.o \
c_code/2_1/patterns.o \
c_code/2_1/semmacrosanity.o \
c_code/2_1/semparallel.o \
c_code/2_1/cgen.o \
c_code/2_1/ccgutils.o \
c_code/2_1/cgendata.o \
c_code/2_1/ccgmerge.o \
c_code/2_1/jsgen.o \
c_code/2_1/passaux.o \
c_code/2_1/depends.o \
c_code/2_1/docgen2.o \
c_code/2_1/service.o \
c_code/2_1/modules.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/nim.c -o c_code/2_2/nim.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nim.c -o c_code/2_2/nim.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_system.c -o c_code/2_2/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_system.c -o c_code/2_2/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/testability.c -o c_code/2_2/testability.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/testability.c -o c_code/2_2/testability.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/commands.c -o c_code/2_2/commands.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/commands.c -o c_code/2_2/commands.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_os.c -o c_code/2_2/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_os.c -o c_code/2_2/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.c -o c_code/2_2/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.c -o c_code/2_2/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.c -o c_code/2_2/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.c -o c_code/2_2/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_times.c -o c_code/2_2/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_times.c -o c_code/2_2/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_posix.c -o c_code/2_2/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_posix.c -o c_code/2_2/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/msgs.c -o c_code/2_2/msgs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/msgs.c -o c_code/2_2/msgs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/options.c -o c_code/2_2/options.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/options.c -o c_code/2_2/options.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/lists.c -o c_code/2_2/lists.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/lists.c -o c_code/2_2/lists.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strtabs.c -o c_code/2_2/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strtabs.c -o c_code/2_2/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_hashes.c -o c_code/2_2/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_hashes.c -o c_code/2_2/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_osproc.c -o c_code/2_2/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_osproc.c -o c_code/2_2/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_streams.c -o c_code/2_2/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_streams.c -o c_code/2_2/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cpuinfo.c -o c_code/2_2/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cpuinfo.c -o c_code/2_2/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_linux.c -o c_code/2_2/stdlib_linux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_linux.c -o c_code/2_2/stdlib_linux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sets.c -o c_code/2_2/stdlib_sets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sets.c -o c_code/2_2/stdlib_sets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.c -o c_code/2_2/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.c -o c_code/2_2/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_tables.c -o c_code/2_2/stdlib_tables.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_tables.c -o c_code/2_2/stdlib_tables.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/ropes.c -o c_code/2_2/ropes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/ropes.c -o c_code/2_2/ropes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/platform.c -o c_code/2_2/platform.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/platform.c -o c_code/2_2/platform.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/crc.c -o c_code/2_2/crc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/crc.c -o c_code/2_2/crc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sockets.c -o c_code/2_2/stdlib_sockets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sockets.c -o c_code/2_2/stdlib_sockets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unsigned.c -o c_code/2_2/stdlib_unsigned.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unsigned.c -o c_code/2_2/stdlib_unsigned.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/nversion.c -o c_code/2_2/nversion.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nversion.c -o c_code/2_2/nversion.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/condsyms.c -o c_code/2_2/condsyms.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/condsyms.c -o c_code/2_2/condsyms.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/idents.c -o c_code/2_2/idents.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/idents.c -o c_code/2_2/idents.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/extccomp.c -o c_code/2_2/extccomp.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/extccomp.c -o c_code/2_2/extccomp.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/wordrecg.c -o c_code/2_2/wordrecg.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/wordrecg.c -o c_code/2_2/wordrecg.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimblecmd.c -o c_code/2_2/nimblecmd.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimblecmd.c -o c_code/2_2/nimblecmd.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.c -o c_code/2_2/stdlib_parseopt.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.c -o c_code/2_2/stdlib_parseopt.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/lexer.c -o c_code/2_2/lexer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/lexer.c -o c_code/2_2/lexer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimlexbase.c -o c_code/2_2/nimlexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimlexbase.c -o c_code/2_2/nimlexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/llstream.c -o c_code/2_2/llstream.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/llstream.c -o c_code/2_2/llstream.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimconf.c -o c_code/2_2/nimconf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimconf.c -o c_code/2_2/nimconf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/main.c -o c_code/2_2/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/main.c -o c_code/2_2/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/ast.c -o c_code/2_2/ast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/ast.c -o c_code/2_2/ast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_intsets.c -o c_code/2_2/stdlib_intsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_intsets.c -o c_code/2_2/stdlib_intsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/idgen.c -o c_code/2_2/idgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/idgen.c -o c_code/2_2/idgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/astalgo.c -o c_code/2_2/astalgo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/astalgo.c -o c_code/2_2/astalgo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/rodutils.c -o c_code/2_2/rodutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/rodutils.c -o c_code/2_2/rodutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/syntaxes.c -o c_code/2_2/syntaxes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/syntaxes.c -o c_code/2_2/syntaxes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/parser.c -o c_code/2_2/parser.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/parser.c -o c_code/2_2/parser.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/pbraces.c -o c_code/2_2/pbraces.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/pbraces.c -o c_code/2_2/pbraces.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/filters.c -o c_code/2_2/filters.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/filters.c -o c_code/2_2/filters.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/renderer.c -o c_code/2_2/renderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/renderer.c -o c_code/2_2/renderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/filter_tmpl.c -o c_code/2_2/filter_tmpl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/filter_tmpl.c -o c_code/2_2/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/rodread.c -o c_code/2_2/rodread.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/rodread.c -o c_code/2_2/rodread.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/types.c -o c_code/2_2/types.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/types.c -o c_code/2_2/types.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/trees.c -o c_code/2_2/trees.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/trees.c -o c_code/2_2/trees.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_memfiles.c -o c_code/2_2/stdlib_memfiles.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_memfiles.c -o c_code/2_2/stdlib_memfiles.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/rodwrite.c -o c_code/2_2/rodwrite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/rodwrite.c -o c_code/2_2/rodwrite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/passes.c -o c_code/2_2/passes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/passes.c -o c_code/2_2/passes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/magicsys.c -o c_code/2_2/magicsys.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/magicsys.c -o c_code/2_2/magicsys.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimsets.c -o c_code/2_2/nimsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimsets.c -o c_code/2_2/nimsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/bitsets.c -o c_code/2_2/bitsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/bitsets.c -o c_code/2_2/bitsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/importer.c -o c_code/2_2/importer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/importer.c -o c_code/2_2/importer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/lookups.c -o c_code/2_2/lookups.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/lookups.c -o c_code/2_2/lookups.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/semdata.c -o c_code/2_2/semdata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/semdata.c -o c_code/2_2/semdata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/treetab.c -o c_code/2_2/treetab.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/treetab.c -o c_code/2_2/treetab.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/vmdef.c -o c_code/2_2/vmdef.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/vmdef.c -o c_code/2_2/vmdef.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/prettybase.c -o c_code/2_2/prettybase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/prettybase.c -o c_code/2_2/prettybase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.c -o c_code/2_2/stdlib_lexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.c -o c_code/2_2/stdlib_lexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/sem.c -o c_code/2_2/sem.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/sem.c -o c_code/2_2/sem.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/semfold.c -o c_code/2_2/semfold.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/semfold.c -o c_code/2_2/semfold.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/saturate.c -o c_code/2_2/saturate.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/saturate.c -o c_code/2_2/saturate.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/procfind.c -o c_code/2_2/procfind.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/procfind.c -o c_code/2_2/procfind.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/pragmas.c -o c_code/2_2/pragmas.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/pragmas.c -o c_code/2_2/pragmas.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/semtypinst.c -o c_code/2_2/semtypinst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/semtypinst.c -o c_code/2_2/semtypinst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/sigmatch.c -o c_code/2_2/sigmatch.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/sigmatch.c -o c_code/2_2/sigmatch.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/parampatterns.c -o c_code/2_2/parampatterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/parampatterns.c -o c_code/2_2/parampatterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/pretty.c -o c_code/2_2/pretty.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/pretty.c -o c_code/2_2/pretty.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/docgen.c -o c_code/2_2/docgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docgen.c -o c_code/2_2/docgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rstast.c -o c_code/2_2/docutils_rstast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rstast.c -o c_code/2_2/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_json.c -o c_code/2_2/stdlib_json.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_json.c -o c_code/2_2/stdlib_json.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.c -o c_code/2_2/stdlib_unicode.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.c -o c_code/2_2/stdlib_unicode.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rst.c -o c_code/2_2/docutils_rst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rst.c -o c_code/2_2/docutils_rst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rstgen.c -o c_code/2_2/docutils_rstgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rstgen.c -o c_code/2_2/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_highlite.c -o c_code/2_2/docutils_highlite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_highlite.c -o c_code/2_2/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sequtils.c -o c_code/2_2/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sequtils.c -o c_code/2_2/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_algorithm.c -o c_code/2_2/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_algorithm.c -o c_code/2_2/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/sempass2.c -o c_code/2_2/sempass2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/sempass2.c -o c_code/2_2/sempass2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/guards.c -o c_code/2_2/guards.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/guards.c -o c_code/2_2/guards.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_xmltree.c -o c_code/2_2/stdlib_xmltree.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_xmltree.c -o c_code/2_2/stdlib_xmltree.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_macros.c -o c_code/2_2/stdlib_macros.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_macros.c -o c_code/2_2/stdlib_macros.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cgi.c -o c_code/2_2/stdlib_cgi.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cgi.c -o c_code/2_2/stdlib_cgi.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cookies.c -o c_code/2_2/stdlib_cookies.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cookies.c -o c_code/2_2/stdlib_cookies.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/typesrenderer.c -o c_code/2_2/typesrenderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/typesrenderer.c -o c_code/2_2/typesrenderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/transf.c -o c_code/2_2/transf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/transf.c -o c_code/2_2/transf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/cgmeth.c -o c_code/2_2/cgmeth.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/cgmeth.c -o c_code/2_2/cgmeth.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/lambdalifting.c -o c_code/2_2/lambdalifting.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/lambdalifting.c -o c_code/2_2/lambdalifting.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/lowerings.c -o c_code/2_2/lowerings.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/lowerings.c -o c_code/2_2/lowerings.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/vm.c -o c_code/2_2/vm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/vm.c -o c_code/2_2/vm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/vmgen.c -o c_code/2_2/vmgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/vmgen.c -o c_code/2_2/vmgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/vmdeps.c -o c_code/2_2/vmdeps.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/vmdeps.c -o c_code/2_2/vmdeps.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/evaltempl.c -o c_code/2_2/evaltempl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/evaltempl.c -o c_code/2_2/evaltempl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/aliases.c -o c_code/2_2/aliases.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/aliases.c -o c_code/2_2/aliases.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/patterns.c -o c_code/2_2/patterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/patterns.c -o c_code/2_2/patterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/semmacrosanity.c -o c_code/2_2/semmacrosanity.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/semmacrosanity.c -o c_code/2_2/semmacrosanity.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/semparallel.c -o c_code/2_2/semparallel.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/semparallel.c -o c_code/2_2/semparallel.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/cgen.c -o c_code/2_2/cgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/cgen.c -o c_code/2_2/cgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/ccgutils.c -o c_code/2_2/ccgutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/ccgutils.c -o c_code/2_2/ccgutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/cgendata.c -o c_code/2_2/cgendata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/cgendata.c -o c_code/2_2/cgendata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/ccgmerge.c -o c_code/2_2/ccgmerge.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/ccgmerge.c -o c_code/2_2/ccgmerge.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/jsgen.c -o c_code/2_2/jsgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/jsgen.c -o c_code/2_2/jsgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/passaux.c -o c_code/2_2/passaux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/passaux.c -o c_code/2_2/passaux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/depends.c -o c_code/2_2/depends.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/depends.c -o c_code/2_2/depends.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/docgen2.c -o c_code/2_2/docgen2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docgen2.c -o c_code/2_2/docgen2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/service.c -o c_code/2_2/service.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/service.c -o c_code/2_2/service.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/modules.c -o c_code/2_2/modules.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/modules.c -o c_code/2_2/modules.o
    echo "$LINKER -o $binDir/nim  \
c_code/2_2/nim.o \
c_code/2_2/stdlib_system.o \
c_code/2_2/testability.o \
c_code/2_2/commands.o \
c_code/2_2/stdlib_os.o \
c_code/2_2/stdlib_strutils.o \
c_code/2_2/stdlib_parseutils.o \
c_code/2_2/stdlib_times.o \
c_code/2_2/stdlib_posix.o \
c_code/2_2/msgs.o \
c_code/2_2/options.o \
c_code/2_2/lists.o \
c_code/2_2/stdlib_strtabs.o \
c_code/2_2/stdlib_hashes.o \
c_code/2_2/stdlib_osproc.o \
c_code/2_2/stdlib_streams.o \
c_code/2_2/stdlib_cpuinfo.o \
c_code/2_2/stdlib_linux.o \
c_code/2_2/stdlib_sets.o \
c_code/2_2/stdlib_math.o \
c_code/2_2/stdlib_tables.o \
c_code/2_2/ropes.o \
c_code/2_2/platform.o \
c_code/2_2/crc.o \
c_code/2_2/stdlib_sockets.o \
c_code/2_2/stdlib_unsigned.o \
c_code/2_2/nversion.o \
c_code/2_2/condsyms.o \
c_code/2_2/idents.o \
c_code/2_2/extccomp.o \
c_code/2_2/wordrecg.o \
c_code/2_2/nimblecmd.o \
c_code/2_2/stdlib_parseopt.o \
c_code/2_2/lexer.o \
c_code/2_2/nimlexbase.o \
c_code/2_2/llstream.o \
c_code/2_2/nimconf.o \
c_code/2_2/main.o \
c_code/2_2/ast.o \
c_code/2_2/stdlib_intsets.o \
c_code/2_2/idgen.o \
c_code/2_2/astalgo.o \
c_code/2_2/rodutils.o \
c_code/2_2/syntaxes.o \
c_code/2_2/parser.o \
c_code/2_2/pbraces.o \
c_code/2_2/filters.o \
c_code/2_2/renderer.o \
c_code/2_2/filter_tmpl.o \
c_code/2_2/rodread.o \
c_code/2_2/types.o \
c_code/2_2/trees.o \
c_code/2_2/stdlib_memfiles.o \
c_code/2_2/rodwrite.o \
c_code/2_2/passes.o \
c_code/2_2/magicsys.o \
c_code/2_2/nimsets.o \
c_code/2_2/bitsets.o \
c_code/2_2/importer.o \
c_code/2_2/lookups.o \
c_code/2_2/semdata.o \
c_code/2_2/treetab.o \
c_code/2_2/vmdef.o \
c_code/2_2/prettybase.o \
c_code/2_2/stdlib_lexbase.o \
c_code/2_2/sem.o \
c_code/2_2/semfold.o \
c_code/2_2/saturate.o \
c_code/2_2/procfind.o \
c_code/2_2/pragmas.o \
c_code/2_2/semtypinst.o \
c_code/2_2/sigmatch.o \
c_code/2_2/parampatterns.o \
c_code/2_2/pretty.o \
c_code/2_2/docgen.o \
c_code/2_2/docutils_rstast.o \
c_code/2_2/stdlib_json.o \
c_code/2_2/stdlib_unicode.o \
c_code/2_2/docutils_rst.o \
c_code/2_2/docutils_rstgen.o \
c_code/2_2/docutils_highlite.o \
c_code/2_2/stdlib_sequtils.o \
c_code/2_2/stdlib_algorithm.o \
c_code/2_2/sempass2.o \
c_code/2_2/guards.o \
c_code/2_2/stdlib_xmltree.o \
c_code/2_2/stdlib_macros.o \
c_code/2_2/stdlib_cgi.o \
c_code/2_2/stdlib_cookies.o \
c_code/2_2/typesrenderer.o \
c_code/2_2/transf.o \
c_code/2_2/cgmeth.o \
c_code/2_2/lambdalifting.o \
c_code/2_2/lowerings.o \
c_code/2_2/vm.o \
c_code/2_2/vmgen.o \
c_code/2_2/vmdeps.o \
c_code/2_2/evaltempl.o \
c_code/2_2/aliases.o \
c_code/2_2/patterns.o \
c_code/2_2/semmacrosanity.o \
c_code/2_2/semparallel.o \
c_code/2_2/cgen.o \
c_code/2_2/ccgutils.o \
c_code/2_2/cgendata.o \
c_code/2_2/ccgmerge.o \
c_code/2_2/jsgen.o \
c_code/2_2/passaux.o \
c_code/2_2/depends.o \
c_code/2_2/docgen2.o \
c_code/2_2/service.o \
c_code/2_2/modules.o $LINK_FLAGS"
    $LINKER -o $binDir/nim  \
c_code/2_2/nim.o \
c_code/2_2/stdlib_system.o \
c_code/2_2/testability.o \
c_code/2_2/commands.o \
c_code/2_2/stdlib_os.o \
c_code/2_2/stdlib_strutils.o \
c_code/2_2/stdlib_parseutils.o \
c_code/2_2/stdlib_times.o \
c_code/2_2/stdlib_posix.o \
c_code/2_2/msgs.o \
c_code/2_2/options.o \
c_code/2_2/lists.o \
c_code/2_2/stdlib_strtabs.o \
c_code/2_2/stdlib_hashes.o \
c_code/2_2/stdlib_osproc.o \
c_code/2_2/stdlib_streams.o \
c_code/2_2/stdlib_cpuinfo.o \
c_code/2_2/stdlib_linux.o \
c_code/2_2/stdlib_sets.o \
c_code/2_2/stdlib_math.o \
c_code/2_2/stdlib_tables.o \
c_code/2_2/ropes.o \
c_code/2_2/platform.o \
c_code/2_2/crc.o \
c_code/2_2/stdlib_sockets.o \
c_code/2_2/stdlib_unsigned.o \
c_code/2_2/nversion.o \
c_code/2_2/condsyms.o \
c_code/2_2/idents.o \
c_code/2_2/extccomp.o \
c_code/2_2/wordrecg.o \
c_code/2_2/nimblecmd.o \
c_code/2_2/stdlib_parseopt.o \
c_code/2_2/lexer.o \
c_code/2_2/nimlexbase.o \
c_code/2_2/llstream.o \
c_code/2_2/nimconf.o \
c_code/2_2/main.o \
c_code/2_2/ast.o \
c_code/2_2/stdlib_intsets.o \
c_code/2_2/idgen.o \
c_code/2_2/astalgo.o \
c_code/2_2/rodutils.o \
c_code/2_2/syntaxes.o \
c_code/2_2/parser.o \
c_code/2_2/pbraces.o \
c_code/2_2/filters.o \
c_code/2_2/renderer.o \
c_code/2_2/filter_tmpl.o \
c_code/2_2/rodread.o \
c_code/2_2/types.o \
c_code/2_2/trees.o \
c_code/2_2/stdlib_memfiles.o \
c_code/2_2/rodwrite.o \
c_code/2_2/passes.o \
c_code/2_2/magicsys.o \
c_code/2_2/nimsets.o \
c_code/2_2/bitsets.o \
c_code/2_2/importer.o \
c_code/2_2/lookups.o \
c_code/2_2/semdata.o \
c_code/2_2/treetab.o \
c_code/2_2/vmdef.o \
c_code/2_2/prettybase.o \
c_code/2_2/stdlib_lexbase.o \
c_code/2_2/sem.o \
c_code/2_2/semfold.o \
c_code/2_2/saturate.o \
c_code/2_2/procfind.o \
c_code/2_2/pragmas.o \
c_code/2_2/semtypinst.o \
c_code/2_2/sigmatch.o \
c_code/2_2/parampatterns.o \
c_code/2_2/pretty.o \
c_code/2_2/docgen.o \
c_code/2_2/docutils_rstast.o \
c_code/2_2/stdlib_json.o \
c_code/2_2/stdlib_unicode.o \
c_code/2_2/docutils_rst.o \
c_code/2_2/docutils_rstgen.o \
c_code/2_2/docutils_highlite.o \
c_code/2_2/stdlib_sequtils.o \
c_code/2_2/stdlib_algorithm.o \
c_code/2_2/sempass2.o \
c_code/2_2/guards.o \
c_code/2_2/stdlib_xmltree.o \
c_code/2_2/stdlib_macros.o \
c_code/2_2/stdlib_cgi.o \
c_code/2_2/stdlib_cookies.o \
c_code/2_2/typesrenderer.o \
c_code/2_2/transf.o \
c_code/2_2/cgmeth.o \
c_code/2_2/lambdalifting.o \
c_code/2_2/lowerings.o \
c_code/2_2/vm.o \
c_code/2_2/vmgen.o \
c_code/2_2/vmdeps.o \
c_code/2_2/evaltempl.o \
c_code/2_2/aliases.o \
c_code/2_2/patterns.o \
c_code/2_2/semmacrosanity.o \
c_code/2_2/semparallel.o \
c_code/2_2/cgen.o \
c_code/2_2/ccgutils.o \
c_code/2_2/cgendata.o \
c_code/2_2/ccgmerge.o \
c_code/2_2/jsgen.o \
c_code/2_2/passaux.o \
c_code/2_2/depends.o \
c_code/2_2/docgen2.o \
c_code/2_2/service.o \
c_code/2_2/modules.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/nim.c -o c_code/2_3/nim.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/nim.c -o c_code/2_3/nim.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_system.c -o c_code/2_3/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_system.c -o c_code/2_3/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/testability.c -o c_code/2_3/testability.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/testability.c -o c_code/2_3/testability.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/commands.c -o c_code/2_3/commands.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/commands.c -o c_code/2_3/commands.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_os.c -o c_code/2_3/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_os.c -o c_code/2_3/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_strutils.c -o c_code/2_3/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_strutils.c -o c_code/2_3/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_parseutils.c -o c_code/2_3/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_parseutils.c -o c_code/2_3/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_times.c -o c_code/2_3/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_times.c -o c_code/2_3/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_posix.c -o c_code/2_3/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_posix.c -o c_code/2_3/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/msgs.c -o c_code/2_3/msgs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/msgs.c -o c_code/2_3/msgs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/options.c -o c_code/2_3/options.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/options.c -o c_code/2_3/options.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/lists.c -o c_code/2_3/lists.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/lists.c -o c_code/2_3/lists.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_strtabs.c -o c_code/2_3/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_strtabs.c -o c_code/2_3/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_hashes.c -o c_code/2_3/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_hashes.c -o c_code/2_3/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_osproc.c -o c_code/2_3/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_osproc.c -o c_code/2_3/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_streams.c -o c_code/2_3/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_streams.c -o c_code/2_3/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_cpuinfo.c -o c_code/2_3/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_cpuinfo.c -o c_code/2_3/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_linux.c -o c_code/2_3/stdlib_linux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_linux.c -o c_code/2_3/stdlib_linux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_sets.c -o c_code/2_3/stdlib_sets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_sets.c -o c_code/2_3/stdlib_sets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_math.c -o c_code/2_3/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_math.c -o c_code/2_3/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_tables.c -o c_code/2_3/stdlib_tables.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_tables.c -o c_code/2_3/stdlib_tables.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/ropes.c -o c_code/2_3/ropes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/ropes.c -o c_code/2_3/ropes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/platform.c -o c_code/2_3/platform.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/platform.c -o c_code/2_3/platform.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/crc.c -o c_code/2_3/crc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/crc.c -o c_code/2_3/crc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_sockets.c -o c_code/2_3/stdlib_sockets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_sockets.c -o c_code/2_3/stdlib_sockets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_unsigned.c -o c_code/2_3/stdlib_unsigned.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_unsigned.c -o c_code/2_3/stdlib_unsigned.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/nversion.c -o c_code/2_3/nversion.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/nversion.c -o c_code/2_3/nversion.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/condsyms.c -o c_code/2_3/condsyms.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/condsyms.c -o c_code/2_3/condsyms.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/idents.c -o c_code/2_3/idents.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/idents.c -o c_code/2_3/idents.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/extccomp.c -o c_code/2_3/extccomp.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/extccomp.c -o c_code/2_3/extccomp.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/wordrecg.c -o c_code/2_3/wordrecg.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/wordrecg.c -o c_code/2_3/wordrecg.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/nimblecmd.c -o c_code/2_3/nimblecmd.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/nimblecmd.c -o c_code/2_3/nimblecmd.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_parseopt.c -o c_code/2_3/stdlib_parseopt.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_parseopt.c -o c_code/2_3/stdlib_parseopt.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/lexer.c -o c_code/2_3/lexer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/lexer.c -o c_code/2_3/lexer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/nimlexbase.c -o c_code/2_3/nimlexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/nimlexbase.c -o c_code/2_3/nimlexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/llstream.c -o c_code/2_3/llstream.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/llstream.c -o c_code/2_3/llstream.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/nimconf.c -o c_code/2_3/nimconf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/nimconf.c -o c_code/2_3/nimconf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/main.c -o c_code/2_3/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/main.c -o c_code/2_3/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/ast.c -o c_code/2_3/ast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/ast.c -o c_code/2_3/ast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_intsets.c -o c_code/2_3/stdlib_intsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_intsets.c -o c_code/2_3/stdlib_intsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/idgen.c -o c_code/2_3/idgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/idgen.c -o c_code/2_3/idgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/astalgo.c -o c_code/2_3/astalgo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/astalgo.c -o c_code/2_3/astalgo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/rodutils.c -o c_code/2_3/rodutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/rodutils.c -o c_code/2_3/rodutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/syntaxes.c -o c_code/2_3/syntaxes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/syntaxes.c -o c_code/2_3/syntaxes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/parser.c -o c_code/2_3/parser.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/parser.c -o c_code/2_3/parser.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/pbraces.c -o c_code/2_3/pbraces.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/pbraces.c -o c_code/2_3/pbraces.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/filters.c -o c_code/2_3/filters.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/filters.c -o c_code/2_3/filters.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/renderer.c -o c_code/2_3/renderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/renderer.c -o c_code/2_3/renderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/filter_tmpl.c -o c_code/2_3/filter_tmpl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/filter_tmpl.c -o c_code/2_3/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/rodread.c -o c_code/2_3/rodread.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/rodread.c -o c_code/2_3/rodread.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/types.c -o c_code/2_3/types.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/types.c -o c_code/2_3/types.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/trees.c -o c_code/2_3/trees.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/trees.c -o c_code/2_3/trees.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_memfiles.c -o c_code/2_3/stdlib_memfiles.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_memfiles.c -o c_code/2_3/stdlib_memfiles.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/rodwrite.c -o c_code/2_3/rodwrite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/rodwrite.c -o c_code/2_3/rodwrite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/passes.c -o c_code/2_3/passes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/passes.c -o c_code/2_3/passes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/magicsys.c -o c_code/2_3/magicsys.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/magicsys.c -o c_code/2_3/magicsys.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/nimsets.c -o c_code/2_3/nimsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/nimsets.c -o c_code/2_3/nimsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/bitsets.c -o c_code/2_3/bitsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/bitsets.c -o c_code/2_3/bitsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/importer.c -o c_code/2_3/importer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/importer.c -o c_code/2_3/importer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/lookups.c -o c_code/2_3/lookups.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/lookups.c -o c_code/2_3/lookups.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/semdata.c -o c_code/2_3/semdata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/semdata.c -o c_code/2_3/semdata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/treetab.c -o c_code/2_3/treetab.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/treetab.c -o c_code/2_3/treetab.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/vmdef.c -o c_code/2_3/vmdef.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/vmdef.c -o c_code/2_3/vmdef.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/prettybase.c -o c_code/2_3/prettybase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/prettybase.c -o c_code/2_3/prettybase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_lexbase.c -o c_code/2_3/stdlib_lexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_lexbase.c -o c_code/2_3/stdlib_lexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/sem.c -o c_code/2_3/sem.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/sem.c -o c_code/2_3/sem.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/semfold.c -o c_code/2_3/semfold.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/semfold.c -o c_code/2_3/semfold.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/saturate.c -o c_code/2_3/saturate.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/saturate.c -o c_code/2_3/saturate.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/procfind.c -o c_code/2_3/procfind.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/procfind.c -o c_code/2_3/procfind.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/pragmas.c -o c_code/2_3/pragmas.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/pragmas.c -o c_code/2_3/pragmas.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/semtypinst.c -o c_code/2_3/semtypinst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/semtypinst.c -o c_code/2_3/semtypinst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/sigmatch.c -o c_code/2_3/sigmatch.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/sigmatch.c -o c_code/2_3/sigmatch.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/parampatterns.c -o c_code/2_3/parampatterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/parampatterns.c -o c_code/2_3/parampatterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/pretty.c -o c_code/2_3/pretty.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/pretty.c -o c_code/2_3/pretty.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/docgen.c -o c_code/2_3/docgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/docgen.c -o c_code/2_3/docgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/docutils_rstast.c -o c_code/2_3/docutils_rstast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/docutils_rstast.c -o c_code/2_3/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_json.c -o c_code/2_3/stdlib_json.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_json.c -o c_code/2_3/stdlib_json.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_unicode.c -o c_code/2_3/stdlib_unicode.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_unicode.c -o c_code/2_3/stdlib_unicode.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/docutils_rst.c -o c_code/2_3/docutils_rst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/docutils_rst.c -o c_code/2_3/docutils_rst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/docutils_rstgen.c -o c_code/2_3/docutils_rstgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/docutils_rstgen.c -o c_code/2_3/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/docutils_highlite.c -o c_code/2_3/docutils_highlite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/docutils_highlite.c -o c_code/2_3/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_sequtils.c -o c_code/2_3/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_sequtils.c -o c_code/2_3/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_algorithm.c -o c_code/2_3/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_algorithm.c -o c_code/2_3/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/sempass2.c -o c_code/2_3/sempass2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/sempass2.c -o c_code/2_3/sempass2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/guards.c -o c_code/2_3/guards.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/guards.c -o c_code/2_3/guards.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_xmltree.c -o c_code/2_3/stdlib_xmltree.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_xmltree.c -o c_code/2_3/stdlib_xmltree.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_macros.c -o c_code/2_3/stdlib_macros.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_macros.c -o c_code/2_3/stdlib_macros.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_cgi.c -o c_code/2_3/stdlib_cgi.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_cgi.c -o c_code/2_3/stdlib_cgi.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_cookies.c -o c_code/2_3/stdlib_cookies.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_cookies.c -o c_code/2_3/stdlib_cookies.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/typesrenderer.c -o c_code/2_3/typesrenderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/typesrenderer.c -o c_code/2_3/typesrenderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/transf.c -o c_code/2_3/transf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/transf.c -o c_code/2_3/transf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/cgmeth.c -o c_code/2_3/cgmeth.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/cgmeth.c -o c_code/2_3/cgmeth.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/lambdalifting.c -o c_code/2_3/lambdalifting.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/lambdalifting.c -o c_code/2_3/lambdalifting.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/lowerings.c -o c_code/2_3/lowerings.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/lowerings.c -o c_code/2_3/lowerings.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/vm.c -o c_code/2_3/vm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/vm.c -o c_code/2_3/vm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/vmgen.c -o c_code/2_3/vmgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/vmgen.c -o c_code/2_3/vmgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/vmdeps.c -o c_code/2_3/vmdeps.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/vmdeps.c -o c_code/2_3/vmdeps.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/evaltempl.c -o c_code/2_3/evaltempl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/evaltempl.c -o c_code/2_3/evaltempl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/aliases.c -o c_code/2_3/aliases.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/aliases.c -o c_code/2_3/aliases.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/patterns.c -o c_code/2_3/patterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/patterns.c -o c_code/2_3/patterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/semmacrosanity.c -o c_code/2_3/semmacrosanity.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/semmacrosanity.c -o c_code/2_3/semmacrosanity.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/semparallel.c -o c_code/2_3/semparallel.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/semparallel.c -o c_code/2_3/semparallel.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/cgen.c -o c_code/2_3/cgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/cgen.c -o c_code/2_3/cgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/ccgutils.c -o c_code/2_3/ccgutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/ccgutils.c -o c_code/2_3/ccgutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/cgendata.c -o c_code/2_3/cgendata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/cgendata.c -o c_code/2_3/cgendata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/ccgmerge.c -o c_code/2_3/ccgmerge.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/ccgmerge.c -o c_code/2_3/ccgmerge.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/jsgen.c -o c_code/2_3/jsgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/jsgen.c -o c_code/2_3/jsgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/passaux.c -o c_code/2_3/passaux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/passaux.c -o c_code/2_3/passaux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/depends.c -o c_code/2_3/depends.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/depends.c -o c_code/2_3/depends.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/docgen2.c -o c_code/2_3/docgen2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/docgen2.c -o c_code/2_3/docgen2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/service.c -o c_code/2_3/service.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/service.c -o c_code/2_3/service.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/modules.c -o c_code/2_3/modules.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/modules.c -o c_code/2_3/modules.o
    echo "$LINKER -o $binDir/nim  \
c_code/2_3/nim.o \
c_code/2_3/stdlib_system.o \
c_code/2_3/testability.o \
c_code/2_3/commands.o \
c_code/2_3/stdlib_os.o \
c_code/2_3/stdlib_strutils.o \
c_code/2_3/stdlib_parseutils.o \
c_code/2_3/stdlib_times.o \
c_code/2_3/stdlib_posix.o \
c_code/2_3/msgs.o \
c_code/2_3/options.o \
c_code/2_3/lists.o \
c_code/2_3/stdlib_strtabs.o \
c_code/2_3/stdlib_hashes.o \
c_code/2_3/stdlib_osproc.o \
c_code/2_3/stdlib_streams.o \
c_code/2_3/stdlib_cpuinfo.o \
c_code/2_3/stdlib_linux.o \
c_code/2_3/stdlib_sets.o \
c_code/2_3/stdlib_math.o \
c_code/2_3/stdlib_tables.o \
c_code/2_3/ropes.o \
c_code/2_3/platform.o \
c_code/2_3/crc.o \
c_code/2_3/stdlib_sockets.o \
c_code/2_3/stdlib_unsigned.o \
c_code/2_3/nversion.o \
c_code/2_3/condsyms.o \
c_code/2_3/idents.o \
c_code/2_3/extccomp.o \
c_code/2_3/wordrecg.o \
c_code/2_3/nimblecmd.o \
c_code/2_3/stdlib_parseopt.o \
c_code/2_3/lexer.o \
c_code/2_3/nimlexbase.o \
c_code/2_3/llstream.o \
c_code/2_3/nimconf.o \
c_code/2_3/main.o \
c_code/2_3/ast.o \
c_code/2_3/stdlib_intsets.o \
c_code/2_3/idgen.o \
c_code/2_3/astalgo.o \
c_code/2_3/rodutils.o \
c_code/2_3/syntaxes.o \
c_code/2_3/parser.o \
c_code/2_3/pbraces.o \
c_code/2_3/filters.o \
c_code/2_3/renderer.o \
c_code/2_3/filter_tmpl.o \
c_code/2_3/rodread.o \
c_code/2_3/types.o \
c_code/2_3/trees.o \
c_code/2_3/stdlib_memfiles.o \
c_code/2_3/rodwrite.o \
c_code/2_3/passes.o \
c_code/2_3/magicsys.o \
c_code/2_3/nimsets.o \
c_code/2_3/bitsets.o \
c_code/2_3/importer.o \
c_code/2_3/lookups.o \
c_code/2_3/semdata.o \
c_code/2_3/treetab.o \
c_code/2_3/vmdef.o \
c_code/2_3/prettybase.o \
c_code/2_3/stdlib_lexbase.o \
c_code/2_3/sem.o \
c_code/2_3/semfold.o \
c_code/2_3/saturate.o \
c_code/2_3/procfind.o \
c_code/2_3/pragmas.o \
c_code/2_3/semtypinst.o \
c_code/2_3/sigmatch.o \
c_code/2_3/parampatterns.o \
c_code/2_3/pretty.o \
c_code/2_3/docgen.o \
c_code/2_3/docutils_rstast.o \
c_code/2_3/stdlib_json.o \
c_code/2_3/stdlib_unicode.o \
c_code/2_3/docutils_rst.o \
c_code/2_3/docutils_rstgen.o \
c_code/2_3/docutils_highlite.o \
c_code/2_3/stdlib_sequtils.o \
c_code/2_3/stdlib_algorithm.o \
c_code/2_3/sempass2.o \
c_code/2_3/guards.o \
c_code/2_3/stdlib_xmltree.o \
c_code/2_3/stdlib_macros.o \
c_code/2_3/stdlib_cgi.o \
c_code/2_3/stdlib_cookies.o \
c_code/2_3/typesrenderer.o \
c_code/2_3/transf.o \
c_code/2_3/cgmeth.o \
c_code/2_3/lambdalifting.o \
c_code/2_3/lowerings.o \
c_code/2_3/vm.o \
c_code/2_3/vmgen.o \
c_code/2_3/vmdeps.o \
c_code/2_3/evaltempl.o \
c_code/2_3/aliases.o \
c_code/2_3/patterns.o \
c_code/2_3/semmacrosanity.o \
c_code/2_3/semparallel.o \
c_code/2_3/cgen.o \
c_code/2_3/ccgutils.o \
c_code/2_3/cgendata.o \
c_code/2_3/ccgmerge.o \
c_code/2_3/jsgen.o \
c_code/2_3/passaux.o \
c_code/2_3/depends.o \
c_code/2_3/docgen2.o \
c_code/2_3/service.o \
c_code/2_3/modules.o $LINK_FLAGS"
    $LINKER -o $binDir/nim  \
c_code/2_3/nim.o \
c_code/2_3/stdlib_system.o \
c_code/2_3/testability.o \
c_code/2_3/commands.o \
c_code/2_3/stdlib_os.o \
c_code/2_3/stdlib_strutils.o \
c_code/2_3/stdlib_parseutils.o \
c_code/2_3/stdlib_times.o \
c_code/2_3/stdlib_posix.o \
c_code/2_3/msgs.o \
c_code/2_3/options.o \
c_code/2_3/lists.o \
c_code/2_3/stdlib_strtabs.o \
c_code/2_3/stdlib_hashes.o \
c_code/2_3/stdlib_osproc.o \
c_code/2_3/stdlib_streams.o \
c_code/2_3/stdlib_cpuinfo.o \
c_code/2_3/stdlib_linux.o \
c_code/2_3/stdlib_sets.o \
c_code/2_3/stdlib_math.o \
c_code/2_3/stdlib_tables.o \
c_code/2_3/ropes.o \
c_code/2_3/platform.o \
c_code/2_3/crc.o \
c_code/2_3/stdlib_sockets.o \
c_code/2_3/stdlib_unsigned.o \
c_code/2_3/nversion.o \
c_code/2_3/condsyms.o \
c_code/2_3/idents.o \
c_code/2_3/extccomp.o \
c_code/2_3/wordrecg.o \
c_code/2_3/nimblecmd.o \
c_code/2_3/stdlib_parseopt.o \
c_code/2_3/lexer.o \
c_code/2_3/nimlexbase.o \
c_code/2_3/llstream.o \
c_code/2_3/nimconf.o \
c_code/2_3/main.o \
c_code/2_3/ast.o \
c_code/2_3/stdlib_intsets.o \
c_code/2_3/idgen.o \
c_code/2_3/astalgo.o \
c_code/2_3/rodutils.o \
c_code/2_3/syntaxes.o \
c_code/2_3/parser.o \
c_code/2_3/pbraces.o \
c_code/2_3/filters.o \
c_code/2_3/renderer.o \
c_code/2_3/filter_tmpl.o \
c_code/2_3/rodread.o \
c_code/2_3/types.o \
c_code/2_3/trees.o \
c_code/2_3/stdlib_memfiles.o \
c_code/2_3/rodwrite.o \
c_code/2_3/passes.o \
c_code/2_3/magicsys.o \
c_code/2_3/nimsets.o \
c_code/2_3/bitsets.o \
c_code/2_3/importer.o \
c_code/2_3/lookups.o \
c_code/2_3/semdata.o \
c_code/2_3/treetab.o \
c_code/2_3/vmdef.o \
c_code/2_3/prettybase.o \
c_code/2_3/stdlib_lexbase.o \
c_code/2_3/sem.o \
c_code/2_3/semfold.o \
c_code/2_3/saturate.o \
c_code/2_3/procfind.o \
c_code/2_3/pragmas.o \
c_code/2_3/semtypinst.o \
c_code/2_3/sigmatch.o \
c_code/2_3/parampatterns.o \
c_code/2_3/pretty.o \
c_code/2_3/docgen.o \
c_code/2_3/docutils_rstast.o \
c_code/2_3/stdlib_json.o \
c_code/2_3/stdlib_unicode.o \
c_code/2_3/docutils_rst.o \
c_code/2_3/docutils_rstgen.o \
c_code/2_3/docutils_highlite.o \
c_code/2_3/stdlib_sequtils.o \
c_code/2_3/stdlib_algorithm.o \
c_code/2_3/sempass2.o \
c_code/2_3/guards.o \
c_code/2_3/stdlib_xmltree.o \
c_code/2_3/stdlib_macros.o \
c_code/2_3/stdlib_cgi.o \
c_code/2_3/stdlib_cookies.o \
c_code/2_3/typesrenderer.o \
c_code/2_3/transf.o \
c_code/2_3/cgmeth.o \
c_code/2_3/lambdalifting.o \
c_code/2_3/lowerings.o \
c_code/2_3/vm.o \
c_code/2_3/vmgen.o \
c_code/2_3/vmdeps.o \
c_code/2_3/evaltempl.o \
c_code/2_3/aliases.o \
c_code/2_3/patterns.o \
c_code/2_3/semmacrosanity.o \
c_code/2_3/semparallel.o \
c_code/2_3/cgen.o \
c_code/2_3/ccgutils.o \
c_code/2_3/cgendata.o \
c_code/2_3/ccgmerge.o \
c_code/2_3/jsgen.o \
c_code/2_3/passaux.o \
c_code/2_3/depends.o \
c_code/2_3/docgen2.o \
c_code/2_3/service.o \
c_code/2_3/modules.o $LINK_FLAGS
    ;;
  arm)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/nim.c -o c_code/2_4/nim.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/nim.c -o c_code/2_4/nim.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_system.c -o c_code/2_4/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_system.c -o c_code/2_4/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/testability.c -o c_code/2_4/testability.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/testability.c -o c_code/2_4/testability.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/commands.c -o c_code/2_4/commands.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/commands.c -o c_code/2_4/commands.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_os.c -o c_code/2_4/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_os.c -o c_code/2_4/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_strutils.c -o c_code/2_4/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_strutils.c -o c_code/2_4/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_parseutils.c -o c_code/2_4/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_parseutils.c -o c_code/2_4/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_times.c -o c_code/2_4/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_times.c -o c_code/2_4/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_posix.c -o c_code/2_4/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_posix.c -o c_code/2_4/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/msgs.c -o c_code/2_4/msgs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/msgs.c -o c_code/2_4/msgs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/options.c -o c_code/2_4/options.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/options.c -o c_code/2_4/options.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/lists.c -o c_code/2_4/lists.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/lists.c -o c_code/2_4/lists.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_strtabs.c -o c_code/2_4/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_strtabs.c -o c_code/2_4/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_hashes.c -o c_code/2_4/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_hashes.c -o c_code/2_4/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_osproc.c -o c_code/2_4/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_osproc.c -o c_code/2_4/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_streams.c -o c_code/2_4/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_streams.c -o c_code/2_4/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_cpuinfo.c -o c_code/2_4/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_cpuinfo.c -o c_code/2_4/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_linux.c -o c_code/2_4/stdlib_linux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_linux.c -o c_code/2_4/stdlib_linux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_sets.c -o c_code/2_4/stdlib_sets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_sets.c -o c_code/2_4/stdlib_sets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_math.c -o c_code/2_4/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_math.c -o c_code/2_4/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_tables.c -o c_code/2_4/stdlib_tables.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_tables.c -o c_code/2_4/stdlib_tables.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/ropes.c -o c_code/2_4/ropes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/ropes.c -o c_code/2_4/ropes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/platform.c -o c_code/2_4/platform.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/platform.c -o c_code/2_4/platform.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/crc.c -o c_code/2_4/crc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/crc.c -o c_code/2_4/crc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_sockets.c -o c_code/2_4/stdlib_sockets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_sockets.c -o c_code/2_4/stdlib_sockets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_unsigned.c -o c_code/2_4/stdlib_unsigned.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_unsigned.c -o c_code/2_4/stdlib_unsigned.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/nversion.c -o c_code/2_4/nversion.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/nversion.c -o c_code/2_4/nversion.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/condsyms.c -o c_code/2_4/condsyms.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/condsyms.c -o c_code/2_4/condsyms.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/idents.c -o c_code/2_4/idents.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/idents.c -o c_code/2_4/idents.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/extccomp.c -o c_code/2_4/extccomp.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/extccomp.c -o c_code/2_4/extccomp.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/wordrecg.c -o c_code/2_4/wordrecg.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/wordrecg.c -o c_code/2_4/wordrecg.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/nimblecmd.c -o c_code/2_4/nimblecmd.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/nimblecmd.c -o c_code/2_4/nimblecmd.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_parseopt.c -o c_code/2_4/stdlib_parseopt.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_parseopt.c -o c_code/2_4/stdlib_parseopt.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/lexer.c -o c_code/2_4/lexer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/lexer.c -o c_code/2_4/lexer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/nimlexbase.c -o c_code/2_4/nimlexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/nimlexbase.c -o c_code/2_4/nimlexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/llstream.c -o c_code/2_4/llstream.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/llstream.c -o c_code/2_4/llstream.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/nimconf.c -o c_code/2_4/nimconf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/nimconf.c -o c_code/2_4/nimconf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/main.c -o c_code/2_4/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/main.c -o c_code/2_4/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/ast.c -o c_code/2_4/ast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/ast.c -o c_code/2_4/ast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_intsets.c -o c_code/2_4/stdlib_intsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_intsets.c -o c_code/2_4/stdlib_intsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/idgen.c -o c_code/2_4/idgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/idgen.c -o c_code/2_4/idgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/astalgo.c -o c_code/2_4/astalgo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/astalgo.c -o c_code/2_4/astalgo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/rodutils.c -o c_code/2_4/rodutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/rodutils.c -o c_code/2_4/rodutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/syntaxes.c -o c_code/2_4/syntaxes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/syntaxes.c -o c_code/2_4/syntaxes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/parser.c -o c_code/2_4/parser.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/parser.c -o c_code/2_4/parser.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/pbraces.c -o c_code/2_4/pbraces.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/pbraces.c -o c_code/2_4/pbraces.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/filters.c -o c_code/2_4/filters.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/filters.c -o c_code/2_4/filters.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/renderer.c -o c_code/2_4/renderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/renderer.c -o c_code/2_4/renderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/filter_tmpl.c -o c_code/2_4/filter_tmpl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/filter_tmpl.c -o c_code/2_4/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/rodread.c -o c_code/2_4/rodread.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/rodread.c -o c_code/2_4/rodread.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/types.c -o c_code/2_4/types.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/types.c -o c_code/2_4/types.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/trees.c -o c_code/2_4/trees.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/trees.c -o c_code/2_4/trees.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_memfiles.c -o c_code/2_4/stdlib_memfiles.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_memfiles.c -o c_code/2_4/stdlib_memfiles.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/rodwrite.c -o c_code/2_4/rodwrite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/rodwrite.c -o c_code/2_4/rodwrite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/passes.c -o c_code/2_4/passes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/passes.c -o c_code/2_4/passes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/magicsys.c -o c_code/2_4/magicsys.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/magicsys.c -o c_code/2_4/magicsys.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/nimsets.c -o c_code/2_4/nimsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/nimsets.c -o c_code/2_4/nimsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/bitsets.c -o c_code/2_4/bitsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/bitsets.c -o c_code/2_4/bitsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/importer.c -o c_code/2_4/importer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/importer.c -o c_code/2_4/importer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/lookups.c -o c_code/2_4/lookups.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/lookups.c -o c_code/2_4/lookups.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/semdata.c -o c_code/2_4/semdata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/semdata.c -o c_code/2_4/semdata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/treetab.c -o c_code/2_4/treetab.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/treetab.c -o c_code/2_4/treetab.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/vmdef.c -o c_code/2_4/vmdef.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/vmdef.c -o c_code/2_4/vmdef.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/prettybase.c -o c_code/2_4/prettybase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/prettybase.c -o c_code/2_4/prettybase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_lexbase.c -o c_code/2_4/stdlib_lexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_lexbase.c -o c_code/2_4/stdlib_lexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/sem.c -o c_code/2_4/sem.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/sem.c -o c_code/2_4/sem.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/semfold.c -o c_code/2_4/semfold.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/semfold.c -o c_code/2_4/semfold.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/saturate.c -o c_code/2_4/saturate.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/saturate.c -o c_code/2_4/saturate.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/procfind.c -o c_code/2_4/procfind.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/procfind.c -o c_code/2_4/procfind.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/pragmas.c -o c_code/2_4/pragmas.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/pragmas.c -o c_code/2_4/pragmas.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/semtypinst.c -o c_code/2_4/semtypinst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/semtypinst.c -o c_code/2_4/semtypinst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/sigmatch.c -o c_code/2_4/sigmatch.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/sigmatch.c -o c_code/2_4/sigmatch.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/parampatterns.c -o c_code/2_4/parampatterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/parampatterns.c -o c_code/2_4/parampatterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/pretty.c -o c_code/2_4/pretty.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/pretty.c -o c_code/2_4/pretty.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/docgen.c -o c_code/2_4/docgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/docgen.c -o c_code/2_4/docgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/docutils_rstast.c -o c_code/2_4/docutils_rstast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/docutils_rstast.c -o c_code/2_4/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_json.c -o c_code/2_4/stdlib_json.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_json.c -o c_code/2_4/stdlib_json.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_unicode.c -o c_code/2_4/stdlib_unicode.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_unicode.c -o c_code/2_4/stdlib_unicode.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/docutils_rst.c -o c_code/2_4/docutils_rst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/docutils_rst.c -o c_code/2_4/docutils_rst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/docutils_rstgen.c -o c_code/2_4/docutils_rstgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/docutils_rstgen.c -o c_code/2_4/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/docutils_highlite.c -o c_code/2_4/docutils_highlite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/docutils_highlite.c -o c_code/2_4/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_sequtils.c -o c_code/2_4/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_sequtils.c -o c_code/2_4/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_algorithm.c -o c_code/2_4/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_algorithm.c -o c_code/2_4/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/sempass2.c -o c_code/2_4/sempass2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/sempass2.c -o c_code/2_4/sempass2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/guards.c -o c_code/2_4/guards.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/guards.c -o c_code/2_4/guards.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_xmltree.c -o c_code/2_4/stdlib_xmltree.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_xmltree.c -o c_code/2_4/stdlib_xmltree.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_macros.c -o c_code/2_4/stdlib_macros.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_macros.c -o c_code/2_4/stdlib_macros.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_cgi.c -o c_code/2_4/stdlib_cgi.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_cgi.c -o c_code/2_4/stdlib_cgi.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_cookies.c -o c_code/2_4/stdlib_cookies.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_cookies.c -o c_code/2_4/stdlib_cookies.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/typesrenderer.c -o c_code/2_4/typesrenderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/typesrenderer.c -o c_code/2_4/typesrenderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/transf.c -o c_code/2_4/transf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/transf.c -o c_code/2_4/transf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/cgmeth.c -o c_code/2_4/cgmeth.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/cgmeth.c -o c_code/2_4/cgmeth.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/lambdalifting.c -o c_code/2_4/lambdalifting.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/lambdalifting.c -o c_code/2_4/lambdalifting.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/lowerings.c -o c_code/2_4/lowerings.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/lowerings.c -o c_code/2_4/lowerings.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/vm.c -o c_code/2_4/vm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/vm.c -o c_code/2_4/vm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/vmgen.c -o c_code/2_4/vmgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/vmgen.c -o c_code/2_4/vmgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/vmdeps.c -o c_code/2_4/vmdeps.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/vmdeps.c -o c_code/2_4/vmdeps.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/evaltempl.c -o c_code/2_4/evaltempl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/evaltempl.c -o c_code/2_4/evaltempl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/aliases.c -o c_code/2_4/aliases.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/aliases.c -o c_code/2_4/aliases.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/patterns.c -o c_code/2_4/patterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/patterns.c -o c_code/2_4/patterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/semmacrosanity.c -o c_code/2_4/semmacrosanity.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/semmacrosanity.c -o c_code/2_4/semmacrosanity.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/semparallel.c -o c_code/2_4/semparallel.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/semparallel.c -o c_code/2_4/semparallel.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/cgen.c -o c_code/2_4/cgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/cgen.c -o c_code/2_4/cgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/ccgutils.c -o c_code/2_4/ccgutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/ccgutils.c -o c_code/2_4/ccgutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/cgendata.c -o c_code/2_4/cgendata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/cgendata.c -o c_code/2_4/cgendata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/ccgmerge.c -o c_code/2_4/ccgmerge.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/ccgmerge.c -o c_code/2_4/ccgmerge.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/jsgen.c -o c_code/2_4/jsgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/jsgen.c -o c_code/2_4/jsgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/passaux.c -o c_code/2_4/passaux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/passaux.c -o c_code/2_4/passaux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/depends.c -o c_code/2_4/depends.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/depends.c -o c_code/2_4/depends.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/docgen2.c -o c_code/2_4/docgen2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/docgen2.c -o c_code/2_4/docgen2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/service.c -o c_code/2_4/service.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/service.c -o c_code/2_4/service.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/modules.c -o c_code/2_4/modules.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/modules.c -o c_code/2_4/modules.o
    echo "$LINKER -o $binDir/nim  \
c_code/2_4/nim.o \
c_code/2_4/stdlib_system.o \
c_code/2_4/testability.o \
c_code/2_4/commands.o \
c_code/2_4/stdlib_os.o \
c_code/2_4/stdlib_strutils.o \
c_code/2_4/stdlib_parseutils.o \
c_code/2_4/stdlib_times.o \
c_code/2_4/stdlib_posix.o \
c_code/2_4/msgs.o \
c_code/2_4/options.o \
c_code/2_4/lists.o \
c_code/2_4/stdlib_strtabs.o \
c_code/2_4/stdlib_hashes.o \
c_code/2_4/stdlib_osproc.o \
c_code/2_4/stdlib_streams.o \
c_code/2_4/stdlib_cpuinfo.o \
c_code/2_4/stdlib_linux.o \
c_code/2_4/stdlib_sets.o \
c_code/2_4/stdlib_math.o \
c_code/2_4/stdlib_tables.o \
c_code/2_4/ropes.o \
c_code/2_4/platform.o \
c_code/2_4/crc.o \
c_code/2_4/stdlib_sockets.o \
c_code/2_4/stdlib_unsigned.o \
c_code/2_4/nversion.o \
c_code/2_4/condsyms.o \
c_code/2_4/idents.o \
c_code/2_4/extccomp.o \
c_code/2_4/wordrecg.o \
c_code/2_4/nimblecmd.o \
c_code/2_4/stdlib_parseopt.o \
c_code/2_4/lexer.o \
c_code/2_4/nimlexbase.o \
c_code/2_4/llstream.o \
c_code/2_4/nimconf.o \
c_code/2_4/main.o \
c_code/2_4/ast.o \
c_code/2_4/stdlib_intsets.o \
c_code/2_4/idgen.o \
c_code/2_4/astalgo.o \
c_code/2_4/rodutils.o \
c_code/2_4/syntaxes.o \
c_code/2_4/parser.o \
c_code/2_4/pbraces.o \
c_code/2_4/filters.o \
c_code/2_4/renderer.o \
c_code/2_4/filter_tmpl.o \
c_code/2_4/rodread.o \
c_code/2_4/types.o \
c_code/2_4/trees.o \
c_code/2_4/stdlib_memfiles.o \
c_code/2_4/rodwrite.o \
c_code/2_4/passes.o \
c_code/2_4/magicsys.o \
c_code/2_4/nimsets.o \
c_code/2_4/bitsets.o \
c_code/2_4/importer.o \
c_code/2_4/lookups.o \
c_code/2_4/semdata.o \
c_code/2_4/treetab.o \
c_code/2_4/vmdef.o \
c_code/2_4/prettybase.o \
c_code/2_4/stdlib_lexbase.o \
c_code/2_4/sem.o \
c_code/2_4/semfold.o \
c_code/2_4/saturate.o \
c_code/2_4/procfind.o \
c_code/2_4/pragmas.o \
c_code/2_4/semtypinst.o \
c_code/2_4/sigmatch.o \
c_code/2_4/parampatterns.o \
c_code/2_4/pretty.o \
c_code/2_4/docgen.o \
c_code/2_4/docutils_rstast.o \
c_code/2_4/stdlib_json.o \
c_code/2_4/stdlib_unicode.o \
c_code/2_4/docutils_rst.o \
c_code/2_4/docutils_rstgen.o \
c_code/2_4/docutils_highlite.o \
c_code/2_4/stdlib_sequtils.o \
c_code/2_4/stdlib_algorithm.o \
c_code/2_4/sempass2.o \
c_code/2_4/guards.o \
c_code/2_4/stdlib_xmltree.o \
c_code/2_4/stdlib_macros.o \
c_code/2_4/stdlib_cgi.o \
c_code/2_4/stdlib_cookies.o \
c_code/2_4/typesrenderer.o \
c_code/2_4/transf.o \
c_code/2_4/cgmeth.o \
c_code/2_4/lambdalifting.o \
c_code/2_4/lowerings.o \
c_code/2_4/vm.o \
c_code/2_4/vmgen.o \
c_code/2_4/vmdeps.o \
c_code/2_4/evaltempl.o \
c_code/2_4/aliases.o \
c_code/2_4/patterns.o \
c_code/2_4/semmacrosanity.o \
c_code/2_4/semparallel.o \
c_code/2_4/cgen.o \
c_code/2_4/ccgutils.o \
c_code/2_4/cgendata.o \
c_code/2_4/ccgmerge.o \
c_code/2_4/jsgen.o \
c_code/2_4/passaux.o \
c_code/2_4/depends.o \
c_code/2_4/docgen2.o \
c_code/2_4/service.o \
c_code/2_4/modules.o $LINK_FLAGS"
    $LINKER -o $binDir/nim  \
c_code/2_4/nim.o \
c_code/2_4/stdlib_system.o \
c_code/2_4/testability.o \
c_code/2_4/commands.o \
c_code/2_4/stdlib_os.o \
c_code/2_4/stdlib_strutils.o \
c_code/2_4/stdlib_parseutils.o \
c_code/2_4/stdlib_times.o \
c_code/2_4/stdlib_posix.o \
c_code/2_4/msgs.o \
c_code/2_4/options.o \
c_code/2_4/lists.o \
c_code/2_4/stdlib_strtabs.o \
c_code/2_4/stdlib_hashes.o \
c_code/2_4/stdlib_osproc.o \
c_code/2_4/stdlib_streams.o \
c_code/2_4/stdlib_cpuinfo.o \
c_code/2_4/stdlib_linux.o \
c_code/2_4/stdlib_sets.o \
c_code/2_4/stdlib_math.o \
c_code/2_4/stdlib_tables.o \
c_code/2_4/ropes.o \
c_code/2_4/platform.o \
c_code/2_4/crc.o \
c_code/2_4/stdlib_sockets.o \
c_code/2_4/stdlib_unsigned.o \
c_code/2_4/nversion.o \
c_code/2_4/condsyms.o \
c_code/2_4/idents.o \
c_code/2_4/extccomp.o \
c_code/2_4/wordrecg.o \
c_code/2_4/nimblecmd.o \
c_code/2_4/stdlib_parseopt.o \
c_code/2_4/lexer.o \
c_code/2_4/nimlexbase.o \
c_code/2_4/llstream.o \
c_code/2_4/nimconf.o \
c_code/2_4/main.o \
c_code/2_4/ast.o \
c_code/2_4/stdlib_intsets.o \
c_code/2_4/idgen.o \
c_code/2_4/astalgo.o \
c_code/2_4/rodutils.o \
c_code/2_4/syntaxes.o \
c_code/2_4/parser.o \
c_code/2_4/pbraces.o \
c_code/2_4/filters.o \
c_code/2_4/renderer.o \
c_code/2_4/filter_tmpl.o \
c_code/2_4/rodread.o \
c_code/2_4/types.o \
c_code/2_4/trees.o \
c_code/2_4/stdlib_memfiles.o \
c_code/2_4/rodwrite.o \
c_code/2_4/passes.o \
c_code/2_4/magicsys.o \
c_code/2_4/nimsets.o \
c_code/2_4/bitsets.o \
c_code/2_4/importer.o \
c_code/2_4/lookups.o \
c_code/2_4/semdata.o \
c_code/2_4/treetab.o \
c_code/2_4/vmdef.o \
c_code/2_4/prettybase.o \
c_code/2_4/stdlib_lexbase.o \
c_code/2_4/sem.o \
c_code/2_4/semfold.o \
c_code/2_4/saturate.o \
c_code/2_4/procfind.o \
c_code/2_4/pragmas.o \
c_code/2_4/semtypinst.o \
c_code/2_4/sigmatch.o \
c_code/2_4/parampatterns.o \
c_code/2_4/pretty.o \
c_code/2_4/docgen.o \
c_code/2_4/docutils_rstast.o \
c_code/2_4/stdlib_json.o \
c_code/2_4/stdlib_unicode.o \
c_code/2_4/docutils_rst.o \
c_code/2_4/docutils_rstgen.o \
c_code/2_4/docutils_highlite.o \
c_code/2_4/stdlib_sequtils.o \
c_code/2_4/stdlib_algorithm.o \
c_code/2_4/sempass2.o \
c_code/2_4/guards.o \
c_code/2_4/stdlib_xmltree.o \
c_code/2_4/stdlib_macros.o \
c_code/2_4/stdlib_cgi.o \
c_code/2_4/stdlib_cookies.o \
c_code/2_4/typesrenderer.o \
c_code/2_4/transf.o \
c_code/2_4/cgmeth.o \
c_code/2_4/lambdalifting.o \
c_code/2_4/lowerings.o \
c_code/2_4/vm.o \
c_code/2_4/vmgen.o \
c_code/2_4/vmdeps.o \
c_code/2_4/evaltempl.o \
c_code/2_4/aliases.o \
c_code/2_4/patterns.o \
c_code/2_4/semmacrosanity.o \
c_code/2_4/semparallel.o \
c_code/2_4/cgen.o \
c_code/2_4/ccgutils.o \
c_code/2_4/cgendata.o \
c_code/2_4/ccgmerge.o \
c_code/2_4/jsgen.o \
c_code/2_4/passaux.o \
c_code/2_4/depends.o \
c_code/2_4/docgen2.o \
c_code/2_4/service.o \
c_code/2_4/modules.o $LINK_FLAGS
    ;;
  sparc)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/nim.c -o c_code/2_5/nim.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/nim.c -o c_code/2_5/nim.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_system.c -o c_code/2_5/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_system.c -o c_code/2_5/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/testability.c -o c_code/2_5/testability.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/testability.c -o c_code/2_5/testability.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/commands.c -o c_code/2_5/commands.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/commands.c -o c_code/2_5/commands.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_os.c -o c_code/2_5/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_os.c -o c_code/2_5/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_strutils.c -o c_code/2_5/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_strutils.c -o c_code/2_5/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_parseutils.c -o c_code/2_5/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_parseutils.c -o c_code/2_5/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_times.c -o c_code/2_5/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_times.c -o c_code/2_5/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_posix.c -o c_code/2_5/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_posix.c -o c_code/2_5/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/msgs.c -o c_code/2_5/msgs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/msgs.c -o c_code/2_5/msgs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/options.c -o c_code/2_5/options.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/options.c -o c_code/2_5/options.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/lists.c -o c_code/2_5/lists.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/lists.c -o c_code/2_5/lists.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_strtabs.c -o c_code/2_5/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_strtabs.c -o c_code/2_5/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_hashes.c -o c_code/2_5/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_hashes.c -o c_code/2_5/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_osproc.c -o c_code/2_5/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_osproc.c -o c_code/2_5/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_streams.c -o c_code/2_5/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_streams.c -o c_code/2_5/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_cpuinfo.c -o c_code/2_5/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_cpuinfo.c -o c_code/2_5/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_linux.c -o c_code/2_5/stdlib_linux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_linux.c -o c_code/2_5/stdlib_linux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_sets.c -o c_code/2_5/stdlib_sets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_sets.c -o c_code/2_5/stdlib_sets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_math.c -o c_code/2_5/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_math.c -o c_code/2_5/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_tables.c -o c_code/2_5/stdlib_tables.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_tables.c -o c_code/2_5/stdlib_tables.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/ropes.c -o c_code/2_5/ropes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/ropes.c -o c_code/2_5/ropes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/platform.c -o c_code/2_5/platform.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/platform.c -o c_code/2_5/platform.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/crc.c -o c_code/2_5/crc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/crc.c -o c_code/2_5/crc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_sockets.c -o c_code/2_5/stdlib_sockets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_sockets.c -o c_code/2_5/stdlib_sockets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_unsigned.c -o c_code/2_5/stdlib_unsigned.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_unsigned.c -o c_code/2_5/stdlib_unsigned.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/nversion.c -o c_code/2_5/nversion.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/nversion.c -o c_code/2_5/nversion.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/condsyms.c -o c_code/2_5/condsyms.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/condsyms.c -o c_code/2_5/condsyms.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/idents.c -o c_code/2_5/idents.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/idents.c -o c_code/2_5/idents.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/extccomp.c -o c_code/2_5/extccomp.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/extccomp.c -o c_code/2_5/extccomp.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/wordrecg.c -o c_code/2_5/wordrecg.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/wordrecg.c -o c_code/2_5/wordrecg.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/nimblecmd.c -o c_code/2_5/nimblecmd.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/nimblecmd.c -o c_code/2_5/nimblecmd.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_parseopt.c -o c_code/2_5/stdlib_parseopt.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_parseopt.c -o c_code/2_5/stdlib_parseopt.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/lexer.c -o c_code/2_5/lexer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/lexer.c -o c_code/2_5/lexer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/nimlexbase.c -o c_code/2_5/nimlexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/nimlexbase.c -o c_code/2_5/nimlexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/llstream.c -o c_code/2_5/llstream.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/llstream.c -o c_code/2_5/llstream.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/nimconf.c -o c_code/2_5/nimconf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/nimconf.c -o c_code/2_5/nimconf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/main.c -o c_code/2_5/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/main.c -o c_code/2_5/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/ast.c -o c_code/2_5/ast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/ast.c -o c_code/2_5/ast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_intsets.c -o c_code/2_5/stdlib_intsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_intsets.c -o c_code/2_5/stdlib_intsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/idgen.c -o c_code/2_5/idgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/idgen.c -o c_code/2_5/idgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/astalgo.c -o c_code/2_5/astalgo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/astalgo.c -o c_code/2_5/astalgo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/rodutils.c -o c_code/2_5/rodutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/rodutils.c -o c_code/2_5/rodutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/syntaxes.c -o c_code/2_5/syntaxes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/syntaxes.c -o c_code/2_5/syntaxes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/parser.c -o c_code/2_5/parser.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/parser.c -o c_code/2_5/parser.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/pbraces.c -o c_code/2_5/pbraces.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/pbraces.c -o c_code/2_5/pbraces.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/filters.c -o c_code/2_5/filters.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/filters.c -o c_code/2_5/filters.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/renderer.c -o c_code/2_5/renderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/renderer.c -o c_code/2_5/renderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/filter_tmpl.c -o c_code/2_5/filter_tmpl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/filter_tmpl.c -o c_code/2_5/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/rodread.c -o c_code/2_5/rodread.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/rodread.c -o c_code/2_5/rodread.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/types.c -o c_code/2_5/types.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/types.c -o c_code/2_5/types.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/trees.c -o c_code/2_5/trees.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/trees.c -o c_code/2_5/trees.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_memfiles.c -o c_code/2_5/stdlib_memfiles.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_memfiles.c -o c_code/2_5/stdlib_memfiles.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/rodwrite.c -o c_code/2_5/rodwrite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/rodwrite.c -o c_code/2_5/rodwrite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/passes.c -o c_code/2_5/passes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/passes.c -o c_code/2_5/passes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/magicsys.c -o c_code/2_5/magicsys.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/magicsys.c -o c_code/2_5/magicsys.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/nimsets.c -o c_code/2_5/nimsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/nimsets.c -o c_code/2_5/nimsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/bitsets.c -o c_code/2_5/bitsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/bitsets.c -o c_code/2_5/bitsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/importer.c -o c_code/2_5/importer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/importer.c -o c_code/2_5/importer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/lookups.c -o c_code/2_5/lookups.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/lookups.c -o c_code/2_5/lookups.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/semdata.c -o c_code/2_5/semdata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/semdata.c -o c_code/2_5/semdata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/treetab.c -o c_code/2_5/treetab.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/treetab.c -o c_code/2_5/treetab.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/vmdef.c -o c_code/2_5/vmdef.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/vmdef.c -o c_code/2_5/vmdef.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/prettybase.c -o c_code/2_5/prettybase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/prettybase.c -o c_code/2_5/prettybase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_lexbase.c -o c_code/2_5/stdlib_lexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_lexbase.c -o c_code/2_5/stdlib_lexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/sem.c -o c_code/2_5/sem.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/sem.c -o c_code/2_5/sem.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/semfold.c -o c_code/2_5/semfold.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/semfold.c -o c_code/2_5/semfold.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/saturate.c -o c_code/2_5/saturate.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/saturate.c -o c_code/2_5/saturate.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/procfind.c -o c_code/2_5/procfind.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/procfind.c -o c_code/2_5/procfind.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/pragmas.c -o c_code/2_5/pragmas.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/pragmas.c -o c_code/2_5/pragmas.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/semtypinst.c -o c_code/2_5/semtypinst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/semtypinst.c -o c_code/2_5/semtypinst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/sigmatch.c -o c_code/2_5/sigmatch.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/sigmatch.c -o c_code/2_5/sigmatch.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/parampatterns.c -o c_code/2_5/parampatterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/parampatterns.c -o c_code/2_5/parampatterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/pretty.c -o c_code/2_5/pretty.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/pretty.c -o c_code/2_5/pretty.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/docgen.c -o c_code/2_5/docgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/docgen.c -o c_code/2_5/docgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/docutils_rstast.c -o c_code/2_5/docutils_rstast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/docutils_rstast.c -o c_code/2_5/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_json.c -o c_code/2_5/stdlib_json.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_json.c -o c_code/2_5/stdlib_json.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_unicode.c -o c_code/2_5/stdlib_unicode.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_unicode.c -o c_code/2_5/stdlib_unicode.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/docutils_rst.c -o c_code/2_5/docutils_rst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/docutils_rst.c -o c_code/2_5/docutils_rst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/docutils_rstgen.c -o c_code/2_5/docutils_rstgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/docutils_rstgen.c -o c_code/2_5/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/docutils_highlite.c -o c_code/2_5/docutils_highlite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/docutils_highlite.c -o c_code/2_5/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_sequtils.c -o c_code/2_5/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_sequtils.c -o c_code/2_5/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_algorithm.c -o c_code/2_5/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_algorithm.c -o c_code/2_5/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/sempass2.c -o c_code/2_5/sempass2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/sempass2.c -o c_code/2_5/sempass2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/guards.c -o c_code/2_5/guards.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/guards.c -o c_code/2_5/guards.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_xmltree.c -o c_code/2_5/stdlib_xmltree.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_xmltree.c -o c_code/2_5/stdlib_xmltree.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_macros.c -o c_code/2_5/stdlib_macros.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_macros.c -o c_code/2_5/stdlib_macros.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_cgi.c -o c_code/2_5/stdlib_cgi.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_cgi.c -o c_code/2_5/stdlib_cgi.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_cookies.c -o c_code/2_5/stdlib_cookies.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_cookies.c -o c_code/2_5/stdlib_cookies.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/typesrenderer.c -o c_code/2_5/typesrenderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/typesrenderer.c -o c_code/2_5/typesrenderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/transf.c -o c_code/2_5/transf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/transf.c -o c_code/2_5/transf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/cgmeth.c -o c_code/2_5/cgmeth.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/cgmeth.c -o c_code/2_5/cgmeth.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/lambdalifting.c -o c_code/2_5/lambdalifting.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/lambdalifting.c -o c_code/2_5/lambdalifting.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/lowerings.c -o c_code/2_5/lowerings.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/lowerings.c -o c_code/2_5/lowerings.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/vm.c -o c_code/2_5/vm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/vm.c -o c_code/2_5/vm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/vmgen.c -o c_code/2_5/vmgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/vmgen.c -o c_code/2_5/vmgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/vmdeps.c -o c_code/2_5/vmdeps.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/vmdeps.c -o c_code/2_5/vmdeps.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/evaltempl.c -o c_code/2_5/evaltempl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/evaltempl.c -o c_code/2_5/evaltempl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/aliases.c -o c_code/2_5/aliases.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/aliases.c -o c_code/2_5/aliases.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/patterns.c -o c_code/2_5/patterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/patterns.c -o c_code/2_5/patterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/semmacrosanity.c -o c_code/2_5/semmacrosanity.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/semmacrosanity.c -o c_code/2_5/semmacrosanity.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/semparallel.c -o c_code/2_5/semparallel.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/semparallel.c -o c_code/2_5/semparallel.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/cgen.c -o c_code/2_5/cgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/cgen.c -o c_code/2_5/cgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/ccgutils.c -o c_code/2_5/ccgutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/ccgutils.c -o c_code/2_5/ccgutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/cgendata.c -o c_code/2_5/cgendata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/cgendata.c -o c_code/2_5/cgendata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/ccgmerge.c -o c_code/2_5/ccgmerge.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/ccgmerge.c -o c_code/2_5/ccgmerge.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/jsgen.c -o c_code/2_5/jsgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/jsgen.c -o c_code/2_5/jsgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/passaux.c -o c_code/2_5/passaux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/passaux.c -o c_code/2_5/passaux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/depends.c -o c_code/2_5/depends.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/depends.c -o c_code/2_5/depends.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/docgen2.c -o c_code/2_5/docgen2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/docgen2.c -o c_code/2_5/docgen2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/service.c -o c_code/2_5/service.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/service.c -o c_code/2_5/service.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/modules.c -o c_code/2_5/modules.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/modules.c -o c_code/2_5/modules.o
    echo "$LINKER -o $binDir/nim  \
c_code/2_5/nim.o \
c_code/2_5/stdlib_system.o \
c_code/2_5/testability.o \
c_code/2_5/commands.o \
c_code/2_5/stdlib_os.o \
c_code/2_5/stdlib_strutils.o \
c_code/2_5/stdlib_parseutils.o \
c_code/2_5/stdlib_times.o \
c_code/2_5/stdlib_posix.o \
c_code/2_5/msgs.o \
c_code/2_5/options.o \
c_code/2_5/lists.o \
c_code/2_5/stdlib_strtabs.o \
c_code/2_5/stdlib_hashes.o \
c_code/2_5/stdlib_osproc.o \
c_code/2_5/stdlib_streams.o \
c_code/2_5/stdlib_cpuinfo.o \
c_code/2_5/stdlib_linux.o \
c_code/2_5/stdlib_sets.o \
c_code/2_5/stdlib_math.o \
c_code/2_5/stdlib_tables.o \
c_code/2_5/ropes.o \
c_code/2_5/platform.o \
c_code/2_5/crc.o \
c_code/2_5/stdlib_sockets.o \
c_code/2_5/stdlib_unsigned.o \
c_code/2_5/nversion.o \
c_code/2_5/condsyms.o \
c_code/2_5/idents.o \
c_code/2_5/extccomp.o \
c_code/2_5/wordrecg.o \
c_code/2_5/nimblecmd.o \
c_code/2_5/stdlib_parseopt.o \
c_code/2_5/lexer.o \
c_code/2_5/nimlexbase.o \
c_code/2_5/llstream.o \
c_code/2_5/nimconf.o \
c_code/2_5/main.o \
c_code/2_5/ast.o \
c_code/2_5/stdlib_intsets.o \
c_code/2_5/idgen.o \
c_code/2_5/astalgo.o \
c_code/2_5/rodutils.o \
c_code/2_5/syntaxes.o \
c_code/2_5/parser.o \
c_code/2_5/pbraces.o \
c_code/2_5/filters.o \
c_code/2_5/renderer.o \
c_code/2_5/filter_tmpl.o \
c_code/2_5/rodread.o \
c_code/2_5/types.o \
c_code/2_5/trees.o \
c_code/2_5/stdlib_memfiles.o \
c_code/2_5/rodwrite.o \
c_code/2_5/passes.o \
c_code/2_5/magicsys.o \
c_code/2_5/nimsets.o \
c_code/2_5/bitsets.o \
c_code/2_5/importer.o \
c_code/2_5/lookups.o \
c_code/2_5/semdata.o \
c_code/2_5/treetab.o \
c_code/2_5/vmdef.o \
c_code/2_5/prettybase.o \
c_code/2_5/stdlib_lexbase.o \
c_code/2_5/sem.o \
c_code/2_5/semfold.o \
c_code/2_5/saturate.o \
c_code/2_5/procfind.o \
c_code/2_5/pragmas.o \
c_code/2_5/semtypinst.o \
c_code/2_5/sigmatch.o \
c_code/2_5/parampatterns.o \
c_code/2_5/pretty.o \
c_code/2_5/docgen.o \
c_code/2_5/docutils_rstast.o \
c_code/2_5/stdlib_json.o \
c_code/2_5/stdlib_unicode.o \
c_code/2_5/docutils_rst.o \
c_code/2_5/docutils_rstgen.o \
c_code/2_5/docutils_highlite.o \
c_code/2_5/stdlib_sequtils.o \
c_code/2_5/stdlib_algorithm.o \
c_code/2_5/sempass2.o \
c_code/2_5/guards.o \
c_code/2_5/stdlib_xmltree.o \
c_code/2_5/stdlib_macros.o \
c_code/2_5/stdlib_cgi.o \
c_code/2_5/stdlib_cookies.o \
c_code/2_5/typesrenderer.o \
c_code/2_5/transf.o \
c_code/2_5/cgmeth.o \
c_code/2_5/lambdalifting.o \
c_code/2_5/lowerings.o \
c_code/2_5/vm.o \
c_code/2_5/vmgen.o \
c_code/2_5/vmdeps.o \
c_code/2_5/evaltempl.o \
c_code/2_5/aliases.o \
c_code/2_5/patterns.o \
c_code/2_5/semmacrosanity.o \
c_code/2_5/semparallel.o \
c_code/2_5/cgen.o \
c_code/2_5/ccgutils.o \
c_code/2_5/cgendata.o \
c_code/2_5/ccgmerge.o \
c_code/2_5/jsgen.o \
c_code/2_5/passaux.o \
c_code/2_5/depends.o \
c_code/2_5/docgen2.o \
c_code/2_5/service.o \
c_code/2_5/modules.o $LINK_FLAGS"
    $LINKER -o $binDir/nim  \
c_code/2_5/nim.o \
c_code/2_5/stdlib_system.o \
c_code/2_5/testability.o \
c_code/2_5/commands.o \
c_code/2_5/stdlib_os.o \
c_code/2_5/stdlib_strutils.o \
c_code/2_5/stdlib_parseutils.o \
c_code/2_5/stdlib_times.o \
c_code/2_5/stdlib_posix.o \
c_code/2_5/msgs.o \
c_code/2_5/options.o \
c_code/2_5/lists.o \
c_code/2_5/stdlib_strtabs.o \
c_code/2_5/stdlib_hashes.o \
c_code/2_5/stdlib_osproc.o \
c_code/2_5/stdlib_streams.o \
c_code/2_5/stdlib_cpuinfo.o \
c_code/2_5/stdlib_linux.o \
c_code/2_5/stdlib_sets.o \
c_code/2_5/stdlib_math.o \
c_code/2_5/stdlib_tables.o \
c_code/2_5/ropes.o \
c_code/2_5/platform.o \
c_code/2_5/crc.o \
c_code/2_5/stdlib_sockets.o \
c_code/2_5/stdlib_unsigned.o \
c_code/2_5/nversion.o \
c_code/2_5/condsyms.o \
c_code/2_5/idents.o \
c_code/2_5/extccomp.o \
c_code/2_5/wordrecg.o \
c_code/2_5/nimblecmd.o \
c_code/2_5/stdlib_parseopt.o \
c_code/2_5/lexer.o \
c_code/2_5/nimlexbase.o \
c_code/2_5/llstream.o \
c_code/2_5/nimconf.o \
c_code/2_5/main.o \
c_code/2_5/ast.o \
c_code/2_5/stdlib_intsets.o \
c_code/2_5/idgen.o \
c_code/2_5/astalgo.o \
c_code/2_5/rodutils.o \
c_code/2_5/syntaxes.o \
c_code/2_5/parser.o \
c_code/2_5/pbraces.o \
c_code/2_5/filters.o \
c_code/2_5/renderer.o \
c_code/2_5/filter_tmpl.o \
c_code/2_5/rodread.o \
c_code/2_5/types.o \
c_code/2_5/trees.o \
c_code/2_5/stdlib_memfiles.o \
c_code/2_5/rodwrite.o \
c_code/2_5/passes.o \
c_code/2_5/magicsys.o \
c_code/2_5/nimsets.o \
c_code/2_5/bitsets.o \
c_code/2_5/importer.o \
c_code/2_5/lookups.o \
c_code/2_5/semdata.o \
c_code/2_5/treetab.o \
c_code/2_5/vmdef.o \
c_code/2_5/prettybase.o \
c_code/2_5/stdlib_lexbase.o \
c_code/2_5/sem.o \
c_code/2_5/semfold.o \
c_code/2_5/saturate.o \
c_code/2_5/procfind.o \
c_code/2_5/pragmas.o \
c_code/2_5/semtypinst.o \
c_code/2_5/sigmatch.o \
c_code/2_5/parampatterns.o \
c_code/2_5/pretty.o \
c_code/2_5/docgen.o \
c_code/2_5/docutils_rstast.o \
c_code/2_5/stdlib_json.o \
c_code/2_5/stdlib_unicode.o \
c_code/2_5/docutils_rst.o \
c_code/2_5/docutils_rstgen.o \
c_code/2_5/docutils_highlite.o \
c_code/2_5/stdlib_sequtils.o \
c_code/2_5/stdlib_algorithm.o \
c_code/2_5/sempass2.o \
c_code/2_5/guards.o \
c_code/2_5/stdlib_xmltree.o \
c_code/2_5/stdlib_macros.o \
c_code/2_5/stdlib_cgi.o \
c_code/2_5/stdlib_cookies.o \
c_code/2_5/typesrenderer.o \
c_code/2_5/transf.o \
c_code/2_5/cgmeth.o \
c_code/2_5/lambdalifting.o \
c_code/2_5/lowerings.o \
c_code/2_5/vm.o \
c_code/2_5/vmgen.o \
c_code/2_5/vmdeps.o \
c_code/2_5/evaltempl.o \
c_code/2_5/aliases.o \
c_code/2_5/patterns.o \
c_code/2_5/semmacrosanity.o \
c_code/2_5/semparallel.o \
c_code/2_5/cgen.o \
c_code/2_5/ccgutils.o \
c_code/2_5/cgendata.o \
c_code/2_5/ccgmerge.o \
c_code/2_5/jsgen.o \
c_code/2_5/passaux.o \
c_code/2_5/depends.o \
c_code/2_5/docgen2.o \
c_code/2_5/service.o \
c_code/2_5/modules.o $LINK_FLAGS
    ;;
  mips)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/nim.c -o c_code/2_6/nim.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/nim.c -o c_code/2_6/nim.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_system.c -o c_code/2_6/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_system.c -o c_code/2_6/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/testability.c -o c_code/2_6/testability.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/testability.c -o c_code/2_6/testability.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/commands.c -o c_code/2_6/commands.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/commands.c -o c_code/2_6/commands.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_os.c -o c_code/2_6/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_os.c -o c_code/2_6/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_strutils.c -o c_code/2_6/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_strutils.c -o c_code/2_6/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_parseutils.c -o c_code/2_6/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_parseutils.c -o c_code/2_6/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_times.c -o c_code/2_6/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_times.c -o c_code/2_6/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_posix.c -o c_code/2_6/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_posix.c -o c_code/2_6/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/msgs.c -o c_code/2_6/msgs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/msgs.c -o c_code/2_6/msgs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/options.c -o c_code/2_6/options.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/options.c -o c_code/2_6/options.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/lists.c -o c_code/2_6/lists.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/lists.c -o c_code/2_6/lists.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_strtabs.c -o c_code/2_6/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_strtabs.c -o c_code/2_6/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_hashes.c -o c_code/2_6/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_hashes.c -o c_code/2_6/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_osproc.c -o c_code/2_6/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_osproc.c -o c_code/2_6/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_streams.c -o c_code/2_6/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_streams.c -o c_code/2_6/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_cpuinfo.c -o c_code/2_6/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_cpuinfo.c -o c_code/2_6/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_linux.c -o c_code/2_6/stdlib_linux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_linux.c -o c_code/2_6/stdlib_linux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_sets.c -o c_code/2_6/stdlib_sets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_sets.c -o c_code/2_6/stdlib_sets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_math.c -o c_code/2_6/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_math.c -o c_code/2_6/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_tables.c -o c_code/2_6/stdlib_tables.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_tables.c -o c_code/2_6/stdlib_tables.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/ropes.c -o c_code/2_6/ropes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/ropes.c -o c_code/2_6/ropes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/platform.c -o c_code/2_6/platform.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/platform.c -o c_code/2_6/platform.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/crc.c -o c_code/2_6/crc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/crc.c -o c_code/2_6/crc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_sockets.c -o c_code/2_6/stdlib_sockets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_sockets.c -o c_code/2_6/stdlib_sockets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_unsigned.c -o c_code/2_6/stdlib_unsigned.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_unsigned.c -o c_code/2_6/stdlib_unsigned.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/nversion.c -o c_code/2_6/nversion.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/nversion.c -o c_code/2_6/nversion.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/condsyms.c -o c_code/2_6/condsyms.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/condsyms.c -o c_code/2_6/condsyms.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/idents.c -o c_code/2_6/idents.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/idents.c -o c_code/2_6/idents.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/extccomp.c -o c_code/2_6/extccomp.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/extccomp.c -o c_code/2_6/extccomp.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/wordrecg.c -o c_code/2_6/wordrecg.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/wordrecg.c -o c_code/2_6/wordrecg.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/nimblecmd.c -o c_code/2_6/nimblecmd.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/nimblecmd.c -o c_code/2_6/nimblecmd.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_parseopt.c -o c_code/2_6/stdlib_parseopt.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_parseopt.c -o c_code/2_6/stdlib_parseopt.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/lexer.c -o c_code/2_6/lexer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/lexer.c -o c_code/2_6/lexer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/nimlexbase.c -o c_code/2_6/nimlexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/nimlexbase.c -o c_code/2_6/nimlexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/llstream.c -o c_code/2_6/llstream.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/llstream.c -o c_code/2_6/llstream.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/nimconf.c -o c_code/2_6/nimconf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/nimconf.c -o c_code/2_6/nimconf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/main.c -o c_code/2_6/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/main.c -o c_code/2_6/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/ast.c -o c_code/2_6/ast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/ast.c -o c_code/2_6/ast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_intsets.c -o c_code/2_6/stdlib_intsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_intsets.c -o c_code/2_6/stdlib_intsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/idgen.c -o c_code/2_6/idgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/idgen.c -o c_code/2_6/idgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/astalgo.c -o c_code/2_6/astalgo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/astalgo.c -o c_code/2_6/astalgo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/rodutils.c -o c_code/2_6/rodutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/rodutils.c -o c_code/2_6/rodutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/syntaxes.c -o c_code/2_6/syntaxes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/syntaxes.c -o c_code/2_6/syntaxes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/parser.c -o c_code/2_6/parser.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/parser.c -o c_code/2_6/parser.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/pbraces.c -o c_code/2_6/pbraces.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/pbraces.c -o c_code/2_6/pbraces.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/filters.c -o c_code/2_6/filters.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/filters.c -o c_code/2_6/filters.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/renderer.c -o c_code/2_6/renderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/renderer.c -o c_code/2_6/renderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/filter_tmpl.c -o c_code/2_6/filter_tmpl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/filter_tmpl.c -o c_code/2_6/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/rodread.c -o c_code/2_6/rodread.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/rodread.c -o c_code/2_6/rodread.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/types.c -o c_code/2_6/types.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/types.c -o c_code/2_6/types.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/trees.c -o c_code/2_6/trees.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/trees.c -o c_code/2_6/trees.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_memfiles.c -o c_code/2_6/stdlib_memfiles.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_memfiles.c -o c_code/2_6/stdlib_memfiles.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/rodwrite.c -o c_code/2_6/rodwrite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/rodwrite.c -o c_code/2_6/rodwrite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/passes.c -o c_code/2_6/passes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/passes.c -o c_code/2_6/passes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/magicsys.c -o c_code/2_6/magicsys.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/magicsys.c -o c_code/2_6/magicsys.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/nimsets.c -o c_code/2_6/nimsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/nimsets.c -o c_code/2_6/nimsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/bitsets.c -o c_code/2_6/bitsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/bitsets.c -o c_code/2_6/bitsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/importer.c -o c_code/2_6/importer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/importer.c -o c_code/2_6/importer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/lookups.c -o c_code/2_6/lookups.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/lookups.c -o c_code/2_6/lookups.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/semdata.c -o c_code/2_6/semdata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/semdata.c -o c_code/2_6/semdata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/treetab.c -o c_code/2_6/treetab.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/treetab.c -o c_code/2_6/treetab.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/vmdef.c -o c_code/2_6/vmdef.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/vmdef.c -o c_code/2_6/vmdef.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/prettybase.c -o c_code/2_6/prettybase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/prettybase.c -o c_code/2_6/prettybase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_lexbase.c -o c_code/2_6/stdlib_lexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_lexbase.c -o c_code/2_6/stdlib_lexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/sem.c -o c_code/2_6/sem.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/sem.c -o c_code/2_6/sem.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/semfold.c -o c_code/2_6/semfold.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/semfold.c -o c_code/2_6/semfold.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/saturate.c -o c_code/2_6/saturate.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/saturate.c -o c_code/2_6/saturate.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/procfind.c -o c_code/2_6/procfind.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/procfind.c -o c_code/2_6/procfind.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/pragmas.c -o c_code/2_6/pragmas.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/pragmas.c -o c_code/2_6/pragmas.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/semtypinst.c -o c_code/2_6/semtypinst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/semtypinst.c -o c_code/2_6/semtypinst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/sigmatch.c -o c_code/2_6/sigmatch.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/sigmatch.c -o c_code/2_6/sigmatch.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/parampatterns.c -o c_code/2_6/parampatterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/parampatterns.c -o c_code/2_6/parampatterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/pretty.c -o c_code/2_6/pretty.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/pretty.c -o c_code/2_6/pretty.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/docgen.c -o c_code/2_6/docgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/docgen.c -o c_code/2_6/docgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/docutils_rstast.c -o c_code/2_6/docutils_rstast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/docutils_rstast.c -o c_code/2_6/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_json.c -o c_code/2_6/stdlib_json.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_json.c -o c_code/2_6/stdlib_json.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_unicode.c -o c_code/2_6/stdlib_unicode.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_unicode.c -o c_code/2_6/stdlib_unicode.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/docutils_rst.c -o c_code/2_6/docutils_rst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/docutils_rst.c -o c_code/2_6/docutils_rst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/docutils_rstgen.c -o c_code/2_6/docutils_rstgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/docutils_rstgen.c -o c_code/2_6/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/docutils_highlite.c -o c_code/2_6/docutils_highlite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/docutils_highlite.c -o c_code/2_6/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_sequtils.c -o c_code/2_6/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_sequtils.c -o c_code/2_6/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_algorithm.c -o c_code/2_6/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_algorithm.c -o c_code/2_6/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/sempass2.c -o c_code/2_6/sempass2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/sempass2.c -o c_code/2_6/sempass2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/guards.c -o c_code/2_6/guards.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/guards.c -o c_code/2_6/guards.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_xmltree.c -o c_code/2_6/stdlib_xmltree.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_xmltree.c -o c_code/2_6/stdlib_xmltree.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_macros.c -o c_code/2_6/stdlib_macros.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_macros.c -o c_code/2_6/stdlib_macros.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_cgi.c -o c_code/2_6/stdlib_cgi.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_cgi.c -o c_code/2_6/stdlib_cgi.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_cookies.c -o c_code/2_6/stdlib_cookies.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_cookies.c -o c_code/2_6/stdlib_cookies.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/typesrenderer.c -o c_code/2_6/typesrenderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/typesrenderer.c -o c_code/2_6/typesrenderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/transf.c -o c_code/2_6/transf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/transf.c -o c_code/2_6/transf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/cgmeth.c -o c_code/2_6/cgmeth.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/cgmeth.c -o c_code/2_6/cgmeth.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/lambdalifting.c -o c_code/2_6/lambdalifting.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/lambdalifting.c -o c_code/2_6/lambdalifting.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/lowerings.c -o c_code/2_6/lowerings.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/lowerings.c -o c_code/2_6/lowerings.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/vm.c -o c_code/2_6/vm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/vm.c -o c_code/2_6/vm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/vmgen.c -o c_code/2_6/vmgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/vmgen.c -o c_code/2_6/vmgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/vmdeps.c -o c_code/2_6/vmdeps.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/vmdeps.c -o c_code/2_6/vmdeps.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/evaltempl.c -o c_code/2_6/evaltempl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/evaltempl.c -o c_code/2_6/evaltempl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/aliases.c -o c_code/2_6/aliases.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/aliases.c -o c_code/2_6/aliases.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/patterns.c -o c_code/2_6/patterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/patterns.c -o c_code/2_6/patterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/semmacrosanity.c -o c_code/2_6/semmacrosanity.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/semmacrosanity.c -o c_code/2_6/semmacrosanity.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/semparallel.c -o c_code/2_6/semparallel.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/semparallel.c -o c_code/2_6/semparallel.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/cgen.c -o c_code/2_6/cgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/cgen.c -o c_code/2_6/cgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/ccgutils.c -o c_code/2_6/ccgutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/ccgutils.c -o c_code/2_6/ccgutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/cgendata.c -o c_code/2_6/cgendata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/cgendata.c -o c_code/2_6/cgendata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/ccgmerge.c -o c_code/2_6/ccgmerge.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/ccgmerge.c -o c_code/2_6/ccgmerge.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/jsgen.c -o c_code/2_6/jsgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/jsgen.c -o c_code/2_6/jsgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/passaux.c -o c_code/2_6/passaux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/passaux.c -o c_code/2_6/passaux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/depends.c -o c_code/2_6/depends.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/depends.c -o c_code/2_6/depends.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/docgen2.c -o c_code/2_6/docgen2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/docgen2.c -o c_code/2_6/docgen2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/service.c -o c_code/2_6/service.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/service.c -o c_code/2_6/service.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/modules.c -o c_code/2_6/modules.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/modules.c -o c_code/2_6/modules.o
    echo "$LINKER -o $binDir/nim  \
c_code/2_6/nim.o \
c_code/2_6/stdlib_system.o \
c_code/2_6/testability.o \
c_code/2_6/commands.o \
c_code/2_6/stdlib_os.o \
c_code/2_6/stdlib_strutils.o \
c_code/2_6/stdlib_parseutils.o \
c_code/2_6/stdlib_times.o \
c_code/2_6/stdlib_posix.o \
c_code/2_6/msgs.o \
c_code/2_6/options.o \
c_code/2_6/lists.o \
c_code/2_6/stdlib_strtabs.o \
c_code/2_6/stdlib_hashes.o \
c_code/2_6/stdlib_osproc.o \
c_code/2_6/stdlib_streams.o \
c_code/2_6/stdlib_cpuinfo.o \
c_code/2_6/stdlib_linux.o \
c_code/2_6/stdlib_sets.o \
c_code/2_6/stdlib_math.o \
c_code/2_6/stdlib_tables.o \
c_code/2_6/ropes.o \
c_code/2_6/platform.o \
c_code/2_6/crc.o \
c_code/2_6/stdlib_sockets.o \
c_code/2_6/stdlib_unsigned.o \
c_code/2_6/nversion.o \
c_code/2_6/condsyms.o \
c_code/2_6/idents.o \
c_code/2_6/extccomp.o \
c_code/2_6/wordrecg.o \
c_code/2_6/nimblecmd.o \
c_code/2_6/stdlib_parseopt.o \
c_code/2_6/lexer.o \
c_code/2_6/nimlexbase.o \
c_code/2_6/llstream.o \
c_code/2_6/nimconf.o \
c_code/2_6/main.o \
c_code/2_6/ast.o \
c_code/2_6/stdlib_intsets.o \
c_code/2_6/idgen.o \
c_code/2_6/astalgo.o \
c_code/2_6/rodutils.o \
c_code/2_6/syntaxes.o \
c_code/2_6/parser.o \
c_code/2_6/pbraces.o \
c_code/2_6/filters.o \
c_code/2_6/renderer.o \
c_code/2_6/filter_tmpl.o \
c_code/2_6/rodread.o \
c_code/2_6/types.o \
c_code/2_6/trees.o \
c_code/2_6/stdlib_memfiles.o \
c_code/2_6/rodwrite.o \
c_code/2_6/passes.o \
c_code/2_6/magicsys.o \
c_code/2_6/nimsets.o \
c_code/2_6/bitsets.o \
c_code/2_6/importer.o \
c_code/2_6/lookups.o \
c_code/2_6/semdata.o \
c_code/2_6/treetab.o \
c_code/2_6/vmdef.o \
c_code/2_6/prettybase.o \
c_code/2_6/stdlib_lexbase.o \
c_code/2_6/sem.o \
c_code/2_6/semfold.o \
c_code/2_6/saturate.o \
c_code/2_6/procfind.o \
c_code/2_6/pragmas.o \
c_code/2_6/semtypinst.o \
c_code/2_6/sigmatch.o \
c_code/2_6/parampatterns.o \
c_code/2_6/pretty.o \
c_code/2_6/docgen.o \
c_code/2_6/docutils_rstast.o \
c_code/2_6/stdlib_json.o \
c_code/2_6/stdlib_unicode.o \
c_code/2_6/docutils_rst.o \
c_code/2_6/docutils_rstgen.o \
c_code/2_6/docutils_highlite.o \
c_code/2_6/stdlib_sequtils.o \
c_code/2_6/stdlib_algorithm.o \
c_code/2_6/sempass2.o \
c_code/2_6/guards.o \
c_code/2_6/stdlib_xmltree.o \
c_code/2_6/stdlib_macros.o \
c_code/2_6/stdlib_cgi.o \
c_code/2_6/stdlib_cookies.o \
c_code/2_6/typesrenderer.o \
c_code/2_6/transf.o \
c_code/2_6/cgmeth.o \
c_code/2_6/lambdalifting.o \
c_code/2_6/lowerings.o \
c_code/2_6/vm.o \
c_code/2_6/vmgen.o \
c_code/2_6/vmdeps.o \
c_code/2_6/evaltempl.o \
c_code/2_6/aliases.o \
c_code/2_6/patterns.o \
c_code/2_6/semmacrosanity.o \
c_code/2_6/semparallel.o \
c_code/2_6/cgen.o \
c_code/2_6/ccgutils.o \
c_code/2_6/cgendata.o \
c_code/2_6/ccgmerge.o \
c_code/2_6/jsgen.o \
c_code/2_6/passaux.o \
c_code/2_6/depends.o \
c_code/2_6/docgen2.o \
c_code/2_6/service.o \
c_code/2_6/modules.o $LINK_FLAGS"
    $LINKER -o $binDir/nim  \
c_code/2_6/nim.o \
c_code/2_6/stdlib_system.o \
c_code/2_6/testability.o \
c_code/2_6/commands.o \
c_code/2_6/stdlib_os.o \
c_code/2_6/stdlib_strutils.o \
c_code/2_6/stdlib_parseutils.o \
c_code/2_6/stdlib_times.o \
c_code/2_6/stdlib_posix.o \
c_code/2_6/msgs.o \
c_code/2_6/options.o \
c_code/2_6/lists.o \
c_code/2_6/stdlib_strtabs.o \
c_code/2_6/stdlib_hashes.o \
c_code/2_6/stdlib_osproc.o \
c_code/2_6/stdlib_streams.o \
c_code/2_6/stdlib_cpuinfo.o \
c_code/2_6/stdlib_linux.o \
c_code/2_6/stdlib_sets.o \
c_code/2_6/stdlib_math.o \
c_code/2_6/stdlib_tables.o \
c_code/2_6/ropes.o \
c_code/2_6/platform.o \
c_code/2_6/crc.o \
c_code/2_6/stdlib_sockets.o \
c_code/2_6/stdlib_unsigned.o \
c_code/2_6/nversion.o \
c_code/2_6/condsyms.o \
c_code/2_6/idents.o \
c_code/2_6/extccomp.o \
c_code/2_6/wordrecg.o \
c_code/2_6/nimblecmd.o \
c_code/2_6/stdlib_parseopt.o \
c_code/2_6/lexer.o \
c_code/2_6/nimlexbase.o \
c_code/2_6/llstream.o \
c_code/2_6/nimconf.o \
c_code/2_6/main.o \
c_code/2_6/ast.o \
c_code/2_6/stdlib_intsets.o \
c_code/2_6/idgen.o \
c_code/2_6/astalgo.o \
c_code/2_6/rodutils.o \
c_code/2_6/syntaxes.o \
c_code/2_6/parser.o \
c_code/2_6/pbraces.o \
c_code/2_6/filters.o \
c_code/2_6/renderer.o \
c_code/2_6/filter_tmpl.o \
c_code/2_6/rodread.o \
c_code/2_6/types.o \
c_code/2_6/trees.o \
c_code/2_6/stdlib_memfiles.o \
c_code/2_6/rodwrite.o \
c_code/2_6/passes.o \
c_code/2_6/magicsys.o \
c_code/2_6/nimsets.o \
c_code/2_6/bitsets.o \
c_code/2_6/importer.o \
c_code/2_6/lookups.o \
c_code/2_6/semdata.o \
c_code/2_6/treetab.o \
c_code/2_6/vmdef.o \
c_code/2_6/prettybase.o \
c_code/2_6/stdlib_lexbase.o \
c_code/2_6/sem.o \
c_code/2_6/semfold.o \
c_code/2_6/saturate.o \
c_code/2_6/procfind.o \
c_code/2_6/pragmas.o \
c_code/2_6/semtypinst.o \
c_code/2_6/sigmatch.o \
c_code/2_6/parampatterns.o \
c_code/2_6/pretty.o \
c_code/2_6/docgen.o \
c_code/2_6/docutils_rstast.o \
c_code/2_6/stdlib_json.o \
c_code/2_6/stdlib_unicode.o \
c_code/2_6/docutils_rst.o \
c_code/2_6/docutils_rstgen.o \
c_code/2_6/docutils_highlite.o \
c_code/2_6/stdlib_sequtils.o \
c_code/2_6/stdlib_algorithm.o \
c_code/2_6/sempass2.o \
c_code/2_6/guards.o \
c_code/2_6/stdlib_xmltree.o \
c_code/2_6/stdlib_macros.o \
c_code/2_6/stdlib_cgi.o \
c_code/2_6/stdlib_cookies.o \
c_code/2_6/typesrenderer.o \
c_code/2_6/transf.o \
c_code/2_6/cgmeth.o \
c_code/2_6/lambdalifting.o \
c_code/2_6/lowerings.o \
c_code/2_6/vm.o \
c_code/2_6/vmgen.o \
c_code/2_6/vmdeps.o \
c_code/2_6/evaltempl.o \
c_code/2_6/aliases.o \
c_code/2_6/patterns.o \
c_code/2_6/semmacrosanity.o \
c_code/2_6/semparallel.o \
c_code/2_6/cgen.o \
c_code/2_6/ccgutils.o \
c_code/2_6/cgendata.o \
c_code/2_6/ccgmerge.o \
c_code/2_6/jsgen.o \
c_code/2_6/passaux.o \
c_code/2_6/depends.o \
c_code/2_6/docgen2.o \
c_code/2_6/service.o \
c_code/2_6/modules.o $LINK_FLAGS
    ;;
  powerpc)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/nim.c -o c_code/2_7/nim.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/nim.c -o c_code/2_7/nim.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_system.c -o c_code/2_7/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_system.c -o c_code/2_7/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/testability.c -o c_code/2_7/testability.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/testability.c -o c_code/2_7/testability.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/commands.c -o c_code/2_7/commands.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/commands.c -o c_code/2_7/commands.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_os.c -o c_code/2_7/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_os.c -o c_code/2_7/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_strutils.c -o c_code/2_7/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_strutils.c -o c_code/2_7/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_parseutils.c -o c_code/2_7/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_parseutils.c -o c_code/2_7/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_times.c -o c_code/2_7/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_times.c -o c_code/2_7/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_posix.c -o c_code/2_7/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_posix.c -o c_code/2_7/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/msgs.c -o c_code/2_7/msgs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/msgs.c -o c_code/2_7/msgs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/options.c -o c_code/2_7/options.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/options.c -o c_code/2_7/options.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/lists.c -o c_code/2_7/lists.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/lists.c -o c_code/2_7/lists.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_strtabs.c -o c_code/2_7/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_strtabs.c -o c_code/2_7/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_hashes.c -o c_code/2_7/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_hashes.c -o c_code/2_7/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_osproc.c -o c_code/2_7/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_osproc.c -o c_code/2_7/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_streams.c -o c_code/2_7/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_streams.c -o c_code/2_7/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_cpuinfo.c -o c_code/2_7/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_cpuinfo.c -o c_code/2_7/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_linux.c -o c_code/2_7/stdlib_linux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_linux.c -o c_code/2_7/stdlib_linux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_sets.c -o c_code/2_7/stdlib_sets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_sets.c -o c_code/2_7/stdlib_sets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_math.c -o c_code/2_7/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_math.c -o c_code/2_7/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_tables.c -o c_code/2_7/stdlib_tables.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_tables.c -o c_code/2_7/stdlib_tables.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/ropes.c -o c_code/2_7/ropes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/ropes.c -o c_code/2_7/ropes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/platform.c -o c_code/2_7/platform.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/platform.c -o c_code/2_7/platform.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/crc.c -o c_code/2_7/crc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/crc.c -o c_code/2_7/crc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_sockets.c -o c_code/2_7/stdlib_sockets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_sockets.c -o c_code/2_7/stdlib_sockets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_unsigned.c -o c_code/2_7/stdlib_unsigned.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_unsigned.c -o c_code/2_7/stdlib_unsigned.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/nversion.c -o c_code/2_7/nversion.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/nversion.c -o c_code/2_7/nversion.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/condsyms.c -o c_code/2_7/condsyms.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/condsyms.c -o c_code/2_7/condsyms.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/idents.c -o c_code/2_7/idents.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/idents.c -o c_code/2_7/idents.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/extccomp.c -o c_code/2_7/extccomp.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/extccomp.c -o c_code/2_7/extccomp.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/wordrecg.c -o c_code/2_7/wordrecg.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/wordrecg.c -o c_code/2_7/wordrecg.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/nimblecmd.c -o c_code/2_7/nimblecmd.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/nimblecmd.c -o c_code/2_7/nimblecmd.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_parseopt.c -o c_code/2_7/stdlib_parseopt.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_parseopt.c -o c_code/2_7/stdlib_parseopt.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/lexer.c -o c_code/2_7/lexer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/lexer.c -o c_code/2_7/lexer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/nimlexbase.c -o c_code/2_7/nimlexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/nimlexbase.c -o c_code/2_7/nimlexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/llstream.c -o c_code/2_7/llstream.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/llstream.c -o c_code/2_7/llstream.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/nimconf.c -o c_code/2_7/nimconf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/nimconf.c -o c_code/2_7/nimconf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/main.c -o c_code/2_7/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/main.c -o c_code/2_7/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/ast.c -o c_code/2_7/ast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/ast.c -o c_code/2_7/ast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_intsets.c -o c_code/2_7/stdlib_intsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_intsets.c -o c_code/2_7/stdlib_intsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/idgen.c -o c_code/2_7/idgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/idgen.c -o c_code/2_7/idgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/astalgo.c -o c_code/2_7/astalgo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/astalgo.c -o c_code/2_7/astalgo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/rodutils.c -o c_code/2_7/rodutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/rodutils.c -o c_code/2_7/rodutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/syntaxes.c -o c_code/2_7/syntaxes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/syntaxes.c -o c_code/2_7/syntaxes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/parser.c -o c_code/2_7/parser.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/parser.c -o c_code/2_7/parser.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/pbraces.c -o c_code/2_7/pbraces.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/pbraces.c -o c_code/2_7/pbraces.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/filters.c -o c_code/2_7/filters.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/filters.c -o c_code/2_7/filters.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/renderer.c -o c_code/2_7/renderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/renderer.c -o c_code/2_7/renderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/filter_tmpl.c -o c_code/2_7/filter_tmpl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/filter_tmpl.c -o c_code/2_7/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/rodread.c -o c_code/2_7/rodread.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/rodread.c -o c_code/2_7/rodread.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/types.c -o c_code/2_7/types.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/types.c -o c_code/2_7/types.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/trees.c -o c_code/2_7/trees.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/trees.c -o c_code/2_7/trees.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_memfiles.c -o c_code/2_7/stdlib_memfiles.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_memfiles.c -o c_code/2_7/stdlib_memfiles.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/rodwrite.c -o c_code/2_7/rodwrite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/rodwrite.c -o c_code/2_7/rodwrite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/passes.c -o c_code/2_7/passes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/passes.c -o c_code/2_7/passes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/magicsys.c -o c_code/2_7/magicsys.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/magicsys.c -o c_code/2_7/magicsys.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/nimsets.c -o c_code/2_7/nimsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/nimsets.c -o c_code/2_7/nimsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/bitsets.c -o c_code/2_7/bitsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/bitsets.c -o c_code/2_7/bitsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/importer.c -o c_code/2_7/importer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/importer.c -o c_code/2_7/importer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/lookups.c -o c_code/2_7/lookups.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/lookups.c -o c_code/2_7/lookups.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/semdata.c -o c_code/2_7/semdata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/semdata.c -o c_code/2_7/semdata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/treetab.c -o c_code/2_7/treetab.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/treetab.c -o c_code/2_7/treetab.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/vmdef.c -o c_code/2_7/vmdef.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/vmdef.c -o c_code/2_7/vmdef.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/prettybase.c -o c_code/2_7/prettybase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/prettybase.c -o c_code/2_7/prettybase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_lexbase.c -o c_code/2_7/stdlib_lexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_lexbase.c -o c_code/2_7/stdlib_lexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/sem.c -o c_code/2_7/sem.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/sem.c -o c_code/2_7/sem.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/semfold.c -o c_code/2_7/semfold.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/semfold.c -o c_code/2_7/semfold.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/saturate.c -o c_code/2_7/saturate.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/saturate.c -o c_code/2_7/saturate.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/procfind.c -o c_code/2_7/procfind.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/procfind.c -o c_code/2_7/procfind.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/pragmas.c -o c_code/2_7/pragmas.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/pragmas.c -o c_code/2_7/pragmas.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/semtypinst.c -o c_code/2_7/semtypinst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/semtypinst.c -o c_code/2_7/semtypinst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/sigmatch.c -o c_code/2_7/sigmatch.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/sigmatch.c -o c_code/2_7/sigmatch.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/parampatterns.c -o c_code/2_7/parampatterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/parampatterns.c -o c_code/2_7/parampatterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/pretty.c -o c_code/2_7/pretty.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/pretty.c -o c_code/2_7/pretty.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/docgen.c -o c_code/2_7/docgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/docgen.c -o c_code/2_7/docgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/docutils_rstast.c -o c_code/2_7/docutils_rstast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/docutils_rstast.c -o c_code/2_7/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_json.c -o c_code/2_7/stdlib_json.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_json.c -o c_code/2_7/stdlib_json.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_unicode.c -o c_code/2_7/stdlib_unicode.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_unicode.c -o c_code/2_7/stdlib_unicode.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/docutils_rst.c -o c_code/2_7/docutils_rst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/docutils_rst.c -o c_code/2_7/docutils_rst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/docutils_rstgen.c -o c_code/2_7/docutils_rstgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/docutils_rstgen.c -o c_code/2_7/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/docutils_highlite.c -o c_code/2_7/docutils_highlite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/docutils_highlite.c -o c_code/2_7/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_sequtils.c -o c_code/2_7/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_sequtils.c -o c_code/2_7/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_algorithm.c -o c_code/2_7/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_algorithm.c -o c_code/2_7/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/sempass2.c -o c_code/2_7/sempass2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/sempass2.c -o c_code/2_7/sempass2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/guards.c -o c_code/2_7/guards.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/guards.c -o c_code/2_7/guards.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_xmltree.c -o c_code/2_7/stdlib_xmltree.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_xmltree.c -o c_code/2_7/stdlib_xmltree.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_macros.c -o c_code/2_7/stdlib_macros.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_macros.c -o c_code/2_7/stdlib_macros.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_cgi.c -o c_code/2_7/stdlib_cgi.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_cgi.c -o c_code/2_7/stdlib_cgi.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_cookies.c -o c_code/2_7/stdlib_cookies.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_cookies.c -o c_code/2_7/stdlib_cookies.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/typesrenderer.c -o c_code/2_7/typesrenderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/typesrenderer.c -o c_code/2_7/typesrenderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/transf.c -o c_code/2_7/transf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/transf.c -o c_code/2_7/transf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/cgmeth.c -o c_code/2_7/cgmeth.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/cgmeth.c -o c_code/2_7/cgmeth.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/lambdalifting.c -o c_code/2_7/lambdalifting.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/lambdalifting.c -o c_code/2_7/lambdalifting.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/lowerings.c -o c_code/2_7/lowerings.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/lowerings.c -o c_code/2_7/lowerings.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/vm.c -o c_code/2_7/vm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/vm.c -o c_code/2_7/vm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/vmgen.c -o c_code/2_7/vmgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/vmgen.c -o c_code/2_7/vmgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/vmdeps.c -o c_code/2_7/vmdeps.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/vmdeps.c -o c_code/2_7/vmdeps.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/evaltempl.c -o c_code/2_7/evaltempl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/evaltempl.c -o c_code/2_7/evaltempl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/aliases.c -o c_code/2_7/aliases.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/aliases.c -o c_code/2_7/aliases.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/patterns.c -o c_code/2_7/patterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/patterns.c -o c_code/2_7/patterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/semmacrosanity.c -o c_code/2_7/semmacrosanity.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/semmacrosanity.c -o c_code/2_7/semmacrosanity.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/semparallel.c -o c_code/2_7/semparallel.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/semparallel.c -o c_code/2_7/semparallel.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/cgen.c -o c_code/2_7/cgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/cgen.c -o c_code/2_7/cgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/ccgutils.c -o c_code/2_7/ccgutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/ccgutils.c -o c_code/2_7/ccgutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/cgendata.c -o c_code/2_7/cgendata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/cgendata.c -o c_code/2_7/cgendata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/ccgmerge.c -o c_code/2_7/ccgmerge.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/ccgmerge.c -o c_code/2_7/ccgmerge.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/jsgen.c -o c_code/2_7/jsgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/jsgen.c -o c_code/2_7/jsgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/passaux.c -o c_code/2_7/passaux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/passaux.c -o c_code/2_7/passaux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/depends.c -o c_code/2_7/depends.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/depends.c -o c_code/2_7/depends.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/docgen2.c -o c_code/2_7/docgen2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/docgen2.c -o c_code/2_7/docgen2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/service.c -o c_code/2_7/service.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/service.c -o c_code/2_7/service.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/modules.c -o c_code/2_7/modules.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/modules.c -o c_code/2_7/modules.o
    echo "$LINKER -o $binDir/nim  \
c_code/2_7/nim.o \
c_code/2_7/stdlib_system.o \
c_code/2_7/testability.o \
c_code/2_7/commands.o \
c_code/2_7/stdlib_os.o \
c_code/2_7/stdlib_strutils.o \
c_code/2_7/stdlib_parseutils.o \
c_code/2_7/stdlib_times.o \
c_code/2_7/stdlib_posix.o \
c_code/2_7/msgs.o \
c_code/2_7/options.o \
c_code/2_7/lists.o \
c_code/2_7/stdlib_strtabs.o \
c_code/2_7/stdlib_hashes.o \
c_code/2_7/stdlib_osproc.o \
c_code/2_7/stdlib_streams.o \
c_code/2_7/stdlib_cpuinfo.o \
c_code/2_7/stdlib_linux.o \
c_code/2_7/stdlib_sets.o \
c_code/2_7/stdlib_math.o \
c_code/2_7/stdlib_tables.o \
c_code/2_7/ropes.o \
c_code/2_7/platform.o \
c_code/2_7/crc.o \
c_code/2_7/stdlib_sockets.o \
c_code/2_7/stdlib_unsigned.o \
c_code/2_7/nversion.o \
c_code/2_7/condsyms.o \
c_code/2_7/idents.o \
c_code/2_7/extccomp.o \
c_code/2_7/wordrecg.o \
c_code/2_7/nimblecmd.o \
c_code/2_7/stdlib_parseopt.o \
c_code/2_7/lexer.o \
c_code/2_7/nimlexbase.o \
c_code/2_7/llstream.o \
c_code/2_7/nimconf.o \
c_code/2_7/main.o \
c_code/2_7/ast.o \
c_code/2_7/stdlib_intsets.o \
c_code/2_7/idgen.o \
c_code/2_7/astalgo.o \
c_code/2_7/rodutils.o \
c_code/2_7/syntaxes.o \
c_code/2_7/parser.o \
c_code/2_7/pbraces.o \
c_code/2_7/filters.o \
c_code/2_7/renderer.o \
c_code/2_7/filter_tmpl.o \
c_code/2_7/rodread.o \
c_code/2_7/types.o \
c_code/2_7/trees.o \
c_code/2_7/stdlib_memfiles.o \
c_code/2_7/rodwrite.o \
c_code/2_7/passes.o \
c_code/2_7/magicsys.o \
c_code/2_7/nimsets.o \
c_code/2_7/bitsets.o \
c_code/2_7/importer.o \
c_code/2_7/lookups.o \
c_code/2_7/semdata.o \
c_code/2_7/treetab.o \
c_code/2_7/vmdef.o \
c_code/2_7/prettybase.o \
c_code/2_7/stdlib_lexbase.o \
c_code/2_7/sem.o \
c_code/2_7/semfold.o \
c_code/2_7/saturate.o \
c_code/2_7/procfind.o \
c_code/2_7/pragmas.o \
c_code/2_7/semtypinst.o \
c_code/2_7/sigmatch.o \
c_code/2_7/parampatterns.o \
c_code/2_7/pretty.o \
c_code/2_7/docgen.o \
c_code/2_7/docutils_rstast.o \
c_code/2_7/stdlib_json.o \
c_code/2_7/stdlib_unicode.o \
c_code/2_7/docutils_rst.o \
c_code/2_7/docutils_rstgen.o \
c_code/2_7/docutils_highlite.o \
c_code/2_7/stdlib_sequtils.o \
c_code/2_7/stdlib_algorithm.o \
c_code/2_7/sempass2.o \
c_code/2_7/guards.o \
c_code/2_7/stdlib_xmltree.o \
c_code/2_7/stdlib_macros.o \
c_code/2_7/stdlib_cgi.o \
c_code/2_7/stdlib_cookies.o \
c_code/2_7/typesrenderer.o \
c_code/2_7/transf.o \
c_code/2_7/cgmeth.o \
c_code/2_7/lambdalifting.o \
c_code/2_7/lowerings.o \
c_code/2_7/vm.o \
c_code/2_7/vmgen.o \
c_code/2_7/vmdeps.o \
c_code/2_7/evaltempl.o \
c_code/2_7/aliases.o \
c_code/2_7/patterns.o \
c_code/2_7/semmacrosanity.o \
c_code/2_7/semparallel.o \
c_code/2_7/cgen.o \
c_code/2_7/ccgutils.o \
c_code/2_7/cgendata.o \
c_code/2_7/ccgmerge.o \
c_code/2_7/jsgen.o \
c_code/2_7/passaux.o \
c_code/2_7/depends.o \
c_code/2_7/docgen2.o \
c_code/2_7/service.o \
c_code/2_7/modules.o $LINK_FLAGS"
    $LINKER -o $binDir/nim  \
c_code/2_7/nim.o \
c_code/2_7/stdlib_system.o \
c_code/2_7/testability.o \
c_code/2_7/commands.o \
c_code/2_7/stdlib_os.o \
c_code/2_7/stdlib_strutils.o \
c_code/2_7/stdlib_parseutils.o \
c_code/2_7/stdlib_times.o \
c_code/2_7/stdlib_posix.o \
c_code/2_7/msgs.o \
c_code/2_7/options.o \
c_code/2_7/lists.o \
c_code/2_7/stdlib_strtabs.o \
c_code/2_7/stdlib_hashes.o \
c_code/2_7/stdlib_osproc.o \
c_code/2_7/stdlib_streams.o \
c_code/2_7/stdlib_cpuinfo.o \
c_code/2_7/stdlib_linux.o \
c_code/2_7/stdlib_sets.o \
c_code/2_7/stdlib_math.o \
c_code/2_7/stdlib_tables.o \
c_code/2_7/ropes.o \
c_code/2_7/platform.o \
c_code/2_7/crc.o \
c_code/2_7/stdlib_sockets.o \
c_code/2_7/stdlib_unsigned.o \
c_code/2_7/nversion.o \
c_code/2_7/condsyms.o \
c_code/2_7/idents.o \
c_code/2_7/extccomp.o \
c_code/2_7/wordrecg.o \
c_code/2_7/nimblecmd.o \
c_code/2_7/stdlib_parseopt.o \
c_code/2_7/lexer.o \
c_code/2_7/nimlexbase.o \
c_code/2_7/llstream.o \
c_code/2_7/nimconf.o \
c_code/2_7/main.o \
c_code/2_7/ast.o \
c_code/2_7/stdlib_intsets.o \
c_code/2_7/idgen.o \
c_code/2_7/astalgo.o \
c_code/2_7/rodutils.o \
c_code/2_7/syntaxes.o \
c_code/2_7/parser.o \
c_code/2_7/pbraces.o \
c_code/2_7/filters.o \
c_code/2_7/renderer.o \
c_code/2_7/filter_tmpl.o \
c_code/2_7/rodread.o \
c_code/2_7/types.o \
c_code/2_7/trees.o \
c_code/2_7/stdlib_memfiles.o \
c_code/2_7/rodwrite.o \
c_code/2_7/passes.o \
c_code/2_7/magicsys.o \
c_code/2_7/nimsets.o \
c_code/2_7/bitsets.o \
c_code/2_7/importer.o \
c_code/2_7/lookups.o \
c_code/2_7/semdata.o \
c_code/2_7/treetab.o \
c_code/2_7/vmdef.o \
c_code/2_7/prettybase.o \
c_code/2_7/stdlib_lexbase.o \
c_code/2_7/sem.o \
c_code/2_7/semfold.o \
c_code/2_7/saturate.o \
c_code/2_7/procfind.o \
c_code/2_7/pragmas.o \
c_code/2_7/semtypinst.o \
c_code/2_7/sigmatch.o \
c_code/2_7/parampatterns.o \
c_code/2_7/pretty.o \
c_code/2_7/docgen.o \
c_code/2_7/docutils_rstast.o \
c_code/2_7/stdlib_json.o \
c_code/2_7/stdlib_unicode.o \
c_code/2_7/docutils_rst.o \
c_code/2_7/docutils_rstgen.o \
c_code/2_7/docutils_highlite.o \
c_code/2_7/stdlib_sequtils.o \
c_code/2_7/stdlib_algorithm.o \
c_code/2_7/sempass2.o \
c_code/2_7/guards.o \
c_code/2_7/stdlib_xmltree.o \
c_code/2_7/stdlib_macros.o \
c_code/2_7/stdlib_cgi.o \
c_code/2_7/stdlib_cookies.o \
c_code/2_7/typesrenderer.o \
c_code/2_7/transf.o \
c_code/2_7/cgmeth.o \
c_code/2_7/lambdalifting.o \
c_code/2_7/lowerings.o \
c_code/2_7/vm.o \
c_code/2_7/vmgen.o \
c_code/2_7/vmdeps.o \
c_code/2_7/evaltempl.o \
c_code/2_7/aliases.o \
c_code/2_7/patterns.o \
c_code/2_7/semmacrosanity.o \
c_code/2_7/semparallel.o \
c_code/2_7/cgen.o \
c_code/2_7/ccgutils.o \
c_code/2_7/cgendata.o \
c_code/2_7/ccgmerge.o \
c_code/2_7/jsgen.o \
c_code/2_7/passaux.o \
c_code/2_7/depends.o \
c_code/2_7/docgen2.o \
c_code/2_7/service.o \
c_code/2_7/modules.o $LINK_FLAGS
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
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/nim.c -o c_code/3_1/nim.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/nim.c -o c_code/3_1/nim.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_system.c -o c_code/3_1/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_system.c -o c_code/3_1/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/testability.c -o c_code/3_1/testability.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/testability.c -o c_code/3_1/testability.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/commands.c -o c_code/3_1/commands.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/commands.c -o c_code/3_1/commands.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_os.c -o c_code/3_1/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_os.c -o c_code/3_1/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_strutils.c -o c_code/3_1/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_strutils.c -o c_code/3_1/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_parseutils.c -o c_code/3_1/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_parseutils.c -o c_code/3_1/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_times.c -o c_code/3_1/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_times.c -o c_code/3_1/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_posix.c -o c_code/3_1/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_posix.c -o c_code/3_1/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/msgs.c -o c_code/3_1/msgs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/msgs.c -o c_code/3_1/msgs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/options.c -o c_code/3_1/options.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/options.c -o c_code/3_1/options.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/lists.c -o c_code/3_1/lists.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/lists.c -o c_code/3_1/lists.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_strtabs.c -o c_code/3_1/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_strtabs.c -o c_code/3_1/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_hashes.c -o c_code/3_1/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_hashes.c -o c_code/3_1/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_osproc.c -o c_code/3_1/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_osproc.c -o c_code/3_1/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_streams.c -o c_code/3_1/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_streams.c -o c_code/3_1/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_cpuinfo.c -o c_code/3_1/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_cpuinfo.c -o c_code/3_1/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_sets.c -o c_code/3_1/stdlib_sets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_sets.c -o c_code/3_1/stdlib_sets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_math.c -o c_code/3_1/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_math.c -o c_code/3_1/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_tables.c -o c_code/3_1/stdlib_tables.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_tables.c -o c_code/3_1/stdlib_tables.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/ropes.c -o c_code/3_1/ropes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/ropes.c -o c_code/3_1/ropes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/platform.c -o c_code/3_1/platform.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/platform.c -o c_code/3_1/platform.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/crc.c -o c_code/3_1/crc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/crc.c -o c_code/3_1/crc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_sockets.c -o c_code/3_1/stdlib_sockets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_sockets.c -o c_code/3_1/stdlib_sockets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_unsigned.c -o c_code/3_1/stdlib_unsigned.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_unsigned.c -o c_code/3_1/stdlib_unsigned.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/nversion.c -o c_code/3_1/nversion.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/nversion.c -o c_code/3_1/nversion.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/condsyms.c -o c_code/3_1/condsyms.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/condsyms.c -o c_code/3_1/condsyms.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/idents.c -o c_code/3_1/idents.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/idents.c -o c_code/3_1/idents.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/extccomp.c -o c_code/3_1/extccomp.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/extccomp.c -o c_code/3_1/extccomp.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/wordrecg.c -o c_code/3_1/wordrecg.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/wordrecg.c -o c_code/3_1/wordrecg.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/nimblecmd.c -o c_code/3_1/nimblecmd.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/nimblecmd.c -o c_code/3_1/nimblecmd.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_parseopt.c -o c_code/3_1/stdlib_parseopt.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_parseopt.c -o c_code/3_1/stdlib_parseopt.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/lexer.c -o c_code/3_1/lexer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/lexer.c -o c_code/3_1/lexer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/nimlexbase.c -o c_code/3_1/nimlexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/nimlexbase.c -o c_code/3_1/nimlexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/llstream.c -o c_code/3_1/llstream.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/llstream.c -o c_code/3_1/llstream.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/nimconf.c -o c_code/3_1/nimconf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/nimconf.c -o c_code/3_1/nimconf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/main.c -o c_code/3_1/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/main.c -o c_code/3_1/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/ast.c -o c_code/3_1/ast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/ast.c -o c_code/3_1/ast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_intsets.c -o c_code/3_1/stdlib_intsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_intsets.c -o c_code/3_1/stdlib_intsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/idgen.c -o c_code/3_1/idgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/idgen.c -o c_code/3_1/idgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/astalgo.c -o c_code/3_1/astalgo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/astalgo.c -o c_code/3_1/astalgo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/rodutils.c -o c_code/3_1/rodutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/rodutils.c -o c_code/3_1/rodutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/syntaxes.c -o c_code/3_1/syntaxes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/syntaxes.c -o c_code/3_1/syntaxes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/parser.c -o c_code/3_1/parser.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/parser.c -o c_code/3_1/parser.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/pbraces.c -o c_code/3_1/pbraces.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/pbraces.c -o c_code/3_1/pbraces.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/filters.c -o c_code/3_1/filters.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/filters.c -o c_code/3_1/filters.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/renderer.c -o c_code/3_1/renderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/renderer.c -o c_code/3_1/renderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/filter_tmpl.c -o c_code/3_1/filter_tmpl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/filter_tmpl.c -o c_code/3_1/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/rodread.c -o c_code/3_1/rodread.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/rodread.c -o c_code/3_1/rodread.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/types.c -o c_code/3_1/types.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/types.c -o c_code/3_1/types.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/trees.c -o c_code/3_1/trees.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/trees.c -o c_code/3_1/trees.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_memfiles.c -o c_code/3_1/stdlib_memfiles.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_memfiles.c -o c_code/3_1/stdlib_memfiles.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/rodwrite.c -o c_code/3_1/rodwrite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/rodwrite.c -o c_code/3_1/rodwrite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/passes.c -o c_code/3_1/passes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/passes.c -o c_code/3_1/passes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/magicsys.c -o c_code/3_1/magicsys.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/magicsys.c -o c_code/3_1/magicsys.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/nimsets.c -o c_code/3_1/nimsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/nimsets.c -o c_code/3_1/nimsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/bitsets.c -o c_code/3_1/bitsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/bitsets.c -o c_code/3_1/bitsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/importer.c -o c_code/3_1/importer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/importer.c -o c_code/3_1/importer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/lookups.c -o c_code/3_1/lookups.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/lookups.c -o c_code/3_1/lookups.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/semdata.c -o c_code/3_1/semdata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/semdata.c -o c_code/3_1/semdata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/treetab.c -o c_code/3_1/treetab.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/treetab.c -o c_code/3_1/treetab.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/vmdef.c -o c_code/3_1/vmdef.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/vmdef.c -o c_code/3_1/vmdef.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/prettybase.c -o c_code/3_1/prettybase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/prettybase.c -o c_code/3_1/prettybase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_lexbase.c -o c_code/3_1/stdlib_lexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_lexbase.c -o c_code/3_1/stdlib_lexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/sem.c -o c_code/3_1/sem.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/sem.c -o c_code/3_1/sem.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/semfold.c -o c_code/3_1/semfold.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/semfold.c -o c_code/3_1/semfold.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/saturate.c -o c_code/3_1/saturate.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/saturate.c -o c_code/3_1/saturate.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/procfind.c -o c_code/3_1/procfind.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/procfind.c -o c_code/3_1/procfind.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/pragmas.c -o c_code/3_1/pragmas.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/pragmas.c -o c_code/3_1/pragmas.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/semtypinst.c -o c_code/3_1/semtypinst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/semtypinst.c -o c_code/3_1/semtypinst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/sigmatch.c -o c_code/3_1/sigmatch.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/sigmatch.c -o c_code/3_1/sigmatch.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/parampatterns.c -o c_code/3_1/parampatterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/parampatterns.c -o c_code/3_1/parampatterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/pretty.c -o c_code/3_1/pretty.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/pretty.c -o c_code/3_1/pretty.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/docgen.c -o c_code/3_1/docgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/docgen.c -o c_code/3_1/docgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/docutils_rstast.c -o c_code/3_1/docutils_rstast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/docutils_rstast.c -o c_code/3_1/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_json.c -o c_code/3_1/stdlib_json.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_json.c -o c_code/3_1/stdlib_json.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_unicode.c -o c_code/3_1/stdlib_unicode.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_unicode.c -o c_code/3_1/stdlib_unicode.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/docutils_rst.c -o c_code/3_1/docutils_rst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/docutils_rst.c -o c_code/3_1/docutils_rst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/docutils_rstgen.c -o c_code/3_1/docutils_rstgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/docutils_rstgen.c -o c_code/3_1/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/docutils_highlite.c -o c_code/3_1/docutils_highlite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/docutils_highlite.c -o c_code/3_1/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_sequtils.c -o c_code/3_1/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_sequtils.c -o c_code/3_1/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_algorithm.c -o c_code/3_1/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_algorithm.c -o c_code/3_1/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/sempass2.c -o c_code/3_1/sempass2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/sempass2.c -o c_code/3_1/sempass2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/guards.c -o c_code/3_1/guards.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/guards.c -o c_code/3_1/guards.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_xmltree.c -o c_code/3_1/stdlib_xmltree.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_xmltree.c -o c_code/3_1/stdlib_xmltree.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_macros.c -o c_code/3_1/stdlib_macros.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_macros.c -o c_code/3_1/stdlib_macros.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_cgi.c -o c_code/3_1/stdlib_cgi.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_cgi.c -o c_code/3_1/stdlib_cgi.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_cookies.c -o c_code/3_1/stdlib_cookies.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_cookies.c -o c_code/3_1/stdlib_cookies.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/typesrenderer.c -o c_code/3_1/typesrenderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/typesrenderer.c -o c_code/3_1/typesrenderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/transf.c -o c_code/3_1/transf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/transf.c -o c_code/3_1/transf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/cgmeth.c -o c_code/3_1/cgmeth.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/cgmeth.c -o c_code/3_1/cgmeth.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/lambdalifting.c -o c_code/3_1/lambdalifting.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/lambdalifting.c -o c_code/3_1/lambdalifting.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/lowerings.c -o c_code/3_1/lowerings.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/lowerings.c -o c_code/3_1/lowerings.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/vm.c -o c_code/3_1/vm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/vm.c -o c_code/3_1/vm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/vmgen.c -o c_code/3_1/vmgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/vmgen.c -o c_code/3_1/vmgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/vmdeps.c -o c_code/3_1/vmdeps.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/vmdeps.c -o c_code/3_1/vmdeps.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/evaltempl.c -o c_code/3_1/evaltempl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/evaltempl.c -o c_code/3_1/evaltempl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/aliases.c -o c_code/3_1/aliases.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/aliases.c -o c_code/3_1/aliases.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/patterns.c -o c_code/3_1/patterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/patterns.c -o c_code/3_1/patterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/semmacrosanity.c -o c_code/3_1/semmacrosanity.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/semmacrosanity.c -o c_code/3_1/semmacrosanity.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/semparallel.c -o c_code/3_1/semparallel.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/semparallel.c -o c_code/3_1/semparallel.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/cgen.c -o c_code/3_1/cgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/cgen.c -o c_code/3_1/cgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/ccgutils.c -o c_code/3_1/ccgutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/ccgutils.c -o c_code/3_1/ccgutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/cgendata.c -o c_code/3_1/cgendata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/cgendata.c -o c_code/3_1/cgendata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/ccgmerge.c -o c_code/3_1/ccgmerge.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/ccgmerge.c -o c_code/3_1/ccgmerge.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/jsgen.c -o c_code/3_1/jsgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/jsgen.c -o c_code/3_1/jsgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/passaux.c -o c_code/3_1/passaux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/passaux.c -o c_code/3_1/passaux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/depends.c -o c_code/3_1/depends.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/depends.c -o c_code/3_1/depends.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/docgen2.c -o c_code/3_1/docgen2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/docgen2.c -o c_code/3_1/docgen2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/service.c -o c_code/3_1/service.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/service.c -o c_code/3_1/service.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/modules.c -o c_code/3_1/modules.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/modules.c -o c_code/3_1/modules.o
    echo "$LINKER -o $binDir/nim  \
c_code/3_1/nim.o \
c_code/3_1/stdlib_system.o \
c_code/3_1/testability.o \
c_code/3_1/commands.o \
c_code/3_1/stdlib_os.o \
c_code/3_1/stdlib_strutils.o \
c_code/3_1/stdlib_parseutils.o \
c_code/3_1/stdlib_times.o \
c_code/3_1/stdlib_posix.o \
c_code/3_1/msgs.o \
c_code/3_1/options.o \
c_code/3_1/lists.o \
c_code/3_1/stdlib_strtabs.o \
c_code/3_1/stdlib_hashes.o \
c_code/3_1/stdlib_osproc.o \
c_code/3_1/stdlib_streams.o \
c_code/3_1/stdlib_cpuinfo.o \
c_code/3_1/stdlib_sets.o \
c_code/3_1/stdlib_math.o \
c_code/3_1/stdlib_tables.o \
c_code/3_1/ropes.o \
c_code/3_1/platform.o \
c_code/3_1/crc.o \
c_code/3_1/stdlib_sockets.o \
c_code/3_1/stdlib_unsigned.o \
c_code/3_1/nversion.o \
c_code/3_1/condsyms.o \
c_code/3_1/idents.o \
c_code/3_1/extccomp.o \
c_code/3_1/wordrecg.o \
c_code/3_1/nimblecmd.o \
c_code/3_1/stdlib_parseopt.o \
c_code/3_1/lexer.o \
c_code/3_1/nimlexbase.o \
c_code/3_1/llstream.o \
c_code/3_1/nimconf.o \
c_code/3_1/main.o \
c_code/3_1/ast.o \
c_code/3_1/stdlib_intsets.o \
c_code/3_1/idgen.o \
c_code/3_1/astalgo.o \
c_code/3_1/rodutils.o \
c_code/3_1/syntaxes.o \
c_code/3_1/parser.o \
c_code/3_1/pbraces.o \
c_code/3_1/filters.o \
c_code/3_1/renderer.o \
c_code/3_1/filter_tmpl.o \
c_code/3_1/rodread.o \
c_code/3_1/types.o \
c_code/3_1/trees.o \
c_code/3_1/stdlib_memfiles.o \
c_code/3_1/rodwrite.o \
c_code/3_1/passes.o \
c_code/3_1/magicsys.o \
c_code/3_1/nimsets.o \
c_code/3_1/bitsets.o \
c_code/3_1/importer.o \
c_code/3_1/lookups.o \
c_code/3_1/semdata.o \
c_code/3_1/treetab.o \
c_code/3_1/vmdef.o \
c_code/3_1/prettybase.o \
c_code/3_1/stdlib_lexbase.o \
c_code/3_1/sem.o \
c_code/3_1/semfold.o \
c_code/3_1/saturate.o \
c_code/3_1/procfind.o \
c_code/3_1/pragmas.o \
c_code/3_1/semtypinst.o \
c_code/3_1/sigmatch.o \
c_code/3_1/parampatterns.o \
c_code/3_1/pretty.o \
c_code/3_1/docgen.o \
c_code/3_1/docutils_rstast.o \
c_code/3_1/stdlib_json.o \
c_code/3_1/stdlib_unicode.o \
c_code/3_1/docutils_rst.o \
c_code/3_1/docutils_rstgen.o \
c_code/3_1/docutils_highlite.o \
c_code/3_1/stdlib_sequtils.o \
c_code/3_1/stdlib_algorithm.o \
c_code/3_1/sempass2.o \
c_code/3_1/guards.o \
c_code/3_1/stdlib_xmltree.o \
c_code/3_1/stdlib_macros.o \
c_code/3_1/stdlib_cgi.o \
c_code/3_1/stdlib_cookies.o \
c_code/3_1/typesrenderer.o \
c_code/3_1/transf.o \
c_code/3_1/cgmeth.o \
c_code/3_1/lambdalifting.o \
c_code/3_1/lowerings.o \
c_code/3_1/vm.o \
c_code/3_1/vmgen.o \
c_code/3_1/vmdeps.o \
c_code/3_1/evaltempl.o \
c_code/3_1/aliases.o \
c_code/3_1/patterns.o \
c_code/3_1/semmacrosanity.o \
c_code/3_1/semparallel.o \
c_code/3_1/cgen.o \
c_code/3_1/ccgutils.o \
c_code/3_1/cgendata.o \
c_code/3_1/ccgmerge.o \
c_code/3_1/jsgen.o \
c_code/3_1/passaux.o \
c_code/3_1/depends.o \
c_code/3_1/docgen2.o \
c_code/3_1/service.o \
c_code/3_1/modules.o $LINK_FLAGS"
    $LINKER -o $binDir/nim  \
c_code/3_1/nim.o \
c_code/3_1/stdlib_system.o \
c_code/3_1/testability.o \
c_code/3_1/commands.o \
c_code/3_1/stdlib_os.o \
c_code/3_1/stdlib_strutils.o \
c_code/3_1/stdlib_parseutils.o \
c_code/3_1/stdlib_times.o \
c_code/3_1/stdlib_posix.o \
c_code/3_1/msgs.o \
c_code/3_1/options.o \
c_code/3_1/lists.o \
c_code/3_1/stdlib_strtabs.o \
c_code/3_1/stdlib_hashes.o \
c_code/3_1/stdlib_osproc.o \
c_code/3_1/stdlib_streams.o \
c_code/3_1/stdlib_cpuinfo.o \
c_code/3_1/stdlib_sets.o \
c_code/3_1/stdlib_math.o \
c_code/3_1/stdlib_tables.o \
c_code/3_1/ropes.o \
c_code/3_1/platform.o \
c_code/3_1/crc.o \
c_code/3_1/stdlib_sockets.o \
c_code/3_1/stdlib_unsigned.o \
c_code/3_1/nversion.o \
c_code/3_1/condsyms.o \
c_code/3_1/idents.o \
c_code/3_1/extccomp.o \
c_code/3_1/wordrecg.o \
c_code/3_1/nimblecmd.o \
c_code/3_1/stdlib_parseopt.o \
c_code/3_1/lexer.o \
c_code/3_1/nimlexbase.o \
c_code/3_1/llstream.o \
c_code/3_1/nimconf.o \
c_code/3_1/main.o \
c_code/3_1/ast.o \
c_code/3_1/stdlib_intsets.o \
c_code/3_1/idgen.o \
c_code/3_1/astalgo.o \
c_code/3_1/rodutils.o \
c_code/3_1/syntaxes.o \
c_code/3_1/parser.o \
c_code/3_1/pbraces.o \
c_code/3_1/filters.o \
c_code/3_1/renderer.o \
c_code/3_1/filter_tmpl.o \
c_code/3_1/rodread.o \
c_code/3_1/types.o \
c_code/3_1/trees.o \
c_code/3_1/stdlib_memfiles.o \
c_code/3_1/rodwrite.o \
c_code/3_1/passes.o \
c_code/3_1/magicsys.o \
c_code/3_1/nimsets.o \
c_code/3_1/bitsets.o \
c_code/3_1/importer.o \
c_code/3_1/lookups.o \
c_code/3_1/semdata.o \
c_code/3_1/treetab.o \
c_code/3_1/vmdef.o \
c_code/3_1/prettybase.o \
c_code/3_1/stdlib_lexbase.o \
c_code/3_1/sem.o \
c_code/3_1/semfold.o \
c_code/3_1/saturate.o \
c_code/3_1/procfind.o \
c_code/3_1/pragmas.o \
c_code/3_1/semtypinst.o \
c_code/3_1/sigmatch.o \
c_code/3_1/parampatterns.o \
c_code/3_1/pretty.o \
c_code/3_1/docgen.o \
c_code/3_1/docutils_rstast.o \
c_code/3_1/stdlib_json.o \
c_code/3_1/stdlib_unicode.o \
c_code/3_1/docutils_rst.o \
c_code/3_1/docutils_rstgen.o \
c_code/3_1/docutils_highlite.o \
c_code/3_1/stdlib_sequtils.o \
c_code/3_1/stdlib_algorithm.o \
c_code/3_1/sempass2.o \
c_code/3_1/guards.o \
c_code/3_1/stdlib_xmltree.o \
c_code/3_1/stdlib_macros.o \
c_code/3_1/stdlib_cgi.o \
c_code/3_1/stdlib_cookies.o \
c_code/3_1/typesrenderer.o \
c_code/3_1/transf.o \
c_code/3_1/cgmeth.o \
c_code/3_1/lambdalifting.o \
c_code/3_1/lowerings.o \
c_code/3_1/vm.o \
c_code/3_1/vmgen.o \
c_code/3_1/vmdeps.o \
c_code/3_1/evaltempl.o \
c_code/3_1/aliases.o \
c_code/3_1/patterns.o \
c_code/3_1/semmacrosanity.o \
c_code/3_1/semparallel.o \
c_code/3_1/cgen.o \
c_code/3_1/ccgutils.o \
c_code/3_1/cgendata.o \
c_code/3_1/ccgmerge.o \
c_code/3_1/jsgen.o \
c_code/3_1/passaux.o \
c_code/3_1/depends.o \
c_code/3_1/docgen2.o \
c_code/3_1/service.o \
c_code/3_1/modules.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/nim.c -o c_code/3_2/nim.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/nim.c -o c_code/3_2/nim.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_system.c -o c_code/3_2/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_system.c -o c_code/3_2/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/testability.c -o c_code/3_2/testability.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/testability.c -o c_code/3_2/testability.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/commands.c -o c_code/3_2/commands.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/commands.c -o c_code/3_2/commands.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_os.c -o c_code/3_2/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_os.c -o c_code/3_2/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_strutils.c -o c_code/3_2/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_strutils.c -o c_code/3_2/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_parseutils.c -o c_code/3_2/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_parseutils.c -o c_code/3_2/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_times.c -o c_code/3_2/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_times.c -o c_code/3_2/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_posix.c -o c_code/3_2/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_posix.c -o c_code/3_2/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/msgs.c -o c_code/3_2/msgs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/msgs.c -o c_code/3_2/msgs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/options.c -o c_code/3_2/options.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/options.c -o c_code/3_2/options.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/lists.c -o c_code/3_2/lists.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/lists.c -o c_code/3_2/lists.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_strtabs.c -o c_code/3_2/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_strtabs.c -o c_code/3_2/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_hashes.c -o c_code/3_2/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_hashes.c -o c_code/3_2/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_osproc.c -o c_code/3_2/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_osproc.c -o c_code/3_2/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_streams.c -o c_code/3_2/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_streams.c -o c_code/3_2/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_cpuinfo.c -o c_code/3_2/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_cpuinfo.c -o c_code/3_2/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_sets.c -o c_code/3_2/stdlib_sets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_sets.c -o c_code/3_2/stdlib_sets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_math.c -o c_code/3_2/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_math.c -o c_code/3_2/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_tables.c -o c_code/3_2/stdlib_tables.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_tables.c -o c_code/3_2/stdlib_tables.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/ropes.c -o c_code/3_2/ropes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/ropes.c -o c_code/3_2/ropes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/platform.c -o c_code/3_2/platform.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/platform.c -o c_code/3_2/platform.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/crc.c -o c_code/3_2/crc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/crc.c -o c_code/3_2/crc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_sockets.c -o c_code/3_2/stdlib_sockets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_sockets.c -o c_code/3_2/stdlib_sockets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_unsigned.c -o c_code/3_2/stdlib_unsigned.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_unsigned.c -o c_code/3_2/stdlib_unsigned.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/nversion.c -o c_code/3_2/nversion.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/nversion.c -o c_code/3_2/nversion.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/condsyms.c -o c_code/3_2/condsyms.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/condsyms.c -o c_code/3_2/condsyms.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/idents.c -o c_code/3_2/idents.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/idents.c -o c_code/3_2/idents.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/extccomp.c -o c_code/3_2/extccomp.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/extccomp.c -o c_code/3_2/extccomp.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/wordrecg.c -o c_code/3_2/wordrecg.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/wordrecg.c -o c_code/3_2/wordrecg.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/nimblecmd.c -o c_code/3_2/nimblecmd.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/nimblecmd.c -o c_code/3_2/nimblecmd.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_parseopt.c -o c_code/3_2/stdlib_parseopt.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_parseopt.c -o c_code/3_2/stdlib_parseopt.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/lexer.c -o c_code/3_2/lexer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/lexer.c -o c_code/3_2/lexer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/nimlexbase.c -o c_code/3_2/nimlexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/nimlexbase.c -o c_code/3_2/nimlexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/llstream.c -o c_code/3_2/llstream.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/llstream.c -o c_code/3_2/llstream.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/nimconf.c -o c_code/3_2/nimconf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/nimconf.c -o c_code/3_2/nimconf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/main.c -o c_code/3_2/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/main.c -o c_code/3_2/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/ast.c -o c_code/3_2/ast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/ast.c -o c_code/3_2/ast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_intsets.c -o c_code/3_2/stdlib_intsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_intsets.c -o c_code/3_2/stdlib_intsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/idgen.c -o c_code/3_2/idgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/idgen.c -o c_code/3_2/idgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/astalgo.c -o c_code/3_2/astalgo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/astalgo.c -o c_code/3_2/astalgo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/rodutils.c -o c_code/3_2/rodutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/rodutils.c -o c_code/3_2/rodutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/syntaxes.c -o c_code/3_2/syntaxes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/syntaxes.c -o c_code/3_2/syntaxes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/parser.c -o c_code/3_2/parser.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/parser.c -o c_code/3_2/parser.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/pbraces.c -o c_code/3_2/pbraces.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/pbraces.c -o c_code/3_2/pbraces.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/filters.c -o c_code/3_2/filters.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/filters.c -o c_code/3_2/filters.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/renderer.c -o c_code/3_2/renderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/renderer.c -o c_code/3_2/renderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/filter_tmpl.c -o c_code/3_2/filter_tmpl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/filter_tmpl.c -o c_code/3_2/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/rodread.c -o c_code/3_2/rodread.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/rodread.c -o c_code/3_2/rodread.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/types.c -o c_code/3_2/types.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/types.c -o c_code/3_2/types.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/trees.c -o c_code/3_2/trees.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/trees.c -o c_code/3_2/trees.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_memfiles.c -o c_code/3_2/stdlib_memfiles.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_memfiles.c -o c_code/3_2/stdlib_memfiles.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/rodwrite.c -o c_code/3_2/rodwrite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/rodwrite.c -o c_code/3_2/rodwrite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/passes.c -o c_code/3_2/passes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/passes.c -o c_code/3_2/passes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/magicsys.c -o c_code/3_2/magicsys.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/magicsys.c -o c_code/3_2/magicsys.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/nimsets.c -o c_code/3_2/nimsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/nimsets.c -o c_code/3_2/nimsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/bitsets.c -o c_code/3_2/bitsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/bitsets.c -o c_code/3_2/bitsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/importer.c -o c_code/3_2/importer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/importer.c -o c_code/3_2/importer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/lookups.c -o c_code/3_2/lookups.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/lookups.c -o c_code/3_2/lookups.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/semdata.c -o c_code/3_2/semdata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/semdata.c -o c_code/3_2/semdata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/treetab.c -o c_code/3_2/treetab.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/treetab.c -o c_code/3_2/treetab.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/vmdef.c -o c_code/3_2/vmdef.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/vmdef.c -o c_code/3_2/vmdef.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/prettybase.c -o c_code/3_2/prettybase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/prettybase.c -o c_code/3_2/prettybase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_lexbase.c -o c_code/3_2/stdlib_lexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_lexbase.c -o c_code/3_2/stdlib_lexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/sem.c -o c_code/3_2/sem.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/sem.c -o c_code/3_2/sem.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/semfold.c -o c_code/3_2/semfold.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/semfold.c -o c_code/3_2/semfold.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/saturate.c -o c_code/3_2/saturate.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/saturate.c -o c_code/3_2/saturate.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/procfind.c -o c_code/3_2/procfind.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/procfind.c -o c_code/3_2/procfind.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/pragmas.c -o c_code/3_2/pragmas.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/pragmas.c -o c_code/3_2/pragmas.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/semtypinst.c -o c_code/3_2/semtypinst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/semtypinst.c -o c_code/3_2/semtypinst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/sigmatch.c -o c_code/3_2/sigmatch.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/sigmatch.c -o c_code/3_2/sigmatch.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/parampatterns.c -o c_code/3_2/parampatterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/parampatterns.c -o c_code/3_2/parampatterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/pretty.c -o c_code/3_2/pretty.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/pretty.c -o c_code/3_2/pretty.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/docgen.c -o c_code/3_2/docgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/docgen.c -o c_code/3_2/docgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/docutils_rstast.c -o c_code/3_2/docutils_rstast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/docutils_rstast.c -o c_code/3_2/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_json.c -o c_code/3_2/stdlib_json.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_json.c -o c_code/3_2/stdlib_json.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_unicode.c -o c_code/3_2/stdlib_unicode.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_unicode.c -o c_code/3_2/stdlib_unicode.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/docutils_rst.c -o c_code/3_2/docutils_rst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/docutils_rst.c -o c_code/3_2/docutils_rst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/docutils_rstgen.c -o c_code/3_2/docutils_rstgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/docutils_rstgen.c -o c_code/3_2/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/docutils_highlite.c -o c_code/3_2/docutils_highlite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/docutils_highlite.c -o c_code/3_2/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_sequtils.c -o c_code/3_2/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_sequtils.c -o c_code/3_2/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_algorithm.c -o c_code/3_2/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_algorithm.c -o c_code/3_2/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/sempass2.c -o c_code/3_2/sempass2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/sempass2.c -o c_code/3_2/sempass2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/guards.c -o c_code/3_2/guards.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/guards.c -o c_code/3_2/guards.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_xmltree.c -o c_code/3_2/stdlib_xmltree.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_xmltree.c -o c_code/3_2/stdlib_xmltree.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_macros.c -o c_code/3_2/stdlib_macros.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_macros.c -o c_code/3_2/stdlib_macros.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_cgi.c -o c_code/3_2/stdlib_cgi.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_cgi.c -o c_code/3_2/stdlib_cgi.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_cookies.c -o c_code/3_2/stdlib_cookies.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_cookies.c -o c_code/3_2/stdlib_cookies.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/typesrenderer.c -o c_code/3_2/typesrenderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/typesrenderer.c -o c_code/3_2/typesrenderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/transf.c -o c_code/3_2/transf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/transf.c -o c_code/3_2/transf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/cgmeth.c -o c_code/3_2/cgmeth.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/cgmeth.c -o c_code/3_2/cgmeth.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/lambdalifting.c -o c_code/3_2/lambdalifting.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/lambdalifting.c -o c_code/3_2/lambdalifting.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/lowerings.c -o c_code/3_2/lowerings.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/lowerings.c -o c_code/3_2/lowerings.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/vm.c -o c_code/3_2/vm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/vm.c -o c_code/3_2/vm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/vmgen.c -o c_code/3_2/vmgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/vmgen.c -o c_code/3_2/vmgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/vmdeps.c -o c_code/3_2/vmdeps.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/vmdeps.c -o c_code/3_2/vmdeps.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/evaltempl.c -o c_code/3_2/evaltempl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/evaltempl.c -o c_code/3_2/evaltempl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/aliases.c -o c_code/3_2/aliases.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/aliases.c -o c_code/3_2/aliases.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/patterns.c -o c_code/3_2/patterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/patterns.c -o c_code/3_2/patterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/semmacrosanity.c -o c_code/3_2/semmacrosanity.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/semmacrosanity.c -o c_code/3_2/semmacrosanity.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/semparallel.c -o c_code/3_2/semparallel.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/semparallel.c -o c_code/3_2/semparallel.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/cgen.c -o c_code/3_2/cgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/cgen.c -o c_code/3_2/cgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/ccgutils.c -o c_code/3_2/ccgutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/ccgutils.c -o c_code/3_2/ccgutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/cgendata.c -o c_code/3_2/cgendata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/cgendata.c -o c_code/3_2/cgendata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/ccgmerge.c -o c_code/3_2/ccgmerge.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/ccgmerge.c -o c_code/3_2/ccgmerge.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/jsgen.c -o c_code/3_2/jsgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/jsgen.c -o c_code/3_2/jsgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/passaux.c -o c_code/3_2/passaux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/passaux.c -o c_code/3_2/passaux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/depends.c -o c_code/3_2/depends.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/depends.c -o c_code/3_2/depends.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/docgen2.c -o c_code/3_2/docgen2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/docgen2.c -o c_code/3_2/docgen2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/service.c -o c_code/3_2/service.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/service.c -o c_code/3_2/service.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/modules.c -o c_code/3_2/modules.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/modules.c -o c_code/3_2/modules.o
    echo "$LINKER -o $binDir/nim  \
c_code/3_2/nim.o \
c_code/3_2/stdlib_system.o \
c_code/3_2/testability.o \
c_code/3_2/commands.o \
c_code/3_2/stdlib_os.o \
c_code/3_2/stdlib_strutils.o \
c_code/3_2/stdlib_parseutils.o \
c_code/3_2/stdlib_times.o \
c_code/3_2/stdlib_posix.o \
c_code/3_2/msgs.o \
c_code/3_2/options.o \
c_code/3_2/lists.o \
c_code/3_2/stdlib_strtabs.o \
c_code/3_2/stdlib_hashes.o \
c_code/3_2/stdlib_osproc.o \
c_code/3_2/stdlib_streams.o \
c_code/3_2/stdlib_cpuinfo.o \
c_code/3_2/stdlib_sets.o \
c_code/3_2/stdlib_math.o \
c_code/3_2/stdlib_tables.o \
c_code/3_2/ropes.o \
c_code/3_2/platform.o \
c_code/3_2/crc.o \
c_code/3_2/stdlib_sockets.o \
c_code/3_2/stdlib_unsigned.o \
c_code/3_2/nversion.o \
c_code/3_2/condsyms.o \
c_code/3_2/idents.o \
c_code/3_2/extccomp.o \
c_code/3_2/wordrecg.o \
c_code/3_2/nimblecmd.o \
c_code/3_2/stdlib_parseopt.o \
c_code/3_2/lexer.o \
c_code/3_2/nimlexbase.o \
c_code/3_2/llstream.o \
c_code/3_2/nimconf.o \
c_code/3_2/main.o \
c_code/3_2/ast.o \
c_code/3_2/stdlib_intsets.o \
c_code/3_2/idgen.o \
c_code/3_2/astalgo.o \
c_code/3_2/rodutils.o \
c_code/3_2/syntaxes.o \
c_code/3_2/parser.o \
c_code/3_2/pbraces.o \
c_code/3_2/filters.o \
c_code/3_2/renderer.o \
c_code/3_2/filter_tmpl.o \
c_code/3_2/rodread.o \
c_code/3_2/types.o \
c_code/3_2/trees.o \
c_code/3_2/stdlib_memfiles.o \
c_code/3_2/rodwrite.o \
c_code/3_2/passes.o \
c_code/3_2/magicsys.o \
c_code/3_2/nimsets.o \
c_code/3_2/bitsets.o \
c_code/3_2/importer.o \
c_code/3_2/lookups.o \
c_code/3_2/semdata.o \
c_code/3_2/treetab.o \
c_code/3_2/vmdef.o \
c_code/3_2/prettybase.o \
c_code/3_2/stdlib_lexbase.o \
c_code/3_2/sem.o \
c_code/3_2/semfold.o \
c_code/3_2/saturate.o \
c_code/3_2/procfind.o \
c_code/3_2/pragmas.o \
c_code/3_2/semtypinst.o \
c_code/3_2/sigmatch.o \
c_code/3_2/parampatterns.o \
c_code/3_2/pretty.o \
c_code/3_2/docgen.o \
c_code/3_2/docutils_rstast.o \
c_code/3_2/stdlib_json.o \
c_code/3_2/stdlib_unicode.o \
c_code/3_2/docutils_rst.o \
c_code/3_2/docutils_rstgen.o \
c_code/3_2/docutils_highlite.o \
c_code/3_2/stdlib_sequtils.o \
c_code/3_2/stdlib_algorithm.o \
c_code/3_2/sempass2.o \
c_code/3_2/guards.o \
c_code/3_2/stdlib_xmltree.o \
c_code/3_2/stdlib_macros.o \
c_code/3_2/stdlib_cgi.o \
c_code/3_2/stdlib_cookies.o \
c_code/3_2/typesrenderer.o \
c_code/3_2/transf.o \
c_code/3_2/cgmeth.o \
c_code/3_2/lambdalifting.o \
c_code/3_2/lowerings.o \
c_code/3_2/vm.o \
c_code/3_2/vmgen.o \
c_code/3_2/vmdeps.o \
c_code/3_2/evaltempl.o \
c_code/3_2/aliases.o \
c_code/3_2/patterns.o \
c_code/3_2/semmacrosanity.o \
c_code/3_2/semparallel.o \
c_code/3_2/cgen.o \
c_code/3_2/ccgutils.o \
c_code/3_2/cgendata.o \
c_code/3_2/ccgmerge.o \
c_code/3_2/jsgen.o \
c_code/3_2/passaux.o \
c_code/3_2/depends.o \
c_code/3_2/docgen2.o \
c_code/3_2/service.o \
c_code/3_2/modules.o $LINK_FLAGS"
    $LINKER -o $binDir/nim  \
c_code/3_2/nim.o \
c_code/3_2/stdlib_system.o \
c_code/3_2/testability.o \
c_code/3_2/commands.o \
c_code/3_2/stdlib_os.o \
c_code/3_2/stdlib_strutils.o \
c_code/3_2/stdlib_parseutils.o \
c_code/3_2/stdlib_times.o \
c_code/3_2/stdlib_posix.o \
c_code/3_2/msgs.o \
c_code/3_2/options.o \
c_code/3_2/lists.o \
c_code/3_2/stdlib_strtabs.o \
c_code/3_2/stdlib_hashes.o \
c_code/3_2/stdlib_osproc.o \
c_code/3_2/stdlib_streams.o \
c_code/3_2/stdlib_cpuinfo.o \
c_code/3_2/stdlib_sets.o \
c_code/3_2/stdlib_math.o \
c_code/3_2/stdlib_tables.o \
c_code/3_2/ropes.o \
c_code/3_2/platform.o \
c_code/3_2/crc.o \
c_code/3_2/stdlib_sockets.o \
c_code/3_2/stdlib_unsigned.o \
c_code/3_2/nversion.o \
c_code/3_2/condsyms.o \
c_code/3_2/idents.o \
c_code/3_2/extccomp.o \
c_code/3_2/wordrecg.o \
c_code/3_2/nimblecmd.o \
c_code/3_2/stdlib_parseopt.o \
c_code/3_2/lexer.o \
c_code/3_2/nimlexbase.o \
c_code/3_2/llstream.o \
c_code/3_2/nimconf.o \
c_code/3_2/main.o \
c_code/3_2/ast.o \
c_code/3_2/stdlib_intsets.o \
c_code/3_2/idgen.o \
c_code/3_2/astalgo.o \
c_code/3_2/rodutils.o \
c_code/3_2/syntaxes.o \
c_code/3_2/parser.o \
c_code/3_2/pbraces.o \
c_code/3_2/filters.o \
c_code/3_2/renderer.o \
c_code/3_2/filter_tmpl.o \
c_code/3_2/rodread.o \
c_code/3_2/types.o \
c_code/3_2/trees.o \
c_code/3_2/stdlib_memfiles.o \
c_code/3_2/rodwrite.o \
c_code/3_2/passes.o \
c_code/3_2/magicsys.o \
c_code/3_2/nimsets.o \
c_code/3_2/bitsets.o \
c_code/3_2/importer.o \
c_code/3_2/lookups.o \
c_code/3_2/semdata.o \
c_code/3_2/treetab.o \
c_code/3_2/vmdef.o \
c_code/3_2/prettybase.o \
c_code/3_2/stdlib_lexbase.o \
c_code/3_2/sem.o \
c_code/3_2/semfold.o \
c_code/3_2/saturate.o \
c_code/3_2/procfind.o \
c_code/3_2/pragmas.o \
c_code/3_2/semtypinst.o \
c_code/3_2/sigmatch.o \
c_code/3_2/parampatterns.o \
c_code/3_2/pretty.o \
c_code/3_2/docgen.o \
c_code/3_2/docutils_rstast.o \
c_code/3_2/stdlib_json.o \
c_code/3_2/stdlib_unicode.o \
c_code/3_2/docutils_rst.o \
c_code/3_2/docutils_rstgen.o \
c_code/3_2/docutils_highlite.o \
c_code/3_2/stdlib_sequtils.o \
c_code/3_2/stdlib_algorithm.o \
c_code/3_2/sempass2.o \
c_code/3_2/guards.o \
c_code/3_2/stdlib_xmltree.o \
c_code/3_2/stdlib_macros.o \
c_code/3_2/stdlib_cgi.o \
c_code/3_2/stdlib_cookies.o \
c_code/3_2/typesrenderer.o \
c_code/3_2/transf.o \
c_code/3_2/cgmeth.o \
c_code/3_2/lambdalifting.o \
c_code/3_2/lowerings.o \
c_code/3_2/vm.o \
c_code/3_2/vmgen.o \
c_code/3_2/vmdeps.o \
c_code/3_2/evaltempl.o \
c_code/3_2/aliases.o \
c_code/3_2/patterns.o \
c_code/3_2/semmacrosanity.o \
c_code/3_2/semparallel.o \
c_code/3_2/cgen.o \
c_code/3_2/ccgutils.o \
c_code/3_2/cgendata.o \
c_code/3_2/ccgmerge.o \
c_code/3_2/jsgen.o \
c_code/3_2/passaux.o \
c_code/3_2/depends.o \
c_code/3_2/docgen2.o \
c_code/3_2/service.o \
c_code/3_2/modules.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/nim.c -o c_code/3_3/nim.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/nim.c -o c_code/3_3/nim.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_system.c -o c_code/3_3/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_system.c -o c_code/3_3/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/testability.c -o c_code/3_3/testability.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/testability.c -o c_code/3_3/testability.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/commands.c -o c_code/3_3/commands.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/commands.c -o c_code/3_3/commands.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_os.c -o c_code/3_3/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_os.c -o c_code/3_3/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_strutils.c -o c_code/3_3/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_strutils.c -o c_code/3_3/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_parseutils.c -o c_code/3_3/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_parseutils.c -o c_code/3_3/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_times.c -o c_code/3_3/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_times.c -o c_code/3_3/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_posix.c -o c_code/3_3/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_posix.c -o c_code/3_3/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/msgs.c -o c_code/3_3/msgs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/msgs.c -o c_code/3_3/msgs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/options.c -o c_code/3_3/options.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/options.c -o c_code/3_3/options.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/lists.c -o c_code/3_3/lists.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/lists.c -o c_code/3_3/lists.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_strtabs.c -o c_code/3_3/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_strtabs.c -o c_code/3_3/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_hashes.c -o c_code/3_3/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_hashes.c -o c_code/3_3/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_osproc.c -o c_code/3_3/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_osproc.c -o c_code/3_3/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_streams.c -o c_code/3_3/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_streams.c -o c_code/3_3/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_cpuinfo.c -o c_code/3_3/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_cpuinfo.c -o c_code/3_3/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_sets.c -o c_code/3_3/stdlib_sets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_sets.c -o c_code/3_3/stdlib_sets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_math.c -o c_code/3_3/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_math.c -o c_code/3_3/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_tables.c -o c_code/3_3/stdlib_tables.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_tables.c -o c_code/3_3/stdlib_tables.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/ropes.c -o c_code/3_3/ropes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/ropes.c -o c_code/3_3/ropes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/platform.c -o c_code/3_3/platform.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/platform.c -o c_code/3_3/platform.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/crc.c -o c_code/3_3/crc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/crc.c -o c_code/3_3/crc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_sockets.c -o c_code/3_3/stdlib_sockets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_sockets.c -o c_code/3_3/stdlib_sockets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_unsigned.c -o c_code/3_3/stdlib_unsigned.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_unsigned.c -o c_code/3_3/stdlib_unsigned.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/nversion.c -o c_code/3_3/nversion.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/nversion.c -o c_code/3_3/nversion.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/condsyms.c -o c_code/3_3/condsyms.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/condsyms.c -o c_code/3_3/condsyms.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/idents.c -o c_code/3_3/idents.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/idents.c -o c_code/3_3/idents.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/extccomp.c -o c_code/3_3/extccomp.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/extccomp.c -o c_code/3_3/extccomp.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/wordrecg.c -o c_code/3_3/wordrecg.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/wordrecg.c -o c_code/3_3/wordrecg.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/nimblecmd.c -o c_code/3_3/nimblecmd.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/nimblecmd.c -o c_code/3_3/nimblecmd.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_parseopt.c -o c_code/3_3/stdlib_parseopt.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_parseopt.c -o c_code/3_3/stdlib_parseopt.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/lexer.c -o c_code/3_3/lexer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/lexer.c -o c_code/3_3/lexer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/nimlexbase.c -o c_code/3_3/nimlexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/nimlexbase.c -o c_code/3_3/nimlexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/llstream.c -o c_code/3_3/llstream.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/llstream.c -o c_code/3_3/llstream.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/nimconf.c -o c_code/3_3/nimconf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/nimconf.c -o c_code/3_3/nimconf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/main.c -o c_code/3_3/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/main.c -o c_code/3_3/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/ast.c -o c_code/3_3/ast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/ast.c -o c_code/3_3/ast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_intsets.c -o c_code/3_3/stdlib_intsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_intsets.c -o c_code/3_3/stdlib_intsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/idgen.c -o c_code/3_3/idgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/idgen.c -o c_code/3_3/idgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/astalgo.c -o c_code/3_3/astalgo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/astalgo.c -o c_code/3_3/astalgo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/rodutils.c -o c_code/3_3/rodutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/rodutils.c -o c_code/3_3/rodutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/syntaxes.c -o c_code/3_3/syntaxes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/syntaxes.c -o c_code/3_3/syntaxes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/parser.c -o c_code/3_3/parser.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/parser.c -o c_code/3_3/parser.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/pbraces.c -o c_code/3_3/pbraces.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/pbraces.c -o c_code/3_3/pbraces.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/filters.c -o c_code/3_3/filters.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/filters.c -o c_code/3_3/filters.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/renderer.c -o c_code/3_3/renderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/renderer.c -o c_code/3_3/renderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/filter_tmpl.c -o c_code/3_3/filter_tmpl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/filter_tmpl.c -o c_code/3_3/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/rodread.c -o c_code/3_3/rodread.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/rodread.c -o c_code/3_3/rodread.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/types.c -o c_code/3_3/types.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/types.c -o c_code/3_3/types.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/trees.c -o c_code/3_3/trees.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/trees.c -o c_code/3_3/trees.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_memfiles.c -o c_code/3_3/stdlib_memfiles.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_memfiles.c -o c_code/3_3/stdlib_memfiles.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/rodwrite.c -o c_code/3_3/rodwrite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/rodwrite.c -o c_code/3_3/rodwrite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/passes.c -o c_code/3_3/passes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/passes.c -o c_code/3_3/passes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/magicsys.c -o c_code/3_3/magicsys.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/magicsys.c -o c_code/3_3/magicsys.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/nimsets.c -o c_code/3_3/nimsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/nimsets.c -o c_code/3_3/nimsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/bitsets.c -o c_code/3_3/bitsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/bitsets.c -o c_code/3_3/bitsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/importer.c -o c_code/3_3/importer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/importer.c -o c_code/3_3/importer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/lookups.c -o c_code/3_3/lookups.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/lookups.c -o c_code/3_3/lookups.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/semdata.c -o c_code/3_3/semdata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/semdata.c -o c_code/3_3/semdata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/treetab.c -o c_code/3_3/treetab.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/treetab.c -o c_code/3_3/treetab.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/vmdef.c -o c_code/3_3/vmdef.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/vmdef.c -o c_code/3_3/vmdef.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/prettybase.c -o c_code/3_3/prettybase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/prettybase.c -o c_code/3_3/prettybase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_lexbase.c -o c_code/3_3/stdlib_lexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_lexbase.c -o c_code/3_3/stdlib_lexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/sem.c -o c_code/3_3/sem.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/sem.c -o c_code/3_3/sem.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/semfold.c -o c_code/3_3/semfold.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/semfold.c -o c_code/3_3/semfold.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/saturate.c -o c_code/3_3/saturate.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/saturate.c -o c_code/3_3/saturate.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/procfind.c -o c_code/3_3/procfind.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/procfind.c -o c_code/3_3/procfind.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/pragmas.c -o c_code/3_3/pragmas.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/pragmas.c -o c_code/3_3/pragmas.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/semtypinst.c -o c_code/3_3/semtypinst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/semtypinst.c -o c_code/3_3/semtypinst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/sigmatch.c -o c_code/3_3/sigmatch.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/sigmatch.c -o c_code/3_3/sigmatch.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/parampatterns.c -o c_code/3_3/parampatterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/parampatterns.c -o c_code/3_3/parampatterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/pretty.c -o c_code/3_3/pretty.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/pretty.c -o c_code/3_3/pretty.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/docgen.c -o c_code/3_3/docgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/docgen.c -o c_code/3_3/docgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/docutils_rstast.c -o c_code/3_3/docutils_rstast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/docutils_rstast.c -o c_code/3_3/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_json.c -o c_code/3_3/stdlib_json.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_json.c -o c_code/3_3/stdlib_json.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_unicode.c -o c_code/3_3/stdlib_unicode.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_unicode.c -o c_code/3_3/stdlib_unicode.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/docutils_rst.c -o c_code/3_3/docutils_rst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/docutils_rst.c -o c_code/3_3/docutils_rst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/docutils_rstgen.c -o c_code/3_3/docutils_rstgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/docutils_rstgen.c -o c_code/3_3/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/docutils_highlite.c -o c_code/3_3/docutils_highlite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/docutils_highlite.c -o c_code/3_3/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_sequtils.c -o c_code/3_3/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_sequtils.c -o c_code/3_3/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_algorithm.c -o c_code/3_3/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_algorithm.c -o c_code/3_3/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/sempass2.c -o c_code/3_3/sempass2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/sempass2.c -o c_code/3_3/sempass2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/guards.c -o c_code/3_3/guards.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/guards.c -o c_code/3_3/guards.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_xmltree.c -o c_code/3_3/stdlib_xmltree.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_xmltree.c -o c_code/3_3/stdlib_xmltree.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_macros.c -o c_code/3_3/stdlib_macros.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_macros.c -o c_code/3_3/stdlib_macros.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_cgi.c -o c_code/3_3/stdlib_cgi.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_cgi.c -o c_code/3_3/stdlib_cgi.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_cookies.c -o c_code/3_3/stdlib_cookies.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_cookies.c -o c_code/3_3/stdlib_cookies.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/typesrenderer.c -o c_code/3_3/typesrenderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/typesrenderer.c -o c_code/3_3/typesrenderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/transf.c -o c_code/3_3/transf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/transf.c -o c_code/3_3/transf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/cgmeth.c -o c_code/3_3/cgmeth.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/cgmeth.c -o c_code/3_3/cgmeth.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/lambdalifting.c -o c_code/3_3/lambdalifting.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/lambdalifting.c -o c_code/3_3/lambdalifting.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/lowerings.c -o c_code/3_3/lowerings.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/lowerings.c -o c_code/3_3/lowerings.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/vm.c -o c_code/3_3/vm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/vm.c -o c_code/3_3/vm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/vmgen.c -o c_code/3_3/vmgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/vmgen.c -o c_code/3_3/vmgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/vmdeps.c -o c_code/3_3/vmdeps.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/vmdeps.c -o c_code/3_3/vmdeps.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/evaltempl.c -o c_code/3_3/evaltempl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/evaltempl.c -o c_code/3_3/evaltempl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/aliases.c -o c_code/3_3/aliases.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/aliases.c -o c_code/3_3/aliases.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/patterns.c -o c_code/3_3/patterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/patterns.c -o c_code/3_3/patterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/semmacrosanity.c -o c_code/3_3/semmacrosanity.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/semmacrosanity.c -o c_code/3_3/semmacrosanity.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/semparallel.c -o c_code/3_3/semparallel.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/semparallel.c -o c_code/3_3/semparallel.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/cgen.c -o c_code/3_3/cgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/cgen.c -o c_code/3_3/cgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/ccgutils.c -o c_code/3_3/ccgutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/ccgutils.c -o c_code/3_3/ccgutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/cgendata.c -o c_code/3_3/cgendata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/cgendata.c -o c_code/3_3/cgendata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/ccgmerge.c -o c_code/3_3/ccgmerge.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/ccgmerge.c -o c_code/3_3/ccgmerge.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/jsgen.c -o c_code/3_3/jsgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/jsgen.c -o c_code/3_3/jsgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/passaux.c -o c_code/3_3/passaux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/passaux.c -o c_code/3_3/passaux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/depends.c -o c_code/3_3/depends.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/depends.c -o c_code/3_3/depends.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/docgen2.c -o c_code/3_3/docgen2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/docgen2.c -o c_code/3_3/docgen2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/service.c -o c_code/3_3/service.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/service.c -o c_code/3_3/service.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/modules.c -o c_code/3_3/modules.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/modules.c -o c_code/3_3/modules.o
    echo "$LINKER -o $binDir/nim  \
c_code/3_3/nim.o \
c_code/3_3/stdlib_system.o \
c_code/3_3/testability.o \
c_code/3_3/commands.o \
c_code/3_3/stdlib_os.o \
c_code/3_3/stdlib_strutils.o \
c_code/3_3/stdlib_parseutils.o \
c_code/3_3/stdlib_times.o \
c_code/3_3/stdlib_posix.o \
c_code/3_3/msgs.o \
c_code/3_3/options.o \
c_code/3_3/lists.o \
c_code/3_3/stdlib_strtabs.o \
c_code/3_3/stdlib_hashes.o \
c_code/3_3/stdlib_osproc.o \
c_code/3_3/stdlib_streams.o \
c_code/3_3/stdlib_cpuinfo.o \
c_code/3_3/stdlib_sets.o \
c_code/3_3/stdlib_math.o \
c_code/3_3/stdlib_tables.o \
c_code/3_3/ropes.o \
c_code/3_3/platform.o \
c_code/3_3/crc.o \
c_code/3_3/stdlib_sockets.o \
c_code/3_3/stdlib_unsigned.o \
c_code/3_3/nversion.o \
c_code/3_3/condsyms.o \
c_code/3_3/idents.o \
c_code/3_3/extccomp.o \
c_code/3_3/wordrecg.o \
c_code/3_3/nimblecmd.o \
c_code/3_3/stdlib_parseopt.o \
c_code/3_3/lexer.o \
c_code/3_3/nimlexbase.o \
c_code/3_3/llstream.o \
c_code/3_3/nimconf.o \
c_code/3_3/main.o \
c_code/3_3/ast.o \
c_code/3_3/stdlib_intsets.o \
c_code/3_3/idgen.o \
c_code/3_3/astalgo.o \
c_code/3_3/rodutils.o \
c_code/3_3/syntaxes.o \
c_code/3_3/parser.o \
c_code/3_3/pbraces.o \
c_code/3_3/filters.o \
c_code/3_3/renderer.o \
c_code/3_3/filter_tmpl.o \
c_code/3_3/rodread.o \
c_code/3_3/types.o \
c_code/3_3/trees.o \
c_code/3_3/stdlib_memfiles.o \
c_code/3_3/rodwrite.o \
c_code/3_3/passes.o \
c_code/3_3/magicsys.o \
c_code/3_3/nimsets.o \
c_code/3_3/bitsets.o \
c_code/3_3/importer.o \
c_code/3_3/lookups.o \
c_code/3_3/semdata.o \
c_code/3_3/treetab.o \
c_code/3_3/vmdef.o \
c_code/3_3/prettybase.o \
c_code/3_3/stdlib_lexbase.o \
c_code/3_3/sem.o \
c_code/3_3/semfold.o \
c_code/3_3/saturate.o \
c_code/3_3/procfind.o \
c_code/3_3/pragmas.o \
c_code/3_3/semtypinst.o \
c_code/3_3/sigmatch.o \
c_code/3_3/parampatterns.o \
c_code/3_3/pretty.o \
c_code/3_3/docgen.o \
c_code/3_3/docutils_rstast.o \
c_code/3_3/stdlib_json.o \
c_code/3_3/stdlib_unicode.o \
c_code/3_3/docutils_rst.o \
c_code/3_3/docutils_rstgen.o \
c_code/3_3/docutils_highlite.o \
c_code/3_3/stdlib_sequtils.o \
c_code/3_3/stdlib_algorithm.o \
c_code/3_3/sempass2.o \
c_code/3_3/guards.o \
c_code/3_3/stdlib_xmltree.o \
c_code/3_3/stdlib_macros.o \
c_code/3_3/stdlib_cgi.o \
c_code/3_3/stdlib_cookies.o \
c_code/3_3/typesrenderer.o \
c_code/3_3/transf.o \
c_code/3_3/cgmeth.o \
c_code/3_3/lambdalifting.o \
c_code/3_3/lowerings.o \
c_code/3_3/vm.o \
c_code/3_3/vmgen.o \
c_code/3_3/vmdeps.o \
c_code/3_3/evaltempl.o \
c_code/3_3/aliases.o \
c_code/3_3/patterns.o \
c_code/3_3/semmacrosanity.o \
c_code/3_3/semparallel.o \
c_code/3_3/cgen.o \
c_code/3_3/ccgutils.o \
c_code/3_3/cgendata.o \
c_code/3_3/ccgmerge.o \
c_code/3_3/jsgen.o \
c_code/3_3/passaux.o \
c_code/3_3/depends.o \
c_code/3_3/docgen2.o \
c_code/3_3/service.o \
c_code/3_3/modules.o $LINK_FLAGS"
    $LINKER -o $binDir/nim  \
c_code/3_3/nim.o \
c_code/3_3/stdlib_system.o \
c_code/3_3/testability.o \
c_code/3_3/commands.o \
c_code/3_3/stdlib_os.o \
c_code/3_3/stdlib_strutils.o \
c_code/3_3/stdlib_parseutils.o \
c_code/3_3/stdlib_times.o \
c_code/3_3/stdlib_posix.o \
c_code/3_3/msgs.o \
c_code/3_3/options.o \
c_code/3_3/lists.o \
c_code/3_3/stdlib_strtabs.o \
c_code/3_3/stdlib_hashes.o \
c_code/3_3/stdlib_osproc.o \
c_code/3_3/stdlib_streams.o \
c_code/3_3/stdlib_cpuinfo.o \
c_code/3_3/stdlib_sets.o \
c_code/3_3/stdlib_math.o \
c_code/3_3/stdlib_tables.o \
c_code/3_3/ropes.o \
c_code/3_3/platform.o \
c_code/3_3/crc.o \
c_code/3_3/stdlib_sockets.o \
c_code/3_3/stdlib_unsigned.o \
c_code/3_3/nversion.o \
c_code/3_3/condsyms.o \
c_code/3_3/idents.o \
c_code/3_3/extccomp.o \
c_code/3_3/wordrecg.o \
c_code/3_3/nimblecmd.o \
c_code/3_3/stdlib_parseopt.o \
c_code/3_3/lexer.o \
c_code/3_3/nimlexbase.o \
c_code/3_3/llstream.o \
c_code/3_3/nimconf.o \
c_code/3_3/main.o \
c_code/3_3/ast.o \
c_code/3_3/stdlib_intsets.o \
c_code/3_3/idgen.o \
c_code/3_3/astalgo.o \
c_code/3_3/rodutils.o \
c_code/3_3/syntaxes.o \
c_code/3_3/parser.o \
c_code/3_3/pbraces.o \
c_code/3_3/filters.o \
c_code/3_3/renderer.o \
c_code/3_3/filter_tmpl.o \
c_code/3_3/rodread.o \
c_code/3_3/types.o \
c_code/3_3/trees.o \
c_code/3_3/stdlib_memfiles.o \
c_code/3_3/rodwrite.o \
c_code/3_3/passes.o \
c_code/3_3/magicsys.o \
c_code/3_3/nimsets.o \
c_code/3_3/bitsets.o \
c_code/3_3/importer.o \
c_code/3_3/lookups.o \
c_code/3_3/semdata.o \
c_code/3_3/treetab.o \
c_code/3_3/vmdef.o \
c_code/3_3/prettybase.o \
c_code/3_3/stdlib_lexbase.o \
c_code/3_3/sem.o \
c_code/3_3/semfold.o \
c_code/3_3/saturate.o \
c_code/3_3/procfind.o \
c_code/3_3/pragmas.o \
c_code/3_3/semtypinst.o \
c_code/3_3/sigmatch.o \
c_code/3_3/parampatterns.o \
c_code/3_3/pretty.o \
c_code/3_3/docgen.o \
c_code/3_3/docutils_rstast.o \
c_code/3_3/stdlib_json.o \
c_code/3_3/stdlib_unicode.o \
c_code/3_3/docutils_rst.o \
c_code/3_3/docutils_rstgen.o \
c_code/3_3/docutils_highlite.o \
c_code/3_3/stdlib_sequtils.o \
c_code/3_3/stdlib_algorithm.o \
c_code/3_3/sempass2.o \
c_code/3_3/guards.o \
c_code/3_3/stdlib_xmltree.o \
c_code/3_3/stdlib_macros.o \
c_code/3_3/stdlib_cgi.o \
c_code/3_3/stdlib_cookies.o \
c_code/3_3/typesrenderer.o \
c_code/3_3/transf.o \
c_code/3_3/cgmeth.o \
c_code/3_3/lambdalifting.o \
c_code/3_3/lowerings.o \
c_code/3_3/vm.o \
c_code/3_3/vmgen.o \
c_code/3_3/vmdeps.o \
c_code/3_3/evaltempl.o \
c_code/3_3/aliases.o \
c_code/3_3/patterns.o \
c_code/3_3/semmacrosanity.o \
c_code/3_3/semparallel.o \
c_code/3_3/cgen.o \
c_code/3_3/ccgutils.o \
c_code/3_3/cgendata.o \
c_code/3_3/ccgmerge.o \
c_code/3_3/jsgen.o \
c_code/3_3/passaux.o \
c_code/3_3/depends.o \
c_code/3_3/docgen2.o \
c_code/3_3/service.o \
c_code/3_3/modules.o $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
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
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/nim.c -o c_code/4_1/nim.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/nim.c -o c_code/4_1/nim.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_system.c -o c_code/4_1/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_system.c -o c_code/4_1/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/testability.c -o c_code/4_1/testability.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/testability.c -o c_code/4_1/testability.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/commands.c -o c_code/4_1/commands.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/commands.c -o c_code/4_1/commands.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_os.c -o c_code/4_1/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_os.c -o c_code/4_1/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_strutils.c -o c_code/4_1/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_strutils.c -o c_code/4_1/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_parseutils.c -o c_code/4_1/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_parseutils.c -o c_code/4_1/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_times.c -o c_code/4_1/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_times.c -o c_code/4_1/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_posix.c -o c_code/4_1/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_posix.c -o c_code/4_1/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/msgs.c -o c_code/4_1/msgs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/msgs.c -o c_code/4_1/msgs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/options.c -o c_code/4_1/options.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/options.c -o c_code/4_1/options.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/lists.c -o c_code/4_1/lists.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/lists.c -o c_code/4_1/lists.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_strtabs.c -o c_code/4_1/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_strtabs.c -o c_code/4_1/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_hashes.c -o c_code/4_1/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_hashes.c -o c_code/4_1/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_osproc.c -o c_code/4_1/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_osproc.c -o c_code/4_1/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_streams.c -o c_code/4_1/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_streams.c -o c_code/4_1/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_cpuinfo.c -o c_code/4_1/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_cpuinfo.c -o c_code/4_1/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_sets.c -o c_code/4_1/stdlib_sets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_sets.c -o c_code/4_1/stdlib_sets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_math.c -o c_code/4_1/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_math.c -o c_code/4_1/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_tables.c -o c_code/4_1/stdlib_tables.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_tables.c -o c_code/4_1/stdlib_tables.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/ropes.c -o c_code/4_1/ropes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/ropes.c -o c_code/4_1/ropes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/platform.c -o c_code/4_1/platform.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/platform.c -o c_code/4_1/platform.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/crc.c -o c_code/4_1/crc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/crc.c -o c_code/4_1/crc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_sockets.c -o c_code/4_1/stdlib_sockets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_sockets.c -o c_code/4_1/stdlib_sockets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_unsigned.c -o c_code/4_1/stdlib_unsigned.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_unsigned.c -o c_code/4_1/stdlib_unsigned.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/nversion.c -o c_code/4_1/nversion.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/nversion.c -o c_code/4_1/nversion.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/condsyms.c -o c_code/4_1/condsyms.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/condsyms.c -o c_code/4_1/condsyms.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/idents.c -o c_code/4_1/idents.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/idents.c -o c_code/4_1/idents.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/extccomp.c -o c_code/4_1/extccomp.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/extccomp.c -o c_code/4_1/extccomp.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/wordrecg.c -o c_code/4_1/wordrecg.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/wordrecg.c -o c_code/4_1/wordrecg.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/nimblecmd.c -o c_code/4_1/nimblecmd.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/nimblecmd.c -o c_code/4_1/nimblecmd.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_parseopt.c -o c_code/4_1/stdlib_parseopt.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_parseopt.c -o c_code/4_1/stdlib_parseopt.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/lexer.c -o c_code/4_1/lexer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/lexer.c -o c_code/4_1/lexer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/nimlexbase.c -o c_code/4_1/nimlexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/nimlexbase.c -o c_code/4_1/nimlexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/llstream.c -o c_code/4_1/llstream.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/llstream.c -o c_code/4_1/llstream.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/nimconf.c -o c_code/4_1/nimconf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/nimconf.c -o c_code/4_1/nimconf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/main.c -o c_code/4_1/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/main.c -o c_code/4_1/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/ast.c -o c_code/4_1/ast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/ast.c -o c_code/4_1/ast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_intsets.c -o c_code/4_1/stdlib_intsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_intsets.c -o c_code/4_1/stdlib_intsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/idgen.c -o c_code/4_1/idgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/idgen.c -o c_code/4_1/idgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/astalgo.c -o c_code/4_1/astalgo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/astalgo.c -o c_code/4_1/astalgo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/rodutils.c -o c_code/4_1/rodutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/rodutils.c -o c_code/4_1/rodutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/syntaxes.c -o c_code/4_1/syntaxes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/syntaxes.c -o c_code/4_1/syntaxes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/parser.c -o c_code/4_1/parser.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/parser.c -o c_code/4_1/parser.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/pbraces.c -o c_code/4_1/pbraces.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/pbraces.c -o c_code/4_1/pbraces.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/filters.c -o c_code/4_1/filters.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/filters.c -o c_code/4_1/filters.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/renderer.c -o c_code/4_1/renderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/renderer.c -o c_code/4_1/renderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/filter_tmpl.c -o c_code/4_1/filter_tmpl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/filter_tmpl.c -o c_code/4_1/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/rodread.c -o c_code/4_1/rodread.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/rodread.c -o c_code/4_1/rodread.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/types.c -o c_code/4_1/types.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/types.c -o c_code/4_1/types.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/trees.c -o c_code/4_1/trees.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/trees.c -o c_code/4_1/trees.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_memfiles.c -o c_code/4_1/stdlib_memfiles.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_memfiles.c -o c_code/4_1/stdlib_memfiles.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/rodwrite.c -o c_code/4_1/rodwrite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/rodwrite.c -o c_code/4_1/rodwrite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/passes.c -o c_code/4_1/passes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/passes.c -o c_code/4_1/passes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/magicsys.c -o c_code/4_1/magicsys.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/magicsys.c -o c_code/4_1/magicsys.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/nimsets.c -o c_code/4_1/nimsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/nimsets.c -o c_code/4_1/nimsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/bitsets.c -o c_code/4_1/bitsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/bitsets.c -o c_code/4_1/bitsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/importer.c -o c_code/4_1/importer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/importer.c -o c_code/4_1/importer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/lookups.c -o c_code/4_1/lookups.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/lookups.c -o c_code/4_1/lookups.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/semdata.c -o c_code/4_1/semdata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/semdata.c -o c_code/4_1/semdata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/treetab.c -o c_code/4_1/treetab.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/treetab.c -o c_code/4_1/treetab.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/vmdef.c -o c_code/4_1/vmdef.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/vmdef.c -o c_code/4_1/vmdef.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/prettybase.c -o c_code/4_1/prettybase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/prettybase.c -o c_code/4_1/prettybase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_lexbase.c -o c_code/4_1/stdlib_lexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_lexbase.c -o c_code/4_1/stdlib_lexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/sem.c -o c_code/4_1/sem.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/sem.c -o c_code/4_1/sem.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/semfold.c -o c_code/4_1/semfold.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/semfold.c -o c_code/4_1/semfold.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/saturate.c -o c_code/4_1/saturate.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/saturate.c -o c_code/4_1/saturate.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/procfind.c -o c_code/4_1/procfind.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/procfind.c -o c_code/4_1/procfind.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/pragmas.c -o c_code/4_1/pragmas.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/pragmas.c -o c_code/4_1/pragmas.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/semtypinst.c -o c_code/4_1/semtypinst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/semtypinst.c -o c_code/4_1/semtypinst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/sigmatch.c -o c_code/4_1/sigmatch.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/sigmatch.c -o c_code/4_1/sigmatch.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/parampatterns.c -o c_code/4_1/parampatterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/parampatterns.c -o c_code/4_1/parampatterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/pretty.c -o c_code/4_1/pretty.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/pretty.c -o c_code/4_1/pretty.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/docgen.c -o c_code/4_1/docgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/docgen.c -o c_code/4_1/docgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/docutils_rstast.c -o c_code/4_1/docutils_rstast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/docutils_rstast.c -o c_code/4_1/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_json.c -o c_code/4_1/stdlib_json.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_json.c -o c_code/4_1/stdlib_json.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_unicode.c -o c_code/4_1/stdlib_unicode.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_unicode.c -o c_code/4_1/stdlib_unicode.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/docutils_rst.c -o c_code/4_1/docutils_rst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/docutils_rst.c -o c_code/4_1/docutils_rst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/docutils_rstgen.c -o c_code/4_1/docutils_rstgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/docutils_rstgen.c -o c_code/4_1/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/docutils_highlite.c -o c_code/4_1/docutils_highlite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/docutils_highlite.c -o c_code/4_1/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_sequtils.c -o c_code/4_1/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_sequtils.c -o c_code/4_1/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_algorithm.c -o c_code/4_1/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_algorithm.c -o c_code/4_1/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/sempass2.c -o c_code/4_1/sempass2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/sempass2.c -o c_code/4_1/sempass2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/guards.c -o c_code/4_1/guards.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/guards.c -o c_code/4_1/guards.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_xmltree.c -o c_code/4_1/stdlib_xmltree.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_xmltree.c -o c_code/4_1/stdlib_xmltree.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_macros.c -o c_code/4_1/stdlib_macros.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_macros.c -o c_code/4_1/stdlib_macros.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_cgi.c -o c_code/4_1/stdlib_cgi.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_cgi.c -o c_code/4_1/stdlib_cgi.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_cookies.c -o c_code/4_1/stdlib_cookies.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_cookies.c -o c_code/4_1/stdlib_cookies.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/typesrenderer.c -o c_code/4_1/typesrenderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/typesrenderer.c -o c_code/4_1/typesrenderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/transf.c -o c_code/4_1/transf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/transf.c -o c_code/4_1/transf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/cgmeth.c -o c_code/4_1/cgmeth.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/cgmeth.c -o c_code/4_1/cgmeth.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/lambdalifting.c -o c_code/4_1/lambdalifting.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/lambdalifting.c -o c_code/4_1/lambdalifting.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/lowerings.c -o c_code/4_1/lowerings.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/lowerings.c -o c_code/4_1/lowerings.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/vm.c -o c_code/4_1/vm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/vm.c -o c_code/4_1/vm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/vmgen.c -o c_code/4_1/vmgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/vmgen.c -o c_code/4_1/vmgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/vmdeps.c -o c_code/4_1/vmdeps.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/vmdeps.c -o c_code/4_1/vmdeps.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/evaltempl.c -o c_code/4_1/evaltempl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/evaltempl.c -o c_code/4_1/evaltempl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/aliases.c -o c_code/4_1/aliases.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/aliases.c -o c_code/4_1/aliases.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/patterns.c -o c_code/4_1/patterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/patterns.c -o c_code/4_1/patterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/semmacrosanity.c -o c_code/4_1/semmacrosanity.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/semmacrosanity.c -o c_code/4_1/semmacrosanity.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/semparallel.c -o c_code/4_1/semparallel.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/semparallel.c -o c_code/4_1/semparallel.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/cgen.c -o c_code/4_1/cgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/cgen.c -o c_code/4_1/cgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/ccgutils.c -o c_code/4_1/ccgutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/ccgutils.c -o c_code/4_1/ccgutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/cgendata.c -o c_code/4_1/cgendata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/cgendata.c -o c_code/4_1/cgendata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/ccgmerge.c -o c_code/4_1/ccgmerge.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/ccgmerge.c -o c_code/4_1/ccgmerge.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/jsgen.c -o c_code/4_1/jsgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/jsgen.c -o c_code/4_1/jsgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/passaux.c -o c_code/4_1/passaux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/passaux.c -o c_code/4_1/passaux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/depends.c -o c_code/4_1/depends.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/depends.c -o c_code/4_1/depends.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/docgen2.c -o c_code/4_1/docgen2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/docgen2.c -o c_code/4_1/docgen2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/service.c -o c_code/4_1/service.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/service.c -o c_code/4_1/service.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/modules.c -o c_code/4_1/modules.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/modules.c -o c_code/4_1/modules.o
    echo "$LINKER -o $binDir/nim  \
c_code/4_1/nim.o \
c_code/4_1/stdlib_system.o \
c_code/4_1/testability.o \
c_code/4_1/commands.o \
c_code/4_1/stdlib_os.o \
c_code/4_1/stdlib_strutils.o \
c_code/4_1/stdlib_parseutils.o \
c_code/4_1/stdlib_times.o \
c_code/4_1/stdlib_posix.o \
c_code/4_1/msgs.o \
c_code/4_1/options.o \
c_code/4_1/lists.o \
c_code/4_1/stdlib_strtabs.o \
c_code/4_1/stdlib_hashes.o \
c_code/4_1/stdlib_osproc.o \
c_code/4_1/stdlib_streams.o \
c_code/4_1/stdlib_cpuinfo.o \
c_code/4_1/stdlib_sets.o \
c_code/4_1/stdlib_math.o \
c_code/4_1/stdlib_tables.o \
c_code/4_1/ropes.o \
c_code/4_1/platform.o \
c_code/4_1/crc.o \
c_code/4_1/stdlib_sockets.o \
c_code/4_1/stdlib_unsigned.o \
c_code/4_1/nversion.o \
c_code/4_1/condsyms.o \
c_code/4_1/idents.o \
c_code/4_1/extccomp.o \
c_code/4_1/wordrecg.o \
c_code/4_1/nimblecmd.o \
c_code/4_1/stdlib_parseopt.o \
c_code/4_1/lexer.o \
c_code/4_1/nimlexbase.o \
c_code/4_1/llstream.o \
c_code/4_1/nimconf.o \
c_code/4_1/main.o \
c_code/4_1/ast.o \
c_code/4_1/stdlib_intsets.o \
c_code/4_1/idgen.o \
c_code/4_1/astalgo.o \
c_code/4_1/rodutils.o \
c_code/4_1/syntaxes.o \
c_code/4_1/parser.o \
c_code/4_1/pbraces.o \
c_code/4_1/filters.o \
c_code/4_1/renderer.o \
c_code/4_1/filter_tmpl.o \
c_code/4_1/rodread.o \
c_code/4_1/types.o \
c_code/4_1/trees.o \
c_code/4_1/stdlib_memfiles.o \
c_code/4_1/rodwrite.o \
c_code/4_1/passes.o \
c_code/4_1/magicsys.o \
c_code/4_1/nimsets.o \
c_code/4_1/bitsets.o \
c_code/4_1/importer.o \
c_code/4_1/lookups.o \
c_code/4_1/semdata.o \
c_code/4_1/treetab.o \
c_code/4_1/vmdef.o \
c_code/4_1/prettybase.o \
c_code/4_1/stdlib_lexbase.o \
c_code/4_1/sem.o \
c_code/4_1/semfold.o \
c_code/4_1/saturate.o \
c_code/4_1/procfind.o \
c_code/4_1/pragmas.o \
c_code/4_1/semtypinst.o \
c_code/4_1/sigmatch.o \
c_code/4_1/parampatterns.o \
c_code/4_1/pretty.o \
c_code/4_1/docgen.o \
c_code/4_1/docutils_rstast.o \
c_code/4_1/stdlib_json.o \
c_code/4_1/stdlib_unicode.o \
c_code/4_1/docutils_rst.o \
c_code/4_1/docutils_rstgen.o \
c_code/4_1/docutils_highlite.o \
c_code/4_1/stdlib_sequtils.o \
c_code/4_1/stdlib_algorithm.o \
c_code/4_1/sempass2.o \
c_code/4_1/guards.o \
c_code/4_1/stdlib_xmltree.o \
c_code/4_1/stdlib_macros.o \
c_code/4_1/stdlib_cgi.o \
c_code/4_1/stdlib_cookies.o \
c_code/4_1/typesrenderer.o \
c_code/4_1/transf.o \
c_code/4_1/cgmeth.o \
c_code/4_1/lambdalifting.o \
c_code/4_1/lowerings.o \
c_code/4_1/vm.o \
c_code/4_1/vmgen.o \
c_code/4_1/vmdeps.o \
c_code/4_1/evaltempl.o \
c_code/4_1/aliases.o \
c_code/4_1/patterns.o \
c_code/4_1/semmacrosanity.o \
c_code/4_1/semparallel.o \
c_code/4_1/cgen.o \
c_code/4_1/ccgutils.o \
c_code/4_1/cgendata.o \
c_code/4_1/ccgmerge.o \
c_code/4_1/jsgen.o \
c_code/4_1/passaux.o \
c_code/4_1/depends.o \
c_code/4_1/docgen2.o \
c_code/4_1/service.o \
c_code/4_1/modules.o $LINK_FLAGS"
    $LINKER -o $binDir/nim  \
c_code/4_1/nim.o \
c_code/4_1/stdlib_system.o \
c_code/4_1/testability.o \
c_code/4_1/commands.o \
c_code/4_1/stdlib_os.o \
c_code/4_1/stdlib_strutils.o \
c_code/4_1/stdlib_parseutils.o \
c_code/4_1/stdlib_times.o \
c_code/4_1/stdlib_posix.o \
c_code/4_1/msgs.o \
c_code/4_1/options.o \
c_code/4_1/lists.o \
c_code/4_1/stdlib_strtabs.o \
c_code/4_1/stdlib_hashes.o \
c_code/4_1/stdlib_osproc.o \
c_code/4_1/stdlib_streams.o \
c_code/4_1/stdlib_cpuinfo.o \
c_code/4_1/stdlib_sets.o \
c_code/4_1/stdlib_math.o \
c_code/4_1/stdlib_tables.o \
c_code/4_1/ropes.o \
c_code/4_1/platform.o \
c_code/4_1/crc.o \
c_code/4_1/stdlib_sockets.o \
c_code/4_1/stdlib_unsigned.o \
c_code/4_1/nversion.o \
c_code/4_1/condsyms.o \
c_code/4_1/idents.o \
c_code/4_1/extccomp.o \
c_code/4_1/wordrecg.o \
c_code/4_1/nimblecmd.o \
c_code/4_1/stdlib_parseopt.o \
c_code/4_1/lexer.o \
c_code/4_1/nimlexbase.o \
c_code/4_1/llstream.o \
c_code/4_1/nimconf.o \
c_code/4_1/main.o \
c_code/4_1/ast.o \
c_code/4_1/stdlib_intsets.o \
c_code/4_1/idgen.o \
c_code/4_1/astalgo.o \
c_code/4_1/rodutils.o \
c_code/4_1/syntaxes.o \
c_code/4_1/parser.o \
c_code/4_1/pbraces.o \
c_code/4_1/filters.o \
c_code/4_1/renderer.o \
c_code/4_1/filter_tmpl.o \
c_code/4_1/rodread.o \
c_code/4_1/types.o \
c_code/4_1/trees.o \
c_code/4_1/stdlib_memfiles.o \
c_code/4_1/rodwrite.o \
c_code/4_1/passes.o \
c_code/4_1/magicsys.o \
c_code/4_1/nimsets.o \
c_code/4_1/bitsets.o \
c_code/4_1/importer.o \
c_code/4_1/lookups.o \
c_code/4_1/semdata.o \
c_code/4_1/treetab.o \
c_code/4_1/vmdef.o \
c_code/4_1/prettybase.o \
c_code/4_1/stdlib_lexbase.o \
c_code/4_1/sem.o \
c_code/4_1/semfold.o \
c_code/4_1/saturate.o \
c_code/4_1/procfind.o \
c_code/4_1/pragmas.o \
c_code/4_1/semtypinst.o \
c_code/4_1/sigmatch.o \
c_code/4_1/parampatterns.o \
c_code/4_1/pretty.o \
c_code/4_1/docgen.o \
c_code/4_1/docutils_rstast.o \
c_code/4_1/stdlib_json.o \
c_code/4_1/stdlib_unicode.o \
c_code/4_1/docutils_rst.o \
c_code/4_1/docutils_rstgen.o \
c_code/4_1/docutils_highlite.o \
c_code/4_1/stdlib_sequtils.o \
c_code/4_1/stdlib_algorithm.o \
c_code/4_1/sempass2.o \
c_code/4_1/guards.o \
c_code/4_1/stdlib_xmltree.o \
c_code/4_1/stdlib_macros.o \
c_code/4_1/stdlib_cgi.o \
c_code/4_1/stdlib_cookies.o \
c_code/4_1/typesrenderer.o \
c_code/4_1/transf.o \
c_code/4_1/cgmeth.o \
c_code/4_1/lambdalifting.o \
c_code/4_1/lowerings.o \
c_code/4_1/vm.o \
c_code/4_1/vmgen.o \
c_code/4_1/vmdeps.o \
c_code/4_1/evaltempl.o \
c_code/4_1/aliases.o \
c_code/4_1/patterns.o \
c_code/4_1/semmacrosanity.o \
c_code/4_1/semparallel.o \
c_code/4_1/cgen.o \
c_code/4_1/ccgutils.o \
c_code/4_1/cgendata.o \
c_code/4_1/ccgmerge.o \
c_code/4_1/jsgen.o \
c_code/4_1/passaux.o \
c_code/4_1/depends.o \
c_code/4_1/docgen2.o \
c_code/4_1/service.o \
c_code/4_1/modules.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/nim.c -o c_code/4_2/nim.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/nim.c -o c_code/4_2/nim.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_system.c -o c_code/4_2/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_system.c -o c_code/4_2/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/testability.c -o c_code/4_2/testability.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/testability.c -o c_code/4_2/testability.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/commands.c -o c_code/4_2/commands.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/commands.c -o c_code/4_2/commands.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_os.c -o c_code/4_2/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_os.c -o c_code/4_2/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_strutils.c -o c_code/4_2/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_strutils.c -o c_code/4_2/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_parseutils.c -o c_code/4_2/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_parseutils.c -o c_code/4_2/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_times.c -o c_code/4_2/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_times.c -o c_code/4_2/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_posix.c -o c_code/4_2/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_posix.c -o c_code/4_2/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/msgs.c -o c_code/4_2/msgs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/msgs.c -o c_code/4_2/msgs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/options.c -o c_code/4_2/options.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/options.c -o c_code/4_2/options.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/lists.c -o c_code/4_2/lists.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/lists.c -o c_code/4_2/lists.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_strtabs.c -o c_code/4_2/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_strtabs.c -o c_code/4_2/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_hashes.c -o c_code/4_2/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_hashes.c -o c_code/4_2/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_osproc.c -o c_code/4_2/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_osproc.c -o c_code/4_2/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_streams.c -o c_code/4_2/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_streams.c -o c_code/4_2/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_cpuinfo.c -o c_code/4_2/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_cpuinfo.c -o c_code/4_2/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_sets.c -o c_code/4_2/stdlib_sets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_sets.c -o c_code/4_2/stdlib_sets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_math.c -o c_code/4_2/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_math.c -o c_code/4_2/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_tables.c -o c_code/4_2/stdlib_tables.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_tables.c -o c_code/4_2/stdlib_tables.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/ropes.c -o c_code/4_2/ropes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/ropes.c -o c_code/4_2/ropes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/platform.c -o c_code/4_2/platform.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/platform.c -o c_code/4_2/platform.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/crc.c -o c_code/4_2/crc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/crc.c -o c_code/4_2/crc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_sockets.c -o c_code/4_2/stdlib_sockets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_sockets.c -o c_code/4_2/stdlib_sockets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_unsigned.c -o c_code/4_2/stdlib_unsigned.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_unsigned.c -o c_code/4_2/stdlib_unsigned.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/nversion.c -o c_code/4_2/nversion.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/nversion.c -o c_code/4_2/nversion.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/condsyms.c -o c_code/4_2/condsyms.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/condsyms.c -o c_code/4_2/condsyms.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/idents.c -o c_code/4_2/idents.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/idents.c -o c_code/4_2/idents.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/extccomp.c -o c_code/4_2/extccomp.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/extccomp.c -o c_code/4_2/extccomp.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/wordrecg.c -o c_code/4_2/wordrecg.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/wordrecg.c -o c_code/4_2/wordrecg.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/nimblecmd.c -o c_code/4_2/nimblecmd.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/nimblecmd.c -o c_code/4_2/nimblecmd.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_parseopt.c -o c_code/4_2/stdlib_parseopt.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_parseopt.c -o c_code/4_2/stdlib_parseopt.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/lexer.c -o c_code/4_2/lexer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/lexer.c -o c_code/4_2/lexer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/nimlexbase.c -o c_code/4_2/nimlexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/nimlexbase.c -o c_code/4_2/nimlexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/llstream.c -o c_code/4_2/llstream.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/llstream.c -o c_code/4_2/llstream.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/nimconf.c -o c_code/4_2/nimconf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/nimconf.c -o c_code/4_2/nimconf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/main.c -o c_code/4_2/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/main.c -o c_code/4_2/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/ast.c -o c_code/4_2/ast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/ast.c -o c_code/4_2/ast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_intsets.c -o c_code/4_2/stdlib_intsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_intsets.c -o c_code/4_2/stdlib_intsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/idgen.c -o c_code/4_2/idgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/idgen.c -o c_code/4_2/idgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/astalgo.c -o c_code/4_2/astalgo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/astalgo.c -o c_code/4_2/astalgo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/rodutils.c -o c_code/4_2/rodutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/rodutils.c -o c_code/4_2/rodutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/syntaxes.c -o c_code/4_2/syntaxes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/syntaxes.c -o c_code/4_2/syntaxes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/parser.c -o c_code/4_2/parser.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/parser.c -o c_code/4_2/parser.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/pbraces.c -o c_code/4_2/pbraces.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/pbraces.c -o c_code/4_2/pbraces.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/filters.c -o c_code/4_2/filters.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/filters.c -o c_code/4_2/filters.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/renderer.c -o c_code/4_2/renderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/renderer.c -o c_code/4_2/renderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/filter_tmpl.c -o c_code/4_2/filter_tmpl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/filter_tmpl.c -o c_code/4_2/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/rodread.c -o c_code/4_2/rodread.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/rodread.c -o c_code/4_2/rodread.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/types.c -o c_code/4_2/types.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/types.c -o c_code/4_2/types.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/trees.c -o c_code/4_2/trees.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/trees.c -o c_code/4_2/trees.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_memfiles.c -o c_code/4_2/stdlib_memfiles.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_memfiles.c -o c_code/4_2/stdlib_memfiles.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/rodwrite.c -o c_code/4_2/rodwrite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/rodwrite.c -o c_code/4_2/rodwrite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/passes.c -o c_code/4_2/passes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/passes.c -o c_code/4_2/passes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/magicsys.c -o c_code/4_2/magicsys.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/magicsys.c -o c_code/4_2/magicsys.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/nimsets.c -o c_code/4_2/nimsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/nimsets.c -o c_code/4_2/nimsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/bitsets.c -o c_code/4_2/bitsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/bitsets.c -o c_code/4_2/bitsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/importer.c -o c_code/4_2/importer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/importer.c -o c_code/4_2/importer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/lookups.c -o c_code/4_2/lookups.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/lookups.c -o c_code/4_2/lookups.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/semdata.c -o c_code/4_2/semdata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/semdata.c -o c_code/4_2/semdata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/treetab.c -o c_code/4_2/treetab.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/treetab.c -o c_code/4_2/treetab.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/vmdef.c -o c_code/4_2/vmdef.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/vmdef.c -o c_code/4_2/vmdef.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/prettybase.c -o c_code/4_2/prettybase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/prettybase.c -o c_code/4_2/prettybase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_lexbase.c -o c_code/4_2/stdlib_lexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_lexbase.c -o c_code/4_2/stdlib_lexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/sem.c -o c_code/4_2/sem.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/sem.c -o c_code/4_2/sem.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/semfold.c -o c_code/4_2/semfold.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/semfold.c -o c_code/4_2/semfold.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/saturate.c -o c_code/4_2/saturate.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/saturate.c -o c_code/4_2/saturate.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/procfind.c -o c_code/4_2/procfind.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/procfind.c -o c_code/4_2/procfind.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/pragmas.c -o c_code/4_2/pragmas.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/pragmas.c -o c_code/4_2/pragmas.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/semtypinst.c -o c_code/4_2/semtypinst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/semtypinst.c -o c_code/4_2/semtypinst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/sigmatch.c -o c_code/4_2/sigmatch.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/sigmatch.c -o c_code/4_2/sigmatch.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/parampatterns.c -o c_code/4_2/parampatterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/parampatterns.c -o c_code/4_2/parampatterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/pretty.c -o c_code/4_2/pretty.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/pretty.c -o c_code/4_2/pretty.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/docgen.c -o c_code/4_2/docgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/docgen.c -o c_code/4_2/docgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/docutils_rstast.c -o c_code/4_2/docutils_rstast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/docutils_rstast.c -o c_code/4_2/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_json.c -o c_code/4_2/stdlib_json.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_json.c -o c_code/4_2/stdlib_json.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_unicode.c -o c_code/4_2/stdlib_unicode.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_unicode.c -o c_code/4_2/stdlib_unicode.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/docutils_rst.c -o c_code/4_2/docutils_rst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/docutils_rst.c -o c_code/4_2/docutils_rst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/docutils_rstgen.c -o c_code/4_2/docutils_rstgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/docutils_rstgen.c -o c_code/4_2/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/docutils_highlite.c -o c_code/4_2/docutils_highlite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/docutils_highlite.c -o c_code/4_2/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_sequtils.c -o c_code/4_2/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_sequtils.c -o c_code/4_2/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_algorithm.c -o c_code/4_2/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_algorithm.c -o c_code/4_2/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/sempass2.c -o c_code/4_2/sempass2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/sempass2.c -o c_code/4_2/sempass2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/guards.c -o c_code/4_2/guards.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/guards.c -o c_code/4_2/guards.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_xmltree.c -o c_code/4_2/stdlib_xmltree.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_xmltree.c -o c_code/4_2/stdlib_xmltree.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_macros.c -o c_code/4_2/stdlib_macros.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_macros.c -o c_code/4_2/stdlib_macros.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_cgi.c -o c_code/4_2/stdlib_cgi.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_cgi.c -o c_code/4_2/stdlib_cgi.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_cookies.c -o c_code/4_2/stdlib_cookies.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_cookies.c -o c_code/4_2/stdlib_cookies.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/typesrenderer.c -o c_code/4_2/typesrenderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/typesrenderer.c -o c_code/4_2/typesrenderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/transf.c -o c_code/4_2/transf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/transf.c -o c_code/4_2/transf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/cgmeth.c -o c_code/4_2/cgmeth.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/cgmeth.c -o c_code/4_2/cgmeth.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/lambdalifting.c -o c_code/4_2/lambdalifting.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/lambdalifting.c -o c_code/4_2/lambdalifting.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/lowerings.c -o c_code/4_2/lowerings.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/lowerings.c -o c_code/4_2/lowerings.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/vm.c -o c_code/4_2/vm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/vm.c -o c_code/4_2/vm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/vmgen.c -o c_code/4_2/vmgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/vmgen.c -o c_code/4_2/vmgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/vmdeps.c -o c_code/4_2/vmdeps.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/vmdeps.c -o c_code/4_2/vmdeps.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/evaltempl.c -o c_code/4_2/evaltempl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/evaltempl.c -o c_code/4_2/evaltempl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/aliases.c -o c_code/4_2/aliases.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/aliases.c -o c_code/4_2/aliases.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/patterns.c -o c_code/4_2/patterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/patterns.c -o c_code/4_2/patterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/semmacrosanity.c -o c_code/4_2/semmacrosanity.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/semmacrosanity.c -o c_code/4_2/semmacrosanity.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/semparallel.c -o c_code/4_2/semparallel.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/semparallel.c -o c_code/4_2/semparallel.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/cgen.c -o c_code/4_2/cgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/cgen.c -o c_code/4_2/cgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/ccgutils.c -o c_code/4_2/ccgutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/ccgutils.c -o c_code/4_2/ccgutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/cgendata.c -o c_code/4_2/cgendata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/cgendata.c -o c_code/4_2/cgendata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/ccgmerge.c -o c_code/4_2/ccgmerge.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/ccgmerge.c -o c_code/4_2/ccgmerge.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/jsgen.c -o c_code/4_2/jsgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/jsgen.c -o c_code/4_2/jsgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/passaux.c -o c_code/4_2/passaux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/passaux.c -o c_code/4_2/passaux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/depends.c -o c_code/4_2/depends.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/depends.c -o c_code/4_2/depends.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/docgen2.c -o c_code/4_2/docgen2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/docgen2.c -o c_code/4_2/docgen2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/service.c -o c_code/4_2/service.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/service.c -o c_code/4_2/service.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/modules.c -o c_code/4_2/modules.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/modules.c -o c_code/4_2/modules.o
    echo "$LINKER -o $binDir/nim  \
c_code/4_2/nim.o \
c_code/4_2/stdlib_system.o \
c_code/4_2/testability.o \
c_code/4_2/commands.o \
c_code/4_2/stdlib_os.o \
c_code/4_2/stdlib_strutils.o \
c_code/4_2/stdlib_parseutils.o \
c_code/4_2/stdlib_times.o \
c_code/4_2/stdlib_posix.o \
c_code/4_2/msgs.o \
c_code/4_2/options.o \
c_code/4_2/lists.o \
c_code/4_2/stdlib_strtabs.o \
c_code/4_2/stdlib_hashes.o \
c_code/4_2/stdlib_osproc.o \
c_code/4_2/stdlib_streams.o \
c_code/4_2/stdlib_cpuinfo.o \
c_code/4_2/stdlib_sets.o \
c_code/4_2/stdlib_math.o \
c_code/4_2/stdlib_tables.o \
c_code/4_2/ropes.o \
c_code/4_2/platform.o \
c_code/4_2/crc.o \
c_code/4_2/stdlib_sockets.o \
c_code/4_2/stdlib_unsigned.o \
c_code/4_2/nversion.o \
c_code/4_2/condsyms.o \
c_code/4_2/idents.o \
c_code/4_2/extccomp.o \
c_code/4_2/wordrecg.o \
c_code/4_2/nimblecmd.o \
c_code/4_2/stdlib_parseopt.o \
c_code/4_2/lexer.o \
c_code/4_2/nimlexbase.o \
c_code/4_2/llstream.o \
c_code/4_2/nimconf.o \
c_code/4_2/main.o \
c_code/4_2/ast.o \
c_code/4_2/stdlib_intsets.o \
c_code/4_2/idgen.o \
c_code/4_2/astalgo.o \
c_code/4_2/rodutils.o \
c_code/4_2/syntaxes.o \
c_code/4_2/parser.o \
c_code/4_2/pbraces.o \
c_code/4_2/filters.o \
c_code/4_2/renderer.o \
c_code/4_2/filter_tmpl.o \
c_code/4_2/rodread.o \
c_code/4_2/types.o \
c_code/4_2/trees.o \
c_code/4_2/stdlib_memfiles.o \
c_code/4_2/rodwrite.o \
c_code/4_2/passes.o \
c_code/4_2/magicsys.o \
c_code/4_2/nimsets.o \
c_code/4_2/bitsets.o \
c_code/4_2/importer.o \
c_code/4_2/lookups.o \
c_code/4_2/semdata.o \
c_code/4_2/treetab.o \
c_code/4_2/vmdef.o \
c_code/4_2/prettybase.o \
c_code/4_2/stdlib_lexbase.o \
c_code/4_2/sem.o \
c_code/4_2/semfold.o \
c_code/4_2/saturate.o \
c_code/4_2/procfind.o \
c_code/4_2/pragmas.o \
c_code/4_2/semtypinst.o \
c_code/4_2/sigmatch.o \
c_code/4_2/parampatterns.o \
c_code/4_2/pretty.o \
c_code/4_2/docgen.o \
c_code/4_2/docutils_rstast.o \
c_code/4_2/stdlib_json.o \
c_code/4_2/stdlib_unicode.o \
c_code/4_2/docutils_rst.o \
c_code/4_2/docutils_rstgen.o \
c_code/4_2/docutils_highlite.o \
c_code/4_2/stdlib_sequtils.o \
c_code/4_2/stdlib_algorithm.o \
c_code/4_2/sempass2.o \
c_code/4_2/guards.o \
c_code/4_2/stdlib_xmltree.o \
c_code/4_2/stdlib_macros.o \
c_code/4_2/stdlib_cgi.o \
c_code/4_2/stdlib_cookies.o \
c_code/4_2/typesrenderer.o \
c_code/4_2/transf.o \
c_code/4_2/cgmeth.o \
c_code/4_2/lambdalifting.o \
c_code/4_2/lowerings.o \
c_code/4_2/vm.o \
c_code/4_2/vmgen.o \
c_code/4_2/vmdeps.o \
c_code/4_2/evaltempl.o \
c_code/4_2/aliases.o \
c_code/4_2/patterns.o \
c_code/4_2/semmacrosanity.o \
c_code/4_2/semparallel.o \
c_code/4_2/cgen.o \
c_code/4_2/ccgutils.o \
c_code/4_2/cgendata.o \
c_code/4_2/ccgmerge.o \
c_code/4_2/jsgen.o \
c_code/4_2/passaux.o \
c_code/4_2/depends.o \
c_code/4_2/docgen2.o \
c_code/4_2/service.o \
c_code/4_2/modules.o $LINK_FLAGS"
    $LINKER -o $binDir/nim  \
c_code/4_2/nim.o \
c_code/4_2/stdlib_system.o \
c_code/4_2/testability.o \
c_code/4_2/commands.o \
c_code/4_2/stdlib_os.o \
c_code/4_2/stdlib_strutils.o \
c_code/4_2/stdlib_parseutils.o \
c_code/4_2/stdlib_times.o \
c_code/4_2/stdlib_posix.o \
c_code/4_2/msgs.o \
c_code/4_2/options.o \
c_code/4_2/lists.o \
c_code/4_2/stdlib_strtabs.o \
c_code/4_2/stdlib_hashes.o \
c_code/4_2/stdlib_osproc.o \
c_code/4_2/stdlib_streams.o \
c_code/4_2/stdlib_cpuinfo.o \
c_code/4_2/stdlib_sets.o \
c_code/4_2/stdlib_math.o \
c_code/4_2/stdlib_tables.o \
c_code/4_2/ropes.o \
c_code/4_2/platform.o \
c_code/4_2/crc.o \
c_code/4_2/stdlib_sockets.o \
c_code/4_2/stdlib_unsigned.o \
c_code/4_2/nversion.o \
c_code/4_2/condsyms.o \
c_code/4_2/idents.o \
c_code/4_2/extccomp.o \
c_code/4_2/wordrecg.o \
c_code/4_2/nimblecmd.o \
c_code/4_2/stdlib_parseopt.o \
c_code/4_2/lexer.o \
c_code/4_2/nimlexbase.o \
c_code/4_2/llstream.o \
c_code/4_2/nimconf.o \
c_code/4_2/main.o \
c_code/4_2/ast.o \
c_code/4_2/stdlib_intsets.o \
c_code/4_2/idgen.o \
c_code/4_2/astalgo.o \
c_code/4_2/rodutils.o \
c_code/4_2/syntaxes.o \
c_code/4_2/parser.o \
c_code/4_2/pbraces.o \
c_code/4_2/filters.o \
c_code/4_2/renderer.o \
c_code/4_2/filter_tmpl.o \
c_code/4_2/rodread.o \
c_code/4_2/types.o \
c_code/4_2/trees.o \
c_code/4_2/stdlib_memfiles.o \
c_code/4_2/rodwrite.o \
c_code/4_2/passes.o \
c_code/4_2/magicsys.o \
c_code/4_2/nimsets.o \
c_code/4_2/bitsets.o \
c_code/4_2/importer.o \
c_code/4_2/lookups.o \
c_code/4_2/semdata.o \
c_code/4_2/treetab.o \
c_code/4_2/vmdef.o \
c_code/4_2/prettybase.o \
c_code/4_2/stdlib_lexbase.o \
c_code/4_2/sem.o \
c_code/4_2/semfold.o \
c_code/4_2/saturate.o \
c_code/4_2/procfind.o \
c_code/4_2/pragmas.o \
c_code/4_2/semtypinst.o \
c_code/4_2/sigmatch.o \
c_code/4_2/parampatterns.o \
c_code/4_2/pretty.o \
c_code/4_2/docgen.o \
c_code/4_2/docutils_rstast.o \
c_code/4_2/stdlib_json.o \
c_code/4_2/stdlib_unicode.o \
c_code/4_2/docutils_rst.o \
c_code/4_2/docutils_rstgen.o \
c_code/4_2/docutils_highlite.o \
c_code/4_2/stdlib_sequtils.o \
c_code/4_2/stdlib_algorithm.o \
c_code/4_2/sempass2.o \
c_code/4_2/guards.o \
c_code/4_2/stdlib_xmltree.o \
c_code/4_2/stdlib_macros.o \
c_code/4_2/stdlib_cgi.o \
c_code/4_2/stdlib_cookies.o \
c_code/4_2/typesrenderer.o \
c_code/4_2/transf.o \
c_code/4_2/cgmeth.o \
c_code/4_2/lambdalifting.o \
c_code/4_2/lowerings.o \
c_code/4_2/vm.o \
c_code/4_2/vmgen.o \
c_code/4_2/vmdeps.o \
c_code/4_2/evaltempl.o \
c_code/4_2/aliases.o \
c_code/4_2/patterns.o \
c_code/4_2/semmacrosanity.o \
c_code/4_2/semparallel.o \
c_code/4_2/cgen.o \
c_code/4_2/ccgutils.o \
c_code/4_2/cgendata.o \
c_code/4_2/ccgmerge.o \
c_code/4_2/jsgen.o \
c_code/4_2/passaux.o \
c_code/4_2/depends.o \
c_code/4_2/docgen2.o \
c_code/4_2/service.o \
c_code/4_2/modules.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/nim.c -o c_code/4_5/nim.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/nim.c -o c_code/4_5/nim.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_system.c -o c_code/4_5/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_system.c -o c_code/4_5/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/testability.c -o c_code/4_5/testability.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/testability.c -o c_code/4_5/testability.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/commands.c -o c_code/4_5/commands.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/commands.c -o c_code/4_5/commands.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_os.c -o c_code/4_5/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_os.c -o c_code/4_5/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_strutils.c -o c_code/4_5/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_strutils.c -o c_code/4_5/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_parseutils.c -o c_code/4_5/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_parseutils.c -o c_code/4_5/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_times.c -o c_code/4_5/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_times.c -o c_code/4_5/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_posix.c -o c_code/4_5/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_posix.c -o c_code/4_5/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/msgs.c -o c_code/4_5/msgs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/msgs.c -o c_code/4_5/msgs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/options.c -o c_code/4_5/options.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/options.c -o c_code/4_5/options.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/lists.c -o c_code/4_5/lists.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/lists.c -o c_code/4_5/lists.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_strtabs.c -o c_code/4_5/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_strtabs.c -o c_code/4_5/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_hashes.c -o c_code/4_5/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_hashes.c -o c_code/4_5/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_osproc.c -o c_code/4_5/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_osproc.c -o c_code/4_5/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_streams.c -o c_code/4_5/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_streams.c -o c_code/4_5/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_cpuinfo.c -o c_code/4_5/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_cpuinfo.c -o c_code/4_5/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_sets.c -o c_code/4_5/stdlib_sets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_sets.c -o c_code/4_5/stdlib_sets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_math.c -o c_code/4_5/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_math.c -o c_code/4_5/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_tables.c -o c_code/4_5/stdlib_tables.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_tables.c -o c_code/4_5/stdlib_tables.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/ropes.c -o c_code/4_5/ropes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/ropes.c -o c_code/4_5/ropes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/platform.c -o c_code/4_5/platform.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/platform.c -o c_code/4_5/platform.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/crc.c -o c_code/4_5/crc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/crc.c -o c_code/4_5/crc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_sockets.c -o c_code/4_5/stdlib_sockets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_sockets.c -o c_code/4_5/stdlib_sockets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_unsigned.c -o c_code/4_5/stdlib_unsigned.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_unsigned.c -o c_code/4_5/stdlib_unsigned.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/nversion.c -o c_code/4_5/nversion.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/nversion.c -o c_code/4_5/nversion.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/condsyms.c -o c_code/4_5/condsyms.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/condsyms.c -o c_code/4_5/condsyms.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/idents.c -o c_code/4_5/idents.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/idents.c -o c_code/4_5/idents.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/extccomp.c -o c_code/4_5/extccomp.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/extccomp.c -o c_code/4_5/extccomp.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/wordrecg.c -o c_code/4_5/wordrecg.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/wordrecg.c -o c_code/4_5/wordrecg.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/nimblecmd.c -o c_code/4_5/nimblecmd.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/nimblecmd.c -o c_code/4_5/nimblecmd.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_parseopt.c -o c_code/4_5/stdlib_parseopt.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_parseopt.c -o c_code/4_5/stdlib_parseopt.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/lexer.c -o c_code/4_5/lexer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/lexer.c -o c_code/4_5/lexer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/nimlexbase.c -o c_code/4_5/nimlexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/nimlexbase.c -o c_code/4_5/nimlexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/llstream.c -o c_code/4_5/llstream.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/llstream.c -o c_code/4_5/llstream.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/nimconf.c -o c_code/4_5/nimconf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/nimconf.c -o c_code/4_5/nimconf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/main.c -o c_code/4_5/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/main.c -o c_code/4_5/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/ast.c -o c_code/4_5/ast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/ast.c -o c_code/4_5/ast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_intsets.c -o c_code/4_5/stdlib_intsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_intsets.c -o c_code/4_5/stdlib_intsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/idgen.c -o c_code/4_5/idgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/idgen.c -o c_code/4_5/idgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/astalgo.c -o c_code/4_5/astalgo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/astalgo.c -o c_code/4_5/astalgo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/rodutils.c -o c_code/4_5/rodutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/rodutils.c -o c_code/4_5/rodutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/syntaxes.c -o c_code/4_5/syntaxes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/syntaxes.c -o c_code/4_5/syntaxes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/parser.c -o c_code/4_5/parser.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/parser.c -o c_code/4_5/parser.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/pbraces.c -o c_code/4_5/pbraces.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/pbraces.c -o c_code/4_5/pbraces.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/filters.c -o c_code/4_5/filters.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/filters.c -o c_code/4_5/filters.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/renderer.c -o c_code/4_5/renderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/renderer.c -o c_code/4_5/renderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/filter_tmpl.c -o c_code/4_5/filter_tmpl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/filter_tmpl.c -o c_code/4_5/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/rodread.c -o c_code/4_5/rodread.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/rodread.c -o c_code/4_5/rodread.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/types.c -o c_code/4_5/types.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/types.c -o c_code/4_5/types.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/trees.c -o c_code/4_5/trees.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/trees.c -o c_code/4_5/trees.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_memfiles.c -o c_code/4_5/stdlib_memfiles.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_memfiles.c -o c_code/4_5/stdlib_memfiles.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/rodwrite.c -o c_code/4_5/rodwrite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/rodwrite.c -o c_code/4_5/rodwrite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/passes.c -o c_code/4_5/passes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/passes.c -o c_code/4_5/passes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/magicsys.c -o c_code/4_5/magicsys.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/magicsys.c -o c_code/4_5/magicsys.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/nimsets.c -o c_code/4_5/nimsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/nimsets.c -o c_code/4_5/nimsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/bitsets.c -o c_code/4_5/bitsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/bitsets.c -o c_code/4_5/bitsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/importer.c -o c_code/4_5/importer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/importer.c -o c_code/4_5/importer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/lookups.c -o c_code/4_5/lookups.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/lookups.c -o c_code/4_5/lookups.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/semdata.c -o c_code/4_5/semdata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/semdata.c -o c_code/4_5/semdata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/treetab.c -o c_code/4_5/treetab.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/treetab.c -o c_code/4_5/treetab.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/vmdef.c -o c_code/4_5/vmdef.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/vmdef.c -o c_code/4_5/vmdef.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/prettybase.c -o c_code/4_5/prettybase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/prettybase.c -o c_code/4_5/prettybase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_lexbase.c -o c_code/4_5/stdlib_lexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_lexbase.c -o c_code/4_5/stdlib_lexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/sem.c -o c_code/4_5/sem.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/sem.c -o c_code/4_5/sem.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/semfold.c -o c_code/4_5/semfold.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/semfold.c -o c_code/4_5/semfold.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/saturate.c -o c_code/4_5/saturate.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/saturate.c -o c_code/4_5/saturate.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/procfind.c -o c_code/4_5/procfind.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/procfind.c -o c_code/4_5/procfind.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/pragmas.c -o c_code/4_5/pragmas.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/pragmas.c -o c_code/4_5/pragmas.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/semtypinst.c -o c_code/4_5/semtypinst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/semtypinst.c -o c_code/4_5/semtypinst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/sigmatch.c -o c_code/4_5/sigmatch.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/sigmatch.c -o c_code/4_5/sigmatch.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/parampatterns.c -o c_code/4_5/parampatterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/parampatterns.c -o c_code/4_5/parampatterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/pretty.c -o c_code/4_5/pretty.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/pretty.c -o c_code/4_5/pretty.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/docgen.c -o c_code/4_5/docgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/docgen.c -o c_code/4_5/docgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/docutils_rstast.c -o c_code/4_5/docutils_rstast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/docutils_rstast.c -o c_code/4_5/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_json.c -o c_code/4_5/stdlib_json.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_json.c -o c_code/4_5/stdlib_json.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_unicode.c -o c_code/4_5/stdlib_unicode.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_unicode.c -o c_code/4_5/stdlib_unicode.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/docutils_rst.c -o c_code/4_5/docutils_rst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/docutils_rst.c -o c_code/4_5/docutils_rst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/docutils_rstgen.c -o c_code/4_5/docutils_rstgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/docutils_rstgen.c -o c_code/4_5/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/docutils_highlite.c -o c_code/4_5/docutils_highlite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/docutils_highlite.c -o c_code/4_5/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_sequtils.c -o c_code/4_5/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_sequtils.c -o c_code/4_5/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_algorithm.c -o c_code/4_5/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_algorithm.c -o c_code/4_5/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/sempass2.c -o c_code/4_5/sempass2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/sempass2.c -o c_code/4_5/sempass2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/guards.c -o c_code/4_5/guards.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/guards.c -o c_code/4_5/guards.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_xmltree.c -o c_code/4_5/stdlib_xmltree.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_xmltree.c -o c_code/4_5/stdlib_xmltree.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_macros.c -o c_code/4_5/stdlib_macros.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_macros.c -o c_code/4_5/stdlib_macros.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_cgi.c -o c_code/4_5/stdlib_cgi.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_cgi.c -o c_code/4_5/stdlib_cgi.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_cookies.c -o c_code/4_5/stdlib_cookies.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_cookies.c -o c_code/4_5/stdlib_cookies.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/typesrenderer.c -o c_code/4_5/typesrenderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/typesrenderer.c -o c_code/4_5/typesrenderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/transf.c -o c_code/4_5/transf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/transf.c -o c_code/4_5/transf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/cgmeth.c -o c_code/4_5/cgmeth.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/cgmeth.c -o c_code/4_5/cgmeth.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/lambdalifting.c -o c_code/4_5/lambdalifting.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/lambdalifting.c -o c_code/4_5/lambdalifting.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/lowerings.c -o c_code/4_5/lowerings.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/lowerings.c -o c_code/4_5/lowerings.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/vm.c -o c_code/4_5/vm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/vm.c -o c_code/4_5/vm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/vmgen.c -o c_code/4_5/vmgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/vmgen.c -o c_code/4_5/vmgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/vmdeps.c -o c_code/4_5/vmdeps.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/vmdeps.c -o c_code/4_5/vmdeps.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/evaltempl.c -o c_code/4_5/evaltempl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/evaltempl.c -o c_code/4_5/evaltempl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/aliases.c -o c_code/4_5/aliases.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/aliases.c -o c_code/4_5/aliases.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/patterns.c -o c_code/4_5/patterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/patterns.c -o c_code/4_5/patterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/semmacrosanity.c -o c_code/4_5/semmacrosanity.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/semmacrosanity.c -o c_code/4_5/semmacrosanity.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/semparallel.c -o c_code/4_5/semparallel.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/semparallel.c -o c_code/4_5/semparallel.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/cgen.c -o c_code/4_5/cgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/cgen.c -o c_code/4_5/cgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/ccgutils.c -o c_code/4_5/ccgutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/ccgutils.c -o c_code/4_5/ccgutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/cgendata.c -o c_code/4_5/cgendata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/cgendata.c -o c_code/4_5/cgendata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/ccgmerge.c -o c_code/4_5/ccgmerge.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/ccgmerge.c -o c_code/4_5/ccgmerge.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/jsgen.c -o c_code/4_5/jsgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/jsgen.c -o c_code/4_5/jsgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/passaux.c -o c_code/4_5/passaux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/passaux.c -o c_code/4_5/passaux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/depends.c -o c_code/4_5/depends.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/depends.c -o c_code/4_5/depends.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/docgen2.c -o c_code/4_5/docgen2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/docgen2.c -o c_code/4_5/docgen2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/service.c -o c_code/4_5/service.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/service.c -o c_code/4_5/service.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/modules.c -o c_code/4_5/modules.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/modules.c -o c_code/4_5/modules.o
    echo "$LINKER -o $binDir/nim  \
c_code/4_5/nim.o \
c_code/4_5/stdlib_system.o \
c_code/4_5/testability.o \
c_code/4_5/commands.o \
c_code/4_5/stdlib_os.o \
c_code/4_5/stdlib_strutils.o \
c_code/4_5/stdlib_parseutils.o \
c_code/4_5/stdlib_times.o \
c_code/4_5/stdlib_posix.o \
c_code/4_5/msgs.o \
c_code/4_5/options.o \
c_code/4_5/lists.o \
c_code/4_5/stdlib_strtabs.o \
c_code/4_5/stdlib_hashes.o \
c_code/4_5/stdlib_osproc.o \
c_code/4_5/stdlib_streams.o \
c_code/4_5/stdlib_cpuinfo.o \
c_code/4_5/stdlib_sets.o \
c_code/4_5/stdlib_math.o \
c_code/4_5/stdlib_tables.o \
c_code/4_5/ropes.o \
c_code/4_5/platform.o \
c_code/4_5/crc.o \
c_code/4_5/stdlib_sockets.o \
c_code/4_5/stdlib_unsigned.o \
c_code/4_5/nversion.o \
c_code/4_5/condsyms.o \
c_code/4_5/idents.o \
c_code/4_5/extccomp.o \
c_code/4_5/wordrecg.o \
c_code/4_5/nimblecmd.o \
c_code/4_5/stdlib_parseopt.o \
c_code/4_5/lexer.o \
c_code/4_5/nimlexbase.o \
c_code/4_5/llstream.o \
c_code/4_5/nimconf.o \
c_code/4_5/main.o \
c_code/4_5/ast.o \
c_code/4_5/stdlib_intsets.o \
c_code/4_5/idgen.o \
c_code/4_5/astalgo.o \
c_code/4_5/rodutils.o \
c_code/4_5/syntaxes.o \
c_code/4_5/parser.o \
c_code/4_5/pbraces.o \
c_code/4_5/filters.o \
c_code/4_5/renderer.o \
c_code/4_5/filter_tmpl.o \
c_code/4_5/rodread.o \
c_code/4_5/types.o \
c_code/4_5/trees.o \
c_code/4_5/stdlib_memfiles.o \
c_code/4_5/rodwrite.o \
c_code/4_5/passes.o \
c_code/4_5/magicsys.o \
c_code/4_5/nimsets.o \
c_code/4_5/bitsets.o \
c_code/4_5/importer.o \
c_code/4_5/lookups.o \
c_code/4_5/semdata.o \
c_code/4_5/treetab.o \
c_code/4_5/vmdef.o \
c_code/4_5/prettybase.o \
c_code/4_5/stdlib_lexbase.o \
c_code/4_5/sem.o \
c_code/4_5/semfold.o \
c_code/4_5/saturate.o \
c_code/4_5/procfind.o \
c_code/4_5/pragmas.o \
c_code/4_5/semtypinst.o \
c_code/4_5/sigmatch.o \
c_code/4_5/parampatterns.o \
c_code/4_5/pretty.o \
c_code/4_5/docgen.o \
c_code/4_5/docutils_rstast.o \
c_code/4_5/stdlib_json.o \
c_code/4_5/stdlib_unicode.o \
c_code/4_5/docutils_rst.o \
c_code/4_5/docutils_rstgen.o \
c_code/4_5/docutils_highlite.o \
c_code/4_5/stdlib_sequtils.o \
c_code/4_5/stdlib_algorithm.o \
c_code/4_5/sempass2.o \
c_code/4_5/guards.o \
c_code/4_5/stdlib_xmltree.o \
c_code/4_5/stdlib_macros.o \
c_code/4_5/stdlib_cgi.o \
c_code/4_5/stdlib_cookies.o \
c_code/4_5/typesrenderer.o \
c_code/4_5/transf.o \
c_code/4_5/cgmeth.o \
c_code/4_5/lambdalifting.o \
c_code/4_5/lowerings.o \
c_code/4_5/vm.o \
c_code/4_5/vmgen.o \
c_code/4_5/vmdeps.o \
c_code/4_5/evaltempl.o \
c_code/4_5/aliases.o \
c_code/4_5/patterns.o \
c_code/4_5/semmacrosanity.o \
c_code/4_5/semparallel.o \
c_code/4_5/cgen.o \
c_code/4_5/ccgutils.o \
c_code/4_5/cgendata.o \
c_code/4_5/ccgmerge.o \
c_code/4_5/jsgen.o \
c_code/4_5/passaux.o \
c_code/4_5/depends.o \
c_code/4_5/docgen2.o \
c_code/4_5/service.o \
c_code/4_5/modules.o $LINK_FLAGS"
    $LINKER -o $binDir/nim  \
c_code/4_5/nim.o \
c_code/4_5/stdlib_system.o \
c_code/4_5/testability.o \
c_code/4_5/commands.o \
c_code/4_5/stdlib_os.o \
c_code/4_5/stdlib_strutils.o \
c_code/4_5/stdlib_parseutils.o \
c_code/4_5/stdlib_times.o \
c_code/4_5/stdlib_posix.o \
c_code/4_5/msgs.o \
c_code/4_5/options.o \
c_code/4_5/lists.o \
c_code/4_5/stdlib_strtabs.o \
c_code/4_5/stdlib_hashes.o \
c_code/4_5/stdlib_osproc.o \
c_code/4_5/stdlib_streams.o \
c_code/4_5/stdlib_cpuinfo.o \
c_code/4_5/stdlib_sets.o \
c_code/4_5/stdlib_math.o \
c_code/4_5/stdlib_tables.o \
c_code/4_5/ropes.o \
c_code/4_5/platform.o \
c_code/4_5/crc.o \
c_code/4_5/stdlib_sockets.o \
c_code/4_5/stdlib_unsigned.o \
c_code/4_5/nversion.o \
c_code/4_5/condsyms.o \
c_code/4_5/idents.o \
c_code/4_5/extccomp.o \
c_code/4_5/wordrecg.o \
c_code/4_5/nimblecmd.o \
c_code/4_5/stdlib_parseopt.o \
c_code/4_5/lexer.o \
c_code/4_5/nimlexbase.o \
c_code/4_5/llstream.o \
c_code/4_5/nimconf.o \
c_code/4_5/main.o \
c_code/4_5/ast.o \
c_code/4_5/stdlib_intsets.o \
c_code/4_5/idgen.o \
c_code/4_5/astalgo.o \
c_code/4_5/rodutils.o \
c_code/4_5/syntaxes.o \
c_code/4_5/parser.o \
c_code/4_5/pbraces.o \
c_code/4_5/filters.o \
c_code/4_5/renderer.o \
c_code/4_5/filter_tmpl.o \
c_code/4_5/rodread.o \
c_code/4_5/types.o \
c_code/4_5/trees.o \
c_code/4_5/stdlib_memfiles.o \
c_code/4_5/rodwrite.o \
c_code/4_5/passes.o \
c_code/4_5/magicsys.o \
c_code/4_5/nimsets.o \
c_code/4_5/bitsets.o \
c_code/4_5/importer.o \
c_code/4_5/lookups.o \
c_code/4_5/semdata.o \
c_code/4_5/treetab.o \
c_code/4_5/vmdef.o \
c_code/4_5/prettybase.o \
c_code/4_5/stdlib_lexbase.o \
c_code/4_5/sem.o \
c_code/4_5/semfold.o \
c_code/4_5/saturate.o \
c_code/4_5/procfind.o \
c_code/4_5/pragmas.o \
c_code/4_5/semtypinst.o \
c_code/4_5/sigmatch.o \
c_code/4_5/parampatterns.o \
c_code/4_5/pretty.o \
c_code/4_5/docgen.o \
c_code/4_5/docutils_rstast.o \
c_code/4_5/stdlib_json.o \
c_code/4_5/stdlib_unicode.o \
c_code/4_5/docutils_rst.o \
c_code/4_5/docutils_rstgen.o \
c_code/4_5/docutils_highlite.o \
c_code/4_5/stdlib_sequtils.o \
c_code/4_5/stdlib_algorithm.o \
c_code/4_5/sempass2.o \
c_code/4_5/guards.o \
c_code/4_5/stdlib_xmltree.o \
c_code/4_5/stdlib_macros.o \
c_code/4_5/stdlib_cgi.o \
c_code/4_5/stdlib_cookies.o \
c_code/4_5/typesrenderer.o \
c_code/4_5/transf.o \
c_code/4_5/cgmeth.o \
c_code/4_5/lambdalifting.o \
c_code/4_5/lowerings.o \
c_code/4_5/vm.o \
c_code/4_5/vmgen.o \
c_code/4_5/vmdeps.o \
c_code/4_5/evaltempl.o \
c_code/4_5/aliases.o \
c_code/4_5/patterns.o \
c_code/4_5/semmacrosanity.o \
c_code/4_5/semparallel.o \
c_code/4_5/cgen.o \
c_code/4_5/ccgutils.o \
c_code/4_5/cgendata.o \
c_code/4_5/ccgmerge.o \
c_code/4_5/jsgen.o \
c_code/4_5/passaux.o \
c_code/4_5/depends.o \
c_code/4_5/docgen2.o \
c_code/4_5/service.o \
c_code/4_5/modules.o $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
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
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/nim.c -o c_code/5_1/nim.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/nim.c -o c_code/5_1/nim.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_system.c -o c_code/5_1/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_system.c -o c_code/5_1/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/testability.c -o c_code/5_1/testability.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/testability.c -o c_code/5_1/testability.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/commands.c -o c_code/5_1/commands.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/commands.c -o c_code/5_1/commands.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_os.c -o c_code/5_1/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_os.c -o c_code/5_1/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_strutils.c -o c_code/5_1/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_strutils.c -o c_code/5_1/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_parseutils.c -o c_code/5_1/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_parseutils.c -o c_code/5_1/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_times.c -o c_code/5_1/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_times.c -o c_code/5_1/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_posix.c -o c_code/5_1/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_posix.c -o c_code/5_1/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/msgs.c -o c_code/5_1/msgs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/msgs.c -o c_code/5_1/msgs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/options.c -o c_code/5_1/options.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/options.c -o c_code/5_1/options.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/lists.c -o c_code/5_1/lists.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/lists.c -o c_code/5_1/lists.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_strtabs.c -o c_code/5_1/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_strtabs.c -o c_code/5_1/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_hashes.c -o c_code/5_1/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_hashes.c -o c_code/5_1/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_osproc.c -o c_code/5_1/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_osproc.c -o c_code/5_1/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_streams.c -o c_code/5_1/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_streams.c -o c_code/5_1/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_cpuinfo.c -o c_code/5_1/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_cpuinfo.c -o c_code/5_1/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_sets.c -o c_code/5_1/stdlib_sets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_sets.c -o c_code/5_1/stdlib_sets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_math.c -o c_code/5_1/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_math.c -o c_code/5_1/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_tables.c -o c_code/5_1/stdlib_tables.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_tables.c -o c_code/5_1/stdlib_tables.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/ropes.c -o c_code/5_1/ropes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/ropes.c -o c_code/5_1/ropes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/platform.c -o c_code/5_1/platform.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/platform.c -o c_code/5_1/platform.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/crc.c -o c_code/5_1/crc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/crc.c -o c_code/5_1/crc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_sockets.c -o c_code/5_1/stdlib_sockets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_sockets.c -o c_code/5_1/stdlib_sockets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_unsigned.c -o c_code/5_1/stdlib_unsigned.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_unsigned.c -o c_code/5_1/stdlib_unsigned.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/nversion.c -o c_code/5_1/nversion.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/nversion.c -o c_code/5_1/nversion.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/condsyms.c -o c_code/5_1/condsyms.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/condsyms.c -o c_code/5_1/condsyms.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/idents.c -o c_code/5_1/idents.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/idents.c -o c_code/5_1/idents.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/extccomp.c -o c_code/5_1/extccomp.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/extccomp.c -o c_code/5_1/extccomp.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/wordrecg.c -o c_code/5_1/wordrecg.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/wordrecg.c -o c_code/5_1/wordrecg.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/nimblecmd.c -o c_code/5_1/nimblecmd.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/nimblecmd.c -o c_code/5_1/nimblecmd.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_parseopt.c -o c_code/5_1/stdlib_parseopt.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_parseopt.c -o c_code/5_1/stdlib_parseopt.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/lexer.c -o c_code/5_1/lexer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/lexer.c -o c_code/5_1/lexer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/nimlexbase.c -o c_code/5_1/nimlexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/nimlexbase.c -o c_code/5_1/nimlexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/llstream.c -o c_code/5_1/llstream.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/llstream.c -o c_code/5_1/llstream.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/nimconf.c -o c_code/5_1/nimconf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/nimconf.c -o c_code/5_1/nimconf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/main.c -o c_code/5_1/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/main.c -o c_code/5_1/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/ast.c -o c_code/5_1/ast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/ast.c -o c_code/5_1/ast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_intsets.c -o c_code/5_1/stdlib_intsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_intsets.c -o c_code/5_1/stdlib_intsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/idgen.c -o c_code/5_1/idgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/idgen.c -o c_code/5_1/idgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/astalgo.c -o c_code/5_1/astalgo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/astalgo.c -o c_code/5_1/astalgo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/rodutils.c -o c_code/5_1/rodutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/rodutils.c -o c_code/5_1/rodutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/syntaxes.c -o c_code/5_1/syntaxes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/syntaxes.c -o c_code/5_1/syntaxes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/parser.c -o c_code/5_1/parser.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/parser.c -o c_code/5_1/parser.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/pbraces.c -o c_code/5_1/pbraces.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/pbraces.c -o c_code/5_1/pbraces.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/filters.c -o c_code/5_1/filters.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/filters.c -o c_code/5_1/filters.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/renderer.c -o c_code/5_1/renderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/renderer.c -o c_code/5_1/renderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/filter_tmpl.c -o c_code/5_1/filter_tmpl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/filter_tmpl.c -o c_code/5_1/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/rodread.c -o c_code/5_1/rodread.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/rodread.c -o c_code/5_1/rodread.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/types.c -o c_code/5_1/types.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/types.c -o c_code/5_1/types.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/trees.c -o c_code/5_1/trees.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/trees.c -o c_code/5_1/trees.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_memfiles.c -o c_code/5_1/stdlib_memfiles.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_memfiles.c -o c_code/5_1/stdlib_memfiles.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/rodwrite.c -o c_code/5_1/rodwrite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/rodwrite.c -o c_code/5_1/rodwrite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/passes.c -o c_code/5_1/passes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/passes.c -o c_code/5_1/passes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/magicsys.c -o c_code/5_1/magicsys.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/magicsys.c -o c_code/5_1/magicsys.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/nimsets.c -o c_code/5_1/nimsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/nimsets.c -o c_code/5_1/nimsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/bitsets.c -o c_code/5_1/bitsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/bitsets.c -o c_code/5_1/bitsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/importer.c -o c_code/5_1/importer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/importer.c -o c_code/5_1/importer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/lookups.c -o c_code/5_1/lookups.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/lookups.c -o c_code/5_1/lookups.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/semdata.c -o c_code/5_1/semdata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/semdata.c -o c_code/5_1/semdata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/treetab.c -o c_code/5_1/treetab.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/treetab.c -o c_code/5_1/treetab.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/vmdef.c -o c_code/5_1/vmdef.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/vmdef.c -o c_code/5_1/vmdef.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/prettybase.c -o c_code/5_1/prettybase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/prettybase.c -o c_code/5_1/prettybase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_lexbase.c -o c_code/5_1/stdlib_lexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_lexbase.c -o c_code/5_1/stdlib_lexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/sem.c -o c_code/5_1/sem.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/sem.c -o c_code/5_1/sem.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/semfold.c -o c_code/5_1/semfold.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/semfold.c -o c_code/5_1/semfold.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/saturate.c -o c_code/5_1/saturate.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/saturate.c -o c_code/5_1/saturate.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/procfind.c -o c_code/5_1/procfind.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/procfind.c -o c_code/5_1/procfind.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/pragmas.c -o c_code/5_1/pragmas.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/pragmas.c -o c_code/5_1/pragmas.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/semtypinst.c -o c_code/5_1/semtypinst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/semtypinst.c -o c_code/5_1/semtypinst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/sigmatch.c -o c_code/5_1/sigmatch.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/sigmatch.c -o c_code/5_1/sigmatch.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/parampatterns.c -o c_code/5_1/parampatterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/parampatterns.c -o c_code/5_1/parampatterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/pretty.c -o c_code/5_1/pretty.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/pretty.c -o c_code/5_1/pretty.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/docgen.c -o c_code/5_1/docgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/docgen.c -o c_code/5_1/docgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/docutils_rstast.c -o c_code/5_1/docutils_rstast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/docutils_rstast.c -o c_code/5_1/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_json.c -o c_code/5_1/stdlib_json.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_json.c -o c_code/5_1/stdlib_json.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_unicode.c -o c_code/5_1/stdlib_unicode.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_unicode.c -o c_code/5_1/stdlib_unicode.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/docutils_rst.c -o c_code/5_1/docutils_rst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/docutils_rst.c -o c_code/5_1/docutils_rst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/docutils_rstgen.c -o c_code/5_1/docutils_rstgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/docutils_rstgen.c -o c_code/5_1/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/docutils_highlite.c -o c_code/5_1/docutils_highlite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/docutils_highlite.c -o c_code/5_1/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_sequtils.c -o c_code/5_1/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_sequtils.c -o c_code/5_1/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_algorithm.c -o c_code/5_1/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_algorithm.c -o c_code/5_1/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/sempass2.c -o c_code/5_1/sempass2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/sempass2.c -o c_code/5_1/sempass2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/guards.c -o c_code/5_1/guards.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/guards.c -o c_code/5_1/guards.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_xmltree.c -o c_code/5_1/stdlib_xmltree.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_xmltree.c -o c_code/5_1/stdlib_xmltree.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_macros.c -o c_code/5_1/stdlib_macros.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_macros.c -o c_code/5_1/stdlib_macros.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_cgi.c -o c_code/5_1/stdlib_cgi.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_cgi.c -o c_code/5_1/stdlib_cgi.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_cookies.c -o c_code/5_1/stdlib_cookies.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_cookies.c -o c_code/5_1/stdlib_cookies.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/typesrenderer.c -o c_code/5_1/typesrenderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/typesrenderer.c -o c_code/5_1/typesrenderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/transf.c -o c_code/5_1/transf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/transf.c -o c_code/5_1/transf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/cgmeth.c -o c_code/5_1/cgmeth.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/cgmeth.c -o c_code/5_1/cgmeth.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/lambdalifting.c -o c_code/5_1/lambdalifting.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/lambdalifting.c -o c_code/5_1/lambdalifting.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/lowerings.c -o c_code/5_1/lowerings.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/lowerings.c -o c_code/5_1/lowerings.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/vm.c -o c_code/5_1/vm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/vm.c -o c_code/5_1/vm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/vmgen.c -o c_code/5_1/vmgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/vmgen.c -o c_code/5_1/vmgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/vmdeps.c -o c_code/5_1/vmdeps.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/vmdeps.c -o c_code/5_1/vmdeps.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/evaltempl.c -o c_code/5_1/evaltempl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/evaltempl.c -o c_code/5_1/evaltempl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/aliases.c -o c_code/5_1/aliases.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/aliases.c -o c_code/5_1/aliases.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/patterns.c -o c_code/5_1/patterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/patterns.c -o c_code/5_1/patterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/semmacrosanity.c -o c_code/5_1/semmacrosanity.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/semmacrosanity.c -o c_code/5_1/semmacrosanity.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/semparallel.c -o c_code/5_1/semparallel.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/semparallel.c -o c_code/5_1/semparallel.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/cgen.c -o c_code/5_1/cgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/cgen.c -o c_code/5_1/cgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/ccgutils.c -o c_code/5_1/ccgutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/ccgutils.c -o c_code/5_1/ccgutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/cgendata.c -o c_code/5_1/cgendata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/cgendata.c -o c_code/5_1/cgendata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/ccgmerge.c -o c_code/5_1/ccgmerge.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/ccgmerge.c -o c_code/5_1/ccgmerge.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/jsgen.c -o c_code/5_1/jsgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/jsgen.c -o c_code/5_1/jsgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/passaux.c -o c_code/5_1/passaux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/passaux.c -o c_code/5_1/passaux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/depends.c -o c_code/5_1/depends.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/depends.c -o c_code/5_1/depends.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/docgen2.c -o c_code/5_1/docgen2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/docgen2.c -o c_code/5_1/docgen2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/service.c -o c_code/5_1/service.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/service.c -o c_code/5_1/service.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/modules.c -o c_code/5_1/modules.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/modules.c -o c_code/5_1/modules.o
    echo "$LINKER -o $binDir/nim  \
c_code/5_1/nim.o \
c_code/5_1/stdlib_system.o \
c_code/5_1/testability.o \
c_code/5_1/commands.o \
c_code/5_1/stdlib_os.o \
c_code/5_1/stdlib_strutils.o \
c_code/5_1/stdlib_parseutils.o \
c_code/5_1/stdlib_times.o \
c_code/5_1/stdlib_posix.o \
c_code/5_1/msgs.o \
c_code/5_1/options.o \
c_code/5_1/lists.o \
c_code/5_1/stdlib_strtabs.o \
c_code/5_1/stdlib_hashes.o \
c_code/5_1/stdlib_osproc.o \
c_code/5_1/stdlib_streams.o \
c_code/5_1/stdlib_cpuinfo.o \
c_code/5_1/stdlib_sets.o \
c_code/5_1/stdlib_math.o \
c_code/5_1/stdlib_tables.o \
c_code/5_1/ropes.o \
c_code/5_1/platform.o \
c_code/5_1/crc.o \
c_code/5_1/stdlib_sockets.o \
c_code/5_1/stdlib_unsigned.o \
c_code/5_1/nversion.o \
c_code/5_1/condsyms.o \
c_code/5_1/idents.o \
c_code/5_1/extccomp.o \
c_code/5_1/wordrecg.o \
c_code/5_1/nimblecmd.o \
c_code/5_1/stdlib_parseopt.o \
c_code/5_1/lexer.o \
c_code/5_1/nimlexbase.o \
c_code/5_1/llstream.o \
c_code/5_1/nimconf.o \
c_code/5_1/main.o \
c_code/5_1/ast.o \
c_code/5_1/stdlib_intsets.o \
c_code/5_1/idgen.o \
c_code/5_1/astalgo.o \
c_code/5_1/rodutils.o \
c_code/5_1/syntaxes.o \
c_code/5_1/parser.o \
c_code/5_1/pbraces.o \
c_code/5_1/filters.o \
c_code/5_1/renderer.o \
c_code/5_1/filter_tmpl.o \
c_code/5_1/rodread.o \
c_code/5_1/types.o \
c_code/5_1/trees.o \
c_code/5_1/stdlib_memfiles.o \
c_code/5_1/rodwrite.o \
c_code/5_1/passes.o \
c_code/5_1/magicsys.o \
c_code/5_1/nimsets.o \
c_code/5_1/bitsets.o \
c_code/5_1/importer.o \
c_code/5_1/lookups.o \
c_code/5_1/semdata.o \
c_code/5_1/treetab.o \
c_code/5_1/vmdef.o \
c_code/5_1/prettybase.o \
c_code/5_1/stdlib_lexbase.o \
c_code/5_1/sem.o \
c_code/5_1/semfold.o \
c_code/5_1/saturate.o \
c_code/5_1/procfind.o \
c_code/5_1/pragmas.o \
c_code/5_1/semtypinst.o \
c_code/5_1/sigmatch.o \
c_code/5_1/parampatterns.o \
c_code/5_1/pretty.o \
c_code/5_1/docgen.o \
c_code/5_1/docutils_rstast.o \
c_code/5_1/stdlib_json.o \
c_code/5_1/stdlib_unicode.o \
c_code/5_1/docutils_rst.o \
c_code/5_1/docutils_rstgen.o \
c_code/5_1/docutils_highlite.o \
c_code/5_1/stdlib_sequtils.o \
c_code/5_1/stdlib_algorithm.o \
c_code/5_1/sempass2.o \
c_code/5_1/guards.o \
c_code/5_1/stdlib_xmltree.o \
c_code/5_1/stdlib_macros.o \
c_code/5_1/stdlib_cgi.o \
c_code/5_1/stdlib_cookies.o \
c_code/5_1/typesrenderer.o \
c_code/5_1/transf.o \
c_code/5_1/cgmeth.o \
c_code/5_1/lambdalifting.o \
c_code/5_1/lowerings.o \
c_code/5_1/vm.o \
c_code/5_1/vmgen.o \
c_code/5_1/vmdeps.o \
c_code/5_1/evaltempl.o \
c_code/5_1/aliases.o \
c_code/5_1/patterns.o \
c_code/5_1/semmacrosanity.o \
c_code/5_1/semparallel.o \
c_code/5_1/cgen.o \
c_code/5_1/ccgutils.o \
c_code/5_1/cgendata.o \
c_code/5_1/ccgmerge.o \
c_code/5_1/jsgen.o \
c_code/5_1/passaux.o \
c_code/5_1/depends.o \
c_code/5_1/docgen2.o \
c_code/5_1/service.o \
c_code/5_1/modules.o $LINK_FLAGS"
    $LINKER -o $binDir/nim  \
c_code/5_1/nim.o \
c_code/5_1/stdlib_system.o \
c_code/5_1/testability.o \
c_code/5_1/commands.o \
c_code/5_1/stdlib_os.o \
c_code/5_1/stdlib_strutils.o \
c_code/5_1/stdlib_parseutils.o \
c_code/5_1/stdlib_times.o \
c_code/5_1/stdlib_posix.o \
c_code/5_1/msgs.o \
c_code/5_1/options.o \
c_code/5_1/lists.o \
c_code/5_1/stdlib_strtabs.o \
c_code/5_1/stdlib_hashes.o \
c_code/5_1/stdlib_osproc.o \
c_code/5_1/stdlib_streams.o \
c_code/5_1/stdlib_cpuinfo.o \
c_code/5_1/stdlib_sets.o \
c_code/5_1/stdlib_math.o \
c_code/5_1/stdlib_tables.o \
c_code/5_1/ropes.o \
c_code/5_1/platform.o \
c_code/5_1/crc.o \
c_code/5_1/stdlib_sockets.o \
c_code/5_1/stdlib_unsigned.o \
c_code/5_1/nversion.o \
c_code/5_1/condsyms.o \
c_code/5_1/idents.o \
c_code/5_1/extccomp.o \
c_code/5_1/wordrecg.o \
c_code/5_1/nimblecmd.o \
c_code/5_1/stdlib_parseopt.o \
c_code/5_1/lexer.o \
c_code/5_1/nimlexbase.o \
c_code/5_1/llstream.o \
c_code/5_1/nimconf.o \
c_code/5_1/main.o \
c_code/5_1/ast.o \
c_code/5_1/stdlib_intsets.o \
c_code/5_1/idgen.o \
c_code/5_1/astalgo.o \
c_code/5_1/rodutils.o \
c_code/5_1/syntaxes.o \
c_code/5_1/parser.o \
c_code/5_1/pbraces.o \
c_code/5_1/filters.o \
c_code/5_1/renderer.o \
c_code/5_1/filter_tmpl.o \
c_code/5_1/rodread.o \
c_code/5_1/types.o \
c_code/5_1/trees.o \
c_code/5_1/stdlib_memfiles.o \
c_code/5_1/rodwrite.o \
c_code/5_1/passes.o \
c_code/5_1/magicsys.o \
c_code/5_1/nimsets.o \
c_code/5_1/bitsets.o \
c_code/5_1/importer.o \
c_code/5_1/lookups.o \
c_code/5_1/semdata.o \
c_code/5_1/treetab.o \
c_code/5_1/vmdef.o \
c_code/5_1/prettybase.o \
c_code/5_1/stdlib_lexbase.o \
c_code/5_1/sem.o \
c_code/5_1/semfold.o \
c_code/5_1/saturate.o \
c_code/5_1/procfind.o \
c_code/5_1/pragmas.o \
c_code/5_1/semtypinst.o \
c_code/5_1/sigmatch.o \
c_code/5_1/parampatterns.o \
c_code/5_1/pretty.o \
c_code/5_1/docgen.o \
c_code/5_1/docutils_rstast.o \
c_code/5_1/stdlib_json.o \
c_code/5_1/stdlib_unicode.o \
c_code/5_1/docutils_rst.o \
c_code/5_1/docutils_rstgen.o \
c_code/5_1/docutils_highlite.o \
c_code/5_1/stdlib_sequtils.o \
c_code/5_1/stdlib_algorithm.o \
c_code/5_1/sempass2.o \
c_code/5_1/guards.o \
c_code/5_1/stdlib_xmltree.o \
c_code/5_1/stdlib_macros.o \
c_code/5_1/stdlib_cgi.o \
c_code/5_1/stdlib_cookies.o \
c_code/5_1/typesrenderer.o \
c_code/5_1/transf.o \
c_code/5_1/cgmeth.o \
c_code/5_1/lambdalifting.o \
c_code/5_1/lowerings.o \
c_code/5_1/vm.o \
c_code/5_1/vmgen.o \
c_code/5_1/vmdeps.o \
c_code/5_1/evaltempl.o \
c_code/5_1/aliases.o \
c_code/5_1/patterns.o \
c_code/5_1/semmacrosanity.o \
c_code/5_1/semparallel.o \
c_code/5_1/cgen.o \
c_code/5_1/ccgutils.o \
c_code/5_1/cgendata.o \
c_code/5_1/ccgmerge.o \
c_code/5_1/jsgen.o \
c_code/5_1/passaux.o \
c_code/5_1/depends.o \
c_code/5_1/docgen2.o \
c_code/5_1/service.o \
c_code/5_1/modules.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/nim.c -o c_code/5_2/nim.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/nim.c -o c_code/5_2/nim.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_system.c -o c_code/5_2/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_system.c -o c_code/5_2/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/testability.c -o c_code/5_2/testability.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/testability.c -o c_code/5_2/testability.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/commands.c -o c_code/5_2/commands.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/commands.c -o c_code/5_2/commands.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_os.c -o c_code/5_2/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_os.c -o c_code/5_2/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_strutils.c -o c_code/5_2/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_strutils.c -o c_code/5_2/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_parseutils.c -o c_code/5_2/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_parseutils.c -o c_code/5_2/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_times.c -o c_code/5_2/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_times.c -o c_code/5_2/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_posix.c -o c_code/5_2/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_posix.c -o c_code/5_2/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/msgs.c -o c_code/5_2/msgs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/msgs.c -o c_code/5_2/msgs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/options.c -o c_code/5_2/options.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/options.c -o c_code/5_2/options.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/lists.c -o c_code/5_2/lists.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/lists.c -o c_code/5_2/lists.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_strtabs.c -o c_code/5_2/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_strtabs.c -o c_code/5_2/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_hashes.c -o c_code/5_2/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_hashes.c -o c_code/5_2/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_osproc.c -o c_code/5_2/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_osproc.c -o c_code/5_2/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_streams.c -o c_code/5_2/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_streams.c -o c_code/5_2/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_cpuinfo.c -o c_code/5_2/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_cpuinfo.c -o c_code/5_2/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_sets.c -o c_code/5_2/stdlib_sets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_sets.c -o c_code/5_2/stdlib_sets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_math.c -o c_code/5_2/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_math.c -o c_code/5_2/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_tables.c -o c_code/5_2/stdlib_tables.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_tables.c -o c_code/5_2/stdlib_tables.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/ropes.c -o c_code/5_2/ropes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/ropes.c -o c_code/5_2/ropes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/platform.c -o c_code/5_2/platform.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/platform.c -o c_code/5_2/platform.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/crc.c -o c_code/5_2/crc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/crc.c -o c_code/5_2/crc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_sockets.c -o c_code/5_2/stdlib_sockets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_sockets.c -o c_code/5_2/stdlib_sockets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_unsigned.c -o c_code/5_2/stdlib_unsigned.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_unsigned.c -o c_code/5_2/stdlib_unsigned.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/nversion.c -o c_code/5_2/nversion.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/nversion.c -o c_code/5_2/nversion.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/condsyms.c -o c_code/5_2/condsyms.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/condsyms.c -o c_code/5_2/condsyms.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/idents.c -o c_code/5_2/idents.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/idents.c -o c_code/5_2/idents.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/extccomp.c -o c_code/5_2/extccomp.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/extccomp.c -o c_code/5_2/extccomp.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/wordrecg.c -o c_code/5_2/wordrecg.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/wordrecg.c -o c_code/5_2/wordrecg.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/nimblecmd.c -o c_code/5_2/nimblecmd.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/nimblecmd.c -o c_code/5_2/nimblecmd.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_parseopt.c -o c_code/5_2/stdlib_parseopt.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_parseopt.c -o c_code/5_2/stdlib_parseopt.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/lexer.c -o c_code/5_2/lexer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/lexer.c -o c_code/5_2/lexer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/nimlexbase.c -o c_code/5_2/nimlexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/nimlexbase.c -o c_code/5_2/nimlexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/llstream.c -o c_code/5_2/llstream.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/llstream.c -o c_code/5_2/llstream.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/nimconf.c -o c_code/5_2/nimconf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/nimconf.c -o c_code/5_2/nimconf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/main.c -o c_code/5_2/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/main.c -o c_code/5_2/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/ast.c -o c_code/5_2/ast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/ast.c -o c_code/5_2/ast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_intsets.c -o c_code/5_2/stdlib_intsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_intsets.c -o c_code/5_2/stdlib_intsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/idgen.c -o c_code/5_2/idgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/idgen.c -o c_code/5_2/idgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/astalgo.c -o c_code/5_2/astalgo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/astalgo.c -o c_code/5_2/astalgo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/rodutils.c -o c_code/5_2/rodutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/rodutils.c -o c_code/5_2/rodutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/syntaxes.c -o c_code/5_2/syntaxes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/syntaxes.c -o c_code/5_2/syntaxes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/parser.c -o c_code/5_2/parser.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/parser.c -o c_code/5_2/parser.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/pbraces.c -o c_code/5_2/pbraces.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/pbraces.c -o c_code/5_2/pbraces.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/filters.c -o c_code/5_2/filters.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/filters.c -o c_code/5_2/filters.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/renderer.c -o c_code/5_2/renderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/renderer.c -o c_code/5_2/renderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/filter_tmpl.c -o c_code/5_2/filter_tmpl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/filter_tmpl.c -o c_code/5_2/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/rodread.c -o c_code/5_2/rodread.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/rodread.c -o c_code/5_2/rodread.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/types.c -o c_code/5_2/types.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/types.c -o c_code/5_2/types.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/trees.c -o c_code/5_2/trees.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/trees.c -o c_code/5_2/trees.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_memfiles.c -o c_code/5_2/stdlib_memfiles.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_memfiles.c -o c_code/5_2/stdlib_memfiles.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/rodwrite.c -o c_code/5_2/rodwrite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/rodwrite.c -o c_code/5_2/rodwrite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/passes.c -o c_code/5_2/passes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/passes.c -o c_code/5_2/passes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/magicsys.c -o c_code/5_2/magicsys.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/magicsys.c -o c_code/5_2/magicsys.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/nimsets.c -o c_code/5_2/nimsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/nimsets.c -o c_code/5_2/nimsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/bitsets.c -o c_code/5_2/bitsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/bitsets.c -o c_code/5_2/bitsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/importer.c -o c_code/5_2/importer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/importer.c -o c_code/5_2/importer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/lookups.c -o c_code/5_2/lookups.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/lookups.c -o c_code/5_2/lookups.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/semdata.c -o c_code/5_2/semdata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/semdata.c -o c_code/5_2/semdata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/treetab.c -o c_code/5_2/treetab.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/treetab.c -o c_code/5_2/treetab.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/vmdef.c -o c_code/5_2/vmdef.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/vmdef.c -o c_code/5_2/vmdef.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/prettybase.c -o c_code/5_2/prettybase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/prettybase.c -o c_code/5_2/prettybase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_lexbase.c -o c_code/5_2/stdlib_lexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_lexbase.c -o c_code/5_2/stdlib_lexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/sem.c -o c_code/5_2/sem.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/sem.c -o c_code/5_2/sem.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/semfold.c -o c_code/5_2/semfold.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/semfold.c -o c_code/5_2/semfold.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/saturate.c -o c_code/5_2/saturate.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/saturate.c -o c_code/5_2/saturate.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/procfind.c -o c_code/5_2/procfind.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/procfind.c -o c_code/5_2/procfind.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/pragmas.c -o c_code/5_2/pragmas.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/pragmas.c -o c_code/5_2/pragmas.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/semtypinst.c -o c_code/5_2/semtypinst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/semtypinst.c -o c_code/5_2/semtypinst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/sigmatch.c -o c_code/5_2/sigmatch.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/sigmatch.c -o c_code/5_2/sigmatch.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/parampatterns.c -o c_code/5_2/parampatterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/parampatterns.c -o c_code/5_2/parampatterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/pretty.c -o c_code/5_2/pretty.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/pretty.c -o c_code/5_2/pretty.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/docgen.c -o c_code/5_2/docgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/docgen.c -o c_code/5_2/docgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/docutils_rstast.c -o c_code/5_2/docutils_rstast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/docutils_rstast.c -o c_code/5_2/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_json.c -o c_code/5_2/stdlib_json.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_json.c -o c_code/5_2/stdlib_json.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_unicode.c -o c_code/5_2/stdlib_unicode.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_unicode.c -o c_code/5_2/stdlib_unicode.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/docutils_rst.c -o c_code/5_2/docutils_rst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/docutils_rst.c -o c_code/5_2/docutils_rst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/docutils_rstgen.c -o c_code/5_2/docutils_rstgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/docutils_rstgen.c -o c_code/5_2/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/docutils_highlite.c -o c_code/5_2/docutils_highlite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/docutils_highlite.c -o c_code/5_2/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_sequtils.c -o c_code/5_2/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_sequtils.c -o c_code/5_2/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_algorithm.c -o c_code/5_2/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_algorithm.c -o c_code/5_2/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/sempass2.c -o c_code/5_2/sempass2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/sempass2.c -o c_code/5_2/sempass2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/guards.c -o c_code/5_2/guards.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/guards.c -o c_code/5_2/guards.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_xmltree.c -o c_code/5_2/stdlib_xmltree.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_xmltree.c -o c_code/5_2/stdlib_xmltree.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_macros.c -o c_code/5_2/stdlib_macros.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_macros.c -o c_code/5_2/stdlib_macros.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_cgi.c -o c_code/5_2/stdlib_cgi.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_cgi.c -o c_code/5_2/stdlib_cgi.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_cookies.c -o c_code/5_2/stdlib_cookies.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_cookies.c -o c_code/5_2/stdlib_cookies.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/typesrenderer.c -o c_code/5_2/typesrenderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/typesrenderer.c -o c_code/5_2/typesrenderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/transf.c -o c_code/5_2/transf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/transf.c -o c_code/5_2/transf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/cgmeth.c -o c_code/5_2/cgmeth.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/cgmeth.c -o c_code/5_2/cgmeth.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/lambdalifting.c -o c_code/5_2/lambdalifting.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/lambdalifting.c -o c_code/5_2/lambdalifting.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/lowerings.c -o c_code/5_2/lowerings.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/lowerings.c -o c_code/5_2/lowerings.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/vm.c -o c_code/5_2/vm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/vm.c -o c_code/5_2/vm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/vmgen.c -o c_code/5_2/vmgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/vmgen.c -o c_code/5_2/vmgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/vmdeps.c -o c_code/5_2/vmdeps.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/vmdeps.c -o c_code/5_2/vmdeps.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/evaltempl.c -o c_code/5_2/evaltempl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/evaltempl.c -o c_code/5_2/evaltempl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/aliases.c -o c_code/5_2/aliases.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/aliases.c -o c_code/5_2/aliases.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/patterns.c -o c_code/5_2/patterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/patterns.c -o c_code/5_2/patterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/semmacrosanity.c -o c_code/5_2/semmacrosanity.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/semmacrosanity.c -o c_code/5_2/semmacrosanity.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/semparallel.c -o c_code/5_2/semparallel.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/semparallel.c -o c_code/5_2/semparallel.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/cgen.c -o c_code/5_2/cgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/cgen.c -o c_code/5_2/cgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/ccgutils.c -o c_code/5_2/ccgutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/ccgutils.c -o c_code/5_2/ccgutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/cgendata.c -o c_code/5_2/cgendata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/cgendata.c -o c_code/5_2/cgendata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/ccgmerge.c -o c_code/5_2/ccgmerge.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/ccgmerge.c -o c_code/5_2/ccgmerge.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/jsgen.c -o c_code/5_2/jsgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/jsgen.c -o c_code/5_2/jsgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/passaux.c -o c_code/5_2/passaux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/passaux.c -o c_code/5_2/passaux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/depends.c -o c_code/5_2/depends.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/depends.c -o c_code/5_2/depends.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/docgen2.c -o c_code/5_2/docgen2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/docgen2.c -o c_code/5_2/docgen2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/service.c -o c_code/5_2/service.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/service.c -o c_code/5_2/service.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/modules.c -o c_code/5_2/modules.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/modules.c -o c_code/5_2/modules.o
    echo "$LINKER -o $binDir/nim  \
c_code/5_2/nim.o \
c_code/5_2/stdlib_system.o \
c_code/5_2/testability.o \
c_code/5_2/commands.o \
c_code/5_2/stdlib_os.o \
c_code/5_2/stdlib_strutils.o \
c_code/5_2/stdlib_parseutils.o \
c_code/5_2/stdlib_times.o \
c_code/5_2/stdlib_posix.o \
c_code/5_2/msgs.o \
c_code/5_2/options.o \
c_code/5_2/lists.o \
c_code/5_2/stdlib_strtabs.o \
c_code/5_2/stdlib_hashes.o \
c_code/5_2/stdlib_osproc.o \
c_code/5_2/stdlib_streams.o \
c_code/5_2/stdlib_cpuinfo.o \
c_code/5_2/stdlib_sets.o \
c_code/5_2/stdlib_math.o \
c_code/5_2/stdlib_tables.o \
c_code/5_2/ropes.o \
c_code/5_2/platform.o \
c_code/5_2/crc.o \
c_code/5_2/stdlib_sockets.o \
c_code/5_2/stdlib_unsigned.o \
c_code/5_2/nversion.o \
c_code/5_2/condsyms.o \
c_code/5_2/idents.o \
c_code/5_2/extccomp.o \
c_code/5_2/wordrecg.o \
c_code/5_2/nimblecmd.o \
c_code/5_2/stdlib_parseopt.o \
c_code/5_2/lexer.o \
c_code/5_2/nimlexbase.o \
c_code/5_2/llstream.o \
c_code/5_2/nimconf.o \
c_code/5_2/main.o \
c_code/5_2/ast.o \
c_code/5_2/stdlib_intsets.o \
c_code/5_2/idgen.o \
c_code/5_2/astalgo.o \
c_code/5_2/rodutils.o \
c_code/5_2/syntaxes.o \
c_code/5_2/parser.o \
c_code/5_2/pbraces.o \
c_code/5_2/filters.o \
c_code/5_2/renderer.o \
c_code/5_2/filter_tmpl.o \
c_code/5_2/rodread.o \
c_code/5_2/types.o \
c_code/5_2/trees.o \
c_code/5_2/stdlib_memfiles.o \
c_code/5_2/rodwrite.o \
c_code/5_2/passes.o \
c_code/5_2/magicsys.o \
c_code/5_2/nimsets.o \
c_code/5_2/bitsets.o \
c_code/5_2/importer.o \
c_code/5_2/lookups.o \
c_code/5_2/semdata.o \
c_code/5_2/treetab.o \
c_code/5_2/vmdef.o \
c_code/5_2/prettybase.o \
c_code/5_2/stdlib_lexbase.o \
c_code/5_2/sem.o \
c_code/5_2/semfold.o \
c_code/5_2/saturate.o \
c_code/5_2/procfind.o \
c_code/5_2/pragmas.o \
c_code/5_2/semtypinst.o \
c_code/5_2/sigmatch.o \
c_code/5_2/parampatterns.o \
c_code/5_2/pretty.o \
c_code/5_2/docgen.o \
c_code/5_2/docutils_rstast.o \
c_code/5_2/stdlib_json.o \
c_code/5_2/stdlib_unicode.o \
c_code/5_2/docutils_rst.o \
c_code/5_2/docutils_rstgen.o \
c_code/5_2/docutils_highlite.o \
c_code/5_2/stdlib_sequtils.o \
c_code/5_2/stdlib_algorithm.o \
c_code/5_2/sempass2.o \
c_code/5_2/guards.o \
c_code/5_2/stdlib_xmltree.o \
c_code/5_2/stdlib_macros.o \
c_code/5_2/stdlib_cgi.o \
c_code/5_2/stdlib_cookies.o \
c_code/5_2/typesrenderer.o \
c_code/5_2/transf.o \
c_code/5_2/cgmeth.o \
c_code/5_2/lambdalifting.o \
c_code/5_2/lowerings.o \
c_code/5_2/vm.o \
c_code/5_2/vmgen.o \
c_code/5_2/vmdeps.o \
c_code/5_2/evaltempl.o \
c_code/5_2/aliases.o \
c_code/5_2/patterns.o \
c_code/5_2/semmacrosanity.o \
c_code/5_2/semparallel.o \
c_code/5_2/cgen.o \
c_code/5_2/ccgutils.o \
c_code/5_2/cgendata.o \
c_code/5_2/ccgmerge.o \
c_code/5_2/jsgen.o \
c_code/5_2/passaux.o \
c_code/5_2/depends.o \
c_code/5_2/docgen2.o \
c_code/5_2/service.o \
c_code/5_2/modules.o $LINK_FLAGS"
    $LINKER -o $binDir/nim  \
c_code/5_2/nim.o \
c_code/5_2/stdlib_system.o \
c_code/5_2/testability.o \
c_code/5_2/commands.o \
c_code/5_2/stdlib_os.o \
c_code/5_2/stdlib_strutils.o \
c_code/5_2/stdlib_parseutils.o \
c_code/5_2/stdlib_times.o \
c_code/5_2/stdlib_posix.o \
c_code/5_2/msgs.o \
c_code/5_2/options.o \
c_code/5_2/lists.o \
c_code/5_2/stdlib_strtabs.o \
c_code/5_2/stdlib_hashes.o \
c_code/5_2/stdlib_osproc.o \
c_code/5_2/stdlib_streams.o \
c_code/5_2/stdlib_cpuinfo.o \
c_code/5_2/stdlib_sets.o \
c_code/5_2/stdlib_math.o \
c_code/5_2/stdlib_tables.o \
c_code/5_2/ropes.o \
c_code/5_2/platform.o \
c_code/5_2/crc.o \
c_code/5_2/stdlib_sockets.o \
c_code/5_2/stdlib_unsigned.o \
c_code/5_2/nversion.o \
c_code/5_2/condsyms.o \
c_code/5_2/idents.o \
c_code/5_2/extccomp.o \
c_code/5_2/wordrecg.o \
c_code/5_2/nimblecmd.o \
c_code/5_2/stdlib_parseopt.o \
c_code/5_2/lexer.o \
c_code/5_2/nimlexbase.o \
c_code/5_2/llstream.o \
c_code/5_2/nimconf.o \
c_code/5_2/main.o \
c_code/5_2/ast.o \
c_code/5_2/stdlib_intsets.o \
c_code/5_2/idgen.o \
c_code/5_2/astalgo.o \
c_code/5_2/rodutils.o \
c_code/5_2/syntaxes.o \
c_code/5_2/parser.o \
c_code/5_2/pbraces.o \
c_code/5_2/filters.o \
c_code/5_2/renderer.o \
c_code/5_2/filter_tmpl.o \
c_code/5_2/rodread.o \
c_code/5_2/types.o \
c_code/5_2/trees.o \
c_code/5_2/stdlib_memfiles.o \
c_code/5_2/rodwrite.o \
c_code/5_2/passes.o \
c_code/5_2/magicsys.o \
c_code/5_2/nimsets.o \
c_code/5_2/bitsets.o \
c_code/5_2/importer.o \
c_code/5_2/lookups.o \
c_code/5_2/semdata.o \
c_code/5_2/treetab.o \
c_code/5_2/vmdef.o \
c_code/5_2/prettybase.o \
c_code/5_2/stdlib_lexbase.o \
c_code/5_2/sem.o \
c_code/5_2/semfold.o \
c_code/5_2/saturate.o \
c_code/5_2/procfind.o \
c_code/5_2/pragmas.o \
c_code/5_2/semtypinst.o \
c_code/5_2/sigmatch.o \
c_code/5_2/parampatterns.o \
c_code/5_2/pretty.o \
c_code/5_2/docgen.o \
c_code/5_2/docutils_rstast.o \
c_code/5_2/stdlib_json.o \
c_code/5_2/stdlib_unicode.o \
c_code/5_2/docutils_rst.o \
c_code/5_2/docutils_rstgen.o \
c_code/5_2/docutils_highlite.o \
c_code/5_2/stdlib_sequtils.o \
c_code/5_2/stdlib_algorithm.o \
c_code/5_2/sempass2.o \
c_code/5_2/guards.o \
c_code/5_2/stdlib_xmltree.o \
c_code/5_2/stdlib_macros.o \
c_code/5_2/stdlib_cgi.o \
c_code/5_2/stdlib_cookies.o \
c_code/5_2/typesrenderer.o \
c_code/5_2/transf.o \
c_code/5_2/cgmeth.o \
c_code/5_2/lambdalifting.o \
c_code/5_2/lowerings.o \
c_code/5_2/vm.o \
c_code/5_2/vmgen.o \
c_code/5_2/vmdeps.o \
c_code/5_2/evaltempl.o \
c_code/5_2/aliases.o \
c_code/5_2/patterns.o \
c_code/5_2/semmacrosanity.o \
c_code/5_2/semparallel.o \
c_code/5_2/cgen.o \
c_code/5_2/ccgutils.o \
c_code/5_2/cgendata.o \
c_code/5_2/ccgmerge.o \
c_code/5_2/jsgen.o \
c_code/5_2/passaux.o \
c_code/5_2/depends.o \
c_code/5_2/docgen2.o \
c_code/5_2/service.o \
c_code/5_2/modules.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
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
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/nim.c -o c_code/6_1/nim.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/nim.c -o c_code/6_1/nim.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_system.c -o c_code/6_1/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_system.c -o c_code/6_1/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/testability.c -o c_code/6_1/testability.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/testability.c -o c_code/6_1/testability.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/commands.c -o c_code/6_1/commands.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/commands.c -o c_code/6_1/commands.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_os.c -o c_code/6_1/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_os.c -o c_code/6_1/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_strutils.c -o c_code/6_1/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_strutils.c -o c_code/6_1/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_parseutils.c -o c_code/6_1/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_parseutils.c -o c_code/6_1/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_times.c -o c_code/6_1/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_times.c -o c_code/6_1/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_posix.c -o c_code/6_1/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_posix.c -o c_code/6_1/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/msgs.c -o c_code/6_1/msgs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/msgs.c -o c_code/6_1/msgs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/options.c -o c_code/6_1/options.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/options.c -o c_code/6_1/options.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/lists.c -o c_code/6_1/lists.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/lists.c -o c_code/6_1/lists.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_strtabs.c -o c_code/6_1/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_strtabs.c -o c_code/6_1/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_hashes.c -o c_code/6_1/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_hashes.c -o c_code/6_1/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_osproc.c -o c_code/6_1/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_osproc.c -o c_code/6_1/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_streams.c -o c_code/6_1/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_streams.c -o c_code/6_1/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_cpuinfo.c -o c_code/6_1/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_cpuinfo.c -o c_code/6_1/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_sets.c -o c_code/6_1/stdlib_sets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_sets.c -o c_code/6_1/stdlib_sets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_math.c -o c_code/6_1/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_math.c -o c_code/6_1/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_tables.c -o c_code/6_1/stdlib_tables.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_tables.c -o c_code/6_1/stdlib_tables.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/ropes.c -o c_code/6_1/ropes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/ropes.c -o c_code/6_1/ropes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/platform.c -o c_code/6_1/platform.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/platform.c -o c_code/6_1/platform.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/crc.c -o c_code/6_1/crc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/crc.c -o c_code/6_1/crc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_sockets.c -o c_code/6_1/stdlib_sockets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_sockets.c -o c_code/6_1/stdlib_sockets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_unsigned.c -o c_code/6_1/stdlib_unsigned.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_unsigned.c -o c_code/6_1/stdlib_unsigned.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/nversion.c -o c_code/6_1/nversion.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/nversion.c -o c_code/6_1/nversion.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/condsyms.c -o c_code/6_1/condsyms.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/condsyms.c -o c_code/6_1/condsyms.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/idents.c -o c_code/6_1/idents.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/idents.c -o c_code/6_1/idents.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/extccomp.c -o c_code/6_1/extccomp.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/extccomp.c -o c_code/6_1/extccomp.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/wordrecg.c -o c_code/6_1/wordrecg.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/wordrecg.c -o c_code/6_1/wordrecg.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/nimblecmd.c -o c_code/6_1/nimblecmd.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/nimblecmd.c -o c_code/6_1/nimblecmd.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_parseopt.c -o c_code/6_1/stdlib_parseopt.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_parseopt.c -o c_code/6_1/stdlib_parseopt.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/lexer.c -o c_code/6_1/lexer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/lexer.c -o c_code/6_1/lexer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/nimlexbase.c -o c_code/6_1/nimlexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/nimlexbase.c -o c_code/6_1/nimlexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/llstream.c -o c_code/6_1/llstream.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/llstream.c -o c_code/6_1/llstream.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/nimconf.c -o c_code/6_1/nimconf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/nimconf.c -o c_code/6_1/nimconf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/main.c -o c_code/6_1/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/main.c -o c_code/6_1/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/ast.c -o c_code/6_1/ast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/ast.c -o c_code/6_1/ast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_intsets.c -o c_code/6_1/stdlib_intsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_intsets.c -o c_code/6_1/stdlib_intsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/idgen.c -o c_code/6_1/idgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/idgen.c -o c_code/6_1/idgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/astalgo.c -o c_code/6_1/astalgo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/astalgo.c -o c_code/6_1/astalgo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/rodutils.c -o c_code/6_1/rodutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/rodutils.c -o c_code/6_1/rodutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/syntaxes.c -o c_code/6_1/syntaxes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/syntaxes.c -o c_code/6_1/syntaxes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/parser.c -o c_code/6_1/parser.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/parser.c -o c_code/6_1/parser.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/pbraces.c -o c_code/6_1/pbraces.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/pbraces.c -o c_code/6_1/pbraces.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/filters.c -o c_code/6_1/filters.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/filters.c -o c_code/6_1/filters.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/renderer.c -o c_code/6_1/renderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/renderer.c -o c_code/6_1/renderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/filter_tmpl.c -o c_code/6_1/filter_tmpl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/filter_tmpl.c -o c_code/6_1/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/rodread.c -o c_code/6_1/rodread.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/rodread.c -o c_code/6_1/rodread.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/types.c -o c_code/6_1/types.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/types.c -o c_code/6_1/types.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/trees.c -o c_code/6_1/trees.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/trees.c -o c_code/6_1/trees.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_memfiles.c -o c_code/6_1/stdlib_memfiles.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_memfiles.c -o c_code/6_1/stdlib_memfiles.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/rodwrite.c -o c_code/6_1/rodwrite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/rodwrite.c -o c_code/6_1/rodwrite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/passes.c -o c_code/6_1/passes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/passes.c -o c_code/6_1/passes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/magicsys.c -o c_code/6_1/magicsys.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/magicsys.c -o c_code/6_1/magicsys.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/nimsets.c -o c_code/6_1/nimsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/nimsets.c -o c_code/6_1/nimsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/bitsets.c -o c_code/6_1/bitsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/bitsets.c -o c_code/6_1/bitsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/importer.c -o c_code/6_1/importer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/importer.c -o c_code/6_1/importer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/lookups.c -o c_code/6_1/lookups.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/lookups.c -o c_code/6_1/lookups.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/semdata.c -o c_code/6_1/semdata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/semdata.c -o c_code/6_1/semdata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/treetab.c -o c_code/6_1/treetab.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/treetab.c -o c_code/6_1/treetab.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/vmdef.c -o c_code/6_1/vmdef.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/vmdef.c -o c_code/6_1/vmdef.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/prettybase.c -o c_code/6_1/prettybase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/prettybase.c -o c_code/6_1/prettybase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_lexbase.c -o c_code/6_1/stdlib_lexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_lexbase.c -o c_code/6_1/stdlib_lexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/sem.c -o c_code/6_1/sem.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/sem.c -o c_code/6_1/sem.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/semfold.c -o c_code/6_1/semfold.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/semfold.c -o c_code/6_1/semfold.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/saturate.c -o c_code/6_1/saturate.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/saturate.c -o c_code/6_1/saturate.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/procfind.c -o c_code/6_1/procfind.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/procfind.c -o c_code/6_1/procfind.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/pragmas.c -o c_code/6_1/pragmas.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/pragmas.c -o c_code/6_1/pragmas.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/semtypinst.c -o c_code/6_1/semtypinst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/semtypinst.c -o c_code/6_1/semtypinst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/sigmatch.c -o c_code/6_1/sigmatch.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/sigmatch.c -o c_code/6_1/sigmatch.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/parampatterns.c -o c_code/6_1/parampatterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/parampatterns.c -o c_code/6_1/parampatterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/pretty.c -o c_code/6_1/pretty.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/pretty.c -o c_code/6_1/pretty.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/docgen.c -o c_code/6_1/docgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/docgen.c -o c_code/6_1/docgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/docutils_rstast.c -o c_code/6_1/docutils_rstast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/docutils_rstast.c -o c_code/6_1/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_json.c -o c_code/6_1/stdlib_json.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_json.c -o c_code/6_1/stdlib_json.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_unicode.c -o c_code/6_1/stdlib_unicode.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_unicode.c -o c_code/6_1/stdlib_unicode.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/docutils_rst.c -o c_code/6_1/docutils_rst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/docutils_rst.c -o c_code/6_1/docutils_rst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/docutils_rstgen.c -o c_code/6_1/docutils_rstgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/docutils_rstgen.c -o c_code/6_1/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/docutils_highlite.c -o c_code/6_1/docutils_highlite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/docutils_highlite.c -o c_code/6_1/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_sequtils.c -o c_code/6_1/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_sequtils.c -o c_code/6_1/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_algorithm.c -o c_code/6_1/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_algorithm.c -o c_code/6_1/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/sempass2.c -o c_code/6_1/sempass2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/sempass2.c -o c_code/6_1/sempass2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/guards.c -o c_code/6_1/guards.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/guards.c -o c_code/6_1/guards.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_xmltree.c -o c_code/6_1/stdlib_xmltree.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_xmltree.c -o c_code/6_1/stdlib_xmltree.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_macros.c -o c_code/6_1/stdlib_macros.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_macros.c -o c_code/6_1/stdlib_macros.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_cgi.c -o c_code/6_1/stdlib_cgi.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_cgi.c -o c_code/6_1/stdlib_cgi.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_cookies.c -o c_code/6_1/stdlib_cookies.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_cookies.c -o c_code/6_1/stdlib_cookies.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/typesrenderer.c -o c_code/6_1/typesrenderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/typesrenderer.c -o c_code/6_1/typesrenderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/transf.c -o c_code/6_1/transf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/transf.c -o c_code/6_1/transf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/cgmeth.c -o c_code/6_1/cgmeth.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/cgmeth.c -o c_code/6_1/cgmeth.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/lambdalifting.c -o c_code/6_1/lambdalifting.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/lambdalifting.c -o c_code/6_1/lambdalifting.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/lowerings.c -o c_code/6_1/lowerings.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/lowerings.c -o c_code/6_1/lowerings.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/vm.c -o c_code/6_1/vm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/vm.c -o c_code/6_1/vm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/vmgen.c -o c_code/6_1/vmgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/vmgen.c -o c_code/6_1/vmgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/vmdeps.c -o c_code/6_1/vmdeps.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/vmdeps.c -o c_code/6_1/vmdeps.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/evaltempl.c -o c_code/6_1/evaltempl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/evaltempl.c -o c_code/6_1/evaltempl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/aliases.c -o c_code/6_1/aliases.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/aliases.c -o c_code/6_1/aliases.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/patterns.c -o c_code/6_1/patterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/patterns.c -o c_code/6_1/patterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/semmacrosanity.c -o c_code/6_1/semmacrosanity.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/semmacrosanity.c -o c_code/6_1/semmacrosanity.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/semparallel.c -o c_code/6_1/semparallel.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/semparallel.c -o c_code/6_1/semparallel.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/cgen.c -o c_code/6_1/cgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/cgen.c -o c_code/6_1/cgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/ccgutils.c -o c_code/6_1/ccgutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/ccgutils.c -o c_code/6_1/ccgutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/cgendata.c -o c_code/6_1/cgendata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/cgendata.c -o c_code/6_1/cgendata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/ccgmerge.c -o c_code/6_1/ccgmerge.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/ccgmerge.c -o c_code/6_1/ccgmerge.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/jsgen.c -o c_code/6_1/jsgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/jsgen.c -o c_code/6_1/jsgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/passaux.c -o c_code/6_1/passaux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/passaux.c -o c_code/6_1/passaux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/depends.c -o c_code/6_1/depends.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/depends.c -o c_code/6_1/depends.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/docgen2.c -o c_code/6_1/docgen2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/docgen2.c -o c_code/6_1/docgen2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/service.c -o c_code/6_1/service.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/service.c -o c_code/6_1/service.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/modules.c -o c_code/6_1/modules.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/modules.c -o c_code/6_1/modules.o
    echo "$LINKER -o $binDir/nim  \
c_code/6_1/nim.o \
c_code/6_1/stdlib_system.o \
c_code/6_1/testability.o \
c_code/6_1/commands.o \
c_code/6_1/stdlib_os.o \
c_code/6_1/stdlib_strutils.o \
c_code/6_1/stdlib_parseutils.o \
c_code/6_1/stdlib_times.o \
c_code/6_1/stdlib_posix.o \
c_code/6_1/msgs.o \
c_code/6_1/options.o \
c_code/6_1/lists.o \
c_code/6_1/stdlib_strtabs.o \
c_code/6_1/stdlib_hashes.o \
c_code/6_1/stdlib_osproc.o \
c_code/6_1/stdlib_streams.o \
c_code/6_1/stdlib_cpuinfo.o \
c_code/6_1/stdlib_sets.o \
c_code/6_1/stdlib_math.o \
c_code/6_1/stdlib_tables.o \
c_code/6_1/ropes.o \
c_code/6_1/platform.o \
c_code/6_1/crc.o \
c_code/6_1/stdlib_sockets.o \
c_code/6_1/stdlib_unsigned.o \
c_code/6_1/nversion.o \
c_code/6_1/condsyms.o \
c_code/6_1/idents.o \
c_code/6_1/extccomp.o \
c_code/6_1/wordrecg.o \
c_code/6_1/nimblecmd.o \
c_code/6_1/stdlib_parseopt.o \
c_code/6_1/lexer.o \
c_code/6_1/nimlexbase.o \
c_code/6_1/llstream.o \
c_code/6_1/nimconf.o \
c_code/6_1/main.o \
c_code/6_1/ast.o \
c_code/6_1/stdlib_intsets.o \
c_code/6_1/idgen.o \
c_code/6_1/astalgo.o \
c_code/6_1/rodutils.o \
c_code/6_1/syntaxes.o \
c_code/6_1/parser.o \
c_code/6_1/pbraces.o \
c_code/6_1/filters.o \
c_code/6_1/renderer.o \
c_code/6_1/filter_tmpl.o \
c_code/6_1/rodread.o \
c_code/6_1/types.o \
c_code/6_1/trees.o \
c_code/6_1/stdlib_memfiles.o \
c_code/6_1/rodwrite.o \
c_code/6_1/passes.o \
c_code/6_1/magicsys.o \
c_code/6_1/nimsets.o \
c_code/6_1/bitsets.o \
c_code/6_1/importer.o \
c_code/6_1/lookups.o \
c_code/6_1/semdata.o \
c_code/6_1/treetab.o \
c_code/6_1/vmdef.o \
c_code/6_1/prettybase.o \
c_code/6_1/stdlib_lexbase.o \
c_code/6_1/sem.o \
c_code/6_1/semfold.o \
c_code/6_1/saturate.o \
c_code/6_1/procfind.o \
c_code/6_1/pragmas.o \
c_code/6_1/semtypinst.o \
c_code/6_1/sigmatch.o \
c_code/6_1/parampatterns.o \
c_code/6_1/pretty.o \
c_code/6_1/docgen.o \
c_code/6_1/docutils_rstast.o \
c_code/6_1/stdlib_json.o \
c_code/6_1/stdlib_unicode.o \
c_code/6_1/docutils_rst.o \
c_code/6_1/docutils_rstgen.o \
c_code/6_1/docutils_highlite.o \
c_code/6_1/stdlib_sequtils.o \
c_code/6_1/stdlib_algorithm.o \
c_code/6_1/sempass2.o \
c_code/6_1/guards.o \
c_code/6_1/stdlib_xmltree.o \
c_code/6_1/stdlib_macros.o \
c_code/6_1/stdlib_cgi.o \
c_code/6_1/stdlib_cookies.o \
c_code/6_1/typesrenderer.o \
c_code/6_1/transf.o \
c_code/6_1/cgmeth.o \
c_code/6_1/lambdalifting.o \
c_code/6_1/lowerings.o \
c_code/6_1/vm.o \
c_code/6_1/vmgen.o \
c_code/6_1/vmdeps.o \
c_code/6_1/evaltempl.o \
c_code/6_1/aliases.o \
c_code/6_1/patterns.o \
c_code/6_1/semmacrosanity.o \
c_code/6_1/semparallel.o \
c_code/6_1/cgen.o \
c_code/6_1/ccgutils.o \
c_code/6_1/cgendata.o \
c_code/6_1/ccgmerge.o \
c_code/6_1/jsgen.o \
c_code/6_1/passaux.o \
c_code/6_1/depends.o \
c_code/6_1/docgen2.o \
c_code/6_1/service.o \
c_code/6_1/modules.o $LINK_FLAGS"
    $LINKER -o $binDir/nim  \
c_code/6_1/nim.o \
c_code/6_1/stdlib_system.o \
c_code/6_1/testability.o \
c_code/6_1/commands.o \
c_code/6_1/stdlib_os.o \
c_code/6_1/stdlib_strutils.o \
c_code/6_1/stdlib_parseutils.o \
c_code/6_1/stdlib_times.o \
c_code/6_1/stdlib_posix.o \
c_code/6_1/msgs.o \
c_code/6_1/options.o \
c_code/6_1/lists.o \
c_code/6_1/stdlib_strtabs.o \
c_code/6_1/stdlib_hashes.o \
c_code/6_1/stdlib_osproc.o \
c_code/6_1/stdlib_streams.o \
c_code/6_1/stdlib_cpuinfo.o \
c_code/6_1/stdlib_sets.o \
c_code/6_1/stdlib_math.o \
c_code/6_1/stdlib_tables.o \
c_code/6_1/ropes.o \
c_code/6_1/platform.o \
c_code/6_1/crc.o \
c_code/6_1/stdlib_sockets.o \
c_code/6_1/stdlib_unsigned.o \
c_code/6_1/nversion.o \
c_code/6_1/condsyms.o \
c_code/6_1/idents.o \
c_code/6_1/extccomp.o \
c_code/6_1/wordrecg.o \
c_code/6_1/nimblecmd.o \
c_code/6_1/stdlib_parseopt.o \
c_code/6_1/lexer.o \
c_code/6_1/nimlexbase.o \
c_code/6_1/llstream.o \
c_code/6_1/nimconf.o \
c_code/6_1/main.o \
c_code/6_1/ast.o \
c_code/6_1/stdlib_intsets.o \
c_code/6_1/idgen.o \
c_code/6_1/astalgo.o \
c_code/6_1/rodutils.o \
c_code/6_1/syntaxes.o \
c_code/6_1/parser.o \
c_code/6_1/pbraces.o \
c_code/6_1/filters.o \
c_code/6_1/renderer.o \
c_code/6_1/filter_tmpl.o \
c_code/6_1/rodread.o \
c_code/6_1/types.o \
c_code/6_1/trees.o \
c_code/6_1/stdlib_memfiles.o \
c_code/6_1/rodwrite.o \
c_code/6_1/passes.o \
c_code/6_1/magicsys.o \
c_code/6_1/nimsets.o \
c_code/6_1/bitsets.o \
c_code/6_1/importer.o \
c_code/6_1/lookups.o \
c_code/6_1/semdata.o \
c_code/6_1/treetab.o \
c_code/6_1/vmdef.o \
c_code/6_1/prettybase.o \
c_code/6_1/stdlib_lexbase.o \
c_code/6_1/sem.o \
c_code/6_1/semfold.o \
c_code/6_1/saturate.o \
c_code/6_1/procfind.o \
c_code/6_1/pragmas.o \
c_code/6_1/semtypinst.o \
c_code/6_1/sigmatch.o \
c_code/6_1/parampatterns.o \
c_code/6_1/pretty.o \
c_code/6_1/docgen.o \
c_code/6_1/docutils_rstast.o \
c_code/6_1/stdlib_json.o \
c_code/6_1/stdlib_unicode.o \
c_code/6_1/docutils_rst.o \
c_code/6_1/docutils_rstgen.o \
c_code/6_1/docutils_highlite.o \
c_code/6_1/stdlib_sequtils.o \
c_code/6_1/stdlib_algorithm.o \
c_code/6_1/sempass2.o \
c_code/6_1/guards.o \
c_code/6_1/stdlib_xmltree.o \
c_code/6_1/stdlib_macros.o \
c_code/6_1/stdlib_cgi.o \
c_code/6_1/stdlib_cookies.o \
c_code/6_1/typesrenderer.o \
c_code/6_1/transf.o \
c_code/6_1/cgmeth.o \
c_code/6_1/lambdalifting.o \
c_code/6_1/lowerings.o \
c_code/6_1/vm.o \
c_code/6_1/vmgen.o \
c_code/6_1/vmdeps.o \
c_code/6_1/evaltempl.o \
c_code/6_1/aliases.o \
c_code/6_1/patterns.o \
c_code/6_1/semmacrosanity.o \
c_code/6_1/semparallel.o \
c_code/6_1/cgen.o \
c_code/6_1/ccgutils.o \
c_code/6_1/cgendata.o \
c_code/6_1/ccgmerge.o \
c_code/6_1/jsgen.o \
c_code/6_1/passaux.o \
c_code/6_1/depends.o \
c_code/6_1/docgen2.o \
c_code/6_1/service.o \
c_code/6_1/modules.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/nim.c -o c_code/6_2/nim.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/nim.c -o c_code/6_2/nim.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_system.c -o c_code/6_2/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_system.c -o c_code/6_2/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/testability.c -o c_code/6_2/testability.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/testability.c -o c_code/6_2/testability.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/commands.c -o c_code/6_2/commands.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/commands.c -o c_code/6_2/commands.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_os.c -o c_code/6_2/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_os.c -o c_code/6_2/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_strutils.c -o c_code/6_2/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_strutils.c -o c_code/6_2/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_parseutils.c -o c_code/6_2/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_parseutils.c -o c_code/6_2/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_times.c -o c_code/6_2/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_times.c -o c_code/6_2/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_posix.c -o c_code/6_2/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_posix.c -o c_code/6_2/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/msgs.c -o c_code/6_2/msgs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/msgs.c -o c_code/6_2/msgs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/options.c -o c_code/6_2/options.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/options.c -o c_code/6_2/options.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/lists.c -o c_code/6_2/lists.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/lists.c -o c_code/6_2/lists.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_strtabs.c -o c_code/6_2/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_strtabs.c -o c_code/6_2/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_hashes.c -o c_code/6_2/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_hashes.c -o c_code/6_2/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_osproc.c -o c_code/6_2/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_osproc.c -o c_code/6_2/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_streams.c -o c_code/6_2/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_streams.c -o c_code/6_2/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_cpuinfo.c -o c_code/6_2/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_cpuinfo.c -o c_code/6_2/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_sets.c -o c_code/6_2/stdlib_sets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_sets.c -o c_code/6_2/stdlib_sets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_math.c -o c_code/6_2/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_math.c -o c_code/6_2/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_tables.c -o c_code/6_2/stdlib_tables.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_tables.c -o c_code/6_2/stdlib_tables.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/ropes.c -o c_code/6_2/ropes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/ropes.c -o c_code/6_2/ropes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/platform.c -o c_code/6_2/platform.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/platform.c -o c_code/6_2/platform.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/crc.c -o c_code/6_2/crc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/crc.c -o c_code/6_2/crc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_sockets.c -o c_code/6_2/stdlib_sockets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_sockets.c -o c_code/6_2/stdlib_sockets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_unsigned.c -o c_code/6_2/stdlib_unsigned.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_unsigned.c -o c_code/6_2/stdlib_unsigned.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/nversion.c -o c_code/6_2/nversion.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/nversion.c -o c_code/6_2/nversion.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/condsyms.c -o c_code/6_2/condsyms.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/condsyms.c -o c_code/6_2/condsyms.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/idents.c -o c_code/6_2/idents.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/idents.c -o c_code/6_2/idents.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/extccomp.c -o c_code/6_2/extccomp.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/extccomp.c -o c_code/6_2/extccomp.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/wordrecg.c -o c_code/6_2/wordrecg.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/wordrecg.c -o c_code/6_2/wordrecg.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/nimblecmd.c -o c_code/6_2/nimblecmd.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/nimblecmd.c -o c_code/6_2/nimblecmd.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_parseopt.c -o c_code/6_2/stdlib_parseopt.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_parseopt.c -o c_code/6_2/stdlib_parseopt.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/lexer.c -o c_code/6_2/lexer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/lexer.c -o c_code/6_2/lexer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/nimlexbase.c -o c_code/6_2/nimlexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/nimlexbase.c -o c_code/6_2/nimlexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/llstream.c -o c_code/6_2/llstream.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/llstream.c -o c_code/6_2/llstream.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/nimconf.c -o c_code/6_2/nimconf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/nimconf.c -o c_code/6_2/nimconf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/main.c -o c_code/6_2/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/main.c -o c_code/6_2/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/ast.c -o c_code/6_2/ast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/ast.c -o c_code/6_2/ast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_intsets.c -o c_code/6_2/stdlib_intsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_intsets.c -o c_code/6_2/stdlib_intsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/idgen.c -o c_code/6_2/idgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/idgen.c -o c_code/6_2/idgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/astalgo.c -o c_code/6_2/astalgo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/astalgo.c -o c_code/6_2/astalgo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/rodutils.c -o c_code/6_2/rodutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/rodutils.c -o c_code/6_2/rodutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/syntaxes.c -o c_code/6_2/syntaxes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/syntaxes.c -o c_code/6_2/syntaxes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/parser.c -o c_code/6_2/parser.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/parser.c -o c_code/6_2/parser.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/pbraces.c -o c_code/6_2/pbraces.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/pbraces.c -o c_code/6_2/pbraces.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/filters.c -o c_code/6_2/filters.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/filters.c -o c_code/6_2/filters.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/renderer.c -o c_code/6_2/renderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/renderer.c -o c_code/6_2/renderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/filter_tmpl.c -o c_code/6_2/filter_tmpl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/filter_tmpl.c -o c_code/6_2/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/rodread.c -o c_code/6_2/rodread.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/rodread.c -o c_code/6_2/rodread.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/types.c -o c_code/6_2/types.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/types.c -o c_code/6_2/types.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/trees.c -o c_code/6_2/trees.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/trees.c -o c_code/6_2/trees.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_memfiles.c -o c_code/6_2/stdlib_memfiles.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_memfiles.c -o c_code/6_2/stdlib_memfiles.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/rodwrite.c -o c_code/6_2/rodwrite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/rodwrite.c -o c_code/6_2/rodwrite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/passes.c -o c_code/6_2/passes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/passes.c -o c_code/6_2/passes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/magicsys.c -o c_code/6_2/magicsys.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/magicsys.c -o c_code/6_2/magicsys.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/nimsets.c -o c_code/6_2/nimsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/nimsets.c -o c_code/6_2/nimsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/bitsets.c -o c_code/6_2/bitsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/bitsets.c -o c_code/6_2/bitsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/importer.c -o c_code/6_2/importer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/importer.c -o c_code/6_2/importer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/lookups.c -o c_code/6_2/lookups.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/lookups.c -o c_code/6_2/lookups.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/semdata.c -o c_code/6_2/semdata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/semdata.c -o c_code/6_2/semdata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/treetab.c -o c_code/6_2/treetab.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/treetab.c -o c_code/6_2/treetab.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/vmdef.c -o c_code/6_2/vmdef.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/vmdef.c -o c_code/6_2/vmdef.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/prettybase.c -o c_code/6_2/prettybase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/prettybase.c -o c_code/6_2/prettybase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_lexbase.c -o c_code/6_2/stdlib_lexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_lexbase.c -o c_code/6_2/stdlib_lexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/sem.c -o c_code/6_2/sem.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/sem.c -o c_code/6_2/sem.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/semfold.c -o c_code/6_2/semfold.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/semfold.c -o c_code/6_2/semfold.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/saturate.c -o c_code/6_2/saturate.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/saturate.c -o c_code/6_2/saturate.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/procfind.c -o c_code/6_2/procfind.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/procfind.c -o c_code/6_2/procfind.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/pragmas.c -o c_code/6_2/pragmas.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/pragmas.c -o c_code/6_2/pragmas.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/semtypinst.c -o c_code/6_2/semtypinst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/semtypinst.c -o c_code/6_2/semtypinst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/sigmatch.c -o c_code/6_2/sigmatch.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/sigmatch.c -o c_code/6_2/sigmatch.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/parampatterns.c -o c_code/6_2/parampatterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/parampatterns.c -o c_code/6_2/parampatterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/pretty.c -o c_code/6_2/pretty.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/pretty.c -o c_code/6_2/pretty.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/docgen.c -o c_code/6_2/docgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/docgen.c -o c_code/6_2/docgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/docutils_rstast.c -o c_code/6_2/docutils_rstast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/docutils_rstast.c -o c_code/6_2/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_json.c -o c_code/6_2/stdlib_json.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_json.c -o c_code/6_2/stdlib_json.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_unicode.c -o c_code/6_2/stdlib_unicode.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_unicode.c -o c_code/6_2/stdlib_unicode.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/docutils_rst.c -o c_code/6_2/docutils_rst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/docutils_rst.c -o c_code/6_2/docutils_rst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/docutils_rstgen.c -o c_code/6_2/docutils_rstgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/docutils_rstgen.c -o c_code/6_2/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/docutils_highlite.c -o c_code/6_2/docutils_highlite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/docutils_highlite.c -o c_code/6_2/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_sequtils.c -o c_code/6_2/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_sequtils.c -o c_code/6_2/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_algorithm.c -o c_code/6_2/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_algorithm.c -o c_code/6_2/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/sempass2.c -o c_code/6_2/sempass2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/sempass2.c -o c_code/6_2/sempass2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/guards.c -o c_code/6_2/guards.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/guards.c -o c_code/6_2/guards.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_xmltree.c -o c_code/6_2/stdlib_xmltree.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_xmltree.c -o c_code/6_2/stdlib_xmltree.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_macros.c -o c_code/6_2/stdlib_macros.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_macros.c -o c_code/6_2/stdlib_macros.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_cgi.c -o c_code/6_2/stdlib_cgi.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_cgi.c -o c_code/6_2/stdlib_cgi.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_cookies.c -o c_code/6_2/stdlib_cookies.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_cookies.c -o c_code/6_2/stdlib_cookies.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/typesrenderer.c -o c_code/6_2/typesrenderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/typesrenderer.c -o c_code/6_2/typesrenderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/transf.c -o c_code/6_2/transf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/transf.c -o c_code/6_2/transf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/cgmeth.c -o c_code/6_2/cgmeth.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/cgmeth.c -o c_code/6_2/cgmeth.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/lambdalifting.c -o c_code/6_2/lambdalifting.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/lambdalifting.c -o c_code/6_2/lambdalifting.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/lowerings.c -o c_code/6_2/lowerings.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/lowerings.c -o c_code/6_2/lowerings.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/vm.c -o c_code/6_2/vm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/vm.c -o c_code/6_2/vm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/vmgen.c -o c_code/6_2/vmgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/vmgen.c -o c_code/6_2/vmgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/vmdeps.c -o c_code/6_2/vmdeps.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/vmdeps.c -o c_code/6_2/vmdeps.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/evaltempl.c -o c_code/6_2/evaltempl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/evaltempl.c -o c_code/6_2/evaltempl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/aliases.c -o c_code/6_2/aliases.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/aliases.c -o c_code/6_2/aliases.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/patterns.c -o c_code/6_2/patterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/patterns.c -o c_code/6_2/patterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/semmacrosanity.c -o c_code/6_2/semmacrosanity.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/semmacrosanity.c -o c_code/6_2/semmacrosanity.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/semparallel.c -o c_code/6_2/semparallel.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/semparallel.c -o c_code/6_2/semparallel.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/cgen.c -o c_code/6_2/cgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/cgen.c -o c_code/6_2/cgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/ccgutils.c -o c_code/6_2/ccgutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/ccgutils.c -o c_code/6_2/ccgutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/cgendata.c -o c_code/6_2/cgendata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/cgendata.c -o c_code/6_2/cgendata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/ccgmerge.c -o c_code/6_2/ccgmerge.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/ccgmerge.c -o c_code/6_2/ccgmerge.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/jsgen.c -o c_code/6_2/jsgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/jsgen.c -o c_code/6_2/jsgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/passaux.c -o c_code/6_2/passaux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/passaux.c -o c_code/6_2/passaux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/depends.c -o c_code/6_2/depends.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/depends.c -o c_code/6_2/depends.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/docgen2.c -o c_code/6_2/docgen2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/docgen2.c -o c_code/6_2/docgen2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/service.c -o c_code/6_2/service.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/service.c -o c_code/6_2/service.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/modules.c -o c_code/6_2/modules.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/modules.c -o c_code/6_2/modules.o
    echo "$LINKER -o $binDir/nim  \
c_code/6_2/nim.o \
c_code/6_2/stdlib_system.o \
c_code/6_2/testability.o \
c_code/6_2/commands.o \
c_code/6_2/stdlib_os.o \
c_code/6_2/stdlib_strutils.o \
c_code/6_2/stdlib_parseutils.o \
c_code/6_2/stdlib_times.o \
c_code/6_2/stdlib_posix.o \
c_code/6_2/msgs.o \
c_code/6_2/options.o \
c_code/6_2/lists.o \
c_code/6_2/stdlib_strtabs.o \
c_code/6_2/stdlib_hashes.o \
c_code/6_2/stdlib_osproc.o \
c_code/6_2/stdlib_streams.o \
c_code/6_2/stdlib_cpuinfo.o \
c_code/6_2/stdlib_sets.o \
c_code/6_2/stdlib_math.o \
c_code/6_2/stdlib_tables.o \
c_code/6_2/ropes.o \
c_code/6_2/platform.o \
c_code/6_2/crc.o \
c_code/6_2/stdlib_sockets.o \
c_code/6_2/stdlib_unsigned.o \
c_code/6_2/nversion.o \
c_code/6_2/condsyms.o \
c_code/6_2/idents.o \
c_code/6_2/extccomp.o \
c_code/6_2/wordrecg.o \
c_code/6_2/nimblecmd.o \
c_code/6_2/stdlib_parseopt.o \
c_code/6_2/lexer.o \
c_code/6_2/nimlexbase.o \
c_code/6_2/llstream.o \
c_code/6_2/nimconf.o \
c_code/6_2/main.o \
c_code/6_2/ast.o \
c_code/6_2/stdlib_intsets.o \
c_code/6_2/idgen.o \
c_code/6_2/astalgo.o \
c_code/6_2/rodutils.o \
c_code/6_2/syntaxes.o \
c_code/6_2/parser.o \
c_code/6_2/pbraces.o \
c_code/6_2/filters.o \
c_code/6_2/renderer.o \
c_code/6_2/filter_tmpl.o \
c_code/6_2/rodread.o \
c_code/6_2/types.o \
c_code/6_2/trees.o \
c_code/6_2/stdlib_memfiles.o \
c_code/6_2/rodwrite.o \
c_code/6_2/passes.o \
c_code/6_2/magicsys.o \
c_code/6_2/nimsets.o \
c_code/6_2/bitsets.o \
c_code/6_2/importer.o \
c_code/6_2/lookups.o \
c_code/6_2/semdata.o \
c_code/6_2/treetab.o \
c_code/6_2/vmdef.o \
c_code/6_2/prettybase.o \
c_code/6_2/stdlib_lexbase.o \
c_code/6_2/sem.o \
c_code/6_2/semfold.o \
c_code/6_2/saturate.o \
c_code/6_2/procfind.o \
c_code/6_2/pragmas.o \
c_code/6_2/semtypinst.o \
c_code/6_2/sigmatch.o \
c_code/6_2/parampatterns.o \
c_code/6_2/pretty.o \
c_code/6_2/docgen.o \
c_code/6_2/docutils_rstast.o \
c_code/6_2/stdlib_json.o \
c_code/6_2/stdlib_unicode.o \
c_code/6_2/docutils_rst.o \
c_code/6_2/docutils_rstgen.o \
c_code/6_2/docutils_highlite.o \
c_code/6_2/stdlib_sequtils.o \
c_code/6_2/stdlib_algorithm.o \
c_code/6_2/sempass2.o \
c_code/6_2/guards.o \
c_code/6_2/stdlib_xmltree.o \
c_code/6_2/stdlib_macros.o \
c_code/6_2/stdlib_cgi.o \
c_code/6_2/stdlib_cookies.o \
c_code/6_2/typesrenderer.o \
c_code/6_2/transf.o \
c_code/6_2/cgmeth.o \
c_code/6_2/lambdalifting.o \
c_code/6_2/lowerings.o \
c_code/6_2/vm.o \
c_code/6_2/vmgen.o \
c_code/6_2/vmdeps.o \
c_code/6_2/evaltempl.o \
c_code/6_2/aliases.o \
c_code/6_2/patterns.o \
c_code/6_2/semmacrosanity.o \
c_code/6_2/semparallel.o \
c_code/6_2/cgen.o \
c_code/6_2/ccgutils.o \
c_code/6_2/cgendata.o \
c_code/6_2/ccgmerge.o \
c_code/6_2/jsgen.o \
c_code/6_2/passaux.o \
c_code/6_2/depends.o \
c_code/6_2/docgen2.o \
c_code/6_2/service.o \
c_code/6_2/modules.o $LINK_FLAGS"
    $LINKER -o $binDir/nim  \
c_code/6_2/nim.o \
c_code/6_2/stdlib_system.o \
c_code/6_2/testability.o \
c_code/6_2/commands.o \
c_code/6_2/stdlib_os.o \
c_code/6_2/stdlib_strutils.o \
c_code/6_2/stdlib_parseutils.o \
c_code/6_2/stdlib_times.o \
c_code/6_2/stdlib_posix.o \
c_code/6_2/msgs.o \
c_code/6_2/options.o \
c_code/6_2/lists.o \
c_code/6_2/stdlib_strtabs.o \
c_code/6_2/stdlib_hashes.o \
c_code/6_2/stdlib_osproc.o \
c_code/6_2/stdlib_streams.o \
c_code/6_2/stdlib_cpuinfo.o \
c_code/6_2/stdlib_sets.o \
c_code/6_2/stdlib_math.o \
c_code/6_2/stdlib_tables.o \
c_code/6_2/ropes.o \
c_code/6_2/platform.o \
c_code/6_2/crc.o \
c_code/6_2/stdlib_sockets.o \
c_code/6_2/stdlib_unsigned.o \
c_code/6_2/nversion.o \
c_code/6_2/condsyms.o \
c_code/6_2/idents.o \
c_code/6_2/extccomp.o \
c_code/6_2/wordrecg.o \
c_code/6_2/nimblecmd.o \
c_code/6_2/stdlib_parseopt.o \
c_code/6_2/lexer.o \
c_code/6_2/nimlexbase.o \
c_code/6_2/llstream.o \
c_code/6_2/nimconf.o \
c_code/6_2/main.o \
c_code/6_2/ast.o \
c_code/6_2/stdlib_intsets.o \
c_code/6_2/idgen.o \
c_code/6_2/astalgo.o \
c_code/6_2/rodutils.o \
c_code/6_2/syntaxes.o \
c_code/6_2/parser.o \
c_code/6_2/pbraces.o \
c_code/6_2/filters.o \
c_code/6_2/renderer.o \
c_code/6_2/filter_tmpl.o \
c_code/6_2/rodread.o \
c_code/6_2/types.o \
c_code/6_2/trees.o \
c_code/6_2/stdlib_memfiles.o \
c_code/6_2/rodwrite.o \
c_code/6_2/passes.o \
c_code/6_2/magicsys.o \
c_code/6_2/nimsets.o \
c_code/6_2/bitsets.o \
c_code/6_2/importer.o \
c_code/6_2/lookups.o \
c_code/6_2/semdata.o \
c_code/6_2/treetab.o \
c_code/6_2/vmdef.o \
c_code/6_2/prettybase.o \
c_code/6_2/stdlib_lexbase.o \
c_code/6_2/sem.o \
c_code/6_2/semfold.o \
c_code/6_2/saturate.o \
c_code/6_2/procfind.o \
c_code/6_2/pragmas.o \
c_code/6_2/semtypinst.o \
c_code/6_2/sigmatch.o \
c_code/6_2/parampatterns.o \
c_code/6_2/pretty.o \
c_code/6_2/docgen.o \
c_code/6_2/docutils_rstast.o \
c_code/6_2/stdlib_json.o \
c_code/6_2/stdlib_unicode.o \
c_code/6_2/docutils_rst.o \
c_code/6_2/docutils_rstgen.o \
c_code/6_2/docutils_highlite.o \
c_code/6_2/stdlib_sequtils.o \
c_code/6_2/stdlib_algorithm.o \
c_code/6_2/sempass2.o \
c_code/6_2/guards.o \
c_code/6_2/stdlib_xmltree.o \
c_code/6_2/stdlib_macros.o \
c_code/6_2/stdlib_cgi.o \
c_code/6_2/stdlib_cookies.o \
c_code/6_2/typesrenderer.o \
c_code/6_2/transf.o \
c_code/6_2/cgmeth.o \
c_code/6_2/lambdalifting.o \
c_code/6_2/lowerings.o \
c_code/6_2/vm.o \
c_code/6_2/vmgen.o \
c_code/6_2/vmdeps.o \
c_code/6_2/evaltempl.o \
c_code/6_2/aliases.o \
c_code/6_2/patterns.o \
c_code/6_2/semmacrosanity.o \
c_code/6_2/semparallel.o \
c_code/6_2/cgen.o \
c_code/6_2/ccgutils.o \
c_code/6_2/cgendata.o \
c_code/6_2/ccgmerge.o \
c_code/6_2/jsgen.o \
c_code/6_2/passaux.o \
c_code/6_2/depends.o \
c_code/6_2/docgen2.o \
c_code/6_2/service.o \
c_code/6_2/modules.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
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
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/nim.c -o c_code/7_1/nim.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/nim.c -o c_code/7_1/nim.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_system.c -o c_code/7_1/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_system.c -o c_code/7_1/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/testability.c -o c_code/7_1/testability.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/testability.c -o c_code/7_1/testability.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/commands.c -o c_code/7_1/commands.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/commands.c -o c_code/7_1/commands.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_os.c -o c_code/7_1/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_os.c -o c_code/7_1/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_strutils.c -o c_code/7_1/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_strutils.c -o c_code/7_1/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_parseutils.c -o c_code/7_1/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_parseutils.c -o c_code/7_1/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_times.c -o c_code/7_1/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_times.c -o c_code/7_1/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_posix.c -o c_code/7_1/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_posix.c -o c_code/7_1/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/msgs.c -o c_code/7_1/msgs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/msgs.c -o c_code/7_1/msgs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/options.c -o c_code/7_1/options.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/options.c -o c_code/7_1/options.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/lists.c -o c_code/7_1/lists.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/lists.c -o c_code/7_1/lists.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_strtabs.c -o c_code/7_1/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_strtabs.c -o c_code/7_1/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_hashes.c -o c_code/7_1/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_hashes.c -o c_code/7_1/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_osproc.c -o c_code/7_1/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_osproc.c -o c_code/7_1/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_streams.c -o c_code/7_1/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_streams.c -o c_code/7_1/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_cpuinfo.c -o c_code/7_1/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_cpuinfo.c -o c_code/7_1/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_sets.c -o c_code/7_1/stdlib_sets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_sets.c -o c_code/7_1/stdlib_sets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_math.c -o c_code/7_1/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_math.c -o c_code/7_1/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_tables.c -o c_code/7_1/stdlib_tables.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_tables.c -o c_code/7_1/stdlib_tables.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/ropes.c -o c_code/7_1/ropes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/ropes.c -o c_code/7_1/ropes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/platform.c -o c_code/7_1/platform.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/platform.c -o c_code/7_1/platform.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/crc.c -o c_code/7_1/crc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/crc.c -o c_code/7_1/crc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_sockets.c -o c_code/7_1/stdlib_sockets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_sockets.c -o c_code/7_1/stdlib_sockets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_unsigned.c -o c_code/7_1/stdlib_unsigned.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_unsigned.c -o c_code/7_1/stdlib_unsigned.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/nversion.c -o c_code/7_1/nversion.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/nversion.c -o c_code/7_1/nversion.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/condsyms.c -o c_code/7_1/condsyms.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/condsyms.c -o c_code/7_1/condsyms.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/idents.c -o c_code/7_1/idents.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/idents.c -o c_code/7_1/idents.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/extccomp.c -o c_code/7_1/extccomp.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/extccomp.c -o c_code/7_1/extccomp.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/wordrecg.c -o c_code/7_1/wordrecg.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/wordrecg.c -o c_code/7_1/wordrecg.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/nimblecmd.c -o c_code/7_1/nimblecmd.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/nimblecmd.c -o c_code/7_1/nimblecmd.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_parseopt.c -o c_code/7_1/stdlib_parseopt.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_parseopt.c -o c_code/7_1/stdlib_parseopt.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/lexer.c -o c_code/7_1/lexer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/lexer.c -o c_code/7_1/lexer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/nimlexbase.c -o c_code/7_1/nimlexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/nimlexbase.c -o c_code/7_1/nimlexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/llstream.c -o c_code/7_1/llstream.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/llstream.c -o c_code/7_1/llstream.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/nimconf.c -o c_code/7_1/nimconf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/nimconf.c -o c_code/7_1/nimconf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/main.c -o c_code/7_1/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/main.c -o c_code/7_1/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/ast.c -o c_code/7_1/ast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/ast.c -o c_code/7_1/ast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_intsets.c -o c_code/7_1/stdlib_intsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_intsets.c -o c_code/7_1/stdlib_intsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/idgen.c -o c_code/7_1/idgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/idgen.c -o c_code/7_1/idgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/astalgo.c -o c_code/7_1/astalgo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/astalgo.c -o c_code/7_1/astalgo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/rodutils.c -o c_code/7_1/rodutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/rodutils.c -o c_code/7_1/rodutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/syntaxes.c -o c_code/7_1/syntaxes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/syntaxes.c -o c_code/7_1/syntaxes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/parser.c -o c_code/7_1/parser.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/parser.c -o c_code/7_1/parser.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/pbraces.c -o c_code/7_1/pbraces.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/pbraces.c -o c_code/7_1/pbraces.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/filters.c -o c_code/7_1/filters.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/filters.c -o c_code/7_1/filters.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/renderer.c -o c_code/7_1/renderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/renderer.c -o c_code/7_1/renderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/filter_tmpl.c -o c_code/7_1/filter_tmpl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/filter_tmpl.c -o c_code/7_1/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/rodread.c -o c_code/7_1/rodread.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/rodread.c -o c_code/7_1/rodread.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/types.c -o c_code/7_1/types.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/types.c -o c_code/7_1/types.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/trees.c -o c_code/7_1/trees.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/trees.c -o c_code/7_1/trees.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_memfiles.c -o c_code/7_1/stdlib_memfiles.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_memfiles.c -o c_code/7_1/stdlib_memfiles.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/rodwrite.c -o c_code/7_1/rodwrite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/rodwrite.c -o c_code/7_1/rodwrite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/passes.c -o c_code/7_1/passes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/passes.c -o c_code/7_1/passes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/magicsys.c -o c_code/7_1/magicsys.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/magicsys.c -o c_code/7_1/magicsys.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/nimsets.c -o c_code/7_1/nimsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/nimsets.c -o c_code/7_1/nimsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/bitsets.c -o c_code/7_1/bitsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/bitsets.c -o c_code/7_1/bitsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/importer.c -o c_code/7_1/importer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/importer.c -o c_code/7_1/importer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/lookups.c -o c_code/7_1/lookups.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/lookups.c -o c_code/7_1/lookups.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/semdata.c -o c_code/7_1/semdata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/semdata.c -o c_code/7_1/semdata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/treetab.c -o c_code/7_1/treetab.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/treetab.c -o c_code/7_1/treetab.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/vmdef.c -o c_code/7_1/vmdef.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/vmdef.c -o c_code/7_1/vmdef.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/prettybase.c -o c_code/7_1/prettybase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/prettybase.c -o c_code/7_1/prettybase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_lexbase.c -o c_code/7_1/stdlib_lexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_lexbase.c -o c_code/7_1/stdlib_lexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/sem.c -o c_code/7_1/sem.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/sem.c -o c_code/7_1/sem.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/semfold.c -o c_code/7_1/semfold.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/semfold.c -o c_code/7_1/semfold.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/saturate.c -o c_code/7_1/saturate.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/saturate.c -o c_code/7_1/saturate.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/procfind.c -o c_code/7_1/procfind.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/procfind.c -o c_code/7_1/procfind.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/pragmas.c -o c_code/7_1/pragmas.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/pragmas.c -o c_code/7_1/pragmas.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/semtypinst.c -o c_code/7_1/semtypinst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/semtypinst.c -o c_code/7_1/semtypinst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/sigmatch.c -o c_code/7_1/sigmatch.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/sigmatch.c -o c_code/7_1/sigmatch.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/parampatterns.c -o c_code/7_1/parampatterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/parampatterns.c -o c_code/7_1/parampatterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/pretty.c -o c_code/7_1/pretty.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/pretty.c -o c_code/7_1/pretty.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/docgen.c -o c_code/7_1/docgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/docgen.c -o c_code/7_1/docgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/docutils_rstast.c -o c_code/7_1/docutils_rstast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/docutils_rstast.c -o c_code/7_1/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_json.c -o c_code/7_1/stdlib_json.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_json.c -o c_code/7_1/stdlib_json.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_unicode.c -o c_code/7_1/stdlib_unicode.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_unicode.c -o c_code/7_1/stdlib_unicode.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/docutils_rst.c -o c_code/7_1/docutils_rst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/docutils_rst.c -o c_code/7_1/docutils_rst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/docutils_rstgen.c -o c_code/7_1/docutils_rstgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/docutils_rstgen.c -o c_code/7_1/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/docutils_highlite.c -o c_code/7_1/docutils_highlite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/docutils_highlite.c -o c_code/7_1/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_sequtils.c -o c_code/7_1/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_sequtils.c -o c_code/7_1/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_algorithm.c -o c_code/7_1/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_algorithm.c -o c_code/7_1/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/sempass2.c -o c_code/7_1/sempass2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/sempass2.c -o c_code/7_1/sempass2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/guards.c -o c_code/7_1/guards.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/guards.c -o c_code/7_1/guards.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_xmltree.c -o c_code/7_1/stdlib_xmltree.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_xmltree.c -o c_code/7_1/stdlib_xmltree.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_macros.c -o c_code/7_1/stdlib_macros.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_macros.c -o c_code/7_1/stdlib_macros.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_cgi.c -o c_code/7_1/stdlib_cgi.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_cgi.c -o c_code/7_1/stdlib_cgi.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_cookies.c -o c_code/7_1/stdlib_cookies.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_cookies.c -o c_code/7_1/stdlib_cookies.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/typesrenderer.c -o c_code/7_1/typesrenderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/typesrenderer.c -o c_code/7_1/typesrenderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/transf.c -o c_code/7_1/transf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/transf.c -o c_code/7_1/transf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/cgmeth.c -o c_code/7_1/cgmeth.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/cgmeth.c -o c_code/7_1/cgmeth.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/lambdalifting.c -o c_code/7_1/lambdalifting.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/lambdalifting.c -o c_code/7_1/lambdalifting.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/lowerings.c -o c_code/7_1/lowerings.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/lowerings.c -o c_code/7_1/lowerings.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/vm.c -o c_code/7_1/vm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/vm.c -o c_code/7_1/vm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/vmgen.c -o c_code/7_1/vmgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/vmgen.c -o c_code/7_1/vmgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/vmdeps.c -o c_code/7_1/vmdeps.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/vmdeps.c -o c_code/7_1/vmdeps.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/evaltempl.c -o c_code/7_1/evaltempl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/evaltempl.c -o c_code/7_1/evaltempl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/aliases.c -o c_code/7_1/aliases.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/aliases.c -o c_code/7_1/aliases.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/patterns.c -o c_code/7_1/patterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/patterns.c -o c_code/7_1/patterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/semmacrosanity.c -o c_code/7_1/semmacrosanity.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/semmacrosanity.c -o c_code/7_1/semmacrosanity.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/semparallel.c -o c_code/7_1/semparallel.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/semparallel.c -o c_code/7_1/semparallel.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/cgen.c -o c_code/7_1/cgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/cgen.c -o c_code/7_1/cgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/ccgutils.c -o c_code/7_1/ccgutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/ccgutils.c -o c_code/7_1/ccgutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/cgendata.c -o c_code/7_1/cgendata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/cgendata.c -o c_code/7_1/cgendata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/ccgmerge.c -o c_code/7_1/ccgmerge.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/ccgmerge.c -o c_code/7_1/ccgmerge.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/jsgen.c -o c_code/7_1/jsgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/jsgen.c -o c_code/7_1/jsgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/passaux.c -o c_code/7_1/passaux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/passaux.c -o c_code/7_1/passaux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/depends.c -o c_code/7_1/depends.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/depends.c -o c_code/7_1/depends.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/docgen2.c -o c_code/7_1/docgen2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/docgen2.c -o c_code/7_1/docgen2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/service.c -o c_code/7_1/service.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/service.c -o c_code/7_1/service.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/modules.c -o c_code/7_1/modules.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/modules.c -o c_code/7_1/modules.o
    echo "$LINKER -o $binDir/nim  \
c_code/7_1/nim.o \
c_code/7_1/stdlib_system.o \
c_code/7_1/testability.o \
c_code/7_1/commands.o \
c_code/7_1/stdlib_os.o \
c_code/7_1/stdlib_strutils.o \
c_code/7_1/stdlib_parseutils.o \
c_code/7_1/stdlib_times.o \
c_code/7_1/stdlib_posix.o \
c_code/7_1/msgs.o \
c_code/7_1/options.o \
c_code/7_1/lists.o \
c_code/7_1/stdlib_strtabs.o \
c_code/7_1/stdlib_hashes.o \
c_code/7_1/stdlib_osproc.o \
c_code/7_1/stdlib_streams.o \
c_code/7_1/stdlib_cpuinfo.o \
c_code/7_1/stdlib_sets.o \
c_code/7_1/stdlib_math.o \
c_code/7_1/stdlib_tables.o \
c_code/7_1/ropes.o \
c_code/7_1/platform.o \
c_code/7_1/crc.o \
c_code/7_1/stdlib_sockets.o \
c_code/7_1/stdlib_unsigned.o \
c_code/7_1/nversion.o \
c_code/7_1/condsyms.o \
c_code/7_1/idents.o \
c_code/7_1/extccomp.o \
c_code/7_1/wordrecg.o \
c_code/7_1/nimblecmd.o \
c_code/7_1/stdlib_parseopt.o \
c_code/7_1/lexer.o \
c_code/7_1/nimlexbase.o \
c_code/7_1/llstream.o \
c_code/7_1/nimconf.o \
c_code/7_1/main.o \
c_code/7_1/ast.o \
c_code/7_1/stdlib_intsets.o \
c_code/7_1/idgen.o \
c_code/7_1/astalgo.o \
c_code/7_1/rodutils.o \
c_code/7_1/syntaxes.o \
c_code/7_1/parser.o \
c_code/7_1/pbraces.o \
c_code/7_1/filters.o \
c_code/7_1/renderer.o \
c_code/7_1/filter_tmpl.o \
c_code/7_1/rodread.o \
c_code/7_1/types.o \
c_code/7_1/trees.o \
c_code/7_1/stdlib_memfiles.o \
c_code/7_1/rodwrite.o \
c_code/7_1/passes.o \
c_code/7_1/magicsys.o \
c_code/7_1/nimsets.o \
c_code/7_1/bitsets.o \
c_code/7_1/importer.o \
c_code/7_1/lookups.o \
c_code/7_1/semdata.o \
c_code/7_1/treetab.o \
c_code/7_1/vmdef.o \
c_code/7_1/prettybase.o \
c_code/7_1/stdlib_lexbase.o \
c_code/7_1/sem.o \
c_code/7_1/semfold.o \
c_code/7_1/saturate.o \
c_code/7_1/procfind.o \
c_code/7_1/pragmas.o \
c_code/7_1/semtypinst.o \
c_code/7_1/sigmatch.o \
c_code/7_1/parampatterns.o \
c_code/7_1/pretty.o \
c_code/7_1/docgen.o \
c_code/7_1/docutils_rstast.o \
c_code/7_1/stdlib_json.o \
c_code/7_1/stdlib_unicode.o \
c_code/7_1/docutils_rst.o \
c_code/7_1/docutils_rstgen.o \
c_code/7_1/docutils_highlite.o \
c_code/7_1/stdlib_sequtils.o \
c_code/7_1/stdlib_algorithm.o \
c_code/7_1/sempass2.o \
c_code/7_1/guards.o \
c_code/7_1/stdlib_xmltree.o \
c_code/7_1/stdlib_macros.o \
c_code/7_1/stdlib_cgi.o \
c_code/7_1/stdlib_cookies.o \
c_code/7_1/typesrenderer.o \
c_code/7_1/transf.o \
c_code/7_1/cgmeth.o \
c_code/7_1/lambdalifting.o \
c_code/7_1/lowerings.o \
c_code/7_1/vm.o \
c_code/7_1/vmgen.o \
c_code/7_1/vmdeps.o \
c_code/7_1/evaltempl.o \
c_code/7_1/aliases.o \
c_code/7_1/patterns.o \
c_code/7_1/semmacrosanity.o \
c_code/7_1/semparallel.o \
c_code/7_1/cgen.o \
c_code/7_1/ccgutils.o \
c_code/7_1/cgendata.o \
c_code/7_1/ccgmerge.o \
c_code/7_1/jsgen.o \
c_code/7_1/passaux.o \
c_code/7_1/depends.o \
c_code/7_1/docgen2.o \
c_code/7_1/service.o \
c_code/7_1/modules.o $LINK_FLAGS"
    $LINKER -o $binDir/nim  \
c_code/7_1/nim.o \
c_code/7_1/stdlib_system.o \
c_code/7_1/testability.o \
c_code/7_1/commands.o \
c_code/7_1/stdlib_os.o \
c_code/7_1/stdlib_strutils.o \
c_code/7_1/stdlib_parseutils.o \
c_code/7_1/stdlib_times.o \
c_code/7_1/stdlib_posix.o \
c_code/7_1/msgs.o \
c_code/7_1/options.o \
c_code/7_1/lists.o \
c_code/7_1/stdlib_strtabs.o \
c_code/7_1/stdlib_hashes.o \
c_code/7_1/stdlib_osproc.o \
c_code/7_1/stdlib_streams.o \
c_code/7_1/stdlib_cpuinfo.o \
c_code/7_1/stdlib_sets.o \
c_code/7_1/stdlib_math.o \
c_code/7_1/stdlib_tables.o \
c_code/7_1/ropes.o \
c_code/7_1/platform.o \
c_code/7_1/crc.o \
c_code/7_1/stdlib_sockets.o \
c_code/7_1/stdlib_unsigned.o \
c_code/7_1/nversion.o \
c_code/7_1/condsyms.o \
c_code/7_1/idents.o \
c_code/7_1/extccomp.o \
c_code/7_1/wordrecg.o \
c_code/7_1/nimblecmd.o \
c_code/7_1/stdlib_parseopt.o \
c_code/7_1/lexer.o \
c_code/7_1/nimlexbase.o \
c_code/7_1/llstream.o \
c_code/7_1/nimconf.o \
c_code/7_1/main.o \
c_code/7_1/ast.o \
c_code/7_1/stdlib_intsets.o \
c_code/7_1/idgen.o \
c_code/7_1/astalgo.o \
c_code/7_1/rodutils.o \
c_code/7_1/syntaxes.o \
c_code/7_1/parser.o \
c_code/7_1/pbraces.o \
c_code/7_1/filters.o \
c_code/7_1/renderer.o \
c_code/7_1/filter_tmpl.o \
c_code/7_1/rodread.o \
c_code/7_1/types.o \
c_code/7_1/trees.o \
c_code/7_1/stdlib_memfiles.o \
c_code/7_1/rodwrite.o \
c_code/7_1/passes.o \
c_code/7_1/magicsys.o \
c_code/7_1/nimsets.o \
c_code/7_1/bitsets.o \
c_code/7_1/importer.o \
c_code/7_1/lookups.o \
c_code/7_1/semdata.o \
c_code/7_1/treetab.o \
c_code/7_1/vmdef.o \
c_code/7_1/prettybase.o \
c_code/7_1/stdlib_lexbase.o \
c_code/7_1/sem.o \
c_code/7_1/semfold.o \
c_code/7_1/saturate.o \
c_code/7_1/procfind.o \
c_code/7_1/pragmas.o \
c_code/7_1/semtypinst.o \
c_code/7_1/sigmatch.o \
c_code/7_1/parampatterns.o \
c_code/7_1/pretty.o \
c_code/7_1/docgen.o \
c_code/7_1/docutils_rstast.o \
c_code/7_1/stdlib_json.o \
c_code/7_1/stdlib_unicode.o \
c_code/7_1/docutils_rst.o \
c_code/7_1/docutils_rstgen.o \
c_code/7_1/docutils_highlite.o \
c_code/7_1/stdlib_sequtils.o \
c_code/7_1/stdlib_algorithm.o \
c_code/7_1/sempass2.o \
c_code/7_1/guards.o \
c_code/7_1/stdlib_xmltree.o \
c_code/7_1/stdlib_macros.o \
c_code/7_1/stdlib_cgi.o \
c_code/7_1/stdlib_cookies.o \
c_code/7_1/typesrenderer.o \
c_code/7_1/transf.o \
c_code/7_1/cgmeth.o \
c_code/7_1/lambdalifting.o \
c_code/7_1/lowerings.o \
c_code/7_1/vm.o \
c_code/7_1/vmgen.o \
c_code/7_1/vmdeps.o \
c_code/7_1/evaltempl.o \
c_code/7_1/aliases.o \
c_code/7_1/patterns.o \
c_code/7_1/semmacrosanity.o \
c_code/7_1/semparallel.o \
c_code/7_1/cgen.o \
c_code/7_1/ccgutils.o \
c_code/7_1/cgendata.o \
c_code/7_1/ccgmerge.o \
c_code/7_1/jsgen.o \
c_code/7_1/passaux.o \
c_code/7_1/depends.o \
c_code/7_1/docgen2.o \
c_code/7_1/service.o \
c_code/7_1/modules.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/nim.c -o c_code/7_2/nim.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/nim.c -o c_code/7_2/nim.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_system.c -o c_code/7_2/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_system.c -o c_code/7_2/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/testability.c -o c_code/7_2/testability.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/testability.c -o c_code/7_2/testability.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/commands.c -o c_code/7_2/commands.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/commands.c -o c_code/7_2/commands.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_os.c -o c_code/7_2/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_os.c -o c_code/7_2/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_strutils.c -o c_code/7_2/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_strutils.c -o c_code/7_2/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_parseutils.c -o c_code/7_2/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_parseutils.c -o c_code/7_2/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_times.c -o c_code/7_2/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_times.c -o c_code/7_2/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_posix.c -o c_code/7_2/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_posix.c -o c_code/7_2/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/msgs.c -o c_code/7_2/msgs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/msgs.c -o c_code/7_2/msgs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/options.c -o c_code/7_2/options.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/options.c -o c_code/7_2/options.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/lists.c -o c_code/7_2/lists.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/lists.c -o c_code/7_2/lists.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_strtabs.c -o c_code/7_2/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_strtabs.c -o c_code/7_2/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_hashes.c -o c_code/7_2/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_hashes.c -o c_code/7_2/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_osproc.c -o c_code/7_2/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_osproc.c -o c_code/7_2/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_streams.c -o c_code/7_2/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_streams.c -o c_code/7_2/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_cpuinfo.c -o c_code/7_2/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_cpuinfo.c -o c_code/7_2/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_sets.c -o c_code/7_2/stdlib_sets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_sets.c -o c_code/7_2/stdlib_sets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_math.c -o c_code/7_2/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_math.c -o c_code/7_2/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_tables.c -o c_code/7_2/stdlib_tables.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_tables.c -o c_code/7_2/stdlib_tables.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/ropes.c -o c_code/7_2/ropes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/ropes.c -o c_code/7_2/ropes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/platform.c -o c_code/7_2/platform.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/platform.c -o c_code/7_2/platform.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/crc.c -o c_code/7_2/crc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/crc.c -o c_code/7_2/crc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_sockets.c -o c_code/7_2/stdlib_sockets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_sockets.c -o c_code/7_2/stdlib_sockets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_unsigned.c -o c_code/7_2/stdlib_unsigned.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_unsigned.c -o c_code/7_2/stdlib_unsigned.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/nversion.c -o c_code/7_2/nversion.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/nversion.c -o c_code/7_2/nversion.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/condsyms.c -o c_code/7_2/condsyms.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/condsyms.c -o c_code/7_2/condsyms.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/idents.c -o c_code/7_2/idents.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/idents.c -o c_code/7_2/idents.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/extccomp.c -o c_code/7_2/extccomp.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/extccomp.c -o c_code/7_2/extccomp.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/wordrecg.c -o c_code/7_2/wordrecg.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/wordrecg.c -o c_code/7_2/wordrecg.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/nimblecmd.c -o c_code/7_2/nimblecmd.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/nimblecmd.c -o c_code/7_2/nimblecmd.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_parseopt.c -o c_code/7_2/stdlib_parseopt.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_parseopt.c -o c_code/7_2/stdlib_parseopt.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/lexer.c -o c_code/7_2/lexer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/lexer.c -o c_code/7_2/lexer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/nimlexbase.c -o c_code/7_2/nimlexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/nimlexbase.c -o c_code/7_2/nimlexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/llstream.c -o c_code/7_2/llstream.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/llstream.c -o c_code/7_2/llstream.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/nimconf.c -o c_code/7_2/nimconf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/nimconf.c -o c_code/7_2/nimconf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/main.c -o c_code/7_2/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/main.c -o c_code/7_2/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/ast.c -o c_code/7_2/ast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/ast.c -o c_code/7_2/ast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_intsets.c -o c_code/7_2/stdlib_intsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_intsets.c -o c_code/7_2/stdlib_intsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/idgen.c -o c_code/7_2/idgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/idgen.c -o c_code/7_2/idgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/astalgo.c -o c_code/7_2/astalgo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/astalgo.c -o c_code/7_2/astalgo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/rodutils.c -o c_code/7_2/rodutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/rodutils.c -o c_code/7_2/rodutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/syntaxes.c -o c_code/7_2/syntaxes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/syntaxes.c -o c_code/7_2/syntaxes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/parser.c -o c_code/7_2/parser.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/parser.c -o c_code/7_2/parser.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/pbraces.c -o c_code/7_2/pbraces.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/pbraces.c -o c_code/7_2/pbraces.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/filters.c -o c_code/7_2/filters.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/filters.c -o c_code/7_2/filters.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/renderer.c -o c_code/7_2/renderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/renderer.c -o c_code/7_2/renderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/filter_tmpl.c -o c_code/7_2/filter_tmpl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/filter_tmpl.c -o c_code/7_2/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/rodread.c -o c_code/7_2/rodread.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/rodread.c -o c_code/7_2/rodread.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/types.c -o c_code/7_2/types.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/types.c -o c_code/7_2/types.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/trees.c -o c_code/7_2/trees.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/trees.c -o c_code/7_2/trees.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_memfiles.c -o c_code/7_2/stdlib_memfiles.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_memfiles.c -o c_code/7_2/stdlib_memfiles.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/rodwrite.c -o c_code/7_2/rodwrite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/rodwrite.c -o c_code/7_2/rodwrite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/passes.c -o c_code/7_2/passes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/passes.c -o c_code/7_2/passes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/magicsys.c -o c_code/7_2/magicsys.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/magicsys.c -o c_code/7_2/magicsys.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/nimsets.c -o c_code/7_2/nimsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/nimsets.c -o c_code/7_2/nimsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/bitsets.c -o c_code/7_2/bitsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/bitsets.c -o c_code/7_2/bitsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/importer.c -o c_code/7_2/importer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/importer.c -o c_code/7_2/importer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/lookups.c -o c_code/7_2/lookups.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/lookups.c -o c_code/7_2/lookups.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/semdata.c -o c_code/7_2/semdata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/semdata.c -o c_code/7_2/semdata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/treetab.c -o c_code/7_2/treetab.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/treetab.c -o c_code/7_2/treetab.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/vmdef.c -o c_code/7_2/vmdef.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/vmdef.c -o c_code/7_2/vmdef.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/prettybase.c -o c_code/7_2/prettybase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/prettybase.c -o c_code/7_2/prettybase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_lexbase.c -o c_code/7_2/stdlib_lexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_lexbase.c -o c_code/7_2/stdlib_lexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/sem.c -o c_code/7_2/sem.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/sem.c -o c_code/7_2/sem.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/semfold.c -o c_code/7_2/semfold.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/semfold.c -o c_code/7_2/semfold.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/saturate.c -o c_code/7_2/saturate.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/saturate.c -o c_code/7_2/saturate.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/procfind.c -o c_code/7_2/procfind.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/procfind.c -o c_code/7_2/procfind.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/pragmas.c -o c_code/7_2/pragmas.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/pragmas.c -o c_code/7_2/pragmas.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/semtypinst.c -o c_code/7_2/semtypinst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/semtypinst.c -o c_code/7_2/semtypinst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/sigmatch.c -o c_code/7_2/sigmatch.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/sigmatch.c -o c_code/7_2/sigmatch.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/parampatterns.c -o c_code/7_2/parampatterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/parampatterns.c -o c_code/7_2/parampatterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/pretty.c -o c_code/7_2/pretty.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/pretty.c -o c_code/7_2/pretty.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/docgen.c -o c_code/7_2/docgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/docgen.c -o c_code/7_2/docgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/docutils_rstast.c -o c_code/7_2/docutils_rstast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/docutils_rstast.c -o c_code/7_2/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_json.c -o c_code/7_2/stdlib_json.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_json.c -o c_code/7_2/stdlib_json.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_unicode.c -o c_code/7_2/stdlib_unicode.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_unicode.c -o c_code/7_2/stdlib_unicode.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/docutils_rst.c -o c_code/7_2/docutils_rst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/docutils_rst.c -o c_code/7_2/docutils_rst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/docutils_rstgen.c -o c_code/7_2/docutils_rstgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/docutils_rstgen.c -o c_code/7_2/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/docutils_highlite.c -o c_code/7_2/docutils_highlite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/docutils_highlite.c -o c_code/7_2/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_sequtils.c -o c_code/7_2/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_sequtils.c -o c_code/7_2/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_algorithm.c -o c_code/7_2/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_algorithm.c -o c_code/7_2/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/sempass2.c -o c_code/7_2/sempass2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/sempass2.c -o c_code/7_2/sempass2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/guards.c -o c_code/7_2/guards.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/guards.c -o c_code/7_2/guards.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_xmltree.c -o c_code/7_2/stdlib_xmltree.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_xmltree.c -o c_code/7_2/stdlib_xmltree.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_macros.c -o c_code/7_2/stdlib_macros.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_macros.c -o c_code/7_2/stdlib_macros.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_cgi.c -o c_code/7_2/stdlib_cgi.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_cgi.c -o c_code/7_2/stdlib_cgi.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_cookies.c -o c_code/7_2/stdlib_cookies.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_cookies.c -o c_code/7_2/stdlib_cookies.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/typesrenderer.c -o c_code/7_2/typesrenderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/typesrenderer.c -o c_code/7_2/typesrenderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/transf.c -o c_code/7_2/transf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/transf.c -o c_code/7_2/transf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/cgmeth.c -o c_code/7_2/cgmeth.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/cgmeth.c -o c_code/7_2/cgmeth.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/lambdalifting.c -o c_code/7_2/lambdalifting.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/lambdalifting.c -o c_code/7_2/lambdalifting.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/lowerings.c -o c_code/7_2/lowerings.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/lowerings.c -o c_code/7_2/lowerings.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/vm.c -o c_code/7_2/vm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/vm.c -o c_code/7_2/vm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/vmgen.c -o c_code/7_2/vmgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/vmgen.c -o c_code/7_2/vmgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/vmdeps.c -o c_code/7_2/vmdeps.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/vmdeps.c -o c_code/7_2/vmdeps.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/evaltempl.c -o c_code/7_2/evaltempl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/evaltempl.c -o c_code/7_2/evaltempl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/aliases.c -o c_code/7_2/aliases.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/aliases.c -o c_code/7_2/aliases.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/patterns.c -o c_code/7_2/patterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/patterns.c -o c_code/7_2/patterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/semmacrosanity.c -o c_code/7_2/semmacrosanity.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/semmacrosanity.c -o c_code/7_2/semmacrosanity.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/semparallel.c -o c_code/7_2/semparallel.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/semparallel.c -o c_code/7_2/semparallel.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/cgen.c -o c_code/7_2/cgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/cgen.c -o c_code/7_2/cgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/ccgutils.c -o c_code/7_2/ccgutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/ccgutils.c -o c_code/7_2/ccgutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/cgendata.c -o c_code/7_2/cgendata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/cgendata.c -o c_code/7_2/cgendata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/ccgmerge.c -o c_code/7_2/ccgmerge.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/ccgmerge.c -o c_code/7_2/ccgmerge.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/jsgen.c -o c_code/7_2/jsgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/jsgen.c -o c_code/7_2/jsgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/passaux.c -o c_code/7_2/passaux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/passaux.c -o c_code/7_2/passaux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/depends.c -o c_code/7_2/depends.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/depends.c -o c_code/7_2/depends.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/docgen2.c -o c_code/7_2/docgen2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/docgen2.c -o c_code/7_2/docgen2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/service.c -o c_code/7_2/service.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/service.c -o c_code/7_2/service.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/modules.c -o c_code/7_2/modules.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/modules.c -o c_code/7_2/modules.o
    echo "$LINKER -o $binDir/nim  \
c_code/7_2/nim.o \
c_code/7_2/stdlib_system.o \
c_code/7_2/testability.o \
c_code/7_2/commands.o \
c_code/7_2/stdlib_os.o \
c_code/7_2/stdlib_strutils.o \
c_code/7_2/stdlib_parseutils.o \
c_code/7_2/stdlib_times.o \
c_code/7_2/stdlib_posix.o \
c_code/7_2/msgs.o \
c_code/7_2/options.o \
c_code/7_2/lists.o \
c_code/7_2/stdlib_strtabs.o \
c_code/7_2/stdlib_hashes.o \
c_code/7_2/stdlib_osproc.o \
c_code/7_2/stdlib_streams.o \
c_code/7_2/stdlib_cpuinfo.o \
c_code/7_2/stdlib_sets.o \
c_code/7_2/stdlib_math.o \
c_code/7_2/stdlib_tables.o \
c_code/7_2/ropes.o \
c_code/7_2/platform.o \
c_code/7_2/crc.o \
c_code/7_2/stdlib_sockets.o \
c_code/7_2/stdlib_unsigned.o \
c_code/7_2/nversion.o \
c_code/7_2/condsyms.o \
c_code/7_2/idents.o \
c_code/7_2/extccomp.o \
c_code/7_2/wordrecg.o \
c_code/7_2/nimblecmd.o \
c_code/7_2/stdlib_parseopt.o \
c_code/7_2/lexer.o \
c_code/7_2/nimlexbase.o \
c_code/7_2/llstream.o \
c_code/7_2/nimconf.o \
c_code/7_2/main.o \
c_code/7_2/ast.o \
c_code/7_2/stdlib_intsets.o \
c_code/7_2/idgen.o \
c_code/7_2/astalgo.o \
c_code/7_2/rodutils.o \
c_code/7_2/syntaxes.o \
c_code/7_2/parser.o \
c_code/7_2/pbraces.o \
c_code/7_2/filters.o \
c_code/7_2/renderer.o \
c_code/7_2/filter_tmpl.o \
c_code/7_2/rodread.o \
c_code/7_2/types.o \
c_code/7_2/trees.o \
c_code/7_2/stdlib_memfiles.o \
c_code/7_2/rodwrite.o \
c_code/7_2/passes.o \
c_code/7_2/magicsys.o \
c_code/7_2/nimsets.o \
c_code/7_2/bitsets.o \
c_code/7_2/importer.o \
c_code/7_2/lookups.o \
c_code/7_2/semdata.o \
c_code/7_2/treetab.o \
c_code/7_2/vmdef.o \
c_code/7_2/prettybase.o \
c_code/7_2/stdlib_lexbase.o \
c_code/7_2/sem.o \
c_code/7_2/semfold.o \
c_code/7_2/saturate.o \
c_code/7_2/procfind.o \
c_code/7_2/pragmas.o \
c_code/7_2/semtypinst.o \
c_code/7_2/sigmatch.o \
c_code/7_2/parampatterns.o \
c_code/7_2/pretty.o \
c_code/7_2/docgen.o \
c_code/7_2/docutils_rstast.o \
c_code/7_2/stdlib_json.o \
c_code/7_2/stdlib_unicode.o \
c_code/7_2/docutils_rst.o \
c_code/7_2/docutils_rstgen.o \
c_code/7_2/docutils_highlite.o \
c_code/7_2/stdlib_sequtils.o \
c_code/7_2/stdlib_algorithm.o \
c_code/7_2/sempass2.o \
c_code/7_2/guards.o \
c_code/7_2/stdlib_xmltree.o \
c_code/7_2/stdlib_macros.o \
c_code/7_2/stdlib_cgi.o \
c_code/7_2/stdlib_cookies.o \
c_code/7_2/typesrenderer.o \
c_code/7_2/transf.o \
c_code/7_2/cgmeth.o \
c_code/7_2/lambdalifting.o \
c_code/7_2/lowerings.o \
c_code/7_2/vm.o \
c_code/7_2/vmgen.o \
c_code/7_2/vmdeps.o \
c_code/7_2/evaltempl.o \
c_code/7_2/aliases.o \
c_code/7_2/patterns.o \
c_code/7_2/semmacrosanity.o \
c_code/7_2/semparallel.o \
c_code/7_2/cgen.o \
c_code/7_2/ccgutils.o \
c_code/7_2/cgendata.o \
c_code/7_2/ccgmerge.o \
c_code/7_2/jsgen.o \
c_code/7_2/passaux.o \
c_code/7_2/depends.o \
c_code/7_2/docgen2.o \
c_code/7_2/service.o \
c_code/7_2/modules.o $LINK_FLAGS"
    $LINKER -o $binDir/nim  \
c_code/7_2/nim.o \
c_code/7_2/stdlib_system.o \
c_code/7_2/testability.o \
c_code/7_2/commands.o \
c_code/7_2/stdlib_os.o \
c_code/7_2/stdlib_strutils.o \
c_code/7_2/stdlib_parseutils.o \
c_code/7_2/stdlib_times.o \
c_code/7_2/stdlib_posix.o \
c_code/7_2/msgs.o \
c_code/7_2/options.o \
c_code/7_2/lists.o \
c_code/7_2/stdlib_strtabs.o \
c_code/7_2/stdlib_hashes.o \
c_code/7_2/stdlib_osproc.o \
c_code/7_2/stdlib_streams.o \
c_code/7_2/stdlib_cpuinfo.o \
c_code/7_2/stdlib_sets.o \
c_code/7_2/stdlib_math.o \
c_code/7_2/stdlib_tables.o \
c_code/7_2/ropes.o \
c_code/7_2/platform.o \
c_code/7_2/crc.o \
c_code/7_2/stdlib_sockets.o \
c_code/7_2/stdlib_unsigned.o \
c_code/7_2/nversion.o \
c_code/7_2/condsyms.o \
c_code/7_2/idents.o \
c_code/7_2/extccomp.o \
c_code/7_2/wordrecg.o \
c_code/7_2/nimblecmd.o \
c_code/7_2/stdlib_parseopt.o \
c_code/7_2/lexer.o \
c_code/7_2/nimlexbase.o \
c_code/7_2/llstream.o \
c_code/7_2/nimconf.o \
c_code/7_2/main.o \
c_code/7_2/ast.o \
c_code/7_2/stdlib_intsets.o \
c_code/7_2/idgen.o \
c_code/7_2/astalgo.o \
c_code/7_2/rodutils.o \
c_code/7_2/syntaxes.o \
c_code/7_2/parser.o \
c_code/7_2/pbraces.o \
c_code/7_2/filters.o \
c_code/7_2/renderer.o \
c_code/7_2/filter_tmpl.o \
c_code/7_2/rodread.o \
c_code/7_2/types.o \
c_code/7_2/trees.o \
c_code/7_2/stdlib_memfiles.o \
c_code/7_2/rodwrite.o \
c_code/7_2/passes.o \
c_code/7_2/magicsys.o \
c_code/7_2/nimsets.o \
c_code/7_2/bitsets.o \
c_code/7_2/importer.o \
c_code/7_2/lookups.o \
c_code/7_2/semdata.o \
c_code/7_2/treetab.o \
c_code/7_2/vmdef.o \
c_code/7_2/prettybase.o \
c_code/7_2/stdlib_lexbase.o \
c_code/7_2/sem.o \
c_code/7_2/semfold.o \
c_code/7_2/saturate.o \
c_code/7_2/procfind.o \
c_code/7_2/pragmas.o \
c_code/7_2/semtypinst.o \
c_code/7_2/sigmatch.o \
c_code/7_2/parampatterns.o \
c_code/7_2/pretty.o \
c_code/7_2/docgen.o \
c_code/7_2/docutils_rstast.o \
c_code/7_2/stdlib_json.o \
c_code/7_2/stdlib_unicode.o \
c_code/7_2/docutils_rst.o \
c_code/7_2/docutils_rstgen.o \
c_code/7_2/docutils_highlite.o \
c_code/7_2/stdlib_sequtils.o \
c_code/7_2/stdlib_algorithm.o \
c_code/7_2/sempass2.o \
c_code/7_2/guards.o \
c_code/7_2/stdlib_xmltree.o \
c_code/7_2/stdlib_macros.o \
c_code/7_2/stdlib_cgi.o \
c_code/7_2/stdlib_cookies.o \
c_code/7_2/typesrenderer.o \
c_code/7_2/transf.o \
c_code/7_2/cgmeth.o \
c_code/7_2/lambdalifting.o \
c_code/7_2/lowerings.o \
c_code/7_2/vm.o \
c_code/7_2/vmgen.o \
c_code/7_2/vmdeps.o \
c_code/7_2/evaltempl.o \
c_code/7_2/aliases.o \
c_code/7_2/patterns.o \
c_code/7_2/semmacrosanity.o \
c_code/7_2/semparallel.o \
c_code/7_2/cgen.o \
c_code/7_2/ccgutils.o \
c_code/7_2/cgendata.o \
c_code/7_2/ccgmerge.o \
c_code/7_2/jsgen.o \
c_code/7_2/passaux.o \
c_code/7_2/depends.o \
c_code/7_2/docgen2.o \
c_code/7_2/service.o \
c_code/7_2/modules.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  *)
    echo "Error: no C code generated for: [$myos: $mycpu]"
    exit 1
    ;;
  esac
  ;;
haiku) 
  case $mycpu in
  i386)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/nim.c -o c_code/8_1/nim.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/nim.c -o c_code/8_1/nim.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_system.c -o c_code/8_1/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_system.c -o c_code/8_1/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/testability.c -o c_code/8_1/testability.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/testability.c -o c_code/8_1/testability.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/commands.c -o c_code/8_1/commands.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/commands.c -o c_code/8_1/commands.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_os.c -o c_code/8_1/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_os.c -o c_code/8_1/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_strutils.c -o c_code/8_1/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_strutils.c -o c_code/8_1/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_parseutils.c -o c_code/8_1/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_parseutils.c -o c_code/8_1/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_times.c -o c_code/8_1/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_times.c -o c_code/8_1/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_posix.c -o c_code/8_1/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_posix.c -o c_code/8_1/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/msgs.c -o c_code/8_1/msgs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/msgs.c -o c_code/8_1/msgs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/options.c -o c_code/8_1/options.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/options.c -o c_code/8_1/options.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/lists.c -o c_code/8_1/lists.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/lists.c -o c_code/8_1/lists.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_strtabs.c -o c_code/8_1/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_strtabs.c -o c_code/8_1/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_hashes.c -o c_code/8_1/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_hashes.c -o c_code/8_1/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_osproc.c -o c_code/8_1/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_osproc.c -o c_code/8_1/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_streams.c -o c_code/8_1/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_streams.c -o c_code/8_1/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_cpuinfo.c -o c_code/8_1/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_cpuinfo.c -o c_code/8_1/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_sets.c -o c_code/8_1/stdlib_sets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_sets.c -o c_code/8_1/stdlib_sets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_math.c -o c_code/8_1/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_math.c -o c_code/8_1/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_tables.c -o c_code/8_1/stdlib_tables.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_tables.c -o c_code/8_1/stdlib_tables.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/ropes.c -o c_code/8_1/ropes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/ropes.c -o c_code/8_1/ropes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/platform.c -o c_code/8_1/platform.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/platform.c -o c_code/8_1/platform.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/crc.c -o c_code/8_1/crc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/crc.c -o c_code/8_1/crc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_sockets.c -o c_code/8_1/stdlib_sockets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_sockets.c -o c_code/8_1/stdlib_sockets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_unsigned.c -o c_code/8_1/stdlib_unsigned.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_unsigned.c -o c_code/8_1/stdlib_unsigned.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/nversion.c -o c_code/8_1/nversion.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/nversion.c -o c_code/8_1/nversion.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/condsyms.c -o c_code/8_1/condsyms.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/condsyms.c -o c_code/8_1/condsyms.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/idents.c -o c_code/8_1/idents.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/idents.c -o c_code/8_1/idents.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/extccomp.c -o c_code/8_1/extccomp.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/extccomp.c -o c_code/8_1/extccomp.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/wordrecg.c -o c_code/8_1/wordrecg.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/wordrecg.c -o c_code/8_1/wordrecg.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/nimblecmd.c -o c_code/8_1/nimblecmd.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/nimblecmd.c -o c_code/8_1/nimblecmd.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_parseopt.c -o c_code/8_1/stdlib_parseopt.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_parseopt.c -o c_code/8_1/stdlib_parseopt.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/lexer.c -o c_code/8_1/lexer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/lexer.c -o c_code/8_1/lexer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/nimlexbase.c -o c_code/8_1/nimlexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/nimlexbase.c -o c_code/8_1/nimlexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/llstream.c -o c_code/8_1/llstream.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/llstream.c -o c_code/8_1/llstream.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/nimconf.c -o c_code/8_1/nimconf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/nimconf.c -o c_code/8_1/nimconf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/main.c -o c_code/8_1/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/main.c -o c_code/8_1/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/ast.c -o c_code/8_1/ast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/ast.c -o c_code/8_1/ast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_intsets.c -o c_code/8_1/stdlib_intsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_intsets.c -o c_code/8_1/stdlib_intsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/idgen.c -o c_code/8_1/idgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/idgen.c -o c_code/8_1/idgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/astalgo.c -o c_code/8_1/astalgo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/astalgo.c -o c_code/8_1/astalgo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/rodutils.c -o c_code/8_1/rodutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/rodutils.c -o c_code/8_1/rodutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/syntaxes.c -o c_code/8_1/syntaxes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/syntaxes.c -o c_code/8_1/syntaxes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/parser.c -o c_code/8_1/parser.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/parser.c -o c_code/8_1/parser.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/pbraces.c -o c_code/8_1/pbraces.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/pbraces.c -o c_code/8_1/pbraces.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/filters.c -o c_code/8_1/filters.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/filters.c -o c_code/8_1/filters.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/renderer.c -o c_code/8_1/renderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/renderer.c -o c_code/8_1/renderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/filter_tmpl.c -o c_code/8_1/filter_tmpl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/filter_tmpl.c -o c_code/8_1/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/rodread.c -o c_code/8_1/rodread.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/rodread.c -o c_code/8_1/rodread.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/types.c -o c_code/8_1/types.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/types.c -o c_code/8_1/types.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/trees.c -o c_code/8_1/trees.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/trees.c -o c_code/8_1/trees.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_memfiles.c -o c_code/8_1/stdlib_memfiles.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_memfiles.c -o c_code/8_1/stdlib_memfiles.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/rodwrite.c -o c_code/8_1/rodwrite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/rodwrite.c -o c_code/8_1/rodwrite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/passes.c -o c_code/8_1/passes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/passes.c -o c_code/8_1/passes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/magicsys.c -o c_code/8_1/magicsys.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/magicsys.c -o c_code/8_1/magicsys.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/nimsets.c -o c_code/8_1/nimsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/nimsets.c -o c_code/8_1/nimsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/bitsets.c -o c_code/8_1/bitsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/bitsets.c -o c_code/8_1/bitsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/importer.c -o c_code/8_1/importer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/importer.c -o c_code/8_1/importer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/lookups.c -o c_code/8_1/lookups.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/lookups.c -o c_code/8_1/lookups.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/semdata.c -o c_code/8_1/semdata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/semdata.c -o c_code/8_1/semdata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/treetab.c -o c_code/8_1/treetab.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/treetab.c -o c_code/8_1/treetab.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/vmdef.c -o c_code/8_1/vmdef.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/vmdef.c -o c_code/8_1/vmdef.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/prettybase.c -o c_code/8_1/prettybase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/prettybase.c -o c_code/8_1/prettybase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_lexbase.c -o c_code/8_1/stdlib_lexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_lexbase.c -o c_code/8_1/stdlib_lexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/sem.c -o c_code/8_1/sem.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/sem.c -o c_code/8_1/sem.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/semfold.c -o c_code/8_1/semfold.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/semfold.c -o c_code/8_1/semfold.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/saturate.c -o c_code/8_1/saturate.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/saturate.c -o c_code/8_1/saturate.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/procfind.c -o c_code/8_1/procfind.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/procfind.c -o c_code/8_1/procfind.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/pragmas.c -o c_code/8_1/pragmas.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/pragmas.c -o c_code/8_1/pragmas.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/semtypinst.c -o c_code/8_1/semtypinst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/semtypinst.c -o c_code/8_1/semtypinst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/sigmatch.c -o c_code/8_1/sigmatch.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/sigmatch.c -o c_code/8_1/sigmatch.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/parampatterns.c -o c_code/8_1/parampatterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/parampatterns.c -o c_code/8_1/parampatterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/pretty.c -o c_code/8_1/pretty.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/pretty.c -o c_code/8_1/pretty.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/docgen.c -o c_code/8_1/docgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/docgen.c -o c_code/8_1/docgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/docutils_rstast.c -o c_code/8_1/docutils_rstast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/docutils_rstast.c -o c_code/8_1/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_json.c -o c_code/8_1/stdlib_json.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_json.c -o c_code/8_1/stdlib_json.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_unicode.c -o c_code/8_1/stdlib_unicode.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_unicode.c -o c_code/8_1/stdlib_unicode.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/docutils_rst.c -o c_code/8_1/docutils_rst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/docutils_rst.c -o c_code/8_1/docutils_rst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/docutils_rstgen.c -o c_code/8_1/docutils_rstgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/docutils_rstgen.c -o c_code/8_1/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/docutils_highlite.c -o c_code/8_1/docutils_highlite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/docutils_highlite.c -o c_code/8_1/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_sequtils.c -o c_code/8_1/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_sequtils.c -o c_code/8_1/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_algorithm.c -o c_code/8_1/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_algorithm.c -o c_code/8_1/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/sempass2.c -o c_code/8_1/sempass2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/sempass2.c -o c_code/8_1/sempass2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/guards.c -o c_code/8_1/guards.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/guards.c -o c_code/8_1/guards.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_xmltree.c -o c_code/8_1/stdlib_xmltree.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_xmltree.c -o c_code/8_1/stdlib_xmltree.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_macros.c -o c_code/8_1/stdlib_macros.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_macros.c -o c_code/8_1/stdlib_macros.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_cgi.c -o c_code/8_1/stdlib_cgi.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_cgi.c -o c_code/8_1/stdlib_cgi.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_cookies.c -o c_code/8_1/stdlib_cookies.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_cookies.c -o c_code/8_1/stdlib_cookies.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/typesrenderer.c -o c_code/8_1/typesrenderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/typesrenderer.c -o c_code/8_1/typesrenderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/transf.c -o c_code/8_1/transf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/transf.c -o c_code/8_1/transf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/cgmeth.c -o c_code/8_1/cgmeth.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/cgmeth.c -o c_code/8_1/cgmeth.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/lambdalifting.c -o c_code/8_1/lambdalifting.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/lambdalifting.c -o c_code/8_1/lambdalifting.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/lowerings.c -o c_code/8_1/lowerings.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/lowerings.c -o c_code/8_1/lowerings.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/vm.c -o c_code/8_1/vm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/vm.c -o c_code/8_1/vm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/vmgen.c -o c_code/8_1/vmgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/vmgen.c -o c_code/8_1/vmgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/vmdeps.c -o c_code/8_1/vmdeps.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/vmdeps.c -o c_code/8_1/vmdeps.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/evaltempl.c -o c_code/8_1/evaltempl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/evaltempl.c -o c_code/8_1/evaltempl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/aliases.c -o c_code/8_1/aliases.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/aliases.c -o c_code/8_1/aliases.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/patterns.c -o c_code/8_1/patterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/patterns.c -o c_code/8_1/patterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/semmacrosanity.c -o c_code/8_1/semmacrosanity.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/semmacrosanity.c -o c_code/8_1/semmacrosanity.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/semparallel.c -o c_code/8_1/semparallel.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/semparallel.c -o c_code/8_1/semparallel.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/cgen.c -o c_code/8_1/cgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/cgen.c -o c_code/8_1/cgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/ccgutils.c -o c_code/8_1/ccgutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/ccgutils.c -o c_code/8_1/ccgutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/cgendata.c -o c_code/8_1/cgendata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/cgendata.c -o c_code/8_1/cgendata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/ccgmerge.c -o c_code/8_1/ccgmerge.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/ccgmerge.c -o c_code/8_1/ccgmerge.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/jsgen.c -o c_code/8_1/jsgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/jsgen.c -o c_code/8_1/jsgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/passaux.c -o c_code/8_1/passaux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/passaux.c -o c_code/8_1/passaux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/depends.c -o c_code/8_1/depends.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/depends.c -o c_code/8_1/depends.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/docgen2.c -o c_code/8_1/docgen2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/docgen2.c -o c_code/8_1/docgen2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/service.c -o c_code/8_1/service.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/service.c -o c_code/8_1/service.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/modules.c -o c_code/8_1/modules.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/modules.c -o c_code/8_1/modules.o
    echo "$LINKER -o $binDir/nim  \
c_code/8_1/nim.o \
c_code/8_1/stdlib_system.o \
c_code/8_1/testability.o \
c_code/8_1/commands.o \
c_code/8_1/stdlib_os.o \
c_code/8_1/stdlib_strutils.o \
c_code/8_1/stdlib_parseutils.o \
c_code/8_1/stdlib_times.o \
c_code/8_1/stdlib_posix.o \
c_code/8_1/msgs.o \
c_code/8_1/options.o \
c_code/8_1/lists.o \
c_code/8_1/stdlib_strtabs.o \
c_code/8_1/stdlib_hashes.o \
c_code/8_1/stdlib_osproc.o \
c_code/8_1/stdlib_streams.o \
c_code/8_1/stdlib_cpuinfo.o \
c_code/8_1/stdlib_sets.o \
c_code/8_1/stdlib_math.o \
c_code/8_1/stdlib_tables.o \
c_code/8_1/ropes.o \
c_code/8_1/platform.o \
c_code/8_1/crc.o \
c_code/8_1/stdlib_sockets.o \
c_code/8_1/stdlib_unsigned.o \
c_code/8_1/nversion.o \
c_code/8_1/condsyms.o \
c_code/8_1/idents.o \
c_code/8_1/extccomp.o \
c_code/8_1/wordrecg.o \
c_code/8_1/nimblecmd.o \
c_code/8_1/stdlib_parseopt.o \
c_code/8_1/lexer.o \
c_code/8_1/nimlexbase.o \
c_code/8_1/llstream.o \
c_code/8_1/nimconf.o \
c_code/8_1/main.o \
c_code/8_1/ast.o \
c_code/8_1/stdlib_intsets.o \
c_code/8_1/idgen.o \
c_code/8_1/astalgo.o \
c_code/8_1/rodutils.o \
c_code/8_1/syntaxes.o \
c_code/8_1/parser.o \
c_code/8_1/pbraces.o \
c_code/8_1/filters.o \
c_code/8_1/renderer.o \
c_code/8_1/filter_tmpl.o \
c_code/8_1/rodread.o \
c_code/8_1/types.o \
c_code/8_1/trees.o \
c_code/8_1/stdlib_memfiles.o \
c_code/8_1/rodwrite.o \
c_code/8_1/passes.o \
c_code/8_1/magicsys.o \
c_code/8_1/nimsets.o \
c_code/8_1/bitsets.o \
c_code/8_1/importer.o \
c_code/8_1/lookups.o \
c_code/8_1/semdata.o \
c_code/8_1/treetab.o \
c_code/8_1/vmdef.o \
c_code/8_1/prettybase.o \
c_code/8_1/stdlib_lexbase.o \
c_code/8_1/sem.o \
c_code/8_1/semfold.o \
c_code/8_1/saturate.o \
c_code/8_1/procfind.o \
c_code/8_1/pragmas.o \
c_code/8_1/semtypinst.o \
c_code/8_1/sigmatch.o \
c_code/8_1/parampatterns.o \
c_code/8_1/pretty.o \
c_code/8_1/docgen.o \
c_code/8_1/docutils_rstast.o \
c_code/8_1/stdlib_json.o \
c_code/8_1/stdlib_unicode.o \
c_code/8_1/docutils_rst.o \
c_code/8_1/docutils_rstgen.o \
c_code/8_1/docutils_highlite.o \
c_code/8_1/stdlib_sequtils.o \
c_code/8_1/stdlib_algorithm.o \
c_code/8_1/sempass2.o \
c_code/8_1/guards.o \
c_code/8_1/stdlib_xmltree.o \
c_code/8_1/stdlib_macros.o \
c_code/8_1/stdlib_cgi.o \
c_code/8_1/stdlib_cookies.o \
c_code/8_1/typesrenderer.o \
c_code/8_1/transf.o \
c_code/8_1/cgmeth.o \
c_code/8_1/lambdalifting.o \
c_code/8_1/lowerings.o \
c_code/8_1/vm.o \
c_code/8_1/vmgen.o \
c_code/8_1/vmdeps.o \
c_code/8_1/evaltempl.o \
c_code/8_1/aliases.o \
c_code/8_1/patterns.o \
c_code/8_1/semmacrosanity.o \
c_code/8_1/semparallel.o \
c_code/8_1/cgen.o \
c_code/8_1/ccgutils.o \
c_code/8_1/cgendata.o \
c_code/8_1/ccgmerge.o \
c_code/8_1/jsgen.o \
c_code/8_1/passaux.o \
c_code/8_1/depends.o \
c_code/8_1/docgen2.o \
c_code/8_1/service.o \
c_code/8_1/modules.o $LINK_FLAGS"
    $LINKER -o $binDir/nim  \
c_code/8_1/nim.o \
c_code/8_1/stdlib_system.o \
c_code/8_1/testability.o \
c_code/8_1/commands.o \
c_code/8_1/stdlib_os.o \
c_code/8_1/stdlib_strutils.o \
c_code/8_1/stdlib_parseutils.o \
c_code/8_1/stdlib_times.o \
c_code/8_1/stdlib_posix.o \
c_code/8_1/msgs.o \
c_code/8_1/options.o \
c_code/8_1/lists.o \
c_code/8_1/stdlib_strtabs.o \
c_code/8_1/stdlib_hashes.o \
c_code/8_1/stdlib_osproc.o \
c_code/8_1/stdlib_streams.o \
c_code/8_1/stdlib_cpuinfo.o \
c_code/8_1/stdlib_sets.o \
c_code/8_1/stdlib_math.o \
c_code/8_1/stdlib_tables.o \
c_code/8_1/ropes.o \
c_code/8_1/platform.o \
c_code/8_1/crc.o \
c_code/8_1/stdlib_sockets.o \
c_code/8_1/stdlib_unsigned.o \
c_code/8_1/nversion.o \
c_code/8_1/condsyms.o \
c_code/8_1/idents.o \
c_code/8_1/extccomp.o \
c_code/8_1/wordrecg.o \
c_code/8_1/nimblecmd.o \
c_code/8_1/stdlib_parseopt.o \
c_code/8_1/lexer.o \
c_code/8_1/nimlexbase.o \
c_code/8_1/llstream.o \
c_code/8_1/nimconf.o \
c_code/8_1/main.o \
c_code/8_1/ast.o \
c_code/8_1/stdlib_intsets.o \
c_code/8_1/idgen.o \
c_code/8_1/astalgo.o \
c_code/8_1/rodutils.o \
c_code/8_1/syntaxes.o \
c_code/8_1/parser.o \
c_code/8_1/pbraces.o \
c_code/8_1/filters.o \
c_code/8_1/renderer.o \
c_code/8_1/filter_tmpl.o \
c_code/8_1/rodread.o \
c_code/8_1/types.o \
c_code/8_1/trees.o \
c_code/8_1/stdlib_memfiles.o \
c_code/8_1/rodwrite.o \
c_code/8_1/passes.o \
c_code/8_1/magicsys.o \
c_code/8_1/nimsets.o \
c_code/8_1/bitsets.o \
c_code/8_1/importer.o \
c_code/8_1/lookups.o \
c_code/8_1/semdata.o \
c_code/8_1/treetab.o \
c_code/8_1/vmdef.o \
c_code/8_1/prettybase.o \
c_code/8_1/stdlib_lexbase.o \
c_code/8_1/sem.o \
c_code/8_1/semfold.o \
c_code/8_1/saturate.o \
c_code/8_1/procfind.o \
c_code/8_1/pragmas.o \
c_code/8_1/semtypinst.o \
c_code/8_1/sigmatch.o \
c_code/8_1/parampatterns.o \
c_code/8_1/pretty.o \
c_code/8_1/docgen.o \
c_code/8_1/docutils_rstast.o \
c_code/8_1/stdlib_json.o \
c_code/8_1/stdlib_unicode.o \
c_code/8_1/docutils_rst.o \
c_code/8_1/docutils_rstgen.o \
c_code/8_1/docutils_highlite.o \
c_code/8_1/stdlib_sequtils.o \
c_code/8_1/stdlib_algorithm.o \
c_code/8_1/sempass2.o \
c_code/8_1/guards.o \
c_code/8_1/stdlib_xmltree.o \
c_code/8_1/stdlib_macros.o \
c_code/8_1/stdlib_cgi.o \
c_code/8_1/stdlib_cookies.o \
c_code/8_1/typesrenderer.o \
c_code/8_1/transf.o \
c_code/8_1/cgmeth.o \
c_code/8_1/lambdalifting.o \
c_code/8_1/lowerings.o \
c_code/8_1/vm.o \
c_code/8_1/vmgen.o \
c_code/8_1/vmdeps.o \
c_code/8_1/evaltempl.o \
c_code/8_1/aliases.o \
c_code/8_1/patterns.o \
c_code/8_1/semmacrosanity.o \
c_code/8_1/semparallel.o \
c_code/8_1/cgen.o \
c_code/8_1/ccgutils.o \
c_code/8_1/cgendata.o \
c_code/8_1/ccgmerge.o \
c_code/8_1/jsgen.o \
c_code/8_1/passaux.o \
c_code/8_1/depends.o \
c_code/8_1/docgen2.o \
c_code/8_1/service.o \
c_code/8_1/modules.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/nim.c -o c_code/8_2/nim.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/nim.c -o c_code/8_2/nim.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_system.c -o c_code/8_2/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_system.c -o c_code/8_2/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/testability.c -o c_code/8_2/testability.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/testability.c -o c_code/8_2/testability.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/commands.c -o c_code/8_2/commands.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/commands.c -o c_code/8_2/commands.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_os.c -o c_code/8_2/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_os.c -o c_code/8_2/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_strutils.c -o c_code/8_2/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_strutils.c -o c_code/8_2/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_parseutils.c -o c_code/8_2/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_parseutils.c -o c_code/8_2/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_times.c -o c_code/8_2/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_times.c -o c_code/8_2/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_posix.c -o c_code/8_2/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_posix.c -o c_code/8_2/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/msgs.c -o c_code/8_2/msgs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/msgs.c -o c_code/8_2/msgs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/options.c -o c_code/8_2/options.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/options.c -o c_code/8_2/options.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/lists.c -o c_code/8_2/lists.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/lists.c -o c_code/8_2/lists.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_strtabs.c -o c_code/8_2/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_strtabs.c -o c_code/8_2/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_hashes.c -o c_code/8_2/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_hashes.c -o c_code/8_2/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_osproc.c -o c_code/8_2/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_osproc.c -o c_code/8_2/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_streams.c -o c_code/8_2/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_streams.c -o c_code/8_2/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_cpuinfo.c -o c_code/8_2/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_cpuinfo.c -o c_code/8_2/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_sets.c -o c_code/8_2/stdlib_sets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_sets.c -o c_code/8_2/stdlib_sets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_math.c -o c_code/8_2/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_math.c -o c_code/8_2/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_tables.c -o c_code/8_2/stdlib_tables.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_tables.c -o c_code/8_2/stdlib_tables.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/ropes.c -o c_code/8_2/ropes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/ropes.c -o c_code/8_2/ropes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/platform.c -o c_code/8_2/platform.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/platform.c -o c_code/8_2/platform.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/crc.c -o c_code/8_2/crc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/crc.c -o c_code/8_2/crc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_sockets.c -o c_code/8_2/stdlib_sockets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_sockets.c -o c_code/8_2/stdlib_sockets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_unsigned.c -o c_code/8_2/stdlib_unsigned.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_unsigned.c -o c_code/8_2/stdlib_unsigned.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/nversion.c -o c_code/8_2/nversion.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/nversion.c -o c_code/8_2/nversion.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/condsyms.c -o c_code/8_2/condsyms.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/condsyms.c -o c_code/8_2/condsyms.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/idents.c -o c_code/8_2/idents.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/idents.c -o c_code/8_2/idents.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/extccomp.c -o c_code/8_2/extccomp.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/extccomp.c -o c_code/8_2/extccomp.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/wordrecg.c -o c_code/8_2/wordrecg.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/wordrecg.c -o c_code/8_2/wordrecg.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/nimblecmd.c -o c_code/8_2/nimblecmd.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/nimblecmd.c -o c_code/8_2/nimblecmd.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_parseopt.c -o c_code/8_2/stdlib_parseopt.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_parseopt.c -o c_code/8_2/stdlib_parseopt.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/lexer.c -o c_code/8_2/lexer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/lexer.c -o c_code/8_2/lexer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/nimlexbase.c -o c_code/8_2/nimlexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/nimlexbase.c -o c_code/8_2/nimlexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/llstream.c -o c_code/8_2/llstream.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/llstream.c -o c_code/8_2/llstream.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/nimconf.c -o c_code/8_2/nimconf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/nimconf.c -o c_code/8_2/nimconf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/main.c -o c_code/8_2/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/main.c -o c_code/8_2/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/ast.c -o c_code/8_2/ast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/ast.c -o c_code/8_2/ast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_intsets.c -o c_code/8_2/stdlib_intsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_intsets.c -o c_code/8_2/stdlib_intsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/idgen.c -o c_code/8_2/idgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/idgen.c -o c_code/8_2/idgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/astalgo.c -o c_code/8_2/astalgo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/astalgo.c -o c_code/8_2/astalgo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/rodutils.c -o c_code/8_2/rodutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/rodutils.c -o c_code/8_2/rodutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/syntaxes.c -o c_code/8_2/syntaxes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/syntaxes.c -o c_code/8_2/syntaxes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/parser.c -o c_code/8_2/parser.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/parser.c -o c_code/8_2/parser.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/pbraces.c -o c_code/8_2/pbraces.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/pbraces.c -o c_code/8_2/pbraces.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/filters.c -o c_code/8_2/filters.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/filters.c -o c_code/8_2/filters.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/renderer.c -o c_code/8_2/renderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/renderer.c -o c_code/8_2/renderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/filter_tmpl.c -o c_code/8_2/filter_tmpl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/filter_tmpl.c -o c_code/8_2/filter_tmpl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/rodread.c -o c_code/8_2/rodread.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/rodread.c -o c_code/8_2/rodread.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/types.c -o c_code/8_2/types.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/types.c -o c_code/8_2/types.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/trees.c -o c_code/8_2/trees.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/trees.c -o c_code/8_2/trees.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_memfiles.c -o c_code/8_2/stdlib_memfiles.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_memfiles.c -o c_code/8_2/stdlib_memfiles.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/rodwrite.c -o c_code/8_2/rodwrite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/rodwrite.c -o c_code/8_2/rodwrite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/passes.c -o c_code/8_2/passes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/passes.c -o c_code/8_2/passes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/magicsys.c -o c_code/8_2/magicsys.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/magicsys.c -o c_code/8_2/magicsys.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/nimsets.c -o c_code/8_2/nimsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/nimsets.c -o c_code/8_2/nimsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/bitsets.c -o c_code/8_2/bitsets.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/bitsets.c -o c_code/8_2/bitsets.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/importer.c -o c_code/8_2/importer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/importer.c -o c_code/8_2/importer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/lookups.c -o c_code/8_2/lookups.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/lookups.c -o c_code/8_2/lookups.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/semdata.c -o c_code/8_2/semdata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/semdata.c -o c_code/8_2/semdata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/treetab.c -o c_code/8_2/treetab.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/treetab.c -o c_code/8_2/treetab.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/vmdef.c -o c_code/8_2/vmdef.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/vmdef.c -o c_code/8_2/vmdef.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/prettybase.c -o c_code/8_2/prettybase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/prettybase.c -o c_code/8_2/prettybase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_lexbase.c -o c_code/8_2/stdlib_lexbase.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_lexbase.c -o c_code/8_2/stdlib_lexbase.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/sem.c -o c_code/8_2/sem.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/sem.c -o c_code/8_2/sem.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/semfold.c -o c_code/8_2/semfold.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/semfold.c -o c_code/8_2/semfold.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/saturate.c -o c_code/8_2/saturate.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/saturate.c -o c_code/8_2/saturate.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/procfind.c -o c_code/8_2/procfind.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/procfind.c -o c_code/8_2/procfind.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/pragmas.c -o c_code/8_2/pragmas.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/pragmas.c -o c_code/8_2/pragmas.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/semtypinst.c -o c_code/8_2/semtypinst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/semtypinst.c -o c_code/8_2/semtypinst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/sigmatch.c -o c_code/8_2/sigmatch.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/sigmatch.c -o c_code/8_2/sigmatch.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/parampatterns.c -o c_code/8_2/parampatterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/parampatterns.c -o c_code/8_2/parampatterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/pretty.c -o c_code/8_2/pretty.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/pretty.c -o c_code/8_2/pretty.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/docgen.c -o c_code/8_2/docgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/docgen.c -o c_code/8_2/docgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/docutils_rstast.c -o c_code/8_2/docutils_rstast.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/docutils_rstast.c -o c_code/8_2/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_json.c -o c_code/8_2/stdlib_json.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_json.c -o c_code/8_2/stdlib_json.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_unicode.c -o c_code/8_2/stdlib_unicode.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_unicode.c -o c_code/8_2/stdlib_unicode.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/docutils_rst.c -o c_code/8_2/docutils_rst.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/docutils_rst.c -o c_code/8_2/docutils_rst.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/docutils_rstgen.c -o c_code/8_2/docutils_rstgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/docutils_rstgen.c -o c_code/8_2/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/docutils_highlite.c -o c_code/8_2/docutils_highlite.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/docutils_highlite.c -o c_code/8_2/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_sequtils.c -o c_code/8_2/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_sequtils.c -o c_code/8_2/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_algorithm.c -o c_code/8_2/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_algorithm.c -o c_code/8_2/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/sempass2.c -o c_code/8_2/sempass2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/sempass2.c -o c_code/8_2/sempass2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/guards.c -o c_code/8_2/guards.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/guards.c -o c_code/8_2/guards.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_xmltree.c -o c_code/8_2/stdlib_xmltree.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_xmltree.c -o c_code/8_2/stdlib_xmltree.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_macros.c -o c_code/8_2/stdlib_macros.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_macros.c -o c_code/8_2/stdlib_macros.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_cgi.c -o c_code/8_2/stdlib_cgi.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_cgi.c -o c_code/8_2/stdlib_cgi.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_cookies.c -o c_code/8_2/stdlib_cookies.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_cookies.c -o c_code/8_2/stdlib_cookies.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/typesrenderer.c -o c_code/8_2/typesrenderer.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/typesrenderer.c -o c_code/8_2/typesrenderer.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/transf.c -o c_code/8_2/transf.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/transf.c -o c_code/8_2/transf.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/cgmeth.c -o c_code/8_2/cgmeth.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/cgmeth.c -o c_code/8_2/cgmeth.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/lambdalifting.c -o c_code/8_2/lambdalifting.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/lambdalifting.c -o c_code/8_2/lambdalifting.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/lowerings.c -o c_code/8_2/lowerings.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/lowerings.c -o c_code/8_2/lowerings.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/vm.c -o c_code/8_2/vm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/vm.c -o c_code/8_2/vm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/vmgen.c -o c_code/8_2/vmgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/vmgen.c -o c_code/8_2/vmgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/vmdeps.c -o c_code/8_2/vmdeps.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/vmdeps.c -o c_code/8_2/vmdeps.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/evaltempl.c -o c_code/8_2/evaltempl.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/evaltempl.c -o c_code/8_2/evaltempl.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/aliases.c -o c_code/8_2/aliases.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/aliases.c -o c_code/8_2/aliases.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/patterns.c -o c_code/8_2/patterns.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/patterns.c -o c_code/8_2/patterns.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/semmacrosanity.c -o c_code/8_2/semmacrosanity.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/semmacrosanity.c -o c_code/8_2/semmacrosanity.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/semparallel.c -o c_code/8_2/semparallel.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/semparallel.c -o c_code/8_2/semparallel.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/cgen.c -o c_code/8_2/cgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/cgen.c -o c_code/8_2/cgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/ccgutils.c -o c_code/8_2/ccgutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/ccgutils.c -o c_code/8_2/ccgutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/cgendata.c -o c_code/8_2/cgendata.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/cgendata.c -o c_code/8_2/cgendata.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/ccgmerge.c -o c_code/8_2/ccgmerge.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/ccgmerge.c -o c_code/8_2/ccgmerge.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/jsgen.c -o c_code/8_2/jsgen.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/jsgen.c -o c_code/8_2/jsgen.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/passaux.c -o c_code/8_2/passaux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/passaux.c -o c_code/8_2/passaux.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/depends.c -o c_code/8_2/depends.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/depends.c -o c_code/8_2/depends.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/docgen2.c -o c_code/8_2/docgen2.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/docgen2.c -o c_code/8_2/docgen2.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/service.c -o c_code/8_2/service.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/service.c -o c_code/8_2/service.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/modules.c -o c_code/8_2/modules.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/modules.c -o c_code/8_2/modules.o
    echo "$LINKER -o $binDir/nim  \
c_code/8_2/nim.o \
c_code/8_2/stdlib_system.o \
c_code/8_2/testability.o \
c_code/8_2/commands.o \
c_code/8_2/stdlib_os.o \
c_code/8_2/stdlib_strutils.o \
c_code/8_2/stdlib_parseutils.o \
c_code/8_2/stdlib_times.o \
c_code/8_2/stdlib_posix.o \
c_code/8_2/msgs.o \
c_code/8_2/options.o \
c_code/8_2/lists.o \
c_code/8_2/stdlib_strtabs.o \
c_code/8_2/stdlib_hashes.o \
c_code/8_2/stdlib_osproc.o \
c_code/8_2/stdlib_streams.o \
c_code/8_2/stdlib_cpuinfo.o \
c_code/8_2/stdlib_sets.o \
c_code/8_2/stdlib_math.o \
c_code/8_2/stdlib_tables.o \
c_code/8_2/ropes.o \
c_code/8_2/platform.o \
c_code/8_2/crc.o \
c_code/8_2/stdlib_sockets.o \
c_code/8_2/stdlib_unsigned.o \
c_code/8_2/nversion.o \
c_code/8_2/condsyms.o \
c_code/8_2/idents.o \
c_code/8_2/extccomp.o \
c_code/8_2/wordrecg.o \
c_code/8_2/nimblecmd.o \
c_code/8_2/stdlib_parseopt.o \
c_code/8_2/lexer.o \
c_code/8_2/nimlexbase.o \
c_code/8_2/llstream.o \
c_code/8_2/nimconf.o \
c_code/8_2/main.o \
c_code/8_2/ast.o \
c_code/8_2/stdlib_intsets.o \
c_code/8_2/idgen.o \
c_code/8_2/astalgo.o \
c_code/8_2/rodutils.o \
c_code/8_2/syntaxes.o \
c_code/8_2/parser.o \
c_code/8_2/pbraces.o \
c_code/8_2/filters.o \
c_code/8_2/renderer.o \
c_code/8_2/filter_tmpl.o \
c_code/8_2/rodread.o \
c_code/8_2/types.o \
c_code/8_2/trees.o \
c_code/8_2/stdlib_memfiles.o \
c_code/8_2/rodwrite.o \
c_code/8_2/passes.o \
c_code/8_2/magicsys.o \
c_code/8_2/nimsets.o \
c_code/8_2/bitsets.o \
c_code/8_2/importer.o \
c_code/8_2/lookups.o \
c_code/8_2/semdata.o \
c_code/8_2/treetab.o \
c_code/8_2/vmdef.o \
c_code/8_2/prettybase.o \
c_code/8_2/stdlib_lexbase.o \
c_code/8_2/sem.o \
c_code/8_2/semfold.o \
c_code/8_2/saturate.o \
c_code/8_2/procfind.o \
c_code/8_2/pragmas.o \
c_code/8_2/semtypinst.o \
c_code/8_2/sigmatch.o \
c_code/8_2/parampatterns.o \
c_code/8_2/pretty.o \
c_code/8_2/docgen.o \
c_code/8_2/docutils_rstast.o \
c_code/8_2/stdlib_json.o \
c_code/8_2/stdlib_unicode.o \
c_code/8_2/docutils_rst.o \
c_code/8_2/docutils_rstgen.o \
c_code/8_2/docutils_highlite.o \
c_code/8_2/stdlib_sequtils.o \
c_code/8_2/stdlib_algorithm.o \
c_code/8_2/sempass2.o \
c_code/8_2/guards.o \
c_code/8_2/stdlib_xmltree.o \
c_code/8_2/stdlib_macros.o \
c_code/8_2/stdlib_cgi.o \
c_code/8_2/stdlib_cookies.o \
c_code/8_2/typesrenderer.o \
c_code/8_2/transf.o \
c_code/8_2/cgmeth.o \
c_code/8_2/lambdalifting.o \
c_code/8_2/lowerings.o \
c_code/8_2/vm.o \
c_code/8_2/vmgen.o \
c_code/8_2/vmdeps.o \
c_code/8_2/evaltempl.o \
c_code/8_2/aliases.o \
c_code/8_2/patterns.o \
c_code/8_2/semmacrosanity.o \
c_code/8_2/semparallel.o \
c_code/8_2/cgen.o \
c_code/8_2/ccgutils.o \
c_code/8_2/cgendata.o \
c_code/8_2/ccgmerge.o \
c_code/8_2/jsgen.o \
c_code/8_2/passaux.o \
c_code/8_2/depends.o \
c_code/8_2/docgen2.o \
c_code/8_2/service.o \
c_code/8_2/modules.o $LINK_FLAGS"
    $LINKER -o $binDir/nim  \
c_code/8_2/nim.o \
c_code/8_2/stdlib_system.o \
c_code/8_2/testability.o \
c_code/8_2/commands.o \
c_code/8_2/stdlib_os.o \
c_code/8_2/stdlib_strutils.o \
c_code/8_2/stdlib_parseutils.o \
c_code/8_2/stdlib_times.o \
c_code/8_2/stdlib_posix.o \
c_code/8_2/msgs.o \
c_code/8_2/options.o \
c_code/8_2/lists.o \
c_code/8_2/stdlib_strtabs.o \
c_code/8_2/stdlib_hashes.o \
c_code/8_2/stdlib_osproc.o \
c_code/8_2/stdlib_streams.o \
c_code/8_2/stdlib_cpuinfo.o \
c_code/8_2/stdlib_sets.o \
c_code/8_2/stdlib_math.o \
c_code/8_2/stdlib_tables.o \
c_code/8_2/ropes.o \
c_code/8_2/platform.o \
c_code/8_2/crc.o \
c_code/8_2/stdlib_sockets.o \
c_code/8_2/stdlib_unsigned.o \
c_code/8_2/nversion.o \
c_code/8_2/condsyms.o \
c_code/8_2/idents.o \
c_code/8_2/extccomp.o \
c_code/8_2/wordrecg.o \
c_code/8_2/nimblecmd.o \
c_code/8_2/stdlib_parseopt.o \
c_code/8_2/lexer.o \
c_code/8_2/nimlexbase.o \
c_code/8_2/llstream.o \
c_code/8_2/nimconf.o \
c_code/8_2/main.o \
c_code/8_2/ast.o \
c_code/8_2/stdlib_intsets.o \
c_code/8_2/idgen.o \
c_code/8_2/astalgo.o \
c_code/8_2/rodutils.o \
c_code/8_2/syntaxes.o \
c_code/8_2/parser.o \
c_code/8_2/pbraces.o \
c_code/8_2/filters.o \
c_code/8_2/renderer.o \
c_code/8_2/filter_tmpl.o \
c_code/8_2/rodread.o \
c_code/8_2/types.o \
c_code/8_2/trees.o \
c_code/8_2/stdlib_memfiles.o \
c_code/8_2/rodwrite.o \
c_code/8_2/passes.o \
c_code/8_2/magicsys.o \
c_code/8_2/nimsets.o \
c_code/8_2/bitsets.o \
c_code/8_2/importer.o \
c_code/8_2/lookups.o \
c_code/8_2/semdata.o \
c_code/8_2/treetab.o \
c_code/8_2/vmdef.o \
c_code/8_2/prettybase.o \
c_code/8_2/stdlib_lexbase.o \
c_code/8_2/sem.o \
c_code/8_2/semfold.o \
c_code/8_2/saturate.o \
c_code/8_2/procfind.o \
c_code/8_2/pragmas.o \
c_code/8_2/semtypinst.o \
c_code/8_2/sigmatch.o \
c_code/8_2/parampatterns.o \
c_code/8_2/pretty.o \
c_code/8_2/docgen.o \
c_code/8_2/docutils_rstast.o \
c_code/8_2/stdlib_json.o \
c_code/8_2/stdlib_unicode.o \
c_code/8_2/docutils_rst.o \
c_code/8_2/docutils_rstgen.o \
c_code/8_2/docutils_highlite.o \
c_code/8_2/stdlib_sequtils.o \
c_code/8_2/stdlib_algorithm.o \
c_code/8_2/sempass2.o \
c_code/8_2/guards.o \
c_code/8_2/stdlib_xmltree.o \
c_code/8_2/stdlib_macros.o \
c_code/8_2/stdlib_cgi.o \
c_code/8_2/stdlib_cookies.o \
c_code/8_2/typesrenderer.o \
c_code/8_2/transf.o \
c_code/8_2/cgmeth.o \
c_code/8_2/lambdalifting.o \
c_code/8_2/lowerings.o \
c_code/8_2/vm.o \
c_code/8_2/vmgen.o \
c_code/8_2/vmdeps.o \
c_code/8_2/evaltempl.o \
c_code/8_2/aliases.o \
c_code/8_2/patterns.o \
c_code/8_2/semmacrosanity.o \
c_code/8_2/semparallel.o \
c_code/8_2/cgen.o \
c_code/8_2/ccgutils.o \
c_code/8_2/cgendata.o \
c_code/8_2/ccgmerge.o \
c_code/8_2/jsgen.o \
c_code/8_2/passaux.o \
c_code/8_2/depends.o \
c_code/8_2/docgen2.o \
c_code/8_2/service.o \
c_code/8_2/modules.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc)
    echo "$LINKER -o $binDir/nim  $LINK_FLAGS"
    $LINKER -o $binDir/nim  $LINK_FLAGS
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


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
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_nimrod.c -o nimcache/1_1/compiler_nimrod.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_nimrod.c -o nimcache/1_1/compiler_nimrod.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/Nimrod_system.c -o nimcache/1_1/Nimrod_system.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/Nimrod_system.c -o nimcache/1_1/Nimrod_system.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_testability.c -o nimcache/1_1/compiler_testability.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_testability.c -o nimcache/1_1/compiler_testability.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_commands.c -o nimcache/1_1/compiler_commands.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_commands.c -o nimcache/1_1/compiler_commands.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_os.c -o nimcache/1_1/pure_os.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_os.c -o nimcache/1_1/pure_os.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_strutils.c -o nimcache/1_1/pure_strutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_strutils.c -o nimcache/1_1/pure_strutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_parseutils.c -o nimcache/1_1/pure_parseutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_parseutils.c -o nimcache/1_1/pure_parseutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_times.c -o nimcache/1_1/pure_times.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_times.c -o nimcache/1_1/pure_times.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/windows_winlean.c -o nimcache/1_1/windows_winlean.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/windows_winlean.c -o nimcache/1_1/windows_winlean.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_msgs.c -o nimcache/1_1/compiler_msgs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_msgs.c -o nimcache/1_1/compiler_msgs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_options.c -o nimcache/1_1/compiler_options.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_options.c -o nimcache/1_1/compiler_options.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_lists.c -o nimcache/1_1/compiler_lists.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_lists.c -o nimcache/1_1/compiler_lists.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_strtabs.c -o nimcache/1_1/pure_strtabs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_strtabs.c -o nimcache/1_1/pure_strtabs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_hashes.c -o nimcache/1_1/pure_hashes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_hashes.c -o nimcache/1_1/pure_hashes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/collections_tables.c -o nimcache/1_1/collections_tables.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/collections_tables.c -o nimcache/1_1/collections_tables.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_math.c -o nimcache/1_1/pure_math.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_math.c -o nimcache/1_1/pure_math.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_ropes.c -o nimcache/1_1/compiler_ropes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_ropes.c -o nimcache/1_1/compiler_ropes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_platform.c -o nimcache/1_1/compiler_platform.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_platform.c -o nimcache/1_1/compiler_platform.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_crc.c -o nimcache/1_1/compiler_crc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_crc.c -o nimcache/1_1/compiler_crc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_sockets.c -o nimcache/1_1/pure_sockets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_sockets.c -o nimcache/1_1/pure_sockets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/core_unsigned.c -o nimcache/1_1/core_unsigned.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/core_unsigned.c -o nimcache/1_1/core_unsigned.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_nversion.c -o nimcache/1_1/compiler_nversion.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_nversion.c -o nimcache/1_1/compiler_nversion.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_condsyms.c -o nimcache/1_1/compiler_condsyms.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_condsyms.c -o nimcache/1_1/compiler_condsyms.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_idents.c -o nimcache/1_1/compiler_idents.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_idents.c -o nimcache/1_1/compiler_idents.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_extccomp.c -o nimcache/1_1/compiler_extccomp.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_extccomp.c -o nimcache/1_1/compiler_extccomp.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_osproc.c -o nimcache/1_1/pure_osproc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_osproc.c -o nimcache/1_1/pure_osproc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_streams.c -o nimcache/1_1/pure_streams.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_streams.c -o nimcache/1_1/pure_streams.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_wordrecg.c -o nimcache/1_1/compiler_wordrecg.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_wordrecg.c -o nimcache/1_1/compiler_wordrecg.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_babelcmd.c -o nimcache/1_1/compiler_babelcmd.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_babelcmd.c -o nimcache/1_1/compiler_babelcmd.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_lexer.c -o nimcache/1_1/compiler_lexer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_lexer.c -o nimcache/1_1/compiler_lexer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_nimlexbase.c -o nimcache/1_1/compiler_nimlexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_nimlexbase.c -o nimcache/1_1/compiler_nimlexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_llstream.c -o nimcache/1_1/compiler_llstream.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_llstream.c -o nimcache/1_1/compiler_llstream.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_nimconf.c -o nimcache/1_1/compiler_nimconf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_nimconf.c -o nimcache/1_1/compiler_nimconf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_main.c -o nimcache/1_1/compiler_main.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_main.c -o nimcache/1_1/compiler_main.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_ast.c -o nimcache/1_1/compiler_ast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_ast.c -o nimcache/1_1/compiler_ast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/collections_intsets.c -o nimcache/1_1/collections_intsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/collections_intsets.c -o nimcache/1_1/collections_intsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_idgen.c -o nimcache/1_1/compiler_idgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_idgen.c -o nimcache/1_1/compiler_idgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_astalgo.c -o nimcache/1_1/compiler_astalgo.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_astalgo.c -o nimcache/1_1/compiler_astalgo.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_rodutils.c -o nimcache/1_1/compiler_rodutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_rodutils.c -o nimcache/1_1/compiler_rodutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_syntaxes.c -o nimcache/1_1/compiler_syntaxes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_syntaxes.c -o nimcache/1_1/compiler_syntaxes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_parser.c -o nimcache/1_1/compiler_parser.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_parser.c -o nimcache/1_1/compiler_parser.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_pbraces.c -o nimcache/1_1/compiler_pbraces.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_pbraces.c -o nimcache/1_1/compiler_pbraces.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_filters.c -o nimcache/1_1/compiler_filters.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_filters.c -o nimcache/1_1/compiler_filters.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_renderer.c -o nimcache/1_1/compiler_renderer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_renderer.c -o nimcache/1_1/compiler_renderer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_filter_tmpl.c -o nimcache/1_1/compiler_filter_tmpl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_filter_tmpl.c -o nimcache/1_1/compiler_filter_tmpl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_rodread.c -o nimcache/1_1/compiler_rodread.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_rodread.c -o nimcache/1_1/compiler_rodread.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_types.c -o nimcache/1_1/compiler_types.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_types.c -o nimcache/1_1/compiler_types.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_trees.c -o nimcache/1_1/compiler_trees.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_trees.c -o nimcache/1_1/compiler_trees.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_memfiles.c -o nimcache/1_1/pure_memfiles.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_memfiles.c -o nimcache/1_1/pure_memfiles.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_rodwrite.c -o nimcache/1_1/compiler_rodwrite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_rodwrite.c -o nimcache/1_1/compiler_rodwrite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_passes.c -o nimcache/1_1/compiler_passes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_passes.c -o nimcache/1_1/compiler_passes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_magicsys.c -o nimcache/1_1/compiler_magicsys.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_magicsys.c -o nimcache/1_1/compiler_magicsys.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_nimsets.c -o nimcache/1_1/compiler_nimsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_nimsets.c -o nimcache/1_1/compiler_nimsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_bitsets.c -o nimcache/1_1/compiler_bitsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_bitsets.c -o nimcache/1_1/compiler_bitsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_semthreads.c -o nimcache/1_1/compiler_semthreads.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_semthreads.c -o nimcache/1_1/compiler_semthreads.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_importer.c -o nimcache/1_1/compiler_importer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_importer.c -o nimcache/1_1/compiler_importer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_lookups.c -o nimcache/1_1/compiler_lookups.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_lookups.c -o nimcache/1_1/compiler_lookups.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_semdata.c -o nimcache/1_1/compiler_semdata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_semdata.c -o nimcache/1_1/compiler_semdata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_treetab.c -o nimcache/1_1/compiler_treetab.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_treetab.c -o nimcache/1_1/compiler_treetab.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_evals.c -o nimcache/1_1/compiler_evals.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_evals.c -o nimcache/1_1/compiler_evals.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_semfold.c -o nimcache/1_1/compiler_semfold.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_semfold.c -o nimcache/1_1/compiler_semfold.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_saturate.c -o nimcache/1_1/compiler_saturate.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_saturate.c -o nimcache/1_1/compiler_saturate.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_transf.c -o nimcache/1_1/compiler_transf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_transf.c -o nimcache/1_1/compiler_transf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_cgmeth.c -o nimcache/1_1/compiler_cgmeth.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_cgmeth.c -o nimcache/1_1/compiler_cgmeth.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_sempass2.c -o nimcache/1_1/compiler_sempass2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_sempass2.c -o nimcache/1_1/compiler_sempass2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_guards.c -o nimcache/1_1/compiler_guards.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_guards.c -o nimcache/1_1/compiler_guards.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_lambdalifting.c -o nimcache/1_1/compiler_lambdalifting.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_lambdalifting.c -o nimcache/1_1/compiler_lambdalifting.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_evaltempl.c -o nimcache/1_1/compiler_evaltempl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_evaltempl.c -o nimcache/1_1/compiler_evaltempl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_sem.c -o nimcache/1_1/compiler_sem.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_sem.c -o nimcache/1_1/compiler_sem.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_procfind.c -o nimcache/1_1/compiler_procfind.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_procfind.c -o nimcache/1_1/compiler_procfind.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_pragmas.c -o nimcache/1_1/compiler_pragmas.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_pragmas.c -o nimcache/1_1/compiler_pragmas.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_semtypinst.c -o nimcache/1_1/compiler_semtypinst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_semtypinst.c -o nimcache/1_1/compiler_semtypinst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_sigmatch.c -o nimcache/1_1/compiler_sigmatch.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_sigmatch.c -o nimcache/1_1/compiler_sigmatch.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_parampatterns.c -o nimcache/1_1/compiler_parampatterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_parampatterns.c -o nimcache/1_1/compiler_parampatterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_docgen.c -o nimcache/1_1/compiler_docgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_docgen.c -o nimcache/1_1/compiler_docgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/docutils_rstast.c -o nimcache/1_1/docutils_rstast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/docutils_rstast.c -o nimcache/1_1/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/docutils_rst.c -o nimcache/1_1/docutils_rst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/docutils_rst.c -o nimcache/1_1/docutils_rst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/docutils_rstgen.c -o nimcache/1_1/docutils_rstgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/docutils_rstgen.c -o nimcache/1_1/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/docutils_highlite.c -o nimcache/1_1/docutils_highlite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/docutils_highlite.c -o nimcache/1_1/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_json.c -o nimcache/1_1/pure_json.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_json.c -o nimcache/1_1/pure_json.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_lexbase.c -o nimcache/1_1/pure_lexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_lexbase.c -o nimcache/1_1/pure_lexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_unicode.c -o nimcache/1_1/pure_unicode.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_unicode.c -o nimcache/1_1/pure_unicode.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_algorithm.c -o nimcache/1_1/pure_algorithm.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_algorithm.c -o nimcache/1_1/pure_algorithm.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/collections_sequtils.c -o nimcache/1_1/collections_sequtils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/collections_sequtils.c -o nimcache/1_1/collections_sequtils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_aliases.c -o nimcache/1_1/compiler_aliases.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_aliases.c -o nimcache/1_1/compiler_aliases.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_patterns.c -o nimcache/1_1/compiler_patterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_patterns.c -o nimcache/1_1/compiler_patterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_cgen.c -o nimcache/1_1/compiler_cgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_cgen.c -o nimcache/1_1/compiler_cgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_ccgutils.c -o nimcache/1_1/compiler_ccgutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_ccgutils.c -o nimcache/1_1/compiler_ccgutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_cgendata.c -o nimcache/1_1/compiler_cgendata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_cgendata.c -o nimcache/1_1/compiler_cgendata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_ccgmerge.c -o nimcache/1_1/compiler_ccgmerge.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_ccgmerge.c -o nimcache/1_1/compiler_ccgmerge.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_jsgen.c -o nimcache/1_1/compiler_jsgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_jsgen.c -o nimcache/1_1/compiler_jsgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_passaux.c -o nimcache/1_1/compiler_passaux.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_passaux.c -o nimcache/1_1/compiler_passaux.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_depends.c -o nimcache/1_1/compiler_depends.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_depends.c -o nimcache/1_1/compiler_depends.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_docgen2.c -o nimcache/1_1/compiler_docgen2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_docgen2.c -o nimcache/1_1/compiler_docgen2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_service.c -o nimcache/1_1/compiler_service.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_service.c -o nimcache/1_1/compiler_service.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_parseopt.c -o nimcache/1_1/pure_parseopt.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/pure_parseopt.c -o nimcache/1_1/pure_parseopt.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_modules.c -o nimcache/1_1/compiler_modules.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_modules.c -o nimcache/1_1/compiler_modules.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_pretty.c -o nimcache/1_1/compiler_pretty.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_1/compiler_pretty.c -o nimcache/1_1/compiler_pretty.o
    echo "$LINKER -o $binDir/nimrod  \
nimcache/1_1/compiler_nimrod.o \
nimcache/1_1/Nimrod_system.o \
nimcache/1_1/compiler_testability.o \
nimcache/1_1/compiler_commands.o \
nimcache/1_1/pure_os.o \
nimcache/1_1/pure_strutils.o \
nimcache/1_1/pure_parseutils.o \
nimcache/1_1/pure_times.o \
nimcache/1_1/windows_winlean.o \
nimcache/1_1/compiler_msgs.o \
nimcache/1_1/compiler_options.o \
nimcache/1_1/compiler_lists.o \
nimcache/1_1/pure_strtabs.o \
nimcache/1_1/pure_hashes.o \
nimcache/1_1/collections_tables.o \
nimcache/1_1/pure_math.o \
nimcache/1_1/compiler_ropes.o \
nimcache/1_1/compiler_platform.o \
nimcache/1_1/compiler_crc.o \
nimcache/1_1/pure_sockets.o \
nimcache/1_1/core_unsigned.o \
nimcache/1_1/compiler_nversion.o \
nimcache/1_1/compiler_condsyms.o \
nimcache/1_1/compiler_idents.o \
nimcache/1_1/compiler_extccomp.o \
nimcache/1_1/pure_osproc.o \
nimcache/1_1/pure_streams.o \
nimcache/1_1/compiler_wordrecg.o \
nimcache/1_1/compiler_babelcmd.o \
nimcache/1_1/compiler_lexer.o \
nimcache/1_1/compiler_nimlexbase.o \
nimcache/1_1/compiler_llstream.o \
nimcache/1_1/compiler_nimconf.o \
nimcache/1_1/compiler_main.o \
nimcache/1_1/compiler_ast.o \
nimcache/1_1/collections_intsets.o \
nimcache/1_1/compiler_idgen.o \
nimcache/1_1/compiler_astalgo.o \
nimcache/1_1/compiler_rodutils.o \
nimcache/1_1/compiler_syntaxes.o \
nimcache/1_1/compiler_parser.o \
nimcache/1_1/compiler_pbraces.o \
nimcache/1_1/compiler_filters.o \
nimcache/1_1/compiler_renderer.o \
nimcache/1_1/compiler_filter_tmpl.o \
nimcache/1_1/compiler_rodread.o \
nimcache/1_1/compiler_types.o \
nimcache/1_1/compiler_trees.o \
nimcache/1_1/pure_memfiles.o \
nimcache/1_1/compiler_rodwrite.o \
nimcache/1_1/compiler_passes.o \
nimcache/1_1/compiler_magicsys.o \
nimcache/1_1/compiler_nimsets.o \
nimcache/1_1/compiler_bitsets.o \
nimcache/1_1/compiler_semthreads.o \
nimcache/1_1/compiler_importer.o \
nimcache/1_1/compiler_lookups.o \
nimcache/1_1/compiler_semdata.o \
nimcache/1_1/compiler_treetab.o \
nimcache/1_1/compiler_evals.o \
nimcache/1_1/compiler_semfold.o \
nimcache/1_1/compiler_saturate.o \
nimcache/1_1/compiler_transf.o \
nimcache/1_1/compiler_cgmeth.o \
nimcache/1_1/compiler_sempass2.o \
nimcache/1_1/compiler_guards.o \
nimcache/1_1/compiler_lambdalifting.o \
nimcache/1_1/compiler_evaltempl.o \
nimcache/1_1/compiler_sem.o \
nimcache/1_1/compiler_procfind.o \
nimcache/1_1/compiler_pragmas.o \
nimcache/1_1/compiler_semtypinst.o \
nimcache/1_1/compiler_sigmatch.o \
nimcache/1_1/compiler_parampatterns.o \
nimcache/1_1/compiler_docgen.o \
nimcache/1_1/docutils_rstast.o \
nimcache/1_1/docutils_rst.o \
nimcache/1_1/docutils_rstgen.o \
nimcache/1_1/docutils_highlite.o \
nimcache/1_1/pure_json.o \
nimcache/1_1/pure_lexbase.o \
nimcache/1_1/pure_unicode.o \
nimcache/1_1/pure_algorithm.o \
nimcache/1_1/collections_sequtils.o \
nimcache/1_1/compiler_aliases.o \
nimcache/1_1/compiler_patterns.o \
nimcache/1_1/compiler_cgen.o \
nimcache/1_1/compiler_ccgutils.o \
nimcache/1_1/compiler_cgendata.o \
nimcache/1_1/compiler_ccgmerge.o \
nimcache/1_1/compiler_jsgen.o \
nimcache/1_1/compiler_passaux.o \
nimcache/1_1/compiler_depends.o \
nimcache/1_1/compiler_docgen2.o \
nimcache/1_1/compiler_service.o \
nimcache/1_1/pure_parseopt.o \
nimcache/1_1/compiler_modules.o \
nimcache/1_1/compiler_pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
nimcache/1_1/compiler_nimrod.o \
nimcache/1_1/Nimrod_system.o \
nimcache/1_1/compiler_testability.o \
nimcache/1_1/compiler_commands.o \
nimcache/1_1/pure_os.o \
nimcache/1_1/pure_strutils.o \
nimcache/1_1/pure_parseutils.o \
nimcache/1_1/pure_times.o \
nimcache/1_1/windows_winlean.o \
nimcache/1_1/compiler_msgs.o \
nimcache/1_1/compiler_options.o \
nimcache/1_1/compiler_lists.o \
nimcache/1_1/pure_strtabs.o \
nimcache/1_1/pure_hashes.o \
nimcache/1_1/collections_tables.o \
nimcache/1_1/pure_math.o \
nimcache/1_1/compiler_ropes.o \
nimcache/1_1/compiler_platform.o \
nimcache/1_1/compiler_crc.o \
nimcache/1_1/pure_sockets.o \
nimcache/1_1/core_unsigned.o \
nimcache/1_1/compiler_nversion.o \
nimcache/1_1/compiler_condsyms.o \
nimcache/1_1/compiler_idents.o \
nimcache/1_1/compiler_extccomp.o \
nimcache/1_1/pure_osproc.o \
nimcache/1_1/pure_streams.o \
nimcache/1_1/compiler_wordrecg.o \
nimcache/1_1/compiler_babelcmd.o \
nimcache/1_1/compiler_lexer.o \
nimcache/1_1/compiler_nimlexbase.o \
nimcache/1_1/compiler_llstream.o \
nimcache/1_1/compiler_nimconf.o \
nimcache/1_1/compiler_main.o \
nimcache/1_1/compiler_ast.o \
nimcache/1_1/collections_intsets.o \
nimcache/1_1/compiler_idgen.o \
nimcache/1_1/compiler_astalgo.o \
nimcache/1_1/compiler_rodutils.o \
nimcache/1_1/compiler_syntaxes.o \
nimcache/1_1/compiler_parser.o \
nimcache/1_1/compiler_pbraces.o \
nimcache/1_1/compiler_filters.o \
nimcache/1_1/compiler_renderer.o \
nimcache/1_1/compiler_filter_tmpl.o \
nimcache/1_1/compiler_rodread.o \
nimcache/1_1/compiler_types.o \
nimcache/1_1/compiler_trees.o \
nimcache/1_1/pure_memfiles.o \
nimcache/1_1/compiler_rodwrite.o \
nimcache/1_1/compiler_passes.o \
nimcache/1_1/compiler_magicsys.o \
nimcache/1_1/compiler_nimsets.o \
nimcache/1_1/compiler_bitsets.o \
nimcache/1_1/compiler_semthreads.o \
nimcache/1_1/compiler_importer.o \
nimcache/1_1/compiler_lookups.o \
nimcache/1_1/compiler_semdata.o \
nimcache/1_1/compiler_treetab.o \
nimcache/1_1/compiler_evals.o \
nimcache/1_1/compiler_semfold.o \
nimcache/1_1/compiler_saturate.o \
nimcache/1_1/compiler_transf.o \
nimcache/1_1/compiler_cgmeth.o \
nimcache/1_1/compiler_sempass2.o \
nimcache/1_1/compiler_guards.o \
nimcache/1_1/compiler_lambdalifting.o \
nimcache/1_1/compiler_evaltempl.o \
nimcache/1_1/compiler_sem.o \
nimcache/1_1/compiler_procfind.o \
nimcache/1_1/compiler_pragmas.o \
nimcache/1_1/compiler_semtypinst.o \
nimcache/1_1/compiler_sigmatch.o \
nimcache/1_1/compiler_parampatterns.o \
nimcache/1_1/compiler_docgen.o \
nimcache/1_1/docutils_rstast.o \
nimcache/1_1/docutils_rst.o \
nimcache/1_1/docutils_rstgen.o \
nimcache/1_1/docutils_highlite.o \
nimcache/1_1/pure_json.o \
nimcache/1_1/pure_lexbase.o \
nimcache/1_1/pure_unicode.o \
nimcache/1_1/pure_algorithm.o \
nimcache/1_1/collections_sequtils.o \
nimcache/1_1/compiler_aliases.o \
nimcache/1_1/compiler_patterns.o \
nimcache/1_1/compiler_cgen.o \
nimcache/1_1/compiler_ccgutils.o \
nimcache/1_1/compiler_cgendata.o \
nimcache/1_1/compiler_ccgmerge.o \
nimcache/1_1/compiler_jsgen.o \
nimcache/1_1/compiler_passaux.o \
nimcache/1_1/compiler_depends.o \
nimcache/1_1/compiler_docgen2.o \
nimcache/1_1/compiler_service.o \
nimcache/1_1/pure_parseopt.o \
nimcache/1_1/compiler_modules.o \
nimcache/1_1/compiler_pretty.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_nimrod.c -o nimcache/1_2/compiler_nimrod.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_nimrod.c -o nimcache/1_2/compiler_nimrod.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/Nimrod_system.c -o nimcache/1_2/Nimrod_system.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/Nimrod_system.c -o nimcache/1_2/Nimrod_system.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_testability.c -o nimcache/1_2/compiler_testability.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_testability.c -o nimcache/1_2/compiler_testability.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_commands.c -o nimcache/1_2/compiler_commands.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_commands.c -o nimcache/1_2/compiler_commands.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_os.c -o nimcache/1_2/pure_os.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_os.c -o nimcache/1_2/pure_os.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_strutils.c -o nimcache/1_2/pure_strutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_strutils.c -o nimcache/1_2/pure_strutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_parseutils.c -o nimcache/1_2/pure_parseutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_parseutils.c -o nimcache/1_2/pure_parseutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_times.c -o nimcache/1_2/pure_times.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_times.c -o nimcache/1_2/pure_times.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/windows_winlean.c -o nimcache/1_2/windows_winlean.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/windows_winlean.c -o nimcache/1_2/windows_winlean.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_msgs.c -o nimcache/1_2/compiler_msgs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_msgs.c -o nimcache/1_2/compiler_msgs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_options.c -o nimcache/1_2/compiler_options.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_options.c -o nimcache/1_2/compiler_options.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_lists.c -o nimcache/1_2/compiler_lists.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_lists.c -o nimcache/1_2/compiler_lists.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_strtabs.c -o nimcache/1_2/pure_strtabs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_strtabs.c -o nimcache/1_2/pure_strtabs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_hashes.c -o nimcache/1_2/pure_hashes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_hashes.c -o nimcache/1_2/pure_hashes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/collections_tables.c -o nimcache/1_2/collections_tables.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/collections_tables.c -o nimcache/1_2/collections_tables.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_math.c -o nimcache/1_2/pure_math.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_math.c -o nimcache/1_2/pure_math.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_ropes.c -o nimcache/1_2/compiler_ropes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_ropes.c -o nimcache/1_2/compiler_ropes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_platform.c -o nimcache/1_2/compiler_platform.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_platform.c -o nimcache/1_2/compiler_platform.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_crc.c -o nimcache/1_2/compiler_crc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_crc.c -o nimcache/1_2/compiler_crc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_sockets.c -o nimcache/1_2/pure_sockets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_sockets.c -o nimcache/1_2/pure_sockets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/core_unsigned.c -o nimcache/1_2/core_unsigned.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/core_unsigned.c -o nimcache/1_2/core_unsigned.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_nversion.c -o nimcache/1_2/compiler_nversion.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_nversion.c -o nimcache/1_2/compiler_nversion.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_condsyms.c -o nimcache/1_2/compiler_condsyms.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_condsyms.c -o nimcache/1_2/compiler_condsyms.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_idents.c -o nimcache/1_2/compiler_idents.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_idents.c -o nimcache/1_2/compiler_idents.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_extccomp.c -o nimcache/1_2/compiler_extccomp.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_extccomp.c -o nimcache/1_2/compiler_extccomp.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_osproc.c -o nimcache/1_2/pure_osproc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_osproc.c -o nimcache/1_2/pure_osproc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_streams.c -o nimcache/1_2/pure_streams.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_streams.c -o nimcache/1_2/pure_streams.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_wordrecg.c -o nimcache/1_2/compiler_wordrecg.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_wordrecg.c -o nimcache/1_2/compiler_wordrecg.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_babelcmd.c -o nimcache/1_2/compiler_babelcmd.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_babelcmd.c -o nimcache/1_2/compiler_babelcmd.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_lexer.c -o nimcache/1_2/compiler_lexer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_lexer.c -o nimcache/1_2/compiler_lexer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_nimlexbase.c -o nimcache/1_2/compiler_nimlexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_nimlexbase.c -o nimcache/1_2/compiler_nimlexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_llstream.c -o nimcache/1_2/compiler_llstream.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_llstream.c -o nimcache/1_2/compiler_llstream.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_nimconf.c -o nimcache/1_2/compiler_nimconf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_nimconf.c -o nimcache/1_2/compiler_nimconf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_main.c -o nimcache/1_2/compiler_main.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_main.c -o nimcache/1_2/compiler_main.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_ast.c -o nimcache/1_2/compiler_ast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_ast.c -o nimcache/1_2/compiler_ast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/collections_intsets.c -o nimcache/1_2/collections_intsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/collections_intsets.c -o nimcache/1_2/collections_intsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_idgen.c -o nimcache/1_2/compiler_idgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_idgen.c -o nimcache/1_2/compiler_idgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_astalgo.c -o nimcache/1_2/compiler_astalgo.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_astalgo.c -o nimcache/1_2/compiler_astalgo.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_rodutils.c -o nimcache/1_2/compiler_rodutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_rodutils.c -o nimcache/1_2/compiler_rodutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_syntaxes.c -o nimcache/1_2/compiler_syntaxes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_syntaxes.c -o nimcache/1_2/compiler_syntaxes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_parser.c -o nimcache/1_2/compiler_parser.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_parser.c -o nimcache/1_2/compiler_parser.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_pbraces.c -o nimcache/1_2/compiler_pbraces.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_pbraces.c -o nimcache/1_2/compiler_pbraces.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_filters.c -o nimcache/1_2/compiler_filters.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_filters.c -o nimcache/1_2/compiler_filters.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_renderer.c -o nimcache/1_2/compiler_renderer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_renderer.c -o nimcache/1_2/compiler_renderer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_filter_tmpl.c -o nimcache/1_2/compiler_filter_tmpl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_filter_tmpl.c -o nimcache/1_2/compiler_filter_tmpl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_rodread.c -o nimcache/1_2/compiler_rodread.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_rodread.c -o nimcache/1_2/compiler_rodread.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_types.c -o nimcache/1_2/compiler_types.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_types.c -o nimcache/1_2/compiler_types.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_trees.c -o nimcache/1_2/compiler_trees.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_trees.c -o nimcache/1_2/compiler_trees.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_memfiles.c -o nimcache/1_2/pure_memfiles.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_memfiles.c -o nimcache/1_2/pure_memfiles.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_rodwrite.c -o nimcache/1_2/compiler_rodwrite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_rodwrite.c -o nimcache/1_2/compiler_rodwrite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_passes.c -o nimcache/1_2/compiler_passes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_passes.c -o nimcache/1_2/compiler_passes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_magicsys.c -o nimcache/1_2/compiler_magicsys.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_magicsys.c -o nimcache/1_2/compiler_magicsys.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_nimsets.c -o nimcache/1_2/compiler_nimsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_nimsets.c -o nimcache/1_2/compiler_nimsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_bitsets.c -o nimcache/1_2/compiler_bitsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_bitsets.c -o nimcache/1_2/compiler_bitsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_semthreads.c -o nimcache/1_2/compiler_semthreads.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_semthreads.c -o nimcache/1_2/compiler_semthreads.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_importer.c -o nimcache/1_2/compiler_importer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_importer.c -o nimcache/1_2/compiler_importer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_lookups.c -o nimcache/1_2/compiler_lookups.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_lookups.c -o nimcache/1_2/compiler_lookups.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_semdata.c -o nimcache/1_2/compiler_semdata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_semdata.c -o nimcache/1_2/compiler_semdata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_treetab.c -o nimcache/1_2/compiler_treetab.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_treetab.c -o nimcache/1_2/compiler_treetab.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_evals.c -o nimcache/1_2/compiler_evals.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_evals.c -o nimcache/1_2/compiler_evals.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_semfold.c -o nimcache/1_2/compiler_semfold.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_semfold.c -o nimcache/1_2/compiler_semfold.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_saturate.c -o nimcache/1_2/compiler_saturate.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_saturate.c -o nimcache/1_2/compiler_saturate.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_transf.c -o nimcache/1_2/compiler_transf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_transf.c -o nimcache/1_2/compiler_transf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_cgmeth.c -o nimcache/1_2/compiler_cgmeth.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_cgmeth.c -o nimcache/1_2/compiler_cgmeth.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_sempass2.c -o nimcache/1_2/compiler_sempass2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_sempass2.c -o nimcache/1_2/compiler_sempass2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_guards.c -o nimcache/1_2/compiler_guards.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_guards.c -o nimcache/1_2/compiler_guards.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_lambdalifting.c -o nimcache/1_2/compiler_lambdalifting.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_lambdalifting.c -o nimcache/1_2/compiler_lambdalifting.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_evaltempl.c -o nimcache/1_2/compiler_evaltempl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_evaltempl.c -o nimcache/1_2/compiler_evaltempl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_sem.c -o nimcache/1_2/compiler_sem.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_sem.c -o nimcache/1_2/compiler_sem.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_procfind.c -o nimcache/1_2/compiler_procfind.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_procfind.c -o nimcache/1_2/compiler_procfind.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_pragmas.c -o nimcache/1_2/compiler_pragmas.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_pragmas.c -o nimcache/1_2/compiler_pragmas.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_semtypinst.c -o nimcache/1_2/compiler_semtypinst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_semtypinst.c -o nimcache/1_2/compiler_semtypinst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_sigmatch.c -o nimcache/1_2/compiler_sigmatch.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_sigmatch.c -o nimcache/1_2/compiler_sigmatch.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_parampatterns.c -o nimcache/1_2/compiler_parampatterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_parampatterns.c -o nimcache/1_2/compiler_parampatterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_docgen.c -o nimcache/1_2/compiler_docgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_docgen.c -o nimcache/1_2/compiler_docgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/docutils_rstast.c -o nimcache/1_2/docutils_rstast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/docutils_rstast.c -o nimcache/1_2/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/docutils_rst.c -o nimcache/1_2/docutils_rst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/docutils_rst.c -o nimcache/1_2/docutils_rst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/docutils_rstgen.c -o nimcache/1_2/docutils_rstgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/docutils_rstgen.c -o nimcache/1_2/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/docutils_highlite.c -o nimcache/1_2/docutils_highlite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/docutils_highlite.c -o nimcache/1_2/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_json.c -o nimcache/1_2/pure_json.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_json.c -o nimcache/1_2/pure_json.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_lexbase.c -o nimcache/1_2/pure_lexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_lexbase.c -o nimcache/1_2/pure_lexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_unicode.c -o nimcache/1_2/pure_unicode.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_unicode.c -o nimcache/1_2/pure_unicode.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_algorithm.c -o nimcache/1_2/pure_algorithm.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_algorithm.c -o nimcache/1_2/pure_algorithm.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/collections_sequtils.c -o nimcache/1_2/collections_sequtils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/collections_sequtils.c -o nimcache/1_2/collections_sequtils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_aliases.c -o nimcache/1_2/compiler_aliases.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_aliases.c -o nimcache/1_2/compiler_aliases.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_patterns.c -o nimcache/1_2/compiler_patterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_patterns.c -o nimcache/1_2/compiler_patterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_cgen.c -o nimcache/1_2/compiler_cgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_cgen.c -o nimcache/1_2/compiler_cgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_ccgutils.c -o nimcache/1_2/compiler_ccgutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_ccgutils.c -o nimcache/1_2/compiler_ccgutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_cgendata.c -o nimcache/1_2/compiler_cgendata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_cgendata.c -o nimcache/1_2/compiler_cgendata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_ccgmerge.c -o nimcache/1_2/compiler_ccgmerge.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_ccgmerge.c -o nimcache/1_2/compiler_ccgmerge.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_jsgen.c -o nimcache/1_2/compiler_jsgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_jsgen.c -o nimcache/1_2/compiler_jsgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_passaux.c -o nimcache/1_2/compiler_passaux.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_passaux.c -o nimcache/1_2/compiler_passaux.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_depends.c -o nimcache/1_2/compiler_depends.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_depends.c -o nimcache/1_2/compiler_depends.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_docgen2.c -o nimcache/1_2/compiler_docgen2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_docgen2.c -o nimcache/1_2/compiler_docgen2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_service.c -o nimcache/1_2/compiler_service.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_service.c -o nimcache/1_2/compiler_service.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_parseopt.c -o nimcache/1_2/pure_parseopt.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/pure_parseopt.c -o nimcache/1_2/pure_parseopt.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_modules.c -o nimcache/1_2/compiler_modules.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_modules.c -o nimcache/1_2/compiler_modules.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_pretty.c -o nimcache/1_2/compiler_pretty.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/1_2/compiler_pretty.c -o nimcache/1_2/compiler_pretty.o
    echo "$LINKER -o $binDir/nimrod  \
nimcache/1_2/compiler_nimrod.o \
nimcache/1_2/Nimrod_system.o \
nimcache/1_2/compiler_testability.o \
nimcache/1_2/compiler_commands.o \
nimcache/1_2/pure_os.o \
nimcache/1_2/pure_strutils.o \
nimcache/1_2/pure_parseutils.o \
nimcache/1_2/pure_times.o \
nimcache/1_2/windows_winlean.o \
nimcache/1_2/compiler_msgs.o \
nimcache/1_2/compiler_options.o \
nimcache/1_2/compiler_lists.o \
nimcache/1_2/pure_strtabs.o \
nimcache/1_2/pure_hashes.o \
nimcache/1_2/collections_tables.o \
nimcache/1_2/pure_math.o \
nimcache/1_2/compiler_ropes.o \
nimcache/1_2/compiler_platform.o \
nimcache/1_2/compiler_crc.o \
nimcache/1_2/pure_sockets.o \
nimcache/1_2/core_unsigned.o \
nimcache/1_2/compiler_nversion.o \
nimcache/1_2/compiler_condsyms.o \
nimcache/1_2/compiler_idents.o \
nimcache/1_2/compiler_extccomp.o \
nimcache/1_2/pure_osproc.o \
nimcache/1_2/pure_streams.o \
nimcache/1_2/compiler_wordrecg.o \
nimcache/1_2/compiler_babelcmd.o \
nimcache/1_2/compiler_lexer.o \
nimcache/1_2/compiler_nimlexbase.o \
nimcache/1_2/compiler_llstream.o \
nimcache/1_2/compiler_nimconf.o \
nimcache/1_2/compiler_main.o \
nimcache/1_2/compiler_ast.o \
nimcache/1_2/collections_intsets.o \
nimcache/1_2/compiler_idgen.o \
nimcache/1_2/compiler_astalgo.o \
nimcache/1_2/compiler_rodutils.o \
nimcache/1_2/compiler_syntaxes.o \
nimcache/1_2/compiler_parser.o \
nimcache/1_2/compiler_pbraces.o \
nimcache/1_2/compiler_filters.o \
nimcache/1_2/compiler_renderer.o \
nimcache/1_2/compiler_filter_tmpl.o \
nimcache/1_2/compiler_rodread.o \
nimcache/1_2/compiler_types.o \
nimcache/1_2/compiler_trees.o \
nimcache/1_2/pure_memfiles.o \
nimcache/1_2/compiler_rodwrite.o \
nimcache/1_2/compiler_passes.o \
nimcache/1_2/compiler_magicsys.o \
nimcache/1_2/compiler_nimsets.o \
nimcache/1_2/compiler_bitsets.o \
nimcache/1_2/compiler_semthreads.o \
nimcache/1_2/compiler_importer.o \
nimcache/1_2/compiler_lookups.o \
nimcache/1_2/compiler_semdata.o \
nimcache/1_2/compiler_treetab.o \
nimcache/1_2/compiler_evals.o \
nimcache/1_2/compiler_semfold.o \
nimcache/1_2/compiler_saturate.o \
nimcache/1_2/compiler_transf.o \
nimcache/1_2/compiler_cgmeth.o \
nimcache/1_2/compiler_sempass2.o \
nimcache/1_2/compiler_guards.o \
nimcache/1_2/compiler_lambdalifting.o \
nimcache/1_2/compiler_evaltempl.o \
nimcache/1_2/compiler_sem.o \
nimcache/1_2/compiler_procfind.o \
nimcache/1_2/compiler_pragmas.o \
nimcache/1_2/compiler_semtypinst.o \
nimcache/1_2/compiler_sigmatch.o \
nimcache/1_2/compiler_parampatterns.o \
nimcache/1_2/compiler_docgen.o \
nimcache/1_2/docutils_rstast.o \
nimcache/1_2/docutils_rst.o \
nimcache/1_2/docutils_rstgen.o \
nimcache/1_2/docutils_highlite.o \
nimcache/1_2/pure_json.o \
nimcache/1_2/pure_lexbase.o \
nimcache/1_2/pure_unicode.o \
nimcache/1_2/pure_algorithm.o \
nimcache/1_2/collections_sequtils.o \
nimcache/1_2/compiler_aliases.o \
nimcache/1_2/compiler_patterns.o \
nimcache/1_2/compiler_cgen.o \
nimcache/1_2/compiler_ccgutils.o \
nimcache/1_2/compiler_cgendata.o \
nimcache/1_2/compiler_ccgmerge.o \
nimcache/1_2/compiler_jsgen.o \
nimcache/1_2/compiler_passaux.o \
nimcache/1_2/compiler_depends.o \
nimcache/1_2/compiler_docgen2.o \
nimcache/1_2/compiler_service.o \
nimcache/1_2/pure_parseopt.o \
nimcache/1_2/compiler_modules.o \
nimcache/1_2/compiler_pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
nimcache/1_2/compiler_nimrod.o \
nimcache/1_2/Nimrod_system.o \
nimcache/1_2/compiler_testability.o \
nimcache/1_2/compiler_commands.o \
nimcache/1_2/pure_os.o \
nimcache/1_2/pure_strutils.o \
nimcache/1_2/pure_parseutils.o \
nimcache/1_2/pure_times.o \
nimcache/1_2/windows_winlean.o \
nimcache/1_2/compiler_msgs.o \
nimcache/1_2/compiler_options.o \
nimcache/1_2/compiler_lists.o \
nimcache/1_2/pure_strtabs.o \
nimcache/1_2/pure_hashes.o \
nimcache/1_2/collections_tables.o \
nimcache/1_2/pure_math.o \
nimcache/1_2/compiler_ropes.o \
nimcache/1_2/compiler_platform.o \
nimcache/1_2/compiler_crc.o \
nimcache/1_2/pure_sockets.o \
nimcache/1_2/core_unsigned.o \
nimcache/1_2/compiler_nversion.o \
nimcache/1_2/compiler_condsyms.o \
nimcache/1_2/compiler_idents.o \
nimcache/1_2/compiler_extccomp.o \
nimcache/1_2/pure_osproc.o \
nimcache/1_2/pure_streams.o \
nimcache/1_2/compiler_wordrecg.o \
nimcache/1_2/compiler_babelcmd.o \
nimcache/1_2/compiler_lexer.o \
nimcache/1_2/compiler_nimlexbase.o \
nimcache/1_2/compiler_llstream.o \
nimcache/1_2/compiler_nimconf.o \
nimcache/1_2/compiler_main.o \
nimcache/1_2/compiler_ast.o \
nimcache/1_2/collections_intsets.o \
nimcache/1_2/compiler_idgen.o \
nimcache/1_2/compiler_astalgo.o \
nimcache/1_2/compiler_rodutils.o \
nimcache/1_2/compiler_syntaxes.o \
nimcache/1_2/compiler_parser.o \
nimcache/1_2/compiler_pbraces.o \
nimcache/1_2/compiler_filters.o \
nimcache/1_2/compiler_renderer.o \
nimcache/1_2/compiler_filter_tmpl.o \
nimcache/1_2/compiler_rodread.o \
nimcache/1_2/compiler_types.o \
nimcache/1_2/compiler_trees.o \
nimcache/1_2/pure_memfiles.o \
nimcache/1_2/compiler_rodwrite.o \
nimcache/1_2/compiler_passes.o \
nimcache/1_2/compiler_magicsys.o \
nimcache/1_2/compiler_nimsets.o \
nimcache/1_2/compiler_bitsets.o \
nimcache/1_2/compiler_semthreads.o \
nimcache/1_2/compiler_importer.o \
nimcache/1_2/compiler_lookups.o \
nimcache/1_2/compiler_semdata.o \
nimcache/1_2/compiler_treetab.o \
nimcache/1_2/compiler_evals.o \
nimcache/1_2/compiler_semfold.o \
nimcache/1_2/compiler_saturate.o \
nimcache/1_2/compiler_transf.o \
nimcache/1_2/compiler_cgmeth.o \
nimcache/1_2/compiler_sempass2.o \
nimcache/1_2/compiler_guards.o \
nimcache/1_2/compiler_lambdalifting.o \
nimcache/1_2/compiler_evaltempl.o \
nimcache/1_2/compiler_sem.o \
nimcache/1_2/compiler_procfind.o \
nimcache/1_2/compiler_pragmas.o \
nimcache/1_2/compiler_semtypinst.o \
nimcache/1_2/compiler_sigmatch.o \
nimcache/1_2/compiler_parampatterns.o \
nimcache/1_2/compiler_docgen.o \
nimcache/1_2/docutils_rstast.o \
nimcache/1_2/docutils_rst.o \
nimcache/1_2/docutils_rstgen.o \
nimcache/1_2/docutils_highlite.o \
nimcache/1_2/pure_json.o \
nimcache/1_2/pure_lexbase.o \
nimcache/1_2/pure_unicode.o \
nimcache/1_2/pure_algorithm.o \
nimcache/1_2/collections_sequtils.o \
nimcache/1_2/compiler_aliases.o \
nimcache/1_2/compiler_patterns.o \
nimcache/1_2/compiler_cgen.o \
nimcache/1_2/compiler_ccgutils.o \
nimcache/1_2/compiler_cgendata.o \
nimcache/1_2/compiler_ccgmerge.o \
nimcache/1_2/compiler_jsgen.o \
nimcache/1_2/compiler_passaux.o \
nimcache/1_2/compiler_depends.o \
nimcache/1_2/compiler_docgen2.o \
nimcache/1_2/compiler_service.o \
nimcache/1_2/pure_parseopt.o \
nimcache/1_2/compiler_modules.o \
nimcache/1_2/compiler_pretty.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$LINKER -o $binDir/nimrod  $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/nimrod  $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  $LINK_FLAGS
    ;;
  sparc)
    echo "$LINKER -o $binDir/nimrod  $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/nimrod  $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  $LINK_FLAGS
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
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_nimrod.c -o nimcache/2_1/compiler_nimrod.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_nimrod.c -o nimcache/2_1/compiler_nimrod.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/Nimrod_system.c -o nimcache/2_1/Nimrod_system.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/Nimrod_system.c -o nimcache/2_1/Nimrod_system.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_testability.c -o nimcache/2_1/compiler_testability.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_testability.c -o nimcache/2_1/compiler_testability.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_commands.c -o nimcache/2_1/compiler_commands.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_commands.c -o nimcache/2_1/compiler_commands.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_os.c -o nimcache/2_1/pure_os.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_os.c -o nimcache/2_1/pure_os.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_strutils.c -o nimcache/2_1/pure_strutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_strutils.c -o nimcache/2_1/pure_strutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_parseutils.c -o nimcache/2_1/pure_parseutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_parseutils.c -o nimcache/2_1/pure_parseutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_times.c -o nimcache/2_1/pure_times.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_times.c -o nimcache/2_1/pure_times.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/posix_posix.c -o nimcache/2_1/posix_posix.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/posix_posix.c -o nimcache/2_1/posix_posix.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_msgs.c -o nimcache/2_1/compiler_msgs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_msgs.c -o nimcache/2_1/compiler_msgs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_options.c -o nimcache/2_1/compiler_options.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_options.c -o nimcache/2_1/compiler_options.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_lists.c -o nimcache/2_1/compiler_lists.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_lists.c -o nimcache/2_1/compiler_lists.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_strtabs.c -o nimcache/2_1/pure_strtabs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_strtabs.c -o nimcache/2_1/pure_strtabs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_hashes.c -o nimcache/2_1/pure_hashes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_hashes.c -o nimcache/2_1/pure_hashes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/collections_tables.c -o nimcache/2_1/collections_tables.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/collections_tables.c -o nimcache/2_1/collections_tables.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_math.c -o nimcache/2_1/pure_math.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_math.c -o nimcache/2_1/pure_math.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_ropes.c -o nimcache/2_1/compiler_ropes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_ropes.c -o nimcache/2_1/compiler_ropes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_platform.c -o nimcache/2_1/compiler_platform.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_platform.c -o nimcache/2_1/compiler_platform.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_crc.c -o nimcache/2_1/compiler_crc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_crc.c -o nimcache/2_1/compiler_crc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_sockets.c -o nimcache/2_1/pure_sockets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_sockets.c -o nimcache/2_1/pure_sockets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/core_unsigned.c -o nimcache/2_1/core_unsigned.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/core_unsigned.c -o nimcache/2_1/core_unsigned.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_nversion.c -o nimcache/2_1/compiler_nversion.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_nversion.c -o nimcache/2_1/compiler_nversion.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_condsyms.c -o nimcache/2_1/compiler_condsyms.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_condsyms.c -o nimcache/2_1/compiler_condsyms.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_idents.c -o nimcache/2_1/compiler_idents.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_idents.c -o nimcache/2_1/compiler_idents.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_extccomp.c -o nimcache/2_1/compiler_extccomp.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_extccomp.c -o nimcache/2_1/compiler_extccomp.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_osproc.c -o nimcache/2_1/pure_osproc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_osproc.c -o nimcache/2_1/pure_osproc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_streams.c -o nimcache/2_1/pure_streams.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_streams.c -o nimcache/2_1/pure_streams.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_wordrecg.c -o nimcache/2_1/compiler_wordrecg.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_wordrecg.c -o nimcache/2_1/compiler_wordrecg.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_babelcmd.c -o nimcache/2_1/compiler_babelcmd.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_babelcmd.c -o nimcache/2_1/compiler_babelcmd.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_lexer.c -o nimcache/2_1/compiler_lexer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_lexer.c -o nimcache/2_1/compiler_lexer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_nimlexbase.c -o nimcache/2_1/compiler_nimlexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_nimlexbase.c -o nimcache/2_1/compiler_nimlexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_llstream.c -o nimcache/2_1/compiler_llstream.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_llstream.c -o nimcache/2_1/compiler_llstream.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_nimconf.c -o nimcache/2_1/compiler_nimconf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_nimconf.c -o nimcache/2_1/compiler_nimconf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_main.c -o nimcache/2_1/compiler_main.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_main.c -o nimcache/2_1/compiler_main.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_ast.c -o nimcache/2_1/compiler_ast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_ast.c -o nimcache/2_1/compiler_ast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/collections_intsets.c -o nimcache/2_1/collections_intsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/collections_intsets.c -o nimcache/2_1/collections_intsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_idgen.c -o nimcache/2_1/compiler_idgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_idgen.c -o nimcache/2_1/compiler_idgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_astalgo.c -o nimcache/2_1/compiler_astalgo.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_astalgo.c -o nimcache/2_1/compiler_astalgo.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_rodutils.c -o nimcache/2_1/compiler_rodutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_rodutils.c -o nimcache/2_1/compiler_rodutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_syntaxes.c -o nimcache/2_1/compiler_syntaxes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_syntaxes.c -o nimcache/2_1/compiler_syntaxes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_parser.c -o nimcache/2_1/compiler_parser.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_parser.c -o nimcache/2_1/compiler_parser.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_pbraces.c -o nimcache/2_1/compiler_pbraces.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_pbraces.c -o nimcache/2_1/compiler_pbraces.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_filters.c -o nimcache/2_1/compiler_filters.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_filters.c -o nimcache/2_1/compiler_filters.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_renderer.c -o nimcache/2_1/compiler_renderer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_renderer.c -o nimcache/2_1/compiler_renderer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_filter_tmpl.c -o nimcache/2_1/compiler_filter_tmpl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_filter_tmpl.c -o nimcache/2_1/compiler_filter_tmpl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_rodread.c -o nimcache/2_1/compiler_rodread.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_rodread.c -o nimcache/2_1/compiler_rodread.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_types.c -o nimcache/2_1/compiler_types.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_types.c -o nimcache/2_1/compiler_types.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_trees.c -o nimcache/2_1/compiler_trees.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_trees.c -o nimcache/2_1/compiler_trees.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_memfiles.c -o nimcache/2_1/pure_memfiles.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_memfiles.c -o nimcache/2_1/pure_memfiles.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_rodwrite.c -o nimcache/2_1/compiler_rodwrite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_rodwrite.c -o nimcache/2_1/compiler_rodwrite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_passes.c -o nimcache/2_1/compiler_passes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_passes.c -o nimcache/2_1/compiler_passes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_magicsys.c -o nimcache/2_1/compiler_magicsys.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_magicsys.c -o nimcache/2_1/compiler_magicsys.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_nimsets.c -o nimcache/2_1/compiler_nimsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_nimsets.c -o nimcache/2_1/compiler_nimsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_bitsets.c -o nimcache/2_1/compiler_bitsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_bitsets.c -o nimcache/2_1/compiler_bitsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_semthreads.c -o nimcache/2_1/compiler_semthreads.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_semthreads.c -o nimcache/2_1/compiler_semthreads.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_importer.c -o nimcache/2_1/compiler_importer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_importer.c -o nimcache/2_1/compiler_importer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_lookups.c -o nimcache/2_1/compiler_lookups.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_lookups.c -o nimcache/2_1/compiler_lookups.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_semdata.c -o nimcache/2_1/compiler_semdata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_semdata.c -o nimcache/2_1/compiler_semdata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_treetab.c -o nimcache/2_1/compiler_treetab.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_treetab.c -o nimcache/2_1/compiler_treetab.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_evals.c -o nimcache/2_1/compiler_evals.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_evals.c -o nimcache/2_1/compiler_evals.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_semfold.c -o nimcache/2_1/compiler_semfold.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_semfold.c -o nimcache/2_1/compiler_semfold.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_saturate.c -o nimcache/2_1/compiler_saturate.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_saturate.c -o nimcache/2_1/compiler_saturate.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_transf.c -o nimcache/2_1/compiler_transf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_transf.c -o nimcache/2_1/compiler_transf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_cgmeth.c -o nimcache/2_1/compiler_cgmeth.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_cgmeth.c -o nimcache/2_1/compiler_cgmeth.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_sempass2.c -o nimcache/2_1/compiler_sempass2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_sempass2.c -o nimcache/2_1/compiler_sempass2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_guards.c -o nimcache/2_1/compiler_guards.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_guards.c -o nimcache/2_1/compiler_guards.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_lambdalifting.c -o nimcache/2_1/compiler_lambdalifting.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_lambdalifting.c -o nimcache/2_1/compiler_lambdalifting.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_evaltempl.c -o nimcache/2_1/compiler_evaltempl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_evaltempl.c -o nimcache/2_1/compiler_evaltempl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_sem.c -o nimcache/2_1/compiler_sem.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_sem.c -o nimcache/2_1/compiler_sem.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_procfind.c -o nimcache/2_1/compiler_procfind.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_procfind.c -o nimcache/2_1/compiler_procfind.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_pragmas.c -o nimcache/2_1/compiler_pragmas.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_pragmas.c -o nimcache/2_1/compiler_pragmas.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_semtypinst.c -o nimcache/2_1/compiler_semtypinst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_semtypinst.c -o nimcache/2_1/compiler_semtypinst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_sigmatch.c -o nimcache/2_1/compiler_sigmatch.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_sigmatch.c -o nimcache/2_1/compiler_sigmatch.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_parampatterns.c -o nimcache/2_1/compiler_parampatterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_parampatterns.c -o nimcache/2_1/compiler_parampatterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_docgen.c -o nimcache/2_1/compiler_docgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_docgen.c -o nimcache/2_1/compiler_docgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/docutils_rstast.c -o nimcache/2_1/docutils_rstast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/docutils_rstast.c -o nimcache/2_1/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/docutils_rst.c -o nimcache/2_1/docutils_rst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/docutils_rst.c -o nimcache/2_1/docutils_rst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/docutils_rstgen.c -o nimcache/2_1/docutils_rstgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/docutils_rstgen.c -o nimcache/2_1/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/docutils_highlite.c -o nimcache/2_1/docutils_highlite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/docutils_highlite.c -o nimcache/2_1/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_json.c -o nimcache/2_1/pure_json.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_json.c -o nimcache/2_1/pure_json.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_lexbase.c -o nimcache/2_1/pure_lexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_lexbase.c -o nimcache/2_1/pure_lexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_unicode.c -o nimcache/2_1/pure_unicode.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_unicode.c -o nimcache/2_1/pure_unicode.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_algorithm.c -o nimcache/2_1/pure_algorithm.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_algorithm.c -o nimcache/2_1/pure_algorithm.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/collections_sequtils.c -o nimcache/2_1/collections_sequtils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/collections_sequtils.c -o nimcache/2_1/collections_sequtils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_aliases.c -o nimcache/2_1/compiler_aliases.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_aliases.c -o nimcache/2_1/compiler_aliases.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_patterns.c -o nimcache/2_1/compiler_patterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_patterns.c -o nimcache/2_1/compiler_patterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_cgen.c -o nimcache/2_1/compiler_cgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_cgen.c -o nimcache/2_1/compiler_cgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_ccgutils.c -o nimcache/2_1/compiler_ccgutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_ccgutils.c -o nimcache/2_1/compiler_ccgutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_cgendata.c -o nimcache/2_1/compiler_cgendata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_cgendata.c -o nimcache/2_1/compiler_cgendata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_ccgmerge.c -o nimcache/2_1/compiler_ccgmerge.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_ccgmerge.c -o nimcache/2_1/compiler_ccgmerge.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_jsgen.c -o nimcache/2_1/compiler_jsgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_jsgen.c -o nimcache/2_1/compiler_jsgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_passaux.c -o nimcache/2_1/compiler_passaux.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_passaux.c -o nimcache/2_1/compiler_passaux.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_depends.c -o nimcache/2_1/compiler_depends.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_depends.c -o nimcache/2_1/compiler_depends.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_docgen2.c -o nimcache/2_1/compiler_docgen2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_docgen2.c -o nimcache/2_1/compiler_docgen2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_service.c -o nimcache/2_1/compiler_service.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_service.c -o nimcache/2_1/compiler_service.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_parseopt.c -o nimcache/2_1/pure_parseopt.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/pure_parseopt.c -o nimcache/2_1/pure_parseopt.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_modules.c -o nimcache/2_1/compiler_modules.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_modules.c -o nimcache/2_1/compiler_modules.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_pretty.c -o nimcache/2_1/compiler_pretty.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_1/compiler_pretty.c -o nimcache/2_1/compiler_pretty.o
    echo "$LINKER -o $binDir/nimrod  \
nimcache/2_1/compiler_nimrod.o \
nimcache/2_1/Nimrod_system.o \
nimcache/2_1/compiler_testability.o \
nimcache/2_1/compiler_commands.o \
nimcache/2_1/pure_os.o \
nimcache/2_1/pure_strutils.o \
nimcache/2_1/pure_parseutils.o \
nimcache/2_1/pure_times.o \
nimcache/2_1/posix_posix.o \
nimcache/2_1/compiler_msgs.o \
nimcache/2_1/compiler_options.o \
nimcache/2_1/compiler_lists.o \
nimcache/2_1/pure_strtabs.o \
nimcache/2_1/pure_hashes.o \
nimcache/2_1/collections_tables.o \
nimcache/2_1/pure_math.o \
nimcache/2_1/compiler_ropes.o \
nimcache/2_1/compiler_platform.o \
nimcache/2_1/compiler_crc.o \
nimcache/2_1/pure_sockets.o \
nimcache/2_1/core_unsigned.o \
nimcache/2_1/compiler_nversion.o \
nimcache/2_1/compiler_condsyms.o \
nimcache/2_1/compiler_idents.o \
nimcache/2_1/compiler_extccomp.o \
nimcache/2_1/pure_osproc.o \
nimcache/2_1/pure_streams.o \
nimcache/2_1/compiler_wordrecg.o \
nimcache/2_1/compiler_babelcmd.o \
nimcache/2_1/compiler_lexer.o \
nimcache/2_1/compiler_nimlexbase.o \
nimcache/2_1/compiler_llstream.o \
nimcache/2_1/compiler_nimconf.o \
nimcache/2_1/compiler_main.o \
nimcache/2_1/compiler_ast.o \
nimcache/2_1/collections_intsets.o \
nimcache/2_1/compiler_idgen.o \
nimcache/2_1/compiler_astalgo.o \
nimcache/2_1/compiler_rodutils.o \
nimcache/2_1/compiler_syntaxes.o \
nimcache/2_1/compiler_parser.o \
nimcache/2_1/compiler_pbraces.o \
nimcache/2_1/compiler_filters.o \
nimcache/2_1/compiler_renderer.o \
nimcache/2_1/compiler_filter_tmpl.o \
nimcache/2_1/compiler_rodread.o \
nimcache/2_1/compiler_types.o \
nimcache/2_1/compiler_trees.o \
nimcache/2_1/pure_memfiles.o \
nimcache/2_1/compiler_rodwrite.o \
nimcache/2_1/compiler_passes.o \
nimcache/2_1/compiler_magicsys.o \
nimcache/2_1/compiler_nimsets.o \
nimcache/2_1/compiler_bitsets.o \
nimcache/2_1/compiler_semthreads.o \
nimcache/2_1/compiler_importer.o \
nimcache/2_1/compiler_lookups.o \
nimcache/2_1/compiler_semdata.o \
nimcache/2_1/compiler_treetab.o \
nimcache/2_1/compiler_evals.o \
nimcache/2_1/compiler_semfold.o \
nimcache/2_1/compiler_saturate.o \
nimcache/2_1/compiler_transf.o \
nimcache/2_1/compiler_cgmeth.o \
nimcache/2_1/compiler_sempass2.o \
nimcache/2_1/compiler_guards.o \
nimcache/2_1/compiler_lambdalifting.o \
nimcache/2_1/compiler_evaltempl.o \
nimcache/2_1/compiler_sem.o \
nimcache/2_1/compiler_procfind.o \
nimcache/2_1/compiler_pragmas.o \
nimcache/2_1/compiler_semtypinst.o \
nimcache/2_1/compiler_sigmatch.o \
nimcache/2_1/compiler_parampatterns.o \
nimcache/2_1/compiler_docgen.o \
nimcache/2_1/docutils_rstast.o \
nimcache/2_1/docutils_rst.o \
nimcache/2_1/docutils_rstgen.o \
nimcache/2_1/docutils_highlite.o \
nimcache/2_1/pure_json.o \
nimcache/2_1/pure_lexbase.o \
nimcache/2_1/pure_unicode.o \
nimcache/2_1/pure_algorithm.o \
nimcache/2_1/collections_sequtils.o \
nimcache/2_1/compiler_aliases.o \
nimcache/2_1/compiler_patterns.o \
nimcache/2_1/compiler_cgen.o \
nimcache/2_1/compiler_ccgutils.o \
nimcache/2_1/compiler_cgendata.o \
nimcache/2_1/compiler_ccgmerge.o \
nimcache/2_1/compiler_jsgen.o \
nimcache/2_1/compiler_passaux.o \
nimcache/2_1/compiler_depends.o \
nimcache/2_1/compiler_docgen2.o \
nimcache/2_1/compiler_service.o \
nimcache/2_1/pure_parseopt.o \
nimcache/2_1/compiler_modules.o \
nimcache/2_1/compiler_pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
nimcache/2_1/compiler_nimrod.o \
nimcache/2_1/Nimrod_system.o \
nimcache/2_1/compiler_testability.o \
nimcache/2_1/compiler_commands.o \
nimcache/2_1/pure_os.o \
nimcache/2_1/pure_strutils.o \
nimcache/2_1/pure_parseutils.o \
nimcache/2_1/pure_times.o \
nimcache/2_1/posix_posix.o \
nimcache/2_1/compiler_msgs.o \
nimcache/2_1/compiler_options.o \
nimcache/2_1/compiler_lists.o \
nimcache/2_1/pure_strtabs.o \
nimcache/2_1/pure_hashes.o \
nimcache/2_1/collections_tables.o \
nimcache/2_1/pure_math.o \
nimcache/2_1/compiler_ropes.o \
nimcache/2_1/compiler_platform.o \
nimcache/2_1/compiler_crc.o \
nimcache/2_1/pure_sockets.o \
nimcache/2_1/core_unsigned.o \
nimcache/2_1/compiler_nversion.o \
nimcache/2_1/compiler_condsyms.o \
nimcache/2_1/compiler_idents.o \
nimcache/2_1/compiler_extccomp.o \
nimcache/2_1/pure_osproc.o \
nimcache/2_1/pure_streams.o \
nimcache/2_1/compiler_wordrecg.o \
nimcache/2_1/compiler_babelcmd.o \
nimcache/2_1/compiler_lexer.o \
nimcache/2_1/compiler_nimlexbase.o \
nimcache/2_1/compiler_llstream.o \
nimcache/2_1/compiler_nimconf.o \
nimcache/2_1/compiler_main.o \
nimcache/2_1/compiler_ast.o \
nimcache/2_1/collections_intsets.o \
nimcache/2_1/compiler_idgen.o \
nimcache/2_1/compiler_astalgo.o \
nimcache/2_1/compiler_rodutils.o \
nimcache/2_1/compiler_syntaxes.o \
nimcache/2_1/compiler_parser.o \
nimcache/2_1/compiler_pbraces.o \
nimcache/2_1/compiler_filters.o \
nimcache/2_1/compiler_renderer.o \
nimcache/2_1/compiler_filter_tmpl.o \
nimcache/2_1/compiler_rodread.o \
nimcache/2_1/compiler_types.o \
nimcache/2_1/compiler_trees.o \
nimcache/2_1/pure_memfiles.o \
nimcache/2_1/compiler_rodwrite.o \
nimcache/2_1/compiler_passes.o \
nimcache/2_1/compiler_magicsys.o \
nimcache/2_1/compiler_nimsets.o \
nimcache/2_1/compiler_bitsets.o \
nimcache/2_1/compiler_semthreads.o \
nimcache/2_1/compiler_importer.o \
nimcache/2_1/compiler_lookups.o \
nimcache/2_1/compiler_semdata.o \
nimcache/2_1/compiler_treetab.o \
nimcache/2_1/compiler_evals.o \
nimcache/2_1/compiler_semfold.o \
nimcache/2_1/compiler_saturate.o \
nimcache/2_1/compiler_transf.o \
nimcache/2_1/compiler_cgmeth.o \
nimcache/2_1/compiler_sempass2.o \
nimcache/2_1/compiler_guards.o \
nimcache/2_1/compiler_lambdalifting.o \
nimcache/2_1/compiler_evaltempl.o \
nimcache/2_1/compiler_sem.o \
nimcache/2_1/compiler_procfind.o \
nimcache/2_1/compiler_pragmas.o \
nimcache/2_1/compiler_semtypinst.o \
nimcache/2_1/compiler_sigmatch.o \
nimcache/2_1/compiler_parampatterns.o \
nimcache/2_1/compiler_docgen.o \
nimcache/2_1/docutils_rstast.o \
nimcache/2_1/docutils_rst.o \
nimcache/2_1/docutils_rstgen.o \
nimcache/2_1/docutils_highlite.o \
nimcache/2_1/pure_json.o \
nimcache/2_1/pure_lexbase.o \
nimcache/2_1/pure_unicode.o \
nimcache/2_1/pure_algorithm.o \
nimcache/2_1/collections_sequtils.o \
nimcache/2_1/compiler_aliases.o \
nimcache/2_1/compiler_patterns.o \
nimcache/2_1/compiler_cgen.o \
nimcache/2_1/compiler_ccgutils.o \
nimcache/2_1/compiler_cgendata.o \
nimcache/2_1/compiler_ccgmerge.o \
nimcache/2_1/compiler_jsgen.o \
nimcache/2_1/compiler_passaux.o \
nimcache/2_1/compiler_depends.o \
nimcache/2_1/compiler_docgen2.o \
nimcache/2_1/compiler_service.o \
nimcache/2_1/pure_parseopt.o \
nimcache/2_1/compiler_modules.o \
nimcache/2_1/compiler_pretty.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_nimrod.c -o nimcache/2_2/compiler_nimrod.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_nimrod.c -o nimcache/2_2/compiler_nimrod.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/Nimrod_system.c -o nimcache/2_2/Nimrod_system.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/Nimrod_system.c -o nimcache/2_2/Nimrod_system.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_testability.c -o nimcache/2_2/compiler_testability.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_testability.c -o nimcache/2_2/compiler_testability.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_commands.c -o nimcache/2_2/compiler_commands.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_commands.c -o nimcache/2_2/compiler_commands.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_os.c -o nimcache/2_2/pure_os.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_os.c -o nimcache/2_2/pure_os.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_strutils.c -o nimcache/2_2/pure_strutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_strutils.c -o nimcache/2_2/pure_strutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_parseutils.c -o nimcache/2_2/pure_parseutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_parseutils.c -o nimcache/2_2/pure_parseutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_times.c -o nimcache/2_2/pure_times.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_times.c -o nimcache/2_2/pure_times.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/posix_posix.c -o nimcache/2_2/posix_posix.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/posix_posix.c -o nimcache/2_2/posix_posix.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_msgs.c -o nimcache/2_2/compiler_msgs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_msgs.c -o nimcache/2_2/compiler_msgs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_options.c -o nimcache/2_2/compiler_options.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_options.c -o nimcache/2_2/compiler_options.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_lists.c -o nimcache/2_2/compiler_lists.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_lists.c -o nimcache/2_2/compiler_lists.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_strtabs.c -o nimcache/2_2/pure_strtabs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_strtabs.c -o nimcache/2_2/pure_strtabs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_hashes.c -o nimcache/2_2/pure_hashes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_hashes.c -o nimcache/2_2/pure_hashes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/collections_tables.c -o nimcache/2_2/collections_tables.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/collections_tables.c -o nimcache/2_2/collections_tables.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_math.c -o nimcache/2_2/pure_math.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_math.c -o nimcache/2_2/pure_math.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_ropes.c -o nimcache/2_2/compiler_ropes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_ropes.c -o nimcache/2_2/compiler_ropes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_platform.c -o nimcache/2_2/compiler_platform.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_platform.c -o nimcache/2_2/compiler_platform.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_crc.c -o nimcache/2_2/compiler_crc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_crc.c -o nimcache/2_2/compiler_crc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_sockets.c -o nimcache/2_2/pure_sockets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_sockets.c -o nimcache/2_2/pure_sockets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/core_unsigned.c -o nimcache/2_2/core_unsigned.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/core_unsigned.c -o nimcache/2_2/core_unsigned.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_nversion.c -o nimcache/2_2/compiler_nversion.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_nversion.c -o nimcache/2_2/compiler_nversion.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_condsyms.c -o nimcache/2_2/compiler_condsyms.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_condsyms.c -o nimcache/2_2/compiler_condsyms.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_idents.c -o nimcache/2_2/compiler_idents.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_idents.c -o nimcache/2_2/compiler_idents.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_extccomp.c -o nimcache/2_2/compiler_extccomp.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_extccomp.c -o nimcache/2_2/compiler_extccomp.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_osproc.c -o nimcache/2_2/pure_osproc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_osproc.c -o nimcache/2_2/pure_osproc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_streams.c -o nimcache/2_2/pure_streams.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_streams.c -o nimcache/2_2/pure_streams.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_wordrecg.c -o nimcache/2_2/compiler_wordrecg.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_wordrecg.c -o nimcache/2_2/compiler_wordrecg.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_babelcmd.c -o nimcache/2_2/compiler_babelcmd.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_babelcmd.c -o nimcache/2_2/compiler_babelcmd.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_lexer.c -o nimcache/2_2/compiler_lexer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_lexer.c -o nimcache/2_2/compiler_lexer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_nimlexbase.c -o nimcache/2_2/compiler_nimlexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_nimlexbase.c -o nimcache/2_2/compiler_nimlexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_llstream.c -o nimcache/2_2/compiler_llstream.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_llstream.c -o nimcache/2_2/compiler_llstream.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_nimconf.c -o nimcache/2_2/compiler_nimconf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_nimconf.c -o nimcache/2_2/compiler_nimconf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_main.c -o nimcache/2_2/compiler_main.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_main.c -o nimcache/2_2/compiler_main.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_ast.c -o nimcache/2_2/compiler_ast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_ast.c -o nimcache/2_2/compiler_ast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/collections_intsets.c -o nimcache/2_2/collections_intsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/collections_intsets.c -o nimcache/2_2/collections_intsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_idgen.c -o nimcache/2_2/compiler_idgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_idgen.c -o nimcache/2_2/compiler_idgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_astalgo.c -o nimcache/2_2/compiler_astalgo.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_astalgo.c -o nimcache/2_2/compiler_astalgo.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_rodutils.c -o nimcache/2_2/compiler_rodutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_rodutils.c -o nimcache/2_2/compiler_rodutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_syntaxes.c -o nimcache/2_2/compiler_syntaxes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_syntaxes.c -o nimcache/2_2/compiler_syntaxes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_parser.c -o nimcache/2_2/compiler_parser.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_parser.c -o nimcache/2_2/compiler_parser.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_pbraces.c -o nimcache/2_2/compiler_pbraces.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_pbraces.c -o nimcache/2_2/compiler_pbraces.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_filters.c -o nimcache/2_2/compiler_filters.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_filters.c -o nimcache/2_2/compiler_filters.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_renderer.c -o nimcache/2_2/compiler_renderer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_renderer.c -o nimcache/2_2/compiler_renderer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_filter_tmpl.c -o nimcache/2_2/compiler_filter_tmpl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_filter_tmpl.c -o nimcache/2_2/compiler_filter_tmpl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_rodread.c -o nimcache/2_2/compiler_rodread.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_rodread.c -o nimcache/2_2/compiler_rodread.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_types.c -o nimcache/2_2/compiler_types.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_types.c -o nimcache/2_2/compiler_types.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_trees.c -o nimcache/2_2/compiler_trees.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_trees.c -o nimcache/2_2/compiler_trees.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_memfiles.c -o nimcache/2_2/pure_memfiles.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_memfiles.c -o nimcache/2_2/pure_memfiles.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_rodwrite.c -o nimcache/2_2/compiler_rodwrite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_rodwrite.c -o nimcache/2_2/compiler_rodwrite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_passes.c -o nimcache/2_2/compiler_passes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_passes.c -o nimcache/2_2/compiler_passes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_magicsys.c -o nimcache/2_2/compiler_magicsys.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_magicsys.c -o nimcache/2_2/compiler_magicsys.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_nimsets.c -o nimcache/2_2/compiler_nimsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_nimsets.c -o nimcache/2_2/compiler_nimsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_bitsets.c -o nimcache/2_2/compiler_bitsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_bitsets.c -o nimcache/2_2/compiler_bitsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_semthreads.c -o nimcache/2_2/compiler_semthreads.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_semthreads.c -o nimcache/2_2/compiler_semthreads.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_importer.c -o nimcache/2_2/compiler_importer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_importer.c -o nimcache/2_2/compiler_importer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_lookups.c -o nimcache/2_2/compiler_lookups.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_lookups.c -o nimcache/2_2/compiler_lookups.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_semdata.c -o nimcache/2_2/compiler_semdata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_semdata.c -o nimcache/2_2/compiler_semdata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_treetab.c -o nimcache/2_2/compiler_treetab.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_treetab.c -o nimcache/2_2/compiler_treetab.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_evals.c -o nimcache/2_2/compiler_evals.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_evals.c -o nimcache/2_2/compiler_evals.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_semfold.c -o nimcache/2_2/compiler_semfold.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_semfold.c -o nimcache/2_2/compiler_semfold.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_saturate.c -o nimcache/2_2/compiler_saturate.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_saturate.c -o nimcache/2_2/compiler_saturate.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_transf.c -o nimcache/2_2/compiler_transf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_transf.c -o nimcache/2_2/compiler_transf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_cgmeth.c -o nimcache/2_2/compiler_cgmeth.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_cgmeth.c -o nimcache/2_2/compiler_cgmeth.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_sempass2.c -o nimcache/2_2/compiler_sempass2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_sempass2.c -o nimcache/2_2/compiler_sempass2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_guards.c -o nimcache/2_2/compiler_guards.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_guards.c -o nimcache/2_2/compiler_guards.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_lambdalifting.c -o nimcache/2_2/compiler_lambdalifting.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_lambdalifting.c -o nimcache/2_2/compiler_lambdalifting.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_evaltempl.c -o nimcache/2_2/compiler_evaltempl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_evaltempl.c -o nimcache/2_2/compiler_evaltempl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_sem.c -o nimcache/2_2/compiler_sem.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_sem.c -o nimcache/2_2/compiler_sem.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_procfind.c -o nimcache/2_2/compiler_procfind.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_procfind.c -o nimcache/2_2/compiler_procfind.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_pragmas.c -o nimcache/2_2/compiler_pragmas.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_pragmas.c -o nimcache/2_2/compiler_pragmas.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_semtypinst.c -o nimcache/2_2/compiler_semtypinst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_semtypinst.c -o nimcache/2_2/compiler_semtypinst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_sigmatch.c -o nimcache/2_2/compiler_sigmatch.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_sigmatch.c -o nimcache/2_2/compiler_sigmatch.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_parampatterns.c -o nimcache/2_2/compiler_parampatterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_parampatterns.c -o nimcache/2_2/compiler_parampatterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_docgen.c -o nimcache/2_2/compiler_docgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_docgen.c -o nimcache/2_2/compiler_docgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/docutils_rstast.c -o nimcache/2_2/docutils_rstast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/docutils_rstast.c -o nimcache/2_2/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/docutils_rst.c -o nimcache/2_2/docutils_rst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/docutils_rst.c -o nimcache/2_2/docutils_rst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/docutils_rstgen.c -o nimcache/2_2/docutils_rstgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/docutils_rstgen.c -o nimcache/2_2/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/docutils_highlite.c -o nimcache/2_2/docutils_highlite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/docutils_highlite.c -o nimcache/2_2/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_json.c -o nimcache/2_2/pure_json.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_json.c -o nimcache/2_2/pure_json.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_lexbase.c -o nimcache/2_2/pure_lexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_lexbase.c -o nimcache/2_2/pure_lexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_unicode.c -o nimcache/2_2/pure_unicode.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_unicode.c -o nimcache/2_2/pure_unicode.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_algorithm.c -o nimcache/2_2/pure_algorithm.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_algorithm.c -o nimcache/2_2/pure_algorithm.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/collections_sequtils.c -o nimcache/2_2/collections_sequtils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/collections_sequtils.c -o nimcache/2_2/collections_sequtils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_aliases.c -o nimcache/2_2/compiler_aliases.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_aliases.c -o nimcache/2_2/compiler_aliases.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_patterns.c -o nimcache/2_2/compiler_patterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_patterns.c -o nimcache/2_2/compiler_patterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_cgen.c -o nimcache/2_2/compiler_cgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_cgen.c -o nimcache/2_2/compiler_cgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_ccgutils.c -o nimcache/2_2/compiler_ccgutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_ccgutils.c -o nimcache/2_2/compiler_ccgutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_cgendata.c -o nimcache/2_2/compiler_cgendata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_cgendata.c -o nimcache/2_2/compiler_cgendata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_ccgmerge.c -o nimcache/2_2/compiler_ccgmerge.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_ccgmerge.c -o nimcache/2_2/compiler_ccgmerge.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_jsgen.c -o nimcache/2_2/compiler_jsgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_jsgen.c -o nimcache/2_2/compiler_jsgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_passaux.c -o nimcache/2_2/compiler_passaux.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_passaux.c -o nimcache/2_2/compiler_passaux.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_depends.c -o nimcache/2_2/compiler_depends.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_depends.c -o nimcache/2_2/compiler_depends.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_docgen2.c -o nimcache/2_2/compiler_docgen2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_docgen2.c -o nimcache/2_2/compiler_docgen2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_service.c -o nimcache/2_2/compiler_service.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_service.c -o nimcache/2_2/compiler_service.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_parseopt.c -o nimcache/2_2/pure_parseopt.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/pure_parseopt.c -o nimcache/2_2/pure_parseopt.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_modules.c -o nimcache/2_2/compiler_modules.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_modules.c -o nimcache/2_2/compiler_modules.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_pretty.c -o nimcache/2_2/compiler_pretty.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_2/compiler_pretty.c -o nimcache/2_2/compiler_pretty.o
    echo "$LINKER -o $binDir/nimrod  \
nimcache/2_2/compiler_nimrod.o \
nimcache/2_2/Nimrod_system.o \
nimcache/2_2/compiler_testability.o \
nimcache/2_2/compiler_commands.o \
nimcache/2_2/pure_os.o \
nimcache/2_2/pure_strutils.o \
nimcache/2_2/pure_parseutils.o \
nimcache/2_2/pure_times.o \
nimcache/2_2/posix_posix.o \
nimcache/2_2/compiler_msgs.o \
nimcache/2_2/compiler_options.o \
nimcache/2_2/compiler_lists.o \
nimcache/2_2/pure_strtabs.o \
nimcache/2_2/pure_hashes.o \
nimcache/2_2/collections_tables.o \
nimcache/2_2/pure_math.o \
nimcache/2_2/compiler_ropes.o \
nimcache/2_2/compiler_platform.o \
nimcache/2_2/compiler_crc.o \
nimcache/2_2/pure_sockets.o \
nimcache/2_2/core_unsigned.o \
nimcache/2_2/compiler_nversion.o \
nimcache/2_2/compiler_condsyms.o \
nimcache/2_2/compiler_idents.o \
nimcache/2_2/compiler_extccomp.o \
nimcache/2_2/pure_osproc.o \
nimcache/2_2/pure_streams.o \
nimcache/2_2/compiler_wordrecg.o \
nimcache/2_2/compiler_babelcmd.o \
nimcache/2_2/compiler_lexer.o \
nimcache/2_2/compiler_nimlexbase.o \
nimcache/2_2/compiler_llstream.o \
nimcache/2_2/compiler_nimconf.o \
nimcache/2_2/compiler_main.o \
nimcache/2_2/compiler_ast.o \
nimcache/2_2/collections_intsets.o \
nimcache/2_2/compiler_idgen.o \
nimcache/2_2/compiler_astalgo.o \
nimcache/2_2/compiler_rodutils.o \
nimcache/2_2/compiler_syntaxes.o \
nimcache/2_2/compiler_parser.o \
nimcache/2_2/compiler_pbraces.o \
nimcache/2_2/compiler_filters.o \
nimcache/2_2/compiler_renderer.o \
nimcache/2_2/compiler_filter_tmpl.o \
nimcache/2_2/compiler_rodread.o \
nimcache/2_2/compiler_types.o \
nimcache/2_2/compiler_trees.o \
nimcache/2_2/pure_memfiles.o \
nimcache/2_2/compiler_rodwrite.o \
nimcache/2_2/compiler_passes.o \
nimcache/2_2/compiler_magicsys.o \
nimcache/2_2/compiler_nimsets.o \
nimcache/2_2/compiler_bitsets.o \
nimcache/2_2/compiler_semthreads.o \
nimcache/2_2/compiler_importer.o \
nimcache/2_2/compiler_lookups.o \
nimcache/2_2/compiler_semdata.o \
nimcache/2_2/compiler_treetab.o \
nimcache/2_2/compiler_evals.o \
nimcache/2_2/compiler_semfold.o \
nimcache/2_2/compiler_saturate.o \
nimcache/2_2/compiler_transf.o \
nimcache/2_2/compiler_cgmeth.o \
nimcache/2_2/compiler_sempass2.o \
nimcache/2_2/compiler_guards.o \
nimcache/2_2/compiler_lambdalifting.o \
nimcache/2_2/compiler_evaltempl.o \
nimcache/2_2/compiler_sem.o \
nimcache/2_2/compiler_procfind.o \
nimcache/2_2/compiler_pragmas.o \
nimcache/2_2/compiler_semtypinst.o \
nimcache/2_2/compiler_sigmatch.o \
nimcache/2_2/compiler_parampatterns.o \
nimcache/2_2/compiler_docgen.o \
nimcache/2_2/docutils_rstast.o \
nimcache/2_2/docutils_rst.o \
nimcache/2_2/docutils_rstgen.o \
nimcache/2_2/docutils_highlite.o \
nimcache/2_2/pure_json.o \
nimcache/2_2/pure_lexbase.o \
nimcache/2_2/pure_unicode.o \
nimcache/2_2/pure_algorithm.o \
nimcache/2_2/collections_sequtils.o \
nimcache/2_2/compiler_aliases.o \
nimcache/2_2/compiler_patterns.o \
nimcache/2_2/compiler_cgen.o \
nimcache/2_2/compiler_ccgutils.o \
nimcache/2_2/compiler_cgendata.o \
nimcache/2_2/compiler_ccgmerge.o \
nimcache/2_2/compiler_jsgen.o \
nimcache/2_2/compiler_passaux.o \
nimcache/2_2/compiler_depends.o \
nimcache/2_2/compiler_docgen2.o \
nimcache/2_2/compiler_service.o \
nimcache/2_2/pure_parseopt.o \
nimcache/2_2/compiler_modules.o \
nimcache/2_2/compiler_pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
nimcache/2_2/compiler_nimrod.o \
nimcache/2_2/Nimrod_system.o \
nimcache/2_2/compiler_testability.o \
nimcache/2_2/compiler_commands.o \
nimcache/2_2/pure_os.o \
nimcache/2_2/pure_strutils.o \
nimcache/2_2/pure_parseutils.o \
nimcache/2_2/pure_times.o \
nimcache/2_2/posix_posix.o \
nimcache/2_2/compiler_msgs.o \
nimcache/2_2/compiler_options.o \
nimcache/2_2/compiler_lists.o \
nimcache/2_2/pure_strtabs.o \
nimcache/2_2/pure_hashes.o \
nimcache/2_2/collections_tables.o \
nimcache/2_2/pure_math.o \
nimcache/2_2/compiler_ropes.o \
nimcache/2_2/compiler_platform.o \
nimcache/2_2/compiler_crc.o \
nimcache/2_2/pure_sockets.o \
nimcache/2_2/core_unsigned.o \
nimcache/2_2/compiler_nversion.o \
nimcache/2_2/compiler_condsyms.o \
nimcache/2_2/compiler_idents.o \
nimcache/2_2/compiler_extccomp.o \
nimcache/2_2/pure_osproc.o \
nimcache/2_2/pure_streams.o \
nimcache/2_2/compiler_wordrecg.o \
nimcache/2_2/compiler_babelcmd.o \
nimcache/2_2/compiler_lexer.o \
nimcache/2_2/compiler_nimlexbase.o \
nimcache/2_2/compiler_llstream.o \
nimcache/2_2/compiler_nimconf.o \
nimcache/2_2/compiler_main.o \
nimcache/2_2/compiler_ast.o \
nimcache/2_2/collections_intsets.o \
nimcache/2_2/compiler_idgen.o \
nimcache/2_2/compiler_astalgo.o \
nimcache/2_2/compiler_rodutils.o \
nimcache/2_2/compiler_syntaxes.o \
nimcache/2_2/compiler_parser.o \
nimcache/2_2/compiler_pbraces.o \
nimcache/2_2/compiler_filters.o \
nimcache/2_2/compiler_renderer.o \
nimcache/2_2/compiler_filter_tmpl.o \
nimcache/2_2/compiler_rodread.o \
nimcache/2_2/compiler_types.o \
nimcache/2_2/compiler_trees.o \
nimcache/2_2/pure_memfiles.o \
nimcache/2_2/compiler_rodwrite.o \
nimcache/2_2/compiler_passes.o \
nimcache/2_2/compiler_magicsys.o \
nimcache/2_2/compiler_nimsets.o \
nimcache/2_2/compiler_bitsets.o \
nimcache/2_2/compiler_semthreads.o \
nimcache/2_2/compiler_importer.o \
nimcache/2_2/compiler_lookups.o \
nimcache/2_2/compiler_semdata.o \
nimcache/2_2/compiler_treetab.o \
nimcache/2_2/compiler_evals.o \
nimcache/2_2/compiler_semfold.o \
nimcache/2_2/compiler_saturate.o \
nimcache/2_2/compiler_transf.o \
nimcache/2_2/compiler_cgmeth.o \
nimcache/2_2/compiler_sempass2.o \
nimcache/2_2/compiler_guards.o \
nimcache/2_2/compiler_lambdalifting.o \
nimcache/2_2/compiler_evaltempl.o \
nimcache/2_2/compiler_sem.o \
nimcache/2_2/compiler_procfind.o \
nimcache/2_2/compiler_pragmas.o \
nimcache/2_2/compiler_semtypinst.o \
nimcache/2_2/compiler_sigmatch.o \
nimcache/2_2/compiler_parampatterns.o \
nimcache/2_2/compiler_docgen.o \
nimcache/2_2/docutils_rstast.o \
nimcache/2_2/docutils_rst.o \
nimcache/2_2/docutils_rstgen.o \
nimcache/2_2/docutils_highlite.o \
nimcache/2_2/pure_json.o \
nimcache/2_2/pure_lexbase.o \
nimcache/2_2/pure_unicode.o \
nimcache/2_2/pure_algorithm.o \
nimcache/2_2/collections_sequtils.o \
nimcache/2_2/compiler_aliases.o \
nimcache/2_2/compiler_patterns.o \
nimcache/2_2/compiler_cgen.o \
nimcache/2_2/compiler_ccgutils.o \
nimcache/2_2/compiler_cgendata.o \
nimcache/2_2/compiler_ccgmerge.o \
nimcache/2_2/compiler_jsgen.o \
nimcache/2_2/compiler_passaux.o \
nimcache/2_2/compiler_depends.o \
nimcache/2_2/compiler_docgen2.o \
nimcache/2_2/compiler_service.o \
nimcache/2_2/pure_parseopt.o \
nimcache/2_2/compiler_modules.o \
nimcache/2_2/compiler_pretty.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_nimrod.c -o nimcache/2_3/compiler_nimrod.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_nimrod.c -o nimcache/2_3/compiler_nimrod.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/Nimrod_system.c -o nimcache/2_3/Nimrod_system.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/Nimrod_system.c -o nimcache/2_3/Nimrod_system.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_testability.c -o nimcache/2_3/compiler_testability.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_testability.c -o nimcache/2_3/compiler_testability.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_commands.c -o nimcache/2_3/compiler_commands.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_commands.c -o nimcache/2_3/compiler_commands.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_os.c -o nimcache/2_3/pure_os.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_os.c -o nimcache/2_3/pure_os.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_strutils.c -o nimcache/2_3/pure_strutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_strutils.c -o nimcache/2_3/pure_strutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_parseutils.c -o nimcache/2_3/pure_parseutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_parseutils.c -o nimcache/2_3/pure_parseutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_times.c -o nimcache/2_3/pure_times.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_times.c -o nimcache/2_3/pure_times.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/posix_posix.c -o nimcache/2_3/posix_posix.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/posix_posix.c -o nimcache/2_3/posix_posix.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_msgs.c -o nimcache/2_3/compiler_msgs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_msgs.c -o nimcache/2_3/compiler_msgs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_options.c -o nimcache/2_3/compiler_options.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_options.c -o nimcache/2_3/compiler_options.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_lists.c -o nimcache/2_3/compiler_lists.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_lists.c -o nimcache/2_3/compiler_lists.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_strtabs.c -o nimcache/2_3/pure_strtabs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_strtabs.c -o nimcache/2_3/pure_strtabs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_hashes.c -o nimcache/2_3/pure_hashes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_hashes.c -o nimcache/2_3/pure_hashes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/collections_tables.c -o nimcache/2_3/collections_tables.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/collections_tables.c -o nimcache/2_3/collections_tables.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_math.c -o nimcache/2_3/pure_math.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_math.c -o nimcache/2_3/pure_math.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_ropes.c -o nimcache/2_3/compiler_ropes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_ropes.c -o nimcache/2_3/compiler_ropes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_platform.c -o nimcache/2_3/compiler_platform.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_platform.c -o nimcache/2_3/compiler_platform.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_crc.c -o nimcache/2_3/compiler_crc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_crc.c -o nimcache/2_3/compiler_crc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_sockets.c -o nimcache/2_3/pure_sockets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_sockets.c -o nimcache/2_3/pure_sockets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/core_unsigned.c -o nimcache/2_3/core_unsigned.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/core_unsigned.c -o nimcache/2_3/core_unsigned.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_nversion.c -o nimcache/2_3/compiler_nversion.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_nversion.c -o nimcache/2_3/compiler_nversion.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_condsyms.c -o nimcache/2_3/compiler_condsyms.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_condsyms.c -o nimcache/2_3/compiler_condsyms.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_idents.c -o nimcache/2_3/compiler_idents.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_idents.c -o nimcache/2_3/compiler_idents.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_extccomp.c -o nimcache/2_3/compiler_extccomp.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_extccomp.c -o nimcache/2_3/compiler_extccomp.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_osproc.c -o nimcache/2_3/pure_osproc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_osproc.c -o nimcache/2_3/pure_osproc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_streams.c -o nimcache/2_3/pure_streams.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_streams.c -o nimcache/2_3/pure_streams.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_wordrecg.c -o nimcache/2_3/compiler_wordrecg.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_wordrecg.c -o nimcache/2_3/compiler_wordrecg.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_babelcmd.c -o nimcache/2_3/compiler_babelcmd.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_babelcmd.c -o nimcache/2_3/compiler_babelcmd.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_lexer.c -o nimcache/2_3/compiler_lexer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_lexer.c -o nimcache/2_3/compiler_lexer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_nimlexbase.c -o nimcache/2_3/compiler_nimlexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_nimlexbase.c -o nimcache/2_3/compiler_nimlexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_llstream.c -o nimcache/2_3/compiler_llstream.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_llstream.c -o nimcache/2_3/compiler_llstream.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_nimconf.c -o nimcache/2_3/compiler_nimconf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_nimconf.c -o nimcache/2_3/compiler_nimconf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_main.c -o nimcache/2_3/compiler_main.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_main.c -o nimcache/2_3/compiler_main.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_ast.c -o nimcache/2_3/compiler_ast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_ast.c -o nimcache/2_3/compiler_ast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/collections_intsets.c -o nimcache/2_3/collections_intsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/collections_intsets.c -o nimcache/2_3/collections_intsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_idgen.c -o nimcache/2_3/compiler_idgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_idgen.c -o nimcache/2_3/compiler_idgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_astalgo.c -o nimcache/2_3/compiler_astalgo.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_astalgo.c -o nimcache/2_3/compiler_astalgo.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_rodutils.c -o nimcache/2_3/compiler_rodutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_rodutils.c -o nimcache/2_3/compiler_rodutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_syntaxes.c -o nimcache/2_3/compiler_syntaxes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_syntaxes.c -o nimcache/2_3/compiler_syntaxes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_parser.c -o nimcache/2_3/compiler_parser.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_parser.c -o nimcache/2_3/compiler_parser.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_pbraces.c -o nimcache/2_3/compiler_pbraces.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_pbraces.c -o nimcache/2_3/compiler_pbraces.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_filters.c -o nimcache/2_3/compiler_filters.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_filters.c -o nimcache/2_3/compiler_filters.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_renderer.c -o nimcache/2_3/compiler_renderer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_renderer.c -o nimcache/2_3/compiler_renderer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_filter_tmpl.c -o nimcache/2_3/compiler_filter_tmpl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_filter_tmpl.c -o nimcache/2_3/compiler_filter_tmpl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_rodread.c -o nimcache/2_3/compiler_rodread.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_rodread.c -o nimcache/2_3/compiler_rodread.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_types.c -o nimcache/2_3/compiler_types.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_types.c -o nimcache/2_3/compiler_types.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_trees.c -o nimcache/2_3/compiler_trees.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_trees.c -o nimcache/2_3/compiler_trees.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_memfiles.c -o nimcache/2_3/pure_memfiles.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_memfiles.c -o nimcache/2_3/pure_memfiles.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_rodwrite.c -o nimcache/2_3/compiler_rodwrite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_rodwrite.c -o nimcache/2_3/compiler_rodwrite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_passes.c -o nimcache/2_3/compiler_passes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_passes.c -o nimcache/2_3/compiler_passes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_magicsys.c -o nimcache/2_3/compiler_magicsys.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_magicsys.c -o nimcache/2_3/compiler_magicsys.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_nimsets.c -o nimcache/2_3/compiler_nimsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_nimsets.c -o nimcache/2_3/compiler_nimsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_bitsets.c -o nimcache/2_3/compiler_bitsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_bitsets.c -o nimcache/2_3/compiler_bitsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_semthreads.c -o nimcache/2_3/compiler_semthreads.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_semthreads.c -o nimcache/2_3/compiler_semthreads.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_importer.c -o nimcache/2_3/compiler_importer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_importer.c -o nimcache/2_3/compiler_importer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_lookups.c -o nimcache/2_3/compiler_lookups.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_lookups.c -o nimcache/2_3/compiler_lookups.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_semdata.c -o nimcache/2_3/compiler_semdata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_semdata.c -o nimcache/2_3/compiler_semdata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_treetab.c -o nimcache/2_3/compiler_treetab.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_treetab.c -o nimcache/2_3/compiler_treetab.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_evals.c -o nimcache/2_3/compiler_evals.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_evals.c -o nimcache/2_3/compiler_evals.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_semfold.c -o nimcache/2_3/compiler_semfold.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_semfold.c -o nimcache/2_3/compiler_semfold.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_saturate.c -o nimcache/2_3/compiler_saturate.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_saturate.c -o nimcache/2_3/compiler_saturate.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_transf.c -o nimcache/2_3/compiler_transf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_transf.c -o nimcache/2_3/compiler_transf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_cgmeth.c -o nimcache/2_3/compiler_cgmeth.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_cgmeth.c -o nimcache/2_3/compiler_cgmeth.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_sempass2.c -o nimcache/2_3/compiler_sempass2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_sempass2.c -o nimcache/2_3/compiler_sempass2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_guards.c -o nimcache/2_3/compiler_guards.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_guards.c -o nimcache/2_3/compiler_guards.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_lambdalifting.c -o nimcache/2_3/compiler_lambdalifting.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_lambdalifting.c -o nimcache/2_3/compiler_lambdalifting.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_evaltempl.c -o nimcache/2_3/compiler_evaltempl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_evaltempl.c -o nimcache/2_3/compiler_evaltempl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_sem.c -o nimcache/2_3/compiler_sem.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_sem.c -o nimcache/2_3/compiler_sem.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_procfind.c -o nimcache/2_3/compiler_procfind.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_procfind.c -o nimcache/2_3/compiler_procfind.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_pragmas.c -o nimcache/2_3/compiler_pragmas.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_pragmas.c -o nimcache/2_3/compiler_pragmas.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_semtypinst.c -o nimcache/2_3/compiler_semtypinst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_semtypinst.c -o nimcache/2_3/compiler_semtypinst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_sigmatch.c -o nimcache/2_3/compiler_sigmatch.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_sigmatch.c -o nimcache/2_3/compiler_sigmatch.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_parampatterns.c -o nimcache/2_3/compiler_parampatterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_parampatterns.c -o nimcache/2_3/compiler_parampatterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_docgen.c -o nimcache/2_3/compiler_docgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_docgen.c -o nimcache/2_3/compiler_docgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/docutils_rstast.c -o nimcache/2_3/docutils_rstast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/docutils_rstast.c -o nimcache/2_3/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/docutils_rst.c -o nimcache/2_3/docutils_rst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/docutils_rst.c -o nimcache/2_3/docutils_rst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/docutils_rstgen.c -o nimcache/2_3/docutils_rstgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/docutils_rstgen.c -o nimcache/2_3/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/docutils_highlite.c -o nimcache/2_3/docutils_highlite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/docutils_highlite.c -o nimcache/2_3/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_json.c -o nimcache/2_3/pure_json.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_json.c -o nimcache/2_3/pure_json.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_lexbase.c -o nimcache/2_3/pure_lexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_lexbase.c -o nimcache/2_3/pure_lexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_unicode.c -o nimcache/2_3/pure_unicode.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_unicode.c -o nimcache/2_3/pure_unicode.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_algorithm.c -o nimcache/2_3/pure_algorithm.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_algorithm.c -o nimcache/2_3/pure_algorithm.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/collections_sequtils.c -o nimcache/2_3/collections_sequtils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/collections_sequtils.c -o nimcache/2_3/collections_sequtils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_aliases.c -o nimcache/2_3/compiler_aliases.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_aliases.c -o nimcache/2_3/compiler_aliases.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_patterns.c -o nimcache/2_3/compiler_patterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_patterns.c -o nimcache/2_3/compiler_patterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_cgen.c -o nimcache/2_3/compiler_cgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_cgen.c -o nimcache/2_3/compiler_cgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_ccgutils.c -o nimcache/2_3/compiler_ccgutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_ccgutils.c -o nimcache/2_3/compiler_ccgutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_cgendata.c -o nimcache/2_3/compiler_cgendata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_cgendata.c -o nimcache/2_3/compiler_cgendata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_ccgmerge.c -o nimcache/2_3/compiler_ccgmerge.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_ccgmerge.c -o nimcache/2_3/compiler_ccgmerge.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_jsgen.c -o nimcache/2_3/compiler_jsgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_jsgen.c -o nimcache/2_3/compiler_jsgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_passaux.c -o nimcache/2_3/compiler_passaux.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_passaux.c -o nimcache/2_3/compiler_passaux.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_depends.c -o nimcache/2_3/compiler_depends.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_depends.c -o nimcache/2_3/compiler_depends.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_docgen2.c -o nimcache/2_3/compiler_docgen2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_docgen2.c -o nimcache/2_3/compiler_docgen2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_service.c -o nimcache/2_3/compiler_service.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_service.c -o nimcache/2_3/compiler_service.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_parseopt.c -o nimcache/2_3/pure_parseopt.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/pure_parseopt.c -o nimcache/2_3/pure_parseopt.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_modules.c -o nimcache/2_3/compiler_modules.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_modules.c -o nimcache/2_3/compiler_modules.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_pretty.c -o nimcache/2_3/compiler_pretty.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_3/compiler_pretty.c -o nimcache/2_3/compiler_pretty.o
    echo "$LINKER -o $binDir/nimrod  \
nimcache/2_3/compiler_nimrod.o \
nimcache/2_3/Nimrod_system.o \
nimcache/2_3/compiler_testability.o \
nimcache/2_3/compiler_commands.o \
nimcache/2_3/pure_os.o \
nimcache/2_3/pure_strutils.o \
nimcache/2_3/pure_parseutils.o \
nimcache/2_3/pure_times.o \
nimcache/2_3/posix_posix.o \
nimcache/2_3/compiler_msgs.o \
nimcache/2_3/compiler_options.o \
nimcache/2_3/compiler_lists.o \
nimcache/2_3/pure_strtabs.o \
nimcache/2_3/pure_hashes.o \
nimcache/2_3/collections_tables.o \
nimcache/2_3/pure_math.o \
nimcache/2_3/compiler_ropes.o \
nimcache/2_3/compiler_platform.o \
nimcache/2_3/compiler_crc.o \
nimcache/2_3/pure_sockets.o \
nimcache/2_3/core_unsigned.o \
nimcache/2_3/compiler_nversion.o \
nimcache/2_3/compiler_condsyms.o \
nimcache/2_3/compiler_idents.o \
nimcache/2_3/compiler_extccomp.o \
nimcache/2_3/pure_osproc.o \
nimcache/2_3/pure_streams.o \
nimcache/2_3/compiler_wordrecg.o \
nimcache/2_3/compiler_babelcmd.o \
nimcache/2_3/compiler_lexer.o \
nimcache/2_3/compiler_nimlexbase.o \
nimcache/2_3/compiler_llstream.o \
nimcache/2_3/compiler_nimconf.o \
nimcache/2_3/compiler_main.o \
nimcache/2_3/compiler_ast.o \
nimcache/2_3/collections_intsets.o \
nimcache/2_3/compiler_idgen.o \
nimcache/2_3/compiler_astalgo.o \
nimcache/2_3/compiler_rodutils.o \
nimcache/2_3/compiler_syntaxes.o \
nimcache/2_3/compiler_parser.o \
nimcache/2_3/compiler_pbraces.o \
nimcache/2_3/compiler_filters.o \
nimcache/2_3/compiler_renderer.o \
nimcache/2_3/compiler_filter_tmpl.o \
nimcache/2_3/compiler_rodread.o \
nimcache/2_3/compiler_types.o \
nimcache/2_3/compiler_trees.o \
nimcache/2_3/pure_memfiles.o \
nimcache/2_3/compiler_rodwrite.o \
nimcache/2_3/compiler_passes.o \
nimcache/2_3/compiler_magicsys.o \
nimcache/2_3/compiler_nimsets.o \
nimcache/2_3/compiler_bitsets.o \
nimcache/2_3/compiler_semthreads.o \
nimcache/2_3/compiler_importer.o \
nimcache/2_3/compiler_lookups.o \
nimcache/2_3/compiler_semdata.o \
nimcache/2_3/compiler_treetab.o \
nimcache/2_3/compiler_evals.o \
nimcache/2_3/compiler_semfold.o \
nimcache/2_3/compiler_saturate.o \
nimcache/2_3/compiler_transf.o \
nimcache/2_3/compiler_cgmeth.o \
nimcache/2_3/compiler_sempass2.o \
nimcache/2_3/compiler_guards.o \
nimcache/2_3/compiler_lambdalifting.o \
nimcache/2_3/compiler_evaltempl.o \
nimcache/2_3/compiler_sem.o \
nimcache/2_3/compiler_procfind.o \
nimcache/2_3/compiler_pragmas.o \
nimcache/2_3/compiler_semtypinst.o \
nimcache/2_3/compiler_sigmatch.o \
nimcache/2_3/compiler_parampatterns.o \
nimcache/2_3/compiler_docgen.o \
nimcache/2_3/docutils_rstast.o \
nimcache/2_3/docutils_rst.o \
nimcache/2_3/docutils_rstgen.o \
nimcache/2_3/docutils_highlite.o \
nimcache/2_3/pure_json.o \
nimcache/2_3/pure_lexbase.o \
nimcache/2_3/pure_unicode.o \
nimcache/2_3/pure_algorithm.o \
nimcache/2_3/collections_sequtils.o \
nimcache/2_3/compiler_aliases.o \
nimcache/2_3/compiler_patterns.o \
nimcache/2_3/compiler_cgen.o \
nimcache/2_3/compiler_ccgutils.o \
nimcache/2_3/compiler_cgendata.o \
nimcache/2_3/compiler_ccgmerge.o \
nimcache/2_3/compiler_jsgen.o \
nimcache/2_3/compiler_passaux.o \
nimcache/2_3/compiler_depends.o \
nimcache/2_3/compiler_docgen2.o \
nimcache/2_3/compiler_service.o \
nimcache/2_3/pure_parseopt.o \
nimcache/2_3/compiler_modules.o \
nimcache/2_3/compiler_pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
nimcache/2_3/compiler_nimrod.o \
nimcache/2_3/Nimrod_system.o \
nimcache/2_3/compiler_testability.o \
nimcache/2_3/compiler_commands.o \
nimcache/2_3/pure_os.o \
nimcache/2_3/pure_strutils.o \
nimcache/2_3/pure_parseutils.o \
nimcache/2_3/pure_times.o \
nimcache/2_3/posix_posix.o \
nimcache/2_3/compiler_msgs.o \
nimcache/2_3/compiler_options.o \
nimcache/2_3/compiler_lists.o \
nimcache/2_3/pure_strtabs.o \
nimcache/2_3/pure_hashes.o \
nimcache/2_3/collections_tables.o \
nimcache/2_3/pure_math.o \
nimcache/2_3/compiler_ropes.o \
nimcache/2_3/compiler_platform.o \
nimcache/2_3/compiler_crc.o \
nimcache/2_3/pure_sockets.o \
nimcache/2_3/core_unsigned.o \
nimcache/2_3/compiler_nversion.o \
nimcache/2_3/compiler_condsyms.o \
nimcache/2_3/compiler_idents.o \
nimcache/2_3/compiler_extccomp.o \
nimcache/2_3/pure_osproc.o \
nimcache/2_3/pure_streams.o \
nimcache/2_3/compiler_wordrecg.o \
nimcache/2_3/compiler_babelcmd.o \
nimcache/2_3/compiler_lexer.o \
nimcache/2_3/compiler_nimlexbase.o \
nimcache/2_3/compiler_llstream.o \
nimcache/2_3/compiler_nimconf.o \
nimcache/2_3/compiler_main.o \
nimcache/2_3/compiler_ast.o \
nimcache/2_3/collections_intsets.o \
nimcache/2_3/compiler_idgen.o \
nimcache/2_3/compiler_astalgo.o \
nimcache/2_3/compiler_rodutils.o \
nimcache/2_3/compiler_syntaxes.o \
nimcache/2_3/compiler_parser.o \
nimcache/2_3/compiler_pbraces.o \
nimcache/2_3/compiler_filters.o \
nimcache/2_3/compiler_renderer.o \
nimcache/2_3/compiler_filter_tmpl.o \
nimcache/2_3/compiler_rodread.o \
nimcache/2_3/compiler_types.o \
nimcache/2_3/compiler_trees.o \
nimcache/2_3/pure_memfiles.o \
nimcache/2_3/compiler_rodwrite.o \
nimcache/2_3/compiler_passes.o \
nimcache/2_3/compiler_magicsys.o \
nimcache/2_3/compiler_nimsets.o \
nimcache/2_3/compiler_bitsets.o \
nimcache/2_3/compiler_semthreads.o \
nimcache/2_3/compiler_importer.o \
nimcache/2_3/compiler_lookups.o \
nimcache/2_3/compiler_semdata.o \
nimcache/2_3/compiler_treetab.o \
nimcache/2_3/compiler_evals.o \
nimcache/2_3/compiler_semfold.o \
nimcache/2_3/compiler_saturate.o \
nimcache/2_3/compiler_transf.o \
nimcache/2_3/compiler_cgmeth.o \
nimcache/2_3/compiler_sempass2.o \
nimcache/2_3/compiler_guards.o \
nimcache/2_3/compiler_lambdalifting.o \
nimcache/2_3/compiler_evaltempl.o \
nimcache/2_3/compiler_sem.o \
nimcache/2_3/compiler_procfind.o \
nimcache/2_3/compiler_pragmas.o \
nimcache/2_3/compiler_semtypinst.o \
nimcache/2_3/compiler_sigmatch.o \
nimcache/2_3/compiler_parampatterns.o \
nimcache/2_3/compiler_docgen.o \
nimcache/2_3/docutils_rstast.o \
nimcache/2_3/docutils_rst.o \
nimcache/2_3/docutils_rstgen.o \
nimcache/2_3/docutils_highlite.o \
nimcache/2_3/pure_json.o \
nimcache/2_3/pure_lexbase.o \
nimcache/2_3/pure_unicode.o \
nimcache/2_3/pure_algorithm.o \
nimcache/2_3/collections_sequtils.o \
nimcache/2_3/compiler_aliases.o \
nimcache/2_3/compiler_patterns.o \
nimcache/2_3/compiler_cgen.o \
nimcache/2_3/compiler_ccgutils.o \
nimcache/2_3/compiler_cgendata.o \
nimcache/2_3/compiler_ccgmerge.o \
nimcache/2_3/compiler_jsgen.o \
nimcache/2_3/compiler_passaux.o \
nimcache/2_3/compiler_depends.o \
nimcache/2_3/compiler_docgen2.o \
nimcache/2_3/compiler_service.o \
nimcache/2_3/pure_parseopt.o \
nimcache/2_3/compiler_modules.o \
nimcache/2_3/compiler_pretty.o $LINK_FLAGS
    ;;
  arm)
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_nimrod.c -o nimcache/2_4/compiler_nimrod.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_nimrod.c -o nimcache/2_4/compiler_nimrod.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/Nimrod_system.c -o nimcache/2_4/Nimrod_system.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/Nimrod_system.c -o nimcache/2_4/Nimrod_system.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_testability.c -o nimcache/2_4/compiler_testability.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_testability.c -o nimcache/2_4/compiler_testability.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_commands.c -o nimcache/2_4/compiler_commands.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_commands.c -o nimcache/2_4/compiler_commands.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_os.c -o nimcache/2_4/pure_os.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_os.c -o nimcache/2_4/pure_os.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_strutils.c -o nimcache/2_4/pure_strutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_strutils.c -o nimcache/2_4/pure_strutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_parseutils.c -o nimcache/2_4/pure_parseutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_parseutils.c -o nimcache/2_4/pure_parseutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_times.c -o nimcache/2_4/pure_times.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_times.c -o nimcache/2_4/pure_times.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/posix_posix.c -o nimcache/2_4/posix_posix.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/posix_posix.c -o nimcache/2_4/posix_posix.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_msgs.c -o nimcache/2_4/compiler_msgs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_msgs.c -o nimcache/2_4/compiler_msgs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_options.c -o nimcache/2_4/compiler_options.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_options.c -o nimcache/2_4/compiler_options.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_lists.c -o nimcache/2_4/compiler_lists.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_lists.c -o nimcache/2_4/compiler_lists.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_strtabs.c -o nimcache/2_4/pure_strtabs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_strtabs.c -o nimcache/2_4/pure_strtabs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_hashes.c -o nimcache/2_4/pure_hashes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_hashes.c -o nimcache/2_4/pure_hashes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/collections_tables.c -o nimcache/2_4/collections_tables.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/collections_tables.c -o nimcache/2_4/collections_tables.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_math.c -o nimcache/2_4/pure_math.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_math.c -o nimcache/2_4/pure_math.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_ropes.c -o nimcache/2_4/compiler_ropes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_ropes.c -o nimcache/2_4/compiler_ropes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_platform.c -o nimcache/2_4/compiler_platform.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_platform.c -o nimcache/2_4/compiler_platform.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_crc.c -o nimcache/2_4/compiler_crc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_crc.c -o nimcache/2_4/compiler_crc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_sockets.c -o nimcache/2_4/pure_sockets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_sockets.c -o nimcache/2_4/pure_sockets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/core_unsigned.c -o nimcache/2_4/core_unsigned.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/core_unsigned.c -o nimcache/2_4/core_unsigned.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_nversion.c -o nimcache/2_4/compiler_nversion.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_nversion.c -o nimcache/2_4/compiler_nversion.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_condsyms.c -o nimcache/2_4/compiler_condsyms.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_condsyms.c -o nimcache/2_4/compiler_condsyms.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_idents.c -o nimcache/2_4/compiler_idents.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_idents.c -o nimcache/2_4/compiler_idents.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_extccomp.c -o nimcache/2_4/compiler_extccomp.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_extccomp.c -o nimcache/2_4/compiler_extccomp.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_osproc.c -o nimcache/2_4/pure_osproc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_osproc.c -o nimcache/2_4/pure_osproc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_streams.c -o nimcache/2_4/pure_streams.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_streams.c -o nimcache/2_4/pure_streams.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_wordrecg.c -o nimcache/2_4/compiler_wordrecg.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_wordrecg.c -o nimcache/2_4/compiler_wordrecg.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_babelcmd.c -o nimcache/2_4/compiler_babelcmd.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_babelcmd.c -o nimcache/2_4/compiler_babelcmd.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_lexer.c -o nimcache/2_4/compiler_lexer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_lexer.c -o nimcache/2_4/compiler_lexer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_nimlexbase.c -o nimcache/2_4/compiler_nimlexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_nimlexbase.c -o nimcache/2_4/compiler_nimlexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_llstream.c -o nimcache/2_4/compiler_llstream.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_llstream.c -o nimcache/2_4/compiler_llstream.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_nimconf.c -o nimcache/2_4/compiler_nimconf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_nimconf.c -o nimcache/2_4/compiler_nimconf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_main.c -o nimcache/2_4/compiler_main.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_main.c -o nimcache/2_4/compiler_main.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_ast.c -o nimcache/2_4/compiler_ast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_ast.c -o nimcache/2_4/compiler_ast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/collections_intsets.c -o nimcache/2_4/collections_intsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/collections_intsets.c -o nimcache/2_4/collections_intsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_idgen.c -o nimcache/2_4/compiler_idgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_idgen.c -o nimcache/2_4/compiler_idgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_astalgo.c -o nimcache/2_4/compiler_astalgo.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_astalgo.c -o nimcache/2_4/compiler_astalgo.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_rodutils.c -o nimcache/2_4/compiler_rodutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_rodutils.c -o nimcache/2_4/compiler_rodutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_syntaxes.c -o nimcache/2_4/compiler_syntaxes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_syntaxes.c -o nimcache/2_4/compiler_syntaxes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_parser.c -o nimcache/2_4/compiler_parser.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_parser.c -o nimcache/2_4/compiler_parser.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_pbraces.c -o nimcache/2_4/compiler_pbraces.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_pbraces.c -o nimcache/2_4/compiler_pbraces.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_filters.c -o nimcache/2_4/compiler_filters.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_filters.c -o nimcache/2_4/compiler_filters.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_renderer.c -o nimcache/2_4/compiler_renderer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_renderer.c -o nimcache/2_4/compiler_renderer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_filter_tmpl.c -o nimcache/2_4/compiler_filter_tmpl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_filter_tmpl.c -o nimcache/2_4/compiler_filter_tmpl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_rodread.c -o nimcache/2_4/compiler_rodread.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_rodread.c -o nimcache/2_4/compiler_rodread.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_types.c -o nimcache/2_4/compiler_types.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_types.c -o nimcache/2_4/compiler_types.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_trees.c -o nimcache/2_4/compiler_trees.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_trees.c -o nimcache/2_4/compiler_trees.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_memfiles.c -o nimcache/2_4/pure_memfiles.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_memfiles.c -o nimcache/2_4/pure_memfiles.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_rodwrite.c -o nimcache/2_4/compiler_rodwrite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_rodwrite.c -o nimcache/2_4/compiler_rodwrite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_passes.c -o nimcache/2_4/compiler_passes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_passes.c -o nimcache/2_4/compiler_passes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_magicsys.c -o nimcache/2_4/compiler_magicsys.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_magicsys.c -o nimcache/2_4/compiler_magicsys.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_nimsets.c -o nimcache/2_4/compiler_nimsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_nimsets.c -o nimcache/2_4/compiler_nimsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_bitsets.c -o nimcache/2_4/compiler_bitsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_bitsets.c -o nimcache/2_4/compiler_bitsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_semthreads.c -o nimcache/2_4/compiler_semthreads.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_semthreads.c -o nimcache/2_4/compiler_semthreads.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_importer.c -o nimcache/2_4/compiler_importer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_importer.c -o nimcache/2_4/compiler_importer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_lookups.c -o nimcache/2_4/compiler_lookups.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_lookups.c -o nimcache/2_4/compiler_lookups.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_semdata.c -o nimcache/2_4/compiler_semdata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_semdata.c -o nimcache/2_4/compiler_semdata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_treetab.c -o nimcache/2_4/compiler_treetab.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_treetab.c -o nimcache/2_4/compiler_treetab.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_evals.c -o nimcache/2_4/compiler_evals.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_evals.c -o nimcache/2_4/compiler_evals.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_semfold.c -o nimcache/2_4/compiler_semfold.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_semfold.c -o nimcache/2_4/compiler_semfold.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_saturate.c -o nimcache/2_4/compiler_saturate.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_saturate.c -o nimcache/2_4/compiler_saturate.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_transf.c -o nimcache/2_4/compiler_transf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_transf.c -o nimcache/2_4/compiler_transf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_cgmeth.c -o nimcache/2_4/compiler_cgmeth.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_cgmeth.c -o nimcache/2_4/compiler_cgmeth.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_sempass2.c -o nimcache/2_4/compiler_sempass2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_sempass2.c -o nimcache/2_4/compiler_sempass2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_guards.c -o nimcache/2_4/compiler_guards.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_guards.c -o nimcache/2_4/compiler_guards.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_lambdalifting.c -o nimcache/2_4/compiler_lambdalifting.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_lambdalifting.c -o nimcache/2_4/compiler_lambdalifting.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_evaltempl.c -o nimcache/2_4/compiler_evaltempl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_evaltempl.c -o nimcache/2_4/compiler_evaltempl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_sem.c -o nimcache/2_4/compiler_sem.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_sem.c -o nimcache/2_4/compiler_sem.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_procfind.c -o nimcache/2_4/compiler_procfind.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_procfind.c -o nimcache/2_4/compiler_procfind.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_pragmas.c -o nimcache/2_4/compiler_pragmas.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_pragmas.c -o nimcache/2_4/compiler_pragmas.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_semtypinst.c -o nimcache/2_4/compiler_semtypinst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_semtypinst.c -o nimcache/2_4/compiler_semtypinst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_sigmatch.c -o nimcache/2_4/compiler_sigmatch.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_sigmatch.c -o nimcache/2_4/compiler_sigmatch.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_parampatterns.c -o nimcache/2_4/compiler_parampatterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_parampatterns.c -o nimcache/2_4/compiler_parampatterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_docgen.c -o nimcache/2_4/compiler_docgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_docgen.c -o nimcache/2_4/compiler_docgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/docutils_rstast.c -o nimcache/2_4/docutils_rstast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/docutils_rstast.c -o nimcache/2_4/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/docutils_rst.c -o nimcache/2_4/docutils_rst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/docutils_rst.c -o nimcache/2_4/docutils_rst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/docutils_rstgen.c -o nimcache/2_4/docutils_rstgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/docutils_rstgen.c -o nimcache/2_4/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/docutils_highlite.c -o nimcache/2_4/docutils_highlite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/docutils_highlite.c -o nimcache/2_4/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_json.c -o nimcache/2_4/pure_json.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_json.c -o nimcache/2_4/pure_json.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_lexbase.c -o nimcache/2_4/pure_lexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_lexbase.c -o nimcache/2_4/pure_lexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_unicode.c -o nimcache/2_4/pure_unicode.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_unicode.c -o nimcache/2_4/pure_unicode.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_algorithm.c -o nimcache/2_4/pure_algorithm.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_algorithm.c -o nimcache/2_4/pure_algorithm.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/collections_sequtils.c -o nimcache/2_4/collections_sequtils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/collections_sequtils.c -o nimcache/2_4/collections_sequtils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_aliases.c -o nimcache/2_4/compiler_aliases.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_aliases.c -o nimcache/2_4/compiler_aliases.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_patterns.c -o nimcache/2_4/compiler_patterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_patterns.c -o nimcache/2_4/compiler_patterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_cgen.c -o nimcache/2_4/compiler_cgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_cgen.c -o nimcache/2_4/compiler_cgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_ccgutils.c -o nimcache/2_4/compiler_ccgutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_ccgutils.c -o nimcache/2_4/compiler_ccgutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_cgendata.c -o nimcache/2_4/compiler_cgendata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_cgendata.c -o nimcache/2_4/compiler_cgendata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_ccgmerge.c -o nimcache/2_4/compiler_ccgmerge.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_ccgmerge.c -o nimcache/2_4/compiler_ccgmerge.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_jsgen.c -o nimcache/2_4/compiler_jsgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_jsgen.c -o nimcache/2_4/compiler_jsgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_passaux.c -o nimcache/2_4/compiler_passaux.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_passaux.c -o nimcache/2_4/compiler_passaux.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_depends.c -o nimcache/2_4/compiler_depends.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_depends.c -o nimcache/2_4/compiler_depends.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_docgen2.c -o nimcache/2_4/compiler_docgen2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_docgen2.c -o nimcache/2_4/compiler_docgen2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_service.c -o nimcache/2_4/compiler_service.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_service.c -o nimcache/2_4/compiler_service.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_parseopt.c -o nimcache/2_4/pure_parseopt.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/pure_parseopt.c -o nimcache/2_4/pure_parseopt.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_modules.c -o nimcache/2_4/compiler_modules.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_modules.c -o nimcache/2_4/compiler_modules.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_pretty.c -o nimcache/2_4/compiler_pretty.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_4/compiler_pretty.c -o nimcache/2_4/compiler_pretty.o
    echo "$LINKER -o $binDir/nimrod  \
nimcache/2_4/compiler_nimrod.o \
nimcache/2_4/Nimrod_system.o \
nimcache/2_4/compiler_testability.o \
nimcache/2_4/compiler_commands.o \
nimcache/2_4/pure_os.o \
nimcache/2_4/pure_strutils.o \
nimcache/2_4/pure_parseutils.o \
nimcache/2_4/pure_times.o \
nimcache/2_4/posix_posix.o \
nimcache/2_4/compiler_msgs.o \
nimcache/2_4/compiler_options.o \
nimcache/2_4/compiler_lists.o \
nimcache/2_4/pure_strtabs.o \
nimcache/2_4/pure_hashes.o \
nimcache/2_4/collections_tables.o \
nimcache/2_4/pure_math.o \
nimcache/2_4/compiler_ropes.o \
nimcache/2_4/compiler_platform.o \
nimcache/2_4/compiler_crc.o \
nimcache/2_4/pure_sockets.o \
nimcache/2_4/core_unsigned.o \
nimcache/2_4/compiler_nversion.o \
nimcache/2_4/compiler_condsyms.o \
nimcache/2_4/compiler_idents.o \
nimcache/2_4/compiler_extccomp.o \
nimcache/2_4/pure_osproc.o \
nimcache/2_4/pure_streams.o \
nimcache/2_4/compiler_wordrecg.o \
nimcache/2_4/compiler_babelcmd.o \
nimcache/2_4/compiler_lexer.o \
nimcache/2_4/compiler_nimlexbase.o \
nimcache/2_4/compiler_llstream.o \
nimcache/2_4/compiler_nimconf.o \
nimcache/2_4/compiler_main.o \
nimcache/2_4/compiler_ast.o \
nimcache/2_4/collections_intsets.o \
nimcache/2_4/compiler_idgen.o \
nimcache/2_4/compiler_astalgo.o \
nimcache/2_4/compiler_rodutils.o \
nimcache/2_4/compiler_syntaxes.o \
nimcache/2_4/compiler_parser.o \
nimcache/2_4/compiler_pbraces.o \
nimcache/2_4/compiler_filters.o \
nimcache/2_4/compiler_renderer.o \
nimcache/2_4/compiler_filter_tmpl.o \
nimcache/2_4/compiler_rodread.o \
nimcache/2_4/compiler_types.o \
nimcache/2_4/compiler_trees.o \
nimcache/2_4/pure_memfiles.o \
nimcache/2_4/compiler_rodwrite.o \
nimcache/2_4/compiler_passes.o \
nimcache/2_4/compiler_magicsys.o \
nimcache/2_4/compiler_nimsets.o \
nimcache/2_4/compiler_bitsets.o \
nimcache/2_4/compiler_semthreads.o \
nimcache/2_4/compiler_importer.o \
nimcache/2_4/compiler_lookups.o \
nimcache/2_4/compiler_semdata.o \
nimcache/2_4/compiler_treetab.o \
nimcache/2_4/compiler_evals.o \
nimcache/2_4/compiler_semfold.o \
nimcache/2_4/compiler_saturate.o \
nimcache/2_4/compiler_transf.o \
nimcache/2_4/compiler_cgmeth.o \
nimcache/2_4/compiler_sempass2.o \
nimcache/2_4/compiler_guards.o \
nimcache/2_4/compiler_lambdalifting.o \
nimcache/2_4/compiler_evaltempl.o \
nimcache/2_4/compiler_sem.o \
nimcache/2_4/compiler_procfind.o \
nimcache/2_4/compiler_pragmas.o \
nimcache/2_4/compiler_semtypinst.o \
nimcache/2_4/compiler_sigmatch.o \
nimcache/2_4/compiler_parampatterns.o \
nimcache/2_4/compiler_docgen.o \
nimcache/2_4/docutils_rstast.o \
nimcache/2_4/docutils_rst.o \
nimcache/2_4/docutils_rstgen.o \
nimcache/2_4/docutils_highlite.o \
nimcache/2_4/pure_json.o \
nimcache/2_4/pure_lexbase.o \
nimcache/2_4/pure_unicode.o \
nimcache/2_4/pure_algorithm.o \
nimcache/2_4/collections_sequtils.o \
nimcache/2_4/compiler_aliases.o \
nimcache/2_4/compiler_patterns.o \
nimcache/2_4/compiler_cgen.o \
nimcache/2_4/compiler_ccgutils.o \
nimcache/2_4/compiler_cgendata.o \
nimcache/2_4/compiler_ccgmerge.o \
nimcache/2_4/compiler_jsgen.o \
nimcache/2_4/compiler_passaux.o \
nimcache/2_4/compiler_depends.o \
nimcache/2_4/compiler_docgen2.o \
nimcache/2_4/compiler_service.o \
nimcache/2_4/pure_parseopt.o \
nimcache/2_4/compiler_modules.o \
nimcache/2_4/compiler_pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
nimcache/2_4/compiler_nimrod.o \
nimcache/2_4/Nimrod_system.o \
nimcache/2_4/compiler_testability.o \
nimcache/2_4/compiler_commands.o \
nimcache/2_4/pure_os.o \
nimcache/2_4/pure_strutils.o \
nimcache/2_4/pure_parseutils.o \
nimcache/2_4/pure_times.o \
nimcache/2_4/posix_posix.o \
nimcache/2_4/compiler_msgs.o \
nimcache/2_4/compiler_options.o \
nimcache/2_4/compiler_lists.o \
nimcache/2_4/pure_strtabs.o \
nimcache/2_4/pure_hashes.o \
nimcache/2_4/collections_tables.o \
nimcache/2_4/pure_math.o \
nimcache/2_4/compiler_ropes.o \
nimcache/2_4/compiler_platform.o \
nimcache/2_4/compiler_crc.o \
nimcache/2_4/pure_sockets.o \
nimcache/2_4/core_unsigned.o \
nimcache/2_4/compiler_nversion.o \
nimcache/2_4/compiler_condsyms.o \
nimcache/2_4/compiler_idents.o \
nimcache/2_4/compiler_extccomp.o \
nimcache/2_4/pure_osproc.o \
nimcache/2_4/pure_streams.o \
nimcache/2_4/compiler_wordrecg.o \
nimcache/2_4/compiler_babelcmd.o \
nimcache/2_4/compiler_lexer.o \
nimcache/2_4/compiler_nimlexbase.o \
nimcache/2_4/compiler_llstream.o \
nimcache/2_4/compiler_nimconf.o \
nimcache/2_4/compiler_main.o \
nimcache/2_4/compiler_ast.o \
nimcache/2_4/collections_intsets.o \
nimcache/2_4/compiler_idgen.o \
nimcache/2_4/compiler_astalgo.o \
nimcache/2_4/compiler_rodutils.o \
nimcache/2_4/compiler_syntaxes.o \
nimcache/2_4/compiler_parser.o \
nimcache/2_4/compiler_pbraces.o \
nimcache/2_4/compiler_filters.o \
nimcache/2_4/compiler_renderer.o \
nimcache/2_4/compiler_filter_tmpl.o \
nimcache/2_4/compiler_rodread.o \
nimcache/2_4/compiler_types.o \
nimcache/2_4/compiler_trees.o \
nimcache/2_4/pure_memfiles.o \
nimcache/2_4/compiler_rodwrite.o \
nimcache/2_4/compiler_passes.o \
nimcache/2_4/compiler_magicsys.o \
nimcache/2_4/compiler_nimsets.o \
nimcache/2_4/compiler_bitsets.o \
nimcache/2_4/compiler_semthreads.o \
nimcache/2_4/compiler_importer.o \
nimcache/2_4/compiler_lookups.o \
nimcache/2_4/compiler_semdata.o \
nimcache/2_4/compiler_treetab.o \
nimcache/2_4/compiler_evals.o \
nimcache/2_4/compiler_semfold.o \
nimcache/2_4/compiler_saturate.o \
nimcache/2_4/compiler_transf.o \
nimcache/2_4/compiler_cgmeth.o \
nimcache/2_4/compiler_sempass2.o \
nimcache/2_4/compiler_guards.o \
nimcache/2_4/compiler_lambdalifting.o \
nimcache/2_4/compiler_evaltempl.o \
nimcache/2_4/compiler_sem.o \
nimcache/2_4/compiler_procfind.o \
nimcache/2_4/compiler_pragmas.o \
nimcache/2_4/compiler_semtypinst.o \
nimcache/2_4/compiler_sigmatch.o \
nimcache/2_4/compiler_parampatterns.o \
nimcache/2_4/compiler_docgen.o \
nimcache/2_4/docutils_rstast.o \
nimcache/2_4/docutils_rst.o \
nimcache/2_4/docutils_rstgen.o \
nimcache/2_4/docutils_highlite.o \
nimcache/2_4/pure_json.o \
nimcache/2_4/pure_lexbase.o \
nimcache/2_4/pure_unicode.o \
nimcache/2_4/pure_algorithm.o \
nimcache/2_4/collections_sequtils.o \
nimcache/2_4/compiler_aliases.o \
nimcache/2_4/compiler_patterns.o \
nimcache/2_4/compiler_cgen.o \
nimcache/2_4/compiler_ccgutils.o \
nimcache/2_4/compiler_cgendata.o \
nimcache/2_4/compiler_ccgmerge.o \
nimcache/2_4/compiler_jsgen.o \
nimcache/2_4/compiler_passaux.o \
nimcache/2_4/compiler_depends.o \
nimcache/2_4/compiler_docgen2.o \
nimcache/2_4/compiler_service.o \
nimcache/2_4/pure_parseopt.o \
nimcache/2_4/compiler_modules.o \
nimcache/2_4/compiler_pretty.o $LINK_FLAGS
    ;;
  sparc)
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_nimrod.c -o nimcache/2_5/compiler_nimrod.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_nimrod.c -o nimcache/2_5/compiler_nimrod.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/Nimrod_system.c -o nimcache/2_5/Nimrod_system.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/Nimrod_system.c -o nimcache/2_5/Nimrod_system.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_testability.c -o nimcache/2_5/compiler_testability.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_testability.c -o nimcache/2_5/compiler_testability.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_commands.c -o nimcache/2_5/compiler_commands.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_commands.c -o nimcache/2_5/compiler_commands.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_os.c -o nimcache/2_5/pure_os.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_os.c -o nimcache/2_5/pure_os.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_strutils.c -o nimcache/2_5/pure_strutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_strutils.c -o nimcache/2_5/pure_strutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_parseutils.c -o nimcache/2_5/pure_parseutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_parseutils.c -o nimcache/2_5/pure_parseutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_times.c -o nimcache/2_5/pure_times.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_times.c -o nimcache/2_5/pure_times.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/posix_posix.c -o nimcache/2_5/posix_posix.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/posix_posix.c -o nimcache/2_5/posix_posix.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_msgs.c -o nimcache/2_5/compiler_msgs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_msgs.c -o nimcache/2_5/compiler_msgs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_options.c -o nimcache/2_5/compiler_options.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_options.c -o nimcache/2_5/compiler_options.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_lists.c -o nimcache/2_5/compiler_lists.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_lists.c -o nimcache/2_5/compiler_lists.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_strtabs.c -o nimcache/2_5/pure_strtabs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_strtabs.c -o nimcache/2_5/pure_strtabs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_hashes.c -o nimcache/2_5/pure_hashes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_hashes.c -o nimcache/2_5/pure_hashes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/collections_tables.c -o nimcache/2_5/collections_tables.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/collections_tables.c -o nimcache/2_5/collections_tables.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_math.c -o nimcache/2_5/pure_math.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_math.c -o nimcache/2_5/pure_math.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_ropes.c -o nimcache/2_5/compiler_ropes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_ropes.c -o nimcache/2_5/compiler_ropes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_platform.c -o nimcache/2_5/compiler_platform.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_platform.c -o nimcache/2_5/compiler_platform.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_crc.c -o nimcache/2_5/compiler_crc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_crc.c -o nimcache/2_5/compiler_crc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_sockets.c -o nimcache/2_5/pure_sockets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_sockets.c -o nimcache/2_5/pure_sockets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/core_unsigned.c -o nimcache/2_5/core_unsigned.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/core_unsigned.c -o nimcache/2_5/core_unsigned.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_nversion.c -o nimcache/2_5/compiler_nversion.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_nversion.c -o nimcache/2_5/compiler_nversion.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_condsyms.c -o nimcache/2_5/compiler_condsyms.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_condsyms.c -o nimcache/2_5/compiler_condsyms.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_idents.c -o nimcache/2_5/compiler_idents.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_idents.c -o nimcache/2_5/compiler_idents.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_extccomp.c -o nimcache/2_5/compiler_extccomp.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_extccomp.c -o nimcache/2_5/compiler_extccomp.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_osproc.c -o nimcache/2_5/pure_osproc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_osproc.c -o nimcache/2_5/pure_osproc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_streams.c -o nimcache/2_5/pure_streams.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_streams.c -o nimcache/2_5/pure_streams.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_wordrecg.c -o nimcache/2_5/compiler_wordrecg.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_wordrecg.c -o nimcache/2_5/compiler_wordrecg.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_babelcmd.c -o nimcache/2_5/compiler_babelcmd.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_babelcmd.c -o nimcache/2_5/compiler_babelcmd.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_lexer.c -o nimcache/2_5/compiler_lexer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_lexer.c -o nimcache/2_5/compiler_lexer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_nimlexbase.c -o nimcache/2_5/compiler_nimlexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_nimlexbase.c -o nimcache/2_5/compiler_nimlexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_llstream.c -o nimcache/2_5/compiler_llstream.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_llstream.c -o nimcache/2_5/compiler_llstream.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_nimconf.c -o nimcache/2_5/compiler_nimconf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_nimconf.c -o nimcache/2_5/compiler_nimconf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_main.c -o nimcache/2_5/compiler_main.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_main.c -o nimcache/2_5/compiler_main.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_ast.c -o nimcache/2_5/compiler_ast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_ast.c -o nimcache/2_5/compiler_ast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/collections_intsets.c -o nimcache/2_5/collections_intsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/collections_intsets.c -o nimcache/2_5/collections_intsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_idgen.c -o nimcache/2_5/compiler_idgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_idgen.c -o nimcache/2_5/compiler_idgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_astalgo.c -o nimcache/2_5/compiler_astalgo.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_astalgo.c -o nimcache/2_5/compiler_astalgo.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_rodutils.c -o nimcache/2_5/compiler_rodutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_rodutils.c -o nimcache/2_5/compiler_rodutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_syntaxes.c -o nimcache/2_5/compiler_syntaxes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_syntaxes.c -o nimcache/2_5/compiler_syntaxes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_parser.c -o nimcache/2_5/compiler_parser.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_parser.c -o nimcache/2_5/compiler_parser.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_pbraces.c -o nimcache/2_5/compiler_pbraces.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_pbraces.c -o nimcache/2_5/compiler_pbraces.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_filters.c -o nimcache/2_5/compiler_filters.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_filters.c -o nimcache/2_5/compiler_filters.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_renderer.c -o nimcache/2_5/compiler_renderer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_renderer.c -o nimcache/2_5/compiler_renderer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_filter_tmpl.c -o nimcache/2_5/compiler_filter_tmpl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_filter_tmpl.c -o nimcache/2_5/compiler_filter_tmpl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_rodread.c -o nimcache/2_5/compiler_rodread.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_rodread.c -o nimcache/2_5/compiler_rodread.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_types.c -o nimcache/2_5/compiler_types.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_types.c -o nimcache/2_5/compiler_types.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_trees.c -o nimcache/2_5/compiler_trees.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_trees.c -o nimcache/2_5/compiler_trees.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_memfiles.c -o nimcache/2_5/pure_memfiles.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_memfiles.c -o nimcache/2_5/pure_memfiles.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_rodwrite.c -o nimcache/2_5/compiler_rodwrite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_rodwrite.c -o nimcache/2_5/compiler_rodwrite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_passes.c -o nimcache/2_5/compiler_passes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_passes.c -o nimcache/2_5/compiler_passes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_magicsys.c -o nimcache/2_5/compiler_magicsys.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_magicsys.c -o nimcache/2_5/compiler_magicsys.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_nimsets.c -o nimcache/2_5/compiler_nimsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_nimsets.c -o nimcache/2_5/compiler_nimsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_bitsets.c -o nimcache/2_5/compiler_bitsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_bitsets.c -o nimcache/2_5/compiler_bitsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_semthreads.c -o nimcache/2_5/compiler_semthreads.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_semthreads.c -o nimcache/2_5/compiler_semthreads.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_importer.c -o nimcache/2_5/compiler_importer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_importer.c -o nimcache/2_5/compiler_importer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_lookups.c -o nimcache/2_5/compiler_lookups.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_lookups.c -o nimcache/2_5/compiler_lookups.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_semdata.c -o nimcache/2_5/compiler_semdata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_semdata.c -o nimcache/2_5/compiler_semdata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_treetab.c -o nimcache/2_5/compiler_treetab.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_treetab.c -o nimcache/2_5/compiler_treetab.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_evals.c -o nimcache/2_5/compiler_evals.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_evals.c -o nimcache/2_5/compiler_evals.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_semfold.c -o nimcache/2_5/compiler_semfold.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_semfold.c -o nimcache/2_5/compiler_semfold.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_saturate.c -o nimcache/2_5/compiler_saturate.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_saturate.c -o nimcache/2_5/compiler_saturate.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_transf.c -o nimcache/2_5/compiler_transf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_transf.c -o nimcache/2_5/compiler_transf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_cgmeth.c -o nimcache/2_5/compiler_cgmeth.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_cgmeth.c -o nimcache/2_5/compiler_cgmeth.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_sempass2.c -o nimcache/2_5/compiler_sempass2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_sempass2.c -o nimcache/2_5/compiler_sempass2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_guards.c -o nimcache/2_5/compiler_guards.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_guards.c -o nimcache/2_5/compiler_guards.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_lambdalifting.c -o nimcache/2_5/compiler_lambdalifting.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_lambdalifting.c -o nimcache/2_5/compiler_lambdalifting.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_evaltempl.c -o nimcache/2_5/compiler_evaltempl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_evaltempl.c -o nimcache/2_5/compiler_evaltempl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_sem.c -o nimcache/2_5/compiler_sem.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_sem.c -o nimcache/2_5/compiler_sem.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_procfind.c -o nimcache/2_5/compiler_procfind.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_procfind.c -o nimcache/2_5/compiler_procfind.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_pragmas.c -o nimcache/2_5/compiler_pragmas.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_pragmas.c -o nimcache/2_5/compiler_pragmas.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_semtypinst.c -o nimcache/2_5/compiler_semtypinst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_semtypinst.c -o nimcache/2_5/compiler_semtypinst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_sigmatch.c -o nimcache/2_5/compiler_sigmatch.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_sigmatch.c -o nimcache/2_5/compiler_sigmatch.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_parampatterns.c -o nimcache/2_5/compiler_parampatterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_parampatterns.c -o nimcache/2_5/compiler_parampatterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_docgen.c -o nimcache/2_5/compiler_docgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_docgen.c -o nimcache/2_5/compiler_docgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/docutils_rstast.c -o nimcache/2_5/docutils_rstast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/docutils_rstast.c -o nimcache/2_5/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/docutils_rst.c -o nimcache/2_5/docutils_rst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/docutils_rst.c -o nimcache/2_5/docutils_rst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/docutils_rstgen.c -o nimcache/2_5/docutils_rstgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/docutils_rstgen.c -o nimcache/2_5/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/docutils_highlite.c -o nimcache/2_5/docutils_highlite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/docutils_highlite.c -o nimcache/2_5/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_json.c -o nimcache/2_5/pure_json.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_json.c -o nimcache/2_5/pure_json.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_lexbase.c -o nimcache/2_5/pure_lexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_lexbase.c -o nimcache/2_5/pure_lexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_unicode.c -o nimcache/2_5/pure_unicode.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_unicode.c -o nimcache/2_5/pure_unicode.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_algorithm.c -o nimcache/2_5/pure_algorithm.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_algorithm.c -o nimcache/2_5/pure_algorithm.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/collections_sequtils.c -o nimcache/2_5/collections_sequtils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/collections_sequtils.c -o nimcache/2_5/collections_sequtils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_aliases.c -o nimcache/2_5/compiler_aliases.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_aliases.c -o nimcache/2_5/compiler_aliases.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_patterns.c -o nimcache/2_5/compiler_patterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_patterns.c -o nimcache/2_5/compiler_patterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_cgen.c -o nimcache/2_5/compiler_cgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_cgen.c -o nimcache/2_5/compiler_cgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_ccgutils.c -o nimcache/2_5/compiler_ccgutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_ccgutils.c -o nimcache/2_5/compiler_ccgutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_cgendata.c -o nimcache/2_5/compiler_cgendata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_cgendata.c -o nimcache/2_5/compiler_cgendata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_ccgmerge.c -o nimcache/2_5/compiler_ccgmerge.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_ccgmerge.c -o nimcache/2_5/compiler_ccgmerge.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_jsgen.c -o nimcache/2_5/compiler_jsgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_jsgen.c -o nimcache/2_5/compiler_jsgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_passaux.c -o nimcache/2_5/compiler_passaux.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_passaux.c -o nimcache/2_5/compiler_passaux.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_depends.c -o nimcache/2_5/compiler_depends.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_depends.c -o nimcache/2_5/compiler_depends.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_docgen2.c -o nimcache/2_5/compiler_docgen2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_docgen2.c -o nimcache/2_5/compiler_docgen2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_service.c -o nimcache/2_5/compiler_service.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_service.c -o nimcache/2_5/compiler_service.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_parseopt.c -o nimcache/2_5/pure_parseopt.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/pure_parseopt.c -o nimcache/2_5/pure_parseopt.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_modules.c -o nimcache/2_5/compiler_modules.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_modules.c -o nimcache/2_5/compiler_modules.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_pretty.c -o nimcache/2_5/compiler_pretty.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_5/compiler_pretty.c -o nimcache/2_5/compiler_pretty.o
    echo "$LINKER -o $binDir/nimrod  \
nimcache/2_5/compiler_nimrod.o \
nimcache/2_5/Nimrod_system.o \
nimcache/2_5/compiler_testability.o \
nimcache/2_5/compiler_commands.o \
nimcache/2_5/pure_os.o \
nimcache/2_5/pure_strutils.o \
nimcache/2_5/pure_parseutils.o \
nimcache/2_5/pure_times.o \
nimcache/2_5/posix_posix.o \
nimcache/2_5/compiler_msgs.o \
nimcache/2_5/compiler_options.o \
nimcache/2_5/compiler_lists.o \
nimcache/2_5/pure_strtabs.o \
nimcache/2_5/pure_hashes.o \
nimcache/2_5/collections_tables.o \
nimcache/2_5/pure_math.o \
nimcache/2_5/compiler_ropes.o \
nimcache/2_5/compiler_platform.o \
nimcache/2_5/compiler_crc.o \
nimcache/2_5/pure_sockets.o \
nimcache/2_5/core_unsigned.o \
nimcache/2_5/compiler_nversion.o \
nimcache/2_5/compiler_condsyms.o \
nimcache/2_5/compiler_idents.o \
nimcache/2_5/compiler_extccomp.o \
nimcache/2_5/pure_osproc.o \
nimcache/2_5/pure_streams.o \
nimcache/2_5/compiler_wordrecg.o \
nimcache/2_5/compiler_babelcmd.o \
nimcache/2_5/compiler_lexer.o \
nimcache/2_5/compiler_nimlexbase.o \
nimcache/2_5/compiler_llstream.o \
nimcache/2_5/compiler_nimconf.o \
nimcache/2_5/compiler_main.o \
nimcache/2_5/compiler_ast.o \
nimcache/2_5/collections_intsets.o \
nimcache/2_5/compiler_idgen.o \
nimcache/2_5/compiler_astalgo.o \
nimcache/2_5/compiler_rodutils.o \
nimcache/2_5/compiler_syntaxes.o \
nimcache/2_5/compiler_parser.o \
nimcache/2_5/compiler_pbraces.o \
nimcache/2_5/compiler_filters.o \
nimcache/2_5/compiler_renderer.o \
nimcache/2_5/compiler_filter_tmpl.o \
nimcache/2_5/compiler_rodread.o \
nimcache/2_5/compiler_types.o \
nimcache/2_5/compiler_trees.o \
nimcache/2_5/pure_memfiles.o \
nimcache/2_5/compiler_rodwrite.o \
nimcache/2_5/compiler_passes.o \
nimcache/2_5/compiler_magicsys.o \
nimcache/2_5/compiler_nimsets.o \
nimcache/2_5/compiler_bitsets.o \
nimcache/2_5/compiler_semthreads.o \
nimcache/2_5/compiler_importer.o \
nimcache/2_5/compiler_lookups.o \
nimcache/2_5/compiler_semdata.o \
nimcache/2_5/compiler_treetab.o \
nimcache/2_5/compiler_evals.o \
nimcache/2_5/compiler_semfold.o \
nimcache/2_5/compiler_saturate.o \
nimcache/2_5/compiler_transf.o \
nimcache/2_5/compiler_cgmeth.o \
nimcache/2_5/compiler_sempass2.o \
nimcache/2_5/compiler_guards.o \
nimcache/2_5/compiler_lambdalifting.o \
nimcache/2_5/compiler_evaltempl.o \
nimcache/2_5/compiler_sem.o \
nimcache/2_5/compiler_procfind.o \
nimcache/2_5/compiler_pragmas.o \
nimcache/2_5/compiler_semtypinst.o \
nimcache/2_5/compiler_sigmatch.o \
nimcache/2_5/compiler_parampatterns.o \
nimcache/2_5/compiler_docgen.o \
nimcache/2_5/docutils_rstast.o \
nimcache/2_5/docutils_rst.o \
nimcache/2_5/docutils_rstgen.o \
nimcache/2_5/docutils_highlite.o \
nimcache/2_5/pure_json.o \
nimcache/2_5/pure_lexbase.o \
nimcache/2_5/pure_unicode.o \
nimcache/2_5/pure_algorithm.o \
nimcache/2_5/collections_sequtils.o \
nimcache/2_5/compiler_aliases.o \
nimcache/2_5/compiler_patterns.o \
nimcache/2_5/compiler_cgen.o \
nimcache/2_5/compiler_ccgutils.o \
nimcache/2_5/compiler_cgendata.o \
nimcache/2_5/compiler_ccgmerge.o \
nimcache/2_5/compiler_jsgen.o \
nimcache/2_5/compiler_passaux.o \
nimcache/2_5/compiler_depends.o \
nimcache/2_5/compiler_docgen2.o \
nimcache/2_5/compiler_service.o \
nimcache/2_5/pure_parseopt.o \
nimcache/2_5/compiler_modules.o \
nimcache/2_5/compiler_pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
nimcache/2_5/compiler_nimrod.o \
nimcache/2_5/Nimrod_system.o \
nimcache/2_5/compiler_testability.o \
nimcache/2_5/compiler_commands.o \
nimcache/2_5/pure_os.o \
nimcache/2_5/pure_strutils.o \
nimcache/2_5/pure_parseutils.o \
nimcache/2_5/pure_times.o \
nimcache/2_5/posix_posix.o \
nimcache/2_5/compiler_msgs.o \
nimcache/2_5/compiler_options.o \
nimcache/2_5/compiler_lists.o \
nimcache/2_5/pure_strtabs.o \
nimcache/2_5/pure_hashes.o \
nimcache/2_5/collections_tables.o \
nimcache/2_5/pure_math.o \
nimcache/2_5/compiler_ropes.o \
nimcache/2_5/compiler_platform.o \
nimcache/2_5/compiler_crc.o \
nimcache/2_5/pure_sockets.o \
nimcache/2_5/core_unsigned.o \
nimcache/2_5/compiler_nversion.o \
nimcache/2_5/compiler_condsyms.o \
nimcache/2_5/compiler_idents.o \
nimcache/2_5/compiler_extccomp.o \
nimcache/2_5/pure_osproc.o \
nimcache/2_5/pure_streams.o \
nimcache/2_5/compiler_wordrecg.o \
nimcache/2_5/compiler_babelcmd.o \
nimcache/2_5/compiler_lexer.o \
nimcache/2_5/compiler_nimlexbase.o \
nimcache/2_5/compiler_llstream.o \
nimcache/2_5/compiler_nimconf.o \
nimcache/2_5/compiler_main.o \
nimcache/2_5/compiler_ast.o \
nimcache/2_5/collections_intsets.o \
nimcache/2_5/compiler_idgen.o \
nimcache/2_5/compiler_astalgo.o \
nimcache/2_5/compiler_rodutils.o \
nimcache/2_5/compiler_syntaxes.o \
nimcache/2_5/compiler_parser.o \
nimcache/2_5/compiler_pbraces.o \
nimcache/2_5/compiler_filters.o \
nimcache/2_5/compiler_renderer.o \
nimcache/2_5/compiler_filter_tmpl.o \
nimcache/2_5/compiler_rodread.o \
nimcache/2_5/compiler_types.o \
nimcache/2_5/compiler_trees.o \
nimcache/2_5/pure_memfiles.o \
nimcache/2_5/compiler_rodwrite.o \
nimcache/2_5/compiler_passes.o \
nimcache/2_5/compiler_magicsys.o \
nimcache/2_5/compiler_nimsets.o \
nimcache/2_5/compiler_bitsets.o \
nimcache/2_5/compiler_semthreads.o \
nimcache/2_5/compiler_importer.o \
nimcache/2_5/compiler_lookups.o \
nimcache/2_5/compiler_semdata.o \
nimcache/2_5/compiler_treetab.o \
nimcache/2_5/compiler_evals.o \
nimcache/2_5/compiler_semfold.o \
nimcache/2_5/compiler_saturate.o \
nimcache/2_5/compiler_transf.o \
nimcache/2_5/compiler_cgmeth.o \
nimcache/2_5/compiler_sempass2.o \
nimcache/2_5/compiler_guards.o \
nimcache/2_5/compiler_lambdalifting.o \
nimcache/2_5/compiler_evaltempl.o \
nimcache/2_5/compiler_sem.o \
nimcache/2_5/compiler_procfind.o \
nimcache/2_5/compiler_pragmas.o \
nimcache/2_5/compiler_semtypinst.o \
nimcache/2_5/compiler_sigmatch.o \
nimcache/2_5/compiler_parampatterns.o \
nimcache/2_5/compiler_docgen.o \
nimcache/2_5/docutils_rstast.o \
nimcache/2_5/docutils_rst.o \
nimcache/2_5/docutils_rstgen.o \
nimcache/2_5/docutils_highlite.o \
nimcache/2_5/pure_json.o \
nimcache/2_5/pure_lexbase.o \
nimcache/2_5/pure_unicode.o \
nimcache/2_5/pure_algorithm.o \
nimcache/2_5/collections_sequtils.o \
nimcache/2_5/compiler_aliases.o \
nimcache/2_5/compiler_patterns.o \
nimcache/2_5/compiler_cgen.o \
nimcache/2_5/compiler_ccgutils.o \
nimcache/2_5/compiler_cgendata.o \
nimcache/2_5/compiler_ccgmerge.o \
nimcache/2_5/compiler_jsgen.o \
nimcache/2_5/compiler_passaux.o \
nimcache/2_5/compiler_depends.o \
nimcache/2_5/compiler_docgen2.o \
nimcache/2_5/compiler_service.o \
nimcache/2_5/pure_parseopt.o \
nimcache/2_5/compiler_modules.o \
nimcache/2_5/compiler_pretty.o $LINK_FLAGS
    ;;
  mips)
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_nimrod.c -o nimcache/2_6/compiler_nimrod.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_nimrod.c -o nimcache/2_6/compiler_nimrod.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/Nimrod_system.c -o nimcache/2_6/Nimrod_system.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/Nimrod_system.c -o nimcache/2_6/Nimrod_system.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_testability.c -o nimcache/2_6/compiler_testability.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_testability.c -o nimcache/2_6/compiler_testability.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_commands.c -o nimcache/2_6/compiler_commands.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_commands.c -o nimcache/2_6/compiler_commands.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_os.c -o nimcache/2_6/pure_os.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_os.c -o nimcache/2_6/pure_os.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_strutils.c -o nimcache/2_6/pure_strutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_strutils.c -o nimcache/2_6/pure_strutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_parseutils.c -o nimcache/2_6/pure_parseutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_parseutils.c -o nimcache/2_6/pure_parseutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_times.c -o nimcache/2_6/pure_times.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_times.c -o nimcache/2_6/pure_times.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/posix_posix.c -o nimcache/2_6/posix_posix.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/posix_posix.c -o nimcache/2_6/posix_posix.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_msgs.c -o nimcache/2_6/compiler_msgs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_msgs.c -o nimcache/2_6/compiler_msgs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_options.c -o nimcache/2_6/compiler_options.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_options.c -o nimcache/2_6/compiler_options.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_lists.c -o nimcache/2_6/compiler_lists.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_lists.c -o nimcache/2_6/compiler_lists.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_strtabs.c -o nimcache/2_6/pure_strtabs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_strtabs.c -o nimcache/2_6/pure_strtabs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_hashes.c -o nimcache/2_6/pure_hashes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_hashes.c -o nimcache/2_6/pure_hashes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/collections_tables.c -o nimcache/2_6/collections_tables.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/collections_tables.c -o nimcache/2_6/collections_tables.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_math.c -o nimcache/2_6/pure_math.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_math.c -o nimcache/2_6/pure_math.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_ropes.c -o nimcache/2_6/compiler_ropes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_ropes.c -o nimcache/2_6/compiler_ropes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_platform.c -o nimcache/2_6/compiler_platform.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_platform.c -o nimcache/2_6/compiler_platform.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_crc.c -o nimcache/2_6/compiler_crc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_crc.c -o nimcache/2_6/compiler_crc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_sockets.c -o nimcache/2_6/pure_sockets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_sockets.c -o nimcache/2_6/pure_sockets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/core_unsigned.c -o nimcache/2_6/core_unsigned.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/core_unsigned.c -o nimcache/2_6/core_unsigned.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_nversion.c -o nimcache/2_6/compiler_nversion.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_nversion.c -o nimcache/2_6/compiler_nversion.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_condsyms.c -o nimcache/2_6/compiler_condsyms.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_condsyms.c -o nimcache/2_6/compiler_condsyms.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_idents.c -o nimcache/2_6/compiler_idents.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_idents.c -o nimcache/2_6/compiler_idents.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_extccomp.c -o nimcache/2_6/compiler_extccomp.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_extccomp.c -o nimcache/2_6/compiler_extccomp.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_osproc.c -o nimcache/2_6/pure_osproc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_osproc.c -o nimcache/2_6/pure_osproc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_streams.c -o nimcache/2_6/pure_streams.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_streams.c -o nimcache/2_6/pure_streams.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_wordrecg.c -o nimcache/2_6/compiler_wordrecg.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_wordrecg.c -o nimcache/2_6/compiler_wordrecg.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_babelcmd.c -o nimcache/2_6/compiler_babelcmd.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_babelcmd.c -o nimcache/2_6/compiler_babelcmd.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_lexer.c -o nimcache/2_6/compiler_lexer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_lexer.c -o nimcache/2_6/compiler_lexer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_nimlexbase.c -o nimcache/2_6/compiler_nimlexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_nimlexbase.c -o nimcache/2_6/compiler_nimlexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_llstream.c -o nimcache/2_6/compiler_llstream.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_llstream.c -o nimcache/2_6/compiler_llstream.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_nimconf.c -o nimcache/2_6/compiler_nimconf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_nimconf.c -o nimcache/2_6/compiler_nimconf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_main.c -o nimcache/2_6/compiler_main.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_main.c -o nimcache/2_6/compiler_main.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_ast.c -o nimcache/2_6/compiler_ast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_ast.c -o nimcache/2_6/compiler_ast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/collections_intsets.c -o nimcache/2_6/collections_intsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/collections_intsets.c -o nimcache/2_6/collections_intsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_idgen.c -o nimcache/2_6/compiler_idgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_idgen.c -o nimcache/2_6/compiler_idgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_astalgo.c -o nimcache/2_6/compiler_astalgo.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_astalgo.c -o nimcache/2_6/compiler_astalgo.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_rodutils.c -o nimcache/2_6/compiler_rodutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_rodutils.c -o nimcache/2_6/compiler_rodutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_syntaxes.c -o nimcache/2_6/compiler_syntaxes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_syntaxes.c -o nimcache/2_6/compiler_syntaxes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_parser.c -o nimcache/2_6/compiler_parser.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_parser.c -o nimcache/2_6/compiler_parser.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_pbraces.c -o nimcache/2_6/compiler_pbraces.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_pbraces.c -o nimcache/2_6/compiler_pbraces.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_filters.c -o nimcache/2_6/compiler_filters.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_filters.c -o nimcache/2_6/compiler_filters.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_renderer.c -o nimcache/2_6/compiler_renderer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_renderer.c -o nimcache/2_6/compiler_renderer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_filter_tmpl.c -o nimcache/2_6/compiler_filter_tmpl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_filter_tmpl.c -o nimcache/2_6/compiler_filter_tmpl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_rodread.c -o nimcache/2_6/compiler_rodread.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_rodread.c -o nimcache/2_6/compiler_rodread.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_types.c -o nimcache/2_6/compiler_types.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_types.c -o nimcache/2_6/compiler_types.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_trees.c -o nimcache/2_6/compiler_trees.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_trees.c -o nimcache/2_6/compiler_trees.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_memfiles.c -o nimcache/2_6/pure_memfiles.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_memfiles.c -o nimcache/2_6/pure_memfiles.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_rodwrite.c -o nimcache/2_6/compiler_rodwrite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_rodwrite.c -o nimcache/2_6/compiler_rodwrite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_passes.c -o nimcache/2_6/compiler_passes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_passes.c -o nimcache/2_6/compiler_passes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_magicsys.c -o nimcache/2_6/compiler_magicsys.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_magicsys.c -o nimcache/2_6/compiler_magicsys.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_nimsets.c -o nimcache/2_6/compiler_nimsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_nimsets.c -o nimcache/2_6/compiler_nimsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_bitsets.c -o nimcache/2_6/compiler_bitsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_bitsets.c -o nimcache/2_6/compiler_bitsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_semthreads.c -o nimcache/2_6/compiler_semthreads.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_semthreads.c -o nimcache/2_6/compiler_semthreads.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_importer.c -o nimcache/2_6/compiler_importer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_importer.c -o nimcache/2_6/compiler_importer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_lookups.c -o nimcache/2_6/compiler_lookups.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_lookups.c -o nimcache/2_6/compiler_lookups.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_semdata.c -o nimcache/2_6/compiler_semdata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_semdata.c -o nimcache/2_6/compiler_semdata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_treetab.c -o nimcache/2_6/compiler_treetab.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_treetab.c -o nimcache/2_6/compiler_treetab.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_evals.c -o nimcache/2_6/compiler_evals.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_evals.c -o nimcache/2_6/compiler_evals.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_semfold.c -o nimcache/2_6/compiler_semfold.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_semfold.c -o nimcache/2_6/compiler_semfold.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_saturate.c -o nimcache/2_6/compiler_saturate.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_saturate.c -o nimcache/2_6/compiler_saturate.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_transf.c -o nimcache/2_6/compiler_transf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_transf.c -o nimcache/2_6/compiler_transf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_cgmeth.c -o nimcache/2_6/compiler_cgmeth.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_cgmeth.c -o nimcache/2_6/compiler_cgmeth.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_sempass2.c -o nimcache/2_6/compiler_sempass2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_sempass2.c -o nimcache/2_6/compiler_sempass2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_guards.c -o nimcache/2_6/compiler_guards.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_guards.c -o nimcache/2_6/compiler_guards.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_lambdalifting.c -o nimcache/2_6/compiler_lambdalifting.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_lambdalifting.c -o nimcache/2_6/compiler_lambdalifting.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_evaltempl.c -o nimcache/2_6/compiler_evaltempl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_evaltempl.c -o nimcache/2_6/compiler_evaltempl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_sem.c -o nimcache/2_6/compiler_sem.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_sem.c -o nimcache/2_6/compiler_sem.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_procfind.c -o nimcache/2_6/compiler_procfind.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_procfind.c -o nimcache/2_6/compiler_procfind.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_pragmas.c -o nimcache/2_6/compiler_pragmas.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_pragmas.c -o nimcache/2_6/compiler_pragmas.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_semtypinst.c -o nimcache/2_6/compiler_semtypinst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_semtypinst.c -o nimcache/2_6/compiler_semtypinst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_sigmatch.c -o nimcache/2_6/compiler_sigmatch.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_sigmatch.c -o nimcache/2_6/compiler_sigmatch.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_parampatterns.c -o nimcache/2_6/compiler_parampatterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_parampatterns.c -o nimcache/2_6/compiler_parampatterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_docgen.c -o nimcache/2_6/compiler_docgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_docgen.c -o nimcache/2_6/compiler_docgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/docutils_rstast.c -o nimcache/2_6/docutils_rstast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/docutils_rstast.c -o nimcache/2_6/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/docutils_rst.c -o nimcache/2_6/docutils_rst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/docutils_rst.c -o nimcache/2_6/docutils_rst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/docutils_rstgen.c -o nimcache/2_6/docutils_rstgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/docutils_rstgen.c -o nimcache/2_6/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/docutils_highlite.c -o nimcache/2_6/docutils_highlite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/docutils_highlite.c -o nimcache/2_6/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_json.c -o nimcache/2_6/pure_json.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_json.c -o nimcache/2_6/pure_json.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_lexbase.c -o nimcache/2_6/pure_lexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_lexbase.c -o nimcache/2_6/pure_lexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_unicode.c -o nimcache/2_6/pure_unicode.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_unicode.c -o nimcache/2_6/pure_unicode.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_algorithm.c -o nimcache/2_6/pure_algorithm.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_algorithm.c -o nimcache/2_6/pure_algorithm.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/collections_sequtils.c -o nimcache/2_6/collections_sequtils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/collections_sequtils.c -o nimcache/2_6/collections_sequtils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_aliases.c -o nimcache/2_6/compiler_aliases.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_aliases.c -o nimcache/2_6/compiler_aliases.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_patterns.c -o nimcache/2_6/compiler_patterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_patterns.c -o nimcache/2_6/compiler_patterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_cgen.c -o nimcache/2_6/compiler_cgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_cgen.c -o nimcache/2_6/compiler_cgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_ccgutils.c -o nimcache/2_6/compiler_ccgutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_ccgutils.c -o nimcache/2_6/compiler_ccgutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_cgendata.c -o nimcache/2_6/compiler_cgendata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_cgendata.c -o nimcache/2_6/compiler_cgendata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_ccgmerge.c -o nimcache/2_6/compiler_ccgmerge.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_ccgmerge.c -o nimcache/2_6/compiler_ccgmerge.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_jsgen.c -o nimcache/2_6/compiler_jsgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_jsgen.c -o nimcache/2_6/compiler_jsgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_passaux.c -o nimcache/2_6/compiler_passaux.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_passaux.c -o nimcache/2_6/compiler_passaux.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_depends.c -o nimcache/2_6/compiler_depends.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_depends.c -o nimcache/2_6/compiler_depends.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_docgen2.c -o nimcache/2_6/compiler_docgen2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_docgen2.c -o nimcache/2_6/compiler_docgen2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_service.c -o nimcache/2_6/compiler_service.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_service.c -o nimcache/2_6/compiler_service.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_parseopt.c -o nimcache/2_6/pure_parseopt.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/pure_parseopt.c -o nimcache/2_6/pure_parseopt.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_modules.c -o nimcache/2_6/compiler_modules.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_modules.c -o nimcache/2_6/compiler_modules.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_pretty.c -o nimcache/2_6/compiler_pretty.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/2_6/compiler_pretty.c -o nimcache/2_6/compiler_pretty.o
    echo "$LINKER -o $binDir/nimrod  \
nimcache/2_6/compiler_nimrod.o \
nimcache/2_6/Nimrod_system.o \
nimcache/2_6/compiler_testability.o \
nimcache/2_6/compiler_commands.o \
nimcache/2_6/pure_os.o \
nimcache/2_6/pure_strutils.o \
nimcache/2_6/pure_parseutils.o \
nimcache/2_6/pure_times.o \
nimcache/2_6/posix_posix.o \
nimcache/2_6/compiler_msgs.o \
nimcache/2_6/compiler_options.o \
nimcache/2_6/compiler_lists.o \
nimcache/2_6/pure_strtabs.o \
nimcache/2_6/pure_hashes.o \
nimcache/2_6/collections_tables.o \
nimcache/2_6/pure_math.o \
nimcache/2_6/compiler_ropes.o \
nimcache/2_6/compiler_platform.o \
nimcache/2_6/compiler_crc.o \
nimcache/2_6/pure_sockets.o \
nimcache/2_6/core_unsigned.o \
nimcache/2_6/compiler_nversion.o \
nimcache/2_6/compiler_condsyms.o \
nimcache/2_6/compiler_idents.o \
nimcache/2_6/compiler_extccomp.o \
nimcache/2_6/pure_osproc.o \
nimcache/2_6/pure_streams.o \
nimcache/2_6/compiler_wordrecg.o \
nimcache/2_6/compiler_babelcmd.o \
nimcache/2_6/compiler_lexer.o \
nimcache/2_6/compiler_nimlexbase.o \
nimcache/2_6/compiler_llstream.o \
nimcache/2_6/compiler_nimconf.o \
nimcache/2_6/compiler_main.o \
nimcache/2_6/compiler_ast.o \
nimcache/2_6/collections_intsets.o \
nimcache/2_6/compiler_idgen.o \
nimcache/2_6/compiler_astalgo.o \
nimcache/2_6/compiler_rodutils.o \
nimcache/2_6/compiler_syntaxes.o \
nimcache/2_6/compiler_parser.o \
nimcache/2_6/compiler_pbraces.o \
nimcache/2_6/compiler_filters.o \
nimcache/2_6/compiler_renderer.o \
nimcache/2_6/compiler_filter_tmpl.o \
nimcache/2_6/compiler_rodread.o \
nimcache/2_6/compiler_types.o \
nimcache/2_6/compiler_trees.o \
nimcache/2_6/pure_memfiles.o \
nimcache/2_6/compiler_rodwrite.o \
nimcache/2_6/compiler_passes.o \
nimcache/2_6/compiler_magicsys.o \
nimcache/2_6/compiler_nimsets.o \
nimcache/2_6/compiler_bitsets.o \
nimcache/2_6/compiler_semthreads.o \
nimcache/2_6/compiler_importer.o \
nimcache/2_6/compiler_lookups.o \
nimcache/2_6/compiler_semdata.o \
nimcache/2_6/compiler_treetab.o \
nimcache/2_6/compiler_evals.o \
nimcache/2_6/compiler_semfold.o \
nimcache/2_6/compiler_saturate.o \
nimcache/2_6/compiler_transf.o \
nimcache/2_6/compiler_cgmeth.o \
nimcache/2_6/compiler_sempass2.o \
nimcache/2_6/compiler_guards.o \
nimcache/2_6/compiler_lambdalifting.o \
nimcache/2_6/compiler_evaltempl.o \
nimcache/2_6/compiler_sem.o \
nimcache/2_6/compiler_procfind.o \
nimcache/2_6/compiler_pragmas.o \
nimcache/2_6/compiler_semtypinst.o \
nimcache/2_6/compiler_sigmatch.o \
nimcache/2_6/compiler_parampatterns.o \
nimcache/2_6/compiler_docgen.o \
nimcache/2_6/docutils_rstast.o \
nimcache/2_6/docutils_rst.o \
nimcache/2_6/docutils_rstgen.o \
nimcache/2_6/docutils_highlite.o \
nimcache/2_6/pure_json.o \
nimcache/2_6/pure_lexbase.o \
nimcache/2_6/pure_unicode.o \
nimcache/2_6/pure_algorithm.o \
nimcache/2_6/collections_sequtils.o \
nimcache/2_6/compiler_aliases.o \
nimcache/2_6/compiler_patterns.o \
nimcache/2_6/compiler_cgen.o \
nimcache/2_6/compiler_ccgutils.o \
nimcache/2_6/compiler_cgendata.o \
nimcache/2_6/compiler_ccgmerge.o \
nimcache/2_6/compiler_jsgen.o \
nimcache/2_6/compiler_passaux.o \
nimcache/2_6/compiler_depends.o \
nimcache/2_6/compiler_docgen2.o \
nimcache/2_6/compiler_service.o \
nimcache/2_6/pure_parseopt.o \
nimcache/2_6/compiler_modules.o \
nimcache/2_6/compiler_pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
nimcache/2_6/compiler_nimrod.o \
nimcache/2_6/Nimrod_system.o \
nimcache/2_6/compiler_testability.o \
nimcache/2_6/compiler_commands.o \
nimcache/2_6/pure_os.o \
nimcache/2_6/pure_strutils.o \
nimcache/2_6/pure_parseutils.o \
nimcache/2_6/pure_times.o \
nimcache/2_6/posix_posix.o \
nimcache/2_6/compiler_msgs.o \
nimcache/2_6/compiler_options.o \
nimcache/2_6/compiler_lists.o \
nimcache/2_6/pure_strtabs.o \
nimcache/2_6/pure_hashes.o \
nimcache/2_6/collections_tables.o \
nimcache/2_6/pure_math.o \
nimcache/2_6/compiler_ropes.o \
nimcache/2_6/compiler_platform.o \
nimcache/2_6/compiler_crc.o \
nimcache/2_6/pure_sockets.o \
nimcache/2_6/core_unsigned.o \
nimcache/2_6/compiler_nversion.o \
nimcache/2_6/compiler_condsyms.o \
nimcache/2_6/compiler_idents.o \
nimcache/2_6/compiler_extccomp.o \
nimcache/2_6/pure_osproc.o \
nimcache/2_6/pure_streams.o \
nimcache/2_6/compiler_wordrecg.o \
nimcache/2_6/compiler_babelcmd.o \
nimcache/2_6/compiler_lexer.o \
nimcache/2_6/compiler_nimlexbase.o \
nimcache/2_6/compiler_llstream.o \
nimcache/2_6/compiler_nimconf.o \
nimcache/2_6/compiler_main.o \
nimcache/2_6/compiler_ast.o \
nimcache/2_6/collections_intsets.o \
nimcache/2_6/compiler_idgen.o \
nimcache/2_6/compiler_astalgo.o \
nimcache/2_6/compiler_rodutils.o \
nimcache/2_6/compiler_syntaxes.o \
nimcache/2_6/compiler_parser.o \
nimcache/2_6/compiler_pbraces.o \
nimcache/2_6/compiler_filters.o \
nimcache/2_6/compiler_renderer.o \
nimcache/2_6/compiler_filter_tmpl.o \
nimcache/2_6/compiler_rodread.o \
nimcache/2_6/compiler_types.o \
nimcache/2_6/compiler_trees.o \
nimcache/2_6/pure_memfiles.o \
nimcache/2_6/compiler_rodwrite.o \
nimcache/2_6/compiler_passes.o \
nimcache/2_6/compiler_magicsys.o \
nimcache/2_6/compiler_nimsets.o \
nimcache/2_6/compiler_bitsets.o \
nimcache/2_6/compiler_semthreads.o \
nimcache/2_6/compiler_importer.o \
nimcache/2_6/compiler_lookups.o \
nimcache/2_6/compiler_semdata.o \
nimcache/2_6/compiler_treetab.o \
nimcache/2_6/compiler_evals.o \
nimcache/2_6/compiler_semfold.o \
nimcache/2_6/compiler_saturate.o \
nimcache/2_6/compiler_transf.o \
nimcache/2_6/compiler_cgmeth.o \
nimcache/2_6/compiler_sempass2.o \
nimcache/2_6/compiler_guards.o \
nimcache/2_6/compiler_lambdalifting.o \
nimcache/2_6/compiler_evaltempl.o \
nimcache/2_6/compiler_sem.o \
nimcache/2_6/compiler_procfind.o \
nimcache/2_6/compiler_pragmas.o \
nimcache/2_6/compiler_semtypinst.o \
nimcache/2_6/compiler_sigmatch.o \
nimcache/2_6/compiler_parampatterns.o \
nimcache/2_6/compiler_docgen.o \
nimcache/2_6/docutils_rstast.o \
nimcache/2_6/docutils_rst.o \
nimcache/2_6/docutils_rstgen.o \
nimcache/2_6/docutils_highlite.o \
nimcache/2_6/pure_json.o \
nimcache/2_6/pure_lexbase.o \
nimcache/2_6/pure_unicode.o \
nimcache/2_6/pure_algorithm.o \
nimcache/2_6/collections_sequtils.o \
nimcache/2_6/compiler_aliases.o \
nimcache/2_6/compiler_patterns.o \
nimcache/2_6/compiler_cgen.o \
nimcache/2_6/compiler_ccgutils.o \
nimcache/2_6/compiler_cgendata.o \
nimcache/2_6/compiler_ccgmerge.o \
nimcache/2_6/compiler_jsgen.o \
nimcache/2_6/compiler_passaux.o \
nimcache/2_6/compiler_depends.o \
nimcache/2_6/compiler_docgen2.o \
nimcache/2_6/compiler_service.o \
nimcache/2_6/pure_parseopt.o \
nimcache/2_6/compiler_modules.o \
nimcache/2_6/compiler_pretty.o $LINK_FLAGS
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
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_nimrod.c -o nimcache/3_1/compiler_nimrod.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_nimrod.c -o nimcache/3_1/compiler_nimrod.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/Nimrod_system.c -o nimcache/3_1/Nimrod_system.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/Nimrod_system.c -o nimcache/3_1/Nimrod_system.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_testability.c -o nimcache/3_1/compiler_testability.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_testability.c -o nimcache/3_1/compiler_testability.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_commands.c -o nimcache/3_1/compiler_commands.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_commands.c -o nimcache/3_1/compiler_commands.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_os.c -o nimcache/3_1/pure_os.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_os.c -o nimcache/3_1/pure_os.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_strutils.c -o nimcache/3_1/pure_strutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_strutils.c -o nimcache/3_1/pure_strutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_parseutils.c -o nimcache/3_1/pure_parseutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_parseutils.c -o nimcache/3_1/pure_parseutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_times.c -o nimcache/3_1/pure_times.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_times.c -o nimcache/3_1/pure_times.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/posix_posix.c -o nimcache/3_1/posix_posix.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/posix_posix.c -o nimcache/3_1/posix_posix.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_msgs.c -o nimcache/3_1/compiler_msgs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_msgs.c -o nimcache/3_1/compiler_msgs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_options.c -o nimcache/3_1/compiler_options.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_options.c -o nimcache/3_1/compiler_options.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_lists.c -o nimcache/3_1/compiler_lists.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_lists.c -o nimcache/3_1/compiler_lists.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_strtabs.c -o nimcache/3_1/pure_strtabs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_strtabs.c -o nimcache/3_1/pure_strtabs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_hashes.c -o nimcache/3_1/pure_hashes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_hashes.c -o nimcache/3_1/pure_hashes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/collections_tables.c -o nimcache/3_1/collections_tables.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/collections_tables.c -o nimcache/3_1/collections_tables.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_math.c -o nimcache/3_1/pure_math.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_math.c -o nimcache/3_1/pure_math.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_ropes.c -o nimcache/3_1/compiler_ropes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_ropes.c -o nimcache/3_1/compiler_ropes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_platform.c -o nimcache/3_1/compiler_platform.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_platform.c -o nimcache/3_1/compiler_platform.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_crc.c -o nimcache/3_1/compiler_crc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_crc.c -o nimcache/3_1/compiler_crc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_sockets.c -o nimcache/3_1/pure_sockets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_sockets.c -o nimcache/3_1/pure_sockets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/core_unsigned.c -o nimcache/3_1/core_unsigned.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/core_unsigned.c -o nimcache/3_1/core_unsigned.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_nversion.c -o nimcache/3_1/compiler_nversion.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_nversion.c -o nimcache/3_1/compiler_nversion.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_condsyms.c -o nimcache/3_1/compiler_condsyms.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_condsyms.c -o nimcache/3_1/compiler_condsyms.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_idents.c -o nimcache/3_1/compiler_idents.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_idents.c -o nimcache/3_1/compiler_idents.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_extccomp.c -o nimcache/3_1/compiler_extccomp.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_extccomp.c -o nimcache/3_1/compiler_extccomp.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_osproc.c -o nimcache/3_1/pure_osproc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_osproc.c -o nimcache/3_1/pure_osproc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_streams.c -o nimcache/3_1/pure_streams.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_streams.c -o nimcache/3_1/pure_streams.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_wordrecg.c -o nimcache/3_1/compiler_wordrecg.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_wordrecg.c -o nimcache/3_1/compiler_wordrecg.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_babelcmd.c -o nimcache/3_1/compiler_babelcmd.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_babelcmd.c -o nimcache/3_1/compiler_babelcmd.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_lexer.c -o nimcache/3_1/compiler_lexer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_lexer.c -o nimcache/3_1/compiler_lexer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_nimlexbase.c -o nimcache/3_1/compiler_nimlexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_nimlexbase.c -o nimcache/3_1/compiler_nimlexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_llstream.c -o nimcache/3_1/compiler_llstream.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_llstream.c -o nimcache/3_1/compiler_llstream.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_nimconf.c -o nimcache/3_1/compiler_nimconf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_nimconf.c -o nimcache/3_1/compiler_nimconf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_main.c -o nimcache/3_1/compiler_main.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_main.c -o nimcache/3_1/compiler_main.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_ast.c -o nimcache/3_1/compiler_ast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_ast.c -o nimcache/3_1/compiler_ast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/collections_intsets.c -o nimcache/3_1/collections_intsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/collections_intsets.c -o nimcache/3_1/collections_intsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_idgen.c -o nimcache/3_1/compiler_idgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_idgen.c -o nimcache/3_1/compiler_idgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_astalgo.c -o nimcache/3_1/compiler_astalgo.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_astalgo.c -o nimcache/3_1/compiler_astalgo.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_rodutils.c -o nimcache/3_1/compiler_rodutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_rodutils.c -o nimcache/3_1/compiler_rodutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_syntaxes.c -o nimcache/3_1/compiler_syntaxes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_syntaxes.c -o nimcache/3_1/compiler_syntaxes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_parser.c -o nimcache/3_1/compiler_parser.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_parser.c -o nimcache/3_1/compiler_parser.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_pbraces.c -o nimcache/3_1/compiler_pbraces.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_pbraces.c -o nimcache/3_1/compiler_pbraces.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_filters.c -o nimcache/3_1/compiler_filters.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_filters.c -o nimcache/3_1/compiler_filters.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_renderer.c -o nimcache/3_1/compiler_renderer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_renderer.c -o nimcache/3_1/compiler_renderer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_filter_tmpl.c -o nimcache/3_1/compiler_filter_tmpl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_filter_tmpl.c -o nimcache/3_1/compiler_filter_tmpl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_rodread.c -o nimcache/3_1/compiler_rodread.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_rodread.c -o nimcache/3_1/compiler_rodread.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_types.c -o nimcache/3_1/compiler_types.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_types.c -o nimcache/3_1/compiler_types.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_trees.c -o nimcache/3_1/compiler_trees.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_trees.c -o nimcache/3_1/compiler_trees.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_memfiles.c -o nimcache/3_1/pure_memfiles.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_memfiles.c -o nimcache/3_1/pure_memfiles.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_rodwrite.c -o nimcache/3_1/compiler_rodwrite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_rodwrite.c -o nimcache/3_1/compiler_rodwrite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_passes.c -o nimcache/3_1/compiler_passes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_passes.c -o nimcache/3_1/compiler_passes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_magicsys.c -o nimcache/3_1/compiler_magicsys.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_magicsys.c -o nimcache/3_1/compiler_magicsys.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_nimsets.c -o nimcache/3_1/compiler_nimsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_nimsets.c -o nimcache/3_1/compiler_nimsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_bitsets.c -o nimcache/3_1/compiler_bitsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_bitsets.c -o nimcache/3_1/compiler_bitsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_semthreads.c -o nimcache/3_1/compiler_semthreads.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_semthreads.c -o nimcache/3_1/compiler_semthreads.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_importer.c -o nimcache/3_1/compiler_importer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_importer.c -o nimcache/3_1/compiler_importer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_lookups.c -o nimcache/3_1/compiler_lookups.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_lookups.c -o nimcache/3_1/compiler_lookups.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_semdata.c -o nimcache/3_1/compiler_semdata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_semdata.c -o nimcache/3_1/compiler_semdata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_treetab.c -o nimcache/3_1/compiler_treetab.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_treetab.c -o nimcache/3_1/compiler_treetab.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_evals.c -o nimcache/3_1/compiler_evals.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_evals.c -o nimcache/3_1/compiler_evals.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_semfold.c -o nimcache/3_1/compiler_semfold.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_semfold.c -o nimcache/3_1/compiler_semfold.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_saturate.c -o nimcache/3_1/compiler_saturate.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_saturate.c -o nimcache/3_1/compiler_saturate.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_transf.c -o nimcache/3_1/compiler_transf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_transf.c -o nimcache/3_1/compiler_transf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_cgmeth.c -o nimcache/3_1/compiler_cgmeth.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_cgmeth.c -o nimcache/3_1/compiler_cgmeth.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_sempass2.c -o nimcache/3_1/compiler_sempass2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_sempass2.c -o nimcache/3_1/compiler_sempass2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_guards.c -o nimcache/3_1/compiler_guards.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_guards.c -o nimcache/3_1/compiler_guards.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_lambdalifting.c -o nimcache/3_1/compiler_lambdalifting.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_lambdalifting.c -o nimcache/3_1/compiler_lambdalifting.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_evaltempl.c -o nimcache/3_1/compiler_evaltempl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_evaltempl.c -o nimcache/3_1/compiler_evaltempl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_sem.c -o nimcache/3_1/compiler_sem.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_sem.c -o nimcache/3_1/compiler_sem.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_procfind.c -o nimcache/3_1/compiler_procfind.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_procfind.c -o nimcache/3_1/compiler_procfind.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_pragmas.c -o nimcache/3_1/compiler_pragmas.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_pragmas.c -o nimcache/3_1/compiler_pragmas.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_semtypinst.c -o nimcache/3_1/compiler_semtypinst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_semtypinst.c -o nimcache/3_1/compiler_semtypinst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_sigmatch.c -o nimcache/3_1/compiler_sigmatch.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_sigmatch.c -o nimcache/3_1/compiler_sigmatch.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_parampatterns.c -o nimcache/3_1/compiler_parampatterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_parampatterns.c -o nimcache/3_1/compiler_parampatterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_docgen.c -o nimcache/3_1/compiler_docgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_docgen.c -o nimcache/3_1/compiler_docgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/docutils_rstast.c -o nimcache/3_1/docutils_rstast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/docutils_rstast.c -o nimcache/3_1/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/docutils_rst.c -o nimcache/3_1/docutils_rst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/docutils_rst.c -o nimcache/3_1/docutils_rst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/docutils_rstgen.c -o nimcache/3_1/docutils_rstgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/docutils_rstgen.c -o nimcache/3_1/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/docutils_highlite.c -o nimcache/3_1/docutils_highlite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/docutils_highlite.c -o nimcache/3_1/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_json.c -o nimcache/3_1/pure_json.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_json.c -o nimcache/3_1/pure_json.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_lexbase.c -o nimcache/3_1/pure_lexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_lexbase.c -o nimcache/3_1/pure_lexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_unicode.c -o nimcache/3_1/pure_unicode.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_unicode.c -o nimcache/3_1/pure_unicode.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_algorithm.c -o nimcache/3_1/pure_algorithm.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_algorithm.c -o nimcache/3_1/pure_algorithm.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/collections_sequtils.c -o nimcache/3_1/collections_sequtils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/collections_sequtils.c -o nimcache/3_1/collections_sequtils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_aliases.c -o nimcache/3_1/compiler_aliases.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_aliases.c -o nimcache/3_1/compiler_aliases.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_patterns.c -o nimcache/3_1/compiler_patterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_patterns.c -o nimcache/3_1/compiler_patterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_cgen.c -o nimcache/3_1/compiler_cgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_cgen.c -o nimcache/3_1/compiler_cgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_ccgutils.c -o nimcache/3_1/compiler_ccgutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_ccgutils.c -o nimcache/3_1/compiler_ccgutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_cgendata.c -o nimcache/3_1/compiler_cgendata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_cgendata.c -o nimcache/3_1/compiler_cgendata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_ccgmerge.c -o nimcache/3_1/compiler_ccgmerge.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_ccgmerge.c -o nimcache/3_1/compiler_ccgmerge.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_jsgen.c -o nimcache/3_1/compiler_jsgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_jsgen.c -o nimcache/3_1/compiler_jsgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_passaux.c -o nimcache/3_1/compiler_passaux.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_passaux.c -o nimcache/3_1/compiler_passaux.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_depends.c -o nimcache/3_1/compiler_depends.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_depends.c -o nimcache/3_1/compiler_depends.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_docgen2.c -o nimcache/3_1/compiler_docgen2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_docgen2.c -o nimcache/3_1/compiler_docgen2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_service.c -o nimcache/3_1/compiler_service.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_service.c -o nimcache/3_1/compiler_service.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_parseopt.c -o nimcache/3_1/pure_parseopt.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/pure_parseopt.c -o nimcache/3_1/pure_parseopt.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_modules.c -o nimcache/3_1/compiler_modules.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_modules.c -o nimcache/3_1/compiler_modules.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_pretty.c -o nimcache/3_1/compiler_pretty.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_1/compiler_pretty.c -o nimcache/3_1/compiler_pretty.o
    echo "$LINKER -o $binDir/nimrod  \
nimcache/3_1/compiler_nimrod.o \
nimcache/3_1/Nimrod_system.o \
nimcache/3_1/compiler_testability.o \
nimcache/3_1/compiler_commands.o \
nimcache/3_1/pure_os.o \
nimcache/3_1/pure_strutils.o \
nimcache/3_1/pure_parseutils.o \
nimcache/3_1/pure_times.o \
nimcache/3_1/posix_posix.o \
nimcache/3_1/compiler_msgs.o \
nimcache/3_1/compiler_options.o \
nimcache/3_1/compiler_lists.o \
nimcache/3_1/pure_strtabs.o \
nimcache/3_1/pure_hashes.o \
nimcache/3_1/collections_tables.o \
nimcache/3_1/pure_math.o \
nimcache/3_1/compiler_ropes.o \
nimcache/3_1/compiler_platform.o \
nimcache/3_1/compiler_crc.o \
nimcache/3_1/pure_sockets.o \
nimcache/3_1/core_unsigned.o \
nimcache/3_1/compiler_nversion.o \
nimcache/3_1/compiler_condsyms.o \
nimcache/3_1/compiler_idents.o \
nimcache/3_1/compiler_extccomp.o \
nimcache/3_1/pure_osproc.o \
nimcache/3_1/pure_streams.o \
nimcache/3_1/compiler_wordrecg.o \
nimcache/3_1/compiler_babelcmd.o \
nimcache/3_1/compiler_lexer.o \
nimcache/3_1/compiler_nimlexbase.o \
nimcache/3_1/compiler_llstream.o \
nimcache/3_1/compiler_nimconf.o \
nimcache/3_1/compiler_main.o \
nimcache/3_1/compiler_ast.o \
nimcache/3_1/collections_intsets.o \
nimcache/3_1/compiler_idgen.o \
nimcache/3_1/compiler_astalgo.o \
nimcache/3_1/compiler_rodutils.o \
nimcache/3_1/compiler_syntaxes.o \
nimcache/3_1/compiler_parser.o \
nimcache/3_1/compiler_pbraces.o \
nimcache/3_1/compiler_filters.o \
nimcache/3_1/compiler_renderer.o \
nimcache/3_1/compiler_filter_tmpl.o \
nimcache/3_1/compiler_rodread.o \
nimcache/3_1/compiler_types.o \
nimcache/3_1/compiler_trees.o \
nimcache/3_1/pure_memfiles.o \
nimcache/3_1/compiler_rodwrite.o \
nimcache/3_1/compiler_passes.o \
nimcache/3_1/compiler_magicsys.o \
nimcache/3_1/compiler_nimsets.o \
nimcache/3_1/compiler_bitsets.o \
nimcache/3_1/compiler_semthreads.o \
nimcache/3_1/compiler_importer.o \
nimcache/3_1/compiler_lookups.o \
nimcache/3_1/compiler_semdata.o \
nimcache/3_1/compiler_treetab.o \
nimcache/3_1/compiler_evals.o \
nimcache/3_1/compiler_semfold.o \
nimcache/3_1/compiler_saturate.o \
nimcache/3_1/compiler_transf.o \
nimcache/3_1/compiler_cgmeth.o \
nimcache/3_1/compiler_sempass2.o \
nimcache/3_1/compiler_guards.o \
nimcache/3_1/compiler_lambdalifting.o \
nimcache/3_1/compiler_evaltempl.o \
nimcache/3_1/compiler_sem.o \
nimcache/3_1/compiler_procfind.o \
nimcache/3_1/compiler_pragmas.o \
nimcache/3_1/compiler_semtypinst.o \
nimcache/3_1/compiler_sigmatch.o \
nimcache/3_1/compiler_parampatterns.o \
nimcache/3_1/compiler_docgen.o \
nimcache/3_1/docutils_rstast.o \
nimcache/3_1/docutils_rst.o \
nimcache/3_1/docutils_rstgen.o \
nimcache/3_1/docutils_highlite.o \
nimcache/3_1/pure_json.o \
nimcache/3_1/pure_lexbase.o \
nimcache/3_1/pure_unicode.o \
nimcache/3_1/pure_algorithm.o \
nimcache/3_1/collections_sequtils.o \
nimcache/3_1/compiler_aliases.o \
nimcache/3_1/compiler_patterns.o \
nimcache/3_1/compiler_cgen.o \
nimcache/3_1/compiler_ccgutils.o \
nimcache/3_1/compiler_cgendata.o \
nimcache/3_1/compiler_ccgmerge.o \
nimcache/3_1/compiler_jsgen.o \
nimcache/3_1/compiler_passaux.o \
nimcache/3_1/compiler_depends.o \
nimcache/3_1/compiler_docgen2.o \
nimcache/3_1/compiler_service.o \
nimcache/3_1/pure_parseopt.o \
nimcache/3_1/compiler_modules.o \
nimcache/3_1/compiler_pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
nimcache/3_1/compiler_nimrod.o \
nimcache/3_1/Nimrod_system.o \
nimcache/3_1/compiler_testability.o \
nimcache/3_1/compiler_commands.o \
nimcache/3_1/pure_os.o \
nimcache/3_1/pure_strutils.o \
nimcache/3_1/pure_parseutils.o \
nimcache/3_1/pure_times.o \
nimcache/3_1/posix_posix.o \
nimcache/3_1/compiler_msgs.o \
nimcache/3_1/compiler_options.o \
nimcache/3_1/compiler_lists.o \
nimcache/3_1/pure_strtabs.o \
nimcache/3_1/pure_hashes.o \
nimcache/3_1/collections_tables.o \
nimcache/3_1/pure_math.o \
nimcache/3_1/compiler_ropes.o \
nimcache/3_1/compiler_platform.o \
nimcache/3_1/compiler_crc.o \
nimcache/3_1/pure_sockets.o \
nimcache/3_1/core_unsigned.o \
nimcache/3_1/compiler_nversion.o \
nimcache/3_1/compiler_condsyms.o \
nimcache/3_1/compiler_idents.o \
nimcache/3_1/compiler_extccomp.o \
nimcache/3_1/pure_osproc.o \
nimcache/3_1/pure_streams.o \
nimcache/3_1/compiler_wordrecg.o \
nimcache/3_1/compiler_babelcmd.o \
nimcache/3_1/compiler_lexer.o \
nimcache/3_1/compiler_nimlexbase.o \
nimcache/3_1/compiler_llstream.o \
nimcache/3_1/compiler_nimconf.o \
nimcache/3_1/compiler_main.o \
nimcache/3_1/compiler_ast.o \
nimcache/3_1/collections_intsets.o \
nimcache/3_1/compiler_idgen.o \
nimcache/3_1/compiler_astalgo.o \
nimcache/3_1/compiler_rodutils.o \
nimcache/3_1/compiler_syntaxes.o \
nimcache/3_1/compiler_parser.o \
nimcache/3_1/compiler_pbraces.o \
nimcache/3_1/compiler_filters.o \
nimcache/3_1/compiler_renderer.o \
nimcache/3_1/compiler_filter_tmpl.o \
nimcache/3_1/compiler_rodread.o \
nimcache/3_1/compiler_types.o \
nimcache/3_1/compiler_trees.o \
nimcache/3_1/pure_memfiles.o \
nimcache/3_1/compiler_rodwrite.o \
nimcache/3_1/compiler_passes.o \
nimcache/3_1/compiler_magicsys.o \
nimcache/3_1/compiler_nimsets.o \
nimcache/3_1/compiler_bitsets.o \
nimcache/3_1/compiler_semthreads.o \
nimcache/3_1/compiler_importer.o \
nimcache/3_1/compiler_lookups.o \
nimcache/3_1/compiler_semdata.o \
nimcache/3_1/compiler_treetab.o \
nimcache/3_1/compiler_evals.o \
nimcache/3_1/compiler_semfold.o \
nimcache/3_1/compiler_saturate.o \
nimcache/3_1/compiler_transf.o \
nimcache/3_1/compiler_cgmeth.o \
nimcache/3_1/compiler_sempass2.o \
nimcache/3_1/compiler_guards.o \
nimcache/3_1/compiler_lambdalifting.o \
nimcache/3_1/compiler_evaltempl.o \
nimcache/3_1/compiler_sem.o \
nimcache/3_1/compiler_procfind.o \
nimcache/3_1/compiler_pragmas.o \
nimcache/3_1/compiler_semtypinst.o \
nimcache/3_1/compiler_sigmatch.o \
nimcache/3_1/compiler_parampatterns.o \
nimcache/3_1/compiler_docgen.o \
nimcache/3_1/docutils_rstast.o \
nimcache/3_1/docutils_rst.o \
nimcache/3_1/docutils_rstgen.o \
nimcache/3_1/docutils_highlite.o \
nimcache/3_1/pure_json.o \
nimcache/3_1/pure_lexbase.o \
nimcache/3_1/pure_unicode.o \
nimcache/3_1/pure_algorithm.o \
nimcache/3_1/collections_sequtils.o \
nimcache/3_1/compiler_aliases.o \
nimcache/3_1/compiler_patterns.o \
nimcache/3_1/compiler_cgen.o \
nimcache/3_1/compiler_ccgutils.o \
nimcache/3_1/compiler_cgendata.o \
nimcache/3_1/compiler_ccgmerge.o \
nimcache/3_1/compiler_jsgen.o \
nimcache/3_1/compiler_passaux.o \
nimcache/3_1/compiler_depends.o \
nimcache/3_1/compiler_docgen2.o \
nimcache/3_1/compiler_service.o \
nimcache/3_1/pure_parseopt.o \
nimcache/3_1/compiler_modules.o \
nimcache/3_1/compiler_pretty.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_nimrod.c -o nimcache/3_2/compiler_nimrod.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_nimrod.c -o nimcache/3_2/compiler_nimrod.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/Nimrod_system.c -o nimcache/3_2/Nimrod_system.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/Nimrod_system.c -o nimcache/3_2/Nimrod_system.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_testability.c -o nimcache/3_2/compiler_testability.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_testability.c -o nimcache/3_2/compiler_testability.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_commands.c -o nimcache/3_2/compiler_commands.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_commands.c -o nimcache/3_2/compiler_commands.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_os.c -o nimcache/3_2/pure_os.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_os.c -o nimcache/3_2/pure_os.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_strutils.c -o nimcache/3_2/pure_strutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_strutils.c -o nimcache/3_2/pure_strutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_parseutils.c -o nimcache/3_2/pure_parseutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_parseutils.c -o nimcache/3_2/pure_parseutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_times.c -o nimcache/3_2/pure_times.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_times.c -o nimcache/3_2/pure_times.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/posix_posix.c -o nimcache/3_2/posix_posix.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/posix_posix.c -o nimcache/3_2/posix_posix.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_msgs.c -o nimcache/3_2/compiler_msgs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_msgs.c -o nimcache/3_2/compiler_msgs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_options.c -o nimcache/3_2/compiler_options.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_options.c -o nimcache/3_2/compiler_options.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_lists.c -o nimcache/3_2/compiler_lists.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_lists.c -o nimcache/3_2/compiler_lists.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_strtabs.c -o nimcache/3_2/pure_strtabs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_strtabs.c -o nimcache/3_2/pure_strtabs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_hashes.c -o nimcache/3_2/pure_hashes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_hashes.c -o nimcache/3_2/pure_hashes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/collections_tables.c -o nimcache/3_2/collections_tables.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/collections_tables.c -o nimcache/3_2/collections_tables.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_math.c -o nimcache/3_2/pure_math.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_math.c -o nimcache/3_2/pure_math.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_ropes.c -o nimcache/3_2/compiler_ropes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_ropes.c -o nimcache/3_2/compiler_ropes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_platform.c -o nimcache/3_2/compiler_platform.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_platform.c -o nimcache/3_2/compiler_platform.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_crc.c -o nimcache/3_2/compiler_crc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_crc.c -o nimcache/3_2/compiler_crc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_sockets.c -o nimcache/3_2/pure_sockets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_sockets.c -o nimcache/3_2/pure_sockets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/core_unsigned.c -o nimcache/3_2/core_unsigned.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/core_unsigned.c -o nimcache/3_2/core_unsigned.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_nversion.c -o nimcache/3_2/compiler_nversion.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_nversion.c -o nimcache/3_2/compiler_nversion.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_condsyms.c -o nimcache/3_2/compiler_condsyms.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_condsyms.c -o nimcache/3_2/compiler_condsyms.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_idents.c -o nimcache/3_2/compiler_idents.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_idents.c -o nimcache/3_2/compiler_idents.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_extccomp.c -o nimcache/3_2/compiler_extccomp.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_extccomp.c -o nimcache/3_2/compiler_extccomp.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_osproc.c -o nimcache/3_2/pure_osproc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_osproc.c -o nimcache/3_2/pure_osproc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_streams.c -o nimcache/3_2/pure_streams.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_streams.c -o nimcache/3_2/pure_streams.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_wordrecg.c -o nimcache/3_2/compiler_wordrecg.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_wordrecg.c -o nimcache/3_2/compiler_wordrecg.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_babelcmd.c -o nimcache/3_2/compiler_babelcmd.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_babelcmd.c -o nimcache/3_2/compiler_babelcmd.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_lexer.c -o nimcache/3_2/compiler_lexer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_lexer.c -o nimcache/3_2/compiler_lexer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_nimlexbase.c -o nimcache/3_2/compiler_nimlexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_nimlexbase.c -o nimcache/3_2/compiler_nimlexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_llstream.c -o nimcache/3_2/compiler_llstream.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_llstream.c -o nimcache/3_2/compiler_llstream.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_nimconf.c -o nimcache/3_2/compiler_nimconf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_nimconf.c -o nimcache/3_2/compiler_nimconf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_main.c -o nimcache/3_2/compiler_main.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_main.c -o nimcache/3_2/compiler_main.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_ast.c -o nimcache/3_2/compiler_ast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_ast.c -o nimcache/3_2/compiler_ast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/collections_intsets.c -o nimcache/3_2/collections_intsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/collections_intsets.c -o nimcache/3_2/collections_intsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_idgen.c -o nimcache/3_2/compiler_idgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_idgen.c -o nimcache/3_2/compiler_idgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_astalgo.c -o nimcache/3_2/compiler_astalgo.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_astalgo.c -o nimcache/3_2/compiler_astalgo.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_rodutils.c -o nimcache/3_2/compiler_rodutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_rodutils.c -o nimcache/3_2/compiler_rodutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_syntaxes.c -o nimcache/3_2/compiler_syntaxes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_syntaxes.c -o nimcache/3_2/compiler_syntaxes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_parser.c -o nimcache/3_2/compiler_parser.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_parser.c -o nimcache/3_2/compiler_parser.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_pbraces.c -o nimcache/3_2/compiler_pbraces.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_pbraces.c -o nimcache/3_2/compiler_pbraces.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_filters.c -o nimcache/3_2/compiler_filters.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_filters.c -o nimcache/3_2/compiler_filters.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_renderer.c -o nimcache/3_2/compiler_renderer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_renderer.c -o nimcache/3_2/compiler_renderer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_filter_tmpl.c -o nimcache/3_2/compiler_filter_tmpl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_filter_tmpl.c -o nimcache/3_2/compiler_filter_tmpl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_rodread.c -o nimcache/3_2/compiler_rodread.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_rodread.c -o nimcache/3_2/compiler_rodread.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_types.c -o nimcache/3_2/compiler_types.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_types.c -o nimcache/3_2/compiler_types.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_trees.c -o nimcache/3_2/compiler_trees.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_trees.c -o nimcache/3_2/compiler_trees.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_memfiles.c -o nimcache/3_2/pure_memfiles.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_memfiles.c -o nimcache/3_2/pure_memfiles.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_rodwrite.c -o nimcache/3_2/compiler_rodwrite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_rodwrite.c -o nimcache/3_2/compiler_rodwrite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_passes.c -o nimcache/3_2/compiler_passes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_passes.c -o nimcache/3_2/compiler_passes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_magicsys.c -o nimcache/3_2/compiler_magicsys.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_magicsys.c -o nimcache/3_2/compiler_magicsys.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_nimsets.c -o nimcache/3_2/compiler_nimsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_nimsets.c -o nimcache/3_2/compiler_nimsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_bitsets.c -o nimcache/3_2/compiler_bitsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_bitsets.c -o nimcache/3_2/compiler_bitsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_semthreads.c -o nimcache/3_2/compiler_semthreads.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_semthreads.c -o nimcache/3_2/compiler_semthreads.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_importer.c -o nimcache/3_2/compiler_importer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_importer.c -o nimcache/3_2/compiler_importer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_lookups.c -o nimcache/3_2/compiler_lookups.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_lookups.c -o nimcache/3_2/compiler_lookups.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_semdata.c -o nimcache/3_2/compiler_semdata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_semdata.c -o nimcache/3_2/compiler_semdata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_treetab.c -o nimcache/3_2/compiler_treetab.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_treetab.c -o nimcache/3_2/compiler_treetab.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_evals.c -o nimcache/3_2/compiler_evals.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_evals.c -o nimcache/3_2/compiler_evals.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_semfold.c -o nimcache/3_2/compiler_semfold.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_semfold.c -o nimcache/3_2/compiler_semfold.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_saturate.c -o nimcache/3_2/compiler_saturate.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_saturate.c -o nimcache/3_2/compiler_saturate.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_transf.c -o nimcache/3_2/compiler_transf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_transf.c -o nimcache/3_2/compiler_transf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_cgmeth.c -o nimcache/3_2/compiler_cgmeth.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_cgmeth.c -o nimcache/3_2/compiler_cgmeth.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_sempass2.c -o nimcache/3_2/compiler_sempass2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_sempass2.c -o nimcache/3_2/compiler_sempass2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_guards.c -o nimcache/3_2/compiler_guards.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_guards.c -o nimcache/3_2/compiler_guards.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_lambdalifting.c -o nimcache/3_2/compiler_lambdalifting.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_lambdalifting.c -o nimcache/3_2/compiler_lambdalifting.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_evaltempl.c -o nimcache/3_2/compiler_evaltempl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_evaltempl.c -o nimcache/3_2/compiler_evaltempl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_sem.c -o nimcache/3_2/compiler_sem.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_sem.c -o nimcache/3_2/compiler_sem.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_procfind.c -o nimcache/3_2/compiler_procfind.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_procfind.c -o nimcache/3_2/compiler_procfind.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_pragmas.c -o nimcache/3_2/compiler_pragmas.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_pragmas.c -o nimcache/3_2/compiler_pragmas.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_semtypinst.c -o nimcache/3_2/compiler_semtypinst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_semtypinst.c -o nimcache/3_2/compiler_semtypinst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_sigmatch.c -o nimcache/3_2/compiler_sigmatch.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_sigmatch.c -o nimcache/3_2/compiler_sigmatch.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_parampatterns.c -o nimcache/3_2/compiler_parampatterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_parampatterns.c -o nimcache/3_2/compiler_parampatterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_docgen.c -o nimcache/3_2/compiler_docgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_docgen.c -o nimcache/3_2/compiler_docgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/docutils_rstast.c -o nimcache/3_2/docutils_rstast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/docutils_rstast.c -o nimcache/3_2/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/docutils_rst.c -o nimcache/3_2/docutils_rst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/docutils_rst.c -o nimcache/3_2/docutils_rst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/docutils_rstgen.c -o nimcache/3_2/docutils_rstgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/docutils_rstgen.c -o nimcache/3_2/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/docutils_highlite.c -o nimcache/3_2/docutils_highlite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/docutils_highlite.c -o nimcache/3_2/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_json.c -o nimcache/3_2/pure_json.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_json.c -o nimcache/3_2/pure_json.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_lexbase.c -o nimcache/3_2/pure_lexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_lexbase.c -o nimcache/3_2/pure_lexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_unicode.c -o nimcache/3_2/pure_unicode.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_unicode.c -o nimcache/3_2/pure_unicode.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_algorithm.c -o nimcache/3_2/pure_algorithm.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_algorithm.c -o nimcache/3_2/pure_algorithm.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/collections_sequtils.c -o nimcache/3_2/collections_sequtils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/collections_sequtils.c -o nimcache/3_2/collections_sequtils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_aliases.c -o nimcache/3_2/compiler_aliases.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_aliases.c -o nimcache/3_2/compiler_aliases.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_patterns.c -o nimcache/3_2/compiler_patterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_patterns.c -o nimcache/3_2/compiler_patterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_cgen.c -o nimcache/3_2/compiler_cgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_cgen.c -o nimcache/3_2/compiler_cgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_ccgutils.c -o nimcache/3_2/compiler_ccgutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_ccgutils.c -o nimcache/3_2/compiler_ccgutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_cgendata.c -o nimcache/3_2/compiler_cgendata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_cgendata.c -o nimcache/3_2/compiler_cgendata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_ccgmerge.c -o nimcache/3_2/compiler_ccgmerge.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_ccgmerge.c -o nimcache/3_2/compiler_ccgmerge.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_jsgen.c -o nimcache/3_2/compiler_jsgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_jsgen.c -o nimcache/3_2/compiler_jsgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_passaux.c -o nimcache/3_2/compiler_passaux.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_passaux.c -o nimcache/3_2/compiler_passaux.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_depends.c -o nimcache/3_2/compiler_depends.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_depends.c -o nimcache/3_2/compiler_depends.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_docgen2.c -o nimcache/3_2/compiler_docgen2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_docgen2.c -o nimcache/3_2/compiler_docgen2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_service.c -o nimcache/3_2/compiler_service.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_service.c -o nimcache/3_2/compiler_service.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_parseopt.c -o nimcache/3_2/pure_parseopt.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/pure_parseopt.c -o nimcache/3_2/pure_parseopt.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_modules.c -o nimcache/3_2/compiler_modules.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_modules.c -o nimcache/3_2/compiler_modules.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_pretty.c -o nimcache/3_2/compiler_pretty.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_2/compiler_pretty.c -o nimcache/3_2/compiler_pretty.o
    echo "$LINKER -o $binDir/nimrod  \
nimcache/3_2/compiler_nimrod.o \
nimcache/3_2/Nimrod_system.o \
nimcache/3_2/compiler_testability.o \
nimcache/3_2/compiler_commands.o \
nimcache/3_2/pure_os.o \
nimcache/3_2/pure_strutils.o \
nimcache/3_2/pure_parseutils.o \
nimcache/3_2/pure_times.o \
nimcache/3_2/posix_posix.o \
nimcache/3_2/compiler_msgs.o \
nimcache/3_2/compiler_options.o \
nimcache/3_2/compiler_lists.o \
nimcache/3_2/pure_strtabs.o \
nimcache/3_2/pure_hashes.o \
nimcache/3_2/collections_tables.o \
nimcache/3_2/pure_math.o \
nimcache/3_2/compiler_ropes.o \
nimcache/3_2/compiler_platform.o \
nimcache/3_2/compiler_crc.o \
nimcache/3_2/pure_sockets.o \
nimcache/3_2/core_unsigned.o \
nimcache/3_2/compiler_nversion.o \
nimcache/3_2/compiler_condsyms.o \
nimcache/3_2/compiler_idents.o \
nimcache/3_2/compiler_extccomp.o \
nimcache/3_2/pure_osproc.o \
nimcache/3_2/pure_streams.o \
nimcache/3_2/compiler_wordrecg.o \
nimcache/3_2/compiler_babelcmd.o \
nimcache/3_2/compiler_lexer.o \
nimcache/3_2/compiler_nimlexbase.o \
nimcache/3_2/compiler_llstream.o \
nimcache/3_2/compiler_nimconf.o \
nimcache/3_2/compiler_main.o \
nimcache/3_2/compiler_ast.o \
nimcache/3_2/collections_intsets.o \
nimcache/3_2/compiler_idgen.o \
nimcache/3_2/compiler_astalgo.o \
nimcache/3_2/compiler_rodutils.o \
nimcache/3_2/compiler_syntaxes.o \
nimcache/3_2/compiler_parser.o \
nimcache/3_2/compiler_pbraces.o \
nimcache/3_2/compiler_filters.o \
nimcache/3_2/compiler_renderer.o \
nimcache/3_2/compiler_filter_tmpl.o \
nimcache/3_2/compiler_rodread.o \
nimcache/3_2/compiler_types.o \
nimcache/3_2/compiler_trees.o \
nimcache/3_2/pure_memfiles.o \
nimcache/3_2/compiler_rodwrite.o \
nimcache/3_2/compiler_passes.o \
nimcache/3_2/compiler_magicsys.o \
nimcache/3_2/compiler_nimsets.o \
nimcache/3_2/compiler_bitsets.o \
nimcache/3_2/compiler_semthreads.o \
nimcache/3_2/compiler_importer.o \
nimcache/3_2/compiler_lookups.o \
nimcache/3_2/compiler_semdata.o \
nimcache/3_2/compiler_treetab.o \
nimcache/3_2/compiler_evals.o \
nimcache/3_2/compiler_semfold.o \
nimcache/3_2/compiler_saturate.o \
nimcache/3_2/compiler_transf.o \
nimcache/3_2/compiler_cgmeth.o \
nimcache/3_2/compiler_sempass2.o \
nimcache/3_2/compiler_guards.o \
nimcache/3_2/compiler_lambdalifting.o \
nimcache/3_2/compiler_evaltempl.o \
nimcache/3_2/compiler_sem.o \
nimcache/3_2/compiler_procfind.o \
nimcache/3_2/compiler_pragmas.o \
nimcache/3_2/compiler_semtypinst.o \
nimcache/3_2/compiler_sigmatch.o \
nimcache/3_2/compiler_parampatterns.o \
nimcache/3_2/compiler_docgen.o \
nimcache/3_2/docutils_rstast.o \
nimcache/3_2/docutils_rst.o \
nimcache/3_2/docutils_rstgen.o \
nimcache/3_2/docutils_highlite.o \
nimcache/3_2/pure_json.o \
nimcache/3_2/pure_lexbase.o \
nimcache/3_2/pure_unicode.o \
nimcache/3_2/pure_algorithm.o \
nimcache/3_2/collections_sequtils.o \
nimcache/3_2/compiler_aliases.o \
nimcache/3_2/compiler_patterns.o \
nimcache/3_2/compiler_cgen.o \
nimcache/3_2/compiler_ccgutils.o \
nimcache/3_2/compiler_cgendata.o \
nimcache/3_2/compiler_ccgmerge.o \
nimcache/3_2/compiler_jsgen.o \
nimcache/3_2/compiler_passaux.o \
nimcache/3_2/compiler_depends.o \
nimcache/3_2/compiler_docgen2.o \
nimcache/3_2/compiler_service.o \
nimcache/3_2/pure_parseopt.o \
nimcache/3_2/compiler_modules.o \
nimcache/3_2/compiler_pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
nimcache/3_2/compiler_nimrod.o \
nimcache/3_2/Nimrod_system.o \
nimcache/3_2/compiler_testability.o \
nimcache/3_2/compiler_commands.o \
nimcache/3_2/pure_os.o \
nimcache/3_2/pure_strutils.o \
nimcache/3_2/pure_parseutils.o \
nimcache/3_2/pure_times.o \
nimcache/3_2/posix_posix.o \
nimcache/3_2/compiler_msgs.o \
nimcache/3_2/compiler_options.o \
nimcache/3_2/compiler_lists.o \
nimcache/3_2/pure_strtabs.o \
nimcache/3_2/pure_hashes.o \
nimcache/3_2/collections_tables.o \
nimcache/3_2/pure_math.o \
nimcache/3_2/compiler_ropes.o \
nimcache/3_2/compiler_platform.o \
nimcache/3_2/compiler_crc.o \
nimcache/3_2/pure_sockets.o \
nimcache/3_2/core_unsigned.o \
nimcache/3_2/compiler_nversion.o \
nimcache/3_2/compiler_condsyms.o \
nimcache/3_2/compiler_idents.o \
nimcache/3_2/compiler_extccomp.o \
nimcache/3_2/pure_osproc.o \
nimcache/3_2/pure_streams.o \
nimcache/3_2/compiler_wordrecg.o \
nimcache/3_2/compiler_babelcmd.o \
nimcache/3_2/compiler_lexer.o \
nimcache/3_2/compiler_nimlexbase.o \
nimcache/3_2/compiler_llstream.o \
nimcache/3_2/compiler_nimconf.o \
nimcache/3_2/compiler_main.o \
nimcache/3_2/compiler_ast.o \
nimcache/3_2/collections_intsets.o \
nimcache/3_2/compiler_idgen.o \
nimcache/3_2/compiler_astalgo.o \
nimcache/3_2/compiler_rodutils.o \
nimcache/3_2/compiler_syntaxes.o \
nimcache/3_2/compiler_parser.o \
nimcache/3_2/compiler_pbraces.o \
nimcache/3_2/compiler_filters.o \
nimcache/3_2/compiler_renderer.o \
nimcache/3_2/compiler_filter_tmpl.o \
nimcache/3_2/compiler_rodread.o \
nimcache/3_2/compiler_types.o \
nimcache/3_2/compiler_trees.o \
nimcache/3_2/pure_memfiles.o \
nimcache/3_2/compiler_rodwrite.o \
nimcache/3_2/compiler_passes.o \
nimcache/3_2/compiler_magicsys.o \
nimcache/3_2/compiler_nimsets.o \
nimcache/3_2/compiler_bitsets.o \
nimcache/3_2/compiler_semthreads.o \
nimcache/3_2/compiler_importer.o \
nimcache/3_2/compiler_lookups.o \
nimcache/3_2/compiler_semdata.o \
nimcache/3_2/compiler_treetab.o \
nimcache/3_2/compiler_evals.o \
nimcache/3_2/compiler_semfold.o \
nimcache/3_2/compiler_saturate.o \
nimcache/3_2/compiler_transf.o \
nimcache/3_2/compiler_cgmeth.o \
nimcache/3_2/compiler_sempass2.o \
nimcache/3_2/compiler_guards.o \
nimcache/3_2/compiler_lambdalifting.o \
nimcache/3_2/compiler_evaltempl.o \
nimcache/3_2/compiler_sem.o \
nimcache/3_2/compiler_procfind.o \
nimcache/3_2/compiler_pragmas.o \
nimcache/3_2/compiler_semtypinst.o \
nimcache/3_2/compiler_sigmatch.o \
nimcache/3_2/compiler_parampatterns.o \
nimcache/3_2/compiler_docgen.o \
nimcache/3_2/docutils_rstast.o \
nimcache/3_2/docutils_rst.o \
nimcache/3_2/docutils_rstgen.o \
nimcache/3_2/docutils_highlite.o \
nimcache/3_2/pure_json.o \
nimcache/3_2/pure_lexbase.o \
nimcache/3_2/pure_unicode.o \
nimcache/3_2/pure_algorithm.o \
nimcache/3_2/collections_sequtils.o \
nimcache/3_2/compiler_aliases.o \
nimcache/3_2/compiler_patterns.o \
nimcache/3_2/compiler_cgen.o \
nimcache/3_2/compiler_ccgutils.o \
nimcache/3_2/compiler_cgendata.o \
nimcache/3_2/compiler_ccgmerge.o \
nimcache/3_2/compiler_jsgen.o \
nimcache/3_2/compiler_passaux.o \
nimcache/3_2/compiler_depends.o \
nimcache/3_2/compiler_docgen2.o \
nimcache/3_2/compiler_service.o \
nimcache/3_2/pure_parseopt.o \
nimcache/3_2/compiler_modules.o \
nimcache/3_2/compiler_pretty.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_nimrod.c -o nimcache/3_3/compiler_nimrod.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_nimrod.c -o nimcache/3_3/compiler_nimrod.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/Nimrod_system.c -o nimcache/3_3/Nimrod_system.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/Nimrod_system.c -o nimcache/3_3/Nimrod_system.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_testability.c -o nimcache/3_3/compiler_testability.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_testability.c -o nimcache/3_3/compiler_testability.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_commands.c -o nimcache/3_3/compiler_commands.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_commands.c -o nimcache/3_3/compiler_commands.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_os.c -o nimcache/3_3/pure_os.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_os.c -o nimcache/3_3/pure_os.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_strutils.c -o nimcache/3_3/pure_strutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_strutils.c -o nimcache/3_3/pure_strutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_parseutils.c -o nimcache/3_3/pure_parseutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_parseutils.c -o nimcache/3_3/pure_parseutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_times.c -o nimcache/3_3/pure_times.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_times.c -o nimcache/3_3/pure_times.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/posix_posix.c -o nimcache/3_3/posix_posix.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/posix_posix.c -o nimcache/3_3/posix_posix.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_msgs.c -o nimcache/3_3/compiler_msgs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_msgs.c -o nimcache/3_3/compiler_msgs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_options.c -o nimcache/3_3/compiler_options.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_options.c -o nimcache/3_3/compiler_options.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_lists.c -o nimcache/3_3/compiler_lists.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_lists.c -o nimcache/3_3/compiler_lists.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_strtabs.c -o nimcache/3_3/pure_strtabs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_strtabs.c -o nimcache/3_3/pure_strtabs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_hashes.c -o nimcache/3_3/pure_hashes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_hashes.c -o nimcache/3_3/pure_hashes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/collections_tables.c -o nimcache/3_3/collections_tables.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/collections_tables.c -o nimcache/3_3/collections_tables.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_math.c -o nimcache/3_3/pure_math.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_math.c -o nimcache/3_3/pure_math.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_ropes.c -o nimcache/3_3/compiler_ropes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_ropes.c -o nimcache/3_3/compiler_ropes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_platform.c -o nimcache/3_3/compiler_platform.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_platform.c -o nimcache/3_3/compiler_platform.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_crc.c -o nimcache/3_3/compiler_crc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_crc.c -o nimcache/3_3/compiler_crc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_sockets.c -o nimcache/3_3/pure_sockets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_sockets.c -o nimcache/3_3/pure_sockets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/core_unsigned.c -o nimcache/3_3/core_unsigned.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/core_unsigned.c -o nimcache/3_3/core_unsigned.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_nversion.c -o nimcache/3_3/compiler_nversion.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_nversion.c -o nimcache/3_3/compiler_nversion.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_condsyms.c -o nimcache/3_3/compiler_condsyms.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_condsyms.c -o nimcache/3_3/compiler_condsyms.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_idents.c -o nimcache/3_3/compiler_idents.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_idents.c -o nimcache/3_3/compiler_idents.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_extccomp.c -o nimcache/3_3/compiler_extccomp.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_extccomp.c -o nimcache/3_3/compiler_extccomp.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_osproc.c -o nimcache/3_3/pure_osproc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_osproc.c -o nimcache/3_3/pure_osproc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_streams.c -o nimcache/3_3/pure_streams.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_streams.c -o nimcache/3_3/pure_streams.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_wordrecg.c -o nimcache/3_3/compiler_wordrecg.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_wordrecg.c -o nimcache/3_3/compiler_wordrecg.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_babelcmd.c -o nimcache/3_3/compiler_babelcmd.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_babelcmd.c -o nimcache/3_3/compiler_babelcmd.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_lexer.c -o nimcache/3_3/compiler_lexer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_lexer.c -o nimcache/3_3/compiler_lexer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_nimlexbase.c -o nimcache/3_3/compiler_nimlexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_nimlexbase.c -o nimcache/3_3/compiler_nimlexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_llstream.c -o nimcache/3_3/compiler_llstream.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_llstream.c -o nimcache/3_3/compiler_llstream.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_nimconf.c -o nimcache/3_3/compiler_nimconf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_nimconf.c -o nimcache/3_3/compiler_nimconf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_main.c -o nimcache/3_3/compiler_main.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_main.c -o nimcache/3_3/compiler_main.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_ast.c -o nimcache/3_3/compiler_ast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_ast.c -o nimcache/3_3/compiler_ast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/collections_intsets.c -o nimcache/3_3/collections_intsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/collections_intsets.c -o nimcache/3_3/collections_intsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_idgen.c -o nimcache/3_3/compiler_idgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_idgen.c -o nimcache/3_3/compiler_idgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_astalgo.c -o nimcache/3_3/compiler_astalgo.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_astalgo.c -o nimcache/3_3/compiler_astalgo.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_rodutils.c -o nimcache/3_3/compiler_rodutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_rodutils.c -o nimcache/3_3/compiler_rodutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_syntaxes.c -o nimcache/3_3/compiler_syntaxes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_syntaxes.c -o nimcache/3_3/compiler_syntaxes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_parser.c -o nimcache/3_3/compiler_parser.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_parser.c -o nimcache/3_3/compiler_parser.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_pbraces.c -o nimcache/3_3/compiler_pbraces.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_pbraces.c -o nimcache/3_3/compiler_pbraces.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_filters.c -o nimcache/3_3/compiler_filters.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_filters.c -o nimcache/3_3/compiler_filters.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_renderer.c -o nimcache/3_3/compiler_renderer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_renderer.c -o nimcache/3_3/compiler_renderer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_filter_tmpl.c -o nimcache/3_3/compiler_filter_tmpl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_filter_tmpl.c -o nimcache/3_3/compiler_filter_tmpl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_rodread.c -o nimcache/3_3/compiler_rodread.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_rodread.c -o nimcache/3_3/compiler_rodread.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_types.c -o nimcache/3_3/compiler_types.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_types.c -o nimcache/3_3/compiler_types.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_trees.c -o nimcache/3_3/compiler_trees.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_trees.c -o nimcache/3_3/compiler_trees.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_memfiles.c -o nimcache/3_3/pure_memfiles.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_memfiles.c -o nimcache/3_3/pure_memfiles.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_rodwrite.c -o nimcache/3_3/compiler_rodwrite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_rodwrite.c -o nimcache/3_3/compiler_rodwrite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_passes.c -o nimcache/3_3/compiler_passes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_passes.c -o nimcache/3_3/compiler_passes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_magicsys.c -o nimcache/3_3/compiler_magicsys.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_magicsys.c -o nimcache/3_3/compiler_magicsys.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_nimsets.c -o nimcache/3_3/compiler_nimsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_nimsets.c -o nimcache/3_3/compiler_nimsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_bitsets.c -o nimcache/3_3/compiler_bitsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_bitsets.c -o nimcache/3_3/compiler_bitsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_semthreads.c -o nimcache/3_3/compiler_semthreads.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_semthreads.c -o nimcache/3_3/compiler_semthreads.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_importer.c -o nimcache/3_3/compiler_importer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_importer.c -o nimcache/3_3/compiler_importer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_lookups.c -o nimcache/3_3/compiler_lookups.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_lookups.c -o nimcache/3_3/compiler_lookups.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_semdata.c -o nimcache/3_3/compiler_semdata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_semdata.c -o nimcache/3_3/compiler_semdata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_treetab.c -o nimcache/3_3/compiler_treetab.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_treetab.c -o nimcache/3_3/compiler_treetab.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_evals.c -o nimcache/3_3/compiler_evals.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_evals.c -o nimcache/3_3/compiler_evals.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_semfold.c -o nimcache/3_3/compiler_semfold.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_semfold.c -o nimcache/3_3/compiler_semfold.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_saturate.c -o nimcache/3_3/compiler_saturate.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_saturate.c -o nimcache/3_3/compiler_saturate.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_transf.c -o nimcache/3_3/compiler_transf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_transf.c -o nimcache/3_3/compiler_transf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_cgmeth.c -o nimcache/3_3/compiler_cgmeth.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_cgmeth.c -o nimcache/3_3/compiler_cgmeth.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_sempass2.c -o nimcache/3_3/compiler_sempass2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_sempass2.c -o nimcache/3_3/compiler_sempass2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_guards.c -o nimcache/3_3/compiler_guards.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_guards.c -o nimcache/3_3/compiler_guards.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_lambdalifting.c -o nimcache/3_3/compiler_lambdalifting.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_lambdalifting.c -o nimcache/3_3/compiler_lambdalifting.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_evaltempl.c -o nimcache/3_3/compiler_evaltempl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_evaltempl.c -o nimcache/3_3/compiler_evaltempl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_sem.c -o nimcache/3_3/compiler_sem.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_sem.c -o nimcache/3_3/compiler_sem.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_procfind.c -o nimcache/3_3/compiler_procfind.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_procfind.c -o nimcache/3_3/compiler_procfind.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_pragmas.c -o nimcache/3_3/compiler_pragmas.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_pragmas.c -o nimcache/3_3/compiler_pragmas.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_semtypinst.c -o nimcache/3_3/compiler_semtypinst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_semtypinst.c -o nimcache/3_3/compiler_semtypinst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_sigmatch.c -o nimcache/3_3/compiler_sigmatch.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_sigmatch.c -o nimcache/3_3/compiler_sigmatch.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_parampatterns.c -o nimcache/3_3/compiler_parampatterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_parampatterns.c -o nimcache/3_3/compiler_parampatterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_docgen.c -o nimcache/3_3/compiler_docgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_docgen.c -o nimcache/3_3/compiler_docgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/docutils_rstast.c -o nimcache/3_3/docutils_rstast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/docutils_rstast.c -o nimcache/3_3/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/docutils_rst.c -o nimcache/3_3/docutils_rst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/docutils_rst.c -o nimcache/3_3/docutils_rst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/docutils_rstgen.c -o nimcache/3_3/docutils_rstgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/docutils_rstgen.c -o nimcache/3_3/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/docutils_highlite.c -o nimcache/3_3/docutils_highlite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/docutils_highlite.c -o nimcache/3_3/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_json.c -o nimcache/3_3/pure_json.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_json.c -o nimcache/3_3/pure_json.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_lexbase.c -o nimcache/3_3/pure_lexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_lexbase.c -o nimcache/3_3/pure_lexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_unicode.c -o nimcache/3_3/pure_unicode.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_unicode.c -o nimcache/3_3/pure_unicode.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_algorithm.c -o nimcache/3_3/pure_algorithm.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_algorithm.c -o nimcache/3_3/pure_algorithm.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/collections_sequtils.c -o nimcache/3_3/collections_sequtils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/collections_sequtils.c -o nimcache/3_3/collections_sequtils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_aliases.c -o nimcache/3_3/compiler_aliases.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_aliases.c -o nimcache/3_3/compiler_aliases.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_patterns.c -o nimcache/3_3/compiler_patterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_patterns.c -o nimcache/3_3/compiler_patterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_cgen.c -o nimcache/3_3/compiler_cgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_cgen.c -o nimcache/3_3/compiler_cgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_ccgutils.c -o nimcache/3_3/compiler_ccgutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_ccgutils.c -o nimcache/3_3/compiler_ccgutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_cgendata.c -o nimcache/3_3/compiler_cgendata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_cgendata.c -o nimcache/3_3/compiler_cgendata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_ccgmerge.c -o nimcache/3_3/compiler_ccgmerge.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_ccgmerge.c -o nimcache/3_3/compiler_ccgmerge.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_jsgen.c -o nimcache/3_3/compiler_jsgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_jsgen.c -o nimcache/3_3/compiler_jsgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_passaux.c -o nimcache/3_3/compiler_passaux.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_passaux.c -o nimcache/3_3/compiler_passaux.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_depends.c -o nimcache/3_3/compiler_depends.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_depends.c -o nimcache/3_3/compiler_depends.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_docgen2.c -o nimcache/3_3/compiler_docgen2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_docgen2.c -o nimcache/3_3/compiler_docgen2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_service.c -o nimcache/3_3/compiler_service.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_service.c -o nimcache/3_3/compiler_service.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_parseopt.c -o nimcache/3_3/pure_parseopt.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/pure_parseopt.c -o nimcache/3_3/pure_parseopt.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_modules.c -o nimcache/3_3/compiler_modules.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_modules.c -o nimcache/3_3/compiler_modules.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_pretty.c -o nimcache/3_3/compiler_pretty.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/3_3/compiler_pretty.c -o nimcache/3_3/compiler_pretty.o
    echo "$LINKER -o $binDir/nimrod  \
nimcache/3_3/compiler_nimrod.o \
nimcache/3_3/Nimrod_system.o \
nimcache/3_3/compiler_testability.o \
nimcache/3_3/compiler_commands.o \
nimcache/3_3/pure_os.o \
nimcache/3_3/pure_strutils.o \
nimcache/3_3/pure_parseutils.o \
nimcache/3_3/pure_times.o \
nimcache/3_3/posix_posix.o \
nimcache/3_3/compiler_msgs.o \
nimcache/3_3/compiler_options.o \
nimcache/3_3/compiler_lists.o \
nimcache/3_3/pure_strtabs.o \
nimcache/3_3/pure_hashes.o \
nimcache/3_3/collections_tables.o \
nimcache/3_3/pure_math.o \
nimcache/3_3/compiler_ropes.o \
nimcache/3_3/compiler_platform.o \
nimcache/3_3/compiler_crc.o \
nimcache/3_3/pure_sockets.o \
nimcache/3_3/core_unsigned.o \
nimcache/3_3/compiler_nversion.o \
nimcache/3_3/compiler_condsyms.o \
nimcache/3_3/compiler_idents.o \
nimcache/3_3/compiler_extccomp.o \
nimcache/3_3/pure_osproc.o \
nimcache/3_3/pure_streams.o \
nimcache/3_3/compiler_wordrecg.o \
nimcache/3_3/compiler_babelcmd.o \
nimcache/3_3/compiler_lexer.o \
nimcache/3_3/compiler_nimlexbase.o \
nimcache/3_3/compiler_llstream.o \
nimcache/3_3/compiler_nimconf.o \
nimcache/3_3/compiler_main.o \
nimcache/3_3/compiler_ast.o \
nimcache/3_3/collections_intsets.o \
nimcache/3_3/compiler_idgen.o \
nimcache/3_3/compiler_astalgo.o \
nimcache/3_3/compiler_rodutils.o \
nimcache/3_3/compiler_syntaxes.o \
nimcache/3_3/compiler_parser.o \
nimcache/3_3/compiler_pbraces.o \
nimcache/3_3/compiler_filters.o \
nimcache/3_3/compiler_renderer.o \
nimcache/3_3/compiler_filter_tmpl.o \
nimcache/3_3/compiler_rodread.o \
nimcache/3_3/compiler_types.o \
nimcache/3_3/compiler_trees.o \
nimcache/3_3/pure_memfiles.o \
nimcache/3_3/compiler_rodwrite.o \
nimcache/3_3/compiler_passes.o \
nimcache/3_3/compiler_magicsys.o \
nimcache/3_3/compiler_nimsets.o \
nimcache/3_3/compiler_bitsets.o \
nimcache/3_3/compiler_semthreads.o \
nimcache/3_3/compiler_importer.o \
nimcache/3_3/compiler_lookups.o \
nimcache/3_3/compiler_semdata.o \
nimcache/3_3/compiler_treetab.o \
nimcache/3_3/compiler_evals.o \
nimcache/3_3/compiler_semfold.o \
nimcache/3_3/compiler_saturate.o \
nimcache/3_3/compiler_transf.o \
nimcache/3_3/compiler_cgmeth.o \
nimcache/3_3/compiler_sempass2.o \
nimcache/3_3/compiler_guards.o \
nimcache/3_3/compiler_lambdalifting.o \
nimcache/3_3/compiler_evaltempl.o \
nimcache/3_3/compiler_sem.o \
nimcache/3_3/compiler_procfind.o \
nimcache/3_3/compiler_pragmas.o \
nimcache/3_3/compiler_semtypinst.o \
nimcache/3_3/compiler_sigmatch.o \
nimcache/3_3/compiler_parampatterns.o \
nimcache/3_3/compiler_docgen.o \
nimcache/3_3/docutils_rstast.o \
nimcache/3_3/docutils_rst.o \
nimcache/3_3/docutils_rstgen.o \
nimcache/3_3/docutils_highlite.o \
nimcache/3_3/pure_json.o \
nimcache/3_3/pure_lexbase.o \
nimcache/3_3/pure_unicode.o \
nimcache/3_3/pure_algorithm.o \
nimcache/3_3/collections_sequtils.o \
nimcache/3_3/compiler_aliases.o \
nimcache/3_3/compiler_patterns.o \
nimcache/3_3/compiler_cgen.o \
nimcache/3_3/compiler_ccgutils.o \
nimcache/3_3/compiler_cgendata.o \
nimcache/3_3/compiler_ccgmerge.o \
nimcache/3_3/compiler_jsgen.o \
nimcache/3_3/compiler_passaux.o \
nimcache/3_3/compiler_depends.o \
nimcache/3_3/compiler_docgen2.o \
nimcache/3_3/compiler_service.o \
nimcache/3_3/pure_parseopt.o \
nimcache/3_3/compiler_modules.o \
nimcache/3_3/compiler_pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
nimcache/3_3/compiler_nimrod.o \
nimcache/3_3/Nimrod_system.o \
nimcache/3_3/compiler_testability.o \
nimcache/3_3/compiler_commands.o \
nimcache/3_3/pure_os.o \
nimcache/3_3/pure_strutils.o \
nimcache/3_3/pure_parseutils.o \
nimcache/3_3/pure_times.o \
nimcache/3_3/posix_posix.o \
nimcache/3_3/compiler_msgs.o \
nimcache/3_3/compiler_options.o \
nimcache/3_3/compiler_lists.o \
nimcache/3_3/pure_strtabs.o \
nimcache/3_3/pure_hashes.o \
nimcache/3_3/collections_tables.o \
nimcache/3_3/pure_math.o \
nimcache/3_3/compiler_ropes.o \
nimcache/3_3/compiler_platform.o \
nimcache/3_3/compiler_crc.o \
nimcache/3_3/pure_sockets.o \
nimcache/3_3/core_unsigned.o \
nimcache/3_3/compiler_nversion.o \
nimcache/3_3/compiler_condsyms.o \
nimcache/3_3/compiler_idents.o \
nimcache/3_3/compiler_extccomp.o \
nimcache/3_3/pure_osproc.o \
nimcache/3_3/pure_streams.o \
nimcache/3_3/compiler_wordrecg.o \
nimcache/3_3/compiler_babelcmd.o \
nimcache/3_3/compiler_lexer.o \
nimcache/3_3/compiler_nimlexbase.o \
nimcache/3_3/compiler_llstream.o \
nimcache/3_3/compiler_nimconf.o \
nimcache/3_3/compiler_main.o \
nimcache/3_3/compiler_ast.o \
nimcache/3_3/collections_intsets.o \
nimcache/3_3/compiler_idgen.o \
nimcache/3_3/compiler_astalgo.o \
nimcache/3_3/compiler_rodutils.o \
nimcache/3_3/compiler_syntaxes.o \
nimcache/3_3/compiler_parser.o \
nimcache/3_3/compiler_pbraces.o \
nimcache/3_3/compiler_filters.o \
nimcache/3_3/compiler_renderer.o \
nimcache/3_3/compiler_filter_tmpl.o \
nimcache/3_3/compiler_rodread.o \
nimcache/3_3/compiler_types.o \
nimcache/3_3/compiler_trees.o \
nimcache/3_3/pure_memfiles.o \
nimcache/3_3/compiler_rodwrite.o \
nimcache/3_3/compiler_passes.o \
nimcache/3_3/compiler_magicsys.o \
nimcache/3_3/compiler_nimsets.o \
nimcache/3_3/compiler_bitsets.o \
nimcache/3_3/compiler_semthreads.o \
nimcache/3_3/compiler_importer.o \
nimcache/3_3/compiler_lookups.o \
nimcache/3_3/compiler_semdata.o \
nimcache/3_3/compiler_treetab.o \
nimcache/3_3/compiler_evals.o \
nimcache/3_3/compiler_semfold.o \
nimcache/3_3/compiler_saturate.o \
nimcache/3_3/compiler_transf.o \
nimcache/3_3/compiler_cgmeth.o \
nimcache/3_3/compiler_sempass2.o \
nimcache/3_3/compiler_guards.o \
nimcache/3_3/compiler_lambdalifting.o \
nimcache/3_3/compiler_evaltempl.o \
nimcache/3_3/compiler_sem.o \
nimcache/3_3/compiler_procfind.o \
nimcache/3_3/compiler_pragmas.o \
nimcache/3_3/compiler_semtypinst.o \
nimcache/3_3/compiler_sigmatch.o \
nimcache/3_3/compiler_parampatterns.o \
nimcache/3_3/compiler_docgen.o \
nimcache/3_3/docutils_rstast.o \
nimcache/3_3/docutils_rst.o \
nimcache/3_3/docutils_rstgen.o \
nimcache/3_3/docutils_highlite.o \
nimcache/3_3/pure_json.o \
nimcache/3_3/pure_lexbase.o \
nimcache/3_3/pure_unicode.o \
nimcache/3_3/pure_algorithm.o \
nimcache/3_3/collections_sequtils.o \
nimcache/3_3/compiler_aliases.o \
nimcache/3_3/compiler_patterns.o \
nimcache/3_3/compiler_cgen.o \
nimcache/3_3/compiler_ccgutils.o \
nimcache/3_3/compiler_cgendata.o \
nimcache/3_3/compiler_ccgmerge.o \
nimcache/3_3/compiler_jsgen.o \
nimcache/3_3/compiler_passaux.o \
nimcache/3_3/compiler_depends.o \
nimcache/3_3/compiler_docgen2.o \
nimcache/3_3/compiler_service.o \
nimcache/3_3/pure_parseopt.o \
nimcache/3_3/compiler_modules.o \
nimcache/3_3/compiler_pretty.o $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/nimrod  $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  $LINK_FLAGS
    ;;
  sparc)
    echo "$LINKER -o $binDir/nimrod  $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/nimrod  $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  $LINK_FLAGS
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
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_nimrod.c -o nimcache/4_1/compiler_nimrod.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_nimrod.c -o nimcache/4_1/compiler_nimrod.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/Nimrod_system.c -o nimcache/4_1/Nimrod_system.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/Nimrod_system.c -o nimcache/4_1/Nimrod_system.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_testability.c -o nimcache/4_1/compiler_testability.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_testability.c -o nimcache/4_1/compiler_testability.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_commands.c -o nimcache/4_1/compiler_commands.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_commands.c -o nimcache/4_1/compiler_commands.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_os.c -o nimcache/4_1/pure_os.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_os.c -o nimcache/4_1/pure_os.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_strutils.c -o nimcache/4_1/pure_strutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_strutils.c -o nimcache/4_1/pure_strutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_parseutils.c -o nimcache/4_1/pure_parseutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_parseutils.c -o nimcache/4_1/pure_parseutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_times.c -o nimcache/4_1/pure_times.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_times.c -o nimcache/4_1/pure_times.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/posix_posix.c -o nimcache/4_1/posix_posix.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/posix_posix.c -o nimcache/4_1/posix_posix.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_msgs.c -o nimcache/4_1/compiler_msgs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_msgs.c -o nimcache/4_1/compiler_msgs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_options.c -o nimcache/4_1/compiler_options.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_options.c -o nimcache/4_1/compiler_options.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_lists.c -o nimcache/4_1/compiler_lists.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_lists.c -o nimcache/4_1/compiler_lists.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_strtabs.c -o nimcache/4_1/pure_strtabs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_strtabs.c -o nimcache/4_1/pure_strtabs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_hashes.c -o nimcache/4_1/pure_hashes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_hashes.c -o nimcache/4_1/pure_hashes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/collections_tables.c -o nimcache/4_1/collections_tables.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/collections_tables.c -o nimcache/4_1/collections_tables.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_math.c -o nimcache/4_1/pure_math.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_math.c -o nimcache/4_1/pure_math.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_ropes.c -o nimcache/4_1/compiler_ropes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_ropes.c -o nimcache/4_1/compiler_ropes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_platform.c -o nimcache/4_1/compiler_platform.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_platform.c -o nimcache/4_1/compiler_platform.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_crc.c -o nimcache/4_1/compiler_crc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_crc.c -o nimcache/4_1/compiler_crc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_sockets.c -o nimcache/4_1/pure_sockets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_sockets.c -o nimcache/4_1/pure_sockets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/core_unsigned.c -o nimcache/4_1/core_unsigned.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/core_unsigned.c -o nimcache/4_1/core_unsigned.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_nversion.c -o nimcache/4_1/compiler_nversion.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_nversion.c -o nimcache/4_1/compiler_nversion.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_condsyms.c -o nimcache/4_1/compiler_condsyms.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_condsyms.c -o nimcache/4_1/compiler_condsyms.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_idents.c -o nimcache/4_1/compiler_idents.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_idents.c -o nimcache/4_1/compiler_idents.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_extccomp.c -o nimcache/4_1/compiler_extccomp.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_extccomp.c -o nimcache/4_1/compiler_extccomp.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_osproc.c -o nimcache/4_1/pure_osproc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_osproc.c -o nimcache/4_1/pure_osproc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_streams.c -o nimcache/4_1/pure_streams.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_streams.c -o nimcache/4_1/pure_streams.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_wordrecg.c -o nimcache/4_1/compiler_wordrecg.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_wordrecg.c -o nimcache/4_1/compiler_wordrecg.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_babelcmd.c -o nimcache/4_1/compiler_babelcmd.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_babelcmd.c -o nimcache/4_1/compiler_babelcmd.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_lexer.c -o nimcache/4_1/compiler_lexer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_lexer.c -o nimcache/4_1/compiler_lexer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_nimlexbase.c -o nimcache/4_1/compiler_nimlexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_nimlexbase.c -o nimcache/4_1/compiler_nimlexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_llstream.c -o nimcache/4_1/compiler_llstream.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_llstream.c -o nimcache/4_1/compiler_llstream.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_nimconf.c -o nimcache/4_1/compiler_nimconf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_nimconf.c -o nimcache/4_1/compiler_nimconf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_main.c -o nimcache/4_1/compiler_main.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_main.c -o nimcache/4_1/compiler_main.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_ast.c -o nimcache/4_1/compiler_ast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_ast.c -o nimcache/4_1/compiler_ast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/collections_intsets.c -o nimcache/4_1/collections_intsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/collections_intsets.c -o nimcache/4_1/collections_intsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_idgen.c -o nimcache/4_1/compiler_idgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_idgen.c -o nimcache/4_1/compiler_idgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_astalgo.c -o nimcache/4_1/compiler_astalgo.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_astalgo.c -o nimcache/4_1/compiler_astalgo.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_rodutils.c -o nimcache/4_1/compiler_rodutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_rodutils.c -o nimcache/4_1/compiler_rodutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_syntaxes.c -o nimcache/4_1/compiler_syntaxes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_syntaxes.c -o nimcache/4_1/compiler_syntaxes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_parser.c -o nimcache/4_1/compiler_parser.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_parser.c -o nimcache/4_1/compiler_parser.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_pbraces.c -o nimcache/4_1/compiler_pbraces.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_pbraces.c -o nimcache/4_1/compiler_pbraces.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_filters.c -o nimcache/4_1/compiler_filters.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_filters.c -o nimcache/4_1/compiler_filters.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_renderer.c -o nimcache/4_1/compiler_renderer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_renderer.c -o nimcache/4_1/compiler_renderer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_filter_tmpl.c -o nimcache/4_1/compiler_filter_tmpl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_filter_tmpl.c -o nimcache/4_1/compiler_filter_tmpl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_rodread.c -o nimcache/4_1/compiler_rodread.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_rodread.c -o nimcache/4_1/compiler_rodread.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_types.c -o nimcache/4_1/compiler_types.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_types.c -o nimcache/4_1/compiler_types.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_trees.c -o nimcache/4_1/compiler_trees.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_trees.c -o nimcache/4_1/compiler_trees.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_memfiles.c -o nimcache/4_1/pure_memfiles.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_memfiles.c -o nimcache/4_1/pure_memfiles.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_rodwrite.c -o nimcache/4_1/compiler_rodwrite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_rodwrite.c -o nimcache/4_1/compiler_rodwrite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_passes.c -o nimcache/4_1/compiler_passes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_passes.c -o nimcache/4_1/compiler_passes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_magicsys.c -o nimcache/4_1/compiler_magicsys.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_magicsys.c -o nimcache/4_1/compiler_magicsys.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_nimsets.c -o nimcache/4_1/compiler_nimsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_nimsets.c -o nimcache/4_1/compiler_nimsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_bitsets.c -o nimcache/4_1/compiler_bitsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_bitsets.c -o nimcache/4_1/compiler_bitsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_semthreads.c -o nimcache/4_1/compiler_semthreads.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_semthreads.c -o nimcache/4_1/compiler_semthreads.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_importer.c -o nimcache/4_1/compiler_importer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_importer.c -o nimcache/4_1/compiler_importer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_lookups.c -o nimcache/4_1/compiler_lookups.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_lookups.c -o nimcache/4_1/compiler_lookups.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_semdata.c -o nimcache/4_1/compiler_semdata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_semdata.c -o nimcache/4_1/compiler_semdata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_treetab.c -o nimcache/4_1/compiler_treetab.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_treetab.c -o nimcache/4_1/compiler_treetab.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_evals.c -o nimcache/4_1/compiler_evals.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_evals.c -o nimcache/4_1/compiler_evals.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_semfold.c -o nimcache/4_1/compiler_semfold.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_semfold.c -o nimcache/4_1/compiler_semfold.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_saturate.c -o nimcache/4_1/compiler_saturate.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_saturate.c -o nimcache/4_1/compiler_saturate.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_transf.c -o nimcache/4_1/compiler_transf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_transf.c -o nimcache/4_1/compiler_transf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_cgmeth.c -o nimcache/4_1/compiler_cgmeth.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_cgmeth.c -o nimcache/4_1/compiler_cgmeth.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_sempass2.c -o nimcache/4_1/compiler_sempass2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_sempass2.c -o nimcache/4_1/compiler_sempass2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_guards.c -o nimcache/4_1/compiler_guards.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_guards.c -o nimcache/4_1/compiler_guards.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_lambdalifting.c -o nimcache/4_1/compiler_lambdalifting.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_lambdalifting.c -o nimcache/4_1/compiler_lambdalifting.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_evaltempl.c -o nimcache/4_1/compiler_evaltempl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_evaltempl.c -o nimcache/4_1/compiler_evaltempl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_sem.c -o nimcache/4_1/compiler_sem.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_sem.c -o nimcache/4_1/compiler_sem.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_procfind.c -o nimcache/4_1/compiler_procfind.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_procfind.c -o nimcache/4_1/compiler_procfind.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_pragmas.c -o nimcache/4_1/compiler_pragmas.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_pragmas.c -o nimcache/4_1/compiler_pragmas.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_semtypinst.c -o nimcache/4_1/compiler_semtypinst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_semtypinst.c -o nimcache/4_1/compiler_semtypinst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_sigmatch.c -o nimcache/4_1/compiler_sigmatch.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_sigmatch.c -o nimcache/4_1/compiler_sigmatch.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_parampatterns.c -o nimcache/4_1/compiler_parampatterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_parampatterns.c -o nimcache/4_1/compiler_parampatterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_docgen.c -o nimcache/4_1/compiler_docgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_docgen.c -o nimcache/4_1/compiler_docgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/docutils_rstast.c -o nimcache/4_1/docutils_rstast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/docutils_rstast.c -o nimcache/4_1/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/docutils_rst.c -o nimcache/4_1/docutils_rst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/docutils_rst.c -o nimcache/4_1/docutils_rst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/docutils_rstgen.c -o nimcache/4_1/docutils_rstgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/docutils_rstgen.c -o nimcache/4_1/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/docutils_highlite.c -o nimcache/4_1/docutils_highlite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/docutils_highlite.c -o nimcache/4_1/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_json.c -o nimcache/4_1/pure_json.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_json.c -o nimcache/4_1/pure_json.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_lexbase.c -o nimcache/4_1/pure_lexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_lexbase.c -o nimcache/4_1/pure_lexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_unicode.c -o nimcache/4_1/pure_unicode.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_unicode.c -o nimcache/4_1/pure_unicode.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_algorithm.c -o nimcache/4_1/pure_algorithm.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_algorithm.c -o nimcache/4_1/pure_algorithm.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/collections_sequtils.c -o nimcache/4_1/collections_sequtils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/collections_sequtils.c -o nimcache/4_1/collections_sequtils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_aliases.c -o nimcache/4_1/compiler_aliases.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_aliases.c -o nimcache/4_1/compiler_aliases.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_patterns.c -o nimcache/4_1/compiler_patterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_patterns.c -o nimcache/4_1/compiler_patterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_cgen.c -o nimcache/4_1/compiler_cgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_cgen.c -o nimcache/4_1/compiler_cgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_ccgutils.c -o nimcache/4_1/compiler_ccgutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_ccgutils.c -o nimcache/4_1/compiler_ccgutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_cgendata.c -o nimcache/4_1/compiler_cgendata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_cgendata.c -o nimcache/4_1/compiler_cgendata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_ccgmerge.c -o nimcache/4_1/compiler_ccgmerge.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_ccgmerge.c -o nimcache/4_1/compiler_ccgmerge.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_jsgen.c -o nimcache/4_1/compiler_jsgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_jsgen.c -o nimcache/4_1/compiler_jsgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_passaux.c -o nimcache/4_1/compiler_passaux.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_passaux.c -o nimcache/4_1/compiler_passaux.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_depends.c -o nimcache/4_1/compiler_depends.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_depends.c -o nimcache/4_1/compiler_depends.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_docgen2.c -o nimcache/4_1/compiler_docgen2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_docgen2.c -o nimcache/4_1/compiler_docgen2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_service.c -o nimcache/4_1/compiler_service.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_service.c -o nimcache/4_1/compiler_service.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_parseopt.c -o nimcache/4_1/pure_parseopt.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/pure_parseopt.c -o nimcache/4_1/pure_parseopt.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_modules.c -o nimcache/4_1/compiler_modules.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_modules.c -o nimcache/4_1/compiler_modules.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_pretty.c -o nimcache/4_1/compiler_pretty.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_1/compiler_pretty.c -o nimcache/4_1/compiler_pretty.o
    echo "$LINKER -o $binDir/nimrod  \
nimcache/4_1/compiler_nimrod.o \
nimcache/4_1/Nimrod_system.o \
nimcache/4_1/compiler_testability.o \
nimcache/4_1/compiler_commands.o \
nimcache/4_1/pure_os.o \
nimcache/4_1/pure_strutils.o \
nimcache/4_1/pure_parseutils.o \
nimcache/4_1/pure_times.o \
nimcache/4_1/posix_posix.o \
nimcache/4_1/compiler_msgs.o \
nimcache/4_1/compiler_options.o \
nimcache/4_1/compiler_lists.o \
nimcache/4_1/pure_strtabs.o \
nimcache/4_1/pure_hashes.o \
nimcache/4_1/collections_tables.o \
nimcache/4_1/pure_math.o \
nimcache/4_1/compiler_ropes.o \
nimcache/4_1/compiler_platform.o \
nimcache/4_1/compiler_crc.o \
nimcache/4_1/pure_sockets.o \
nimcache/4_1/core_unsigned.o \
nimcache/4_1/compiler_nversion.o \
nimcache/4_1/compiler_condsyms.o \
nimcache/4_1/compiler_idents.o \
nimcache/4_1/compiler_extccomp.o \
nimcache/4_1/pure_osproc.o \
nimcache/4_1/pure_streams.o \
nimcache/4_1/compiler_wordrecg.o \
nimcache/4_1/compiler_babelcmd.o \
nimcache/4_1/compiler_lexer.o \
nimcache/4_1/compiler_nimlexbase.o \
nimcache/4_1/compiler_llstream.o \
nimcache/4_1/compiler_nimconf.o \
nimcache/4_1/compiler_main.o \
nimcache/4_1/compiler_ast.o \
nimcache/4_1/collections_intsets.o \
nimcache/4_1/compiler_idgen.o \
nimcache/4_1/compiler_astalgo.o \
nimcache/4_1/compiler_rodutils.o \
nimcache/4_1/compiler_syntaxes.o \
nimcache/4_1/compiler_parser.o \
nimcache/4_1/compiler_pbraces.o \
nimcache/4_1/compiler_filters.o \
nimcache/4_1/compiler_renderer.o \
nimcache/4_1/compiler_filter_tmpl.o \
nimcache/4_1/compiler_rodread.o \
nimcache/4_1/compiler_types.o \
nimcache/4_1/compiler_trees.o \
nimcache/4_1/pure_memfiles.o \
nimcache/4_1/compiler_rodwrite.o \
nimcache/4_1/compiler_passes.o \
nimcache/4_1/compiler_magicsys.o \
nimcache/4_1/compiler_nimsets.o \
nimcache/4_1/compiler_bitsets.o \
nimcache/4_1/compiler_semthreads.o \
nimcache/4_1/compiler_importer.o \
nimcache/4_1/compiler_lookups.o \
nimcache/4_1/compiler_semdata.o \
nimcache/4_1/compiler_treetab.o \
nimcache/4_1/compiler_evals.o \
nimcache/4_1/compiler_semfold.o \
nimcache/4_1/compiler_saturate.o \
nimcache/4_1/compiler_transf.o \
nimcache/4_1/compiler_cgmeth.o \
nimcache/4_1/compiler_sempass2.o \
nimcache/4_1/compiler_guards.o \
nimcache/4_1/compiler_lambdalifting.o \
nimcache/4_1/compiler_evaltempl.o \
nimcache/4_1/compiler_sem.o \
nimcache/4_1/compiler_procfind.o \
nimcache/4_1/compiler_pragmas.o \
nimcache/4_1/compiler_semtypinst.o \
nimcache/4_1/compiler_sigmatch.o \
nimcache/4_1/compiler_parampatterns.o \
nimcache/4_1/compiler_docgen.o \
nimcache/4_1/docutils_rstast.o \
nimcache/4_1/docutils_rst.o \
nimcache/4_1/docutils_rstgen.o \
nimcache/4_1/docutils_highlite.o \
nimcache/4_1/pure_json.o \
nimcache/4_1/pure_lexbase.o \
nimcache/4_1/pure_unicode.o \
nimcache/4_1/pure_algorithm.o \
nimcache/4_1/collections_sequtils.o \
nimcache/4_1/compiler_aliases.o \
nimcache/4_1/compiler_patterns.o \
nimcache/4_1/compiler_cgen.o \
nimcache/4_1/compiler_ccgutils.o \
nimcache/4_1/compiler_cgendata.o \
nimcache/4_1/compiler_ccgmerge.o \
nimcache/4_1/compiler_jsgen.o \
nimcache/4_1/compiler_passaux.o \
nimcache/4_1/compiler_depends.o \
nimcache/4_1/compiler_docgen2.o \
nimcache/4_1/compiler_service.o \
nimcache/4_1/pure_parseopt.o \
nimcache/4_1/compiler_modules.o \
nimcache/4_1/compiler_pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
nimcache/4_1/compiler_nimrod.o \
nimcache/4_1/Nimrod_system.o \
nimcache/4_1/compiler_testability.o \
nimcache/4_1/compiler_commands.o \
nimcache/4_1/pure_os.o \
nimcache/4_1/pure_strutils.o \
nimcache/4_1/pure_parseutils.o \
nimcache/4_1/pure_times.o \
nimcache/4_1/posix_posix.o \
nimcache/4_1/compiler_msgs.o \
nimcache/4_1/compiler_options.o \
nimcache/4_1/compiler_lists.o \
nimcache/4_1/pure_strtabs.o \
nimcache/4_1/pure_hashes.o \
nimcache/4_1/collections_tables.o \
nimcache/4_1/pure_math.o \
nimcache/4_1/compiler_ropes.o \
nimcache/4_1/compiler_platform.o \
nimcache/4_1/compiler_crc.o \
nimcache/4_1/pure_sockets.o \
nimcache/4_1/core_unsigned.o \
nimcache/4_1/compiler_nversion.o \
nimcache/4_1/compiler_condsyms.o \
nimcache/4_1/compiler_idents.o \
nimcache/4_1/compiler_extccomp.o \
nimcache/4_1/pure_osproc.o \
nimcache/4_1/pure_streams.o \
nimcache/4_1/compiler_wordrecg.o \
nimcache/4_1/compiler_babelcmd.o \
nimcache/4_1/compiler_lexer.o \
nimcache/4_1/compiler_nimlexbase.o \
nimcache/4_1/compiler_llstream.o \
nimcache/4_1/compiler_nimconf.o \
nimcache/4_1/compiler_main.o \
nimcache/4_1/compiler_ast.o \
nimcache/4_1/collections_intsets.o \
nimcache/4_1/compiler_idgen.o \
nimcache/4_1/compiler_astalgo.o \
nimcache/4_1/compiler_rodutils.o \
nimcache/4_1/compiler_syntaxes.o \
nimcache/4_1/compiler_parser.o \
nimcache/4_1/compiler_pbraces.o \
nimcache/4_1/compiler_filters.o \
nimcache/4_1/compiler_renderer.o \
nimcache/4_1/compiler_filter_tmpl.o \
nimcache/4_1/compiler_rodread.o \
nimcache/4_1/compiler_types.o \
nimcache/4_1/compiler_trees.o \
nimcache/4_1/pure_memfiles.o \
nimcache/4_1/compiler_rodwrite.o \
nimcache/4_1/compiler_passes.o \
nimcache/4_1/compiler_magicsys.o \
nimcache/4_1/compiler_nimsets.o \
nimcache/4_1/compiler_bitsets.o \
nimcache/4_1/compiler_semthreads.o \
nimcache/4_1/compiler_importer.o \
nimcache/4_1/compiler_lookups.o \
nimcache/4_1/compiler_semdata.o \
nimcache/4_1/compiler_treetab.o \
nimcache/4_1/compiler_evals.o \
nimcache/4_1/compiler_semfold.o \
nimcache/4_1/compiler_saturate.o \
nimcache/4_1/compiler_transf.o \
nimcache/4_1/compiler_cgmeth.o \
nimcache/4_1/compiler_sempass2.o \
nimcache/4_1/compiler_guards.o \
nimcache/4_1/compiler_lambdalifting.o \
nimcache/4_1/compiler_evaltempl.o \
nimcache/4_1/compiler_sem.o \
nimcache/4_1/compiler_procfind.o \
nimcache/4_1/compiler_pragmas.o \
nimcache/4_1/compiler_semtypinst.o \
nimcache/4_1/compiler_sigmatch.o \
nimcache/4_1/compiler_parampatterns.o \
nimcache/4_1/compiler_docgen.o \
nimcache/4_1/docutils_rstast.o \
nimcache/4_1/docutils_rst.o \
nimcache/4_1/docutils_rstgen.o \
nimcache/4_1/docutils_highlite.o \
nimcache/4_1/pure_json.o \
nimcache/4_1/pure_lexbase.o \
nimcache/4_1/pure_unicode.o \
nimcache/4_1/pure_algorithm.o \
nimcache/4_1/collections_sequtils.o \
nimcache/4_1/compiler_aliases.o \
nimcache/4_1/compiler_patterns.o \
nimcache/4_1/compiler_cgen.o \
nimcache/4_1/compiler_ccgutils.o \
nimcache/4_1/compiler_cgendata.o \
nimcache/4_1/compiler_ccgmerge.o \
nimcache/4_1/compiler_jsgen.o \
nimcache/4_1/compiler_passaux.o \
nimcache/4_1/compiler_depends.o \
nimcache/4_1/compiler_docgen2.o \
nimcache/4_1/compiler_service.o \
nimcache/4_1/pure_parseopt.o \
nimcache/4_1/compiler_modules.o \
nimcache/4_1/compiler_pretty.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_nimrod.c -o nimcache/4_2/compiler_nimrod.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_nimrod.c -o nimcache/4_2/compiler_nimrod.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/Nimrod_system.c -o nimcache/4_2/Nimrod_system.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/Nimrod_system.c -o nimcache/4_2/Nimrod_system.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_testability.c -o nimcache/4_2/compiler_testability.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_testability.c -o nimcache/4_2/compiler_testability.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_commands.c -o nimcache/4_2/compiler_commands.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_commands.c -o nimcache/4_2/compiler_commands.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_os.c -o nimcache/4_2/pure_os.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_os.c -o nimcache/4_2/pure_os.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_strutils.c -o nimcache/4_2/pure_strutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_strutils.c -o nimcache/4_2/pure_strutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_parseutils.c -o nimcache/4_2/pure_parseutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_parseutils.c -o nimcache/4_2/pure_parseutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_times.c -o nimcache/4_2/pure_times.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_times.c -o nimcache/4_2/pure_times.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/posix_posix.c -o nimcache/4_2/posix_posix.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/posix_posix.c -o nimcache/4_2/posix_posix.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_msgs.c -o nimcache/4_2/compiler_msgs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_msgs.c -o nimcache/4_2/compiler_msgs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_options.c -o nimcache/4_2/compiler_options.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_options.c -o nimcache/4_2/compiler_options.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_lists.c -o nimcache/4_2/compiler_lists.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_lists.c -o nimcache/4_2/compiler_lists.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_strtabs.c -o nimcache/4_2/pure_strtabs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_strtabs.c -o nimcache/4_2/pure_strtabs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_hashes.c -o nimcache/4_2/pure_hashes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_hashes.c -o nimcache/4_2/pure_hashes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/collections_tables.c -o nimcache/4_2/collections_tables.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/collections_tables.c -o nimcache/4_2/collections_tables.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_math.c -o nimcache/4_2/pure_math.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_math.c -o nimcache/4_2/pure_math.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_ropes.c -o nimcache/4_2/compiler_ropes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_ropes.c -o nimcache/4_2/compiler_ropes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_platform.c -o nimcache/4_2/compiler_platform.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_platform.c -o nimcache/4_2/compiler_platform.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_crc.c -o nimcache/4_2/compiler_crc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_crc.c -o nimcache/4_2/compiler_crc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_sockets.c -o nimcache/4_2/pure_sockets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_sockets.c -o nimcache/4_2/pure_sockets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/core_unsigned.c -o nimcache/4_2/core_unsigned.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/core_unsigned.c -o nimcache/4_2/core_unsigned.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_nversion.c -o nimcache/4_2/compiler_nversion.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_nversion.c -o nimcache/4_2/compiler_nversion.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_condsyms.c -o nimcache/4_2/compiler_condsyms.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_condsyms.c -o nimcache/4_2/compiler_condsyms.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_idents.c -o nimcache/4_2/compiler_idents.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_idents.c -o nimcache/4_2/compiler_idents.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_extccomp.c -o nimcache/4_2/compiler_extccomp.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_extccomp.c -o nimcache/4_2/compiler_extccomp.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_osproc.c -o nimcache/4_2/pure_osproc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_osproc.c -o nimcache/4_2/pure_osproc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_streams.c -o nimcache/4_2/pure_streams.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_streams.c -o nimcache/4_2/pure_streams.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_wordrecg.c -o nimcache/4_2/compiler_wordrecg.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_wordrecg.c -o nimcache/4_2/compiler_wordrecg.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_babelcmd.c -o nimcache/4_2/compiler_babelcmd.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_babelcmd.c -o nimcache/4_2/compiler_babelcmd.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_lexer.c -o nimcache/4_2/compiler_lexer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_lexer.c -o nimcache/4_2/compiler_lexer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_nimlexbase.c -o nimcache/4_2/compiler_nimlexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_nimlexbase.c -o nimcache/4_2/compiler_nimlexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_llstream.c -o nimcache/4_2/compiler_llstream.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_llstream.c -o nimcache/4_2/compiler_llstream.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_nimconf.c -o nimcache/4_2/compiler_nimconf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_nimconf.c -o nimcache/4_2/compiler_nimconf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_main.c -o nimcache/4_2/compiler_main.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_main.c -o nimcache/4_2/compiler_main.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_ast.c -o nimcache/4_2/compiler_ast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_ast.c -o nimcache/4_2/compiler_ast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/collections_intsets.c -o nimcache/4_2/collections_intsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/collections_intsets.c -o nimcache/4_2/collections_intsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_idgen.c -o nimcache/4_2/compiler_idgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_idgen.c -o nimcache/4_2/compiler_idgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_astalgo.c -o nimcache/4_2/compiler_astalgo.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_astalgo.c -o nimcache/4_2/compiler_astalgo.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_rodutils.c -o nimcache/4_2/compiler_rodutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_rodutils.c -o nimcache/4_2/compiler_rodutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_syntaxes.c -o nimcache/4_2/compiler_syntaxes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_syntaxes.c -o nimcache/4_2/compiler_syntaxes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_parser.c -o nimcache/4_2/compiler_parser.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_parser.c -o nimcache/4_2/compiler_parser.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_pbraces.c -o nimcache/4_2/compiler_pbraces.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_pbraces.c -o nimcache/4_2/compiler_pbraces.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_filters.c -o nimcache/4_2/compiler_filters.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_filters.c -o nimcache/4_2/compiler_filters.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_renderer.c -o nimcache/4_2/compiler_renderer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_renderer.c -o nimcache/4_2/compiler_renderer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_filter_tmpl.c -o nimcache/4_2/compiler_filter_tmpl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_filter_tmpl.c -o nimcache/4_2/compiler_filter_tmpl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_rodread.c -o nimcache/4_2/compiler_rodread.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_rodread.c -o nimcache/4_2/compiler_rodread.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_types.c -o nimcache/4_2/compiler_types.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_types.c -o nimcache/4_2/compiler_types.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_trees.c -o nimcache/4_2/compiler_trees.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_trees.c -o nimcache/4_2/compiler_trees.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_memfiles.c -o nimcache/4_2/pure_memfiles.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_memfiles.c -o nimcache/4_2/pure_memfiles.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_rodwrite.c -o nimcache/4_2/compiler_rodwrite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_rodwrite.c -o nimcache/4_2/compiler_rodwrite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_passes.c -o nimcache/4_2/compiler_passes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_passes.c -o nimcache/4_2/compiler_passes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_magicsys.c -o nimcache/4_2/compiler_magicsys.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_magicsys.c -o nimcache/4_2/compiler_magicsys.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_nimsets.c -o nimcache/4_2/compiler_nimsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_nimsets.c -o nimcache/4_2/compiler_nimsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_bitsets.c -o nimcache/4_2/compiler_bitsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_bitsets.c -o nimcache/4_2/compiler_bitsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_semthreads.c -o nimcache/4_2/compiler_semthreads.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_semthreads.c -o nimcache/4_2/compiler_semthreads.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_importer.c -o nimcache/4_2/compiler_importer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_importer.c -o nimcache/4_2/compiler_importer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_lookups.c -o nimcache/4_2/compiler_lookups.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_lookups.c -o nimcache/4_2/compiler_lookups.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_semdata.c -o nimcache/4_2/compiler_semdata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_semdata.c -o nimcache/4_2/compiler_semdata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_treetab.c -o nimcache/4_2/compiler_treetab.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_treetab.c -o nimcache/4_2/compiler_treetab.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_evals.c -o nimcache/4_2/compiler_evals.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_evals.c -o nimcache/4_2/compiler_evals.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_semfold.c -o nimcache/4_2/compiler_semfold.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_semfold.c -o nimcache/4_2/compiler_semfold.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_saturate.c -o nimcache/4_2/compiler_saturate.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_saturate.c -o nimcache/4_2/compiler_saturate.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_transf.c -o nimcache/4_2/compiler_transf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_transf.c -o nimcache/4_2/compiler_transf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_cgmeth.c -o nimcache/4_2/compiler_cgmeth.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_cgmeth.c -o nimcache/4_2/compiler_cgmeth.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_sempass2.c -o nimcache/4_2/compiler_sempass2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_sempass2.c -o nimcache/4_2/compiler_sempass2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_guards.c -o nimcache/4_2/compiler_guards.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_guards.c -o nimcache/4_2/compiler_guards.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_lambdalifting.c -o nimcache/4_2/compiler_lambdalifting.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_lambdalifting.c -o nimcache/4_2/compiler_lambdalifting.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_evaltempl.c -o nimcache/4_2/compiler_evaltempl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_evaltempl.c -o nimcache/4_2/compiler_evaltempl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_sem.c -o nimcache/4_2/compiler_sem.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_sem.c -o nimcache/4_2/compiler_sem.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_procfind.c -o nimcache/4_2/compiler_procfind.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_procfind.c -o nimcache/4_2/compiler_procfind.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_pragmas.c -o nimcache/4_2/compiler_pragmas.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_pragmas.c -o nimcache/4_2/compiler_pragmas.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_semtypinst.c -o nimcache/4_2/compiler_semtypinst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_semtypinst.c -o nimcache/4_2/compiler_semtypinst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_sigmatch.c -o nimcache/4_2/compiler_sigmatch.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_sigmatch.c -o nimcache/4_2/compiler_sigmatch.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_parampatterns.c -o nimcache/4_2/compiler_parampatterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_parampatterns.c -o nimcache/4_2/compiler_parampatterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_docgen.c -o nimcache/4_2/compiler_docgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_docgen.c -o nimcache/4_2/compiler_docgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/docutils_rstast.c -o nimcache/4_2/docutils_rstast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/docutils_rstast.c -o nimcache/4_2/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/docutils_rst.c -o nimcache/4_2/docutils_rst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/docutils_rst.c -o nimcache/4_2/docutils_rst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/docutils_rstgen.c -o nimcache/4_2/docutils_rstgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/docutils_rstgen.c -o nimcache/4_2/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/docutils_highlite.c -o nimcache/4_2/docutils_highlite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/docutils_highlite.c -o nimcache/4_2/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_json.c -o nimcache/4_2/pure_json.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_json.c -o nimcache/4_2/pure_json.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_lexbase.c -o nimcache/4_2/pure_lexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_lexbase.c -o nimcache/4_2/pure_lexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_unicode.c -o nimcache/4_2/pure_unicode.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_unicode.c -o nimcache/4_2/pure_unicode.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_algorithm.c -o nimcache/4_2/pure_algorithm.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_algorithm.c -o nimcache/4_2/pure_algorithm.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/collections_sequtils.c -o nimcache/4_2/collections_sequtils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/collections_sequtils.c -o nimcache/4_2/collections_sequtils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_aliases.c -o nimcache/4_2/compiler_aliases.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_aliases.c -o nimcache/4_2/compiler_aliases.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_patterns.c -o nimcache/4_2/compiler_patterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_patterns.c -o nimcache/4_2/compiler_patterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_cgen.c -o nimcache/4_2/compiler_cgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_cgen.c -o nimcache/4_2/compiler_cgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_ccgutils.c -o nimcache/4_2/compiler_ccgutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_ccgutils.c -o nimcache/4_2/compiler_ccgutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_cgendata.c -o nimcache/4_2/compiler_cgendata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_cgendata.c -o nimcache/4_2/compiler_cgendata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_ccgmerge.c -o nimcache/4_2/compiler_ccgmerge.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_ccgmerge.c -o nimcache/4_2/compiler_ccgmerge.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_jsgen.c -o nimcache/4_2/compiler_jsgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_jsgen.c -o nimcache/4_2/compiler_jsgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_passaux.c -o nimcache/4_2/compiler_passaux.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_passaux.c -o nimcache/4_2/compiler_passaux.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_depends.c -o nimcache/4_2/compiler_depends.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_depends.c -o nimcache/4_2/compiler_depends.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_docgen2.c -o nimcache/4_2/compiler_docgen2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_docgen2.c -o nimcache/4_2/compiler_docgen2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_service.c -o nimcache/4_2/compiler_service.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_service.c -o nimcache/4_2/compiler_service.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_parseopt.c -o nimcache/4_2/pure_parseopt.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/pure_parseopt.c -o nimcache/4_2/pure_parseopt.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_modules.c -o nimcache/4_2/compiler_modules.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_modules.c -o nimcache/4_2/compiler_modules.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_pretty.c -o nimcache/4_2/compiler_pretty.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_2/compiler_pretty.c -o nimcache/4_2/compiler_pretty.o
    echo "$LINKER -o $binDir/nimrod  \
nimcache/4_2/compiler_nimrod.o \
nimcache/4_2/Nimrod_system.o \
nimcache/4_2/compiler_testability.o \
nimcache/4_2/compiler_commands.o \
nimcache/4_2/pure_os.o \
nimcache/4_2/pure_strutils.o \
nimcache/4_2/pure_parseutils.o \
nimcache/4_2/pure_times.o \
nimcache/4_2/posix_posix.o \
nimcache/4_2/compiler_msgs.o \
nimcache/4_2/compiler_options.o \
nimcache/4_2/compiler_lists.o \
nimcache/4_2/pure_strtabs.o \
nimcache/4_2/pure_hashes.o \
nimcache/4_2/collections_tables.o \
nimcache/4_2/pure_math.o \
nimcache/4_2/compiler_ropes.o \
nimcache/4_2/compiler_platform.o \
nimcache/4_2/compiler_crc.o \
nimcache/4_2/pure_sockets.o \
nimcache/4_2/core_unsigned.o \
nimcache/4_2/compiler_nversion.o \
nimcache/4_2/compiler_condsyms.o \
nimcache/4_2/compiler_idents.o \
nimcache/4_2/compiler_extccomp.o \
nimcache/4_2/pure_osproc.o \
nimcache/4_2/pure_streams.o \
nimcache/4_2/compiler_wordrecg.o \
nimcache/4_2/compiler_babelcmd.o \
nimcache/4_2/compiler_lexer.o \
nimcache/4_2/compiler_nimlexbase.o \
nimcache/4_2/compiler_llstream.o \
nimcache/4_2/compiler_nimconf.o \
nimcache/4_2/compiler_main.o \
nimcache/4_2/compiler_ast.o \
nimcache/4_2/collections_intsets.o \
nimcache/4_2/compiler_idgen.o \
nimcache/4_2/compiler_astalgo.o \
nimcache/4_2/compiler_rodutils.o \
nimcache/4_2/compiler_syntaxes.o \
nimcache/4_2/compiler_parser.o \
nimcache/4_2/compiler_pbraces.o \
nimcache/4_2/compiler_filters.o \
nimcache/4_2/compiler_renderer.o \
nimcache/4_2/compiler_filter_tmpl.o \
nimcache/4_2/compiler_rodread.o \
nimcache/4_2/compiler_types.o \
nimcache/4_2/compiler_trees.o \
nimcache/4_2/pure_memfiles.o \
nimcache/4_2/compiler_rodwrite.o \
nimcache/4_2/compiler_passes.o \
nimcache/4_2/compiler_magicsys.o \
nimcache/4_2/compiler_nimsets.o \
nimcache/4_2/compiler_bitsets.o \
nimcache/4_2/compiler_semthreads.o \
nimcache/4_2/compiler_importer.o \
nimcache/4_2/compiler_lookups.o \
nimcache/4_2/compiler_semdata.o \
nimcache/4_2/compiler_treetab.o \
nimcache/4_2/compiler_evals.o \
nimcache/4_2/compiler_semfold.o \
nimcache/4_2/compiler_saturate.o \
nimcache/4_2/compiler_transf.o \
nimcache/4_2/compiler_cgmeth.o \
nimcache/4_2/compiler_sempass2.o \
nimcache/4_2/compiler_guards.o \
nimcache/4_2/compiler_lambdalifting.o \
nimcache/4_2/compiler_evaltempl.o \
nimcache/4_2/compiler_sem.o \
nimcache/4_2/compiler_procfind.o \
nimcache/4_2/compiler_pragmas.o \
nimcache/4_2/compiler_semtypinst.o \
nimcache/4_2/compiler_sigmatch.o \
nimcache/4_2/compiler_parampatterns.o \
nimcache/4_2/compiler_docgen.o \
nimcache/4_2/docutils_rstast.o \
nimcache/4_2/docutils_rst.o \
nimcache/4_2/docutils_rstgen.o \
nimcache/4_2/docutils_highlite.o \
nimcache/4_2/pure_json.o \
nimcache/4_2/pure_lexbase.o \
nimcache/4_2/pure_unicode.o \
nimcache/4_2/pure_algorithm.o \
nimcache/4_2/collections_sequtils.o \
nimcache/4_2/compiler_aliases.o \
nimcache/4_2/compiler_patterns.o \
nimcache/4_2/compiler_cgen.o \
nimcache/4_2/compiler_ccgutils.o \
nimcache/4_2/compiler_cgendata.o \
nimcache/4_2/compiler_ccgmerge.o \
nimcache/4_2/compiler_jsgen.o \
nimcache/4_2/compiler_passaux.o \
nimcache/4_2/compiler_depends.o \
nimcache/4_2/compiler_docgen2.o \
nimcache/4_2/compiler_service.o \
nimcache/4_2/pure_parseopt.o \
nimcache/4_2/compiler_modules.o \
nimcache/4_2/compiler_pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
nimcache/4_2/compiler_nimrod.o \
nimcache/4_2/Nimrod_system.o \
nimcache/4_2/compiler_testability.o \
nimcache/4_2/compiler_commands.o \
nimcache/4_2/pure_os.o \
nimcache/4_2/pure_strutils.o \
nimcache/4_2/pure_parseutils.o \
nimcache/4_2/pure_times.o \
nimcache/4_2/posix_posix.o \
nimcache/4_2/compiler_msgs.o \
nimcache/4_2/compiler_options.o \
nimcache/4_2/compiler_lists.o \
nimcache/4_2/pure_strtabs.o \
nimcache/4_2/pure_hashes.o \
nimcache/4_2/collections_tables.o \
nimcache/4_2/pure_math.o \
nimcache/4_2/compiler_ropes.o \
nimcache/4_2/compiler_platform.o \
nimcache/4_2/compiler_crc.o \
nimcache/4_2/pure_sockets.o \
nimcache/4_2/core_unsigned.o \
nimcache/4_2/compiler_nversion.o \
nimcache/4_2/compiler_condsyms.o \
nimcache/4_2/compiler_idents.o \
nimcache/4_2/compiler_extccomp.o \
nimcache/4_2/pure_osproc.o \
nimcache/4_2/pure_streams.o \
nimcache/4_2/compiler_wordrecg.o \
nimcache/4_2/compiler_babelcmd.o \
nimcache/4_2/compiler_lexer.o \
nimcache/4_2/compiler_nimlexbase.o \
nimcache/4_2/compiler_llstream.o \
nimcache/4_2/compiler_nimconf.o \
nimcache/4_2/compiler_main.o \
nimcache/4_2/compiler_ast.o \
nimcache/4_2/collections_intsets.o \
nimcache/4_2/compiler_idgen.o \
nimcache/4_2/compiler_astalgo.o \
nimcache/4_2/compiler_rodutils.o \
nimcache/4_2/compiler_syntaxes.o \
nimcache/4_2/compiler_parser.o \
nimcache/4_2/compiler_pbraces.o \
nimcache/4_2/compiler_filters.o \
nimcache/4_2/compiler_renderer.o \
nimcache/4_2/compiler_filter_tmpl.o \
nimcache/4_2/compiler_rodread.o \
nimcache/4_2/compiler_types.o \
nimcache/4_2/compiler_trees.o \
nimcache/4_2/pure_memfiles.o \
nimcache/4_2/compiler_rodwrite.o \
nimcache/4_2/compiler_passes.o \
nimcache/4_2/compiler_magicsys.o \
nimcache/4_2/compiler_nimsets.o \
nimcache/4_2/compiler_bitsets.o \
nimcache/4_2/compiler_semthreads.o \
nimcache/4_2/compiler_importer.o \
nimcache/4_2/compiler_lookups.o \
nimcache/4_2/compiler_semdata.o \
nimcache/4_2/compiler_treetab.o \
nimcache/4_2/compiler_evals.o \
nimcache/4_2/compiler_semfold.o \
nimcache/4_2/compiler_saturate.o \
nimcache/4_2/compiler_transf.o \
nimcache/4_2/compiler_cgmeth.o \
nimcache/4_2/compiler_sempass2.o \
nimcache/4_2/compiler_guards.o \
nimcache/4_2/compiler_lambdalifting.o \
nimcache/4_2/compiler_evaltempl.o \
nimcache/4_2/compiler_sem.o \
nimcache/4_2/compiler_procfind.o \
nimcache/4_2/compiler_pragmas.o \
nimcache/4_2/compiler_semtypinst.o \
nimcache/4_2/compiler_sigmatch.o \
nimcache/4_2/compiler_parampatterns.o \
nimcache/4_2/compiler_docgen.o \
nimcache/4_2/docutils_rstast.o \
nimcache/4_2/docutils_rst.o \
nimcache/4_2/docutils_rstgen.o \
nimcache/4_2/docutils_highlite.o \
nimcache/4_2/pure_json.o \
nimcache/4_2/pure_lexbase.o \
nimcache/4_2/pure_unicode.o \
nimcache/4_2/pure_algorithm.o \
nimcache/4_2/collections_sequtils.o \
nimcache/4_2/compiler_aliases.o \
nimcache/4_2/compiler_patterns.o \
nimcache/4_2/compiler_cgen.o \
nimcache/4_2/compiler_ccgutils.o \
nimcache/4_2/compiler_cgendata.o \
nimcache/4_2/compiler_ccgmerge.o \
nimcache/4_2/compiler_jsgen.o \
nimcache/4_2/compiler_passaux.o \
nimcache/4_2/compiler_depends.o \
nimcache/4_2/compiler_docgen2.o \
nimcache/4_2/compiler_service.o \
nimcache/4_2/pure_parseopt.o \
nimcache/4_2/compiler_modules.o \
nimcache/4_2/compiler_pretty.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$LINKER -o $binDir/nimrod  $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/nimrod  $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  $LINK_FLAGS
    ;;
  sparc)
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_nimrod.c -o nimcache/4_5/compiler_nimrod.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_nimrod.c -o nimcache/4_5/compiler_nimrod.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/Nimrod_system.c -o nimcache/4_5/Nimrod_system.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/Nimrod_system.c -o nimcache/4_5/Nimrod_system.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_testability.c -o nimcache/4_5/compiler_testability.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_testability.c -o nimcache/4_5/compiler_testability.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_commands.c -o nimcache/4_5/compiler_commands.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_commands.c -o nimcache/4_5/compiler_commands.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_os.c -o nimcache/4_5/pure_os.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_os.c -o nimcache/4_5/pure_os.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_strutils.c -o nimcache/4_5/pure_strutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_strutils.c -o nimcache/4_5/pure_strutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_parseutils.c -o nimcache/4_5/pure_parseutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_parseutils.c -o nimcache/4_5/pure_parseutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_times.c -o nimcache/4_5/pure_times.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_times.c -o nimcache/4_5/pure_times.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/posix_posix.c -o nimcache/4_5/posix_posix.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/posix_posix.c -o nimcache/4_5/posix_posix.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_msgs.c -o nimcache/4_5/compiler_msgs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_msgs.c -o nimcache/4_5/compiler_msgs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_options.c -o nimcache/4_5/compiler_options.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_options.c -o nimcache/4_5/compiler_options.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_lists.c -o nimcache/4_5/compiler_lists.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_lists.c -o nimcache/4_5/compiler_lists.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_strtabs.c -o nimcache/4_5/pure_strtabs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_strtabs.c -o nimcache/4_5/pure_strtabs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_hashes.c -o nimcache/4_5/pure_hashes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_hashes.c -o nimcache/4_5/pure_hashes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/collections_tables.c -o nimcache/4_5/collections_tables.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/collections_tables.c -o nimcache/4_5/collections_tables.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_math.c -o nimcache/4_5/pure_math.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_math.c -o nimcache/4_5/pure_math.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_ropes.c -o nimcache/4_5/compiler_ropes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_ropes.c -o nimcache/4_5/compiler_ropes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_platform.c -o nimcache/4_5/compiler_platform.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_platform.c -o nimcache/4_5/compiler_platform.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_crc.c -o nimcache/4_5/compiler_crc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_crc.c -o nimcache/4_5/compiler_crc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_sockets.c -o nimcache/4_5/pure_sockets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_sockets.c -o nimcache/4_5/pure_sockets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/core_unsigned.c -o nimcache/4_5/core_unsigned.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/core_unsigned.c -o nimcache/4_5/core_unsigned.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_nversion.c -o nimcache/4_5/compiler_nversion.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_nversion.c -o nimcache/4_5/compiler_nversion.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_condsyms.c -o nimcache/4_5/compiler_condsyms.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_condsyms.c -o nimcache/4_5/compiler_condsyms.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_idents.c -o nimcache/4_5/compiler_idents.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_idents.c -o nimcache/4_5/compiler_idents.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_extccomp.c -o nimcache/4_5/compiler_extccomp.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_extccomp.c -o nimcache/4_5/compiler_extccomp.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_osproc.c -o nimcache/4_5/pure_osproc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_osproc.c -o nimcache/4_5/pure_osproc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_streams.c -o nimcache/4_5/pure_streams.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_streams.c -o nimcache/4_5/pure_streams.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_wordrecg.c -o nimcache/4_5/compiler_wordrecg.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_wordrecg.c -o nimcache/4_5/compiler_wordrecg.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_babelcmd.c -o nimcache/4_5/compiler_babelcmd.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_babelcmd.c -o nimcache/4_5/compiler_babelcmd.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_lexer.c -o nimcache/4_5/compiler_lexer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_lexer.c -o nimcache/4_5/compiler_lexer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_nimlexbase.c -o nimcache/4_5/compiler_nimlexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_nimlexbase.c -o nimcache/4_5/compiler_nimlexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_llstream.c -o nimcache/4_5/compiler_llstream.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_llstream.c -o nimcache/4_5/compiler_llstream.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_nimconf.c -o nimcache/4_5/compiler_nimconf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_nimconf.c -o nimcache/4_5/compiler_nimconf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_main.c -o nimcache/4_5/compiler_main.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_main.c -o nimcache/4_5/compiler_main.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_ast.c -o nimcache/4_5/compiler_ast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_ast.c -o nimcache/4_5/compiler_ast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/collections_intsets.c -o nimcache/4_5/collections_intsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/collections_intsets.c -o nimcache/4_5/collections_intsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_idgen.c -o nimcache/4_5/compiler_idgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_idgen.c -o nimcache/4_5/compiler_idgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_astalgo.c -o nimcache/4_5/compiler_astalgo.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_astalgo.c -o nimcache/4_5/compiler_astalgo.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_rodutils.c -o nimcache/4_5/compiler_rodutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_rodutils.c -o nimcache/4_5/compiler_rodutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_syntaxes.c -o nimcache/4_5/compiler_syntaxes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_syntaxes.c -o nimcache/4_5/compiler_syntaxes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_parser.c -o nimcache/4_5/compiler_parser.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_parser.c -o nimcache/4_5/compiler_parser.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_pbraces.c -o nimcache/4_5/compiler_pbraces.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_pbraces.c -o nimcache/4_5/compiler_pbraces.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_filters.c -o nimcache/4_5/compiler_filters.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_filters.c -o nimcache/4_5/compiler_filters.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_renderer.c -o nimcache/4_5/compiler_renderer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_renderer.c -o nimcache/4_5/compiler_renderer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_filter_tmpl.c -o nimcache/4_5/compiler_filter_tmpl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_filter_tmpl.c -o nimcache/4_5/compiler_filter_tmpl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_rodread.c -o nimcache/4_5/compiler_rodread.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_rodread.c -o nimcache/4_5/compiler_rodread.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_types.c -o nimcache/4_5/compiler_types.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_types.c -o nimcache/4_5/compiler_types.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_trees.c -o nimcache/4_5/compiler_trees.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_trees.c -o nimcache/4_5/compiler_trees.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_memfiles.c -o nimcache/4_5/pure_memfiles.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_memfiles.c -o nimcache/4_5/pure_memfiles.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_rodwrite.c -o nimcache/4_5/compiler_rodwrite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_rodwrite.c -o nimcache/4_5/compiler_rodwrite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_passes.c -o nimcache/4_5/compiler_passes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_passes.c -o nimcache/4_5/compiler_passes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_magicsys.c -o nimcache/4_5/compiler_magicsys.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_magicsys.c -o nimcache/4_5/compiler_magicsys.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_nimsets.c -o nimcache/4_5/compiler_nimsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_nimsets.c -o nimcache/4_5/compiler_nimsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_bitsets.c -o nimcache/4_5/compiler_bitsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_bitsets.c -o nimcache/4_5/compiler_bitsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_semthreads.c -o nimcache/4_5/compiler_semthreads.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_semthreads.c -o nimcache/4_5/compiler_semthreads.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_importer.c -o nimcache/4_5/compiler_importer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_importer.c -o nimcache/4_5/compiler_importer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_lookups.c -o nimcache/4_5/compiler_lookups.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_lookups.c -o nimcache/4_5/compiler_lookups.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_semdata.c -o nimcache/4_5/compiler_semdata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_semdata.c -o nimcache/4_5/compiler_semdata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_treetab.c -o nimcache/4_5/compiler_treetab.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_treetab.c -o nimcache/4_5/compiler_treetab.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_evals.c -o nimcache/4_5/compiler_evals.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_evals.c -o nimcache/4_5/compiler_evals.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_semfold.c -o nimcache/4_5/compiler_semfold.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_semfold.c -o nimcache/4_5/compiler_semfold.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_saturate.c -o nimcache/4_5/compiler_saturate.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_saturate.c -o nimcache/4_5/compiler_saturate.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_transf.c -o nimcache/4_5/compiler_transf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_transf.c -o nimcache/4_5/compiler_transf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_cgmeth.c -o nimcache/4_5/compiler_cgmeth.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_cgmeth.c -o nimcache/4_5/compiler_cgmeth.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_sempass2.c -o nimcache/4_5/compiler_sempass2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_sempass2.c -o nimcache/4_5/compiler_sempass2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_guards.c -o nimcache/4_5/compiler_guards.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_guards.c -o nimcache/4_5/compiler_guards.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_lambdalifting.c -o nimcache/4_5/compiler_lambdalifting.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_lambdalifting.c -o nimcache/4_5/compiler_lambdalifting.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_evaltempl.c -o nimcache/4_5/compiler_evaltempl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_evaltempl.c -o nimcache/4_5/compiler_evaltempl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_sem.c -o nimcache/4_5/compiler_sem.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_sem.c -o nimcache/4_5/compiler_sem.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_procfind.c -o nimcache/4_5/compiler_procfind.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_procfind.c -o nimcache/4_5/compiler_procfind.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_pragmas.c -o nimcache/4_5/compiler_pragmas.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_pragmas.c -o nimcache/4_5/compiler_pragmas.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_semtypinst.c -o nimcache/4_5/compiler_semtypinst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_semtypinst.c -o nimcache/4_5/compiler_semtypinst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_sigmatch.c -o nimcache/4_5/compiler_sigmatch.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_sigmatch.c -o nimcache/4_5/compiler_sigmatch.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_parampatterns.c -o nimcache/4_5/compiler_parampatterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_parampatterns.c -o nimcache/4_5/compiler_parampatterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_docgen.c -o nimcache/4_5/compiler_docgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_docgen.c -o nimcache/4_5/compiler_docgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/docutils_rstast.c -o nimcache/4_5/docutils_rstast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/docutils_rstast.c -o nimcache/4_5/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/docutils_rst.c -o nimcache/4_5/docutils_rst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/docutils_rst.c -o nimcache/4_5/docutils_rst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/docutils_rstgen.c -o nimcache/4_5/docutils_rstgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/docutils_rstgen.c -o nimcache/4_5/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/docutils_highlite.c -o nimcache/4_5/docutils_highlite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/docutils_highlite.c -o nimcache/4_5/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_json.c -o nimcache/4_5/pure_json.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_json.c -o nimcache/4_5/pure_json.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_lexbase.c -o nimcache/4_5/pure_lexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_lexbase.c -o nimcache/4_5/pure_lexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_unicode.c -o nimcache/4_5/pure_unicode.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_unicode.c -o nimcache/4_5/pure_unicode.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_algorithm.c -o nimcache/4_5/pure_algorithm.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_algorithm.c -o nimcache/4_5/pure_algorithm.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/collections_sequtils.c -o nimcache/4_5/collections_sequtils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/collections_sequtils.c -o nimcache/4_5/collections_sequtils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_aliases.c -o nimcache/4_5/compiler_aliases.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_aliases.c -o nimcache/4_5/compiler_aliases.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_patterns.c -o nimcache/4_5/compiler_patterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_patterns.c -o nimcache/4_5/compiler_patterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_cgen.c -o nimcache/4_5/compiler_cgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_cgen.c -o nimcache/4_5/compiler_cgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_ccgutils.c -o nimcache/4_5/compiler_ccgutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_ccgutils.c -o nimcache/4_5/compiler_ccgutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_cgendata.c -o nimcache/4_5/compiler_cgendata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_cgendata.c -o nimcache/4_5/compiler_cgendata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_ccgmerge.c -o nimcache/4_5/compiler_ccgmerge.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_ccgmerge.c -o nimcache/4_5/compiler_ccgmerge.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_jsgen.c -o nimcache/4_5/compiler_jsgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_jsgen.c -o nimcache/4_5/compiler_jsgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_passaux.c -o nimcache/4_5/compiler_passaux.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_passaux.c -o nimcache/4_5/compiler_passaux.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_depends.c -o nimcache/4_5/compiler_depends.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_depends.c -o nimcache/4_5/compiler_depends.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_docgen2.c -o nimcache/4_5/compiler_docgen2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_docgen2.c -o nimcache/4_5/compiler_docgen2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_service.c -o nimcache/4_5/compiler_service.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_service.c -o nimcache/4_5/compiler_service.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_parseopt.c -o nimcache/4_5/pure_parseopt.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/pure_parseopt.c -o nimcache/4_5/pure_parseopt.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_modules.c -o nimcache/4_5/compiler_modules.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_modules.c -o nimcache/4_5/compiler_modules.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_pretty.c -o nimcache/4_5/compiler_pretty.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/4_5/compiler_pretty.c -o nimcache/4_5/compiler_pretty.o
    echo "$LINKER -o $binDir/nimrod  \
nimcache/4_5/compiler_nimrod.o \
nimcache/4_5/Nimrod_system.o \
nimcache/4_5/compiler_testability.o \
nimcache/4_5/compiler_commands.o \
nimcache/4_5/pure_os.o \
nimcache/4_5/pure_strutils.o \
nimcache/4_5/pure_parseutils.o \
nimcache/4_5/pure_times.o \
nimcache/4_5/posix_posix.o \
nimcache/4_5/compiler_msgs.o \
nimcache/4_5/compiler_options.o \
nimcache/4_5/compiler_lists.o \
nimcache/4_5/pure_strtabs.o \
nimcache/4_5/pure_hashes.o \
nimcache/4_5/collections_tables.o \
nimcache/4_5/pure_math.o \
nimcache/4_5/compiler_ropes.o \
nimcache/4_5/compiler_platform.o \
nimcache/4_5/compiler_crc.o \
nimcache/4_5/pure_sockets.o \
nimcache/4_5/core_unsigned.o \
nimcache/4_5/compiler_nversion.o \
nimcache/4_5/compiler_condsyms.o \
nimcache/4_5/compiler_idents.o \
nimcache/4_5/compiler_extccomp.o \
nimcache/4_5/pure_osproc.o \
nimcache/4_5/pure_streams.o \
nimcache/4_5/compiler_wordrecg.o \
nimcache/4_5/compiler_babelcmd.o \
nimcache/4_5/compiler_lexer.o \
nimcache/4_5/compiler_nimlexbase.o \
nimcache/4_5/compiler_llstream.o \
nimcache/4_5/compiler_nimconf.o \
nimcache/4_5/compiler_main.o \
nimcache/4_5/compiler_ast.o \
nimcache/4_5/collections_intsets.o \
nimcache/4_5/compiler_idgen.o \
nimcache/4_5/compiler_astalgo.o \
nimcache/4_5/compiler_rodutils.o \
nimcache/4_5/compiler_syntaxes.o \
nimcache/4_5/compiler_parser.o \
nimcache/4_5/compiler_pbraces.o \
nimcache/4_5/compiler_filters.o \
nimcache/4_5/compiler_renderer.o \
nimcache/4_5/compiler_filter_tmpl.o \
nimcache/4_5/compiler_rodread.o \
nimcache/4_5/compiler_types.o \
nimcache/4_5/compiler_trees.o \
nimcache/4_5/pure_memfiles.o \
nimcache/4_5/compiler_rodwrite.o \
nimcache/4_5/compiler_passes.o \
nimcache/4_5/compiler_magicsys.o \
nimcache/4_5/compiler_nimsets.o \
nimcache/4_5/compiler_bitsets.o \
nimcache/4_5/compiler_semthreads.o \
nimcache/4_5/compiler_importer.o \
nimcache/4_5/compiler_lookups.o \
nimcache/4_5/compiler_semdata.o \
nimcache/4_5/compiler_treetab.o \
nimcache/4_5/compiler_evals.o \
nimcache/4_5/compiler_semfold.o \
nimcache/4_5/compiler_saturate.o \
nimcache/4_5/compiler_transf.o \
nimcache/4_5/compiler_cgmeth.o \
nimcache/4_5/compiler_sempass2.o \
nimcache/4_5/compiler_guards.o \
nimcache/4_5/compiler_lambdalifting.o \
nimcache/4_5/compiler_evaltempl.o \
nimcache/4_5/compiler_sem.o \
nimcache/4_5/compiler_procfind.o \
nimcache/4_5/compiler_pragmas.o \
nimcache/4_5/compiler_semtypinst.o \
nimcache/4_5/compiler_sigmatch.o \
nimcache/4_5/compiler_parampatterns.o \
nimcache/4_5/compiler_docgen.o \
nimcache/4_5/docutils_rstast.o \
nimcache/4_5/docutils_rst.o \
nimcache/4_5/docutils_rstgen.o \
nimcache/4_5/docutils_highlite.o \
nimcache/4_5/pure_json.o \
nimcache/4_5/pure_lexbase.o \
nimcache/4_5/pure_unicode.o \
nimcache/4_5/pure_algorithm.o \
nimcache/4_5/collections_sequtils.o \
nimcache/4_5/compiler_aliases.o \
nimcache/4_5/compiler_patterns.o \
nimcache/4_5/compiler_cgen.o \
nimcache/4_5/compiler_ccgutils.o \
nimcache/4_5/compiler_cgendata.o \
nimcache/4_5/compiler_ccgmerge.o \
nimcache/4_5/compiler_jsgen.o \
nimcache/4_5/compiler_passaux.o \
nimcache/4_5/compiler_depends.o \
nimcache/4_5/compiler_docgen2.o \
nimcache/4_5/compiler_service.o \
nimcache/4_5/pure_parseopt.o \
nimcache/4_5/compiler_modules.o \
nimcache/4_5/compiler_pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
nimcache/4_5/compiler_nimrod.o \
nimcache/4_5/Nimrod_system.o \
nimcache/4_5/compiler_testability.o \
nimcache/4_5/compiler_commands.o \
nimcache/4_5/pure_os.o \
nimcache/4_5/pure_strutils.o \
nimcache/4_5/pure_parseutils.o \
nimcache/4_5/pure_times.o \
nimcache/4_5/posix_posix.o \
nimcache/4_5/compiler_msgs.o \
nimcache/4_5/compiler_options.o \
nimcache/4_5/compiler_lists.o \
nimcache/4_5/pure_strtabs.o \
nimcache/4_5/pure_hashes.o \
nimcache/4_5/collections_tables.o \
nimcache/4_5/pure_math.o \
nimcache/4_5/compiler_ropes.o \
nimcache/4_5/compiler_platform.o \
nimcache/4_5/compiler_crc.o \
nimcache/4_5/pure_sockets.o \
nimcache/4_5/core_unsigned.o \
nimcache/4_5/compiler_nversion.o \
nimcache/4_5/compiler_condsyms.o \
nimcache/4_5/compiler_idents.o \
nimcache/4_5/compiler_extccomp.o \
nimcache/4_5/pure_osproc.o \
nimcache/4_5/pure_streams.o \
nimcache/4_5/compiler_wordrecg.o \
nimcache/4_5/compiler_babelcmd.o \
nimcache/4_5/compiler_lexer.o \
nimcache/4_5/compiler_nimlexbase.o \
nimcache/4_5/compiler_llstream.o \
nimcache/4_5/compiler_nimconf.o \
nimcache/4_5/compiler_main.o \
nimcache/4_5/compiler_ast.o \
nimcache/4_5/collections_intsets.o \
nimcache/4_5/compiler_idgen.o \
nimcache/4_5/compiler_astalgo.o \
nimcache/4_5/compiler_rodutils.o \
nimcache/4_5/compiler_syntaxes.o \
nimcache/4_5/compiler_parser.o \
nimcache/4_5/compiler_pbraces.o \
nimcache/4_5/compiler_filters.o \
nimcache/4_5/compiler_renderer.o \
nimcache/4_5/compiler_filter_tmpl.o \
nimcache/4_5/compiler_rodread.o \
nimcache/4_5/compiler_types.o \
nimcache/4_5/compiler_trees.o \
nimcache/4_5/pure_memfiles.o \
nimcache/4_5/compiler_rodwrite.o \
nimcache/4_5/compiler_passes.o \
nimcache/4_5/compiler_magicsys.o \
nimcache/4_5/compiler_nimsets.o \
nimcache/4_5/compiler_bitsets.o \
nimcache/4_5/compiler_semthreads.o \
nimcache/4_5/compiler_importer.o \
nimcache/4_5/compiler_lookups.o \
nimcache/4_5/compiler_semdata.o \
nimcache/4_5/compiler_treetab.o \
nimcache/4_5/compiler_evals.o \
nimcache/4_5/compiler_semfold.o \
nimcache/4_5/compiler_saturate.o \
nimcache/4_5/compiler_transf.o \
nimcache/4_5/compiler_cgmeth.o \
nimcache/4_5/compiler_sempass2.o \
nimcache/4_5/compiler_guards.o \
nimcache/4_5/compiler_lambdalifting.o \
nimcache/4_5/compiler_evaltempl.o \
nimcache/4_5/compiler_sem.o \
nimcache/4_5/compiler_procfind.o \
nimcache/4_5/compiler_pragmas.o \
nimcache/4_5/compiler_semtypinst.o \
nimcache/4_5/compiler_sigmatch.o \
nimcache/4_5/compiler_parampatterns.o \
nimcache/4_5/compiler_docgen.o \
nimcache/4_5/docutils_rstast.o \
nimcache/4_5/docutils_rst.o \
nimcache/4_5/docutils_rstgen.o \
nimcache/4_5/docutils_highlite.o \
nimcache/4_5/pure_json.o \
nimcache/4_5/pure_lexbase.o \
nimcache/4_5/pure_unicode.o \
nimcache/4_5/pure_algorithm.o \
nimcache/4_5/collections_sequtils.o \
nimcache/4_5/compiler_aliases.o \
nimcache/4_5/compiler_patterns.o \
nimcache/4_5/compiler_cgen.o \
nimcache/4_5/compiler_ccgutils.o \
nimcache/4_5/compiler_cgendata.o \
nimcache/4_5/compiler_ccgmerge.o \
nimcache/4_5/compiler_jsgen.o \
nimcache/4_5/compiler_passaux.o \
nimcache/4_5/compiler_depends.o \
nimcache/4_5/compiler_docgen2.o \
nimcache/4_5/compiler_service.o \
nimcache/4_5/pure_parseopt.o \
nimcache/4_5/compiler_modules.o \
nimcache/4_5/compiler_pretty.o $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/nimrod  $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  $LINK_FLAGS
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
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_nimrod.c -o nimcache/5_1/compiler_nimrod.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_nimrod.c -o nimcache/5_1/compiler_nimrod.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/Nimrod_system.c -o nimcache/5_1/Nimrod_system.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/Nimrod_system.c -o nimcache/5_1/Nimrod_system.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_testability.c -o nimcache/5_1/compiler_testability.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_testability.c -o nimcache/5_1/compiler_testability.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_commands.c -o nimcache/5_1/compiler_commands.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_commands.c -o nimcache/5_1/compiler_commands.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_os.c -o nimcache/5_1/pure_os.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_os.c -o nimcache/5_1/pure_os.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_strutils.c -o nimcache/5_1/pure_strutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_strutils.c -o nimcache/5_1/pure_strutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_parseutils.c -o nimcache/5_1/pure_parseutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_parseutils.c -o nimcache/5_1/pure_parseutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_times.c -o nimcache/5_1/pure_times.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_times.c -o nimcache/5_1/pure_times.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/posix_posix.c -o nimcache/5_1/posix_posix.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/posix_posix.c -o nimcache/5_1/posix_posix.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_msgs.c -o nimcache/5_1/compiler_msgs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_msgs.c -o nimcache/5_1/compiler_msgs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_options.c -o nimcache/5_1/compiler_options.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_options.c -o nimcache/5_1/compiler_options.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_lists.c -o nimcache/5_1/compiler_lists.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_lists.c -o nimcache/5_1/compiler_lists.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_strtabs.c -o nimcache/5_1/pure_strtabs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_strtabs.c -o nimcache/5_1/pure_strtabs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_hashes.c -o nimcache/5_1/pure_hashes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_hashes.c -o nimcache/5_1/pure_hashes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/collections_tables.c -o nimcache/5_1/collections_tables.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/collections_tables.c -o nimcache/5_1/collections_tables.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_math.c -o nimcache/5_1/pure_math.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_math.c -o nimcache/5_1/pure_math.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_ropes.c -o nimcache/5_1/compiler_ropes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_ropes.c -o nimcache/5_1/compiler_ropes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_platform.c -o nimcache/5_1/compiler_platform.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_platform.c -o nimcache/5_1/compiler_platform.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_crc.c -o nimcache/5_1/compiler_crc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_crc.c -o nimcache/5_1/compiler_crc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_sockets.c -o nimcache/5_1/pure_sockets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_sockets.c -o nimcache/5_1/pure_sockets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/core_unsigned.c -o nimcache/5_1/core_unsigned.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/core_unsigned.c -o nimcache/5_1/core_unsigned.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_nversion.c -o nimcache/5_1/compiler_nversion.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_nversion.c -o nimcache/5_1/compiler_nversion.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_condsyms.c -o nimcache/5_1/compiler_condsyms.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_condsyms.c -o nimcache/5_1/compiler_condsyms.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_idents.c -o nimcache/5_1/compiler_idents.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_idents.c -o nimcache/5_1/compiler_idents.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_extccomp.c -o nimcache/5_1/compiler_extccomp.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_extccomp.c -o nimcache/5_1/compiler_extccomp.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_osproc.c -o nimcache/5_1/pure_osproc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_osproc.c -o nimcache/5_1/pure_osproc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_streams.c -o nimcache/5_1/pure_streams.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_streams.c -o nimcache/5_1/pure_streams.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_wordrecg.c -o nimcache/5_1/compiler_wordrecg.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_wordrecg.c -o nimcache/5_1/compiler_wordrecg.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_babelcmd.c -o nimcache/5_1/compiler_babelcmd.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_babelcmd.c -o nimcache/5_1/compiler_babelcmd.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_lexer.c -o nimcache/5_1/compiler_lexer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_lexer.c -o nimcache/5_1/compiler_lexer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_nimlexbase.c -o nimcache/5_1/compiler_nimlexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_nimlexbase.c -o nimcache/5_1/compiler_nimlexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_llstream.c -o nimcache/5_1/compiler_llstream.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_llstream.c -o nimcache/5_1/compiler_llstream.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_nimconf.c -o nimcache/5_1/compiler_nimconf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_nimconf.c -o nimcache/5_1/compiler_nimconf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_main.c -o nimcache/5_1/compiler_main.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_main.c -o nimcache/5_1/compiler_main.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_ast.c -o nimcache/5_1/compiler_ast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_ast.c -o nimcache/5_1/compiler_ast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/collections_intsets.c -o nimcache/5_1/collections_intsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/collections_intsets.c -o nimcache/5_1/collections_intsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_idgen.c -o nimcache/5_1/compiler_idgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_idgen.c -o nimcache/5_1/compiler_idgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_astalgo.c -o nimcache/5_1/compiler_astalgo.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_astalgo.c -o nimcache/5_1/compiler_astalgo.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_rodutils.c -o nimcache/5_1/compiler_rodutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_rodutils.c -o nimcache/5_1/compiler_rodutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_syntaxes.c -o nimcache/5_1/compiler_syntaxes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_syntaxes.c -o nimcache/5_1/compiler_syntaxes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_parser.c -o nimcache/5_1/compiler_parser.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_parser.c -o nimcache/5_1/compiler_parser.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_pbraces.c -o nimcache/5_1/compiler_pbraces.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_pbraces.c -o nimcache/5_1/compiler_pbraces.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_filters.c -o nimcache/5_1/compiler_filters.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_filters.c -o nimcache/5_1/compiler_filters.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_renderer.c -o nimcache/5_1/compiler_renderer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_renderer.c -o nimcache/5_1/compiler_renderer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_filter_tmpl.c -o nimcache/5_1/compiler_filter_tmpl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_filter_tmpl.c -o nimcache/5_1/compiler_filter_tmpl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_rodread.c -o nimcache/5_1/compiler_rodread.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_rodread.c -o nimcache/5_1/compiler_rodread.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_types.c -o nimcache/5_1/compiler_types.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_types.c -o nimcache/5_1/compiler_types.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_trees.c -o nimcache/5_1/compiler_trees.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_trees.c -o nimcache/5_1/compiler_trees.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_memfiles.c -o nimcache/5_1/pure_memfiles.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_memfiles.c -o nimcache/5_1/pure_memfiles.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_rodwrite.c -o nimcache/5_1/compiler_rodwrite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_rodwrite.c -o nimcache/5_1/compiler_rodwrite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_passes.c -o nimcache/5_1/compiler_passes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_passes.c -o nimcache/5_1/compiler_passes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_magicsys.c -o nimcache/5_1/compiler_magicsys.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_magicsys.c -o nimcache/5_1/compiler_magicsys.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_nimsets.c -o nimcache/5_1/compiler_nimsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_nimsets.c -o nimcache/5_1/compiler_nimsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_bitsets.c -o nimcache/5_1/compiler_bitsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_bitsets.c -o nimcache/5_1/compiler_bitsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_semthreads.c -o nimcache/5_1/compiler_semthreads.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_semthreads.c -o nimcache/5_1/compiler_semthreads.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_importer.c -o nimcache/5_1/compiler_importer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_importer.c -o nimcache/5_1/compiler_importer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_lookups.c -o nimcache/5_1/compiler_lookups.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_lookups.c -o nimcache/5_1/compiler_lookups.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_semdata.c -o nimcache/5_1/compiler_semdata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_semdata.c -o nimcache/5_1/compiler_semdata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_treetab.c -o nimcache/5_1/compiler_treetab.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_treetab.c -o nimcache/5_1/compiler_treetab.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_evals.c -o nimcache/5_1/compiler_evals.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_evals.c -o nimcache/5_1/compiler_evals.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_semfold.c -o nimcache/5_1/compiler_semfold.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_semfold.c -o nimcache/5_1/compiler_semfold.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_saturate.c -o nimcache/5_1/compiler_saturate.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_saturate.c -o nimcache/5_1/compiler_saturate.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_transf.c -o nimcache/5_1/compiler_transf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_transf.c -o nimcache/5_1/compiler_transf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_cgmeth.c -o nimcache/5_1/compiler_cgmeth.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_cgmeth.c -o nimcache/5_1/compiler_cgmeth.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_sempass2.c -o nimcache/5_1/compiler_sempass2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_sempass2.c -o nimcache/5_1/compiler_sempass2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_guards.c -o nimcache/5_1/compiler_guards.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_guards.c -o nimcache/5_1/compiler_guards.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_lambdalifting.c -o nimcache/5_1/compiler_lambdalifting.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_lambdalifting.c -o nimcache/5_1/compiler_lambdalifting.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_evaltempl.c -o nimcache/5_1/compiler_evaltempl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_evaltempl.c -o nimcache/5_1/compiler_evaltempl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_sem.c -o nimcache/5_1/compiler_sem.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_sem.c -o nimcache/5_1/compiler_sem.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_procfind.c -o nimcache/5_1/compiler_procfind.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_procfind.c -o nimcache/5_1/compiler_procfind.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_pragmas.c -o nimcache/5_1/compiler_pragmas.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_pragmas.c -o nimcache/5_1/compiler_pragmas.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_semtypinst.c -o nimcache/5_1/compiler_semtypinst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_semtypinst.c -o nimcache/5_1/compiler_semtypinst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_sigmatch.c -o nimcache/5_1/compiler_sigmatch.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_sigmatch.c -o nimcache/5_1/compiler_sigmatch.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_parampatterns.c -o nimcache/5_1/compiler_parampatterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_parampatterns.c -o nimcache/5_1/compiler_parampatterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_docgen.c -o nimcache/5_1/compiler_docgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_docgen.c -o nimcache/5_1/compiler_docgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/docutils_rstast.c -o nimcache/5_1/docutils_rstast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/docutils_rstast.c -o nimcache/5_1/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/docutils_rst.c -o nimcache/5_1/docutils_rst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/docutils_rst.c -o nimcache/5_1/docutils_rst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/docutils_rstgen.c -o nimcache/5_1/docutils_rstgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/docutils_rstgen.c -o nimcache/5_1/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/docutils_highlite.c -o nimcache/5_1/docutils_highlite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/docutils_highlite.c -o nimcache/5_1/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_json.c -o nimcache/5_1/pure_json.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_json.c -o nimcache/5_1/pure_json.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_lexbase.c -o nimcache/5_1/pure_lexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_lexbase.c -o nimcache/5_1/pure_lexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_unicode.c -o nimcache/5_1/pure_unicode.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_unicode.c -o nimcache/5_1/pure_unicode.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_algorithm.c -o nimcache/5_1/pure_algorithm.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_algorithm.c -o nimcache/5_1/pure_algorithm.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/collections_sequtils.c -o nimcache/5_1/collections_sequtils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/collections_sequtils.c -o nimcache/5_1/collections_sequtils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_aliases.c -o nimcache/5_1/compiler_aliases.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_aliases.c -o nimcache/5_1/compiler_aliases.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_patterns.c -o nimcache/5_1/compiler_patterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_patterns.c -o nimcache/5_1/compiler_patterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_cgen.c -o nimcache/5_1/compiler_cgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_cgen.c -o nimcache/5_1/compiler_cgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_ccgutils.c -o nimcache/5_1/compiler_ccgutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_ccgutils.c -o nimcache/5_1/compiler_ccgutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_cgendata.c -o nimcache/5_1/compiler_cgendata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_cgendata.c -o nimcache/5_1/compiler_cgendata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_ccgmerge.c -o nimcache/5_1/compiler_ccgmerge.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_ccgmerge.c -o nimcache/5_1/compiler_ccgmerge.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_jsgen.c -o nimcache/5_1/compiler_jsgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_jsgen.c -o nimcache/5_1/compiler_jsgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_passaux.c -o nimcache/5_1/compiler_passaux.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_passaux.c -o nimcache/5_1/compiler_passaux.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_depends.c -o nimcache/5_1/compiler_depends.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_depends.c -o nimcache/5_1/compiler_depends.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_docgen2.c -o nimcache/5_1/compiler_docgen2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_docgen2.c -o nimcache/5_1/compiler_docgen2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_service.c -o nimcache/5_1/compiler_service.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_service.c -o nimcache/5_1/compiler_service.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_parseopt.c -o nimcache/5_1/pure_parseopt.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/pure_parseopt.c -o nimcache/5_1/pure_parseopt.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_modules.c -o nimcache/5_1/compiler_modules.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_modules.c -o nimcache/5_1/compiler_modules.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_pretty.c -o nimcache/5_1/compiler_pretty.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_1/compiler_pretty.c -o nimcache/5_1/compiler_pretty.o
    echo "$LINKER -o $binDir/nimrod  \
nimcache/5_1/compiler_nimrod.o \
nimcache/5_1/Nimrod_system.o \
nimcache/5_1/compiler_testability.o \
nimcache/5_1/compiler_commands.o \
nimcache/5_1/pure_os.o \
nimcache/5_1/pure_strutils.o \
nimcache/5_1/pure_parseutils.o \
nimcache/5_1/pure_times.o \
nimcache/5_1/posix_posix.o \
nimcache/5_1/compiler_msgs.o \
nimcache/5_1/compiler_options.o \
nimcache/5_1/compiler_lists.o \
nimcache/5_1/pure_strtabs.o \
nimcache/5_1/pure_hashes.o \
nimcache/5_1/collections_tables.o \
nimcache/5_1/pure_math.o \
nimcache/5_1/compiler_ropes.o \
nimcache/5_1/compiler_platform.o \
nimcache/5_1/compiler_crc.o \
nimcache/5_1/pure_sockets.o \
nimcache/5_1/core_unsigned.o \
nimcache/5_1/compiler_nversion.o \
nimcache/5_1/compiler_condsyms.o \
nimcache/5_1/compiler_idents.o \
nimcache/5_1/compiler_extccomp.o \
nimcache/5_1/pure_osproc.o \
nimcache/5_1/pure_streams.o \
nimcache/5_1/compiler_wordrecg.o \
nimcache/5_1/compiler_babelcmd.o \
nimcache/5_1/compiler_lexer.o \
nimcache/5_1/compiler_nimlexbase.o \
nimcache/5_1/compiler_llstream.o \
nimcache/5_1/compiler_nimconf.o \
nimcache/5_1/compiler_main.o \
nimcache/5_1/compiler_ast.o \
nimcache/5_1/collections_intsets.o \
nimcache/5_1/compiler_idgen.o \
nimcache/5_1/compiler_astalgo.o \
nimcache/5_1/compiler_rodutils.o \
nimcache/5_1/compiler_syntaxes.o \
nimcache/5_1/compiler_parser.o \
nimcache/5_1/compiler_pbraces.o \
nimcache/5_1/compiler_filters.o \
nimcache/5_1/compiler_renderer.o \
nimcache/5_1/compiler_filter_tmpl.o \
nimcache/5_1/compiler_rodread.o \
nimcache/5_1/compiler_types.o \
nimcache/5_1/compiler_trees.o \
nimcache/5_1/pure_memfiles.o \
nimcache/5_1/compiler_rodwrite.o \
nimcache/5_1/compiler_passes.o \
nimcache/5_1/compiler_magicsys.o \
nimcache/5_1/compiler_nimsets.o \
nimcache/5_1/compiler_bitsets.o \
nimcache/5_1/compiler_semthreads.o \
nimcache/5_1/compiler_importer.o \
nimcache/5_1/compiler_lookups.o \
nimcache/5_1/compiler_semdata.o \
nimcache/5_1/compiler_treetab.o \
nimcache/5_1/compiler_evals.o \
nimcache/5_1/compiler_semfold.o \
nimcache/5_1/compiler_saturate.o \
nimcache/5_1/compiler_transf.o \
nimcache/5_1/compiler_cgmeth.o \
nimcache/5_1/compiler_sempass2.o \
nimcache/5_1/compiler_guards.o \
nimcache/5_1/compiler_lambdalifting.o \
nimcache/5_1/compiler_evaltempl.o \
nimcache/5_1/compiler_sem.o \
nimcache/5_1/compiler_procfind.o \
nimcache/5_1/compiler_pragmas.o \
nimcache/5_1/compiler_semtypinst.o \
nimcache/5_1/compiler_sigmatch.o \
nimcache/5_1/compiler_parampatterns.o \
nimcache/5_1/compiler_docgen.o \
nimcache/5_1/docutils_rstast.o \
nimcache/5_1/docutils_rst.o \
nimcache/5_1/docutils_rstgen.o \
nimcache/5_1/docutils_highlite.o \
nimcache/5_1/pure_json.o \
nimcache/5_1/pure_lexbase.o \
nimcache/5_1/pure_unicode.o \
nimcache/5_1/pure_algorithm.o \
nimcache/5_1/collections_sequtils.o \
nimcache/5_1/compiler_aliases.o \
nimcache/5_1/compiler_patterns.o \
nimcache/5_1/compiler_cgen.o \
nimcache/5_1/compiler_ccgutils.o \
nimcache/5_1/compiler_cgendata.o \
nimcache/5_1/compiler_ccgmerge.o \
nimcache/5_1/compiler_jsgen.o \
nimcache/5_1/compiler_passaux.o \
nimcache/5_1/compiler_depends.o \
nimcache/5_1/compiler_docgen2.o \
nimcache/5_1/compiler_service.o \
nimcache/5_1/pure_parseopt.o \
nimcache/5_1/compiler_modules.o \
nimcache/5_1/compiler_pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
nimcache/5_1/compiler_nimrod.o \
nimcache/5_1/Nimrod_system.o \
nimcache/5_1/compiler_testability.o \
nimcache/5_1/compiler_commands.o \
nimcache/5_1/pure_os.o \
nimcache/5_1/pure_strutils.o \
nimcache/5_1/pure_parseutils.o \
nimcache/5_1/pure_times.o \
nimcache/5_1/posix_posix.o \
nimcache/5_1/compiler_msgs.o \
nimcache/5_1/compiler_options.o \
nimcache/5_1/compiler_lists.o \
nimcache/5_1/pure_strtabs.o \
nimcache/5_1/pure_hashes.o \
nimcache/5_1/collections_tables.o \
nimcache/5_1/pure_math.o \
nimcache/5_1/compiler_ropes.o \
nimcache/5_1/compiler_platform.o \
nimcache/5_1/compiler_crc.o \
nimcache/5_1/pure_sockets.o \
nimcache/5_1/core_unsigned.o \
nimcache/5_1/compiler_nversion.o \
nimcache/5_1/compiler_condsyms.o \
nimcache/5_1/compiler_idents.o \
nimcache/5_1/compiler_extccomp.o \
nimcache/5_1/pure_osproc.o \
nimcache/5_1/pure_streams.o \
nimcache/5_1/compiler_wordrecg.o \
nimcache/5_1/compiler_babelcmd.o \
nimcache/5_1/compiler_lexer.o \
nimcache/5_1/compiler_nimlexbase.o \
nimcache/5_1/compiler_llstream.o \
nimcache/5_1/compiler_nimconf.o \
nimcache/5_1/compiler_main.o \
nimcache/5_1/compiler_ast.o \
nimcache/5_1/collections_intsets.o \
nimcache/5_1/compiler_idgen.o \
nimcache/5_1/compiler_astalgo.o \
nimcache/5_1/compiler_rodutils.o \
nimcache/5_1/compiler_syntaxes.o \
nimcache/5_1/compiler_parser.o \
nimcache/5_1/compiler_pbraces.o \
nimcache/5_1/compiler_filters.o \
nimcache/5_1/compiler_renderer.o \
nimcache/5_1/compiler_filter_tmpl.o \
nimcache/5_1/compiler_rodread.o \
nimcache/5_1/compiler_types.o \
nimcache/5_1/compiler_trees.o \
nimcache/5_1/pure_memfiles.o \
nimcache/5_1/compiler_rodwrite.o \
nimcache/5_1/compiler_passes.o \
nimcache/5_1/compiler_magicsys.o \
nimcache/5_1/compiler_nimsets.o \
nimcache/5_1/compiler_bitsets.o \
nimcache/5_1/compiler_semthreads.o \
nimcache/5_1/compiler_importer.o \
nimcache/5_1/compiler_lookups.o \
nimcache/5_1/compiler_semdata.o \
nimcache/5_1/compiler_treetab.o \
nimcache/5_1/compiler_evals.o \
nimcache/5_1/compiler_semfold.o \
nimcache/5_1/compiler_saturate.o \
nimcache/5_1/compiler_transf.o \
nimcache/5_1/compiler_cgmeth.o \
nimcache/5_1/compiler_sempass2.o \
nimcache/5_1/compiler_guards.o \
nimcache/5_1/compiler_lambdalifting.o \
nimcache/5_1/compiler_evaltempl.o \
nimcache/5_1/compiler_sem.o \
nimcache/5_1/compiler_procfind.o \
nimcache/5_1/compiler_pragmas.o \
nimcache/5_1/compiler_semtypinst.o \
nimcache/5_1/compiler_sigmatch.o \
nimcache/5_1/compiler_parampatterns.o \
nimcache/5_1/compiler_docgen.o \
nimcache/5_1/docutils_rstast.o \
nimcache/5_1/docutils_rst.o \
nimcache/5_1/docutils_rstgen.o \
nimcache/5_1/docutils_highlite.o \
nimcache/5_1/pure_json.o \
nimcache/5_1/pure_lexbase.o \
nimcache/5_1/pure_unicode.o \
nimcache/5_1/pure_algorithm.o \
nimcache/5_1/collections_sequtils.o \
nimcache/5_1/compiler_aliases.o \
nimcache/5_1/compiler_patterns.o \
nimcache/5_1/compiler_cgen.o \
nimcache/5_1/compiler_ccgutils.o \
nimcache/5_1/compiler_cgendata.o \
nimcache/5_1/compiler_ccgmerge.o \
nimcache/5_1/compiler_jsgen.o \
nimcache/5_1/compiler_passaux.o \
nimcache/5_1/compiler_depends.o \
nimcache/5_1/compiler_docgen2.o \
nimcache/5_1/compiler_service.o \
nimcache/5_1/pure_parseopt.o \
nimcache/5_1/compiler_modules.o \
nimcache/5_1/compiler_pretty.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_nimrod.c -o nimcache/5_2/compiler_nimrod.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_nimrod.c -o nimcache/5_2/compiler_nimrod.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/Nimrod_system.c -o nimcache/5_2/Nimrod_system.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/Nimrod_system.c -o nimcache/5_2/Nimrod_system.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_testability.c -o nimcache/5_2/compiler_testability.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_testability.c -o nimcache/5_2/compiler_testability.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_commands.c -o nimcache/5_2/compiler_commands.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_commands.c -o nimcache/5_2/compiler_commands.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_os.c -o nimcache/5_2/pure_os.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_os.c -o nimcache/5_2/pure_os.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_strutils.c -o nimcache/5_2/pure_strutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_strutils.c -o nimcache/5_2/pure_strutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_parseutils.c -o nimcache/5_2/pure_parseutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_parseutils.c -o nimcache/5_2/pure_parseutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_times.c -o nimcache/5_2/pure_times.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_times.c -o nimcache/5_2/pure_times.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/posix_posix.c -o nimcache/5_2/posix_posix.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/posix_posix.c -o nimcache/5_2/posix_posix.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_msgs.c -o nimcache/5_2/compiler_msgs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_msgs.c -o nimcache/5_2/compiler_msgs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_options.c -o nimcache/5_2/compiler_options.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_options.c -o nimcache/5_2/compiler_options.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_lists.c -o nimcache/5_2/compiler_lists.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_lists.c -o nimcache/5_2/compiler_lists.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_strtabs.c -o nimcache/5_2/pure_strtabs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_strtabs.c -o nimcache/5_2/pure_strtabs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_hashes.c -o nimcache/5_2/pure_hashes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_hashes.c -o nimcache/5_2/pure_hashes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/collections_tables.c -o nimcache/5_2/collections_tables.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/collections_tables.c -o nimcache/5_2/collections_tables.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_math.c -o nimcache/5_2/pure_math.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_math.c -o nimcache/5_2/pure_math.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_ropes.c -o nimcache/5_2/compiler_ropes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_ropes.c -o nimcache/5_2/compiler_ropes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_platform.c -o nimcache/5_2/compiler_platform.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_platform.c -o nimcache/5_2/compiler_platform.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_crc.c -o nimcache/5_2/compiler_crc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_crc.c -o nimcache/5_2/compiler_crc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_sockets.c -o nimcache/5_2/pure_sockets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_sockets.c -o nimcache/5_2/pure_sockets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/core_unsigned.c -o nimcache/5_2/core_unsigned.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/core_unsigned.c -o nimcache/5_2/core_unsigned.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_nversion.c -o nimcache/5_2/compiler_nversion.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_nversion.c -o nimcache/5_2/compiler_nversion.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_condsyms.c -o nimcache/5_2/compiler_condsyms.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_condsyms.c -o nimcache/5_2/compiler_condsyms.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_idents.c -o nimcache/5_2/compiler_idents.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_idents.c -o nimcache/5_2/compiler_idents.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_extccomp.c -o nimcache/5_2/compiler_extccomp.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_extccomp.c -o nimcache/5_2/compiler_extccomp.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_osproc.c -o nimcache/5_2/pure_osproc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_osproc.c -o nimcache/5_2/pure_osproc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_streams.c -o nimcache/5_2/pure_streams.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_streams.c -o nimcache/5_2/pure_streams.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_wordrecg.c -o nimcache/5_2/compiler_wordrecg.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_wordrecg.c -o nimcache/5_2/compiler_wordrecg.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_babelcmd.c -o nimcache/5_2/compiler_babelcmd.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_babelcmd.c -o nimcache/5_2/compiler_babelcmd.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_lexer.c -o nimcache/5_2/compiler_lexer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_lexer.c -o nimcache/5_2/compiler_lexer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_nimlexbase.c -o nimcache/5_2/compiler_nimlexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_nimlexbase.c -o nimcache/5_2/compiler_nimlexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_llstream.c -o nimcache/5_2/compiler_llstream.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_llstream.c -o nimcache/5_2/compiler_llstream.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_nimconf.c -o nimcache/5_2/compiler_nimconf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_nimconf.c -o nimcache/5_2/compiler_nimconf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_main.c -o nimcache/5_2/compiler_main.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_main.c -o nimcache/5_2/compiler_main.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_ast.c -o nimcache/5_2/compiler_ast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_ast.c -o nimcache/5_2/compiler_ast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/collections_intsets.c -o nimcache/5_2/collections_intsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/collections_intsets.c -o nimcache/5_2/collections_intsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_idgen.c -o nimcache/5_2/compiler_idgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_idgen.c -o nimcache/5_2/compiler_idgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_astalgo.c -o nimcache/5_2/compiler_astalgo.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_astalgo.c -o nimcache/5_2/compiler_astalgo.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_rodutils.c -o nimcache/5_2/compiler_rodutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_rodutils.c -o nimcache/5_2/compiler_rodutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_syntaxes.c -o nimcache/5_2/compiler_syntaxes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_syntaxes.c -o nimcache/5_2/compiler_syntaxes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_parser.c -o nimcache/5_2/compiler_parser.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_parser.c -o nimcache/5_2/compiler_parser.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_pbraces.c -o nimcache/5_2/compiler_pbraces.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_pbraces.c -o nimcache/5_2/compiler_pbraces.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_filters.c -o nimcache/5_2/compiler_filters.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_filters.c -o nimcache/5_2/compiler_filters.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_renderer.c -o nimcache/5_2/compiler_renderer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_renderer.c -o nimcache/5_2/compiler_renderer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_filter_tmpl.c -o nimcache/5_2/compiler_filter_tmpl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_filter_tmpl.c -o nimcache/5_2/compiler_filter_tmpl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_rodread.c -o nimcache/5_2/compiler_rodread.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_rodread.c -o nimcache/5_2/compiler_rodread.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_types.c -o nimcache/5_2/compiler_types.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_types.c -o nimcache/5_2/compiler_types.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_trees.c -o nimcache/5_2/compiler_trees.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_trees.c -o nimcache/5_2/compiler_trees.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_memfiles.c -o nimcache/5_2/pure_memfiles.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_memfiles.c -o nimcache/5_2/pure_memfiles.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_rodwrite.c -o nimcache/5_2/compiler_rodwrite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_rodwrite.c -o nimcache/5_2/compiler_rodwrite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_passes.c -o nimcache/5_2/compiler_passes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_passes.c -o nimcache/5_2/compiler_passes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_magicsys.c -o nimcache/5_2/compiler_magicsys.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_magicsys.c -o nimcache/5_2/compiler_magicsys.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_nimsets.c -o nimcache/5_2/compiler_nimsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_nimsets.c -o nimcache/5_2/compiler_nimsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_bitsets.c -o nimcache/5_2/compiler_bitsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_bitsets.c -o nimcache/5_2/compiler_bitsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_semthreads.c -o nimcache/5_2/compiler_semthreads.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_semthreads.c -o nimcache/5_2/compiler_semthreads.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_importer.c -o nimcache/5_2/compiler_importer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_importer.c -o nimcache/5_2/compiler_importer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_lookups.c -o nimcache/5_2/compiler_lookups.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_lookups.c -o nimcache/5_2/compiler_lookups.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_semdata.c -o nimcache/5_2/compiler_semdata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_semdata.c -o nimcache/5_2/compiler_semdata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_treetab.c -o nimcache/5_2/compiler_treetab.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_treetab.c -o nimcache/5_2/compiler_treetab.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_evals.c -o nimcache/5_2/compiler_evals.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_evals.c -o nimcache/5_2/compiler_evals.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_semfold.c -o nimcache/5_2/compiler_semfold.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_semfold.c -o nimcache/5_2/compiler_semfold.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_saturate.c -o nimcache/5_2/compiler_saturate.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_saturate.c -o nimcache/5_2/compiler_saturate.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_transf.c -o nimcache/5_2/compiler_transf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_transf.c -o nimcache/5_2/compiler_transf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_cgmeth.c -o nimcache/5_2/compiler_cgmeth.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_cgmeth.c -o nimcache/5_2/compiler_cgmeth.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_sempass2.c -o nimcache/5_2/compiler_sempass2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_sempass2.c -o nimcache/5_2/compiler_sempass2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_guards.c -o nimcache/5_2/compiler_guards.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_guards.c -o nimcache/5_2/compiler_guards.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_lambdalifting.c -o nimcache/5_2/compiler_lambdalifting.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_lambdalifting.c -o nimcache/5_2/compiler_lambdalifting.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_evaltempl.c -o nimcache/5_2/compiler_evaltempl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_evaltempl.c -o nimcache/5_2/compiler_evaltempl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_sem.c -o nimcache/5_2/compiler_sem.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_sem.c -o nimcache/5_2/compiler_sem.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_procfind.c -o nimcache/5_2/compiler_procfind.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_procfind.c -o nimcache/5_2/compiler_procfind.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_pragmas.c -o nimcache/5_2/compiler_pragmas.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_pragmas.c -o nimcache/5_2/compiler_pragmas.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_semtypinst.c -o nimcache/5_2/compiler_semtypinst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_semtypinst.c -o nimcache/5_2/compiler_semtypinst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_sigmatch.c -o nimcache/5_2/compiler_sigmatch.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_sigmatch.c -o nimcache/5_2/compiler_sigmatch.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_parampatterns.c -o nimcache/5_2/compiler_parampatterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_parampatterns.c -o nimcache/5_2/compiler_parampatterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_docgen.c -o nimcache/5_2/compiler_docgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_docgen.c -o nimcache/5_2/compiler_docgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/docutils_rstast.c -o nimcache/5_2/docutils_rstast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/docutils_rstast.c -o nimcache/5_2/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/docutils_rst.c -o nimcache/5_2/docutils_rst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/docutils_rst.c -o nimcache/5_2/docutils_rst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/docutils_rstgen.c -o nimcache/5_2/docutils_rstgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/docutils_rstgen.c -o nimcache/5_2/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/docutils_highlite.c -o nimcache/5_2/docutils_highlite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/docutils_highlite.c -o nimcache/5_2/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_json.c -o nimcache/5_2/pure_json.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_json.c -o nimcache/5_2/pure_json.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_lexbase.c -o nimcache/5_2/pure_lexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_lexbase.c -o nimcache/5_2/pure_lexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_unicode.c -o nimcache/5_2/pure_unicode.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_unicode.c -o nimcache/5_2/pure_unicode.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_algorithm.c -o nimcache/5_2/pure_algorithm.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_algorithm.c -o nimcache/5_2/pure_algorithm.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/collections_sequtils.c -o nimcache/5_2/collections_sequtils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/collections_sequtils.c -o nimcache/5_2/collections_sequtils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_aliases.c -o nimcache/5_2/compiler_aliases.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_aliases.c -o nimcache/5_2/compiler_aliases.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_patterns.c -o nimcache/5_2/compiler_patterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_patterns.c -o nimcache/5_2/compiler_patterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_cgen.c -o nimcache/5_2/compiler_cgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_cgen.c -o nimcache/5_2/compiler_cgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_ccgutils.c -o nimcache/5_2/compiler_ccgutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_ccgutils.c -o nimcache/5_2/compiler_ccgutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_cgendata.c -o nimcache/5_2/compiler_cgendata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_cgendata.c -o nimcache/5_2/compiler_cgendata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_ccgmerge.c -o nimcache/5_2/compiler_ccgmerge.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_ccgmerge.c -o nimcache/5_2/compiler_ccgmerge.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_jsgen.c -o nimcache/5_2/compiler_jsgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_jsgen.c -o nimcache/5_2/compiler_jsgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_passaux.c -o nimcache/5_2/compiler_passaux.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_passaux.c -o nimcache/5_2/compiler_passaux.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_depends.c -o nimcache/5_2/compiler_depends.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_depends.c -o nimcache/5_2/compiler_depends.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_docgen2.c -o nimcache/5_2/compiler_docgen2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_docgen2.c -o nimcache/5_2/compiler_docgen2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_service.c -o nimcache/5_2/compiler_service.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_service.c -o nimcache/5_2/compiler_service.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_parseopt.c -o nimcache/5_2/pure_parseopt.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/pure_parseopt.c -o nimcache/5_2/pure_parseopt.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_modules.c -o nimcache/5_2/compiler_modules.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_modules.c -o nimcache/5_2/compiler_modules.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_pretty.c -o nimcache/5_2/compiler_pretty.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/5_2/compiler_pretty.c -o nimcache/5_2/compiler_pretty.o
    echo "$LINKER -o $binDir/nimrod  \
nimcache/5_2/compiler_nimrod.o \
nimcache/5_2/Nimrod_system.o \
nimcache/5_2/compiler_testability.o \
nimcache/5_2/compiler_commands.o \
nimcache/5_2/pure_os.o \
nimcache/5_2/pure_strutils.o \
nimcache/5_2/pure_parseutils.o \
nimcache/5_2/pure_times.o \
nimcache/5_2/posix_posix.o \
nimcache/5_2/compiler_msgs.o \
nimcache/5_2/compiler_options.o \
nimcache/5_2/compiler_lists.o \
nimcache/5_2/pure_strtabs.o \
nimcache/5_2/pure_hashes.o \
nimcache/5_2/collections_tables.o \
nimcache/5_2/pure_math.o \
nimcache/5_2/compiler_ropes.o \
nimcache/5_2/compiler_platform.o \
nimcache/5_2/compiler_crc.o \
nimcache/5_2/pure_sockets.o \
nimcache/5_2/core_unsigned.o \
nimcache/5_2/compiler_nversion.o \
nimcache/5_2/compiler_condsyms.o \
nimcache/5_2/compiler_idents.o \
nimcache/5_2/compiler_extccomp.o \
nimcache/5_2/pure_osproc.o \
nimcache/5_2/pure_streams.o \
nimcache/5_2/compiler_wordrecg.o \
nimcache/5_2/compiler_babelcmd.o \
nimcache/5_2/compiler_lexer.o \
nimcache/5_2/compiler_nimlexbase.o \
nimcache/5_2/compiler_llstream.o \
nimcache/5_2/compiler_nimconf.o \
nimcache/5_2/compiler_main.o \
nimcache/5_2/compiler_ast.o \
nimcache/5_2/collections_intsets.o \
nimcache/5_2/compiler_idgen.o \
nimcache/5_2/compiler_astalgo.o \
nimcache/5_2/compiler_rodutils.o \
nimcache/5_2/compiler_syntaxes.o \
nimcache/5_2/compiler_parser.o \
nimcache/5_2/compiler_pbraces.o \
nimcache/5_2/compiler_filters.o \
nimcache/5_2/compiler_renderer.o \
nimcache/5_2/compiler_filter_tmpl.o \
nimcache/5_2/compiler_rodread.o \
nimcache/5_2/compiler_types.o \
nimcache/5_2/compiler_trees.o \
nimcache/5_2/pure_memfiles.o \
nimcache/5_2/compiler_rodwrite.o \
nimcache/5_2/compiler_passes.o \
nimcache/5_2/compiler_magicsys.o \
nimcache/5_2/compiler_nimsets.o \
nimcache/5_2/compiler_bitsets.o \
nimcache/5_2/compiler_semthreads.o \
nimcache/5_2/compiler_importer.o \
nimcache/5_2/compiler_lookups.o \
nimcache/5_2/compiler_semdata.o \
nimcache/5_2/compiler_treetab.o \
nimcache/5_2/compiler_evals.o \
nimcache/5_2/compiler_semfold.o \
nimcache/5_2/compiler_saturate.o \
nimcache/5_2/compiler_transf.o \
nimcache/5_2/compiler_cgmeth.o \
nimcache/5_2/compiler_sempass2.o \
nimcache/5_2/compiler_guards.o \
nimcache/5_2/compiler_lambdalifting.o \
nimcache/5_2/compiler_evaltempl.o \
nimcache/5_2/compiler_sem.o \
nimcache/5_2/compiler_procfind.o \
nimcache/5_2/compiler_pragmas.o \
nimcache/5_2/compiler_semtypinst.o \
nimcache/5_2/compiler_sigmatch.o \
nimcache/5_2/compiler_parampatterns.o \
nimcache/5_2/compiler_docgen.o \
nimcache/5_2/docutils_rstast.o \
nimcache/5_2/docutils_rst.o \
nimcache/5_2/docutils_rstgen.o \
nimcache/5_2/docutils_highlite.o \
nimcache/5_2/pure_json.o \
nimcache/5_2/pure_lexbase.o \
nimcache/5_2/pure_unicode.o \
nimcache/5_2/pure_algorithm.o \
nimcache/5_2/collections_sequtils.o \
nimcache/5_2/compiler_aliases.o \
nimcache/5_2/compiler_patterns.o \
nimcache/5_2/compiler_cgen.o \
nimcache/5_2/compiler_ccgutils.o \
nimcache/5_2/compiler_cgendata.o \
nimcache/5_2/compiler_ccgmerge.o \
nimcache/5_2/compiler_jsgen.o \
nimcache/5_2/compiler_passaux.o \
nimcache/5_2/compiler_depends.o \
nimcache/5_2/compiler_docgen2.o \
nimcache/5_2/compiler_service.o \
nimcache/5_2/pure_parseopt.o \
nimcache/5_2/compiler_modules.o \
nimcache/5_2/compiler_pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
nimcache/5_2/compiler_nimrod.o \
nimcache/5_2/Nimrod_system.o \
nimcache/5_2/compiler_testability.o \
nimcache/5_2/compiler_commands.o \
nimcache/5_2/pure_os.o \
nimcache/5_2/pure_strutils.o \
nimcache/5_2/pure_parseutils.o \
nimcache/5_2/pure_times.o \
nimcache/5_2/posix_posix.o \
nimcache/5_2/compiler_msgs.o \
nimcache/5_2/compiler_options.o \
nimcache/5_2/compiler_lists.o \
nimcache/5_2/pure_strtabs.o \
nimcache/5_2/pure_hashes.o \
nimcache/5_2/collections_tables.o \
nimcache/5_2/pure_math.o \
nimcache/5_2/compiler_ropes.o \
nimcache/5_2/compiler_platform.o \
nimcache/5_2/compiler_crc.o \
nimcache/5_2/pure_sockets.o \
nimcache/5_2/core_unsigned.o \
nimcache/5_2/compiler_nversion.o \
nimcache/5_2/compiler_condsyms.o \
nimcache/5_2/compiler_idents.o \
nimcache/5_2/compiler_extccomp.o \
nimcache/5_2/pure_osproc.o \
nimcache/5_2/pure_streams.o \
nimcache/5_2/compiler_wordrecg.o \
nimcache/5_2/compiler_babelcmd.o \
nimcache/5_2/compiler_lexer.o \
nimcache/5_2/compiler_nimlexbase.o \
nimcache/5_2/compiler_llstream.o \
nimcache/5_2/compiler_nimconf.o \
nimcache/5_2/compiler_main.o \
nimcache/5_2/compiler_ast.o \
nimcache/5_2/collections_intsets.o \
nimcache/5_2/compiler_idgen.o \
nimcache/5_2/compiler_astalgo.o \
nimcache/5_2/compiler_rodutils.o \
nimcache/5_2/compiler_syntaxes.o \
nimcache/5_2/compiler_parser.o \
nimcache/5_2/compiler_pbraces.o \
nimcache/5_2/compiler_filters.o \
nimcache/5_2/compiler_renderer.o \
nimcache/5_2/compiler_filter_tmpl.o \
nimcache/5_2/compiler_rodread.o \
nimcache/5_2/compiler_types.o \
nimcache/5_2/compiler_trees.o \
nimcache/5_2/pure_memfiles.o \
nimcache/5_2/compiler_rodwrite.o \
nimcache/5_2/compiler_passes.o \
nimcache/5_2/compiler_magicsys.o \
nimcache/5_2/compiler_nimsets.o \
nimcache/5_2/compiler_bitsets.o \
nimcache/5_2/compiler_semthreads.o \
nimcache/5_2/compiler_importer.o \
nimcache/5_2/compiler_lookups.o \
nimcache/5_2/compiler_semdata.o \
nimcache/5_2/compiler_treetab.o \
nimcache/5_2/compiler_evals.o \
nimcache/5_2/compiler_semfold.o \
nimcache/5_2/compiler_saturate.o \
nimcache/5_2/compiler_transf.o \
nimcache/5_2/compiler_cgmeth.o \
nimcache/5_2/compiler_sempass2.o \
nimcache/5_2/compiler_guards.o \
nimcache/5_2/compiler_lambdalifting.o \
nimcache/5_2/compiler_evaltempl.o \
nimcache/5_2/compiler_sem.o \
nimcache/5_2/compiler_procfind.o \
nimcache/5_2/compiler_pragmas.o \
nimcache/5_2/compiler_semtypinst.o \
nimcache/5_2/compiler_sigmatch.o \
nimcache/5_2/compiler_parampatterns.o \
nimcache/5_2/compiler_docgen.o \
nimcache/5_2/docutils_rstast.o \
nimcache/5_2/docutils_rst.o \
nimcache/5_2/docutils_rstgen.o \
nimcache/5_2/docutils_highlite.o \
nimcache/5_2/pure_json.o \
nimcache/5_2/pure_lexbase.o \
nimcache/5_2/pure_unicode.o \
nimcache/5_2/pure_algorithm.o \
nimcache/5_2/collections_sequtils.o \
nimcache/5_2/compiler_aliases.o \
nimcache/5_2/compiler_patterns.o \
nimcache/5_2/compiler_cgen.o \
nimcache/5_2/compiler_ccgutils.o \
nimcache/5_2/compiler_cgendata.o \
nimcache/5_2/compiler_ccgmerge.o \
nimcache/5_2/compiler_jsgen.o \
nimcache/5_2/compiler_passaux.o \
nimcache/5_2/compiler_depends.o \
nimcache/5_2/compiler_docgen2.o \
nimcache/5_2/compiler_service.o \
nimcache/5_2/pure_parseopt.o \
nimcache/5_2/compiler_modules.o \
nimcache/5_2/compiler_pretty.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$LINKER -o $binDir/nimrod  $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/nimrod  $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  $LINK_FLAGS
    ;;
  sparc)
    echo "$LINKER -o $binDir/nimrod  $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/nimrod  $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  $LINK_FLAGS
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
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_nimrod.c -o nimcache/6_1/compiler_nimrod.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_nimrod.c -o nimcache/6_1/compiler_nimrod.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/Nimrod_system.c -o nimcache/6_1/Nimrod_system.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/Nimrod_system.c -o nimcache/6_1/Nimrod_system.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_testability.c -o nimcache/6_1/compiler_testability.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_testability.c -o nimcache/6_1/compiler_testability.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_commands.c -o nimcache/6_1/compiler_commands.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_commands.c -o nimcache/6_1/compiler_commands.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_os.c -o nimcache/6_1/pure_os.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_os.c -o nimcache/6_1/pure_os.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_strutils.c -o nimcache/6_1/pure_strutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_strutils.c -o nimcache/6_1/pure_strutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_parseutils.c -o nimcache/6_1/pure_parseutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_parseutils.c -o nimcache/6_1/pure_parseutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_times.c -o nimcache/6_1/pure_times.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_times.c -o nimcache/6_1/pure_times.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/posix_posix.c -o nimcache/6_1/posix_posix.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/posix_posix.c -o nimcache/6_1/posix_posix.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_msgs.c -o nimcache/6_1/compiler_msgs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_msgs.c -o nimcache/6_1/compiler_msgs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_options.c -o nimcache/6_1/compiler_options.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_options.c -o nimcache/6_1/compiler_options.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_lists.c -o nimcache/6_1/compiler_lists.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_lists.c -o nimcache/6_1/compiler_lists.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_strtabs.c -o nimcache/6_1/pure_strtabs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_strtabs.c -o nimcache/6_1/pure_strtabs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_hashes.c -o nimcache/6_1/pure_hashes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_hashes.c -o nimcache/6_1/pure_hashes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/collections_tables.c -o nimcache/6_1/collections_tables.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/collections_tables.c -o nimcache/6_1/collections_tables.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_math.c -o nimcache/6_1/pure_math.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_math.c -o nimcache/6_1/pure_math.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_ropes.c -o nimcache/6_1/compiler_ropes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_ropes.c -o nimcache/6_1/compiler_ropes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_platform.c -o nimcache/6_1/compiler_platform.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_platform.c -o nimcache/6_1/compiler_platform.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_crc.c -o nimcache/6_1/compiler_crc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_crc.c -o nimcache/6_1/compiler_crc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_sockets.c -o nimcache/6_1/pure_sockets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_sockets.c -o nimcache/6_1/pure_sockets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/core_unsigned.c -o nimcache/6_1/core_unsigned.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/core_unsigned.c -o nimcache/6_1/core_unsigned.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_nversion.c -o nimcache/6_1/compiler_nversion.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_nversion.c -o nimcache/6_1/compiler_nversion.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_condsyms.c -o nimcache/6_1/compiler_condsyms.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_condsyms.c -o nimcache/6_1/compiler_condsyms.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_idents.c -o nimcache/6_1/compiler_idents.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_idents.c -o nimcache/6_1/compiler_idents.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_extccomp.c -o nimcache/6_1/compiler_extccomp.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_extccomp.c -o nimcache/6_1/compiler_extccomp.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_osproc.c -o nimcache/6_1/pure_osproc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_osproc.c -o nimcache/6_1/pure_osproc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_streams.c -o nimcache/6_1/pure_streams.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_streams.c -o nimcache/6_1/pure_streams.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_wordrecg.c -o nimcache/6_1/compiler_wordrecg.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_wordrecg.c -o nimcache/6_1/compiler_wordrecg.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_babelcmd.c -o nimcache/6_1/compiler_babelcmd.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_babelcmd.c -o nimcache/6_1/compiler_babelcmd.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_lexer.c -o nimcache/6_1/compiler_lexer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_lexer.c -o nimcache/6_1/compiler_lexer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_nimlexbase.c -o nimcache/6_1/compiler_nimlexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_nimlexbase.c -o nimcache/6_1/compiler_nimlexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_llstream.c -o nimcache/6_1/compiler_llstream.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_llstream.c -o nimcache/6_1/compiler_llstream.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_nimconf.c -o nimcache/6_1/compiler_nimconf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_nimconf.c -o nimcache/6_1/compiler_nimconf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_main.c -o nimcache/6_1/compiler_main.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_main.c -o nimcache/6_1/compiler_main.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_ast.c -o nimcache/6_1/compiler_ast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_ast.c -o nimcache/6_1/compiler_ast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/collections_intsets.c -o nimcache/6_1/collections_intsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/collections_intsets.c -o nimcache/6_1/collections_intsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_idgen.c -o nimcache/6_1/compiler_idgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_idgen.c -o nimcache/6_1/compiler_idgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_astalgo.c -o nimcache/6_1/compiler_astalgo.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_astalgo.c -o nimcache/6_1/compiler_astalgo.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_rodutils.c -o nimcache/6_1/compiler_rodutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_rodutils.c -o nimcache/6_1/compiler_rodutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_syntaxes.c -o nimcache/6_1/compiler_syntaxes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_syntaxes.c -o nimcache/6_1/compiler_syntaxes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_parser.c -o nimcache/6_1/compiler_parser.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_parser.c -o nimcache/6_1/compiler_parser.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_pbraces.c -o nimcache/6_1/compiler_pbraces.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_pbraces.c -o nimcache/6_1/compiler_pbraces.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_filters.c -o nimcache/6_1/compiler_filters.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_filters.c -o nimcache/6_1/compiler_filters.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_renderer.c -o nimcache/6_1/compiler_renderer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_renderer.c -o nimcache/6_1/compiler_renderer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_filter_tmpl.c -o nimcache/6_1/compiler_filter_tmpl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_filter_tmpl.c -o nimcache/6_1/compiler_filter_tmpl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_rodread.c -o nimcache/6_1/compiler_rodread.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_rodread.c -o nimcache/6_1/compiler_rodread.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_types.c -o nimcache/6_1/compiler_types.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_types.c -o nimcache/6_1/compiler_types.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_trees.c -o nimcache/6_1/compiler_trees.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_trees.c -o nimcache/6_1/compiler_trees.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_memfiles.c -o nimcache/6_1/pure_memfiles.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_memfiles.c -o nimcache/6_1/pure_memfiles.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_rodwrite.c -o nimcache/6_1/compiler_rodwrite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_rodwrite.c -o nimcache/6_1/compiler_rodwrite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_passes.c -o nimcache/6_1/compiler_passes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_passes.c -o nimcache/6_1/compiler_passes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_magicsys.c -o nimcache/6_1/compiler_magicsys.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_magicsys.c -o nimcache/6_1/compiler_magicsys.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_nimsets.c -o nimcache/6_1/compiler_nimsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_nimsets.c -o nimcache/6_1/compiler_nimsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_bitsets.c -o nimcache/6_1/compiler_bitsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_bitsets.c -o nimcache/6_1/compiler_bitsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_semthreads.c -o nimcache/6_1/compiler_semthreads.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_semthreads.c -o nimcache/6_1/compiler_semthreads.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_importer.c -o nimcache/6_1/compiler_importer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_importer.c -o nimcache/6_1/compiler_importer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_lookups.c -o nimcache/6_1/compiler_lookups.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_lookups.c -o nimcache/6_1/compiler_lookups.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_semdata.c -o nimcache/6_1/compiler_semdata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_semdata.c -o nimcache/6_1/compiler_semdata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_treetab.c -o nimcache/6_1/compiler_treetab.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_treetab.c -o nimcache/6_1/compiler_treetab.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_evals.c -o nimcache/6_1/compiler_evals.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_evals.c -o nimcache/6_1/compiler_evals.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_semfold.c -o nimcache/6_1/compiler_semfold.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_semfold.c -o nimcache/6_1/compiler_semfold.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_saturate.c -o nimcache/6_1/compiler_saturate.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_saturate.c -o nimcache/6_1/compiler_saturate.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_transf.c -o nimcache/6_1/compiler_transf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_transf.c -o nimcache/6_1/compiler_transf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_cgmeth.c -o nimcache/6_1/compiler_cgmeth.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_cgmeth.c -o nimcache/6_1/compiler_cgmeth.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_sempass2.c -o nimcache/6_1/compiler_sempass2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_sempass2.c -o nimcache/6_1/compiler_sempass2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_guards.c -o nimcache/6_1/compiler_guards.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_guards.c -o nimcache/6_1/compiler_guards.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_lambdalifting.c -o nimcache/6_1/compiler_lambdalifting.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_lambdalifting.c -o nimcache/6_1/compiler_lambdalifting.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_evaltempl.c -o nimcache/6_1/compiler_evaltempl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_evaltempl.c -o nimcache/6_1/compiler_evaltempl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_sem.c -o nimcache/6_1/compiler_sem.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_sem.c -o nimcache/6_1/compiler_sem.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_procfind.c -o nimcache/6_1/compiler_procfind.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_procfind.c -o nimcache/6_1/compiler_procfind.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_pragmas.c -o nimcache/6_1/compiler_pragmas.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_pragmas.c -o nimcache/6_1/compiler_pragmas.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_semtypinst.c -o nimcache/6_1/compiler_semtypinst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_semtypinst.c -o nimcache/6_1/compiler_semtypinst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_sigmatch.c -o nimcache/6_1/compiler_sigmatch.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_sigmatch.c -o nimcache/6_1/compiler_sigmatch.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_parampatterns.c -o nimcache/6_1/compiler_parampatterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_parampatterns.c -o nimcache/6_1/compiler_parampatterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_docgen.c -o nimcache/6_1/compiler_docgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_docgen.c -o nimcache/6_1/compiler_docgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/docutils_rstast.c -o nimcache/6_1/docutils_rstast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/docutils_rstast.c -o nimcache/6_1/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/docutils_rst.c -o nimcache/6_1/docutils_rst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/docutils_rst.c -o nimcache/6_1/docutils_rst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/docutils_rstgen.c -o nimcache/6_1/docutils_rstgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/docutils_rstgen.c -o nimcache/6_1/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/docutils_highlite.c -o nimcache/6_1/docutils_highlite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/docutils_highlite.c -o nimcache/6_1/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_json.c -o nimcache/6_1/pure_json.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_json.c -o nimcache/6_1/pure_json.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_lexbase.c -o nimcache/6_1/pure_lexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_lexbase.c -o nimcache/6_1/pure_lexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_unicode.c -o nimcache/6_1/pure_unicode.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_unicode.c -o nimcache/6_1/pure_unicode.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_algorithm.c -o nimcache/6_1/pure_algorithm.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_algorithm.c -o nimcache/6_1/pure_algorithm.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/collections_sequtils.c -o nimcache/6_1/collections_sequtils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/collections_sequtils.c -o nimcache/6_1/collections_sequtils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_aliases.c -o nimcache/6_1/compiler_aliases.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_aliases.c -o nimcache/6_1/compiler_aliases.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_patterns.c -o nimcache/6_1/compiler_patterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_patterns.c -o nimcache/6_1/compiler_patterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_cgen.c -o nimcache/6_1/compiler_cgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_cgen.c -o nimcache/6_1/compiler_cgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_ccgutils.c -o nimcache/6_1/compiler_ccgutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_ccgutils.c -o nimcache/6_1/compiler_ccgutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_cgendata.c -o nimcache/6_1/compiler_cgendata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_cgendata.c -o nimcache/6_1/compiler_cgendata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_ccgmerge.c -o nimcache/6_1/compiler_ccgmerge.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_ccgmerge.c -o nimcache/6_1/compiler_ccgmerge.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_jsgen.c -o nimcache/6_1/compiler_jsgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_jsgen.c -o nimcache/6_1/compiler_jsgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_passaux.c -o nimcache/6_1/compiler_passaux.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_passaux.c -o nimcache/6_1/compiler_passaux.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_depends.c -o nimcache/6_1/compiler_depends.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_depends.c -o nimcache/6_1/compiler_depends.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_docgen2.c -o nimcache/6_1/compiler_docgen2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_docgen2.c -o nimcache/6_1/compiler_docgen2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_service.c -o nimcache/6_1/compiler_service.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_service.c -o nimcache/6_1/compiler_service.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_parseopt.c -o nimcache/6_1/pure_parseopt.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/pure_parseopt.c -o nimcache/6_1/pure_parseopt.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_modules.c -o nimcache/6_1/compiler_modules.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_modules.c -o nimcache/6_1/compiler_modules.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_pretty.c -o nimcache/6_1/compiler_pretty.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_1/compiler_pretty.c -o nimcache/6_1/compiler_pretty.o
    echo "$LINKER -o $binDir/nimrod  \
nimcache/6_1/compiler_nimrod.o \
nimcache/6_1/Nimrod_system.o \
nimcache/6_1/compiler_testability.o \
nimcache/6_1/compiler_commands.o \
nimcache/6_1/pure_os.o \
nimcache/6_1/pure_strutils.o \
nimcache/6_1/pure_parseutils.o \
nimcache/6_1/pure_times.o \
nimcache/6_1/posix_posix.o \
nimcache/6_1/compiler_msgs.o \
nimcache/6_1/compiler_options.o \
nimcache/6_1/compiler_lists.o \
nimcache/6_1/pure_strtabs.o \
nimcache/6_1/pure_hashes.o \
nimcache/6_1/collections_tables.o \
nimcache/6_1/pure_math.o \
nimcache/6_1/compiler_ropes.o \
nimcache/6_1/compiler_platform.o \
nimcache/6_1/compiler_crc.o \
nimcache/6_1/pure_sockets.o \
nimcache/6_1/core_unsigned.o \
nimcache/6_1/compiler_nversion.o \
nimcache/6_1/compiler_condsyms.o \
nimcache/6_1/compiler_idents.o \
nimcache/6_1/compiler_extccomp.o \
nimcache/6_1/pure_osproc.o \
nimcache/6_1/pure_streams.o \
nimcache/6_1/compiler_wordrecg.o \
nimcache/6_1/compiler_babelcmd.o \
nimcache/6_1/compiler_lexer.o \
nimcache/6_1/compiler_nimlexbase.o \
nimcache/6_1/compiler_llstream.o \
nimcache/6_1/compiler_nimconf.o \
nimcache/6_1/compiler_main.o \
nimcache/6_1/compiler_ast.o \
nimcache/6_1/collections_intsets.o \
nimcache/6_1/compiler_idgen.o \
nimcache/6_1/compiler_astalgo.o \
nimcache/6_1/compiler_rodutils.o \
nimcache/6_1/compiler_syntaxes.o \
nimcache/6_1/compiler_parser.o \
nimcache/6_1/compiler_pbraces.o \
nimcache/6_1/compiler_filters.o \
nimcache/6_1/compiler_renderer.o \
nimcache/6_1/compiler_filter_tmpl.o \
nimcache/6_1/compiler_rodread.o \
nimcache/6_1/compiler_types.o \
nimcache/6_1/compiler_trees.o \
nimcache/6_1/pure_memfiles.o \
nimcache/6_1/compiler_rodwrite.o \
nimcache/6_1/compiler_passes.o \
nimcache/6_1/compiler_magicsys.o \
nimcache/6_1/compiler_nimsets.o \
nimcache/6_1/compiler_bitsets.o \
nimcache/6_1/compiler_semthreads.o \
nimcache/6_1/compiler_importer.o \
nimcache/6_1/compiler_lookups.o \
nimcache/6_1/compiler_semdata.o \
nimcache/6_1/compiler_treetab.o \
nimcache/6_1/compiler_evals.o \
nimcache/6_1/compiler_semfold.o \
nimcache/6_1/compiler_saturate.o \
nimcache/6_1/compiler_transf.o \
nimcache/6_1/compiler_cgmeth.o \
nimcache/6_1/compiler_sempass2.o \
nimcache/6_1/compiler_guards.o \
nimcache/6_1/compiler_lambdalifting.o \
nimcache/6_1/compiler_evaltempl.o \
nimcache/6_1/compiler_sem.o \
nimcache/6_1/compiler_procfind.o \
nimcache/6_1/compiler_pragmas.o \
nimcache/6_1/compiler_semtypinst.o \
nimcache/6_1/compiler_sigmatch.o \
nimcache/6_1/compiler_parampatterns.o \
nimcache/6_1/compiler_docgen.o \
nimcache/6_1/docutils_rstast.o \
nimcache/6_1/docutils_rst.o \
nimcache/6_1/docutils_rstgen.o \
nimcache/6_1/docutils_highlite.o \
nimcache/6_1/pure_json.o \
nimcache/6_1/pure_lexbase.o \
nimcache/6_1/pure_unicode.o \
nimcache/6_1/pure_algorithm.o \
nimcache/6_1/collections_sequtils.o \
nimcache/6_1/compiler_aliases.o \
nimcache/6_1/compiler_patterns.o \
nimcache/6_1/compiler_cgen.o \
nimcache/6_1/compiler_ccgutils.o \
nimcache/6_1/compiler_cgendata.o \
nimcache/6_1/compiler_ccgmerge.o \
nimcache/6_1/compiler_jsgen.o \
nimcache/6_1/compiler_passaux.o \
nimcache/6_1/compiler_depends.o \
nimcache/6_1/compiler_docgen2.o \
nimcache/6_1/compiler_service.o \
nimcache/6_1/pure_parseopt.o \
nimcache/6_1/compiler_modules.o \
nimcache/6_1/compiler_pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
nimcache/6_1/compiler_nimrod.o \
nimcache/6_1/Nimrod_system.o \
nimcache/6_1/compiler_testability.o \
nimcache/6_1/compiler_commands.o \
nimcache/6_1/pure_os.o \
nimcache/6_1/pure_strutils.o \
nimcache/6_1/pure_parseutils.o \
nimcache/6_1/pure_times.o \
nimcache/6_1/posix_posix.o \
nimcache/6_1/compiler_msgs.o \
nimcache/6_1/compiler_options.o \
nimcache/6_1/compiler_lists.o \
nimcache/6_1/pure_strtabs.o \
nimcache/6_1/pure_hashes.o \
nimcache/6_1/collections_tables.o \
nimcache/6_1/pure_math.o \
nimcache/6_1/compiler_ropes.o \
nimcache/6_1/compiler_platform.o \
nimcache/6_1/compiler_crc.o \
nimcache/6_1/pure_sockets.o \
nimcache/6_1/core_unsigned.o \
nimcache/6_1/compiler_nversion.o \
nimcache/6_1/compiler_condsyms.o \
nimcache/6_1/compiler_idents.o \
nimcache/6_1/compiler_extccomp.o \
nimcache/6_1/pure_osproc.o \
nimcache/6_1/pure_streams.o \
nimcache/6_1/compiler_wordrecg.o \
nimcache/6_1/compiler_babelcmd.o \
nimcache/6_1/compiler_lexer.o \
nimcache/6_1/compiler_nimlexbase.o \
nimcache/6_1/compiler_llstream.o \
nimcache/6_1/compiler_nimconf.o \
nimcache/6_1/compiler_main.o \
nimcache/6_1/compiler_ast.o \
nimcache/6_1/collections_intsets.o \
nimcache/6_1/compiler_idgen.o \
nimcache/6_1/compiler_astalgo.o \
nimcache/6_1/compiler_rodutils.o \
nimcache/6_1/compiler_syntaxes.o \
nimcache/6_1/compiler_parser.o \
nimcache/6_1/compiler_pbraces.o \
nimcache/6_1/compiler_filters.o \
nimcache/6_1/compiler_renderer.o \
nimcache/6_1/compiler_filter_tmpl.o \
nimcache/6_1/compiler_rodread.o \
nimcache/6_1/compiler_types.o \
nimcache/6_1/compiler_trees.o \
nimcache/6_1/pure_memfiles.o \
nimcache/6_1/compiler_rodwrite.o \
nimcache/6_1/compiler_passes.o \
nimcache/6_1/compiler_magicsys.o \
nimcache/6_1/compiler_nimsets.o \
nimcache/6_1/compiler_bitsets.o \
nimcache/6_1/compiler_semthreads.o \
nimcache/6_1/compiler_importer.o \
nimcache/6_1/compiler_lookups.o \
nimcache/6_1/compiler_semdata.o \
nimcache/6_1/compiler_treetab.o \
nimcache/6_1/compiler_evals.o \
nimcache/6_1/compiler_semfold.o \
nimcache/6_1/compiler_saturate.o \
nimcache/6_1/compiler_transf.o \
nimcache/6_1/compiler_cgmeth.o \
nimcache/6_1/compiler_sempass2.o \
nimcache/6_1/compiler_guards.o \
nimcache/6_1/compiler_lambdalifting.o \
nimcache/6_1/compiler_evaltempl.o \
nimcache/6_1/compiler_sem.o \
nimcache/6_1/compiler_procfind.o \
nimcache/6_1/compiler_pragmas.o \
nimcache/6_1/compiler_semtypinst.o \
nimcache/6_1/compiler_sigmatch.o \
nimcache/6_1/compiler_parampatterns.o \
nimcache/6_1/compiler_docgen.o \
nimcache/6_1/docutils_rstast.o \
nimcache/6_1/docutils_rst.o \
nimcache/6_1/docutils_rstgen.o \
nimcache/6_1/docutils_highlite.o \
nimcache/6_1/pure_json.o \
nimcache/6_1/pure_lexbase.o \
nimcache/6_1/pure_unicode.o \
nimcache/6_1/pure_algorithm.o \
nimcache/6_1/collections_sequtils.o \
nimcache/6_1/compiler_aliases.o \
nimcache/6_1/compiler_patterns.o \
nimcache/6_1/compiler_cgen.o \
nimcache/6_1/compiler_ccgutils.o \
nimcache/6_1/compiler_cgendata.o \
nimcache/6_1/compiler_ccgmerge.o \
nimcache/6_1/compiler_jsgen.o \
nimcache/6_1/compiler_passaux.o \
nimcache/6_1/compiler_depends.o \
nimcache/6_1/compiler_docgen2.o \
nimcache/6_1/compiler_service.o \
nimcache/6_1/pure_parseopt.o \
nimcache/6_1/compiler_modules.o \
nimcache/6_1/compiler_pretty.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_nimrod.c -o nimcache/6_2/compiler_nimrod.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_nimrod.c -o nimcache/6_2/compiler_nimrod.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/Nimrod_system.c -o nimcache/6_2/Nimrod_system.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/Nimrod_system.c -o nimcache/6_2/Nimrod_system.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_testability.c -o nimcache/6_2/compiler_testability.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_testability.c -o nimcache/6_2/compiler_testability.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_commands.c -o nimcache/6_2/compiler_commands.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_commands.c -o nimcache/6_2/compiler_commands.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_os.c -o nimcache/6_2/pure_os.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_os.c -o nimcache/6_2/pure_os.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_strutils.c -o nimcache/6_2/pure_strutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_strutils.c -o nimcache/6_2/pure_strutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_parseutils.c -o nimcache/6_2/pure_parseutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_parseutils.c -o nimcache/6_2/pure_parseutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_times.c -o nimcache/6_2/pure_times.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_times.c -o nimcache/6_2/pure_times.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/posix_posix.c -o nimcache/6_2/posix_posix.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/posix_posix.c -o nimcache/6_2/posix_posix.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_msgs.c -o nimcache/6_2/compiler_msgs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_msgs.c -o nimcache/6_2/compiler_msgs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_options.c -o nimcache/6_2/compiler_options.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_options.c -o nimcache/6_2/compiler_options.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_lists.c -o nimcache/6_2/compiler_lists.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_lists.c -o nimcache/6_2/compiler_lists.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_strtabs.c -o nimcache/6_2/pure_strtabs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_strtabs.c -o nimcache/6_2/pure_strtabs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_hashes.c -o nimcache/6_2/pure_hashes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_hashes.c -o nimcache/6_2/pure_hashes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/collections_tables.c -o nimcache/6_2/collections_tables.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/collections_tables.c -o nimcache/6_2/collections_tables.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_math.c -o nimcache/6_2/pure_math.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_math.c -o nimcache/6_2/pure_math.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_ropes.c -o nimcache/6_2/compiler_ropes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_ropes.c -o nimcache/6_2/compiler_ropes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_platform.c -o nimcache/6_2/compiler_platform.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_platform.c -o nimcache/6_2/compiler_platform.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_crc.c -o nimcache/6_2/compiler_crc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_crc.c -o nimcache/6_2/compiler_crc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_sockets.c -o nimcache/6_2/pure_sockets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_sockets.c -o nimcache/6_2/pure_sockets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/core_unsigned.c -o nimcache/6_2/core_unsigned.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/core_unsigned.c -o nimcache/6_2/core_unsigned.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_nversion.c -o nimcache/6_2/compiler_nversion.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_nversion.c -o nimcache/6_2/compiler_nversion.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_condsyms.c -o nimcache/6_2/compiler_condsyms.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_condsyms.c -o nimcache/6_2/compiler_condsyms.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_idents.c -o nimcache/6_2/compiler_idents.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_idents.c -o nimcache/6_2/compiler_idents.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_extccomp.c -o nimcache/6_2/compiler_extccomp.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_extccomp.c -o nimcache/6_2/compiler_extccomp.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_osproc.c -o nimcache/6_2/pure_osproc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_osproc.c -o nimcache/6_2/pure_osproc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_streams.c -o nimcache/6_2/pure_streams.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_streams.c -o nimcache/6_2/pure_streams.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_wordrecg.c -o nimcache/6_2/compiler_wordrecg.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_wordrecg.c -o nimcache/6_2/compiler_wordrecg.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_babelcmd.c -o nimcache/6_2/compiler_babelcmd.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_babelcmd.c -o nimcache/6_2/compiler_babelcmd.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_lexer.c -o nimcache/6_2/compiler_lexer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_lexer.c -o nimcache/6_2/compiler_lexer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_nimlexbase.c -o nimcache/6_2/compiler_nimlexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_nimlexbase.c -o nimcache/6_2/compiler_nimlexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_llstream.c -o nimcache/6_2/compiler_llstream.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_llstream.c -o nimcache/6_2/compiler_llstream.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_nimconf.c -o nimcache/6_2/compiler_nimconf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_nimconf.c -o nimcache/6_2/compiler_nimconf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_main.c -o nimcache/6_2/compiler_main.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_main.c -o nimcache/6_2/compiler_main.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_ast.c -o nimcache/6_2/compiler_ast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_ast.c -o nimcache/6_2/compiler_ast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/collections_intsets.c -o nimcache/6_2/collections_intsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/collections_intsets.c -o nimcache/6_2/collections_intsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_idgen.c -o nimcache/6_2/compiler_idgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_idgen.c -o nimcache/6_2/compiler_idgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_astalgo.c -o nimcache/6_2/compiler_astalgo.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_astalgo.c -o nimcache/6_2/compiler_astalgo.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_rodutils.c -o nimcache/6_2/compiler_rodutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_rodutils.c -o nimcache/6_2/compiler_rodutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_syntaxes.c -o nimcache/6_2/compiler_syntaxes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_syntaxes.c -o nimcache/6_2/compiler_syntaxes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_parser.c -o nimcache/6_2/compiler_parser.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_parser.c -o nimcache/6_2/compiler_parser.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_pbraces.c -o nimcache/6_2/compiler_pbraces.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_pbraces.c -o nimcache/6_2/compiler_pbraces.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_filters.c -o nimcache/6_2/compiler_filters.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_filters.c -o nimcache/6_2/compiler_filters.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_renderer.c -o nimcache/6_2/compiler_renderer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_renderer.c -o nimcache/6_2/compiler_renderer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_filter_tmpl.c -o nimcache/6_2/compiler_filter_tmpl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_filter_tmpl.c -o nimcache/6_2/compiler_filter_tmpl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_rodread.c -o nimcache/6_2/compiler_rodread.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_rodread.c -o nimcache/6_2/compiler_rodread.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_types.c -o nimcache/6_2/compiler_types.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_types.c -o nimcache/6_2/compiler_types.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_trees.c -o nimcache/6_2/compiler_trees.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_trees.c -o nimcache/6_2/compiler_trees.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_memfiles.c -o nimcache/6_2/pure_memfiles.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_memfiles.c -o nimcache/6_2/pure_memfiles.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_rodwrite.c -o nimcache/6_2/compiler_rodwrite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_rodwrite.c -o nimcache/6_2/compiler_rodwrite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_passes.c -o nimcache/6_2/compiler_passes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_passes.c -o nimcache/6_2/compiler_passes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_magicsys.c -o nimcache/6_2/compiler_magicsys.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_magicsys.c -o nimcache/6_2/compiler_magicsys.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_nimsets.c -o nimcache/6_2/compiler_nimsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_nimsets.c -o nimcache/6_2/compiler_nimsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_bitsets.c -o nimcache/6_2/compiler_bitsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_bitsets.c -o nimcache/6_2/compiler_bitsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_semthreads.c -o nimcache/6_2/compiler_semthreads.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_semthreads.c -o nimcache/6_2/compiler_semthreads.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_importer.c -o nimcache/6_2/compiler_importer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_importer.c -o nimcache/6_2/compiler_importer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_lookups.c -o nimcache/6_2/compiler_lookups.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_lookups.c -o nimcache/6_2/compiler_lookups.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_semdata.c -o nimcache/6_2/compiler_semdata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_semdata.c -o nimcache/6_2/compiler_semdata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_treetab.c -o nimcache/6_2/compiler_treetab.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_treetab.c -o nimcache/6_2/compiler_treetab.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_evals.c -o nimcache/6_2/compiler_evals.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_evals.c -o nimcache/6_2/compiler_evals.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_semfold.c -o nimcache/6_2/compiler_semfold.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_semfold.c -o nimcache/6_2/compiler_semfold.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_saturate.c -o nimcache/6_2/compiler_saturate.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_saturate.c -o nimcache/6_2/compiler_saturate.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_transf.c -o nimcache/6_2/compiler_transf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_transf.c -o nimcache/6_2/compiler_transf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_cgmeth.c -o nimcache/6_2/compiler_cgmeth.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_cgmeth.c -o nimcache/6_2/compiler_cgmeth.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_sempass2.c -o nimcache/6_2/compiler_sempass2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_sempass2.c -o nimcache/6_2/compiler_sempass2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_guards.c -o nimcache/6_2/compiler_guards.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_guards.c -o nimcache/6_2/compiler_guards.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_lambdalifting.c -o nimcache/6_2/compiler_lambdalifting.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_lambdalifting.c -o nimcache/6_2/compiler_lambdalifting.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_evaltempl.c -o nimcache/6_2/compiler_evaltempl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_evaltempl.c -o nimcache/6_2/compiler_evaltempl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_sem.c -o nimcache/6_2/compiler_sem.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_sem.c -o nimcache/6_2/compiler_sem.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_procfind.c -o nimcache/6_2/compiler_procfind.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_procfind.c -o nimcache/6_2/compiler_procfind.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_pragmas.c -o nimcache/6_2/compiler_pragmas.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_pragmas.c -o nimcache/6_2/compiler_pragmas.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_semtypinst.c -o nimcache/6_2/compiler_semtypinst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_semtypinst.c -o nimcache/6_2/compiler_semtypinst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_sigmatch.c -o nimcache/6_2/compiler_sigmatch.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_sigmatch.c -o nimcache/6_2/compiler_sigmatch.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_parampatterns.c -o nimcache/6_2/compiler_parampatterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_parampatterns.c -o nimcache/6_2/compiler_parampatterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_docgen.c -o nimcache/6_2/compiler_docgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_docgen.c -o nimcache/6_2/compiler_docgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/docutils_rstast.c -o nimcache/6_2/docutils_rstast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/docutils_rstast.c -o nimcache/6_2/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/docutils_rst.c -o nimcache/6_2/docutils_rst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/docutils_rst.c -o nimcache/6_2/docutils_rst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/docutils_rstgen.c -o nimcache/6_2/docutils_rstgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/docutils_rstgen.c -o nimcache/6_2/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/docutils_highlite.c -o nimcache/6_2/docutils_highlite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/docutils_highlite.c -o nimcache/6_2/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_json.c -o nimcache/6_2/pure_json.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_json.c -o nimcache/6_2/pure_json.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_lexbase.c -o nimcache/6_2/pure_lexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_lexbase.c -o nimcache/6_2/pure_lexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_unicode.c -o nimcache/6_2/pure_unicode.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_unicode.c -o nimcache/6_2/pure_unicode.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_algorithm.c -o nimcache/6_2/pure_algorithm.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_algorithm.c -o nimcache/6_2/pure_algorithm.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/collections_sequtils.c -o nimcache/6_2/collections_sequtils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/collections_sequtils.c -o nimcache/6_2/collections_sequtils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_aliases.c -o nimcache/6_2/compiler_aliases.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_aliases.c -o nimcache/6_2/compiler_aliases.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_patterns.c -o nimcache/6_2/compiler_patterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_patterns.c -o nimcache/6_2/compiler_patterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_cgen.c -o nimcache/6_2/compiler_cgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_cgen.c -o nimcache/6_2/compiler_cgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_ccgutils.c -o nimcache/6_2/compiler_ccgutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_ccgutils.c -o nimcache/6_2/compiler_ccgutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_cgendata.c -o nimcache/6_2/compiler_cgendata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_cgendata.c -o nimcache/6_2/compiler_cgendata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_ccgmerge.c -o nimcache/6_2/compiler_ccgmerge.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_ccgmerge.c -o nimcache/6_2/compiler_ccgmerge.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_jsgen.c -o nimcache/6_2/compiler_jsgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_jsgen.c -o nimcache/6_2/compiler_jsgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_passaux.c -o nimcache/6_2/compiler_passaux.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_passaux.c -o nimcache/6_2/compiler_passaux.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_depends.c -o nimcache/6_2/compiler_depends.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_depends.c -o nimcache/6_2/compiler_depends.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_docgen2.c -o nimcache/6_2/compiler_docgen2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_docgen2.c -o nimcache/6_2/compiler_docgen2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_service.c -o nimcache/6_2/compiler_service.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_service.c -o nimcache/6_2/compiler_service.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_parseopt.c -o nimcache/6_2/pure_parseopt.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/pure_parseopt.c -o nimcache/6_2/pure_parseopt.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_modules.c -o nimcache/6_2/compiler_modules.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_modules.c -o nimcache/6_2/compiler_modules.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_pretty.c -o nimcache/6_2/compiler_pretty.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/6_2/compiler_pretty.c -o nimcache/6_2/compiler_pretty.o
    echo "$LINKER -o $binDir/nimrod  \
nimcache/6_2/compiler_nimrod.o \
nimcache/6_2/Nimrod_system.o \
nimcache/6_2/compiler_testability.o \
nimcache/6_2/compiler_commands.o \
nimcache/6_2/pure_os.o \
nimcache/6_2/pure_strutils.o \
nimcache/6_2/pure_parseutils.o \
nimcache/6_2/pure_times.o \
nimcache/6_2/posix_posix.o \
nimcache/6_2/compiler_msgs.o \
nimcache/6_2/compiler_options.o \
nimcache/6_2/compiler_lists.o \
nimcache/6_2/pure_strtabs.o \
nimcache/6_2/pure_hashes.o \
nimcache/6_2/collections_tables.o \
nimcache/6_2/pure_math.o \
nimcache/6_2/compiler_ropes.o \
nimcache/6_2/compiler_platform.o \
nimcache/6_2/compiler_crc.o \
nimcache/6_2/pure_sockets.o \
nimcache/6_2/core_unsigned.o \
nimcache/6_2/compiler_nversion.o \
nimcache/6_2/compiler_condsyms.o \
nimcache/6_2/compiler_idents.o \
nimcache/6_2/compiler_extccomp.o \
nimcache/6_2/pure_osproc.o \
nimcache/6_2/pure_streams.o \
nimcache/6_2/compiler_wordrecg.o \
nimcache/6_2/compiler_babelcmd.o \
nimcache/6_2/compiler_lexer.o \
nimcache/6_2/compiler_nimlexbase.o \
nimcache/6_2/compiler_llstream.o \
nimcache/6_2/compiler_nimconf.o \
nimcache/6_2/compiler_main.o \
nimcache/6_2/compiler_ast.o \
nimcache/6_2/collections_intsets.o \
nimcache/6_2/compiler_idgen.o \
nimcache/6_2/compiler_astalgo.o \
nimcache/6_2/compiler_rodutils.o \
nimcache/6_2/compiler_syntaxes.o \
nimcache/6_2/compiler_parser.o \
nimcache/6_2/compiler_pbraces.o \
nimcache/6_2/compiler_filters.o \
nimcache/6_2/compiler_renderer.o \
nimcache/6_2/compiler_filter_tmpl.o \
nimcache/6_2/compiler_rodread.o \
nimcache/6_2/compiler_types.o \
nimcache/6_2/compiler_trees.o \
nimcache/6_2/pure_memfiles.o \
nimcache/6_2/compiler_rodwrite.o \
nimcache/6_2/compiler_passes.o \
nimcache/6_2/compiler_magicsys.o \
nimcache/6_2/compiler_nimsets.o \
nimcache/6_2/compiler_bitsets.o \
nimcache/6_2/compiler_semthreads.o \
nimcache/6_2/compiler_importer.o \
nimcache/6_2/compiler_lookups.o \
nimcache/6_2/compiler_semdata.o \
nimcache/6_2/compiler_treetab.o \
nimcache/6_2/compiler_evals.o \
nimcache/6_2/compiler_semfold.o \
nimcache/6_2/compiler_saturate.o \
nimcache/6_2/compiler_transf.o \
nimcache/6_2/compiler_cgmeth.o \
nimcache/6_2/compiler_sempass2.o \
nimcache/6_2/compiler_guards.o \
nimcache/6_2/compiler_lambdalifting.o \
nimcache/6_2/compiler_evaltempl.o \
nimcache/6_2/compiler_sem.o \
nimcache/6_2/compiler_procfind.o \
nimcache/6_2/compiler_pragmas.o \
nimcache/6_2/compiler_semtypinst.o \
nimcache/6_2/compiler_sigmatch.o \
nimcache/6_2/compiler_parampatterns.o \
nimcache/6_2/compiler_docgen.o \
nimcache/6_2/docutils_rstast.o \
nimcache/6_2/docutils_rst.o \
nimcache/6_2/docutils_rstgen.o \
nimcache/6_2/docutils_highlite.o \
nimcache/6_2/pure_json.o \
nimcache/6_2/pure_lexbase.o \
nimcache/6_2/pure_unicode.o \
nimcache/6_2/pure_algorithm.o \
nimcache/6_2/collections_sequtils.o \
nimcache/6_2/compiler_aliases.o \
nimcache/6_2/compiler_patterns.o \
nimcache/6_2/compiler_cgen.o \
nimcache/6_2/compiler_ccgutils.o \
nimcache/6_2/compiler_cgendata.o \
nimcache/6_2/compiler_ccgmerge.o \
nimcache/6_2/compiler_jsgen.o \
nimcache/6_2/compiler_passaux.o \
nimcache/6_2/compiler_depends.o \
nimcache/6_2/compiler_docgen2.o \
nimcache/6_2/compiler_service.o \
nimcache/6_2/pure_parseopt.o \
nimcache/6_2/compiler_modules.o \
nimcache/6_2/compiler_pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
nimcache/6_2/compiler_nimrod.o \
nimcache/6_2/Nimrod_system.o \
nimcache/6_2/compiler_testability.o \
nimcache/6_2/compiler_commands.o \
nimcache/6_2/pure_os.o \
nimcache/6_2/pure_strutils.o \
nimcache/6_2/pure_parseutils.o \
nimcache/6_2/pure_times.o \
nimcache/6_2/posix_posix.o \
nimcache/6_2/compiler_msgs.o \
nimcache/6_2/compiler_options.o \
nimcache/6_2/compiler_lists.o \
nimcache/6_2/pure_strtabs.o \
nimcache/6_2/pure_hashes.o \
nimcache/6_2/collections_tables.o \
nimcache/6_2/pure_math.o \
nimcache/6_2/compiler_ropes.o \
nimcache/6_2/compiler_platform.o \
nimcache/6_2/compiler_crc.o \
nimcache/6_2/pure_sockets.o \
nimcache/6_2/core_unsigned.o \
nimcache/6_2/compiler_nversion.o \
nimcache/6_2/compiler_condsyms.o \
nimcache/6_2/compiler_idents.o \
nimcache/6_2/compiler_extccomp.o \
nimcache/6_2/pure_osproc.o \
nimcache/6_2/pure_streams.o \
nimcache/6_2/compiler_wordrecg.o \
nimcache/6_2/compiler_babelcmd.o \
nimcache/6_2/compiler_lexer.o \
nimcache/6_2/compiler_nimlexbase.o \
nimcache/6_2/compiler_llstream.o \
nimcache/6_2/compiler_nimconf.o \
nimcache/6_2/compiler_main.o \
nimcache/6_2/compiler_ast.o \
nimcache/6_2/collections_intsets.o \
nimcache/6_2/compiler_idgen.o \
nimcache/6_2/compiler_astalgo.o \
nimcache/6_2/compiler_rodutils.o \
nimcache/6_2/compiler_syntaxes.o \
nimcache/6_2/compiler_parser.o \
nimcache/6_2/compiler_pbraces.o \
nimcache/6_2/compiler_filters.o \
nimcache/6_2/compiler_renderer.o \
nimcache/6_2/compiler_filter_tmpl.o \
nimcache/6_2/compiler_rodread.o \
nimcache/6_2/compiler_types.o \
nimcache/6_2/compiler_trees.o \
nimcache/6_2/pure_memfiles.o \
nimcache/6_2/compiler_rodwrite.o \
nimcache/6_2/compiler_passes.o \
nimcache/6_2/compiler_magicsys.o \
nimcache/6_2/compiler_nimsets.o \
nimcache/6_2/compiler_bitsets.o \
nimcache/6_2/compiler_semthreads.o \
nimcache/6_2/compiler_importer.o \
nimcache/6_2/compiler_lookups.o \
nimcache/6_2/compiler_semdata.o \
nimcache/6_2/compiler_treetab.o \
nimcache/6_2/compiler_evals.o \
nimcache/6_2/compiler_semfold.o \
nimcache/6_2/compiler_saturate.o \
nimcache/6_2/compiler_transf.o \
nimcache/6_2/compiler_cgmeth.o \
nimcache/6_2/compiler_sempass2.o \
nimcache/6_2/compiler_guards.o \
nimcache/6_2/compiler_lambdalifting.o \
nimcache/6_2/compiler_evaltempl.o \
nimcache/6_2/compiler_sem.o \
nimcache/6_2/compiler_procfind.o \
nimcache/6_2/compiler_pragmas.o \
nimcache/6_2/compiler_semtypinst.o \
nimcache/6_2/compiler_sigmatch.o \
nimcache/6_2/compiler_parampatterns.o \
nimcache/6_2/compiler_docgen.o \
nimcache/6_2/docutils_rstast.o \
nimcache/6_2/docutils_rst.o \
nimcache/6_2/docutils_rstgen.o \
nimcache/6_2/docutils_highlite.o \
nimcache/6_2/pure_json.o \
nimcache/6_2/pure_lexbase.o \
nimcache/6_2/pure_unicode.o \
nimcache/6_2/pure_algorithm.o \
nimcache/6_2/collections_sequtils.o \
nimcache/6_2/compiler_aliases.o \
nimcache/6_2/compiler_patterns.o \
nimcache/6_2/compiler_cgen.o \
nimcache/6_2/compiler_ccgutils.o \
nimcache/6_2/compiler_cgendata.o \
nimcache/6_2/compiler_ccgmerge.o \
nimcache/6_2/compiler_jsgen.o \
nimcache/6_2/compiler_passaux.o \
nimcache/6_2/compiler_depends.o \
nimcache/6_2/compiler_docgen2.o \
nimcache/6_2/compiler_service.o \
nimcache/6_2/pure_parseopt.o \
nimcache/6_2/compiler_modules.o \
nimcache/6_2/compiler_pretty.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$LINKER -o $binDir/nimrod  $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/nimrod  $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  $LINK_FLAGS
    ;;
  sparc)
    echo "$LINKER -o $binDir/nimrod  $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/nimrod  $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  $LINK_FLAGS
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
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_nimrod.c -o nimcache/7_1/compiler_nimrod.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_nimrod.c -o nimcache/7_1/compiler_nimrod.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/Nimrod_system.c -o nimcache/7_1/Nimrod_system.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/Nimrod_system.c -o nimcache/7_1/Nimrod_system.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_testability.c -o nimcache/7_1/compiler_testability.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_testability.c -o nimcache/7_1/compiler_testability.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_commands.c -o nimcache/7_1/compiler_commands.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_commands.c -o nimcache/7_1/compiler_commands.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_os.c -o nimcache/7_1/pure_os.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_os.c -o nimcache/7_1/pure_os.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_strutils.c -o nimcache/7_1/pure_strutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_strutils.c -o nimcache/7_1/pure_strutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_parseutils.c -o nimcache/7_1/pure_parseutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_parseutils.c -o nimcache/7_1/pure_parseutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_times.c -o nimcache/7_1/pure_times.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_times.c -o nimcache/7_1/pure_times.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/posix_posix.c -o nimcache/7_1/posix_posix.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/posix_posix.c -o nimcache/7_1/posix_posix.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_msgs.c -o nimcache/7_1/compiler_msgs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_msgs.c -o nimcache/7_1/compiler_msgs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_options.c -o nimcache/7_1/compiler_options.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_options.c -o nimcache/7_1/compiler_options.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_lists.c -o nimcache/7_1/compiler_lists.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_lists.c -o nimcache/7_1/compiler_lists.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_strtabs.c -o nimcache/7_1/pure_strtabs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_strtabs.c -o nimcache/7_1/pure_strtabs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_hashes.c -o nimcache/7_1/pure_hashes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_hashes.c -o nimcache/7_1/pure_hashes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/collections_tables.c -o nimcache/7_1/collections_tables.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/collections_tables.c -o nimcache/7_1/collections_tables.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_math.c -o nimcache/7_1/pure_math.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_math.c -o nimcache/7_1/pure_math.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_ropes.c -o nimcache/7_1/compiler_ropes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_ropes.c -o nimcache/7_1/compiler_ropes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_platform.c -o nimcache/7_1/compiler_platform.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_platform.c -o nimcache/7_1/compiler_platform.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_crc.c -o nimcache/7_1/compiler_crc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_crc.c -o nimcache/7_1/compiler_crc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_sockets.c -o nimcache/7_1/pure_sockets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_sockets.c -o nimcache/7_1/pure_sockets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/core_unsigned.c -o nimcache/7_1/core_unsigned.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/core_unsigned.c -o nimcache/7_1/core_unsigned.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_nversion.c -o nimcache/7_1/compiler_nversion.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_nversion.c -o nimcache/7_1/compiler_nversion.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_condsyms.c -o nimcache/7_1/compiler_condsyms.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_condsyms.c -o nimcache/7_1/compiler_condsyms.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_idents.c -o nimcache/7_1/compiler_idents.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_idents.c -o nimcache/7_1/compiler_idents.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_extccomp.c -o nimcache/7_1/compiler_extccomp.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_extccomp.c -o nimcache/7_1/compiler_extccomp.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_osproc.c -o nimcache/7_1/pure_osproc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_osproc.c -o nimcache/7_1/pure_osproc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_streams.c -o nimcache/7_1/pure_streams.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_streams.c -o nimcache/7_1/pure_streams.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_wordrecg.c -o nimcache/7_1/compiler_wordrecg.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_wordrecg.c -o nimcache/7_1/compiler_wordrecg.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_babelcmd.c -o nimcache/7_1/compiler_babelcmd.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_babelcmd.c -o nimcache/7_1/compiler_babelcmd.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_lexer.c -o nimcache/7_1/compiler_lexer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_lexer.c -o nimcache/7_1/compiler_lexer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_nimlexbase.c -o nimcache/7_1/compiler_nimlexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_nimlexbase.c -o nimcache/7_1/compiler_nimlexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_llstream.c -o nimcache/7_1/compiler_llstream.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_llstream.c -o nimcache/7_1/compiler_llstream.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_nimconf.c -o nimcache/7_1/compiler_nimconf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_nimconf.c -o nimcache/7_1/compiler_nimconf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_main.c -o nimcache/7_1/compiler_main.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_main.c -o nimcache/7_1/compiler_main.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_ast.c -o nimcache/7_1/compiler_ast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_ast.c -o nimcache/7_1/compiler_ast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/collections_intsets.c -o nimcache/7_1/collections_intsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/collections_intsets.c -o nimcache/7_1/collections_intsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_idgen.c -o nimcache/7_1/compiler_idgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_idgen.c -o nimcache/7_1/compiler_idgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_astalgo.c -o nimcache/7_1/compiler_astalgo.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_astalgo.c -o nimcache/7_1/compiler_astalgo.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_rodutils.c -o nimcache/7_1/compiler_rodutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_rodutils.c -o nimcache/7_1/compiler_rodutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_syntaxes.c -o nimcache/7_1/compiler_syntaxes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_syntaxes.c -o nimcache/7_1/compiler_syntaxes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_parser.c -o nimcache/7_1/compiler_parser.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_parser.c -o nimcache/7_1/compiler_parser.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_pbraces.c -o nimcache/7_1/compiler_pbraces.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_pbraces.c -o nimcache/7_1/compiler_pbraces.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_filters.c -o nimcache/7_1/compiler_filters.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_filters.c -o nimcache/7_1/compiler_filters.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_renderer.c -o nimcache/7_1/compiler_renderer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_renderer.c -o nimcache/7_1/compiler_renderer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_filter_tmpl.c -o nimcache/7_1/compiler_filter_tmpl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_filter_tmpl.c -o nimcache/7_1/compiler_filter_tmpl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_rodread.c -o nimcache/7_1/compiler_rodread.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_rodread.c -o nimcache/7_1/compiler_rodread.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_types.c -o nimcache/7_1/compiler_types.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_types.c -o nimcache/7_1/compiler_types.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_trees.c -o nimcache/7_1/compiler_trees.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_trees.c -o nimcache/7_1/compiler_trees.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_memfiles.c -o nimcache/7_1/pure_memfiles.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_memfiles.c -o nimcache/7_1/pure_memfiles.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_rodwrite.c -o nimcache/7_1/compiler_rodwrite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_rodwrite.c -o nimcache/7_1/compiler_rodwrite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_passes.c -o nimcache/7_1/compiler_passes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_passes.c -o nimcache/7_1/compiler_passes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_magicsys.c -o nimcache/7_1/compiler_magicsys.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_magicsys.c -o nimcache/7_1/compiler_magicsys.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_nimsets.c -o nimcache/7_1/compiler_nimsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_nimsets.c -o nimcache/7_1/compiler_nimsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_bitsets.c -o nimcache/7_1/compiler_bitsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_bitsets.c -o nimcache/7_1/compiler_bitsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_semthreads.c -o nimcache/7_1/compiler_semthreads.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_semthreads.c -o nimcache/7_1/compiler_semthreads.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_importer.c -o nimcache/7_1/compiler_importer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_importer.c -o nimcache/7_1/compiler_importer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_lookups.c -o nimcache/7_1/compiler_lookups.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_lookups.c -o nimcache/7_1/compiler_lookups.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_semdata.c -o nimcache/7_1/compiler_semdata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_semdata.c -o nimcache/7_1/compiler_semdata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_treetab.c -o nimcache/7_1/compiler_treetab.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_treetab.c -o nimcache/7_1/compiler_treetab.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_evals.c -o nimcache/7_1/compiler_evals.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_evals.c -o nimcache/7_1/compiler_evals.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_semfold.c -o nimcache/7_1/compiler_semfold.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_semfold.c -o nimcache/7_1/compiler_semfold.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_saturate.c -o nimcache/7_1/compiler_saturate.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_saturate.c -o nimcache/7_1/compiler_saturate.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_transf.c -o nimcache/7_1/compiler_transf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_transf.c -o nimcache/7_1/compiler_transf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_cgmeth.c -o nimcache/7_1/compiler_cgmeth.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_cgmeth.c -o nimcache/7_1/compiler_cgmeth.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_sempass2.c -o nimcache/7_1/compiler_sempass2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_sempass2.c -o nimcache/7_1/compiler_sempass2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_guards.c -o nimcache/7_1/compiler_guards.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_guards.c -o nimcache/7_1/compiler_guards.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_lambdalifting.c -o nimcache/7_1/compiler_lambdalifting.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_lambdalifting.c -o nimcache/7_1/compiler_lambdalifting.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_evaltempl.c -o nimcache/7_1/compiler_evaltempl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_evaltempl.c -o nimcache/7_1/compiler_evaltempl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_sem.c -o nimcache/7_1/compiler_sem.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_sem.c -o nimcache/7_1/compiler_sem.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_procfind.c -o nimcache/7_1/compiler_procfind.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_procfind.c -o nimcache/7_1/compiler_procfind.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_pragmas.c -o nimcache/7_1/compiler_pragmas.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_pragmas.c -o nimcache/7_1/compiler_pragmas.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_semtypinst.c -o nimcache/7_1/compiler_semtypinst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_semtypinst.c -o nimcache/7_1/compiler_semtypinst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_sigmatch.c -o nimcache/7_1/compiler_sigmatch.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_sigmatch.c -o nimcache/7_1/compiler_sigmatch.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_parampatterns.c -o nimcache/7_1/compiler_parampatterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_parampatterns.c -o nimcache/7_1/compiler_parampatterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_docgen.c -o nimcache/7_1/compiler_docgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_docgen.c -o nimcache/7_1/compiler_docgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/docutils_rstast.c -o nimcache/7_1/docutils_rstast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/docutils_rstast.c -o nimcache/7_1/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/docutils_rst.c -o nimcache/7_1/docutils_rst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/docutils_rst.c -o nimcache/7_1/docutils_rst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/docutils_rstgen.c -o nimcache/7_1/docutils_rstgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/docutils_rstgen.c -o nimcache/7_1/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/docutils_highlite.c -o nimcache/7_1/docutils_highlite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/docutils_highlite.c -o nimcache/7_1/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_json.c -o nimcache/7_1/pure_json.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_json.c -o nimcache/7_1/pure_json.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_lexbase.c -o nimcache/7_1/pure_lexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_lexbase.c -o nimcache/7_1/pure_lexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_unicode.c -o nimcache/7_1/pure_unicode.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_unicode.c -o nimcache/7_1/pure_unicode.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_algorithm.c -o nimcache/7_1/pure_algorithm.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_algorithm.c -o nimcache/7_1/pure_algorithm.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/collections_sequtils.c -o nimcache/7_1/collections_sequtils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/collections_sequtils.c -o nimcache/7_1/collections_sequtils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_aliases.c -o nimcache/7_1/compiler_aliases.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_aliases.c -o nimcache/7_1/compiler_aliases.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_patterns.c -o nimcache/7_1/compiler_patterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_patterns.c -o nimcache/7_1/compiler_patterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_cgen.c -o nimcache/7_1/compiler_cgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_cgen.c -o nimcache/7_1/compiler_cgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_ccgutils.c -o nimcache/7_1/compiler_ccgutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_ccgutils.c -o nimcache/7_1/compiler_ccgutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_cgendata.c -o nimcache/7_1/compiler_cgendata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_cgendata.c -o nimcache/7_1/compiler_cgendata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_ccgmerge.c -o nimcache/7_1/compiler_ccgmerge.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_ccgmerge.c -o nimcache/7_1/compiler_ccgmerge.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_jsgen.c -o nimcache/7_1/compiler_jsgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_jsgen.c -o nimcache/7_1/compiler_jsgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_passaux.c -o nimcache/7_1/compiler_passaux.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_passaux.c -o nimcache/7_1/compiler_passaux.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_depends.c -o nimcache/7_1/compiler_depends.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_depends.c -o nimcache/7_1/compiler_depends.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_docgen2.c -o nimcache/7_1/compiler_docgen2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_docgen2.c -o nimcache/7_1/compiler_docgen2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_service.c -o nimcache/7_1/compiler_service.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_service.c -o nimcache/7_1/compiler_service.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_parseopt.c -o nimcache/7_1/pure_parseopt.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/pure_parseopt.c -o nimcache/7_1/pure_parseopt.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_modules.c -o nimcache/7_1/compiler_modules.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_modules.c -o nimcache/7_1/compiler_modules.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_pretty.c -o nimcache/7_1/compiler_pretty.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_1/compiler_pretty.c -o nimcache/7_1/compiler_pretty.o
    echo "$LINKER -o $binDir/nimrod  \
nimcache/7_1/compiler_nimrod.o \
nimcache/7_1/Nimrod_system.o \
nimcache/7_1/compiler_testability.o \
nimcache/7_1/compiler_commands.o \
nimcache/7_1/pure_os.o \
nimcache/7_1/pure_strutils.o \
nimcache/7_1/pure_parseutils.o \
nimcache/7_1/pure_times.o \
nimcache/7_1/posix_posix.o \
nimcache/7_1/compiler_msgs.o \
nimcache/7_1/compiler_options.o \
nimcache/7_1/compiler_lists.o \
nimcache/7_1/pure_strtabs.o \
nimcache/7_1/pure_hashes.o \
nimcache/7_1/collections_tables.o \
nimcache/7_1/pure_math.o \
nimcache/7_1/compiler_ropes.o \
nimcache/7_1/compiler_platform.o \
nimcache/7_1/compiler_crc.o \
nimcache/7_1/pure_sockets.o \
nimcache/7_1/core_unsigned.o \
nimcache/7_1/compiler_nversion.o \
nimcache/7_1/compiler_condsyms.o \
nimcache/7_1/compiler_idents.o \
nimcache/7_1/compiler_extccomp.o \
nimcache/7_1/pure_osproc.o \
nimcache/7_1/pure_streams.o \
nimcache/7_1/compiler_wordrecg.o \
nimcache/7_1/compiler_babelcmd.o \
nimcache/7_1/compiler_lexer.o \
nimcache/7_1/compiler_nimlexbase.o \
nimcache/7_1/compiler_llstream.o \
nimcache/7_1/compiler_nimconf.o \
nimcache/7_1/compiler_main.o \
nimcache/7_1/compiler_ast.o \
nimcache/7_1/collections_intsets.o \
nimcache/7_1/compiler_idgen.o \
nimcache/7_1/compiler_astalgo.o \
nimcache/7_1/compiler_rodutils.o \
nimcache/7_1/compiler_syntaxes.o \
nimcache/7_1/compiler_parser.o \
nimcache/7_1/compiler_pbraces.o \
nimcache/7_1/compiler_filters.o \
nimcache/7_1/compiler_renderer.o \
nimcache/7_1/compiler_filter_tmpl.o \
nimcache/7_1/compiler_rodread.o \
nimcache/7_1/compiler_types.o \
nimcache/7_1/compiler_trees.o \
nimcache/7_1/pure_memfiles.o \
nimcache/7_1/compiler_rodwrite.o \
nimcache/7_1/compiler_passes.o \
nimcache/7_1/compiler_magicsys.o \
nimcache/7_1/compiler_nimsets.o \
nimcache/7_1/compiler_bitsets.o \
nimcache/7_1/compiler_semthreads.o \
nimcache/7_1/compiler_importer.o \
nimcache/7_1/compiler_lookups.o \
nimcache/7_1/compiler_semdata.o \
nimcache/7_1/compiler_treetab.o \
nimcache/7_1/compiler_evals.o \
nimcache/7_1/compiler_semfold.o \
nimcache/7_1/compiler_saturate.o \
nimcache/7_1/compiler_transf.o \
nimcache/7_1/compiler_cgmeth.o \
nimcache/7_1/compiler_sempass2.o \
nimcache/7_1/compiler_guards.o \
nimcache/7_1/compiler_lambdalifting.o \
nimcache/7_1/compiler_evaltempl.o \
nimcache/7_1/compiler_sem.o \
nimcache/7_1/compiler_procfind.o \
nimcache/7_1/compiler_pragmas.o \
nimcache/7_1/compiler_semtypinst.o \
nimcache/7_1/compiler_sigmatch.o \
nimcache/7_1/compiler_parampatterns.o \
nimcache/7_1/compiler_docgen.o \
nimcache/7_1/docutils_rstast.o \
nimcache/7_1/docutils_rst.o \
nimcache/7_1/docutils_rstgen.o \
nimcache/7_1/docutils_highlite.o \
nimcache/7_1/pure_json.o \
nimcache/7_1/pure_lexbase.o \
nimcache/7_1/pure_unicode.o \
nimcache/7_1/pure_algorithm.o \
nimcache/7_1/collections_sequtils.o \
nimcache/7_1/compiler_aliases.o \
nimcache/7_1/compiler_patterns.o \
nimcache/7_1/compiler_cgen.o \
nimcache/7_1/compiler_ccgutils.o \
nimcache/7_1/compiler_cgendata.o \
nimcache/7_1/compiler_ccgmerge.o \
nimcache/7_1/compiler_jsgen.o \
nimcache/7_1/compiler_passaux.o \
nimcache/7_1/compiler_depends.o \
nimcache/7_1/compiler_docgen2.o \
nimcache/7_1/compiler_service.o \
nimcache/7_1/pure_parseopt.o \
nimcache/7_1/compiler_modules.o \
nimcache/7_1/compiler_pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
nimcache/7_1/compiler_nimrod.o \
nimcache/7_1/Nimrod_system.o \
nimcache/7_1/compiler_testability.o \
nimcache/7_1/compiler_commands.o \
nimcache/7_1/pure_os.o \
nimcache/7_1/pure_strutils.o \
nimcache/7_1/pure_parseutils.o \
nimcache/7_1/pure_times.o \
nimcache/7_1/posix_posix.o \
nimcache/7_1/compiler_msgs.o \
nimcache/7_1/compiler_options.o \
nimcache/7_1/compiler_lists.o \
nimcache/7_1/pure_strtabs.o \
nimcache/7_1/pure_hashes.o \
nimcache/7_1/collections_tables.o \
nimcache/7_1/pure_math.o \
nimcache/7_1/compiler_ropes.o \
nimcache/7_1/compiler_platform.o \
nimcache/7_1/compiler_crc.o \
nimcache/7_1/pure_sockets.o \
nimcache/7_1/core_unsigned.o \
nimcache/7_1/compiler_nversion.o \
nimcache/7_1/compiler_condsyms.o \
nimcache/7_1/compiler_idents.o \
nimcache/7_1/compiler_extccomp.o \
nimcache/7_1/pure_osproc.o \
nimcache/7_1/pure_streams.o \
nimcache/7_1/compiler_wordrecg.o \
nimcache/7_1/compiler_babelcmd.o \
nimcache/7_1/compiler_lexer.o \
nimcache/7_1/compiler_nimlexbase.o \
nimcache/7_1/compiler_llstream.o \
nimcache/7_1/compiler_nimconf.o \
nimcache/7_1/compiler_main.o \
nimcache/7_1/compiler_ast.o \
nimcache/7_1/collections_intsets.o \
nimcache/7_1/compiler_idgen.o \
nimcache/7_1/compiler_astalgo.o \
nimcache/7_1/compiler_rodutils.o \
nimcache/7_1/compiler_syntaxes.o \
nimcache/7_1/compiler_parser.o \
nimcache/7_1/compiler_pbraces.o \
nimcache/7_1/compiler_filters.o \
nimcache/7_1/compiler_renderer.o \
nimcache/7_1/compiler_filter_tmpl.o \
nimcache/7_1/compiler_rodread.o \
nimcache/7_1/compiler_types.o \
nimcache/7_1/compiler_trees.o \
nimcache/7_1/pure_memfiles.o \
nimcache/7_1/compiler_rodwrite.o \
nimcache/7_1/compiler_passes.o \
nimcache/7_1/compiler_magicsys.o \
nimcache/7_1/compiler_nimsets.o \
nimcache/7_1/compiler_bitsets.o \
nimcache/7_1/compiler_semthreads.o \
nimcache/7_1/compiler_importer.o \
nimcache/7_1/compiler_lookups.o \
nimcache/7_1/compiler_semdata.o \
nimcache/7_1/compiler_treetab.o \
nimcache/7_1/compiler_evals.o \
nimcache/7_1/compiler_semfold.o \
nimcache/7_1/compiler_saturate.o \
nimcache/7_1/compiler_transf.o \
nimcache/7_1/compiler_cgmeth.o \
nimcache/7_1/compiler_sempass2.o \
nimcache/7_1/compiler_guards.o \
nimcache/7_1/compiler_lambdalifting.o \
nimcache/7_1/compiler_evaltempl.o \
nimcache/7_1/compiler_sem.o \
nimcache/7_1/compiler_procfind.o \
nimcache/7_1/compiler_pragmas.o \
nimcache/7_1/compiler_semtypinst.o \
nimcache/7_1/compiler_sigmatch.o \
nimcache/7_1/compiler_parampatterns.o \
nimcache/7_1/compiler_docgen.o \
nimcache/7_1/docutils_rstast.o \
nimcache/7_1/docutils_rst.o \
nimcache/7_1/docutils_rstgen.o \
nimcache/7_1/docutils_highlite.o \
nimcache/7_1/pure_json.o \
nimcache/7_1/pure_lexbase.o \
nimcache/7_1/pure_unicode.o \
nimcache/7_1/pure_algorithm.o \
nimcache/7_1/collections_sequtils.o \
nimcache/7_1/compiler_aliases.o \
nimcache/7_1/compiler_patterns.o \
nimcache/7_1/compiler_cgen.o \
nimcache/7_1/compiler_ccgutils.o \
nimcache/7_1/compiler_cgendata.o \
nimcache/7_1/compiler_ccgmerge.o \
nimcache/7_1/compiler_jsgen.o \
nimcache/7_1/compiler_passaux.o \
nimcache/7_1/compiler_depends.o \
nimcache/7_1/compiler_docgen2.o \
nimcache/7_1/compiler_service.o \
nimcache/7_1/pure_parseopt.o \
nimcache/7_1/compiler_modules.o \
nimcache/7_1/compiler_pretty.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_nimrod.c -o nimcache/7_2/compiler_nimrod.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_nimrod.c -o nimcache/7_2/compiler_nimrod.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/Nimrod_system.c -o nimcache/7_2/Nimrod_system.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/Nimrod_system.c -o nimcache/7_2/Nimrod_system.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_testability.c -o nimcache/7_2/compiler_testability.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_testability.c -o nimcache/7_2/compiler_testability.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_commands.c -o nimcache/7_2/compiler_commands.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_commands.c -o nimcache/7_2/compiler_commands.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_os.c -o nimcache/7_2/pure_os.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_os.c -o nimcache/7_2/pure_os.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_strutils.c -o nimcache/7_2/pure_strutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_strutils.c -o nimcache/7_2/pure_strutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_parseutils.c -o nimcache/7_2/pure_parseutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_parseutils.c -o nimcache/7_2/pure_parseutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_times.c -o nimcache/7_2/pure_times.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_times.c -o nimcache/7_2/pure_times.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/posix_posix.c -o nimcache/7_2/posix_posix.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/posix_posix.c -o nimcache/7_2/posix_posix.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_msgs.c -o nimcache/7_2/compiler_msgs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_msgs.c -o nimcache/7_2/compiler_msgs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_options.c -o nimcache/7_2/compiler_options.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_options.c -o nimcache/7_2/compiler_options.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_lists.c -o nimcache/7_2/compiler_lists.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_lists.c -o nimcache/7_2/compiler_lists.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_strtabs.c -o nimcache/7_2/pure_strtabs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_strtabs.c -o nimcache/7_2/pure_strtabs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_hashes.c -o nimcache/7_2/pure_hashes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_hashes.c -o nimcache/7_2/pure_hashes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/collections_tables.c -o nimcache/7_2/collections_tables.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/collections_tables.c -o nimcache/7_2/collections_tables.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_math.c -o nimcache/7_2/pure_math.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_math.c -o nimcache/7_2/pure_math.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_ropes.c -o nimcache/7_2/compiler_ropes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_ropes.c -o nimcache/7_2/compiler_ropes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_platform.c -o nimcache/7_2/compiler_platform.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_platform.c -o nimcache/7_2/compiler_platform.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_crc.c -o nimcache/7_2/compiler_crc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_crc.c -o nimcache/7_2/compiler_crc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_sockets.c -o nimcache/7_2/pure_sockets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_sockets.c -o nimcache/7_2/pure_sockets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/core_unsigned.c -o nimcache/7_2/core_unsigned.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/core_unsigned.c -o nimcache/7_2/core_unsigned.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_nversion.c -o nimcache/7_2/compiler_nversion.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_nversion.c -o nimcache/7_2/compiler_nversion.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_condsyms.c -o nimcache/7_2/compiler_condsyms.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_condsyms.c -o nimcache/7_2/compiler_condsyms.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_idents.c -o nimcache/7_2/compiler_idents.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_idents.c -o nimcache/7_2/compiler_idents.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_extccomp.c -o nimcache/7_2/compiler_extccomp.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_extccomp.c -o nimcache/7_2/compiler_extccomp.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_osproc.c -o nimcache/7_2/pure_osproc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_osproc.c -o nimcache/7_2/pure_osproc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_streams.c -o nimcache/7_2/pure_streams.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_streams.c -o nimcache/7_2/pure_streams.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_wordrecg.c -o nimcache/7_2/compiler_wordrecg.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_wordrecg.c -o nimcache/7_2/compiler_wordrecg.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_babelcmd.c -o nimcache/7_2/compiler_babelcmd.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_babelcmd.c -o nimcache/7_2/compiler_babelcmd.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_lexer.c -o nimcache/7_2/compiler_lexer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_lexer.c -o nimcache/7_2/compiler_lexer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_nimlexbase.c -o nimcache/7_2/compiler_nimlexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_nimlexbase.c -o nimcache/7_2/compiler_nimlexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_llstream.c -o nimcache/7_2/compiler_llstream.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_llstream.c -o nimcache/7_2/compiler_llstream.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_nimconf.c -o nimcache/7_2/compiler_nimconf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_nimconf.c -o nimcache/7_2/compiler_nimconf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_main.c -o nimcache/7_2/compiler_main.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_main.c -o nimcache/7_2/compiler_main.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_ast.c -o nimcache/7_2/compiler_ast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_ast.c -o nimcache/7_2/compiler_ast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/collections_intsets.c -o nimcache/7_2/collections_intsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/collections_intsets.c -o nimcache/7_2/collections_intsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_idgen.c -o nimcache/7_2/compiler_idgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_idgen.c -o nimcache/7_2/compiler_idgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_astalgo.c -o nimcache/7_2/compiler_astalgo.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_astalgo.c -o nimcache/7_2/compiler_astalgo.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_rodutils.c -o nimcache/7_2/compiler_rodutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_rodutils.c -o nimcache/7_2/compiler_rodutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_syntaxes.c -o nimcache/7_2/compiler_syntaxes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_syntaxes.c -o nimcache/7_2/compiler_syntaxes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_parser.c -o nimcache/7_2/compiler_parser.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_parser.c -o nimcache/7_2/compiler_parser.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_pbraces.c -o nimcache/7_2/compiler_pbraces.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_pbraces.c -o nimcache/7_2/compiler_pbraces.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_filters.c -o nimcache/7_2/compiler_filters.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_filters.c -o nimcache/7_2/compiler_filters.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_renderer.c -o nimcache/7_2/compiler_renderer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_renderer.c -o nimcache/7_2/compiler_renderer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_filter_tmpl.c -o nimcache/7_2/compiler_filter_tmpl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_filter_tmpl.c -o nimcache/7_2/compiler_filter_tmpl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_rodread.c -o nimcache/7_2/compiler_rodread.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_rodread.c -o nimcache/7_2/compiler_rodread.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_types.c -o nimcache/7_2/compiler_types.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_types.c -o nimcache/7_2/compiler_types.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_trees.c -o nimcache/7_2/compiler_trees.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_trees.c -o nimcache/7_2/compiler_trees.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_memfiles.c -o nimcache/7_2/pure_memfiles.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_memfiles.c -o nimcache/7_2/pure_memfiles.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_rodwrite.c -o nimcache/7_2/compiler_rodwrite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_rodwrite.c -o nimcache/7_2/compiler_rodwrite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_passes.c -o nimcache/7_2/compiler_passes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_passes.c -o nimcache/7_2/compiler_passes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_magicsys.c -o nimcache/7_2/compiler_magicsys.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_magicsys.c -o nimcache/7_2/compiler_magicsys.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_nimsets.c -o nimcache/7_2/compiler_nimsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_nimsets.c -o nimcache/7_2/compiler_nimsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_bitsets.c -o nimcache/7_2/compiler_bitsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_bitsets.c -o nimcache/7_2/compiler_bitsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_semthreads.c -o nimcache/7_2/compiler_semthreads.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_semthreads.c -o nimcache/7_2/compiler_semthreads.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_importer.c -o nimcache/7_2/compiler_importer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_importer.c -o nimcache/7_2/compiler_importer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_lookups.c -o nimcache/7_2/compiler_lookups.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_lookups.c -o nimcache/7_2/compiler_lookups.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_semdata.c -o nimcache/7_2/compiler_semdata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_semdata.c -o nimcache/7_2/compiler_semdata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_treetab.c -o nimcache/7_2/compiler_treetab.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_treetab.c -o nimcache/7_2/compiler_treetab.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_evals.c -o nimcache/7_2/compiler_evals.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_evals.c -o nimcache/7_2/compiler_evals.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_semfold.c -o nimcache/7_2/compiler_semfold.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_semfold.c -o nimcache/7_2/compiler_semfold.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_saturate.c -o nimcache/7_2/compiler_saturate.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_saturate.c -o nimcache/7_2/compiler_saturate.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_transf.c -o nimcache/7_2/compiler_transf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_transf.c -o nimcache/7_2/compiler_transf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_cgmeth.c -o nimcache/7_2/compiler_cgmeth.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_cgmeth.c -o nimcache/7_2/compiler_cgmeth.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_sempass2.c -o nimcache/7_2/compiler_sempass2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_sempass2.c -o nimcache/7_2/compiler_sempass2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_guards.c -o nimcache/7_2/compiler_guards.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_guards.c -o nimcache/7_2/compiler_guards.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_lambdalifting.c -o nimcache/7_2/compiler_lambdalifting.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_lambdalifting.c -o nimcache/7_2/compiler_lambdalifting.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_evaltempl.c -o nimcache/7_2/compiler_evaltempl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_evaltempl.c -o nimcache/7_2/compiler_evaltempl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_sem.c -o nimcache/7_2/compiler_sem.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_sem.c -o nimcache/7_2/compiler_sem.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_procfind.c -o nimcache/7_2/compiler_procfind.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_procfind.c -o nimcache/7_2/compiler_procfind.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_pragmas.c -o nimcache/7_2/compiler_pragmas.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_pragmas.c -o nimcache/7_2/compiler_pragmas.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_semtypinst.c -o nimcache/7_2/compiler_semtypinst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_semtypinst.c -o nimcache/7_2/compiler_semtypinst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_sigmatch.c -o nimcache/7_2/compiler_sigmatch.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_sigmatch.c -o nimcache/7_2/compiler_sigmatch.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_parampatterns.c -o nimcache/7_2/compiler_parampatterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_parampatterns.c -o nimcache/7_2/compiler_parampatterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_docgen.c -o nimcache/7_2/compiler_docgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_docgen.c -o nimcache/7_2/compiler_docgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/docutils_rstast.c -o nimcache/7_2/docutils_rstast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/docutils_rstast.c -o nimcache/7_2/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/docutils_rst.c -o nimcache/7_2/docutils_rst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/docutils_rst.c -o nimcache/7_2/docutils_rst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/docutils_rstgen.c -o nimcache/7_2/docutils_rstgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/docutils_rstgen.c -o nimcache/7_2/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/docutils_highlite.c -o nimcache/7_2/docutils_highlite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/docutils_highlite.c -o nimcache/7_2/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_json.c -o nimcache/7_2/pure_json.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_json.c -o nimcache/7_2/pure_json.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_lexbase.c -o nimcache/7_2/pure_lexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_lexbase.c -o nimcache/7_2/pure_lexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_unicode.c -o nimcache/7_2/pure_unicode.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_unicode.c -o nimcache/7_2/pure_unicode.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_algorithm.c -o nimcache/7_2/pure_algorithm.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_algorithm.c -o nimcache/7_2/pure_algorithm.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/collections_sequtils.c -o nimcache/7_2/collections_sequtils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/collections_sequtils.c -o nimcache/7_2/collections_sequtils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_aliases.c -o nimcache/7_2/compiler_aliases.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_aliases.c -o nimcache/7_2/compiler_aliases.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_patterns.c -o nimcache/7_2/compiler_patterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_patterns.c -o nimcache/7_2/compiler_patterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_cgen.c -o nimcache/7_2/compiler_cgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_cgen.c -o nimcache/7_2/compiler_cgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_ccgutils.c -o nimcache/7_2/compiler_ccgutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_ccgutils.c -o nimcache/7_2/compiler_ccgutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_cgendata.c -o nimcache/7_2/compiler_cgendata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_cgendata.c -o nimcache/7_2/compiler_cgendata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_ccgmerge.c -o nimcache/7_2/compiler_ccgmerge.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_ccgmerge.c -o nimcache/7_2/compiler_ccgmerge.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_jsgen.c -o nimcache/7_2/compiler_jsgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_jsgen.c -o nimcache/7_2/compiler_jsgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_passaux.c -o nimcache/7_2/compiler_passaux.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_passaux.c -o nimcache/7_2/compiler_passaux.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_depends.c -o nimcache/7_2/compiler_depends.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_depends.c -o nimcache/7_2/compiler_depends.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_docgen2.c -o nimcache/7_2/compiler_docgen2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_docgen2.c -o nimcache/7_2/compiler_docgen2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_service.c -o nimcache/7_2/compiler_service.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_service.c -o nimcache/7_2/compiler_service.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_parseopt.c -o nimcache/7_2/pure_parseopt.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/pure_parseopt.c -o nimcache/7_2/pure_parseopt.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_modules.c -o nimcache/7_2/compiler_modules.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_modules.c -o nimcache/7_2/compiler_modules.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_pretty.c -o nimcache/7_2/compiler_pretty.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/7_2/compiler_pretty.c -o nimcache/7_2/compiler_pretty.o
    echo "$LINKER -o $binDir/nimrod  \
nimcache/7_2/compiler_nimrod.o \
nimcache/7_2/Nimrod_system.o \
nimcache/7_2/compiler_testability.o \
nimcache/7_2/compiler_commands.o \
nimcache/7_2/pure_os.o \
nimcache/7_2/pure_strutils.o \
nimcache/7_2/pure_parseutils.o \
nimcache/7_2/pure_times.o \
nimcache/7_2/posix_posix.o \
nimcache/7_2/compiler_msgs.o \
nimcache/7_2/compiler_options.o \
nimcache/7_2/compiler_lists.o \
nimcache/7_2/pure_strtabs.o \
nimcache/7_2/pure_hashes.o \
nimcache/7_2/collections_tables.o \
nimcache/7_2/pure_math.o \
nimcache/7_2/compiler_ropes.o \
nimcache/7_2/compiler_platform.o \
nimcache/7_2/compiler_crc.o \
nimcache/7_2/pure_sockets.o \
nimcache/7_2/core_unsigned.o \
nimcache/7_2/compiler_nversion.o \
nimcache/7_2/compiler_condsyms.o \
nimcache/7_2/compiler_idents.o \
nimcache/7_2/compiler_extccomp.o \
nimcache/7_2/pure_osproc.o \
nimcache/7_2/pure_streams.o \
nimcache/7_2/compiler_wordrecg.o \
nimcache/7_2/compiler_babelcmd.o \
nimcache/7_2/compiler_lexer.o \
nimcache/7_2/compiler_nimlexbase.o \
nimcache/7_2/compiler_llstream.o \
nimcache/7_2/compiler_nimconf.o \
nimcache/7_2/compiler_main.o \
nimcache/7_2/compiler_ast.o \
nimcache/7_2/collections_intsets.o \
nimcache/7_2/compiler_idgen.o \
nimcache/7_2/compiler_astalgo.o \
nimcache/7_2/compiler_rodutils.o \
nimcache/7_2/compiler_syntaxes.o \
nimcache/7_2/compiler_parser.o \
nimcache/7_2/compiler_pbraces.o \
nimcache/7_2/compiler_filters.o \
nimcache/7_2/compiler_renderer.o \
nimcache/7_2/compiler_filter_tmpl.o \
nimcache/7_2/compiler_rodread.o \
nimcache/7_2/compiler_types.o \
nimcache/7_2/compiler_trees.o \
nimcache/7_2/pure_memfiles.o \
nimcache/7_2/compiler_rodwrite.o \
nimcache/7_2/compiler_passes.o \
nimcache/7_2/compiler_magicsys.o \
nimcache/7_2/compiler_nimsets.o \
nimcache/7_2/compiler_bitsets.o \
nimcache/7_2/compiler_semthreads.o \
nimcache/7_2/compiler_importer.o \
nimcache/7_2/compiler_lookups.o \
nimcache/7_2/compiler_semdata.o \
nimcache/7_2/compiler_treetab.o \
nimcache/7_2/compiler_evals.o \
nimcache/7_2/compiler_semfold.o \
nimcache/7_2/compiler_saturate.o \
nimcache/7_2/compiler_transf.o \
nimcache/7_2/compiler_cgmeth.o \
nimcache/7_2/compiler_sempass2.o \
nimcache/7_2/compiler_guards.o \
nimcache/7_2/compiler_lambdalifting.o \
nimcache/7_2/compiler_evaltempl.o \
nimcache/7_2/compiler_sem.o \
nimcache/7_2/compiler_procfind.o \
nimcache/7_2/compiler_pragmas.o \
nimcache/7_2/compiler_semtypinst.o \
nimcache/7_2/compiler_sigmatch.o \
nimcache/7_2/compiler_parampatterns.o \
nimcache/7_2/compiler_docgen.o \
nimcache/7_2/docutils_rstast.o \
nimcache/7_2/docutils_rst.o \
nimcache/7_2/docutils_rstgen.o \
nimcache/7_2/docutils_highlite.o \
nimcache/7_2/pure_json.o \
nimcache/7_2/pure_lexbase.o \
nimcache/7_2/pure_unicode.o \
nimcache/7_2/pure_algorithm.o \
nimcache/7_2/collections_sequtils.o \
nimcache/7_2/compiler_aliases.o \
nimcache/7_2/compiler_patterns.o \
nimcache/7_2/compiler_cgen.o \
nimcache/7_2/compiler_ccgutils.o \
nimcache/7_2/compiler_cgendata.o \
nimcache/7_2/compiler_ccgmerge.o \
nimcache/7_2/compiler_jsgen.o \
nimcache/7_2/compiler_passaux.o \
nimcache/7_2/compiler_depends.o \
nimcache/7_2/compiler_docgen2.o \
nimcache/7_2/compiler_service.o \
nimcache/7_2/pure_parseopt.o \
nimcache/7_2/compiler_modules.o \
nimcache/7_2/compiler_pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
nimcache/7_2/compiler_nimrod.o \
nimcache/7_2/Nimrod_system.o \
nimcache/7_2/compiler_testability.o \
nimcache/7_2/compiler_commands.o \
nimcache/7_2/pure_os.o \
nimcache/7_2/pure_strutils.o \
nimcache/7_2/pure_parseutils.o \
nimcache/7_2/pure_times.o \
nimcache/7_2/posix_posix.o \
nimcache/7_2/compiler_msgs.o \
nimcache/7_2/compiler_options.o \
nimcache/7_2/compiler_lists.o \
nimcache/7_2/pure_strtabs.o \
nimcache/7_2/pure_hashes.o \
nimcache/7_2/collections_tables.o \
nimcache/7_2/pure_math.o \
nimcache/7_2/compiler_ropes.o \
nimcache/7_2/compiler_platform.o \
nimcache/7_2/compiler_crc.o \
nimcache/7_2/pure_sockets.o \
nimcache/7_2/core_unsigned.o \
nimcache/7_2/compiler_nversion.o \
nimcache/7_2/compiler_condsyms.o \
nimcache/7_2/compiler_idents.o \
nimcache/7_2/compiler_extccomp.o \
nimcache/7_2/pure_osproc.o \
nimcache/7_2/pure_streams.o \
nimcache/7_2/compiler_wordrecg.o \
nimcache/7_2/compiler_babelcmd.o \
nimcache/7_2/compiler_lexer.o \
nimcache/7_2/compiler_nimlexbase.o \
nimcache/7_2/compiler_llstream.o \
nimcache/7_2/compiler_nimconf.o \
nimcache/7_2/compiler_main.o \
nimcache/7_2/compiler_ast.o \
nimcache/7_2/collections_intsets.o \
nimcache/7_2/compiler_idgen.o \
nimcache/7_2/compiler_astalgo.o \
nimcache/7_2/compiler_rodutils.o \
nimcache/7_2/compiler_syntaxes.o \
nimcache/7_2/compiler_parser.o \
nimcache/7_2/compiler_pbraces.o \
nimcache/7_2/compiler_filters.o \
nimcache/7_2/compiler_renderer.o \
nimcache/7_2/compiler_filter_tmpl.o \
nimcache/7_2/compiler_rodread.o \
nimcache/7_2/compiler_types.o \
nimcache/7_2/compiler_trees.o \
nimcache/7_2/pure_memfiles.o \
nimcache/7_2/compiler_rodwrite.o \
nimcache/7_2/compiler_passes.o \
nimcache/7_2/compiler_magicsys.o \
nimcache/7_2/compiler_nimsets.o \
nimcache/7_2/compiler_bitsets.o \
nimcache/7_2/compiler_semthreads.o \
nimcache/7_2/compiler_importer.o \
nimcache/7_2/compiler_lookups.o \
nimcache/7_2/compiler_semdata.o \
nimcache/7_2/compiler_treetab.o \
nimcache/7_2/compiler_evals.o \
nimcache/7_2/compiler_semfold.o \
nimcache/7_2/compiler_saturate.o \
nimcache/7_2/compiler_transf.o \
nimcache/7_2/compiler_cgmeth.o \
nimcache/7_2/compiler_sempass2.o \
nimcache/7_2/compiler_guards.o \
nimcache/7_2/compiler_lambdalifting.o \
nimcache/7_2/compiler_evaltempl.o \
nimcache/7_2/compiler_sem.o \
nimcache/7_2/compiler_procfind.o \
nimcache/7_2/compiler_pragmas.o \
nimcache/7_2/compiler_semtypinst.o \
nimcache/7_2/compiler_sigmatch.o \
nimcache/7_2/compiler_parampatterns.o \
nimcache/7_2/compiler_docgen.o \
nimcache/7_2/docutils_rstast.o \
nimcache/7_2/docutils_rst.o \
nimcache/7_2/docutils_rstgen.o \
nimcache/7_2/docutils_highlite.o \
nimcache/7_2/pure_json.o \
nimcache/7_2/pure_lexbase.o \
nimcache/7_2/pure_unicode.o \
nimcache/7_2/pure_algorithm.o \
nimcache/7_2/collections_sequtils.o \
nimcache/7_2/compiler_aliases.o \
nimcache/7_2/compiler_patterns.o \
nimcache/7_2/compiler_cgen.o \
nimcache/7_2/compiler_ccgutils.o \
nimcache/7_2/compiler_cgendata.o \
nimcache/7_2/compiler_ccgmerge.o \
nimcache/7_2/compiler_jsgen.o \
nimcache/7_2/compiler_passaux.o \
nimcache/7_2/compiler_depends.o \
nimcache/7_2/compiler_docgen2.o \
nimcache/7_2/compiler_service.o \
nimcache/7_2/pure_parseopt.o \
nimcache/7_2/compiler_modules.o \
nimcache/7_2/compiler_pretty.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$LINKER -o $binDir/nimrod  $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/nimrod  $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  $LINK_FLAGS
    ;;
  sparc)
    echo "$LINKER -o $binDir/nimrod  $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/nimrod  $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  $LINK_FLAGS
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
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_nimrod.c -o nimcache/8_1/compiler_nimrod.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_nimrod.c -o nimcache/8_1/compiler_nimrod.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/Nimrod_system.c -o nimcache/8_1/Nimrod_system.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/Nimrod_system.c -o nimcache/8_1/Nimrod_system.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_testability.c -o nimcache/8_1/compiler_testability.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_testability.c -o nimcache/8_1/compiler_testability.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_commands.c -o nimcache/8_1/compiler_commands.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_commands.c -o nimcache/8_1/compiler_commands.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_os.c -o nimcache/8_1/pure_os.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_os.c -o nimcache/8_1/pure_os.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_strutils.c -o nimcache/8_1/pure_strutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_strutils.c -o nimcache/8_1/pure_strutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_parseutils.c -o nimcache/8_1/pure_parseutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_parseutils.c -o nimcache/8_1/pure_parseutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_times.c -o nimcache/8_1/pure_times.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_times.c -o nimcache/8_1/pure_times.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/posix_posix.c -o nimcache/8_1/posix_posix.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/posix_posix.c -o nimcache/8_1/posix_posix.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_msgs.c -o nimcache/8_1/compiler_msgs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_msgs.c -o nimcache/8_1/compiler_msgs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_options.c -o nimcache/8_1/compiler_options.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_options.c -o nimcache/8_1/compiler_options.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_lists.c -o nimcache/8_1/compiler_lists.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_lists.c -o nimcache/8_1/compiler_lists.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_strtabs.c -o nimcache/8_1/pure_strtabs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_strtabs.c -o nimcache/8_1/pure_strtabs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_hashes.c -o nimcache/8_1/pure_hashes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_hashes.c -o nimcache/8_1/pure_hashes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/collections_tables.c -o nimcache/8_1/collections_tables.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/collections_tables.c -o nimcache/8_1/collections_tables.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_math.c -o nimcache/8_1/pure_math.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_math.c -o nimcache/8_1/pure_math.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_ropes.c -o nimcache/8_1/compiler_ropes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_ropes.c -o nimcache/8_1/compiler_ropes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_platform.c -o nimcache/8_1/compiler_platform.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_platform.c -o nimcache/8_1/compiler_platform.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_crc.c -o nimcache/8_1/compiler_crc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_crc.c -o nimcache/8_1/compiler_crc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_sockets.c -o nimcache/8_1/pure_sockets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_sockets.c -o nimcache/8_1/pure_sockets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/core_unsigned.c -o nimcache/8_1/core_unsigned.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/core_unsigned.c -o nimcache/8_1/core_unsigned.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_nversion.c -o nimcache/8_1/compiler_nversion.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_nversion.c -o nimcache/8_1/compiler_nversion.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_condsyms.c -o nimcache/8_1/compiler_condsyms.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_condsyms.c -o nimcache/8_1/compiler_condsyms.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_idents.c -o nimcache/8_1/compiler_idents.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_idents.c -o nimcache/8_1/compiler_idents.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_extccomp.c -o nimcache/8_1/compiler_extccomp.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_extccomp.c -o nimcache/8_1/compiler_extccomp.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_osproc.c -o nimcache/8_1/pure_osproc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_osproc.c -o nimcache/8_1/pure_osproc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_streams.c -o nimcache/8_1/pure_streams.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_streams.c -o nimcache/8_1/pure_streams.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_wordrecg.c -o nimcache/8_1/compiler_wordrecg.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_wordrecg.c -o nimcache/8_1/compiler_wordrecg.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_babelcmd.c -o nimcache/8_1/compiler_babelcmd.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_babelcmd.c -o nimcache/8_1/compiler_babelcmd.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_lexer.c -o nimcache/8_1/compiler_lexer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_lexer.c -o nimcache/8_1/compiler_lexer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_nimlexbase.c -o nimcache/8_1/compiler_nimlexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_nimlexbase.c -o nimcache/8_1/compiler_nimlexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_llstream.c -o nimcache/8_1/compiler_llstream.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_llstream.c -o nimcache/8_1/compiler_llstream.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_nimconf.c -o nimcache/8_1/compiler_nimconf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_nimconf.c -o nimcache/8_1/compiler_nimconf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_main.c -o nimcache/8_1/compiler_main.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_main.c -o nimcache/8_1/compiler_main.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_ast.c -o nimcache/8_1/compiler_ast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_ast.c -o nimcache/8_1/compiler_ast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/collections_intsets.c -o nimcache/8_1/collections_intsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/collections_intsets.c -o nimcache/8_1/collections_intsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_idgen.c -o nimcache/8_1/compiler_idgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_idgen.c -o nimcache/8_1/compiler_idgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_astalgo.c -o nimcache/8_1/compiler_astalgo.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_astalgo.c -o nimcache/8_1/compiler_astalgo.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_rodutils.c -o nimcache/8_1/compiler_rodutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_rodutils.c -o nimcache/8_1/compiler_rodutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_syntaxes.c -o nimcache/8_1/compiler_syntaxes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_syntaxes.c -o nimcache/8_1/compiler_syntaxes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_parser.c -o nimcache/8_1/compiler_parser.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_parser.c -o nimcache/8_1/compiler_parser.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_pbraces.c -o nimcache/8_1/compiler_pbraces.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_pbraces.c -o nimcache/8_1/compiler_pbraces.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_filters.c -o nimcache/8_1/compiler_filters.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_filters.c -o nimcache/8_1/compiler_filters.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_renderer.c -o nimcache/8_1/compiler_renderer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_renderer.c -o nimcache/8_1/compiler_renderer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_filter_tmpl.c -o nimcache/8_1/compiler_filter_tmpl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_filter_tmpl.c -o nimcache/8_1/compiler_filter_tmpl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_rodread.c -o nimcache/8_1/compiler_rodread.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_rodread.c -o nimcache/8_1/compiler_rodread.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_types.c -o nimcache/8_1/compiler_types.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_types.c -o nimcache/8_1/compiler_types.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_trees.c -o nimcache/8_1/compiler_trees.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_trees.c -o nimcache/8_1/compiler_trees.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_memfiles.c -o nimcache/8_1/pure_memfiles.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_memfiles.c -o nimcache/8_1/pure_memfiles.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_rodwrite.c -o nimcache/8_1/compiler_rodwrite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_rodwrite.c -o nimcache/8_1/compiler_rodwrite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_passes.c -o nimcache/8_1/compiler_passes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_passes.c -o nimcache/8_1/compiler_passes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_magicsys.c -o nimcache/8_1/compiler_magicsys.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_magicsys.c -o nimcache/8_1/compiler_magicsys.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_nimsets.c -o nimcache/8_1/compiler_nimsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_nimsets.c -o nimcache/8_1/compiler_nimsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_bitsets.c -o nimcache/8_1/compiler_bitsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_bitsets.c -o nimcache/8_1/compiler_bitsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_semthreads.c -o nimcache/8_1/compiler_semthreads.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_semthreads.c -o nimcache/8_1/compiler_semthreads.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_importer.c -o nimcache/8_1/compiler_importer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_importer.c -o nimcache/8_1/compiler_importer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_lookups.c -o nimcache/8_1/compiler_lookups.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_lookups.c -o nimcache/8_1/compiler_lookups.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_semdata.c -o nimcache/8_1/compiler_semdata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_semdata.c -o nimcache/8_1/compiler_semdata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_treetab.c -o nimcache/8_1/compiler_treetab.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_treetab.c -o nimcache/8_1/compiler_treetab.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_evals.c -o nimcache/8_1/compiler_evals.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_evals.c -o nimcache/8_1/compiler_evals.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_semfold.c -o nimcache/8_1/compiler_semfold.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_semfold.c -o nimcache/8_1/compiler_semfold.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_saturate.c -o nimcache/8_1/compiler_saturate.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_saturate.c -o nimcache/8_1/compiler_saturate.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_transf.c -o nimcache/8_1/compiler_transf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_transf.c -o nimcache/8_1/compiler_transf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_cgmeth.c -o nimcache/8_1/compiler_cgmeth.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_cgmeth.c -o nimcache/8_1/compiler_cgmeth.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_sempass2.c -o nimcache/8_1/compiler_sempass2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_sempass2.c -o nimcache/8_1/compiler_sempass2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_guards.c -o nimcache/8_1/compiler_guards.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_guards.c -o nimcache/8_1/compiler_guards.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_lambdalifting.c -o nimcache/8_1/compiler_lambdalifting.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_lambdalifting.c -o nimcache/8_1/compiler_lambdalifting.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_evaltempl.c -o nimcache/8_1/compiler_evaltempl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_evaltempl.c -o nimcache/8_1/compiler_evaltempl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_sem.c -o nimcache/8_1/compiler_sem.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_sem.c -o nimcache/8_1/compiler_sem.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_procfind.c -o nimcache/8_1/compiler_procfind.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_procfind.c -o nimcache/8_1/compiler_procfind.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_pragmas.c -o nimcache/8_1/compiler_pragmas.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_pragmas.c -o nimcache/8_1/compiler_pragmas.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_semtypinst.c -o nimcache/8_1/compiler_semtypinst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_semtypinst.c -o nimcache/8_1/compiler_semtypinst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_sigmatch.c -o nimcache/8_1/compiler_sigmatch.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_sigmatch.c -o nimcache/8_1/compiler_sigmatch.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_parampatterns.c -o nimcache/8_1/compiler_parampatterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_parampatterns.c -o nimcache/8_1/compiler_parampatterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_docgen.c -o nimcache/8_1/compiler_docgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_docgen.c -o nimcache/8_1/compiler_docgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/docutils_rstast.c -o nimcache/8_1/docutils_rstast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/docutils_rstast.c -o nimcache/8_1/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/docutils_rst.c -o nimcache/8_1/docutils_rst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/docutils_rst.c -o nimcache/8_1/docutils_rst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/docutils_rstgen.c -o nimcache/8_1/docutils_rstgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/docutils_rstgen.c -o nimcache/8_1/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/docutils_highlite.c -o nimcache/8_1/docutils_highlite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/docutils_highlite.c -o nimcache/8_1/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_json.c -o nimcache/8_1/pure_json.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_json.c -o nimcache/8_1/pure_json.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_lexbase.c -o nimcache/8_1/pure_lexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_lexbase.c -o nimcache/8_1/pure_lexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_unicode.c -o nimcache/8_1/pure_unicode.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_unicode.c -o nimcache/8_1/pure_unicode.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_algorithm.c -o nimcache/8_1/pure_algorithm.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_algorithm.c -o nimcache/8_1/pure_algorithm.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/collections_sequtils.c -o nimcache/8_1/collections_sequtils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/collections_sequtils.c -o nimcache/8_1/collections_sequtils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_aliases.c -o nimcache/8_1/compiler_aliases.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_aliases.c -o nimcache/8_1/compiler_aliases.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_patterns.c -o nimcache/8_1/compiler_patterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_patterns.c -o nimcache/8_1/compiler_patterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_cgen.c -o nimcache/8_1/compiler_cgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_cgen.c -o nimcache/8_1/compiler_cgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_ccgutils.c -o nimcache/8_1/compiler_ccgutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_ccgutils.c -o nimcache/8_1/compiler_ccgutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_cgendata.c -o nimcache/8_1/compiler_cgendata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_cgendata.c -o nimcache/8_1/compiler_cgendata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_ccgmerge.c -o nimcache/8_1/compiler_ccgmerge.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_ccgmerge.c -o nimcache/8_1/compiler_ccgmerge.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_jsgen.c -o nimcache/8_1/compiler_jsgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_jsgen.c -o nimcache/8_1/compiler_jsgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_passaux.c -o nimcache/8_1/compiler_passaux.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_passaux.c -o nimcache/8_1/compiler_passaux.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_depends.c -o nimcache/8_1/compiler_depends.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_depends.c -o nimcache/8_1/compiler_depends.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_docgen2.c -o nimcache/8_1/compiler_docgen2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_docgen2.c -o nimcache/8_1/compiler_docgen2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_service.c -o nimcache/8_1/compiler_service.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_service.c -o nimcache/8_1/compiler_service.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_parseopt.c -o nimcache/8_1/pure_parseopt.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/pure_parseopt.c -o nimcache/8_1/pure_parseopt.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_modules.c -o nimcache/8_1/compiler_modules.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_modules.c -o nimcache/8_1/compiler_modules.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_pretty.c -o nimcache/8_1/compiler_pretty.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_1/compiler_pretty.c -o nimcache/8_1/compiler_pretty.o
    echo "$LINKER -o $binDir/nimrod  \
nimcache/8_1/compiler_nimrod.o \
nimcache/8_1/Nimrod_system.o \
nimcache/8_1/compiler_testability.o \
nimcache/8_1/compiler_commands.o \
nimcache/8_1/pure_os.o \
nimcache/8_1/pure_strutils.o \
nimcache/8_1/pure_parseutils.o \
nimcache/8_1/pure_times.o \
nimcache/8_1/posix_posix.o \
nimcache/8_1/compiler_msgs.o \
nimcache/8_1/compiler_options.o \
nimcache/8_1/compiler_lists.o \
nimcache/8_1/pure_strtabs.o \
nimcache/8_1/pure_hashes.o \
nimcache/8_1/collections_tables.o \
nimcache/8_1/pure_math.o \
nimcache/8_1/compiler_ropes.o \
nimcache/8_1/compiler_platform.o \
nimcache/8_1/compiler_crc.o \
nimcache/8_1/pure_sockets.o \
nimcache/8_1/core_unsigned.o \
nimcache/8_1/compiler_nversion.o \
nimcache/8_1/compiler_condsyms.o \
nimcache/8_1/compiler_idents.o \
nimcache/8_1/compiler_extccomp.o \
nimcache/8_1/pure_osproc.o \
nimcache/8_1/pure_streams.o \
nimcache/8_1/compiler_wordrecg.o \
nimcache/8_1/compiler_babelcmd.o \
nimcache/8_1/compiler_lexer.o \
nimcache/8_1/compiler_nimlexbase.o \
nimcache/8_1/compiler_llstream.o \
nimcache/8_1/compiler_nimconf.o \
nimcache/8_1/compiler_main.o \
nimcache/8_1/compiler_ast.o \
nimcache/8_1/collections_intsets.o \
nimcache/8_1/compiler_idgen.o \
nimcache/8_1/compiler_astalgo.o \
nimcache/8_1/compiler_rodutils.o \
nimcache/8_1/compiler_syntaxes.o \
nimcache/8_1/compiler_parser.o \
nimcache/8_1/compiler_pbraces.o \
nimcache/8_1/compiler_filters.o \
nimcache/8_1/compiler_renderer.o \
nimcache/8_1/compiler_filter_tmpl.o \
nimcache/8_1/compiler_rodread.o \
nimcache/8_1/compiler_types.o \
nimcache/8_1/compiler_trees.o \
nimcache/8_1/pure_memfiles.o \
nimcache/8_1/compiler_rodwrite.o \
nimcache/8_1/compiler_passes.o \
nimcache/8_1/compiler_magicsys.o \
nimcache/8_1/compiler_nimsets.o \
nimcache/8_1/compiler_bitsets.o \
nimcache/8_1/compiler_semthreads.o \
nimcache/8_1/compiler_importer.o \
nimcache/8_1/compiler_lookups.o \
nimcache/8_1/compiler_semdata.o \
nimcache/8_1/compiler_treetab.o \
nimcache/8_1/compiler_evals.o \
nimcache/8_1/compiler_semfold.o \
nimcache/8_1/compiler_saturate.o \
nimcache/8_1/compiler_transf.o \
nimcache/8_1/compiler_cgmeth.o \
nimcache/8_1/compiler_sempass2.o \
nimcache/8_1/compiler_guards.o \
nimcache/8_1/compiler_lambdalifting.o \
nimcache/8_1/compiler_evaltempl.o \
nimcache/8_1/compiler_sem.o \
nimcache/8_1/compiler_procfind.o \
nimcache/8_1/compiler_pragmas.o \
nimcache/8_1/compiler_semtypinst.o \
nimcache/8_1/compiler_sigmatch.o \
nimcache/8_1/compiler_parampatterns.o \
nimcache/8_1/compiler_docgen.o \
nimcache/8_1/docutils_rstast.o \
nimcache/8_1/docutils_rst.o \
nimcache/8_1/docutils_rstgen.o \
nimcache/8_1/docutils_highlite.o \
nimcache/8_1/pure_json.o \
nimcache/8_1/pure_lexbase.o \
nimcache/8_1/pure_unicode.o \
nimcache/8_1/pure_algorithm.o \
nimcache/8_1/collections_sequtils.o \
nimcache/8_1/compiler_aliases.o \
nimcache/8_1/compiler_patterns.o \
nimcache/8_1/compiler_cgen.o \
nimcache/8_1/compiler_ccgutils.o \
nimcache/8_1/compiler_cgendata.o \
nimcache/8_1/compiler_ccgmerge.o \
nimcache/8_1/compiler_jsgen.o \
nimcache/8_1/compiler_passaux.o \
nimcache/8_1/compiler_depends.o \
nimcache/8_1/compiler_docgen2.o \
nimcache/8_1/compiler_service.o \
nimcache/8_1/pure_parseopt.o \
nimcache/8_1/compiler_modules.o \
nimcache/8_1/compiler_pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
nimcache/8_1/compiler_nimrod.o \
nimcache/8_1/Nimrod_system.o \
nimcache/8_1/compiler_testability.o \
nimcache/8_1/compiler_commands.o \
nimcache/8_1/pure_os.o \
nimcache/8_1/pure_strutils.o \
nimcache/8_1/pure_parseutils.o \
nimcache/8_1/pure_times.o \
nimcache/8_1/posix_posix.o \
nimcache/8_1/compiler_msgs.o \
nimcache/8_1/compiler_options.o \
nimcache/8_1/compiler_lists.o \
nimcache/8_1/pure_strtabs.o \
nimcache/8_1/pure_hashes.o \
nimcache/8_1/collections_tables.o \
nimcache/8_1/pure_math.o \
nimcache/8_1/compiler_ropes.o \
nimcache/8_1/compiler_platform.o \
nimcache/8_1/compiler_crc.o \
nimcache/8_1/pure_sockets.o \
nimcache/8_1/core_unsigned.o \
nimcache/8_1/compiler_nversion.o \
nimcache/8_1/compiler_condsyms.o \
nimcache/8_1/compiler_idents.o \
nimcache/8_1/compiler_extccomp.o \
nimcache/8_1/pure_osproc.o \
nimcache/8_1/pure_streams.o \
nimcache/8_1/compiler_wordrecg.o \
nimcache/8_1/compiler_babelcmd.o \
nimcache/8_1/compiler_lexer.o \
nimcache/8_1/compiler_nimlexbase.o \
nimcache/8_1/compiler_llstream.o \
nimcache/8_1/compiler_nimconf.o \
nimcache/8_1/compiler_main.o \
nimcache/8_1/compiler_ast.o \
nimcache/8_1/collections_intsets.o \
nimcache/8_1/compiler_idgen.o \
nimcache/8_1/compiler_astalgo.o \
nimcache/8_1/compiler_rodutils.o \
nimcache/8_1/compiler_syntaxes.o \
nimcache/8_1/compiler_parser.o \
nimcache/8_1/compiler_pbraces.o \
nimcache/8_1/compiler_filters.o \
nimcache/8_1/compiler_renderer.o \
nimcache/8_1/compiler_filter_tmpl.o \
nimcache/8_1/compiler_rodread.o \
nimcache/8_1/compiler_types.o \
nimcache/8_1/compiler_trees.o \
nimcache/8_1/pure_memfiles.o \
nimcache/8_1/compiler_rodwrite.o \
nimcache/8_1/compiler_passes.o \
nimcache/8_1/compiler_magicsys.o \
nimcache/8_1/compiler_nimsets.o \
nimcache/8_1/compiler_bitsets.o \
nimcache/8_1/compiler_semthreads.o \
nimcache/8_1/compiler_importer.o \
nimcache/8_1/compiler_lookups.o \
nimcache/8_1/compiler_semdata.o \
nimcache/8_1/compiler_treetab.o \
nimcache/8_1/compiler_evals.o \
nimcache/8_1/compiler_semfold.o \
nimcache/8_1/compiler_saturate.o \
nimcache/8_1/compiler_transf.o \
nimcache/8_1/compiler_cgmeth.o \
nimcache/8_1/compiler_sempass2.o \
nimcache/8_1/compiler_guards.o \
nimcache/8_1/compiler_lambdalifting.o \
nimcache/8_1/compiler_evaltempl.o \
nimcache/8_1/compiler_sem.o \
nimcache/8_1/compiler_procfind.o \
nimcache/8_1/compiler_pragmas.o \
nimcache/8_1/compiler_semtypinst.o \
nimcache/8_1/compiler_sigmatch.o \
nimcache/8_1/compiler_parampatterns.o \
nimcache/8_1/compiler_docgen.o \
nimcache/8_1/docutils_rstast.o \
nimcache/8_1/docutils_rst.o \
nimcache/8_1/docutils_rstgen.o \
nimcache/8_1/docutils_highlite.o \
nimcache/8_1/pure_json.o \
nimcache/8_1/pure_lexbase.o \
nimcache/8_1/pure_unicode.o \
nimcache/8_1/pure_algorithm.o \
nimcache/8_1/collections_sequtils.o \
nimcache/8_1/compiler_aliases.o \
nimcache/8_1/compiler_patterns.o \
nimcache/8_1/compiler_cgen.o \
nimcache/8_1/compiler_ccgutils.o \
nimcache/8_1/compiler_cgendata.o \
nimcache/8_1/compiler_ccgmerge.o \
nimcache/8_1/compiler_jsgen.o \
nimcache/8_1/compiler_passaux.o \
nimcache/8_1/compiler_depends.o \
nimcache/8_1/compiler_docgen2.o \
nimcache/8_1/compiler_service.o \
nimcache/8_1/pure_parseopt.o \
nimcache/8_1/compiler_modules.o \
nimcache/8_1/compiler_pretty.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_nimrod.c -o nimcache/8_2/compiler_nimrod.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_nimrod.c -o nimcache/8_2/compiler_nimrod.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/Nimrod_system.c -o nimcache/8_2/Nimrod_system.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/Nimrod_system.c -o nimcache/8_2/Nimrod_system.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_testability.c -o nimcache/8_2/compiler_testability.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_testability.c -o nimcache/8_2/compiler_testability.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_commands.c -o nimcache/8_2/compiler_commands.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_commands.c -o nimcache/8_2/compiler_commands.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_os.c -o nimcache/8_2/pure_os.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_os.c -o nimcache/8_2/pure_os.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_strutils.c -o nimcache/8_2/pure_strutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_strutils.c -o nimcache/8_2/pure_strutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_parseutils.c -o nimcache/8_2/pure_parseutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_parseutils.c -o nimcache/8_2/pure_parseutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_times.c -o nimcache/8_2/pure_times.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_times.c -o nimcache/8_2/pure_times.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/posix_posix.c -o nimcache/8_2/posix_posix.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/posix_posix.c -o nimcache/8_2/posix_posix.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_msgs.c -o nimcache/8_2/compiler_msgs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_msgs.c -o nimcache/8_2/compiler_msgs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_options.c -o nimcache/8_2/compiler_options.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_options.c -o nimcache/8_2/compiler_options.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_lists.c -o nimcache/8_2/compiler_lists.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_lists.c -o nimcache/8_2/compiler_lists.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_strtabs.c -o nimcache/8_2/pure_strtabs.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_strtabs.c -o nimcache/8_2/pure_strtabs.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_hashes.c -o nimcache/8_2/pure_hashes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_hashes.c -o nimcache/8_2/pure_hashes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/collections_tables.c -o nimcache/8_2/collections_tables.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/collections_tables.c -o nimcache/8_2/collections_tables.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_math.c -o nimcache/8_2/pure_math.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_math.c -o nimcache/8_2/pure_math.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_ropes.c -o nimcache/8_2/compiler_ropes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_ropes.c -o nimcache/8_2/compiler_ropes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_platform.c -o nimcache/8_2/compiler_platform.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_platform.c -o nimcache/8_2/compiler_platform.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_crc.c -o nimcache/8_2/compiler_crc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_crc.c -o nimcache/8_2/compiler_crc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_sockets.c -o nimcache/8_2/pure_sockets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_sockets.c -o nimcache/8_2/pure_sockets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/core_unsigned.c -o nimcache/8_2/core_unsigned.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/core_unsigned.c -o nimcache/8_2/core_unsigned.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_nversion.c -o nimcache/8_2/compiler_nversion.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_nversion.c -o nimcache/8_2/compiler_nversion.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_condsyms.c -o nimcache/8_2/compiler_condsyms.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_condsyms.c -o nimcache/8_2/compiler_condsyms.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_idents.c -o nimcache/8_2/compiler_idents.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_idents.c -o nimcache/8_2/compiler_idents.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_extccomp.c -o nimcache/8_2/compiler_extccomp.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_extccomp.c -o nimcache/8_2/compiler_extccomp.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_osproc.c -o nimcache/8_2/pure_osproc.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_osproc.c -o nimcache/8_2/pure_osproc.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_streams.c -o nimcache/8_2/pure_streams.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_streams.c -o nimcache/8_2/pure_streams.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_wordrecg.c -o nimcache/8_2/compiler_wordrecg.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_wordrecg.c -o nimcache/8_2/compiler_wordrecg.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_babelcmd.c -o nimcache/8_2/compiler_babelcmd.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_babelcmd.c -o nimcache/8_2/compiler_babelcmd.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_lexer.c -o nimcache/8_2/compiler_lexer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_lexer.c -o nimcache/8_2/compiler_lexer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_nimlexbase.c -o nimcache/8_2/compiler_nimlexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_nimlexbase.c -o nimcache/8_2/compiler_nimlexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_llstream.c -o nimcache/8_2/compiler_llstream.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_llstream.c -o nimcache/8_2/compiler_llstream.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_nimconf.c -o nimcache/8_2/compiler_nimconf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_nimconf.c -o nimcache/8_2/compiler_nimconf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_main.c -o nimcache/8_2/compiler_main.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_main.c -o nimcache/8_2/compiler_main.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_ast.c -o nimcache/8_2/compiler_ast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_ast.c -o nimcache/8_2/compiler_ast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/collections_intsets.c -o nimcache/8_2/collections_intsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/collections_intsets.c -o nimcache/8_2/collections_intsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_idgen.c -o nimcache/8_2/compiler_idgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_idgen.c -o nimcache/8_2/compiler_idgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_astalgo.c -o nimcache/8_2/compiler_astalgo.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_astalgo.c -o nimcache/8_2/compiler_astalgo.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_rodutils.c -o nimcache/8_2/compiler_rodutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_rodutils.c -o nimcache/8_2/compiler_rodutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_syntaxes.c -o nimcache/8_2/compiler_syntaxes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_syntaxes.c -o nimcache/8_2/compiler_syntaxes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_parser.c -o nimcache/8_2/compiler_parser.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_parser.c -o nimcache/8_2/compiler_parser.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_pbraces.c -o nimcache/8_2/compiler_pbraces.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_pbraces.c -o nimcache/8_2/compiler_pbraces.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_filters.c -o nimcache/8_2/compiler_filters.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_filters.c -o nimcache/8_2/compiler_filters.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_renderer.c -o nimcache/8_2/compiler_renderer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_renderer.c -o nimcache/8_2/compiler_renderer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_filter_tmpl.c -o nimcache/8_2/compiler_filter_tmpl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_filter_tmpl.c -o nimcache/8_2/compiler_filter_tmpl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_rodread.c -o nimcache/8_2/compiler_rodread.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_rodread.c -o nimcache/8_2/compiler_rodread.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_types.c -o nimcache/8_2/compiler_types.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_types.c -o nimcache/8_2/compiler_types.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_trees.c -o nimcache/8_2/compiler_trees.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_trees.c -o nimcache/8_2/compiler_trees.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_memfiles.c -o nimcache/8_2/pure_memfiles.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_memfiles.c -o nimcache/8_2/pure_memfiles.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_rodwrite.c -o nimcache/8_2/compiler_rodwrite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_rodwrite.c -o nimcache/8_2/compiler_rodwrite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_passes.c -o nimcache/8_2/compiler_passes.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_passes.c -o nimcache/8_2/compiler_passes.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_magicsys.c -o nimcache/8_2/compiler_magicsys.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_magicsys.c -o nimcache/8_2/compiler_magicsys.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_nimsets.c -o nimcache/8_2/compiler_nimsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_nimsets.c -o nimcache/8_2/compiler_nimsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_bitsets.c -o nimcache/8_2/compiler_bitsets.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_bitsets.c -o nimcache/8_2/compiler_bitsets.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_semthreads.c -o nimcache/8_2/compiler_semthreads.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_semthreads.c -o nimcache/8_2/compiler_semthreads.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_importer.c -o nimcache/8_2/compiler_importer.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_importer.c -o nimcache/8_2/compiler_importer.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_lookups.c -o nimcache/8_2/compiler_lookups.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_lookups.c -o nimcache/8_2/compiler_lookups.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_semdata.c -o nimcache/8_2/compiler_semdata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_semdata.c -o nimcache/8_2/compiler_semdata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_treetab.c -o nimcache/8_2/compiler_treetab.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_treetab.c -o nimcache/8_2/compiler_treetab.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_evals.c -o nimcache/8_2/compiler_evals.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_evals.c -o nimcache/8_2/compiler_evals.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_semfold.c -o nimcache/8_2/compiler_semfold.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_semfold.c -o nimcache/8_2/compiler_semfold.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_saturate.c -o nimcache/8_2/compiler_saturate.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_saturate.c -o nimcache/8_2/compiler_saturate.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_transf.c -o nimcache/8_2/compiler_transf.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_transf.c -o nimcache/8_2/compiler_transf.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_cgmeth.c -o nimcache/8_2/compiler_cgmeth.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_cgmeth.c -o nimcache/8_2/compiler_cgmeth.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_sempass2.c -o nimcache/8_2/compiler_sempass2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_sempass2.c -o nimcache/8_2/compiler_sempass2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_guards.c -o nimcache/8_2/compiler_guards.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_guards.c -o nimcache/8_2/compiler_guards.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_lambdalifting.c -o nimcache/8_2/compiler_lambdalifting.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_lambdalifting.c -o nimcache/8_2/compiler_lambdalifting.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_evaltempl.c -o nimcache/8_2/compiler_evaltempl.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_evaltempl.c -o nimcache/8_2/compiler_evaltempl.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_sem.c -o nimcache/8_2/compiler_sem.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_sem.c -o nimcache/8_2/compiler_sem.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_procfind.c -o nimcache/8_2/compiler_procfind.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_procfind.c -o nimcache/8_2/compiler_procfind.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_pragmas.c -o nimcache/8_2/compiler_pragmas.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_pragmas.c -o nimcache/8_2/compiler_pragmas.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_semtypinst.c -o nimcache/8_2/compiler_semtypinst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_semtypinst.c -o nimcache/8_2/compiler_semtypinst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_sigmatch.c -o nimcache/8_2/compiler_sigmatch.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_sigmatch.c -o nimcache/8_2/compiler_sigmatch.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_parampatterns.c -o nimcache/8_2/compiler_parampatterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_parampatterns.c -o nimcache/8_2/compiler_parampatterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_docgen.c -o nimcache/8_2/compiler_docgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_docgen.c -o nimcache/8_2/compiler_docgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/docutils_rstast.c -o nimcache/8_2/docutils_rstast.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/docutils_rstast.c -o nimcache/8_2/docutils_rstast.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/docutils_rst.c -o nimcache/8_2/docutils_rst.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/docutils_rst.c -o nimcache/8_2/docutils_rst.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/docutils_rstgen.c -o nimcache/8_2/docutils_rstgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/docutils_rstgen.c -o nimcache/8_2/docutils_rstgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/docutils_highlite.c -o nimcache/8_2/docutils_highlite.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/docutils_highlite.c -o nimcache/8_2/docutils_highlite.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_json.c -o nimcache/8_2/pure_json.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_json.c -o nimcache/8_2/pure_json.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_lexbase.c -o nimcache/8_2/pure_lexbase.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_lexbase.c -o nimcache/8_2/pure_lexbase.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_unicode.c -o nimcache/8_2/pure_unicode.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_unicode.c -o nimcache/8_2/pure_unicode.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_algorithm.c -o nimcache/8_2/pure_algorithm.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_algorithm.c -o nimcache/8_2/pure_algorithm.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/collections_sequtils.c -o nimcache/8_2/collections_sequtils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/collections_sequtils.c -o nimcache/8_2/collections_sequtils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_aliases.c -o nimcache/8_2/compiler_aliases.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_aliases.c -o nimcache/8_2/compiler_aliases.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_patterns.c -o nimcache/8_2/compiler_patterns.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_patterns.c -o nimcache/8_2/compiler_patterns.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_cgen.c -o nimcache/8_2/compiler_cgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_cgen.c -o nimcache/8_2/compiler_cgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_ccgutils.c -o nimcache/8_2/compiler_ccgutils.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_ccgutils.c -o nimcache/8_2/compiler_ccgutils.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_cgendata.c -o nimcache/8_2/compiler_cgendata.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_cgendata.c -o nimcache/8_2/compiler_cgendata.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_ccgmerge.c -o nimcache/8_2/compiler_ccgmerge.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_ccgmerge.c -o nimcache/8_2/compiler_ccgmerge.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_jsgen.c -o nimcache/8_2/compiler_jsgen.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_jsgen.c -o nimcache/8_2/compiler_jsgen.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_passaux.c -o nimcache/8_2/compiler_passaux.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_passaux.c -o nimcache/8_2/compiler_passaux.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_depends.c -o nimcache/8_2/compiler_depends.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_depends.c -o nimcache/8_2/compiler_depends.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_docgen2.c -o nimcache/8_2/compiler_docgen2.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_docgen2.c -o nimcache/8_2/compiler_docgen2.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_service.c -o nimcache/8_2/compiler_service.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_service.c -o nimcache/8_2/compiler_service.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_parseopt.c -o nimcache/8_2/pure_parseopt.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/pure_parseopt.c -o nimcache/8_2/pure_parseopt.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_modules.c -o nimcache/8_2/compiler_modules.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_modules.c -o nimcache/8_2/compiler_modules.o
    echo "$CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_pretty.c -o nimcache/8_2/compiler_pretty.o"
    $CC $COMP_FLAGS -Inimcache -c nimcache/8_2/compiler_pretty.c -o nimcache/8_2/compiler_pretty.o
    echo "$LINKER -o $binDir/nimrod  \
nimcache/8_2/compiler_nimrod.o \
nimcache/8_2/Nimrod_system.o \
nimcache/8_2/compiler_testability.o \
nimcache/8_2/compiler_commands.o \
nimcache/8_2/pure_os.o \
nimcache/8_2/pure_strutils.o \
nimcache/8_2/pure_parseutils.o \
nimcache/8_2/pure_times.o \
nimcache/8_2/posix_posix.o \
nimcache/8_2/compiler_msgs.o \
nimcache/8_2/compiler_options.o \
nimcache/8_2/compiler_lists.o \
nimcache/8_2/pure_strtabs.o \
nimcache/8_2/pure_hashes.o \
nimcache/8_2/collections_tables.o \
nimcache/8_2/pure_math.o \
nimcache/8_2/compiler_ropes.o \
nimcache/8_2/compiler_platform.o \
nimcache/8_2/compiler_crc.o \
nimcache/8_2/pure_sockets.o \
nimcache/8_2/core_unsigned.o \
nimcache/8_2/compiler_nversion.o \
nimcache/8_2/compiler_condsyms.o \
nimcache/8_2/compiler_idents.o \
nimcache/8_2/compiler_extccomp.o \
nimcache/8_2/pure_osproc.o \
nimcache/8_2/pure_streams.o \
nimcache/8_2/compiler_wordrecg.o \
nimcache/8_2/compiler_babelcmd.o \
nimcache/8_2/compiler_lexer.o \
nimcache/8_2/compiler_nimlexbase.o \
nimcache/8_2/compiler_llstream.o \
nimcache/8_2/compiler_nimconf.o \
nimcache/8_2/compiler_main.o \
nimcache/8_2/compiler_ast.o \
nimcache/8_2/collections_intsets.o \
nimcache/8_2/compiler_idgen.o \
nimcache/8_2/compiler_astalgo.o \
nimcache/8_2/compiler_rodutils.o \
nimcache/8_2/compiler_syntaxes.o \
nimcache/8_2/compiler_parser.o \
nimcache/8_2/compiler_pbraces.o \
nimcache/8_2/compiler_filters.o \
nimcache/8_2/compiler_renderer.o \
nimcache/8_2/compiler_filter_tmpl.o \
nimcache/8_2/compiler_rodread.o \
nimcache/8_2/compiler_types.o \
nimcache/8_2/compiler_trees.o \
nimcache/8_2/pure_memfiles.o \
nimcache/8_2/compiler_rodwrite.o \
nimcache/8_2/compiler_passes.o \
nimcache/8_2/compiler_magicsys.o \
nimcache/8_2/compiler_nimsets.o \
nimcache/8_2/compiler_bitsets.o \
nimcache/8_2/compiler_semthreads.o \
nimcache/8_2/compiler_importer.o \
nimcache/8_2/compiler_lookups.o \
nimcache/8_2/compiler_semdata.o \
nimcache/8_2/compiler_treetab.o \
nimcache/8_2/compiler_evals.o \
nimcache/8_2/compiler_semfold.o \
nimcache/8_2/compiler_saturate.o \
nimcache/8_2/compiler_transf.o \
nimcache/8_2/compiler_cgmeth.o \
nimcache/8_2/compiler_sempass2.o \
nimcache/8_2/compiler_guards.o \
nimcache/8_2/compiler_lambdalifting.o \
nimcache/8_2/compiler_evaltempl.o \
nimcache/8_2/compiler_sem.o \
nimcache/8_2/compiler_procfind.o \
nimcache/8_2/compiler_pragmas.o \
nimcache/8_2/compiler_semtypinst.o \
nimcache/8_2/compiler_sigmatch.o \
nimcache/8_2/compiler_parampatterns.o \
nimcache/8_2/compiler_docgen.o \
nimcache/8_2/docutils_rstast.o \
nimcache/8_2/docutils_rst.o \
nimcache/8_2/docutils_rstgen.o \
nimcache/8_2/docutils_highlite.o \
nimcache/8_2/pure_json.o \
nimcache/8_2/pure_lexbase.o \
nimcache/8_2/pure_unicode.o \
nimcache/8_2/pure_algorithm.o \
nimcache/8_2/collections_sequtils.o \
nimcache/8_2/compiler_aliases.o \
nimcache/8_2/compiler_patterns.o \
nimcache/8_2/compiler_cgen.o \
nimcache/8_2/compiler_ccgutils.o \
nimcache/8_2/compiler_cgendata.o \
nimcache/8_2/compiler_ccgmerge.o \
nimcache/8_2/compiler_jsgen.o \
nimcache/8_2/compiler_passaux.o \
nimcache/8_2/compiler_depends.o \
nimcache/8_2/compiler_docgen2.o \
nimcache/8_2/compiler_service.o \
nimcache/8_2/pure_parseopt.o \
nimcache/8_2/compiler_modules.o \
nimcache/8_2/compiler_pretty.o $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  \
nimcache/8_2/compiler_nimrod.o \
nimcache/8_2/Nimrod_system.o \
nimcache/8_2/compiler_testability.o \
nimcache/8_2/compiler_commands.o \
nimcache/8_2/pure_os.o \
nimcache/8_2/pure_strutils.o \
nimcache/8_2/pure_parseutils.o \
nimcache/8_2/pure_times.o \
nimcache/8_2/posix_posix.o \
nimcache/8_2/compiler_msgs.o \
nimcache/8_2/compiler_options.o \
nimcache/8_2/compiler_lists.o \
nimcache/8_2/pure_strtabs.o \
nimcache/8_2/pure_hashes.o \
nimcache/8_2/collections_tables.o \
nimcache/8_2/pure_math.o \
nimcache/8_2/compiler_ropes.o \
nimcache/8_2/compiler_platform.o \
nimcache/8_2/compiler_crc.o \
nimcache/8_2/pure_sockets.o \
nimcache/8_2/core_unsigned.o \
nimcache/8_2/compiler_nversion.o \
nimcache/8_2/compiler_condsyms.o \
nimcache/8_2/compiler_idents.o \
nimcache/8_2/compiler_extccomp.o \
nimcache/8_2/pure_osproc.o \
nimcache/8_2/pure_streams.o \
nimcache/8_2/compiler_wordrecg.o \
nimcache/8_2/compiler_babelcmd.o \
nimcache/8_2/compiler_lexer.o \
nimcache/8_2/compiler_nimlexbase.o \
nimcache/8_2/compiler_llstream.o \
nimcache/8_2/compiler_nimconf.o \
nimcache/8_2/compiler_main.o \
nimcache/8_2/compiler_ast.o \
nimcache/8_2/collections_intsets.o \
nimcache/8_2/compiler_idgen.o \
nimcache/8_2/compiler_astalgo.o \
nimcache/8_2/compiler_rodutils.o \
nimcache/8_2/compiler_syntaxes.o \
nimcache/8_2/compiler_parser.o \
nimcache/8_2/compiler_pbraces.o \
nimcache/8_2/compiler_filters.o \
nimcache/8_2/compiler_renderer.o \
nimcache/8_2/compiler_filter_tmpl.o \
nimcache/8_2/compiler_rodread.o \
nimcache/8_2/compiler_types.o \
nimcache/8_2/compiler_trees.o \
nimcache/8_2/pure_memfiles.o \
nimcache/8_2/compiler_rodwrite.o \
nimcache/8_2/compiler_passes.o \
nimcache/8_2/compiler_magicsys.o \
nimcache/8_2/compiler_nimsets.o \
nimcache/8_2/compiler_bitsets.o \
nimcache/8_2/compiler_semthreads.o \
nimcache/8_2/compiler_importer.o \
nimcache/8_2/compiler_lookups.o \
nimcache/8_2/compiler_semdata.o \
nimcache/8_2/compiler_treetab.o \
nimcache/8_2/compiler_evals.o \
nimcache/8_2/compiler_semfold.o \
nimcache/8_2/compiler_saturate.o \
nimcache/8_2/compiler_transf.o \
nimcache/8_2/compiler_cgmeth.o \
nimcache/8_2/compiler_sempass2.o \
nimcache/8_2/compiler_guards.o \
nimcache/8_2/compiler_lambdalifting.o \
nimcache/8_2/compiler_evaltempl.o \
nimcache/8_2/compiler_sem.o \
nimcache/8_2/compiler_procfind.o \
nimcache/8_2/compiler_pragmas.o \
nimcache/8_2/compiler_semtypinst.o \
nimcache/8_2/compiler_sigmatch.o \
nimcache/8_2/compiler_parampatterns.o \
nimcache/8_2/compiler_docgen.o \
nimcache/8_2/docutils_rstast.o \
nimcache/8_2/docutils_rst.o \
nimcache/8_2/docutils_rstgen.o \
nimcache/8_2/docutils_highlite.o \
nimcache/8_2/pure_json.o \
nimcache/8_2/pure_lexbase.o \
nimcache/8_2/pure_unicode.o \
nimcache/8_2/pure_algorithm.o \
nimcache/8_2/collections_sequtils.o \
nimcache/8_2/compiler_aliases.o \
nimcache/8_2/compiler_patterns.o \
nimcache/8_2/compiler_cgen.o \
nimcache/8_2/compiler_ccgutils.o \
nimcache/8_2/compiler_cgendata.o \
nimcache/8_2/compiler_ccgmerge.o \
nimcache/8_2/compiler_jsgen.o \
nimcache/8_2/compiler_passaux.o \
nimcache/8_2/compiler_depends.o \
nimcache/8_2/compiler_docgen2.o \
nimcache/8_2/compiler_service.o \
nimcache/8_2/pure_parseopt.o \
nimcache/8_2/compiler_modules.o \
nimcache/8_2/compiler_pretty.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$LINKER -o $binDir/nimrod  $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/nimrod  $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  $LINK_FLAGS
    ;;
  sparc)
    echo "$LINKER -o $binDir/nimrod  $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/nimrod  $LINK_FLAGS"
    $LINKER -o $binDir/nimrod  $LINK_FLAGS
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


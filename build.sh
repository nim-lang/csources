#! /bin/sh
# Generated from niminst
# Template is in tools/niminst/buildsh.tmpl
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
      echo 2>&1 "Error: Unknown option: $1" >&2
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
PS4=""
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
  *dragonfly* )
    myos="freebsd"
    LINK_FLAGS="$LINK_FLAGS -lm"
    ;;
  *freebsd* )
    myos="freebsd"
    CC="clang"
    LINKER="clang"
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
    echo 2>&1 "Error: unknown operating system: $uos"
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
  *power*|*ppc* ) 
    mycpu="powerpc" ;;
  *mips* ) 
    mycpu="mips" ;;
  *arm*|*armv6l* )
    mycpu="arm" ;;
  *) 
    echo 2>&1 "Error: unknown processor: $ucpu"
    exit 1
    ;;
esac

# call the compiler:

case $myos in
windows) 
  case $mycpu in
  i386)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_nim.c -o c_code/1_1/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_system.c -o c_code/1_1/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_testability.c -o c_code/1_1/compiler_testability.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_commands.c -o c_code/1_1/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_os.c -o c_code/1_1/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strutils.c -o c_code/1_1/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parseutils.c -o c_code/1_1/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_times.c -o c_code/1_1/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_winlean.c -o c_code/1_1/stdlib_winlean.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_msgs.c -o c_code/1_1/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_options.c -o c_code/1_1/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_lists.c -o c_code/1_1/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strtabs.c -o c_code/1_1/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_hashes.c -o c_code/1_1/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_etcpriv.c -o c_code/1_1/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_osproc.c -o c_code/1_1/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_streams.c -o c_code/1_1/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cpuinfo.c -o c_code/1_1/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sets.c -o c_code/1_1/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_math.c -o c_code/1_1/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_tables.c -o c_code/1_1/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_ropes.c -o c_code/1_1/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_platform.c -o c_code/1_1/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_terminal.c -o c_code/1_1/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_macros.c -o c_code/1_1/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_nversion.c -o c_code/1_1/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_condsyms.c -o c_code/1_1/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_idents.c -o c_code/1_1/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_extccomp.c -o c_code/1_1/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_securehash.c -o c_code/1_1/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_unsigned.c -o c_code/1_1/stdlib_unsigned.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_wordrecg.c -o c_code/1_1/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_nimblecmd.c -o c_code/1_1/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parseopt.c -o c_code/1_1/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_lexer.c -o c_code/1_1/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_nimlexbase.c -o c_code/1_1/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_llstream.c -o c_code/1_1/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_nimconf.c -o c_code/1_1/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_main.c -o c_code/1_1/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_ast.c -o c_code/1_1/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_intsets.c -o c_code/1_1/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_idgen.c -o c_code/1_1/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_astalgo.c -o c_code/1_1/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_rodutils.c -o c_code/1_1/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_syntaxes.c -o c_code/1_1/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_parser.c -o c_code/1_1/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_pbraces.c -o c_code/1_1/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_filters.c -o c_code/1_1/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_renderer.c -o c_code/1_1/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_filter_tmpl.c -o c_code/1_1/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_rodread.c -o c_code/1_1/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_types.c -o c_code/1_1/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_trees.c -o c_code/1_1/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_memfiles.c -o c_code/1_1/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_rodwrite.c -o c_code/1_1/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_passes.c -o c_code/1_1/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_magicsys.c -o c_code/1_1/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_nimsets.c -o c_code/1_1/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_bitsets.c -o c_code/1_1/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_importer.c -o c_code/1_1/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_lookups.c -o c_code/1_1/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_semdata.c -o c_code/1_1/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_treetab.c -o c_code/1_1/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_vmdef.c -o c_code/1_1/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_prettybase.c -o c_code/1_1/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_lexbase.c -o c_code/1_1/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_sem.c -o c_code/1_1/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_semfold.c -o c_code/1_1/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_saturate.c -o c_code/1_1/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_procfind.c -o c_code/1_1/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_pragmas.c -o c_code/1_1/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_semtypinst.c -o c_code/1_1/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_sigmatch.c -o c_code/1_1/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_parampatterns.c -o c_code/1_1/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_pretty.c -o c_code/1_1/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_docgen.c -o c_code/1_1/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/docutils_rstast.c -o c_code/1_1/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_json.c -o c_code/1_1/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_unicode.c -o c_code/1_1/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/docutils_rst.c -o c_code/1_1/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/docutils_rstgen.c -o c_code/1_1/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/docutils_highlite.c -o c_code/1_1/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sequtils.c -o c_code/1_1/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_algorithm.c -o c_code/1_1/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_sempass2.c -o c_code/1_1/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_guards.c -o c_code/1_1/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_writetracking.c -o c_code/1_1/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_xmltree.c -o c_code/1_1/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cgi.c -o c_code/1_1/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cookies.c -o c_code/1_1/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_typesrenderer.c -o c_code/1_1/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_transf.c -o c_code/1_1/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_cgmeth.c -o c_code/1_1/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_lambdalifting.c -o c_code/1_1/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_lowerings.c -o c_code/1_1/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_vm.c -o c_code/1_1/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_vmgen.c -o c_code/1_1/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_vmdeps.c -o c_code/1_1/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_vmmarshal.c -o c_code/1_1/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_evaltempl.c -o c_code/1_1/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_aliases.c -o c_code/1_1/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_patterns.c -o c_code/1_1/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_semmacrosanity.c -o c_code/1_1/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_semparallel.c -o c_code/1_1/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_pluginsupport.c -o c_code/1_1/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_active.c -o c_code/1_1/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_locals.c -o c_code/1_1/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_itersgen.c -o c_code/1_1/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_cgen.c -o c_code/1_1/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_ccgutils.c -o c_code/1_1/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_cgendata.c -o c_code/1_1/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_ccgmerge.c -o c_code/1_1/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_jsgen.c -o c_code/1_1/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_passaux.c -o c_code/1_1/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_depends.c -o c_code/1_1/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_docgen2.c -o c_code/1_1/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_service.c -o c_code/1_1/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_net.c -o c_code/1_1/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_nativesockets.c -o c_code/1_1/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_modules.c -o c_code/1_1/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_nodejs.c -o c_code/1_1/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_scriptconfig.c -o c_code/1_1/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/1_1/compiler_nim.o \
c_code/1_1/stdlib_system.o \
c_code/1_1/compiler_testability.o \
c_code/1_1/compiler_commands.o \
c_code/1_1/stdlib_os.o \
c_code/1_1/stdlib_strutils.o \
c_code/1_1/stdlib_parseutils.o \
c_code/1_1/stdlib_times.o \
c_code/1_1/stdlib_winlean.o \
c_code/1_1/compiler_msgs.o \
c_code/1_1/compiler_options.o \
c_code/1_1/compiler_lists.o \
c_code/1_1/stdlib_strtabs.o \
c_code/1_1/stdlib_hashes.o \
c_code/1_1/stdlib_etcpriv.o \
c_code/1_1/stdlib_osproc.o \
c_code/1_1/stdlib_streams.o \
c_code/1_1/stdlib_cpuinfo.o \
c_code/1_1/stdlib_sets.o \
c_code/1_1/stdlib_math.o \
c_code/1_1/stdlib_tables.o \
c_code/1_1/compiler_ropes.o \
c_code/1_1/compiler_platform.o \
c_code/1_1/stdlib_terminal.o \
c_code/1_1/stdlib_macros.o \
c_code/1_1/compiler_nversion.o \
c_code/1_1/compiler_condsyms.o \
c_code/1_1/compiler_idents.o \
c_code/1_1/compiler_extccomp.o \
c_code/1_1/stdlib_securehash.o \
c_code/1_1/stdlib_unsigned.o \
c_code/1_1/compiler_wordrecg.o \
c_code/1_1/compiler_nimblecmd.o \
c_code/1_1/stdlib_parseopt.o \
c_code/1_1/compiler_lexer.o \
c_code/1_1/compiler_nimlexbase.o \
c_code/1_1/compiler_llstream.o \
c_code/1_1/compiler_nimconf.o \
c_code/1_1/compiler_main.o \
c_code/1_1/compiler_ast.o \
c_code/1_1/stdlib_intsets.o \
c_code/1_1/compiler_idgen.o \
c_code/1_1/compiler_astalgo.o \
c_code/1_1/compiler_rodutils.o \
c_code/1_1/compiler_syntaxes.o \
c_code/1_1/compiler_parser.o \
c_code/1_1/compiler_pbraces.o \
c_code/1_1/compiler_filters.o \
c_code/1_1/compiler_renderer.o \
c_code/1_1/compiler_filter_tmpl.o \
c_code/1_1/compiler_rodread.o \
c_code/1_1/compiler_types.o \
c_code/1_1/compiler_trees.o \
c_code/1_1/stdlib_memfiles.o \
c_code/1_1/compiler_rodwrite.o \
c_code/1_1/compiler_passes.o \
c_code/1_1/compiler_magicsys.o \
c_code/1_1/compiler_nimsets.o \
c_code/1_1/compiler_bitsets.o \
c_code/1_1/compiler_importer.o \
c_code/1_1/compiler_lookups.o \
c_code/1_1/compiler_semdata.o \
c_code/1_1/compiler_treetab.o \
c_code/1_1/compiler_vmdef.o \
c_code/1_1/compiler_prettybase.o \
c_code/1_1/stdlib_lexbase.o \
c_code/1_1/compiler_sem.o \
c_code/1_1/compiler_semfold.o \
c_code/1_1/compiler_saturate.o \
c_code/1_1/compiler_procfind.o \
c_code/1_1/compiler_pragmas.o \
c_code/1_1/compiler_semtypinst.o \
c_code/1_1/compiler_sigmatch.o \
c_code/1_1/compiler_parampatterns.o \
c_code/1_1/compiler_pretty.o \
c_code/1_1/compiler_docgen.o \
c_code/1_1/docutils_rstast.o \
c_code/1_1/stdlib_json.o \
c_code/1_1/stdlib_unicode.o \
c_code/1_1/docutils_rst.o \
c_code/1_1/docutils_rstgen.o \
c_code/1_1/docutils_highlite.o \
c_code/1_1/stdlib_sequtils.o \
c_code/1_1/stdlib_algorithm.o \
c_code/1_1/compiler_sempass2.o \
c_code/1_1/compiler_guards.o \
c_code/1_1/compiler_writetracking.o \
c_code/1_1/stdlib_xmltree.o \
c_code/1_1/stdlib_cgi.o \
c_code/1_1/stdlib_cookies.o \
c_code/1_1/compiler_typesrenderer.o \
c_code/1_1/compiler_transf.o \
c_code/1_1/compiler_cgmeth.o \
c_code/1_1/compiler_lambdalifting.o \
c_code/1_1/compiler_lowerings.o \
c_code/1_1/compiler_vm.o \
c_code/1_1/compiler_vmgen.o \
c_code/1_1/compiler_vmdeps.o \
c_code/1_1/compiler_vmmarshal.o \
c_code/1_1/compiler_evaltempl.o \
c_code/1_1/compiler_aliases.o \
c_code/1_1/compiler_patterns.o \
c_code/1_1/compiler_semmacrosanity.o \
c_code/1_1/compiler_semparallel.o \
c_code/1_1/compiler_pluginsupport.o \
c_code/1_1/compiler_active.o \
c_code/1_1/compiler_locals.o \
c_code/1_1/compiler_itersgen.o \
c_code/1_1/compiler_cgen.o \
c_code/1_1/compiler_ccgutils.o \
c_code/1_1/compiler_cgendata.o \
c_code/1_1/compiler_ccgmerge.o \
c_code/1_1/compiler_jsgen.o \
c_code/1_1/compiler_passaux.o \
c_code/1_1/compiler_depends.o \
c_code/1_1/compiler_docgen2.o \
c_code/1_1/compiler_service.o \
c_code/1_1/stdlib_net.o \
c_code/1_1/stdlib_nativesockets.o \
c_code/1_1/compiler_modules.o \
c_code/1_1/compiler_nodejs.o \
c_code/1_1/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  amd64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_nim.c -o c_code/1_2/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_system.c -o c_code/1_2/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_testability.c -o c_code/1_2/compiler_testability.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_commands.c -o c_code/1_2/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_os.c -o c_code/1_2/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strutils.c -o c_code/1_2/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parseutils.c -o c_code/1_2/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_times.c -o c_code/1_2/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_winlean.c -o c_code/1_2/stdlib_winlean.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_msgs.c -o c_code/1_2/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_options.c -o c_code/1_2/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_lists.c -o c_code/1_2/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strtabs.c -o c_code/1_2/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_hashes.c -o c_code/1_2/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_etcpriv.c -o c_code/1_2/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_osproc.c -o c_code/1_2/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_streams.c -o c_code/1_2/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cpuinfo.c -o c_code/1_2/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sets.c -o c_code/1_2/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_math.c -o c_code/1_2/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_tables.c -o c_code/1_2/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_ropes.c -o c_code/1_2/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_platform.c -o c_code/1_2/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_terminal.c -o c_code/1_2/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_macros.c -o c_code/1_2/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_nversion.c -o c_code/1_2/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_condsyms.c -o c_code/1_2/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_idents.c -o c_code/1_2/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_extccomp.c -o c_code/1_2/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_securehash.c -o c_code/1_2/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_unsigned.c -o c_code/1_2/stdlib_unsigned.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_wordrecg.c -o c_code/1_2/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_nimblecmd.c -o c_code/1_2/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parseopt.c -o c_code/1_2/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_lexer.c -o c_code/1_2/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_nimlexbase.c -o c_code/1_2/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_llstream.c -o c_code/1_2/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_nimconf.c -o c_code/1_2/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_main.c -o c_code/1_2/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_ast.c -o c_code/1_2/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_intsets.c -o c_code/1_2/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_idgen.c -o c_code/1_2/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_astalgo.c -o c_code/1_2/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_rodutils.c -o c_code/1_2/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_syntaxes.c -o c_code/1_2/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_parser.c -o c_code/1_2/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_pbraces.c -o c_code/1_2/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_filters.c -o c_code/1_2/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_renderer.c -o c_code/1_2/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_filter_tmpl.c -o c_code/1_2/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_rodread.c -o c_code/1_2/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_types.c -o c_code/1_2/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_trees.c -o c_code/1_2/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_memfiles.c -o c_code/1_2/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_rodwrite.c -o c_code/1_2/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_passes.c -o c_code/1_2/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_magicsys.c -o c_code/1_2/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_nimsets.c -o c_code/1_2/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_bitsets.c -o c_code/1_2/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_importer.c -o c_code/1_2/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_lookups.c -o c_code/1_2/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_semdata.c -o c_code/1_2/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_treetab.c -o c_code/1_2/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_vmdef.c -o c_code/1_2/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_prettybase.c -o c_code/1_2/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_lexbase.c -o c_code/1_2/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_sem.c -o c_code/1_2/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_semfold.c -o c_code/1_2/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_saturate.c -o c_code/1_2/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_procfind.c -o c_code/1_2/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_pragmas.c -o c_code/1_2/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_semtypinst.c -o c_code/1_2/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_sigmatch.c -o c_code/1_2/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_parampatterns.c -o c_code/1_2/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_pretty.c -o c_code/1_2/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_docgen.c -o c_code/1_2/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/docutils_rstast.c -o c_code/1_2/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_json.c -o c_code/1_2/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_unicode.c -o c_code/1_2/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/docutils_rst.c -o c_code/1_2/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/docutils_rstgen.c -o c_code/1_2/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/docutils_highlite.c -o c_code/1_2/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sequtils.c -o c_code/1_2/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_algorithm.c -o c_code/1_2/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_sempass2.c -o c_code/1_2/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_guards.c -o c_code/1_2/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_writetracking.c -o c_code/1_2/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_xmltree.c -o c_code/1_2/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cgi.c -o c_code/1_2/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cookies.c -o c_code/1_2/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_typesrenderer.c -o c_code/1_2/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_transf.c -o c_code/1_2/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_cgmeth.c -o c_code/1_2/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_lambdalifting.c -o c_code/1_2/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_lowerings.c -o c_code/1_2/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_vm.c -o c_code/1_2/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_vmgen.c -o c_code/1_2/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_vmdeps.c -o c_code/1_2/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_vmmarshal.c -o c_code/1_2/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_evaltempl.c -o c_code/1_2/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_aliases.c -o c_code/1_2/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_patterns.c -o c_code/1_2/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_semmacrosanity.c -o c_code/1_2/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_semparallel.c -o c_code/1_2/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_pluginsupport.c -o c_code/1_2/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_active.c -o c_code/1_2/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_locals.c -o c_code/1_2/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_itersgen.c -o c_code/1_2/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_cgen.c -o c_code/1_2/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_ccgutils.c -o c_code/1_2/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_cgendata.c -o c_code/1_2/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_ccgmerge.c -o c_code/1_2/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_jsgen.c -o c_code/1_2/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_passaux.c -o c_code/1_2/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_depends.c -o c_code/1_2/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_docgen2.c -o c_code/1_2/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_service.c -o c_code/1_2/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_net.c -o c_code/1_2/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_nativesockets.c -o c_code/1_2/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_modules.c -o c_code/1_2/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_nodejs.c -o c_code/1_2/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_scriptconfig.c -o c_code/1_2/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/1_2/compiler_nim.o \
c_code/1_2/stdlib_system.o \
c_code/1_2/compiler_testability.o \
c_code/1_2/compiler_commands.o \
c_code/1_2/stdlib_os.o \
c_code/1_2/stdlib_strutils.o \
c_code/1_2/stdlib_parseutils.o \
c_code/1_2/stdlib_times.o \
c_code/1_2/stdlib_winlean.o \
c_code/1_2/compiler_msgs.o \
c_code/1_2/compiler_options.o \
c_code/1_2/compiler_lists.o \
c_code/1_2/stdlib_strtabs.o \
c_code/1_2/stdlib_hashes.o \
c_code/1_2/stdlib_etcpriv.o \
c_code/1_2/stdlib_osproc.o \
c_code/1_2/stdlib_streams.o \
c_code/1_2/stdlib_cpuinfo.o \
c_code/1_2/stdlib_sets.o \
c_code/1_2/stdlib_math.o \
c_code/1_2/stdlib_tables.o \
c_code/1_2/compiler_ropes.o \
c_code/1_2/compiler_platform.o \
c_code/1_2/stdlib_terminal.o \
c_code/1_2/stdlib_macros.o \
c_code/1_2/compiler_nversion.o \
c_code/1_2/compiler_condsyms.o \
c_code/1_2/compiler_idents.o \
c_code/1_2/compiler_extccomp.o \
c_code/1_2/stdlib_securehash.o \
c_code/1_2/stdlib_unsigned.o \
c_code/1_2/compiler_wordrecg.o \
c_code/1_2/compiler_nimblecmd.o \
c_code/1_2/stdlib_parseopt.o \
c_code/1_2/compiler_lexer.o \
c_code/1_2/compiler_nimlexbase.o \
c_code/1_2/compiler_llstream.o \
c_code/1_2/compiler_nimconf.o \
c_code/1_2/compiler_main.o \
c_code/1_2/compiler_ast.o \
c_code/1_2/stdlib_intsets.o \
c_code/1_2/compiler_idgen.o \
c_code/1_2/compiler_astalgo.o \
c_code/1_2/compiler_rodutils.o \
c_code/1_2/compiler_syntaxes.o \
c_code/1_2/compiler_parser.o \
c_code/1_2/compiler_pbraces.o \
c_code/1_2/compiler_filters.o \
c_code/1_2/compiler_renderer.o \
c_code/1_2/compiler_filter_tmpl.o \
c_code/1_2/compiler_rodread.o \
c_code/1_2/compiler_types.o \
c_code/1_2/compiler_trees.o \
c_code/1_2/stdlib_memfiles.o \
c_code/1_2/compiler_rodwrite.o \
c_code/1_2/compiler_passes.o \
c_code/1_2/compiler_magicsys.o \
c_code/1_2/compiler_nimsets.o \
c_code/1_2/compiler_bitsets.o \
c_code/1_2/compiler_importer.o \
c_code/1_2/compiler_lookups.o \
c_code/1_2/compiler_semdata.o \
c_code/1_2/compiler_treetab.o \
c_code/1_2/compiler_vmdef.o \
c_code/1_2/compiler_prettybase.o \
c_code/1_2/stdlib_lexbase.o \
c_code/1_2/compiler_sem.o \
c_code/1_2/compiler_semfold.o \
c_code/1_2/compiler_saturate.o \
c_code/1_2/compiler_procfind.o \
c_code/1_2/compiler_pragmas.o \
c_code/1_2/compiler_semtypinst.o \
c_code/1_2/compiler_sigmatch.o \
c_code/1_2/compiler_parampatterns.o \
c_code/1_2/compiler_pretty.o \
c_code/1_2/compiler_docgen.o \
c_code/1_2/docutils_rstast.o \
c_code/1_2/stdlib_json.o \
c_code/1_2/stdlib_unicode.o \
c_code/1_2/docutils_rst.o \
c_code/1_2/docutils_rstgen.o \
c_code/1_2/docutils_highlite.o \
c_code/1_2/stdlib_sequtils.o \
c_code/1_2/stdlib_algorithm.o \
c_code/1_2/compiler_sempass2.o \
c_code/1_2/compiler_guards.o \
c_code/1_2/compiler_writetracking.o \
c_code/1_2/stdlib_xmltree.o \
c_code/1_2/stdlib_cgi.o \
c_code/1_2/stdlib_cookies.o \
c_code/1_2/compiler_typesrenderer.o \
c_code/1_2/compiler_transf.o \
c_code/1_2/compiler_cgmeth.o \
c_code/1_2/compiler_lambdalifting.o \
c_code/1_2/compiler_lowerings.o \
c_code/1_2/compiler_vm.o \
c_code/1_2/compiler_vmgen.o \
c_code/1_2/compiler_vmdeps.o \
c_code/1_2/compiler_vmmarshal.o \
c_code/1_2/compiler_evaltempl.o \
c_code/1_2/compiler_aliases.o \
c_code/1_2/compiler_patterns.o \
c_code/1_2/compiler_semmacrosanity.o \
c_code/1_2/compiler_semparallel.o \
c_code/1_2/compiler_pluginsupport.o \
c_code/1_2/compiler_active.o \
c_code/1_2/compiler_locals.o \
c_code/1_2/compiler_itersgen.o \
c_code/1_2/compiler_cgen.o \
c_code/1_2/compiler_ccgutils.o \
c_code/1_2/compiler_cgendata.o \
c_code/1_2/compiler_ccgmerge.o \
c_code/1_2/compiler_jsgen.o \
c_code/1_2/compiler_passaux.o \
c_code/1_2/compiler_depends.o \
c_code/1_2/compiler_docgen2.o \
c_code/1_2/compiler_service.o \
c_code/1_2/stdlib_net.o \
c_code/1_2/stdlib_nativesockets.o \
c_code/1_2/compiler_modules.o \
c_code/1_2/compiler_nodejs.o \
c_code/1_2/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  powerpc64)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  arm)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  mips)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  mipsel)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc64el)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  arm64)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  *)
    echo 2>&1 "Error: no C code generated for: [$myos: $mycpu]"
    exit 1
    ;;
  esac
  ;;
linux) 
  case $mycpu in
  i386)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nim.c -o c_code/2_1/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_system.c -o c_code/2_1/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_testability.c -o c_code/2_1/compiler_testability.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_commands.c -o c_code/2_1/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_os.c -o c_code/2_1/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.c -o c_code/2_1/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.c -o c_code/2_1/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_times.c -o c_code/2_1/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_posix.c -o c_code/2_1/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_msgs.c -o c_code/2_1/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_options.c -o c_code/2_1/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lists.c -o c_code/2_1/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strtabs.c -o c_code/2_1/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_hashes.c -o c_code/2_1/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_etcpriv.c -o c_code/2_1/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_osproc.c -o c_code/2_1/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_streams.c -o c_code/2_1/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cpuinfo.c -o c_code/2_1/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_linux.c -o c_code/2_1/stdlib_linux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sets.c -o c_code/2_1/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.c -o c_code/2_1/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_tables.c -o c_code/2_1/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ropes.c -o c_code/2_1/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_platform.c -o c_code/2_1/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.c -o c_code/2_1/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_macros.c -o c_code/2_1/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_termios.c -o c_code/2_1/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nversion.c -o c_code/2_1/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_condsyms.c -o c_code/2_1/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idents.c -o c_code/2_1/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_extccomp.c -o c_code/2_1/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_securehash.c -o c_code/2_1/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unsigned.c -o c_code/2_1/stdlib_unsigned.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_wordrecg.c -o c_code/2_1/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimblecmd.c -o c_code/2_1/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.c -o c_code/2_1/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lexer.c -o c_code/2_1/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimlexbase.c -o c_code/2_1/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_llstream.c -o c_code/2_1/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimconf.c -o c_code/2_1/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_main.c -o c_code/2_1/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ast.c -o c_code/2_1/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_intsets.c -o c_code/2_1/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idgen.c -o c_code/2_1/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_astalgo.c -o c_code/2_1/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodutils.c -o c_code/2_1/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_syntaxes.c -o c_code/2_1/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parser.c -o c_code/2_1/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pbraces.c -o c_code/2_1/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filters.c -o c_code/2_1/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_renderer.c -o c_code/2_1/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filter_tmpl.c -o c_code/2_1/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodread.c -o c_code/2_1/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_types.c -o c_code/2_1/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_trees.c -o c_code/2_1/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_memfiles.c -o c_code/2_1/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodwrite.c -o c_code/2_1/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passes.c -o c_code/2_1/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_magicsys.c -o c_code/2_1/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimsets.c -o c_code/2_1/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_bitsets.c -o c_code/2_1/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_importer.c -o c_code/2_1/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lookups.c -o c_code/2_1/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semdata.c -o c_code/2_1/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_treetab.c -o c_code/2_1/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmdef.c -o c_code/2_1/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_prettybase.c -o c_code/2_1/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.c -o c_code/2_1/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sem.c -o c_code/2_1/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semfold.c -o c_code/2_1/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_saturate.c -o c_code/2_1/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_procfind.c -o c_code/2_1/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pragmas.c -o c_code/2_1/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semtypinst.c -o c_code/2_1/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sigmatch.c -o c_code/2_1/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parampatterns.c -o c_code/2_1/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pretty.c -o c_code/2_1/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_docgen.c -o c_code/2_1/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rstast.c -o c_code/2_1/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_json.c -o c_code/2_1/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.c -o c_code/2_1/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rst.c -o c_code/2_1/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rstgen.c -o c_code/2_1/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_highlite.c -o c_code/2_1/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sequtils.c -o c_code/2_1/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_algorithm.c -o c_code/2_1/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sempass2.c -o c_code/2_1/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_guards.c -o c_code/2_1/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_writetracking.c -o c_code/2_1/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_xmltree.c -o c_code/2_1/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cgi.c -o c_code/2_1/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cookies.c -o c_code/2_1/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_typesrenderer.c -o c_code/2_1/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_transf.c -o c_code/2_1/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgmeth.c -o c_code/2_1/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lambdalifting.c -o c_code/2_1/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lowerings.c -o c_code/2_1/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vm.c -o c_code/2_1/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmgen.c -o c_code/2_1/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmdeps.c -o c_code/2_1/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmmarshal.c -o c_code/2_1/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_evaltempl.c -o c_code/2_1/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_aliases.c -o c_code/2_1/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_patterns.c -o c_code/2_1/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semmacrosanity.c -o c_code/2_1/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semparallel.c -o c_code/2_1/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pluginsupport.c -o c_code/2_1/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_active.c -o c_code/2_1/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_locals.c -o c_code/2_1/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_itersgen.c -o c_code/2_1/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgen.c -o c_code/2_1/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgutils.c -o c_code/2_1/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgendata.c -o c_code/2_1/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgmerge.c -o c_code/2_1/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_jsgen.c -o c_code/2_1/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passaux.c -o c_code/2_1/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_depends.c -o c_code/2_1/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_docgen2.c -o c_code/2_1/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_service.c -o c_code/2_1/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_net.c -o c_code/2_1/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_nativesockets.c -o c_code/2_1/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_modules.c -o c_code/2_1/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nodejs.c -o c_code/2_1/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_scriptconfig.c -o c_code/2_1/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/2_1/compiler_nim.o \
c_code/2_1/stdlib_system.o \
c_code/2_1/compiler_testability.o \
c_code/2_1/compiler_commands.o \
c_code/2_1/stdlib_os.o \
c_code/2_1/stdlib_strutils.o \
c_code/2_1/stdlib_parseutils.o \
c_code/2_1/stdlib_times.o \
c_code/2_1/stdlib_posix.o \
c_code/2_1/compiler_msgs.o \
c_code/2_1/compiler_options.o \
c_code/2_1/compiler_lists.o \
c_code/2_1/stdlib_strtabs.o \
c_code/2_1/stdlib_hashes.o \
c_code/2_1/stdlib_etcpriv.o \
c_code/2_1/stdlib_osproc.o \
c_code/2_1/stdlib_streams.o \
c_code/2_1/stdlib_cpuinfo.o \
c_code/2_1/stdlib_linux.o \
c_code/2_1/stdlib_sets.o \
c_code/2_1/stdlib_math.o \
c_code/2_1/stdlib_tables.o \
c_code/2_1/compiler_ropes.o \
c_code/2_1/compiler_platform.o \
c_code/2_1/stdlib_terminal.o \
c_code/2_1/stdlib_macros.o \
c_code/2_1/stdlib_termios.o \
c_code/2_1/compiler_nversion.o \
c_code/2_1/compiler_condsyms.o \
c_code/2_1/compiler_idents.o \
c_code/2_1/compiler_extccomp.o \
c_code/2_1/stdlib_securehash.o \
c_code/2_1/stdlib_unsigned.o \
c_code/2_1/compiler_wordrecg.o \
c_code/2_1/compiler_nimblecmd.o \
c_code/2_1/stdlib_parseopt.o \
c_code/2_1/compiler_lexer.o \
c_code/2_1/compiler_nimlexbase.o \
c_code/2_1/compiler_llstream.o \
c_code/2_1/compiler_nimconf.o \
c_code/2_1/compiler_main.o \
c_code/2_1/compiler_ast.o \
c_code/2_1/stdlib_intsets.o \
c_code/2_1/compiler_idgen.o \
c_code/2_1/compiler_astalgo.o \
c_code/2_1/compiler_rodutils.o \
c_code/2_1/compiler_syntaxes.o \
c_code/2_1/compiler_parser.o \
c_code/2_1/compiler_pbraces.o \
c_code/2_1/compiler_filters.o \
c_code/2_1/compiler_renderer.o \
c_code/2_1/compiler_filter_tmpl.o \
c_code/2_1/compiler_rodread.o \
c_code/2_1/compiler_types.o \
c_code/2_1/compiler_trees.o \
c_code/2_1/stdlib_memfiles.o \
c_code/2_1/compiler_rodwrite.o \
c_code/2_1/compiler_passes.o \
c_code/2_1/compiler_magicsys.o \
c_code/2_1/compiler_nimsets.o \
c_code/2_1/compiler_bitsets.o \
c_code/2_1/compiler_importer.o \
c_code/2_1/compiler_lookups.o \
c_code/2_1/compiler_semdata.o \
c_code/2_1/compiler_treetab.o \
c_code/2_1/compiler_vmdef.o \
c_code/2_1/compiler_prettybase.o \
c_code/2_1/stdlib_lexbase.o \
c_code/2_1/compiler_sem.o \
c_code/2_1/compiler_semfold.o \
c_code/2_1/compiler_saturate.o \
c_code/2_1/compiler_procfind.o \
c_code/2_1/compiler_pragmas.o \
c_code/2_1/compiler_semtypinst.o \
c_code/2_1/compiler_sigmatch.o \
c_code/2_1/compiler_parampatterns.o \
c_code/2_1/compiler_pretty.o \
c_code/2_1/compiler_docgen.o \
c_code/2_1/docutils_rstast.o \
c_code/2_1/stdlib_json.o \
c_code/2_1/stdlib_unicode.o \
c_code/2_1/docutils_rst.o \
c_code/2_1/docutils_rstgen.o \
c_code/2_1/docutils_highlite.o \
c_code/2_1/stdlib_sequtils.o \
c_code/2_1/stdlib_algorithm.o \
c_code/2_1/compiler_sempass2.o \
c_code/2_1/compiler_guards.o \
c_code/2_1/compiler_writetracking.o \
c_code/2_1/stdlib_xmltree.o \
c_code/2_1/stdlib_cgi.o \
c_code/2_1/stdlib_cookies.o \
c_code/2_1/compiler_typesrenderer.o \
c_code/2_1/compiler_transf.o \
c_code/2_1/compiler_cgmeth.o \
c_code/2_1/compiler_lambdalifting.o \
c_code/2_1/compiler_lowerings.o \
c_code/2_1/compiler_vm.o \
c_code/2_1/compiler_vmgen.o \
c_code/2_1/compiler_vmdeps.o \
c_code/2_1/compiler_vmmarshal.o \
c_code/2_1/compiler_evaltempl.o \
c_code/2_1/compiler_aliases.o \
c_code/2_1/compiler_patterns.o \
c_code/2_1/compiler_semmacrosanity.o \
c_code/2_1/compiler_semparallel.o \
c_code/2_1/compiler_pluginsupport.o \
c_code/2_1/compiler_active.o \
c_code/2_1/compiler_locals.o \
c_code/2_1/compiler_itersgen.o \
c_code/2_1/compiler_cgen.o \
c_code/2_1/compiler_ccgutils.o \
c_code/2_1/compiler_cgendata.o \
c_code/2_1/compiler_ccgmerge.o \
c_code/2_1/compiler_jsgen.o \
c_code/2_1/compiler_passaux.o \
c_code/2_1/compiler_depends.o \
c_code/2_1/compiler_docgen2.o \
c_code/2_1/compiler_service.o \
c_code/2_1/stdlib_net.o \
c_code/2_1/stdlib_nativesockets.o \
c_code/2_1/compiler_modules.o \
c_code/2_1/compiler_nodejs.o \
c_code/2_1/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  amd64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nim.c -o c_code/2_2/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_system.c -o c_code/2_2/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_testability.c -o c_code/2_2/compiler_testability.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_commands.c -o c_code/2_2/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_os.c -o c_code/2_2/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.c -o c_code/2_2/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.c -o c_code/2_2/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_times.c -o c_code/2_2/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_posix.c -o c_code/2_2/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_msgs.c -o c_code/2_2/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_options.c -o c_code/2_2/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lists.c -o c_code/2_2/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strtabs.c -o c_code/2_2/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_hashes.c -o c_code/2_2/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_etcpriv.c -o c_code/2_2/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_osproc.c -o c_code/2_2/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_streams.c -o c_code/2_2/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cpuinfo.c -o c_code/2_2/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_linux.c -o c_code/2_2/stdlib_linux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sets.c -o c_code/2_2/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.c -o c_code/2_2/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_tables.c -o c_code/2_2/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ropes.c -o c_code/2_2/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_platform.c -o c_code/2_2/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.c -o c_code/2_2/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_macros.c -o c_code/2_2/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_termios.c -o c_code/2_2/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nversion.c -o c_code/2_2/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_condsyms.c -o c_code/2_2/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_idents.c -o c_code/2_2/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_extccomp.c -o c_code/2_2/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_securehash.c -o c_code/2_2/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unsigned.c -o c_code/2_2/stdlib_unsigned.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_wordrecg.c -o c_code/2_2/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimblecmd.c -o c_code/2_2/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.c -o c_code/2_2/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lexer.c -o c_code/2_2/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimlexbase.c -o c_code/2_2/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_llstream.c -o c_code/2_2/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimconf.c -o c_code/2_2/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_main.c -o c_code/2_2/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ast.c -o c_code/2_2/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_intsets.c -o c_code/2_2/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_idgen.c -o c_code/2_2/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_astalgo.c -o c_code/2_2/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodutils.c -o c_code/2_2/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_syntaxes.c -o c_code/2_2/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_parser.c -o c_code/2_2/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pbraces.c -o c_code/2_2/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_filters.c -o c_code/2_2/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_renderer.c -o c_code/2_2/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_filter_tmpl.c -o c_code/2_2/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodread.c -o c_code/2_2/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_types.c -o c_code/2_2/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_trees.c -o c_code/2_2/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_memfiles.c -o c_code/2_2/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodwrite.c -o c_code/2_2/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_passes.c -o c_code/2_2/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_magicsys.c -o c_code/2_2/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimsets.c -o c_code/2_2/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_bitsets.c -o c_code/2_2/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_importer.c -o c_code/2_2/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lookups.c -o c_code/2_2/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semdata.c -o c_code/2_2/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_treetab.c -o c_code/2_2/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmdef.c -o c_code/2_2/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_prettybase.c -o c_code/2_2/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.c -o c_code/2_2/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sem.c -o c_code/2_2/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semfold.c -o c_code/2_2/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_saturate.c -o c_code/2_2/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_procfind.c -o c_code/2_2/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pragmas.c -o c_code/2_2/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semtypinst.c -o c_code/2_2/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sigmatch.c -o c_code/2_2/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_parampatterns.c -o c_code/2_2/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pretty.c -o c_code/2_2/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_docgen.c -o c_code/2_2/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rstast.c -o c_code/2_2/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_json.c -o c_code/2_2/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.c -o c_code/2_2/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rst.c -o c_code/2_2/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rstgen.c -o c_code/2_2/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_highlite.c -o c_code/2_2/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sequtils.c -o c_code/2_2/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_algorithm.c -o c_code/2_2/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sempass2.c -o c_code/2_2/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_guards.c -o c_code/2_2/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_writetracking.c -o c_code/2_2/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_xmltree.c -o c_code/2_2/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cgi.c -o c_code/2_2/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cookies.c -o c_code/2_2/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_typesrenderer.c -o c_code/2_2/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_transf.c -o c_code/2_2/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgmeth.c -o c_code/2_2/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lambdalifting.c -o c_code/2_2/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lowerings.c -o c_code/2_2/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vm.c -o c_code/2_2/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmgen.c -o c_code/2_2/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmdeps.c -o c_code/2_2/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmmarshal.c -o c_code/2_2/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_evaltempl.c -o c_code/2_2/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_aliases.c -o c_code/2_2/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_patterns.c -o c_code/2_2/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semmacrosanity.c -o c_code/2_2/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semparallel.c -o c_code/2_2/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pluginsupport.c -o c_code/2_2/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_active.c -o c_code/2_2/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_locals.c -o c_code/2_2/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_itersgen.c -o c_code/2_2/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgen.c -o c_code/2_2/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ccgutils.c -o c_code/2_2/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgendata.c -o c_code/2_2/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ccgmerge.c -o c_code/2_2/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_jsgen.c -o c_code/2_2/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_passaux.c -o c_code/2_2/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_depends.c -o c_code/2_2/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_docgen2.c -o c_code/2_2/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_service.c -o c_code/2_2/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_net.c -o c_code/2_2/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_nativesockets.c -o c_code/2_2/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_modules.c -o c_code/2_2/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nodejs.c -o c_code/2_2/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_scriptconfig.c -o c_code/2_2/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/2_2/compiler_nim.o \
c_code/2_2/stdlib_system.o \
c_code/2_2/compiler_testability.o \
c_code/2_2/compiler_commands.o \
c_code/2_2/stdlib_os.o \
c_code/2_2/stdlib_strutils.o \
c_code/2_2/stdlib_parseutils.o \
c_code/2_2/stdlib_times.o \
c_code/2_2/stdlib_posix.o \
c_code/2_2/compiler_msgs.o \
c_code/2_2/compiler_options.o \
c_code/2_2/compiler_lists.o \
c_code/2_2/stdlib_strtabs.o \
c_code/2_2/stdlib_hashes.o \
c_code/2_2/stdlib_etcpriv.o \
c_code/2_2/stdlib_osproc.o \
c_code/2_2/stdlib_streams.o \
c_code/2_2/stdlib_cpuinfo.o \
c_code/2_2/stdlib_linux.o \
c_code/2_2/stdlib_sets.o \
c_code/2_2/stdlib_math.o \
c_code/2_2/stdlib_tables.o \
c_code/2_2/compiler_ropes.o \
c_code/2_2/compiler_platform.o \
c_code/2_2/stdlib_terminal.o \
c_code/2_2/stdlib_macros.o \
c_code/2_2/stdlib_termios.o \
c_code/2_2/compiler_nversion.o \
c_code/2_2/compiler_condsyms.o \
c_code/2_2/compiler_idents.o \
c_code/2_2/compiler_extccomp.o \
c_code/2_2/stdlib_securehash.o \
c_code/2_2/stdlib_unsigned.o \
c_code/2_2/compiler_wordrecg.o \
c_code/2_2/compiler_nimblecmd.o \
c_code/2_2/stdlib_parseopt.o \
c_code/2_2/compiler_lexer.o \
c_code/2_2/compiler_nimlexbase.o \
c_code/2_2/compiler_llstream.o \
c_code/2_2/compiler_nimconf.o \
c_code/2_2/compiler_main.o \
c_code/2_2/compiler_ast.o \
c_code/2_2/stdlib_intsets.o \
c_code/2_2/compiler_idgen.o \
c_code/2_2/compiler_astalgo.o \
c_code/2_2/compiler_rodutils.o \
c_code/2_2/compiler_syntaxes.o \
c_code/2_2/compiler_parser.o \
c_code/2_2/compiler_pbraces.o \
c_code/2_2/compiler_filters.o \
c_code/2_2/compiler_renderer.o \
c_code/2_2/compiler_filter_tmpl.o \
c_code/2_2/compiler_rodread.o \
c_code/2_2/compiler_types.o \
c_code/2_2/compiler_trees.o \
c_code/2_2/stdlib_memfiles.o \
c_code/2_2/compiler_rodwrite.o \
c_code/2_2/compiler_passes.o \
c_code/2_2/compiler_magicsys.o \
c_code/2_2/compiler_nimsets.o \
c_code/2_2/compiler_bitsets.o \
c_code/2_2/compiler_importer.o \
c_code/2_2/compiler_lookups.o \
c_code/2_2/compiler_semdata.o \
c_code/2_2/compiler_treetab.o \
c_code/2_2/compiler_vmdef.o \
c_code/2_2/compiler_prettybase.o \
c_code/2_2/stdlib_lexbase.o \
c_code/2_2/compiler_sem.o \
c_code/2_2/compiler_semfold.o \
c_code/2_2/compiler_saturate.o \
c_code/2_2/compiler_procfind.o \
c_code/2_2/compiler_pragmas.o \
c_code/2_2/compiler_semtypinst.o \
c_code/2_2/compiler_sigmatch.o \
c_code/2_2/compiler_parampatterns.o \
c_code/2_2/compiler_pretty.o \
c_code/2_2/compiler_docgen.o \
c_code/2_2/docutils_rstast.o \
c_code/2_2/stdlib_json.o \
c_code/2_2/stdlib_unicode.o \
c_code/2_2/docutils_rst.o \
c_code/2_2/docutils_rstgen.o \
c_code/2_2/docutils_highlite.o \
c_code/2_2/stdlib_sequtils.o \
c_code/2_2/stdlib_algorithm.o \
c_code/2_2/compiler_sempass2.o \
c_code/2_2/compiler_guards.o \
c_code/2_2/compiler_writetracking.o \
c_code/2_2/stdlib_xmltree.o \
c_code/2_2/stdlib_cgi.o \
c_code/2_2/stdlib_cookies.o \
c_code/2_2/compiler_typesrenderer.o \
c_code/2_2/compiler_transf.o \
c_code/2_2/compiler_cgmeth.o \
c_code/2_2/compiler_lambdalifting.o \
c_code/2_2/compiler_lowerings.o \
c_code/2_2/compiler_vm.o \
c_code/2_2/compiler_vmgen.o \
c_code/2_2/compiler_vmdeps.o \
c_code/2_2/compiler_vmmarshal.o \
c_code/2_2/compiler_evaltempl.o \
c_code/2_2/compiler_aliases.o \
c_code/2_2/compiler_patterns.o \
c_code/2_2/compiler_semmacrosanity.o \
c_code/2_2/compiler_semparallel.o \
c_code/2_2/compiler_pluginsupport.o \
c_code/2_2/compiler_active.o \
c_code/2_2/compiler_locals.o \
c_code/2_2/compiler_itersgen.o \
c_code/2_2/compiler_cgen.o \
c_code/2_2/compiler_ccgutils.o \
c_code/2_2/compiler_cgendata.o \
c_code/2_2/compiler_ccgmerge.o \
c_code/2_2/compiler_jsgen.o \
c_code/2_2/compiler_passaux.o \
c_code/2_2/compiler_depends.o \
c_code/2_2/compiler_docgen2.o \
c_code/2_2/compiler_service.o \
c_code/2_2/stdlib_net.o \
c_code/2_2/stdlib_nativesockets.o \
c_code/2_2/compiler_modules.o \
c_code/2_2/compiler_nodejs.o \
c_code/2_2/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  powerpc64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_nim.c -o c_code/2_3/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_system.c -o c_code/2_3/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_testability.c -o c_code/2_3/compiler_testability.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_commands.c -o c_code/2_3/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_os.c -o c_code/2_3/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_strutils.c -o c_code/2_3/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_parseutils.c -o c_code/2_3/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_times.c -o c_code/2_3/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_posix.c -o c_code/2_3/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_msgs.c -o c_code/2_3/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_options.c -o c_code/2_3/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_lists.c -o c_code/2_3/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_strtabs.c -o c_code/2_3/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_hashes.c -o c_code/2_3/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_etcpriv.c -o c_code/2_3/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_osproc.c -o c_code/2_3/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_streams.c -o c_code/2_3/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_cpuinfo.c -o c_code/2_3/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_linux.c -o c_code/2_3/stdlib_linux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_sets.c -o c_code/2_3/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_math.c -o c_code/2_3/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_tables.c -o c_code/2_3/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_ropes.c -o c_code/2_3/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_platform.c -o c_code/2_3/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_terminal.c -o c_code/2_3/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_macros.c -o c_code/2_3/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_termios.c -o c_code/2_3/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_nversion.c -o c_code/2_3/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_condsyms.c -o c_code/2_3/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_idents.c -o c_code/2_3/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_extccomp.c -o c_code/2_3/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_securehash.c -o c_code/2_3/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_unsigned.c -o c_code/2_3/stdlib_unsigned.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_wordrecg.c -o c_code/2_3/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_nimblecmd.c -o c_code/2_3/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_parseopt.c -o c_code/2_3/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_lexer.c -o c_code/2_3/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_nimlexbase.c -o c_code/2_3/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_llstream.c -o c_code/2_3/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_nimconf.c -o c_code/2_3/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_main.c -o c_code/2_3/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_ast.c -o c_code/2_3/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_intsets.c -o c_code/2_3/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_idgen.c -o c_code/2_3/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_astalgo.c -o c_code/2_3/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_rodutils.c -o c_code/2_3/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_syntaxes.c -o c_code/2_3/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_parser.c -o c_code/2_3/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_pbraces.c -o c_code/2_3/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_filters.c -o c_code/2_3/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_renderer.c -o c_code/2_3/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_filter_tmpl.c -o c_code/2_3/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_rodread.c -o c_code/2_3/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_types.c -o c_code/2_3/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_trees.c -o c_code/2_3/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_memfiles.c -o c_code/2_3/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_rodwrite.c -o c_code/2_3/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_passes.c -o c_code/2_3/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_magicsys.c -o c_code/2_3/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_nimsets.c -o c_code/2_3/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_bitsets.c -o c_code/2_3/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_importer.c -o c_code/2_3/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_lookups.c -o c_code/2_3/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_semdata.c -o c_code/2_3/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_treetab.c -o c_code/2_3/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_vmdef.c -o c_code/2_3/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_prettybase.c -o c_code/2_3/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_lexbase.c -o c_code/2_3/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_sem.c -o c_code/2_3/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_semfold.c -o c_code/2_3/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_saturate.c -o c_code/2_3/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_procfind.c -o c_code/2_3/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_pragmas.c -o c_code/2_3/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_semtypinst.c -o c_code/2_3/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_sigmatch.c -o c_code/2_3/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_parampatterns.c -o c_code/2_3/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_pretty.c -o c_code/2_3/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_docgen.c -o c_code/2_3/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/docutils_rstast.c -o c_code/2_3/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_json.c -o c_code/2_3/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_unicode.c -o c_code/2_3/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/docutils_rst.c -o c_code/2_3/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/docutils_rstgen.c -o c_code/2_3/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/docutils_highlite.c -o c_code/2_3/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_sequtils.c -o c_code/2_3/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_algorithm.c -o c_code/2_3/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_sempass2.c -o c_code/2_3/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_guards.c -o c_code/2_3/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_writetracking.c -o c_code/2_3/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_xmltree.c -o c_code/2_3/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_cgi.c -o c_code/2_3/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_cookies.c -o c_code/2_3/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_typesrenderer.c -o c_code/2_3/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_transf.c -o c_code/2_3/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_cgmeth.c -o c_code/2_3/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_lambdalifting.c -o c_code/2_3/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_lowerings.c -o c_code/2_3/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_vm.c -o c_code/2_3/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_vmgen.c -o c_code/2_3/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_vmdeps.c -o c_code/2_3/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_vmmarshal.c -o c_code/2_3/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_evaltempl.c -o c_code/2_3/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_aliases.c -o c_code/2_3/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_patterns.c -o c_code/2_3/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_semmacrosanity.c -o c_code/2_3/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_semparallel.c -o c_code/2_3/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_pluginsupport.c -o c_code/2_3/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_active.c -o c_code/2_3/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_locals.c -o c_code/2_3/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_itersgen.c -o c_code/2_3/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_cgen.c -o c_code/2_3/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_ccgutils.c -o c_code/2_3/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_cgendata.c -o c_code/2_3/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_ccgmerge.c -o c_code/2_3/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_jsgen.c -o c_code/2_3/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_passaux.c -o c_code/2_3/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_depends.c -o c_code/2_3/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_docgen2.c -o c_code/2_3/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_service.c -o c_code/2_3/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_net.c -o c_code/2_3/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_nativesockets.c -o c_code/2_3/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_modules.c -o c_code/2_3/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_nodejs.c -o c_code/2_3/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_scriptconfig.c -o c_code/2_3/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/2_3/compiler_nim.o \
c_code/2_3/stdlib_system.o \
c_code/2_3/compiler_testability.o \
c_code/2_3/compiler_commands.o \
c_code/2_3/stdlib_os.o \
c_code/2_3/stdlib_strutils.o \
c_code/2_3/stdlib_parseutils.o \
c_code/2_3/stdlib_times.o \
c_code/2_3/stdlib_posix.o \
c_code/2_3/compiler_msgs.o \
c_code/2_3/compiler_options.o \
c_code/2_3/compiler_lists.o \
c_code/2_3/stdlib_strtabs.o \
c_code/2_3/stdlib_hashes.o \
c_code/2_3/stdlib_etcpriv.o \
c_code/2_3/stdlib_osproc.o \
c_code/2_3/stdlib_streams.o \
c_code/2_3/stdlib_cpuinfo.o \
c_code/2_3/stdlib_linux.o \
c_code/2_3/stdlib_sets.o \
c_code/2_3/stdlib_math.o \
c_code/2_3/stdlib_tables.o \
c_code/2_3/compiler_ropes.o \
c_code/2_3/compiler_platform.o \
c_code/2_3/stdlib_terminal.o \
c_code/2_3/stdlib_macros.o \
c_code/2_3/stdlib_termios.o \
c_code/2_3/compiler_nversion.o \
c_code/2_3/compiler_condsyms.o \
c_code/2_3/compiler_idents.o \
c_code/2_3/compiler_extccomp.o \
c_code/2_3/stdlib_securehash.o \
c_code/2_3/stdlib_unsigned.o \
c_code/2_3/compiler_wordrecg.o \
c_code/2_3/compiler_nimblecmd.o \
c_code/2_3/stdlib_parseopt.o \
c_code/2_3/compiler_lexer.o \
c_code/2_3/compiler_nimlexbase.o \
c_code/2_3/compiler_llstream.o \
c_code/2_3/compiler_nimconf.o \
c_code/2_3/compiler_main.o \
c_code/2_3/compiler_ast.o \
c_code/2_3/stdlib_intsets.o \
c_code/2_3/compiler_idgen.o \
c_code/2_3/compiler_astalgo.o \
c_code/2_3/compiler_rodutils.o \
c_code/2_3/compiler_syntaxes.o \
c_code/2_3/compiler_parser.o \
c_code/2_3/compiler_pbraces.o \
c_code/2_3/compiler_filters.o \
c_code/2_3/compiler_renderer.o \
c_code/2_3/compiler_filter_tmpl.o \
c_code/2_3/compiler_rodread.o \
c_code/2_3/compiler_types.o \
c_code/2_3/compiler_trees.o \
c_code/2_3/stdlib_memfiles.o \
c_code/2_3/compiler_rodwrite.o \
c_code/2_3/compiler_passes.o \
c_code/2_3/compiler_magicsys.o \
c_code/2_3/compiler_nimsets.o \
c_code/2_3/compiler_bitsets.o \
c_code/2_3/compiler_importer.o \
c_code/2_3/compiler_lookups.o \
c_code/2_3/compiler_semdata.o \
c_code/2_3/compiler_treetab.o \
c_code/2_3/compiler_vmdef.o \
c_code/2_3/compiler_prettybase.o \
c_code/2_3/stdlib_lexbase.o \
c_code/2_3/compiler_sem.o \
c_code/2_3/compiler_semfold.o \
c_code/2_3/compiler_saturate.o \
c_code/2_3/compiler_procfind.o \
c_code/2_3/compiler_pragmas.o \
c_code/2_3/compiler_semtypinst.o \
c_code/2_3/compiler_sigmatch.o \
c_code/2_3/compiler_parampatterns.o \
c_code/2_3/compiler_pretty.o \
c_code/2_3/compiler_docgen.o \
c_code/2_3/docutils_rstast.o \
c_code/2_3/stdlib_json.o \
c_code/2_3/stdlib_unicode.o \
c_code/2_3/docutils_rst.o \
c_code/2_3/docutils_rstgen.o \
c_code/2_3/docutils_highlite.o \
c_code/2_3/stdlib_sequtils.o \
c_code/2_3/stdlib_algorithm.o \
c_code/2_3/compiler_sempass2.o \
c_code/2_3/compiler_guards.o \
c_code/2_3/compiler_writetracking.o \
c_code/2_3/stdlib_xmltree.o \
c_code/2_3/stdlib_cgi.o \
c_code/2_3/stdlib_cookies.o \
c_code/2_3/compiler_typesrenderer.o \
c_code/2_3/compiler_transf.o \
c_code/2_3/compiler_cgmeth.o \
c_code/2_3/compiler_lambdalifting.o \
c_code/2_3/compiler_lowerings.o \
c_code/2_3/compiler_vm.o \
c_code/2_3/compiler_vmgen.o \
c_code/2_3/compiler_vmdeps.o \
c_code/2_3/compiler_vmmarshal.o \
c_code/2_3/compiler_evaltempl.o \
c_code/2_3/compiler_aliases.o \
c_code/2_3/compiler_patterns.o \
c_code/2_3/compiler_semmacrosanity.o \
c_code/2_3/compiler_semparallel.o \
c_code/2_3/compiler_pluginsupport.o \
c_code/2_3/compiler_active.o \
c_code/2_3/compiler_locals.o \
c_code/2_3/compiler_itersgen.o \
c_code/2_3/compiler_cgen.o \
c_code/2_3/compiler_ccgutils.o \
c_code/2_3/compiler_cgendata.o \
c_code/2_3/compiler_ccgmerge.o \
c_code/2_3/compiler_jsgen.o \
c_code/2_3/compiler_passaux.o \
c_code/2_3/compiler_depends.o \
c_code/2_3/compiler_docgen2.o \
c_code/2_3/compiler_service.o \
c_code/2_3/stdlib_net.o \
c_code/2_3/stdlib_nativesockets.o \
c_code/2_3/compiler_modules.o \
c_code/2_3/compiler_nodejs.o \
c_code/2_3/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  arm)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_nim.c -o c_code/2_4/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_system.c -o c_code/2_4/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_testability.c -o c_code/2_4/compiler_testability.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_commands.c -o c_code/2_4/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_os.c -o c_code/2_4/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_strutils.c -o c_code/2_4/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_parseutils.c -o c_code/2_4/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_times.c -o c_code/2_4/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_posix.c -o c_code/2_4/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_msgs.c -o c_code/2_4/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_options.c -o c_code/2_4/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_lists.c -o c_code/2_4/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_strtabs.c -o c_code/2_4/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_hashes.c -o c_code/2_4/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_etcpriv.c -o c_code/2_4/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_osproc.c -o c_code/2_4/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_streams.c -o c_code/2_4/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_cpuinfo.c -o c_code/2_4/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_linux.c -o c_code/2_4/stdlib_linux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_sets.c -o c_code/2_4/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_math.c -o c_code/2_4/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_tables.c -o c_code/2_4/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_ropes.c -o c_code/2_4/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_platform.c -o c_code/2_4/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_terminal.c -o c_code/2_4/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_macros.c -o c_code/2_4/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_termios.c -o c_code/2_4/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_nversion.c -o c_code/2_4/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_condsyms.c -o c_code/2_4/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_idents.c -o c_code/2_4/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_extccomp.c -o c_code/2_4/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_securehash.c -o c_code/2_4/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_unsigned.c -o c_code/2_4/stdlib_unsigned.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_wordrecg.c -o c_code/2_4/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_nimblecmd.c -o c_code/2_4/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_parseopt.c -o c_code/2_4/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_lexer.c -o c_code/2_4/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_nimlexbase.c -o c_code/2_4/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_llstream.c -o c_code/2_4/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_nimconf.c -o c_code/2_4/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_main.c -o c_code/2_4/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_ast.c -o c_code/2_4/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_intsets.c -o c_code/2_4/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_idgen.c -o c_code/2_4/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_astalgo.c -o c_code/2_4/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_rodutils.c -o c_code/2_4/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_syntaxes.c -o c_code/2_4/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_parser.c -o c_code/2_4/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_pbraces.c -o c_code/2_4/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_filters.c -o c_code/2_4/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_renderer.c -o c_code/2_4/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_filter_tmpl.c -o c_code/2_4/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_rodread.c -o c_code/2_4/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_types.c -o c_code/2_4/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_trees.c -o c_code/2_4/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_memfiles.c -o c_code/2_4/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_rodwrite.c -o c_code/2_4/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_passes.c -o c_code/2_4/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_magicsys.c -o c_code/2_4/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_nimsets.c -o c_code/2_4/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_bitsets.c -o c_code/2_4/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_importer.c -o c_code/2_4/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_lookups.c -o c_code/2_4/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_semdata.c -o c_code/2_4/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_treetab.c -o c_code/2_4/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_vmdef.c -o c_code/2_4/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_prettybase.c -o c_code/2_4/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_lexbase.c -o c_code/2_4/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_sem.c -o c_code/2_4/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_semfold.c -o c_code/2_4/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_saturate.c -o c_code/2_4/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_procfind.c -o c_code/2_4/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_pragmas.c -o c_code/2_4/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_semtypinst.c -o c_code/2_4/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_sigmatch.c -o c_code/2_4/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_parampatterns.c -o c_code/2_4/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_pretty.c -o c_code/2_4/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_docgen.c -o c_code/2_4/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/docutils_rstast.c -o c_code/2_4/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_json.c -o c_code/2_4/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_unicode.c -o c_code/2_4/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/docutils_rst.c -o c_code/2_4/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/docutils_rstgen.c -o c_code/2_4/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/docutils_highlite.c -o c_code/2_4/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_sequtils.c -o c_code/2_4/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_algorithm.c -o c_code/2_4/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_sempass2.c -o c_code/2_4/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_guards.c -o c_code/2_4/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_writetracking.c -o c_code/2_4/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_xmltree.c -o c_code/2_4/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_cgi.c -o c_code/2_4/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_cookies.c -o c_code/2_4/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_typesrenderer.c -o c_code/2_4/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_transf.c -o c_code/2_4/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_cgmeth.c -o c_code/2_4/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_lambdalifting.c -o c_code/2_4/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_lowerings.c -o c_code/2_4/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_vm.c -o c_code/2_4/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_vmgen.c -o c_code/2_4/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_vmdeps.c -o c_code/2_4/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_vmmarshal.c -o c_code/2_4/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_evaltempl.c -o c_code/2_4/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_aliases.c -o c_code/2_4/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_patterns.c -o c_code/2_4/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_semmacrosanity.c -o c_code/2_4/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_semparallel.c -o c_code/2_4/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_pluginsupport.c -o c_code/2_4/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_active.c -o c_code/2_4/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_locals.c -o c_code/2_4/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_itersgen.c -o c_code/2_4/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_cgen.c -o c_code/2_4/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_ccgutils.c -o c_code/2_4/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_cgendata.c -o c_code/2_4/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_ccgmerge.c -o c_code/2_4/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_jsgen.c -o c_code/2_4/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_passaux.c -o c_code/2_4/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_depends.c -o c_code/2_4/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_docgen2.c -o c_code/2_4/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_service.c -o c_code/2_4/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_net.c -o c_code/2_4/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_nativesockets.c -o c_code/2_4/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_modules.c -o c_code/2_4/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_nodejs.c -o c_code/2_4/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_scriptconfig.c -o c_code/2_4/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/2_4/compiler_nim.o \
c_code/2_4/stdlib_system.o \
c_code/2_4/compiler_testability.o \
c_code/2_4/compiler_commands.o \
c_code/2_4/stdlib_os.o \
c_code/2_4/stdlib_strutils.o \
c_code/2_4/stdlib_parseutils.o \
c_code/2_4/stdlib_times.o \
c_code/2_4/stdlib_posix.o \
c_code/2_4/compiler_msgs.o \
c_code/2_4/compiler_options.o \
c_code/2_4/compiler_lists.o \
c_code/2_4/stdlib_strtabs.o \
c_code/2_4/stdlib_hashes.o \
c_code/2_4/stdlib_etcpriv.o \
c_code/2_4/stdlib_osproc.o \
c_code/2_4/stdlib_streams.o \
c_code/2_4/stdlib_cpuinfo.o \
c_code/2_4/stdlib_linux.o \
c_code/2_4/stdlib_sets.o \
c_code/2_4/stdlib_math.o \
c_code/2_4/stdlib_tables.o \
c_code/2_4/compiler_ropes.o \
c_code/2_4/compiler_platform.o \
c_code/2_4/stdlib_terminal.o \
c_code/2_4/stdlib_macros.o \
c_code/2_4/stdlib_termios.o \
c_code/2_4/compiler_nversion.o \
c_code/2_4/compiler_condsyms.o \
c_code/2_4/compiler_idents.o \
c_code/2_4/compiler_extccomp.o \
c_code/2_4/stdlib_securehash.o \
c_code/2_4/stdlib_unsigned.o \
c_code/2_4/compiler_wordrecg.o \
c_code/2_4/compiler_nimblecmd.o \
c_code/2_4/stdlib_parseopt.o \
c_code/2_4/compiler_lexer.o \
c_code/2_4/compiler_nimlexbase.o \
c_code/2_4/compiler_llstream.o \
c_code/2_4/compiler_nimconf.o \
c_code/2_4/compiler_main.o \
c_code/2_4/compiler_ast.o \
c_code/2_4/stdlib_intsets.o \
c_code/2_4/compiler_idgen.o \
c_code/2_4/compiler_astalgo.o \
c_code/2_4/compiler_rodutils.o \
c_code/2_4/compiler_syntaxes.o \
c_code/2_4/compiler_parser.o \
c_code/2_4/compiler_pbraces.o \
c_code/2_4/compiler_filters.o \
c_code/2_4/compiler_renderer.o \
c_code/2_4/compiler_filter_tmpl.o \
c_code/2_4/compiler_rodread.o \
c_code/2_4/compiler_types.o \
c_code/2_4/compiler_trees.o \
c_code/2_4/stdlib_memfiles.o \
c_code/2_4/compiler_rodwrite.o \
c_code/2_4/compiler_passes.o \
c_code/2_4/compiler_magicsys.o \
c_code/2_4/compiler_nimsets.o \
c_code/2_4/compiler_bitsets.o \
c_code/2_4/compiler_importer.o \
c_code/2_4/compiler_lookups.o \
c_code/2_4/compiler_semdata.o \
c_code/2_4/compiler_treetab.o \
c_code/2_4/compiler_vmdef.o \
c_code/2_4/compiler_prettybase.o \
c_code/2_4/stdlib_lexbase.o \
c_code/2_4/compiler_sem.o \
c_code/2_4/compiler_semfold.o \
c_code/2_4/compiler_saturate.o \
c_code/2_4/compiler_procfind.o \
c_code/2_4/compiler_pragmas.o \
c_code/2_4/compiler_semtypinst.o \
c_code/2_4/compiler_sigmatch.o \
c_code/2_4/compiler_parampatterns.o \
c_code/2_4/compiler_pretty.o \
c_code/2_4/compiler_docgen.o \
c_code/2_4/docutils_rstast.o \
c_code/2_4/stdlib_json.o \
c_code/2_4/stdlib_unicode.o \
c_code/2_4/docutils_rst.o \
c_code/2_4/docutils_rstgen.o \
c_code/2_4/docutils_highlite.o \
c_code/2_4/stdlib_sequtils.o \
c_code/2_4/stdlib_algorithm.o \
c_code/2_4/compiler_sempass2.o \
c_code/2_4/compiler_guards.o \
c_code/2_4/compiler_writetracking.o \
c_code/2_4/stdlib_xmltree.o \
c_code/2_4/stdlib_cgi.o \
c_code/2_4/stdlib_cookies.o \
c_code/2_4/compiler_typesrenderer.o \
c_code/2_4/compiler_transf.o \
c_code/2_4/compiler_cgmeth.o \
c_code/2_4/compiler_lambdalifting.o \
c_code/2_4/compiler_lowerings.o \
c_code/2_4/compiler_vm.o \
c_code/2_4/compiler_vmgen.o \
c_code/2_4/compiler_vmdeps.o \
c_code/2_4/compiler_vmmarshal.o \
c_code/2_4/compiler_evaltempl.o \
c_code/2_4/compiler_aliases.o \
c_code/2_4/compiler_patterns.o \
c_code/2_4/compiler_semmacrosanity.o \
c_code/2_4/compiler_semparallel.o \
c_code/2_4/compiler_pluginsupport.o \
c_code/2_4/compiler_active.o \
c_code/2_4/compiler_locals.o \
c_code/2_4/compiler_itersgen.o \
c_code/2_4/compiler_cgen.o \
c_code/2_4/compiler_ccgutils.o \
c_code/2_4/compiler_cgendata.o \
c_code/2_4/compiler_ccgmerge.o \
c_code/2_4/compiler_jsgen.o \
c_code/2_4/compiler_passaux.o \
c_code/2_4/compiler_depends.o \
c_code/2_4/compiler_docgen2.o \
c_code/2_4/compiler_service.o \
c_code/2_4/stdlib_net.o \
c_code/2_4/stdlib_nativesockets.o \
c_code/2_4/compiler_modules.o \
c_code/2_4/compiler_nodejs.o \
c_code/2_4/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  sparc)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_nim.c -o c_code/2_5/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_system.c -o c_code/2_5/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_testability.c -o c_code/2_5/compiler_testability.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_commands.c -o c_code/2_5/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_os.c -o c_code/2_5/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_strutils.c -o c_code/2_5/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_parseutils.c -o c_code/2_5/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_times.c -o c_code/2_5/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_posix.c -o c_code/2_5/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_msgs.c -o c_code/2_5/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_options.c -o c_code/2_5/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_lists.c -o c_code/2_5/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_strtabs.c -o c_code/2_5/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_hashes.c -o c_code/2_5/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_etcpriv.c -o c_code/2_5/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_osproc.c -o c_code/2_5/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_streams.c -o c_code/2_5/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_cpuinfo.c -o c_code/2_5/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_linux.c -o c_code/2_5/stdlib_linux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_sets.c -o c_code/2_5/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_math.c -o c_code/2_5/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_tables.c -o c_code/2_5/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_ropes.c -o c_code/2_5/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_platform.c -o c_code/2_5/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_terminal.c -o c_code/2_5/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_macros.c -o c_code/2_5/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_termios.c -o c_code/2_5/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_nversion.c -o c_code/2_5/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_condsyms.c -o c_code/2_5/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_idents.c -o c_code/2_5/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_extccomp.c -o c_code/2_5/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_securehash.c -o c_code/2_5/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_unsigned.c -o c_code/2_5/stdlib_unsigned.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_wordrecg.c -o c_code/2_5/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_nimblecmd.c -o c_code/2_5/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_parseopt.c -o c_code/2_5/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_lexer.c -o c_code/2_5/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_nimlexbase.c -o c_code/2_5/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_llstream.c -o c_code/2_5/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_nimconf.c -o c_code/2_5/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_main.c -o c_code/2_5/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_ast.c -o c_code/2_5/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_intsets.c -o c_code/2_5/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_idgen.c -o c_code/2_5/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_astalgo.c -o c_code/2_5/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_rodutils.c -o c_code/2_5/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_syntaxes.c -o c_code/2_5/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_parser.c -o c_code/2_5/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_pbraces.c -o c_code/2_5/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_filters.c -o c_code/2_5/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_renderer.c -o c_code/2_5/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_filter_tmpl.c -o c_code/2_5/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_rodread.c -o c_code/2_5/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_types.c -o c_code/2_5/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_trees.c -o c_code/2_5/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_memfiles.c -o c_code/2_5/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_rodwrite.c -o c_code/2_5/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_passes.c -o c_code/2_5/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_magicsys.c -o c_code/2_5/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_nimsets.c -o c_code/2_5/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_bitsets.c -o c_code/2_5/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_importer.c -o c_code/2_5/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_lookups.c -o c_code/2_5/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_semdata.c -o c_code/2_5/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_treetab.c -o c_code/2_5/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_vmdef.c -o c_code/2_5/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_prettybase.c -o c_code/2_5/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_lexbase.c -o c_code/2_5/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_sem.c -o c_code/2_5/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_semfold.c -o c_code/2_5/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_saturate.c -o c_code/2_5/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_procfind.c -o c_code/2_5/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_pragmas.c -o c_code/2_5/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_semtypinst.c -o c_code/2_5/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_sigmatch.c -o c_code/2_5/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_parampatterns.c -o c_code/2_5/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_pretty.c -o c_code/2_5/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_docgen.c -o c_code/2_5/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/docutils_rstast.c -o c_code/2_5/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_json.c -o c_code/2_5/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_unicode.c -o c_code/2_5/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/docutils_rst.c -o c_code/2_5/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/docutils_rstgen.c -o c_code/2_5/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/docutils_highlite.c -o c_code/2_5/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_sequtils.c -o c_code/2_5/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_algorithm.c -o c_code/2_5/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_sempass2.c -o c_code/2_5/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_guards.c -o c_code/2_5/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_writetracking.c -o c_code/2_5/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_xmltree.c -o c_code/2_5/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_cgi.c -o c_code/2_5/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_cookies.c -o c_code/2_5/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_typesrenderer.c -o c_code/2_5/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_transf.c -o c_code/2_5/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_cgmeth.c -o c_code/2_5/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_lambdalifting.c -o c_code/2_5/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_lowerings.c -o c_code/2_5/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_vm.c -o c_code/2_5/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_vmgen.c -o c_code/2_5/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_vmdeps.c -o c_code/2_5/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_vmmarshal.c -o c_code/2_5/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_evaltempl.c -o c_code/2_5/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_aliases.c -o c_code/2_5/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_patterns.c -o c_code/2_5/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_semmacrosanity.c -o c_code/2_5/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_semparallel.c -o c_code/2_5/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_pluginsupport.c -o c_code/2_5/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_active.c -o c_code/2_5/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_locals.c -o c_code/2_5/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_itersgen.c -o c_code/2_5/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_cgen.c -o c_code/2_5/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_ccgutils.c -o c_code/2_5/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_cgendata.c -o c_code/2_5/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_ccgmerge.c -o c_code/2_5/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_jsgen.c -o c_code/2_5/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_passaux.c -o c_code/2_5/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_depends.c -o c_code/2_5/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_docgen2.c -o c_code/2_5/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_service.c -o c_code/2_5/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_net.c -o c_code/2_5/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_nativesockets.c -o c_code/2_5/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_modules.c -o c_code/2_5/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_nodejs.c -o c_code/2_5/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_scriptconfig.c -o c_code/2_5/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/2_5/compiler_nim.o \
c_code/2_5/stdlib_system.o \
c_code/2_5/compiler_testability.o \
c_code/2_5/compiler_commands.o \
c_code/2_5/stdlib_os.o \
c_code/2_5/stdlib_strutils.o \
c_code/2_5/stdlib_parseutils.o \
c_code/2_5/stdlib_times.o \
c_code/2_5/stdlib_posix.o \
c_code/2_5/compiler_msgs.o \
c_code/2_5/compiler_options.o \
c_code/2_5/compiler_lists.o \
c_code/2_5/stdlib_strtabs.o \
c_code/2_5/stdlib_hashes.o \
c_code/2_5/stdlib_etcpriv.o \
c_code/2_5/stdlib_osproc.o \
c_code/2_5/stdlib_streams.o \
c_code/2_5/stdlib_cpuinfo.o \
c_code/2_5/stdlib_linux.o \
c_code/2_5/stdlib_sets.o \
c_code/2_5/stdlib_math.o \
c_code/2_5/stdlib_tables.o \
c_code/2_5/compiler_ropes.o \
c_code/2_5/compiler_platform.o \
c_code/2_5/stdlib_terminal.o \
c_code/2_5/stdlib_macros.o \
c_code/2_5/stdlib_termios.o \
c_code/2_5/compiler_nversion.o \
c_code/2_5/compiler_condsyms.o \
c_code/2_5/compiler_idents.o \
c_code/2_5/compiler_extccomp.o \
c_code/2_5/stdlib_securehash.o \
c_code/2_5/stdlib_unsigned.o \
c_code/2_5/compiler_wordrecg.o \
c_code/2_5/compiler_nimblecmd.o \
c_code/2_5/stdlib_parseopt.o \
c_code/2_5/compiler_lexer.o \
c_code/2_5/compiler_nimlexbase.o \
c_code/2_5/compiler_llstream.o \
c_code/2_5/compiler_nimconf.o \
c_code/2_5/compiler_main.o \
c_code/2_5/compiler_ast.o \
c_code/2_5/stdlib_intsets.o \
c_code/2_5/compiler_idgen.o \
c_code/2_5/compiler_astalgo.o \
c_code/2_5/compiler_rodutils.o \
c_code/2_5/compiler_syntaxes.o \
c_code/2_5/compiler_parser.o \
c_code/2_5/compiler_pbraces.o \
c_code/2_5/compiler_filters.o \
c_code/2_5/compiler_renderer.o \
c_code/2_5/compiler_filter_tmpl.o \
c_code/2_5/compiler_rodread.o \
c_code/2_5/compiler_types.o \
c_code/2_5/compiler_trees.o \
c_code/2_5/stdlib_memfiles.o \
c_code/2_5/compiler_rodwrite.o \
c_code/2_5/compiler_passes.o \
c_code/2_5/compiler_magicsys.o \
c_code/2_5/compiler_nimsets.o \
c_code/2_5/compiler_bitsets.o \
c_code/2_5/compiler_importer.o \
c_code/2_5/compiler_lookups.o \
c_code/2_5/compiler_semdata.o \
c_code/2_5/compiler_treetab.o \
c_code/2_5/compiler_vmdef.o \
c_code/2_5/compiler_prettybase.o \
c_code/2_5/stdlib_lexbase.o \
c_code/2_5/compiler_sem.o \
c_code/2_5/compiler_semfold.o \
c_code/2_5/compiler_saturate.o \
c_code/2_5/compiler_procfind.o \
c_code/2_5/compiler_pragmas.o \
c_code/2_5/compiler_semtypinst.o \
c_code/2_5/compiler_sigmatch.o \
c_code/2_5/compiler_parampatterns.o \
c_code/2_5/compiler_pretty.o \
c_code/2_5/compiler_docgen.o \
c_code/2_5/docutils_rstast.o \
c_code/2_5/stdlib_json.o \
c_code/2_5/stdlib_unicode.o \
c_code/2_5/docutils_rst.o \
c_code/2_5/docutils_rstgen.o \
c_code/2_5/docutils_highlite.o \
c_code/2_5/stdlib_sequtils.o \
c_code/2_5/stdlib_algorithm.o \
c_code/2_5/compiler_sempass2.o \
c_code/2_5/compiler_guards.o \
c_code/2_5/compiler_writetracking.o \
c_code/2_5/stdlib_xmltree.o \
c_code/2_5/stdlib_cgi.o \
c_code/2_5/stdlib_cookies.o \
c_code/2_5/compiler_typesrenderer.o \
c_code/2_5/compiler_transf.o \
c_code/2_5/compiler_cgmeth.o \
c_code/2_5/compiler_lambdalifting.o \
c_code/2_5/compiler_lowerings.o \
c_code/2_5/compiler_vm.o \
c_code/2_5/compiler_vmgen.o \
c_code/2_5/compiler_vmdeps.o \
c_code/2_5/compiler_vmmarshal.o \
c_code/2_5/compiler_evaltempl.o \
c_code/2_5/compiler_aliases.o \
c_code/2_5/compiler_patterns.o \
c_code/2_5/compiler_semmacrosanity.o \
c_code/2_5/compiler_semparallel.o \
c_code/2_5/compiler_pluginsupport.o \
c_code/2_5/compiler_active.o \
c_code/2_5/compiler_locals.o \
c_code/2_5/compiler_itersgen.o \
c_code/2_5/compiler_cgen.o \
c_code/2_5/compiler_ccgutils.o \
c_code/2_5/compiler_cgendata.o \
c_code/2_5/compiler_ccgmerge.o \
c_code/2_5/compiler_jsgen.o \
c_code/2_5/compiler_passaux.o \
c_code/2_5/compiler_depends.o \
c_code/2_5/compiler_docgen2.o \
c_code/2_5/compiler_service.o \
c_code/2_5/stdlib_net.o \
c_code/2_5/stdlib_nativesockets.o \
c_code/2_5/compiler_modules.o \
c_code/2_5/compiler_nodejs.o \
c_code/2_5/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  mips)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_nim.c -o c_code/2_6/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_system.c -o c_code/2_6/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_testability.c -o c_code/2_6/compiler_testability.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_commands.c -o c_code/2_6/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_os.c -o c_code/2_6/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_strutils.c -o c_code/2_6/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_parseutils.c -o c_code/2_6/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_times.c -o c_code/2_6/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_posix.c -o c_code/2_6/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_msgs.c -o c_code/2_6/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_options.c -o c_code/2_6/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_lists.c -o c_code/2_6/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_strtabs.c -o c_code/2_6/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_hashes.c -o c_code/2_6/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_etcpriv.c -o c_code/2_6/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_osproc.c -o c_code/2_6/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_streams.c -o c_code/2_6/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_cpuinfo.c -o c_code/2_6/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_linux.c -o c_code/2_6/stdlib_linux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_sets.c -o c_code/2_6/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_math.c -o c_code/2_6/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_tables.c -o c_code/2_6/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_ropes.c -o c_code/2_6/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_platform.c -o c_code/2_6/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_terminal.c -o c_code/2_6/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_macros.c -o c_code/2_6/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_termios.c -o c_code/2_6/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_nversion.c -o c_code/2_6/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_condsyms.c -o c_code/2_6/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_idents.c -o c_code/2_6/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_extccomp.c -o c_code/2_6/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_securehash.c -o c_code/2_6/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_unsigned.c -o c_code/2_6/stdlib_unsigned.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_wordrecg.c -o c_code/2_6/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_nimblecmd.c -o c_code/2_6/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_parseopt.c -o c_code/2_6/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_lexer.c -o c_code/2_6/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_nimlexbase.c -o c_code/2_6/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_llstream.c -o c_code/2_6/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_nimconf.c -o c_code/2_6/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_main.c -o c_code/2_6/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_ast.c -o c_code/2_6/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_intsets.c -o c_code/2_6/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_idgen.c -o c_code/2_6/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_astalgo.c -o c_code/2_6/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_rodutils.c -o c_code/2_6/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_syntaxes.c -o c_code/2_6/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_parser.c -o c_code/2_6/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_pbraces.c -o c_code/2_6/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_filters.c -o c_code/2_6/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_renderer.c -o c_code/2_6/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_filter_tmpl.c -o c_code/2_6/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_rodread.c -o c_code/2_6/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_types.c -o c_code/2_6/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_trees.c -o c_code/2_6/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_memfiles.c -o c_code/2_6/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_rodwrite.c -o c_code/2_6/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_passes.c -o c_code/2_6/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_magicsys.c -o c_code/2_6/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_nimsets.c -o c_code/2_6/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_bitsets.c -o c_code/2_6/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_importer.c -o c_code/2_6/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_lookups.c -o c_code/2_6/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_semdata.c -o c_code/2_6/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_treetab.c -o c_code/2_6/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_vmdef.c -o c_code/2_6/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_prettybase.c -o c_code/2_6/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_lexbase.c -o c_code/2_6/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_sem.c -o c_code/2_6/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_semfold.c -o c_code/2_6/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_saturate.c -o c_code/2_6/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_procfind.c -o c_code/2_6/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_pragmas.c -o c_code/2_6/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_semtypinst.c -o c_code/2_6/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_sigmatch.c -o c_code/2_6/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_parampatterns.c -o c_code/2_6/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_pretty.c -o c_code/2_6/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_docgen.c -o c_code/2_6/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/docutils_rstast.c -o c_code/2_6/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_json.c -o c_code/2_6/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_unicode.c -o c_code/2_6/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/docutils_rst.c -o c_code/2_6/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/docutils_rstgen.c -o c_code/2_6/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/docutils_highlite.c -o c_code/2_6/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_sequtils.c -o c_code/2_6/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_algorithm.c -o c_code/2_6/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_sempass2.c -o c_code/2_6/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_guards.c -o c_code/2_6/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_writetracking.c -o c_code/2_6/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_xmltree.c -o c_code/2_6/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_cgi.c -o c_code/2_6/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_cookies.c -o c_code/2_6/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_typesrenderer.c -o c_code/2_6/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_transf.c -o c_code/2_6/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_cgmeth.c -o c_code/2_6/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_lambdalifting.c -o c_code/2_6/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_lowerings.c -o c_code/2_6/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_vm.c -o c_code/2_6/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_vmgen.c -o c_code/2_6/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_vmdeps.c -o c_code/2_6/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_vmmarshal.c -o c_code/2_6/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_evaltempl.c -o c_code/2_6/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_aliases.c -o c_code/2_6/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_patterns.c -o c_code/2_6/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_semmacrosanity.c -o c_code/2_6/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_semparallel.c -o c_code/2_6/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_pluginsupport.c -o c_code/2_6/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_active.c -o c_code/2_6/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_locals.c -o c_code/2_6/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_itersgen.c -o c_code/2_6/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_cgen.c -o c_code/2_6/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_ccgutils.c -o c_code/2_6/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_cgendata.c -o c_code/2_6/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_ccgmerge.c -o c_code/2_6/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_jsgen.c -o c_code/2_6/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_passaux.c -o c_code/2_6/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_depends.c -o c_code/2_6/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_docgen2.c -o c_code/2_6/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_service.c -o c_code/2_6/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_net.c -o c_code/2_6/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_nativesockets.c -o c_code/2_6/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_modules.c -o c_code/2_6/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_nodejs.c -o c_code/2_6/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_scriptconfig.c -o c_code/2_6/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/2_6/compiler_nim.o \
c_code/2_6/stdlib_system.o \
c_code/2_6/compiler_testability.o \
c_code/2_6/compiler_commands.o \
c_code/2_6/stdlib_os.o \
c_code/2_6/stdlib_strutils.o \
c_code/2_6/stdlib_parseutils.o \
c_code/2_6/stdlib_times.o \
c_code/2_6/stdlib_posix.o \
c_code/2_6/compiler_msgs.o \
c_code/2_6/compiler_options.o \
c_code/2_6/compiler_lists.o \
c_code/2_6/stdlib_strtabs.o \
c_code/2_6/stdlib_hashes.o \
c_code/2_6/stdlib_etcpriv.o \
c_code/2_6/stdlib_osproc.o \
c_code/2_6/stdlib_streams.o \
c_code/2_6/stdlib_cpuinfo.o \
c_code/2_6/stdlib_linux.o \
c_code/2_6/stdlib_sets.o \
c_code/2_6/stdlib_math.o \
c_code/2_6/stdlib_tables.o \
c_code/2_6/compiler_ropes.o \
c_code/2_6/compiler_platform.o \
c_code/2_6/stdlib_terminal.o \
c_code/2_6/stdlib_macros.o \
c_code/2_6/stdlib_termios.o \
c_code/2_6/compiler_nversion.o \
c_code/2_6/compiler_condsyms.o \
c_code/2_6/compiler_idents.o \
c_code/2_6/compiler_extccomp.o \
c_code/2_6/stdlib_securehash.o \
c_code/2_6/stdlib_unsigned.o \
c_code/2_6/compiler_wordrecg.o \
c_code/2_6/compiler_nimblecmd.o \
c_code/2_6/stdlib_parseopt.o \
c_code/2_6/compiler_lexer.o \
c_code/2_6/compiler_nimlexbase.o \
c_code/2_6/compiler_llstream.o \
c_code/2_6/compiler_nimconf.o \
c_code/2_6/compiler_main.o \
c_code/2_6/compiler_ast.o \
c_code/2_6/stdlib_intsets.o \
c_code/2_6/compiler_idgen.o \
c_code/2_6/compiler_astalgo.o \
c_code/2_6/compiler_rodutils.o \
c_code/2_6/compiler_syntaxes.o \
c_code/2_6/compiler_parser.o \
c_code/2_6/compiler_pbraces.o \
c_code/2_6/compiler_filters.o \
c_code/2_6/compiler_renderer.o \
c_code/2_6/compiler_filter_tmpl.o \
c_code/2_6/compiler_rodread.o \
c_code/2_6/compiler_types.o \
c_code/2_6/compiler_trees.o \
c_code/2_6/stdlib_memfiles.o \
c_code/2_6/compiler_rodwrite.o \
c_code/2_6/compiler_passes.o \
c_code/2_6/compiler_magicsys.o \
c_code/2_6/compiler_nimsets.o \
c_code/2_6/compiler_bitsets.o \
c_code/2_6/compiler_importer.o \
c_code/2_6/compiler_lookups.o \
c_code/2_6/compiler_semdata.o \
c_code/2_6/compiler_treetab.o \
c_code/2_6/compiler_vmdef.o \
c_code/2_6/compiler_prettybase.o \
c_code/2_6/stdlib_lexbase.o \
c_code/2_6/compiler_sem.o \
c_code/2_6/compiler_semfold.o \
c_code/2_6/compiler_saturate.o \
c_code/2_6/compiler_procfind.o \
c_code/2_6/compiler_pragmas.o \
c_code/2_6/compiler_semtypinst.o \
c_code/2_6/compiler_sigmatch.o \
c_code/2_6/compiler_parampatterns.o \
c_code/2_6/compiler_pretty.o \
c_code/2_6/compiler_docgen.o \
c_code/2_6/docutils_rstast.o \
c_code/2_6/stdlib_json.o \
c_code/2_6/stdlib_unicode.o \
c_code/2_6/docutils_rst.o \
c_code/2_6/docutils_rstgen.o \
c_code/2_6/docutils_highlite.o \
c_code/2_6/stdlib_sequtils.o \
c_code/2_6/stdlib_algorithm.o \
c_code/2_6/compiler_sempass2.o \
c_code/2_6/compiler_guards.o \
c_code/2_6/compiler_writetracking.o \
c_code/2_6/stdlib_xmltree.o \
c_code/2_6/stdlib_cgi.o \
c_code/2_6/stdlib_cookies.o \
c_code/2_6/compiler_typesrenderer.o \
c_code/2_6/compiler_transf.o \
c_code/2_6/compiler_cgmeth.o \
c_code/2_6/compiler_lambdalifting.o \
c_code/2_6/compiler_lowerings.o \
c_code/2_6/compiler_vm.o \
c_code/2_6/compiler_vmgen.o \
c_code/2_6/compiler_vmdeps.o \
c_code/2_6/compiler_vmmarshal.o \
c_code/2_6/compiler_evaltempl.o \
c_code/2_6/compiler_aliases.o \
c_code/2_6/compiler_patterns.o \
c_code/2_6/compiler_semmacrosanity.o \
c_code/2_6/compiler_semparallel.o \
c_code/2_6/compiler_pluginsupport.o \
c_code/2_6/compiler_active.o \
c_code/2_6/compiler_locals.o \
c_code/2_6/compiler_itersgen.o \
c_code/2_6/compiler_cgen.o \
c_code/2_6/compiler_ccgutils.o \
c_code/2_6/compiler_cgendata.o \
c_code/2_6/compiler_ccgmerge.o \
c_code/2_6/compiler_jsgen.o \
c_code/2_6/compiler_passaux.o \
c_code/2_6/compiler_depends.o \
c_code/2_6/compiler_docgen2.o \
c_code/2_6/compiler_service.o \
c_code/2_6/stdlib_net.o \
c_code/2_6/stdlib_nativesockets.o \
c_code/2_6/compiler_modules.o \
c_code/2_6/compiler_nodejs.o \
c_code/2_6/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  mipsel)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_nim.c -o c_code/2_7/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_system.c -o c_code/2_7/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_testability.c -o c_code/2_7/compiler_testability.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_commands.c -o c_code/2_7/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_os.c -o c_code/2_7/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_strutils.c -o c_code/2_7/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_parseutils.c -o c_code/2_7/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_times.c -o c_code/2_7/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_posix.c -o c_code/2_7/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_msgs.c -o c_code/2_7/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_options.c -o c_code/2_7/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_lists.c -o c_code/2_7/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_strtabs.c -o c_code/2_7/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_hashes.c -o c_code/2_7/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_etcpriv.c -o c_code/2_7/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_osproc.c -o c_code/2_7/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_streams.c -o c_code/2_7/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_cpuinfo.c -o c_code/2_7/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_linux.c -o c_code/2_7/stdlib_linux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_sets.c -o c_code/2_7/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_math.c -o c_code/2_7/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_tables.c -o c_code/2_7/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_ropes.c -o c_code/2_7/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_platform.c -o c_code/2_7/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_terminal.c -o c_code/2_7/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_macros.c -o c_code/2_7/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_termios.c -o c_code/2_7/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_nversion.c -o c_code/2_7/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_condsyms.c -o c_code/2_7/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_idents.c -o c_code/2_7/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_extccomp.c -o c_code/2_7/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_securehash.c -o c_code/2_7/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_unsigned.c -o c_code/2_7/stdlib_unsigned.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_wordrecg.c -o c_code/2_7/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_nimblecmd.c -o c_code/2_7/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_parseopt.c -o c_code/2_7/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_lexer.c -o c_code/2_7/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_nimlexbase.c -o c_code/2_7/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_llstream.c -o c_code/2_7/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_nimconf.c -o c_code/2_7/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_main.c -o c_code/2_7/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_ast.c -o c_code/2_7/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_intsets.c -o c_code/2_7/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_idgen.c -o c_code/2_7/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_astalgo.c -o c_code/2_7/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_rodutils.c -o c_code/2_7/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_syntaxes.c -o c_code/2_7/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_parser.c -o c_code/2_7/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_pbraces.c -o c_code/2_7/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_filters.c -o c_code/2_7/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_renderer.c -o c_code/2_7/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_filter_tmpl.c -o c_code/2_7/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_rodread.c -o c_code/2_7/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_types.c -o c_code/2_7/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_trees.c -o c_code/2_7/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_memfiles.c -o c_code/2_7/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_rodwrite.c -o c_code/2_7/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_passes.c -o c_code/2_7/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_magicsys.c -o c_code/2_7/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_nimsets.c -o c_code/2_7/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_bitsets.c -o c_code/2_7/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_importer.c -o c_code/2_7/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_lookups.c -o c_code/2_7/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_semdata.c -o c_code/2_7/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_treetab.c -o c_code/2_7/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_vmdef.c -o c_code/2_7/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_prettybase.c -o c_code/2_7/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_lexbase.c -o c_code/2_7/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_sem.c -o c_code/2_7/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_semfold.c -o c_code/2_7/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_saturate.c -o c_code/2_7/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_procfind.c -o c_code/2_7/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_pragmas.c -o c_code/2_7/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_semtypinst.c -o c_code/2_7/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_sigmatch.c -o c_code/2_7/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_parampatterns.c -o c_code/2_7/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_pretty.c -o c_code/2_7/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_docgen.c -o c_code/2_7/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/docutils_rstast.c -o c_code/2_7/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_json.c -o c_code/2_7/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_unicode.c -o c_code/2_7/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/docutils_rst.c -o c_code/2_7/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/docutils_rstgen.c -o c_code/2_7/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/docutils_highlite.c -o c_code/2_7/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_sequtils.c -o c_code/2_7/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_algorithm.c -o c_code/2_7/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_sempass2.c -o c_code/2_7/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_guards.c -o c_code/2_7/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_writetracking.c -o c_code/2_7/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_xmltree.c -o c_code/2_7/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_cgi.c -o c_code/2_7/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_cookies.c -o c_code/2_7/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_typesrenderer.c -o c_code/2_7/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_transf.c -o c_code/2_7/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_cgmeth.c -o c_code/2_7/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_lambdalifting.c -o c_code/2_7/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_lowerings.c -o c_code/2_7/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_vm.c -o c_code/2_7/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_vmgen.c -o c_code/2_7/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_vmdeps.c -o c_code/2_7/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_vmmarshal.c -o c_code/2_7/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_evaltempl.c -o c_code/2_7/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_aliases.c -o c_code/2_7/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_patterns.c -o c_code/2_7/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_semmacrosanity.c -o c_code/2_7/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_semparallel.c -o c_code/2_7/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_pluginsupport.c -o c_code/2_7/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_active.c -o c_code/2_7/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_locals.c -o c_code/2_7/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_itersgen.c -o c_code/2_7/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_cgen.c -o c_code/2_7/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_ccgutils.c -o c_code/2_7/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_cgendata.c -o c_code/2_7/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_ccgmerge.c -o c_code/2_7/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_jsgen.c -o c_code/2_7/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_passaux.c -o c_code/2_7/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_depends.c -o c_code/2_7/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_docgen2.c -o c_code/2_7/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_service.c -o c_code/2_7/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_net.c -o c_code/2_7/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_nativesockets.c -o c_code/2_7/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_modules.c -o c_code/2_7/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_nodejs.c -o c_code/2_7/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_scriptconfig.c -o c_code/2_7/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/2_7/compiler_nim.o \
c_code/2_7/stdlib_system.o \
c_code/2_7/compiler_testability.o \
c_code/2_7/compiler_commands.o \
c_code/2_7/stdlib_os.o \
c_code/2_7/stdlib_strutils.o \
c_code/2_7/stdlib_parseutils.o \
c_code/2_7/stdlib_times.o \
c_code/2_7/stdlib_posix.o \
c_code/2_7/compiler_msgs.o \
c_code/2_7/compiler_options.o \
c_code/2_7/compiler_lists.o \
c_code/2_7/stdlib_strtabs.o \
c_code/2_7/stdlib_hashes.o \
c_code/2_7/stdlib_etcpriv.o \
c_code/2_7/stdlib_osproc.o \
c_code/2_7/stdlib_streams.o \
c_code/2_7/stdlib_cpuinfo.o \
c_code/2_7/stdlib_linux.o \
c_code/2_7/stdlib_sets.o \
c_code/2_7/stdlib_math.o \
c_code/2_7/stdlib_tables.o \
c_code/2_7/compiler_ropes.o \
c_code/2_7/compiler_platform.o \
c_code/2_7/stdlib_terminal.o \
c_code/2_7/stdlib_macros.o \
c_code/2_7/stdlib_termios.o \
c_code/2_7/compiler_nversion.o \
c_code/2_7/compiler_condsyms.o \
c_code/2_7/compiler_idents.o \
c_code/2_7/compiler_extccomp.o \
c_code/2_7/stdlib_securehash.o \
c_code/2_7/stdlib_unsigned.o \
c_code/2_7/compiler_wordrecg.o \
c_code/2_7/compiler_nimblecmd.o \
c_code/2_7/stdlib_parseopt.o \
c_code/2_7/compiler_lexer.o \
c_code/2_7/compiler_nimlexbase.o \
c_code/2_7/compiler_llstream.o \
c_code/2_7/compiler_nimconf.o \
c_code/2_7/compiler_main.o \
c_code/2_7/compiler_ast.o \
c_code/2_7/stdlib_intsets.o \
c_code/2_7/compiler_idgen.o \
c_code/2_7/compiler_astalgo.o \
c_code/2_7/compiler_rodutils.o \
c_code/2_7/compiler_syntaxes.o \
c_code/2_7/compiler_parser.o \
c_code/2_7/compiler_pbraces.o \
c_code/2_7/compiler_filters.o \
c_code/2_7/compiler_renderer.o \
c_code/2_7/compiler_filter_tmpl.o \
c_code/2_7/compiler_rodread.o \
c_code/2_7/compiler_types.o \
c_code/2_7/compiler_trees.o \
c_code/2_7/stdlib_memfiles.o \
c_code/2_7/compiler_rodwrite.o \
c_code/2_7/compiler_passes.o \
c_code/2_7/compiler_magicsys.o \
c_code/2_7/compiler_nimsets.o \
c_code/2_7/compiler_bitsets.o \
c_code/2_7/compiler_importer.o \
c_code/2_7/compiler_lookups.o \
c_code/2_7/compiler_semdata.o \
c_code/2_7/compiler_treetab.o \
c_code/2_7/compiler_vmdef.o \
c_code/2_7/compiler_prettybase.o \
c_code/2_7/stdlib_lexbase.o \
c_code/2_7/compiler_sem.o \
c_code/2_7/compiler_semfold.o \
c_code/2_7/compiler_saturate.o \
c_code/2_7/compiler_procfind.o \
c_code/2_7/compiler_pragmas.o \
c_code/2_7/compiler_semtypinst.o \
c_code/2_7/compiler_sigmatch.o \
c_code/2_7/compiler_parampatterns.o \
c_code/2_7/compiler_pretty.o \
c_code/2_7/compiler_docgen.o \
c_code/2_7/docutils_rstast.o \
c_code/2_7/stdlib_json.o \
c_code/2_7/stdlib_unicode.o \
c_code/2_7/docutils_rst.o \
c_code/2_7/docutils_rstgen.o \
c_code/2_7/docutils_highlite.o \
c_code/2_7/stdlib_sequtils.o \
c_code/2_7/stdlib_algorithm.o \
c_code/2_7/compiler_sempass2.o \
c_code/2_7/compiler_guards.o \
c_code/2_7/compiler_writetracking.o \
c_code/2_7/stdlib_xmltree.o \
c_code/2_7/stdlib_cgi.o \
c_code/2_7/stdlib_cookies.o \
c_code/2_7/compiler_typesrenderer.o \
c_code/2_7/compiler_transf.o \
c_code/2_7/compiler_cgmeth.o \
c_code/2_7/compiler_lambdalifting.o \
c_code/2_7/compiler_lowerings.o \
c_code/2_7/compiler_vm.o \
c_code/2_7/compiler_vmgen.o \
c_code/2_7/compiler_vmdeps.o \
c_code/2_7/compiler_vmmarshal.o \
c_code/2_7/compiler_evaltempl.o \
c_code/2_7/compiler_aliases.o \
c_code/2_7/compiler_patterns.o \
c_code/2_7/compiler_semmacrosanity.o \
c_code/2_7/compiler_semparallel.o \
c_code/2_7/compiler_pluginsupport.o \
c_code/2_7/compiler_active.o \
c_code/2_7/compiler_locals.o \
c_code/2_7/compiler_itersgen.o \
c_code/2_7/compiler_cgen.o \
c_code/2_7/compiler_ccgutils.o \
c_code/2_7/compiler_cgendata.o \
c_code/2_7/compiler_ccgmerge.o \
c_code/2_7/compiler_jsgen.o \
c_code/2_7/compiler_passaux.o \
c_code/2_7/compiler_depends.o \
c_code/2_7/compiler_docgen2.o \
c_code/2_7/compiler_service.o \
c_code/2_7/stdlib_net.o \
c_code/2_7/stdlib_nativesockets.o \
c_code/2_7/compiler_modules.o \
c_code/2_7/compiler_nodejs.o \
c_code/2_7/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  powerpc)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_nim.c -o c_code/2_8/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_system.c -o c_code/2_8/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_testability.c -o c_code/2_8/compiler_testability.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_commands.c -o c_code/2_8/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_os.c -o c_code/2_8/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_strutils.c -o c_code/2_8/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_parseutils.c -o c_code/2_8/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_times.c -o c_code/2_8/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_posix.c -o c_code/2_8/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_msgs.c -o c_code/2_8/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_options.c -o c_code/2_8/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_lists.c -o c_code/2_8/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_strtabs.c -o c_code/2_8/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_hashes.c -o c_code/2_8/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_etcpriv.c -o c_code/2_8/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_osproc.c -o c_code/2_8/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_streams.c -o c_code/2_8/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_cpuinfo.c -o c_code/2_8/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_linux.c -o c_code/2_8/stdlib_linux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_sets.c -o c_code/2_8/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_math.c -o c_code/2_8/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_tables.c -o c_code/2_8/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_ropes.c -o c_code/2_8/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_platform.c -o c_code/2_8/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_terminal.c -o c_code/2_8/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_macros.c -o c_code/2_8/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_termios.c -o c_code/2_8/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_nversion.c -o c_code/2_8/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_condsyms.c -o c_code/2_8/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_idents.c -o c_code/2_8/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_extccomp.c -o c_code/2_8/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_securehash.c -o c_code/2_8/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_unsigned.c -o c_code/2_8/stdlib_unsigned.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_wordrecg.c -o c_code/2_8/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_nimblecmd.c -o c_code/2_8/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_parseopt.c -o c_code/2_8/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_lexer.c -o c_code/2_8/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_nimlexbase.c -o c_code/2_8/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_llstream.c -o c_code/2_8/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_nimconf.c -o c_code/2_8/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_main.c -o c_code/2_8/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_ast.c -o c_code/2_8/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_intsets.c -o c_code/2_8/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_idgen.c -o c_code/2_8/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_astalgo.c -o c_code/2_8/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_rodutils.c -o c_code/2_8/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_syntaxes.c -o c_code/2_8/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_parser.c -o c_code/2_8/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_pbraces.c -o c_code/2_8/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_filters.c -o c_code/2_8/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_renderer.c -o c_code/2_8/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_filter_tmpl.c -o c_code/2_8/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_rodread.c -o c_code/2_8/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_types.c -o c_code/2_8/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_trees.c -o c_code/2_8/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_memfiles.c -o c_code/2_8/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_rodwrite.c -o c_code/2_8/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_passes.c -o c_code/2_8/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_magicsys.c -o c_code/2_8/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_nimsets.c -o c_code/2_8/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_bitsets.c -o c_code/2_8/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_importer.c -o c_code/2_8/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_lookups.c -o c_code/2_8/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_semdata.c -o c_code/2_8/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_treetab.c -o c_code/2_8/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_vmdef.c -o c_code/2_8/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_prettybase.c -o c_code/2_8/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_lexbase.c -o c_code/2_8/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_sem.c -o c_code/2_8/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_semfold.c -o c_code/2_8/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_saturate.c -o c_code/2_8/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_procfind.c -o c_code/2_8/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_pragmas.c -o c_code/2_8/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_semtypinst.c -o c_code/2_8/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_sigmatch.c -o c_code/2_8/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_parampatterns.c -o c_code/2_8/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_pretty.c -o c_code/2_8/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_docgen.c -o c_code/2_8/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/docutils_rstast.c -o c_code/2_8/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_json.c -o c_code/2_8/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_unicode.c -o c_code/2_8/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/docutils_rst.c -o c_code/2_8/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/docutils_rstgen.c -o c_code/2_8/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/docutils_highlite.c -o c_code/2_8/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_sequtils.c -o c_code/2_8/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_algorithm.c -o c_code/2_8/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_sempass2.c -o c_code/2_8/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_guards.c -o c_code/2_8/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_writetracking.c -o c_code/2_8/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_xmltree.c -o c_code/2_8/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_cgi.c -o c_code/2_8/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_cookies.c -o c_code/2_8/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_typesrenderer.c -o c_code/2_8/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_transf.c -o c_code/2_8/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_cgmeth.c -o c_code/2_8/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_lambdalifting.c -o c_code/2_8/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_lowerings.c -o c_code/2_8/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_vm.c -o c_code/2_8/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_vmgen.c -o c_code/2_8/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_vmdeps.c -o c_code/2_8/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_vmmarshal.c -o c_code/2_8/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_evaltempl.c -o c_code/2_8/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_aliases.c -o c_code/2_8/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_patterns.c -o c_code/2_8/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_semmacrosanity.c -o c_code/2_8/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_semparallel.c -o c_code/2_8/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_pluginsupport.c -o c_code/2_8/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_active.c -o c_code/2_8/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_locals.c -o c_code/2_8/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_itersgen.c -o c_code/2_8/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_cgen.c -o c_code/2_8/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_ccgutils.c -o c_code/2_8/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_cgendata.c -o c_code/2_8/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_ccgmerge.c -o c_code/2_8/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_jsgen.c -o c_code/2_8/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_passaux.c -o c_code/2_8/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_depends.c -o c_code/2_8/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_docgen2.c -o c_code/2_8/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_service.c -o c_code/2_8/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_net.c -o c_code/2_8/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/stdlib_nativesockets.c -o c_code/2_8/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_modules.c -o c_code/2_8/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_nodejs.c -o c_code/2_8/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_scriptconfig.c -o c_code/2_8/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/2_8/compiler_nim.o \
c_code/2_8/stdlib_system.o \
c_code/2_8/compiler_testability.o \
c_code/2_8/compiler_commands.o \
c_code/2_8/stdlib_os.o \
c_code/2_8/stdlib_strutils.o \
c_code/2_8/stdlib_parseutils.o \
c_code/2_8/stdlib_times.o \
c_code/2_8/stdlib_posix.o \
c_code/2_8/compiler_msgs.o \
c_code/2_8/compiler_options.o \
c_code/2_8/compiler_lists.o \
c_code/2_8/stdlib_strtabs.o \
c_code/2_8/stdlib_hashes.o \
c_code/2_8/stdlib_etcpriv.o \
c_code/2_8/stdlib_osproc.o \
c_code/2_8/stdlib_streams.o \
c_code/2_8/stdlib_cpuinfo.o \
c_code/2_8/stdlib_linux.o \
c_code/2_8/stdlib_sets.o \
c_code/2_8/stdlib_math.o \
c_code/2_8/stdlib_tables.o \
c_code/2_8/compiler_ropes.o \
c_code/2_8/compiler_platform.o \
c_code/2_8/stdlib_terminal.o \
c_code/2_8/stdlib_macros.o \
c_code/2_8/stdlib_termios.o \
c_code/2_8/compiler_nversion.o \
c_code/2_8/compiler_condsyms.o \
c_code/2_8/compiler_idents.o \
c_code/2_8/compiler_extccomp.o \
c_code/2_8/stdlib_securehash.o \
c_code/2_8/stdlib_unsigned.o \
c_code/2_8/compiler_wordrecg.o \
c_code/2_8/compiler_nimblecmd.o \
c_code/2_8/stdlib_parseopt.o \
c_code/2_8/compiler_lexer.o \
c_code/2_8/compiler_nimlexbase.o \
c_code/2_8/compiler_llstream.o \
c_code/2_8/compiler_nimconf.o \
c_code/2_8/compiler_main.o \
c_code/2_8/compiler_ast.o \
c_code/2_8/stdlib_intsets.o \
c_code/2_8/compiler_idgen.o \
c_code/2_8/compiler_astalgo.o \
c_code/2_8/compiler_rodutils.o \
c_code/2_8/compiler_syntaxes.o \
c_code/2_8/compiler_parser.o \
c_code/2_8/compiler_pbraces.o \
c_code/2_8/compiler_filters.o \
c_code/2_8/compiler_renderer.o \
c_code/2_8/compiler_filter_tmpl.o \
c_code/2_8/compiler_rodread.o \
c_code/2_8/compiler_types.o \
c_code/2_8/compiler_trees.o \
c_code/2_8/stdlib_memfiles.o \
c_code/2_8/compiler_rodwrite.o \
c_code/2_8/compiler_passes.o \
c_code/2_8/compiler_magicsys.o \
c_code/2_8/compiler_nimsets.o \
c_code/2_8/compiler_bitsets.o \
c_code/2_8/compiler_importer.o \
c_code/2_8/compiler_lookups.o \
c_code/2_8/compiler_semdata.o \
c_code/2_8/compiler_treetab.o \
c_code/2_8/compiler_vmdef.o \
c_code/2_8/compiler_prettybase.o \
c_code/2_8/stdlib_lexbase.o \
c_code/2_8/compiler_sem.o \
c_code/2_8/compiler_semfold.o \
c_code/2_8/compiler_saturate.o \
c_code/2_8/compiler_procfind.o \
c_code/2_8/compiler_pragmas.o \
c_code/2_8/compiler_semtypinst.o \
c_code/2_8/compiler_sigmatch.o \
c_code/2_8/compiler_parampatterns.o \
c_code/2_8/compiler_pretty.o \
c_code/2_8/compiler_docgen.o \
c_code/2_8/docutils_rstast.o \
c_code/2_8/stdlib_json.o \
c_code/2_8/stdlib_unicode.o \
c_code/2_8/docutils_rst.o \
c_code/2_8/docutils_rstgen.o \
c_code/2_8/docutils_highlite.o \
c_code/2_8/stdlib_sequtils.o \
c_code/2_8/stdlib_algorithm.o \
c_code/2_8/compiler_sempass2.o \
c_code/2_8/compiler_guards.o \
c_code/2_8/compiler_writetracking.o \
c_code/2_8/stdlib_xmltree.o \
c_code/2_8/stdlib_cgi.o \
c_code/2_8/stdlib_cookies.o \
c_code/2_8/compiler_typesrenderer.o \
c_code/2_8/compiler_transf.o \
c_code/2_8/compiler_cgmeth.o \
c_code/2_8/compiler_lambdalifting.o \
c_code/2_8/compiler_lowerings.o \
c_code/2_8/compiler_vm.o \
c_code/2_8/compiler_vmgen.o \
c_code/2_8/compiler_vmdeps.o \
c_code/2_8/compiler_vmmarshal.o \
c_code/2_8/compiler_evaltempl.o \
c_code/2_8/compiler_aliases.o \
c_code/2_8/compiler_patterns.o \
c_code/2_8/compiler_semmacrosanity.o \
c_code/2_8/compiler_semparallel.o \
c_code/2_8/compiler_pluginsupport.o \
c_code/2_8/compiler_active.o \
c_code/2_8/compiler_locals.o \
c_code/2_8/compiler_itersgen.o \
c_code/2_8/compiler_cgen.o \
c_code/2_8/compiler_ccgutils.o \
c_code/2_8/compiler_cgendata.o \
c_code/2_8/compiler_ccgmerge.o \
c_code/2_8/compiler_jsgen.o \
c_code/2_8/compiler_passaux.o \
c_code/2_8/compiler_depends.o \
c_code/2_8/compiler_docgen2.o \
c_code/2_8/compiler_service.o \
c_code/2_8/stdlib_net.o \
c_code/2_8/stdlib_nativesockets.o \
c_code/2_8/compiler_modules.o \
c_code/2_8/compiler_nodejs.o \
c_code/2_8/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  powerpc64el)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_nim.c -o c_code/2_9/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_system.c -o c_code/2_9/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_testability.c -o c_code/2_9/compiler_testability.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_commands.c -o c_code/2_9/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_os.c -o c_code/2_9/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_strutils.c -o c_code/2_9/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_parseutils.c -o c_code/2_9/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_times.c -o c_code/2_9/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_posix.c -o c_code/2_9/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_msgs.c -o c_code/2_9/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_options.c -o c_code/2_9/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_lists.c -o c_code/2_9/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_strtabs.c -o c_code/2_9/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_hashes.c -o c_code/2_9/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_etcpriv.c -o c_code/2_9/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_osproc.c -o c_code/2_9/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_streams.c -o c_code/2_9/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_cpuinfo.c -o c_code/2_9/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_linux.c -o c_code/2_9/stdlib_linux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_sets.c -o c_code/2_9/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_math.c -o c_code/2_9/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_tables.c -o c_code/2_9/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_ropes.c -o c_code/2_9/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_platform.c -o c_code/2_9/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_terminal.c -o c_code/2_9/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_macros.c -o c_code/2_9/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_termios.c -o c_code/2_9/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_nversion.c -o c_code/2_9/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_condsyms.c -o c_code/2_9/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_idents.c -o c_code/2_9/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_extccomp.c -o c_code/2_9/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_securehash.c -o c_code/2_9/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_unsigned.c -o c_code/2_9/stdlib_unsigned.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_wordrecg.c -o c_code/2_9/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_nimblecmd.c -o c_code/2_9/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_parseopt.c -o c_code/2_9/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_lexer.c -o c_code/2_9/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_nimlexbase.c -o c_code/2_9/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_llstream.c -o c_code/2_9/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_nimconf.c -o c_code/2_9/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_main.c -o c_code/2_9/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_ast.c -o c_code/2_9/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_intsets.c -o c_code/2_9/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_idgen.c -o c_code/2_9/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_astalgo.c -o c_code/2_9/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_rodutils.c -o c_code/2_9/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_syntaxes.c -o c_code/2_9/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_parser.c -o c_code/2_9/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_pbraces.c -o c_code/2_9/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_filters.c -o c_code/2_9/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_renderer.c -o c_code/2_9/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_filter_tmpl.c -o c_code/2_9/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_rodread.c -o c_code/2_9/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_types.c -o c_code/2_9/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_trees.c -o c_code/2_9/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_memfiles.c -o c_code/2_9/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_rodwrite.c -o c_code/2_9/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_passes.c -o c_code/2_9/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_magicsys.c -o c_code/2_9/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_nimsets.c -o c_code/2_9/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_bitsets.c -o c_code/2_9/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_importer.c -o c_code/2_9/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_lookups.c -o c_code/2_9/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_semdata.c -o c_code/2_9/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_treetab.c -o c_code/2_9/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_vmdef.c -o c_code/2_9/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_prettybase.c -o c_code/2_9/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_lexbase.c -o c_code/2_9/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_sem.c -o c_code/2_9/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_semfold.c -o c_code/2_9/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_saturate.c -o c_code/2_9/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_procfind.c -o c_code/2_9/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_pragmas.c -o c_code/2_9/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_semtypinst.c -o c_code/2_9/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_sigmatch.c -o c_code/2_9/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_parampatterns.c -o c_code/2_9/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_pretty.c -o c_code/2_9/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_docgen.c -o c_code/2_9/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/docutils_rstast.c -o c_code/2_9/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_json.c -o c_code/2_9/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_unicode.c -o c_code/2_9/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/docutils_rst.c -o c_code/2_9/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/docutils_rstgen.c -o c_code/2_9/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/docutils_highlite.c -o c_code/2_9/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_sequtils.c -o c_code/2_9/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_algorithm.c -o c_code/2_9/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_sempass2.c -o c_code/2_9/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_guards.c -o c_code/2_9/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_writetracking.c -o c_code/2_9/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_xmltree.c -o c_code/2_9/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_cgi.c -o c_code/2_9/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_cookies.c -o c_code/2_9/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_typesrenderer.c -o c_code/2_9/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_transf.c -o c_code/2_9/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_cgmeth.c -o c_code/2_9/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_lambdalifting.c -o c_code/2_9/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_lowerings.c -o c_code/2_9/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_vm.c -o c_code/2_9/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_vmgen.c -o c_code/2_9/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_vmdeps.c -o c_code/2_9/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_vmmarshal.c -o c_code/2_9/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_evaltempl.c -o c_code/2_9/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_aliases.c -o c_code/2_9/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_patterns.c -o c_code/2_9/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_semmacrosanity.c -o c_code/2_9/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_semparallel.c -o c_code/2_9/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_pluginsupport.c -o c_code/2_9/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_active.c -o c_code/2_9/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_locals.c -o c_code/2_9/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_itersgen.c -o c_code/2_9/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_cgen.c -o c_code/2_9/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_ccgutils.c -o c_code/2_9/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_cgendata.c -o c_code/2_9/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_ccgmerge.c -o c_code/2_9/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_jsgen.c -o c_code/2_9/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_passaux.c -o c_code/2_9/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_depends.c -o c_code/2_9/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_docgen2.c -o c_code/2_9/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_service.c -o c_code/2_9/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_net.c -o c_code/2_9/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/stdlib_nativesockets.c -o c_code/2_9/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_modules.c -o c_code/2_9/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_nodejs.c -o c_code/2_9/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_scriptconfig.c -o c_code/2_9/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/2_9/compiler_nim.o \
c_code/2_9/stdlib_system.o \
c_code/2_9/compiler_testability.o \
c_code/2_9/compiler_commands.o \
c_code/2_9/stdlib_os.o \
c_code/2_9/stdlib_strutils.o \
c_code/2_9/stdlib_parseutils.o \
c_code/2_9/stdlib_times.o \
c_code/2_9/stdlib_posix.o \
c_code/2_9/compiler_msgs.o \
c_code/2_9/compiler_options.o \
c_code/2_9/compiler_lists.o \
c_code/2_9/stdlib_strtabs.o \
c_code/2_9/stdlib_hashes.o \
c_code/2_9/stdlib_etcpriv.o \
c_code/2_9/stdlib_osproc.o \
c_code/2_9/stdlib_streams.o \
c_code/2_9/stdlib_cpuinfo.o \
c_code/2_9/stdlib_linux.o \
c_code/2_9/stdlib_sets.o \
c_code/2_9/stdlib_math.o \
c_code/2_9/stdlib_tables.o \
c_code/2_9/compiler_ropes.o \
c_code/2_9/compiler_platform.o \
c_code/2_9/stdlib_terminal.o \
c_code/2_9/stdlib_macros.o \
c_code/2_9/stdlib_termios.o \
c_code/2_9/compiler_nversion.o \
c_code/2_9/compiler_condsyms.o \
c_code/2_9/compiler_idents.o \
c_code/2_9/compiler_extccomp.o \
c_code/2_9/stdlib_securehash.o \
c_code/2_9/stdlib_unsigned.o \
c_code/2_9/compiler_wordrecg.o \
c_code/2_9/compiler_nimblecmd.o \
c_code/2_9/stdlib_parseopt.o \
c_code/2_9/compiler_lexer.o \
c_code/2_9/compiler_nimlexbase.o \
c_code/2_9/compiler_llstream.o \
c_code/2_9/compiler_nimconf.o \
c_code/2_9/compiler_main.o \
c_code/2_9/compiler_ast.o \
c_code/2_9/stdlib_intsets.o \
c_code/2_9/compiler_idgen.o \
c_code/2_9/compiler_astalgo.o \
c_code/2_9/compiler_rodutils.o \
c_code/2_9/compiler_syntaxes.o \
c_code/2_9/compiler_parser.o \
c_code/2_9/compiler_pbraces.o \
c_code/2_9/compiler_filters.o \
c_code/2_9/compiler_renderer.o \
c_code/2_9/compiler_filter_tmpl.o \
c_code/2_9/compiler_rodread.o \
c_code/2_9/compiler_types.o \
c_code/2_9/compiler_trees.o \
c_code/2_9/stdlib_memfiles.o \
c_code/2_9/compiler_rodwrite.o \
c_code/2_9/compiler_passes.o \
c_code/2_9/compiler_magicsys.o \
c_code/2_9/compiler_nimsets.o \
c_code/2_9/compiler_bitsets.o \
c_code/2_9/compiler_importer.o \
c_code/2_9/compiler_lookups.o \
c_code/2_9/compiler_semdata.o \
c_code/2_9/compiler_treetab.o \
c_code/2_9/compiler_vmdef.o \
c_code/2_9/compiler_prettybase.o \
c_code/2_9/stdlib_lexbase.o \
c_code/2_9/compiler_sem.o \
c_code/2_9/compiler_semfold.o \
c_code/2_9/compiler_saturate.o \
c_code/2_9/compiler_procfind.o \
c_code/2_9/compiler_pragmas.o \
c_code/2_9/compiler_semtypinst.o \
c_code/2_9/compiler_sigmatch.o \
c_code/2_9/compiler_parampatterns.o \
c_code/2_9/compiler_pretty.o \
c_code/2_9/compiler_docgen.o \
c_code/2_9/docutils_rstast.o \
c_code/2_9/stdlib_json.o \
c_code/2_9/stdlib_unicode.o \
c_code/2_9/docutils_rst.o \
c_code/2_9/docutils_rstgen.o \
c_code/2_9/docutils_highlite.o \
c_code/2_9/stdlib_sequtils.o \
c_code/2_9/stdlib_algorithm.o \
c_code/2_9/compiler_sempass2.o \
c_code/2_9/compiler_guards.o \
c_code/2_9/compiler_writetracking.o \
c_code/2_9/stdlib_xmltree.o \
c_code/2_9/stdlib_cgi.o \
c_code/2_9/stdlib_cookies.o \
c_code/2_9/compiler_typesrenderer.o \
c_code/2_9/compiler_transf.o \
c_code/2_9/compiler_cgmeth.o \
c_code/2_9/compiler_lambdalifting.o \
c_code/2_9/compiler_lowerings.o \
c_code/2_9/compiler_vm.o \
c_code/2_9/compiler_vmgen.o \
c_code/2_9/compiler_vmdeps.o \
c_code/2_9/compiler_vmmarshal.o \
c_code/2_9/compiler_evaltempl.o \
c_code/2_9/compiler_aliases.o \
c_code/2_9/compiler_patterns.o \
c_code/2_9/compiler_semmacrosanity.o \
c_code/2_9/compiler_semparallel.o \
c_code/2_9/compiler_pluginsupport.o \
c_code/2_9/compiler_active.o \
c_code/2_9/compiler_locals.o \
c_code/2_9/compiler_itersgen.o \
c_code/2_9/compiler_cgen.o \
c_code/2_9/compiler_ccgutils.o \
c_code/2_9/compiler_cgendata.o \
c_code/2_9/compiler_ccgmerge.o \
c_code/2_9/compiler_jsgen.o \
c_code/2_9/compiler_passaux.o \
c_code/2_9/compiler_depends.o \
c_code/2_9/compiler_docgen2.o \
c_code/2_9/compiler_service.o \
c_code/2_9/stdlib_net.o \
c_code/2_9/stdlib_nativesockets.o \
c_code/2_9/compiler_modules.o \
c_code/2_9/compiler_nodejs.o \
c_code/2_9/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  arm64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_nim.c -o c_code/2_10/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_system.c -o c_code/2_10/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_testability.c -o c_code/2_10/compiler_testability.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_commands.c -o c_code/2_10/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_os.c -o c_code/2_10/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_strutils.c -o c_code/2_10/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_parseutils.c -o c_code/2_10/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_times.c -o c_code/2_10/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_posix.c -o c_code/2_10/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_msgs.c -o c_code/2_10/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_options.c -o c_code/2_10/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_lists.c -o c_code/2_10/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_strtabs.c -o c_code/2_10/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_hashes.c -o c_code/2_10/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_etcpriv.c -o c_code/2_10/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_osproc.c -o c_code/2_10/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_streams.c -o c_code/2_10/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_cpuinfo.c -o c_code/2_10/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_linux.c -o c_code/2_10/stdlib_linux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_sets.c -o c_code/2_10/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_math.c -o c_code/2_10/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_tables.c -o c_code/2_10/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_ropes.c -o c_code/2_10/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_platform.c -o c_code/2_10/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_terminal.c -o c_code/2_10/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_macros.c -o c_code/2_10/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_termios.c -o c_code/2_10/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_nversion.c -o c_code/2_10/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_condsyms.c -o c_code/2_10/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_idents.c -o c_code/2_10/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_extccomp.c -o c_code/2_10/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_securehash.c -o c_code/2_10/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_unsigned.c -o c_code/2_10/stdlib_unsigned.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_wordrecg.c -o c_code/2_10/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_nimblecmd.c -o c_code/2_10/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_parseopt.c -o c_code/2_10/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_lexer.c -o c_code/2_10/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_nimlexbase.c -o c_code/2_10/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_llstream.c -o c_code/2_10/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_nimconf.c -o c_code/2_10/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_main.c -o c_code/2_10/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_ast.c -o c_code/2_10/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_intsets.c -o c_code/2_10/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_idgen.c -o c_code/2_10/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_astalgo.c -o c_code/2_10/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_rodutils.c -o c_code/2_10/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_syntaxes.c -o c_code/2_10/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_parser.c -o c_code/2_10/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_pbraces.c -o c_code/2_10/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_filters.c -o c_code/2_10/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_renderer.c -o c_code/2_10/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_filter_tmpl.c -o c_code/2_10/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_rodread.c -o c_code/2_10/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_types.c -o c_code/2_10/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_trees.c -o c_code/2_10/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_memfiles.c -o c_code/2_10/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_rodwrite.c -o c_code/2_10/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_passes.c -o c_code/2_10/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_magicsys.c -o c_code/2_10/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_nimsets.c -o c_code/2_10/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_bitsets.c -o c_code/2_10/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_importer.c -o c_code/2_10/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_lookups.c -o c_code/2_10/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_semdata.c -o c_code/2_10/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_treetab.c -o c_code/2_10/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_vmdef.c -o c_code/2_10/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_prettybase.c -o c_code/2_10/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_lexbase.c -o c_code/2_10/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_sem.c -o c_code/2_10/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_semfold.c -o c_code/2_10/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_saturate.c -o c_code/2_10/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_procfind.c -o c_code/2_10/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_pragmas.c -o c_code/2_10/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_semtypinst.c -o c_code/2_10/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_sigmatch.c -o c_code/2_10/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_parampatterns.c -o c_code/2_10/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_pretty.c -o c_code/2_10/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_docgen.c -o c_code/2_10/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/docutils_rstast.c -o c_code/2_10/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_json.c -o c_code/2_10/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_unicode.c -o c_code/2_10/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/docutils_rst.c -o c_code/2_10/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/docutils_rstgen.c -o c_code/2_10/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/docutils_highlite.c -o c_code/2_10/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_sequtils.c -o c_code/2_10/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_algorithm.c -o c_code/2_10/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_sempass2.c -o c_code/2_10/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_guards.c -o c_code/2_10/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_writetracking.c -o c_code/2_10/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_xmltree.c -o c_code/2_10/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_cgi.c -o c_code/2_10/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_cookies.c -o c_code/2_10/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_typesrenderer.c -o c_code/2_10/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_transf.c -o c_code/2_10/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_cgmeth.c -o c_code/2_10/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_lambdalifting.c -o c_code/2_10/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_lowerings.c -o c_code/2_10/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_vm.c -o c_code/2_10/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_vmgen.c -o c_code/2_10/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_vmdeps.c -o c_code/2_10/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_vmmarshal.c -o c_code/2_10/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_evaltempl.c -o c_code/2_10/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_aliases.c -o c_code/2_10/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_patterns.c -o c_code/2_10/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_semmacrosanity.c -o c_code/2_10/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_semparallel.c -o c_code/2_10/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_pluginsupport.c -o c_code/2_10/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_active.c -o c_code/2_10/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_locals.c -o c_code/2_10/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_itersgen.c -o c_code/2_10/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_cgen.c -o c_code/2_10/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_ccgutils.c -o c_code/2_10/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_cgendata.c -o c_code/2_10/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_ccgmerge.c -o c_code/2_10/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_jsgen.c -o c_code/2_10/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_passaux.c -o c_code/2_10/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_depends.c -o c_code/2_10/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_docgen2.c -o c_code/2_10/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_service.c -o c_code/2_10/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_net.c -o c_code/2_10/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/stdlib_nativesockets.c -o c_code/2_10/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_modules.c -o c_code/2_10/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_nodejs.c -o c_code/2_10/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_scriptconfig.c -o c_code/2_10/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/2_10/compiler_nim.o \
c_code/2_10/stdlib_system.o \
c_code/2_10/compiler_testability.o \
c_code/2_10/compiler_commands.o \
c_code/2_10/stdlib_os.o \
c_code/2_10/stdlib_strutils.o \
c_code/2_10/stdlib_parseutils.o \
c_code/2_10/stdlib_times.o \
c_code/2_10/stdlib_posix.o \
c_code/2_10/compiler_msgs.o \
c_code/2_10/compiler_options.o \
c_code/2_10/compiler_lists.o \
c_code/2_10/stdlib_strtabs.o \
c_code/2_10/stdlib_hashes.o \
c_code/2_10/stdlib_etcpriv.o \
c_code/2_10/stdlib_osproc.o \
c_code/2_10/stdlib_streams.o \
c_code/2_10/stdlib_cpuinfo.o \
c_code/2_10/stdlib_linux.o \
c_code/2_10/stdlib_sets.o \
c_code/2_10/stdlib_math.o \
c_code/2_10/stdlib_tables.o \
c_code/2_10/compiler_ropes.o \
c_code/2_10/compiler_platform.o \
c_code/2_10/stdlib_terminal.o \
c_code/2_10/stdlib_macros.o \
c_code/2_10/stdlib_termios.o \
c_code/2_10/compiler_nversion.o \
c_code/2_10/compiler_condsyms.o \
c_code/2_10/compiler_idents.o \
c_code/2_10/compiler_extccomp.o \
c_code/2_10/stdlib_securehash.o \
c_code/2_10/stdlib_unsigned.o \
c_code/2_10/compiler_wordrecg.o \
c_code/2_10/compiler_nimblecmd.o \
c_code/2_10/stdlib_parseopt.o \
c_code/2_10/compiler_lexer.o \
c_code/2_10/compiler_nimlexbase.o \
c_code/2_10/compiler_llstream.o \
c_code/2_10/compiler_nimconf.o \
c_code/2_10/compiler_main.o \
c_code/2_10/compiler_ast.o \
c_code/2_10/stdlib_intsets.o \
c_code/2_10/compiler_idgen.o \
c_code/2_10/compiler_astalgo.o \
c_code/2_10/compiler_rodutils.o \
c_code/2_10/compiler_syntaxes.o \
c_code/2_10/compiler_parser.o \
c_code/2_10/compiler_pbraces.o \
c_code/2_10/compiler_filters.o \
c_code/2_10/compiler_renderer.o \
c_code/2_10/compiler_filter_tmpl.o \
c_code/2_10/compiler_rodread.o \
c_code/2_10/compiler_types.o \
c_code/2_10/compiler_trees.o \
c_code/2_10/stdlib_memfiles.o \
c_code/2_10/compiler_rodwrite.o \
c_code/2_10/compiler_passes.o \
c_code/2_10/compiler_magicsys.o \
c_code/2_10/compiler_nimsets.o \
c_code/2_10/compiler_bitsets.o \
c_code/2_10/compiler_importer.o \
c_code/2_10/compiler_lookups.o \
c_code/2_10/compiler_semdata.o \
c_code/2_10/compiler_treetab.o \
c_code/2_10/compiler_vmdef.o \
c_code/2_10/compiler_prettybase.o \
c_code/2_10/stdlib_lexbase.o \
c_code/2_10/compiler_sem.o \
c_code/2_10/compiler_semfold.o \
c_code/2_10/compiler_saturate.o \
c_code/2_10/compiler_procfind.o \
c_code/2_10/compiler_pragmas.o \
c_code/2_10/compiler_semtypinst.o \
c_code/2_10/compiler_sigmatch.o \
c_code/2_10/compiler_parampatterns.o \
c_code/2_10/compiler_pretty.o \
c_code/2_10/compiler_docgen.o \
c_code/2_10/docutils_rstast.o \
c_code/2_10/stdlib_json.o \
c_code/2_10/stdlib_unicode.o \
c_code/2_10/docutils_rst.o \
c_code/2_10/docutils_rstgen.o \
c_code/2_10/docutils_highlite.o \
c_code/2_10/stdlib_sequtils.o \
c_code/2_10/stdlib_algorithm.o \
c_code/2_10/compiler_sempass2.o \
c_code/2_10/compiler_guards.o \
c_code/2_10/compiler_writetracking.o \
c_code/2_10/stdlib_xmltree.o \
c_code/2_10/stdlib_cgi.o \
c_code/2_10/stdlib_cookies.o \
c_code/2_10/compiler_typesrenderer.o \
c_code/2_10/compiler_transf.o \
c_code/2_10/compiler_cgmeth.o \
c_code/2_10/compiler_lambdalifting.o \
c_code/2_10/compiler_lowerings.o \
c_code/2_10/compiler_vm.o \
c_code/2_10/compiler_vmgen.o \
c_code/2_10/compiler_vmdeps.o \
c_code/2_10/compiler_vmmarshal.o \
c_code/2_10/compiler_evaltempl.o \
c_code/2_10/compiler_aliases.o \
c_code/2_10/compiler_patterns.o \
c_code/2_10/compiler_semmacrosanity.o \
c_code/2_10/compiler_semparallel.o \
c_code/2_10/compiler_pluginsupport.o \
c_code/2_10/compiler_active.o \
c_code/2_10/compiler_locals.o \
c_code/2_10/compiler_itersgen.o \
c_code/2_10/compiler_cgen.o \
c_code/2_10/compiler_ccgutils.o \
c_code/2_10/compiler_cgendata.o \
c_code/2_10/compiler_ccgmerge.o \
c_code/2_10/compiler_jsgen.o \
c_code/2_10/compiler_passaux.o \
c_code/2_10/compiler_depends.o \
c_code/2_10/compiler_docgen2.o \
c_code/2_10/compiler_service.o \
c_code/2_10/stdlib_net.o \
c_code/2_10/stdlib_nativesockets.o \
c_code/2_10/compiler_modules.o \
c_code/2_10/compiler_nodejs.o \
c_code/2_10/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  *)
    echo 2>&1 "Error: no C code generated for: [$myos: $mycpu]"
    exit 1
    ;;
  esac
  ;;
macosx) 
  case $mycpu in
  i386)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_nim.c -o c_code/3_1/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_system.c -o c_code/3_1/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_testability.c -o c_code/3_1/compiler_testability.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_commands.c -o c_code/3_1/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_os.c -o c_code/3_1/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_strutils.c -o c_code/3_1/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_parseutils.c -o c_code/3_1/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_times.c -o c_code/3_1/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_posix.c -o c_code/3_1/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_msgs.c -o c_code/3_1/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_options.c -o c_code/3_1/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_lists.c -o c_code/3_1/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_strtabs.c -o c_code/3_1/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_hashes.c -o c_code/3_1/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_etcpriv.c -o c_code/3_1/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_osproc.c -o c_code/3_1/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_streams.c -o c_code/3_1/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_cpuinfo.c -o c_code/3_1/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_sets.c -o c_code/3_1/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_math.c -o c_code/3_1/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_tables.c -o c_code/3_1/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_ropes.c -o c_code/3_1/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_platform.c -o c_code/3_1/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_terminal.c -o c_code/3_1/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_macros.c -o c_code/3_1/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_termios.c -o c_code/3_1/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_nversion.c -o c_code/3_1/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_condsyms.c -o c_code/3_1/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_idents.c -o c_code/3_1/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_extccomp.c -o c_code/3_1/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_securehash.c -o c_code/3_1/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_unsigned.c -o c_code/3_1/stdlib_unsigned.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_wordrecg.c -o c_code/3_1/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_nimblecmd.c -o c_code/3_1/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_parseopt.c -o c_code/3_1/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_lexer.c -o c_code/3_1/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_nimlexbase.c -o c_code/3_1/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_llstream.c -o c_code/3_1/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_nimconf.c -o c_code/3_1/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_main.c -o c_code/3_1/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_ast.c -o c_code/3_1/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_intsets.c -o c_code/3_1/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_idgen.c -o c_code/3_1/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_astalgo.c -o c_code/3_1/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_rodutils.c -o c_code/3_1/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_syntaxes.c -o c_code/3_1/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_parser.c -o c_code/3_1/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_pbraces.c -o c_code/3_1/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_filters.c -o c_code/3_1/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_renderer.c -o c_code/3_1/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_filter_tmpl.c -o c_code/3_1/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_rodread.c -o c_code/3_1/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_types.c -o c_code/3_1/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_trees.c -o c_code/3_1/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_memfiles.c -o c_code/3_1/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_rodwrite.c -o c_code/3_1/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_passes.c -o c_code/3_1/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_magicsys.c -o c_code/3_1/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_nimsets.c -o c_code/3_1/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_bitsets.c -o c_code/3_1/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_importer.c -o c_code/3_1/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_lookups.c -o c_code/3_1/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_semdata.c -o c_code/3_1/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_treetab.c -o c_code/3_1/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_vmdef.c -o c_code/3_1/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_prettybase.c -o c_code/3_1/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_lexbase.c -o c_code/3_1/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_sem.c -o c_code/3_1/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_semfold.c -o c_code/3_1/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_saturate.c -o c_code/3_1/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_procfind.c -o c_code/3_1/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_pragmas.c -o c_code/3_1/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_semtypinst.c -o c_code/3_1/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_sigmatch.c -o c_code/3_1/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_parampatterns.c -o c_code/3_1/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_pretty.c -o c_code/3_1/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_docgen.c -o c_code/3_1/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/docutils_rstast.c -o c_code/3_1/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_json.c -o c_code/3_1/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_unicode.c -o c_code/3_1/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/docutils_rst.c -o c_code/3_1/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/docutils_rstgen.c -o c_code/3_1/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/docutils_highlite.c -o c_code/3_1/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_sequtils.c -o c_code/3_1/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_algorithm.c -o c_code/3_1/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_sempass2.c -o c_code/3_1/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_guards.c -o c_code/3_1/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_writetracking.c -o c_code/3_1/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_xmltree.c -o c_code/3_1/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_cgi.c -o c_code/3_1/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_cookies.c -o c_code/3_1/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_typesrenderer.c -o c_code/3_1/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_transf.c -o c_code/3_1/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_cgmeth.c -o c_code/3_1/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_lambdalifting.c -o c_code/3_1/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_lowerings.c -o c_code/3_1/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_vm.c -o c_code/3_1/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_vmgen.c -o c_code/3_1/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_vmdeps.c -o c_code/3_1/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_vmmarshal.c -o c_code/3_1/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_evaltempl.c -o c_code/3_1/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_aliases.c -o c_code/3_1/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_patterns.c -o c_code/3_1/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_semmacrosanity.c -o c_code/3_1/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_semparallel.c -o c_code/3_1/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_pluginsupport.c -o c_code/3_1/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_active.c -o c_code/3_1/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_locals.c -o c_code/3_1/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_itersgen.c -o c_code/3_1/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_cgen.c -o c_code/3_1/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_ccgutils.c -o c_code/3_1/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_cgendata.c -o c_code/3_1/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_ccgmerge.c -o c_code/3_1/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_jsgen.c -o c_code/3_1/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_passaux.c -o c_code/3_1/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_depends.c -o c_code/3_1/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_docgen2.c -o c_code/3_1/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_service.c -o c_code/3_1/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_net.c -o c_code/3_1/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_nativesockets.c -o c_code/3_1/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_modules.c -o c_code/3_1/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_nodejs.c -o c_code/3_1/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_scriptconfig.c -o c_code/3_1/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/3_1/compiler_nim.o \
c_code/3_1/stdlib_system.o \
c_code/3_1/compiler_testability.o \
c_code/3_1/compiler_commands.o \
c_code/3_1/stdlib_os.o \
c_code/3_1/stdlib_strutils.o \
c_code/3_1/stdlib_parseutils.o \
c_code/3_1/stdlib_times.o \
c_code/3_1/stdlib_posix.o \
c_code/3_1/compiler_msgs.o \
c_code/3_1/compiler_options.o \
c_code/3_1/compiler_lists.o \
c_code/3_1/stdlib_strtabs.o \
c_code/3_1/stdlib_hashes.o \
c_code/3_1/stdlib_etcpriv.o \
c_code/3_1/stdlib_osproc.o \
c_code/3_1/stdlib_streams.o \
c_code/3_1/stdlib_cpuinfo.o \
c_code/3_1/stdlib_sets.o \
c_code/3_1/stdlib_math.o \
c_code/3_1/stdlib_tables.o \
c_code/3_1/compiler_ropes.o \
c_code/3_1/compiler_platform.o \
c_code/3_1/stdlib_terminal.o \
c_code/3_1/stdlib_macros.o \
c_code/3_1/stdlib_termios.o \
c_code/3_1/compiler_nversion.o \
c_code/3_1/compiler_condsyms.o \
c_code/3_1/compiler_idents.o \
c_code/3_1/compiler_extccomp.o \
c_code/3_1/stdlib_securehash.o \
c_code/3_1/stdlib_unsigned.o \
c_code/3_1/compiler_wordrecg.o \
c_code/3_1/compiler_nimblecmd.o \
c_code/3_1/stdlib_parseopt.o \
c_code/3_1/compiler_lexer.o \
c_code/3_1/compiler_nimlexbase.o \
c_code/3_1/compiler_llstream.o \
c_code/3_1/compiler_nimconf.o \
c_code/3_1/compiler_main.o \
c_code/3_1/compiler_ast.o \
c_code/3_1/stdlib_intsets.o \
c_code/3_1/compiler_idgen.o \
c_code/3_1/compiler_astalgo.o \
c_code/3_1/compiler_rodutils.o \
c_code/3_1/compiler_syntaxes.o \
c_code/3_1/compiler_parser.o \
c_code/3_1/compiler_pbraces.o \
c_code/3_1/compiler_filters.o \
c_code/3_1/compiler_renderer.o \
c_code/3_1/compiler_filter_tmpl.o \
c_code/3_1/compiler_rodread.o \
c_code/3_1/compiler_types.o \
c_code/3_1/compiler_trees.o \
c_code/3_1/stdlib_memfiles.o \
c_code/3_1/compiler_rodwrite.o \
c_code/3_1/compiler_passes.o \
c_code/3_1/compiler_magicsys.o \
c_code/3_1/compiler_nimsets.o \
c_code/3_1/compiler_bitsets.o \
c_code/3_1/compiler_importer.o \
c_code/3_1/compiler_lookups.o \
c_code/3_1/compiler_semdata.o \
c_code/3_1/compiler_treetab.o \
c_code/3_1/compiler_vmdef.o \
c_code/3_1/compiler_prettybase.o \
c_code/3_1/stdlib_lexbase.o \
c_code/3_1/compiler_sem.o \
c_code/3_1/compiler_semfold.o \
c_code/3_1/compiler_saturate.o \
c_code/3_1/compiler_procfind.o \
c_code/3_1/compiler_pragmas.o \
c_code/3_1/compiler_semtypinst.o \
c_code/3_1/compiler_sigmatch.o \
c_code/3_1/compiler_parampatterns.o \
c_code/3_1/compiler_pretty.o \
c_code/3_1/compiler_docgen.o \
c_code/3_1/docutils_rstast.o \
c_code/3_1/stdlib_json.o \
c_code/3_1/stdlib_unicode.o \
c_code/3_1/docutils_rst.o \
c_code/3_1/docutils_rstgen.o \
c_code/3_1/docutils_highlite.o \
c_code/3_1/stdlib_sequtils.o \
c_code/3_1/stdlib_algorithm.o \
c_code/3_1/compiler_sempass2.o \
c_code/3_1/compiler_guards.o \
c_code/3_1/compiler_writetracking.o \
c_code/3_1/stdlib_xmltree.o \
c_code/3_1/stdlib_cgi.o \
c_code/3_1/stdlib_cookies.o \
c_code/3_1/compiler_typesrenderer.o \
c_code/3_1/compiler_transf.o \
c_code/3_1/compiler_cgmeth.o \
c_code/3_1/compiler_lambdalifting.o \
c_code/3_1/compiler_lowerings.o \
c_code/3_1/compiler_vm.o \
c_code/3_1/compiler_vmgen.o \
c_code/3_1/compiler_vmdeps.o \
c_code/3_1/compiler_vmmarshal.o \
c_code/3_1/compiler_evaltempl.o \
c_code/3_1/compiler_aliases.o \
c_code/3_1/compiler_patterns.o \
c_code/3_1/compiler_semmacrosanity.o \
c_code/3_1/compiler_semparallel.o \
c_code/3_1/compiler_pluginsupport.o \
c_code/3_1/compiler_active.o \
c_code/3_1/compiler_locals.o \
c_code/3_1/compiler_itersgen.o \
c_code/3_1/compiler_cgen.o \
c_code/3_1/compiler_ccgutils.o \
c_code/3_1/compiler_cgendata.o \
c_code/3_1/compiler_ccgmerge.o \
c_code/3_1/compiler_jsgen.o \
c_code/3_1/compiler_passaux.o \
c_code/3_1/compiler_depends.o \
c_code/3_1/compiler_docgen2.o \
c_code/3_1/compiler_service.o \
c_code/3_1/stdlib_net.o \
c_code/3_1/stdlib_nativesockets.o \
c_code/3_1/compiler_modules.o \
c_code/3_1/compiler_nodejs.o \
c_code/3_1/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  amd64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_nim.c -o c_code/3_2/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_system.c -o c_code/3_2/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_testability.c -o c_code/3_2/compiler_testability.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_commands.c -o c_code/3_2/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_os.c -o c_code/3_2/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_strutils.c -o c_code/3_2/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_parseutils.c -o c_code/3_2/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_times.c -o c_code/3_2/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_posix.c -o c_code/3_2/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_msgs.c -o c_code/3_2/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_options.c -o c_code/3_2/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_lists.c -o c_code/3_2/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_strtabs.c -o c_code/3_2/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_hashes.c -o c_code/3_2/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_etcpriv.c -o c_code/3_2/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_osproc.c -o c_code/3_2/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_streams.c -o c_code/3_2/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_cpuinfo.c -o c_code/3_2/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_sets.c -o c_code/3_2/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_math.c -o c_code/3_2/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_tables.c -o c_code/3_2/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_ropes.c -o c_code/3_2/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_platform.c -o c_code/3_2/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_terminal.c -o c_code/3_2/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_macros.c -o c_code/3_2/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_termios.c -o c_code/3_2/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_nversion.c -o c_code/3_2/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_condsyms.c -o c_code/3_2/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_idents.c -o c_code/3_2/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_extccomp.c -o c_code/3_2/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_securehash.c -o c_code/3_2/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_unsigned.c -o c_code/3_2/stdlib_unsigned.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_wordrecg.c -o c_code/3_2/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_nimblecmd.c -o c_code/3_2/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_parseopt.c -o c_code/3_2/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_lexer.c -o c_code/3_2/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_nimlexbase.c -o c_code/3_2/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_llstream.c -o c_code/3_2/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_nimconf.c -o c_code/3_2/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_main.c -o c_code/3_2/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_ast.c -o c_code/3_2/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_intsets.c -o c_code/3_2/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_idgen.c -o c_code/3_2/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_astalgo.c -o c_code/3_2/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_rodutils.c -o c_code/3_2/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_syntaxes.c -o c_code/3_2/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_parser.c -o c_code/3_2/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_pbraces.c -o c_code/3_2/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_filters.c -o c_code/3_2/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_renderer.c -o c_code/3_2/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_filter_tmpl.c -o c_code/3_2/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_rodread.c -o c_code/3_2/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_types.c -o c_code/3_2/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_trees.c -o c_code/3_2/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_memfiles.c -o c_code/3_2/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_rodwrite.c -o c_code/3_2/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_passes.c -o c_code/3_2/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_magicsys.c -o c_code/3_2/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_nimsets.c -o c_code/3_2/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_bitsets.c -o c_code/3_2/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_importer.c -o c_code/3_2/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_lookups.c -o c_code/3_2/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_semdata.c -o c_code/3_2/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_treetab.c -o c_code/3_2/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_vmdef.c -o c_code/3_2/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_prettybase.c -o c_code/3_2/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_lexbase.c -o c_code/3_2/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_sem.c -o c_code/3_2/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_semfold.c -o c_code/3_2/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_saturate.c -o c_code/3_2/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_procfind.c -o c_code/3_2/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_pragmas.c -o c_code/3_2/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_semtypinst.c -o c_code/3_2/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_sigmatch.c -o c_code/3_2/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_parampatterns.c -o c_code/3_2/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_pretty.c -o c_code/3_2/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_docgen.c -o c_code/3_2/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/docutils_rstast.c -o c_code/3_2/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_json.c -o c_code/3_2/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_unicode.c -o c_code/3_2/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/docutils_rst.c -o c_code/3_2/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/docutils_rstgen.c -o c_code/3_2/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/docutils_highlite.c -o c_code/3_2/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_sequtils.c -o c_code/3_2/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_algorithm.c -o c_code/3_2/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_sempass2.c -o c_code/3_2/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_guards.c -o c_code/3_2/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_writetracking.c -o c_code/3_2/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_xmltree.c -o c_code/3_2/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_cgi.c -o c_code/3_2/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_cookies.c -o c_code/3_2/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_typesrenderer.c -o c_code/3_2/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_transf.c -o c_code/3_2/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_cgmeth.c -o c_code/3_2/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_lambdalifting.c -o c_code/3_2/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_lowerings.c -o c_code/3_2/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_vm.c -o c_code/3_2/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_vmgen.c -o c_code/3_2/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_vmdeps.c -o c_code/3_2/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_vmmarshal.c -o c_code/3_2/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_evaltempl.c -o c_code/3_2/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_aliases.c -o c_code/3_2/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_patterns.c -o c_code/3_2/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_semmacrosanity.c -o c_code/3_2/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_semparallel.c -o c_code/3_2/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_pluginsupport.c -o c_code/3_2/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_active.c -o c_code/3_2/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_locals.c -o c_code/3_2/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_itersgen.c -o c_code/3_2/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_cgen.c -o c_code/3_2/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_ccgutils.c -o c_code/3_2/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_cgendata.c -o c_code/3_2/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_ccgmerge.c -o c_code/3_2/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_jsgen.c -o c_code/3_2/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_passaux.c -o c_code/3_2/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_depends.c -o c_code/3_2/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_docgen2.c -o c_code/3_2/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_service.c -o c_code/3_2/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_net.c -o c_code/3_2/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_nativesockets.c -o c_code/3_2/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_modules.c -o c_code/3_2/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_nodejs.c -o c_code/3_2/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_scriptconfig.c -o c_code/3_2/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/3_2/compiler_nim.o \
c_code/3_2/stdlib_system.o \
c_code/3_2/compiler_testability.o \
c_code/3_2/compiler_commands.o \
c_code/3_2/stdlib_os.o \
c_code/3_2/stdlib_strutils.o \
c_code/3_2/stdlib_parseutils.o \
c_code/3_2/stdlib_times.o \
c_code/3_2/stdlib_posix.o \
c_code/3_2/compiler_msgs.o \
c_code/3_2/compiler_options.o \
c_code/3_2/compiler_lists.o \
c_code/3_2/stdlib_strtabs.o \
c_code/3_2/stdlib_hashes.o \
c_code/3_2/stdlib_etcpriv.o \
c_code/3_2/stdlib_osproc.o \
c_code/3_2/stdlib_streams.o \
c_code/3_2/stdlib_cpuinfo.o \
c_code/3_2/stdlib_sets.o \
c_code/3_2/stdlib_math.o \
c_code/3_2/stdlib_tables.o \
c_code/3_2/compiler_ropes.o \
c_code/3_2/compiler_platform.o \
c_code/3_2/stdlib_terminal.o \
c_code/3_2/stdlib_macros.o \
c_code/3_2/stdlib_termios.o \
c_code/3_2/compiler_nversion.o \
c_code/3_2/compiler_condsyms.o \
c_code/3_2/compiler_idents.o \
c_code/3_2/compiler_extccomp.o \
c_code/3_2/stdlib_securehash.o \
c_code/3_2/stdlib_unsigned.o \
c_code/3_2/compiler_wordrecg.o \
c_code/3_2/compiler_nimblecmd.o \
c_code/3_2/stdlib_parseopt.o \
c_code/3_2/compiler_lexer.o \
c_code/3_2/compiler_nimlexbase.o \
c_code/3_2/compiler_llstream.o \
c_code/3_2/compiler_nimconf.o \
c_code/3_2/compiler_main.o \
c_code/3_2/compiler_ast.o \
c_code/3_2/stdlib_intsets.o \
c_code/3_2/compiler_idgen.o \
c_code/3_2/compiler_astalgo.o \
c_code/3_2/compiler_rodutils.o \
c_code/3_2/compiler_syntaxes.o \
c_code/3_2/compiler_parser.o \
c_code/3_2/compiler_pbraces.o \
c_code/3_2/compiler_filters.o \
c_code/3_2/compiler_renderer.o \
c_code/3_2/compiler_filter_tmpl.o \
c_code/3_2/compiler_rodread.o \
c_code/3_2/compiler_types.o \
c_code/3_2/compiler_trees.o \
c_code/3_2/stdlib_memfiles.o \
c_code/3_2/compiler_rodwrite.o \
c_code/3_2/compiler_passes.o \
c_code/3_2/compiler_magicsys.o \
c_code/3_2/compiler_nimsets.o \
c_code/3_2/compiler_bitsets.o \
c_code/3_2/compiler_importer.o \
c_code/3_2/compiler_lookups.o \
c_code/3_2/compiler_semdata.o \
c_code/3_2/compiler_treetab.o \
c_code/3_2/compiler_vmdef.o \
c_code/3_2/compiler_prettybase.o \
c_code/3_2/stdlib_lexbase.o \
c_code/3_2/compiler_sem.o \
c_code/3_2/compiler_semfold.o \
c_code/3_2/compiler_saturate.o \
c_code/3_2/compiler_procfind.o \
c_code/3_2/compiler_pragmas.o \
c_code/3_2/compiler_semtypinst.o \
c_code/3_2/compiler_sigmatch.o \
c_code/3_2/compiler_parampatterns.o \
c_code/3_2/compiler_pretty.o \
c_code/3_2/compiler_docgen.o \
c_code/3_2/docutils_rstast.o \
c_code/3_2/stdlib_json.o \
c_code/3_2/stdlib_unicode.o \
c_code/3_2/docutils_rst.o \
c_code/3_2/docutils_rstgen.o \
c_code/3_2/docutils_highlite.o \
c_code/3_2/stdlib_sequtils.o \
c_code/3_2/stdlib_algorithm.o \
c_code/3_2/compiler_sempass2.o \
c_code/3_2/compiler_guards.o \
c_code/3_2/compiler_writetracking.o \
c_code/3_2/stdlib_xmltree.o \
c_code/3_2/stdlib_cgi.o \
c_code/3_2/stdlib_cookies.o \
c_code/3_2/compiler_typesrenderer.o \
c_code/3_2/compiler_transf.o \
c_code/3_2/compiler_cgmeth.o \
c_code/3_2/compiler_lambdalifting.o \
c_code/3_2/compiler_lowerings.o \
c_code/3_2/compiler_vm.o \
c_code/3_2/compiler_vmgen.o \
c_code/3_2/compiler_vmdeps.o \
c_code/3_2/compiler_vmmarshal.o \
c_code/3_2/compiler_evaltempl.o \
c_code/3_2/compiler_aliases.o \
c_code/3_2/compiler_patterns.o \
c_code/3_2/compiler_semmacrosanity.o \
c_code/3_2/compiler_semparallel.o \
c_code/3_2/compiler_pluginsupport.o \
c_code/3_2/compiler_active.o \
c_code/3_2/compiler_locals.o \
c_code/3_2/compiler_itersgen.o \
c_code/3_2/compiler_cgen.o \
c_code/3_2/compiler_ccgutils.o \
c_code/3_2/compiler_cgendata.o \
c_code/3_2/compiler_ccgmerge.o \
c_code/3_2/compiler_jsgen.o \
c_code/3_2/compiler_passaux.o \
c_code/3_2/compiler_depends.o \
c_code/3_2/compiler_docgen2.o \
c_code/3_2/compiler_service.o \
c_code/3_2/stdlib_net.o \
c_code/3_2/stdlib_nativesockets.o \
c_code/3_2/compiler_modules.o \
c_code/3_2/compiler_nodejs.o \
c_code/3_2/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  powerpc64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_nim.c -o c_code/3_3/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_system.c -o c_code/3_3/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_testability.c -o c_code/3_3/compiler_testability.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_commands.c -o c_code/3_3/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_os.c -o c_code/3_3/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_strutils.c -o c_code/3_3/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_parseutils.c -o c_code/3_3/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_times.c -o c_code/3_3/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_posix.c -o c_code/3_3/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_msgs.c -o c_code/3_3/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_options.c -o c_code/3_3/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_lists.c -o c_code/3_3/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_strtabs.c -o c_code/3_3/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_hashes.c -o c_code/3_3/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_etcpriv.c -o c_code/3_3/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_osproc.c -o c_code/3_3/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_streams.c -o c_code/3_3/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_cpuinfo.c -o c_code/3_3/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_sets.c -o c_code/3_3/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_math.c -o c_code/3_3/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_tables.c -o c_code/3_3/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_ropes.c -o c_code/3_3/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_platform.c -o c_code/3_3/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_terminal.c -o c_code/3_3/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_macros.c -o c_code/3_3/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_termios.c -o c_code/3_3/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_nversion.c -o c_code/3_3/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_condsyms.c -o c_code/3_3/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_idents.c -o c_code/3_3/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_extccomp.c -o c_code/3_3/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_securehash.c -o c_code/3_3/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_unsigned.c -o c_code/3_3/stdlib_unsigned.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_wordrecg.c -o c_code/3_3/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_nimblecmd.c -o c_code/3_3/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_parseopt.c -o c_code/3_3/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_lexer.c -o c_code/3_3/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_nimlexbase.c -o c_code/3_3/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_llstream.c -o c_code/3_3/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_nimconf.c -o c_code/3_3/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_main.c -o c_code/3_3/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_ast.c -o c_code/3_3/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_intsets.c -o c_code/3_3/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_idgen.c -o c_code/3_3/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_astalgo.c -o c_code/3_3/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_rodutils.c -o c_code/3_3/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_syntaxes.c -o c_code/3_3/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_parser.c -o c_code/3_3/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_pbraces.c -o c_code/3_3/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_filters.c -o c_code/3_3/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_renderer.c -o c_code/3_3/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_filter_tmpl.c -o c_code/3_3/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_rodread.c -o c_code/3_3/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_types.c -o c_code/3_3/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_trees.c -o c_code/3_3/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_memfiles.c -o c_code/3_3/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_rodwrite.c -o c_code/3_3/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_passes.c -o c_code/3_3/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_magicsys.c -o c_code/3_3/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_nimsets.c -o c_code/3_3/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_bitsets.c -o c_code/3_3/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_importer.c -o c_code/3_3/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_lookups.c -o c_code/3_3/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_semdata.c -o c_code/3_3/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_treetab.c -o c_code/3_3/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_vmdef.c -o c_code/3_3/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_prettybase.c -o c_code/3_3/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_lexbase.c -o c_code/3_3/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_sem.c -o c_code/3_3/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_semfold.c -o c_code/3_3/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_saturate.c -o c_code/3_3/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_procfind.c -o c_code/3_3/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_pragmas.c -o c_code/3_3/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_semtypinst.c -o c_code/3_3/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_sigmatch.c -o c_code/3_3/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_parampatterns.c -o c_code/3_3/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_pretty.c -o c_code/3_3/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_docgen.c -o c_code/3_3/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/docutils_rstast.c -o c_code/3_3/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_json.c -o c_code/3_3/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_unicode.c -o c_code/3_3/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/docutils_rst.c -o c_code/3_3/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/docutils_rstgen.c -o c_code/3_3/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/docutils_highlite.c -o c_code/3_3/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_sequtils.c -o c_code/3_3/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_algorithm.c -o c_code/3_3/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_sempass2.c -o c_code/3_3/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_guards.c -o c_code/3_3/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_writetracking.c -o c_code/3_3/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_xmltree.c -o c_code/3_3/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_cgi.c -o c_code/3_3/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_cookies.c -o c_code/3_3/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_typesrenderer.c -o c_code/3_3/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_transf.c -o c_code/3_3/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_cgmeth.c -o c_code/3_3/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_lambdalifting.c -o c_code/3_3/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_lowerings.c -o c_code/3_3/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_vm.c -o c_code/3_3/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_vmgen.c -o c_code/3_3/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_vmdeps.c -o c_code/3_3/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_vmmarshal.c -o c_code/3_3/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_evaltempl.c -o c_code/3_3/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_aliases.c -o c_code/3_3/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_patterns.c -o c_code/3_3/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_semmacrosanity.c -o c_code/3_3/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_semparallel.c -o c_code/3_3/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_pluginsupport.c -o c_code/3_3/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_active.c -o c_code/3_3/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_locals.c -o c_code/3_3/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_itersgen.c -o c_code/3_3/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_cgen.c -o c_code/3_3/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_ccgutils.c -o c_code/3_3/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_cgendata.c -o c_code/3_3/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_ccgmerge.c -o c_code/3_3/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_jsgen.c -o c_code/3_3/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_passaux.c -o c_code/3_3/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_depends.c -o c_code/3_3/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_docgen2.c -o c_code/3_3/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_service.c -o c_code/3_3/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_net.c -o c_code/3_3/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_nativesockets.c -o c_code/3_3/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_modules.c -o c_code/3_3/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_nodejs.c -o c_code/3_3/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_scriptconfig.c -o c_code/3_3/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/3_3/compiler_nim.o \
c_code/3_3/stdlib_system.o \
c_code/3_3/compiler_testability.o \
c_code/3_3/compiler_commands.o \
c_code/3_3/stdlib_os.o \
c_code/3_3/stdlib_strutils.o \
c_code/3_3/stdlib_parseutils.o \
c_code/3_3/stdlib_times.o \
c_code/3_3/stdlib_posix.o \
c_code/3_3/compiler_msgs.o \
c_code/3_3/compiler_options.o \
c_code/3_3/compiler_lists.o \
c_code/3_3/stdlib_strtabs.o \
c_code/3_3/stdlib_hashes.o \
c_code/3_3/stdlib_etcpriv.o \
c_code/3_3/stdlib_osproc.o \
c_code/3_3/stdlib_streams.o \
c_code/3_3/stdlib_cpuinfo.o \
c_code/3_3/stdlib_sets.o \
c_code/3_3/stdlib_math.o \
c_code/3_3/stdlib_tables.o \
c_code/3_3/compiler_ropes.o \
c_code/3_3/compiler_platform.o \
c_code/3_3/stdlib_terminal.o \
c_code/3_3/stdlib_macros.o \
c_code/3_3/stdlib_termios.o \
c_code/3_3/compiler_nversion.o \
c_code/3_3/compiler_condsyms.o \
c_code/3_3/compiler_idents.o \
c_code/3_3/compiler_extccomp.o \
c_code/3_3/stdlib_securehash.o \
c_code/3_3/stdlib_unsigned.o \
c_code/3_3/compiler_wordrecg.o \
c_code/3_3/compiler_nimblecmd.o \
c_code/3_3/stdlib_parseopt.o \
c_code/3_3/compiler_lexer.o \
c_code/3_3/compiler_nimlexbase.o \
c_code/3_3/compiler_llstream.o \
c_code/3_3/compiler_nimconf.o \
c_code/3_3/compiler_main.o \
c_code/3_3/compiler_ast.o \
c_code/3_3/stdlib_intsets.o \
c_code/3_3/compiler_idgen.o \
c_code/3_3/compiler_astalgo.o \
c_code/3_3/compiler_rodutils.o \
c_code/3_3/compiler_syntaxes.o \
c_code/3_3/compiler_parser.o \
c_code/3_3/compiler_pbraces.o \
c_code/3_3/compiler_filters.o \
c_code/3_3/compiler_renderer.o \
c_code/3_3/compiler_filter_tmpl.o \
c_code/3_3/compiler_rodread.o \
c_code/3_3/compiler_types.o \
c_code/3_3/compiler_trees.o \
c_code/3_3/stdlib_memfiles.o \
c_code/3_3/compiler_rodwrite.o \
c_code/3_3/compiler_passes.o \
c_code/3_3/compiler_magicsys.o \
c_code/3_3/compiler_nimsets.o \
c_code/3_3/compiler_bitsets.o \
c_code/3_3/compiler_importer.o \
c_code/3_3/compiler_lookups.o \
c_code/3_3/compiler_semdata.o \
c_code/3_3/compiler_treetab.o \
c_code/3_3/compiler_vmdef.o \
c_code/3_3/compiler_prettybase.o \
c_code/3_3/stdlib_lexbase.o \
c_code/3_3/compiler_sem.o \
c_code/3_3/compiler_semfold.o \
c_code/3_3/compiler_saturate.o \
c_code/3_3/compiler_procfind.o \
c_code/3_3/compiler_pragmas.o \
c_code/3_3/compiler_semtypinst.o \
c_code/3_3/compiler_sigmatch.o \
c_code/3_3/compiler_parampatterns.o \
c_code/3_3/compiler_pretty.o \
c_code/3_3/compiler_docgen.o \
c_code/3_3/docutils_rstast.o \
c_code/3_3/stdlib_json.o \
c_code/3_3/stdlib_unicode.o \
c_code/3_3/docutils_rst.o \
c_code/3_3/docutils_rstgen.o \
c_code/3_3/docutils_highlite.o \
c_code/3_3/stdlib_sequtils.o \
c_code/3_3/stdlib_algorithm.o \
c_code/3_3/compiler_sempass2.o \
c_code/3_3/compiler_guards.o \
c_code/3_3/compiler_writetracking.o \
c_code/3_3/stdlib_xmltree.o \
c_code/3_3/stdlib_cgi.o \
c_code/3_3/stdlib_cookies.o \
c_code/3_3/compiler_typesrenderer.o \
c_code/3_3/compiler_transf.o \
c_code/3_3/compiler_cgmeth.o \
c_code/3_3/compiler_lambdalifting.o \
c_code/3_3/compiler_lowerings.o \
c_code/3_3/compiler_vm.o \
c_code/3_3/compiler_vmgen.o \
c_code/3_3/compiler_vmdeps.o \
c_code/3_3/compiler_vmmarshal.o \
c_code/3_3/compiler_evaltempl.o \
c_code/3_3/compiler_aliases.o \
c_code/3_3/compiler_patterns.o \
c_code/3_3/compiler_semmacrosanity.o \
c_code/3_3/compiler_semparallel.o \
c_code/3_3/compiler_pluginsupport.o \
c_code/3_3/compiler_active.o \
c_code/3_3/compiler_locals.o \
c_code/3_3/compiler_itersgen.o \
c_code/3_3/compiler_cgen.o \
c_code/3_3/compiler_ccgutils.o \
c_code/3_3/compiler_cgendata.o \
c_code/3_3/compiler_ccgmerge.o \
c_code/3_3/compiler_jsgen.o \
c_code/3_3/compiler_passaux.o \
c_code/3_3/compiler_depends.o \
c_code/3_3/compiler_docgen2.o \
c_code/3_3/compiler_service.o \
c_code/3_3/stdlib_net.o \
c_code/3_3/stdlib_nativesockets.o \
c_code/3_3/compiler_modules.o \
c_code/3_3/compiler_nodejs.o \
c_code/3_3/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  arm)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  mips)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  mipsel)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc64el)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  arm64)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  *)
    echo 2>&1 "Error: no C code generated for: [$myos: $mycpu]"
    exit 1
    ;;
  esac
  ;;
solaris) 
  case $mycpu in
  i386)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_nim.c -o c_code/4_1/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_system.c -o c_code/4_1/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_testability.c -o c_code/4_1/compiler_testability.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_commands.c -o c_code/4_1/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_os.c -o c_code/4_1/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_strutils.c -o c_code/4_1/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_parseutils.c -o c_code/4_1/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_times.c -o c_code/4_1/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_posix.c -o c_code/4_1/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_msgs.c -o c_code/4_1/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_options.c -o c_code/4_1/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_lists.c -o c_code/4_1/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_strtabs.c -o c_code/4_1/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_hashes.c -o c_code/4_1/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_etcpriv.c -o c_code/4_1/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_osproc.c -o c_code/4_1/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_streams.c -o c_code/4_1/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_cpuinfo.c -o c_code/4_1/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_sets.c -o c_code/4_1/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_math.c -o c_code/4_1/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_tables.c -o c_code/4_1/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_ropes.c -o c_code/4_1/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_platform.c -o c_code/4_1/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_terminal.c -o c_code/4_1/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_macros.c -o c_code/4_1/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_termios.c -o c_code/4_1/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_nversion.c -o c_code/4_1/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_condsyms.c -o c_code/4_1/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_idents.c -o c_code/4_1/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_extccomp.c -o c_code/4_1/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_securehash.c -o c_code/4_1/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_unsigned.c -o c_code/4_1/stdlib_unsigned.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_wordrecg.c -o c_code/4_1/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_nimblecmd.c -o c_code/4_1/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_parseopt.c -o c_code/4_1/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_lexer.c -o c_code/4_1/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_nimlexbase.c -o c_code/4_1/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_llstream.c -o c_code/4_1/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_nimconf.c -o c_code/4_1/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_main.c -o c_code/4_1/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_ast.c -o c_code/4_1/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_intsets.c -o c_code/4_1/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_idgen.c -o c_code/4_1/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_astalgo.c -o c_code/4_1/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_rodutils.c -o c_code/4_1/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_syntaxes.c -o c_code/4_1/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_parser.c -o c_code/4_1/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_pbraces.c -o c_code/4_1/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_filters.c -o c_code/4_1/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_renderer.c -o c_code/4_1/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_filter_tmpl.c -o c_code/4_1/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_rodread.c -o c_code/4_1/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_types.c -o c_code/4_1/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_trees.c -o c_code/4_1/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_memfiles.c -o c_code/4_1/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_rodwrite.c -o c_code/4_1/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_passes.c -o c_code/4_1/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_magicsys.c -o c_code/4_1/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_nimsets.c -o c_code/4_1/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_bitsets.c -o c_code/4_1/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_importer.c -o c_code/4_1/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_lookups.c -o c_code/4_1/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_semdata.c -o c_code/4_1/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_treetab.c -o c_code/4_1/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_vmdef.c -o c_code/4_1/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_prettybase.c -o c_code/4_1/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_lexbase.c -o c_code/4_1/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_sem.c -o c_code/4_1/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_semfold.c -o c_code/4_1/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_saturate.c -o c_code/4_1/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_procfind.c -o c_code/4_1/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_pragmas.c -o c_code/4_1/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_semtypinst.c -o c_code/4_1/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_sigmatch.c -o c_code/4_1/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_parampatterns.c -o c_code/4_1/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_pretty.c -o c_code/4_1/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_docgen.c -o c_code/4_1/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/docutils_rstast.c -o c_code/4_1/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_json.c -o c_code/4_1/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_unicode.c -o c_code/4_1/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/docutils_rst.c -o c_code/4_1/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/docutils_rstgen.c -o c_code/4_1/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/docutils_highlite.c -o c_code/4_1/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_sequtils.c -o c_code/4_1/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_algorithm.c -o c_code/4_1/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_sempass2.c -o c_code/4_1/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_guards.c -o c_code/4_1/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_writetracking.c -o c_code/4_1/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_xmltree.c -o c_code/4_1/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_cgi.c -o c_code/4_1/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_cookies.c -o c_code/4_1/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_typesrenderer.c -o c_code/4_1/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_transf.c -o c_code/4_1/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_cgmeth.c -o c_code/4_1/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_lambdalifting.c -o c_code/4_1/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_lowerings.c -o c_code/4_1/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_vm.c -o c_code/4_1/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_vmgen.c -o c_code/4_1/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_vmdeps.c -o c_code/4_1/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_vmmarshal.c -o c_code/4_1/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_evaltempl.c -o c_code/4_1/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_aliases.c -o c_code/4_1/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_patterns.c -o c_code/4_1/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_semmacrosanity.c -o c_code/4_1/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_semparallel.c -o c_code/4_1/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_pluginsupport.c -o c_code/4_1/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_active.c -o c_code/4_1/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_locals.c -o c_code/4_1/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_itersgen.c -o c_code/4_1/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_cgen.c -o c_code/4_1/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_ccgutils.c -o c_code/4_1/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_cgendata.c -o c_code/4_1/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_ccgmerge.c -o c_code/4_1/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_jsgen.c -o c_code/4_1/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_passaux.c -o c_code/4_1/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_depends.c -o c_code/4_1/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_docgen2.c -o c_code/4_1/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_service.c -o c_code/4_1/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_net.c -o c_code/4_1/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_nativesockets.c -o c_code/4_1/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_modules.c -o c_code/4_1/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_nodejs.c -o c_code/4_1/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_scriptconfig.c -o c_code/4_1/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/4_1/compiler_nim.o \
c_code/4_1/stdlib_system.o \
c_code/4_1/compiler_testability.o \
c_code/4_1/compiler_commands.o \
c_code/4_1/stdlib_os.o \
c_code/4_1/stdlib_strutils.o \
c_code/4_1/stdlib_parseutils.o \
c_code/4_1/stdlib_times.o \
c_code/4_1/stdlib_posix.o \
c_code/4_1/compiler_msgs.o \
c_code/4_1/compiler_options.o \
c_code/4_1/compiler_lists.o \
c_code/4_1/stdlib_strtabs.o \
c_code/4_1/stdlib_hashes.o \
c_code/4_1/stdlib_etcpriv.o \
c_code/4_1/stdlib_osproc.o \
c_code/4_1/stdlib_streams.o \
c_code/4_1/stdlib_cpuinfo.o \
c_code/4_1/stdlib_sets.o \
c_code/4_1/stdlib_math.o \
c_code/4_1/stdlib_tables.o \
c_code/4_1/compiler_ropes.o \
c_code/4_1/compiler_platform.o \
c_code/4_1/stdlib_terminal.o \
c_code/4_1/stdlib_macros.o \
c_code/4_1/stdlib_termios.o \
c_code/4_1/compiler_nversion.o \
c_code/4_1/compiler_condsyms.o \
c_code/4_1/compiler_idents.o \
c_code/4_1/compiler_extccomp.o \
c_code/4_1/stdlib_securehash.o \
c_code/4_1/stdlib_unsigned.o \
c_code/4_1/compiler_wordrecg.o \
c_code/4_1/compiler_nimblecmd.o \
c_code/4_1/stdlib_parseopt.o \
c_code/4_1/compiler_lexer.o \
c_code/4_1/compiler_nimlexbase.o \
c_code/4_1/compiler_llstream.o \
c_code/4_1/compiler_nimconf.o \
c_code/4_1/compiler_main.o \
c_code/4_1/compiler_ast.o \
c_code/4_1/stdlib_intsets.o \
c_code/4_1/compiler_idgen.o \
c_code/4_1/compiler_astalgo.o \
c_code/4_1/compiler_rodutils.o \
c_code/4_1/compiler_syntaxes.o \
c_code/4_1/compiler_parser.o \
c_code/4_1/compiler_pbraces.o \
c_code/4_1/compiler_filters.o \
c_code/4_1/compiler_renderer.o \
c_code/4_1/compiler_filter_tmpl.o \
c_code/4_1/compiler_rodread.o \
c_code/4_1/compiler_types.o \
c_code/4_1/compiler_trees.o \
c_code/4_1/stdlib_memfiles.o \
c_code/4_1/compiler_rodwrite.o \
c_code/4_1/compiler_passes.o \
c_code/4_1/compiler_magicsys.o \
c_code/4_1/compiler_nimsets.o \
c_code/4_1/compiler_bitsets.o \
c_code/4_1/compiler_importer.o \
c_code/4_1/compiler_lookups.o \
c_code/4_1/compiler_semdata.o \
c_code/4_1/compiler_treetab.o \
c_code/4_1/compiler_vmdef.o \
c_code/4_1/compiler_prettybase.o \
c_code/4_1/stdlib_lexbase.o \
c_code/4_1/compiler_sem.o \
c_code/4_1/compiler_semfold.o \
c_code/4_1/compiler_saturate.o \
c_code/4_1/compiler_procfind.o \
c_code/4_1/compiler_pragmas.o \
c_code/4_1/compiler_semtypinst.o \
c_code/4_1/compiler_sigmatch.o \
c_code/4_1/compiler_parampatterns.o \
c_code/4_1/compiler_pretty.o \
c_code/4_1/compiler_docgen.o \
c_code/4_1/docutils_rstast.o \
c_code/4_1/stdlib_json.o \
c_code/4_1/stdlib_unicode.o \
c_code/4_1/docutils_rst.o \
c_code/4_1/docutils_rstgen.o \
c_code/4_1/docutils_highlite.o \
c_code/4_1/stdlib_sequtils.o \
c_code/4_1/stdlib_algorithm.o \
c_code/4_1/compiler_sempass2.o \
c_code/4_1/compiler_guards.o \
c_code/4_1/compiler_writetracking.o \
c_code/4_1/stdlib_xmltree.o \
c_code/4_1/stdlib_cgi.o \
c_code/4_1/stdlib_cookies.o \
c_code/4_1/compiler_typesrenderer.o \
c_code/4_1/compiler_transf.o \
c_code/4_1/compiler_cgmeth.o \
c_code/4_1/compiler_lambdalifting.o \
c_code/4_1/compiler_lowerings.o \
c_code/4_1/compiler_vm.o \
c_code/4_1/compiler_vmgen.o \
c_code/4_1/compiler_vmdeps.o \
c_code/4_1/compiler_vmmarshal.o \
c_code/4_1/compiler_evaltempl.o \
c_code/4_1/compiler_aliases.o \
c_code/4_1/compiler_patterns.o \
c_code/4_1/compiler_semmacrosanity.o \
c_code/4_1/compiler_semparallel.o \
c_code/4_1/compiler_pluginsupport.o \
c_code/4_1/compiler_active.o \
c_code/4_1/compiler_locals.o \
c_code/4_1/compiler_itersgen.o \
c_code/4_1/compiler_cgen.o \
c_code/4_1/compiler_ccgutils.o \
c_code/4_1/compiler_cgendata.o \
c_code/4_1/compiler_ccgmerge.o \
c_code/4_1/compiler_jsgen.o \
c_code/4_1/compiler_passaux.o \
c_code/4_1/compiler_depends.o \
c_code/4_1/compiler_docgen2.o \
c_code/4_1/compiler_service.o \
c_code/4_1/stdlib_net.o \
c_code/4_1/stdlib_nativesockets.o \
c_code/4_1/compiler_modules.o \
c_code/4_1/compiler_nodejs.o \
c_code/4_1/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  amd64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_nim.c -o c_code/4_2/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_system.c -o c_code/4_2/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_testability.c -o c_code/4_2/compiler_testability.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_commands.c -o c_code/4_2/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_os.c -o c_code/4_2/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_strutils.c -o c_code/4_2/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_parseutils.c -o c_code/4_2/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_times.c -o c_code/4_2/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_posix.c -o c_code/4_2/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_msgs.c -o c_code/4_2/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_options.c -o c_code/4_2/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_lists.c -o c_code/4_2/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_strtabs.c -o c_code/4_2/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_hashes.c -o c_code/4_2/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_etcpriv.c -o c_code/4_2/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_osproc.c -o c_code/4_2/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_streams.c -o c_code/4_2/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_cpuinfo.c -o c_code/4_2/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_sets.c -o c_code/4_2/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_math.c -o c_code/4_2/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_tables.c -o c_code/4_2/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_ropes.c -o c_code/4_2/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_platform.c -o c_code/4_2/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_terminal.c -o c_code/4_2/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_macros.c -o c_code/4_2/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_termios.c -o c_code/4_2/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_nversion.c -o c_code/4_2/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_condsyms.c -o c_code/4_2/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_idents.c -o c_code/4_2/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_extccomp.c -o c_code/4_2/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_securehash.c -o c_code/4_2/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_unsigned.c -o c_code/4_2/stdlib_unsigned.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_wordrecg.c -o c_code/4_2/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_nimblecmd.c -o c_code/4_2/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_parseopt.c -o c_code/4_2/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_lexer.c -o c_code/4_2/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_nimlexbase.c -o c_code/4_2/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_llstream.c -o c_code/4_2/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_nimconf.c -o c_code/4_2/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_main.c -o c_code/4_2/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_ast.c -o c_code/4_2/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_intsets.c -o c_code/4_2/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_idgen.c -o c_code/4_2/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_astalgo.c -o c_code/4_2/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_rodutils.c -o c_code/4_2/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_syntaxes.c -o c_code/4_2/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_parser.c -o c_code/4_2/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_pbraces.c -o c_code/4_2/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_filters.c -o c_code/4_2/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_renderer.c -o c_code/4_2/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_filter_tmpl.c -o c_code/4_2/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_rodread.c -o c_code/4_2/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_types.c -o c_code/4_2/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_trees.c -o c_code/4_2/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_memfiles.c -o c_code/4_2/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_rodwrite.c -o c_code/4_2/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_passes.c -o c_code/4_2/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_magicsys.c -o c_code/4_2/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_nimsets.c -o c_code/4_2/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_bitsets.c -o c_code/4_2/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_importer.c -o c_code/4_2/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_lookups.c -o c_code/4_2/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_semdata.c -o c_code/4_2/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_treetab.c -o c_code/4_2/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_vmdef.c -o c_code/4_2/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_prettybase.c -o c_code/4_2/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_lexbase.c -o c_code/4_2/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_sem.c -o c_code/4_2/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_semfold.c -o c_code/4_2/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_saturate.c -o c_code/4_2/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_procfind.c -o c_code/4_2/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_pragmas.c -o c_code/4_2/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_semtypinst.c -o c_code/4_2/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_sigmatch.c -o c_code/4_2/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_parampatterns.c -o c_code/4_2/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_pretty.c -o c_code/4_2/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_docgen.c -o c_code/4_2/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/docutils_rstast.c -o c_code/4_2/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_json.c -o c_code/4_2/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_unicode.c -o c_code/4_2/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/docutils_rst.c -o c_code/4_2/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/docutils_rstgen.c -o c_code/4_2/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/docutils_highlite.c -o c_code/4_2/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_sequtils.c -o c_code/4_2/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_algorithm.c -o c_code/4_2/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_sempass2.c -o c_code/4_2/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_guards.c -o c_code/4_2/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_writetracking.c -o c_code/4_2/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_xmltree.c -o c_code/4_2/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_cgi.c -o c_code/4_2/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_cookies.c -o c_code/4_2/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_typesrenderer.c -o c_code/4_2/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_transf.c -o c_code/4_2/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_cgmeth.c -o c_code/4_2/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_lambdalifting.c -o c_code/4_2/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_lowerings.c -o c_code/4_2/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_vm.c -o c_code/4_2/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_vmgen.c -o c_code/4_2/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_vmdeps.c -o c_code/4_2/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_vmmarshal.c -o c_code/4_2/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_evaltempl.c -o c_code/4_2/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_aliases.c -o c_code/4_2/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_patterns.c -o c_code/4_2/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_semmacrosanity.c -o c_code/4_2/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_semparallel.c -o c_code/4_2/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_pluginsupport.c -o c_code/4_2/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_active.c -o c_code/4_2/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_locals.c -o c_code/4_2/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_itersgen.c -o c_code/4_2/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_cgen.c -o c_code/4_2/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_ccgutils.c -o c_code/4_2/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_cgendata.c -o c_code/4_2/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_ccgmerge.c -o c_code/4_2/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_jsgen.c -o c_code/4_2/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_passaux.c -o c_code/4_2/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_depends.c -o c_code/4_2/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_docgen2.c -o c_code/4_2/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_service.c -o c_code/4_2/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_net.c -o c_code/4_2/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_nativesockets.c -o c_code/4_2/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_modules.c -o c_code/4_2/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_nodejs.c -o c_code/4_2/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_scriptconfig.c -o c_code/4_2/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/4_2/compiler_nim.o \
c_code/4_2/stdlib_system.o \
c_code/4_2/compiler_testability.o \
c_code/4_2/compiler_commands.o \
c_code/4_2/stdlib_os.o \
c_code/4_2/stdlib_strutils.o \
c_code/4_2/stdlib_parseutils.o \
c_code/4_2/stdlib_times.o \
c_code/4_2/stdlib_posix.o \
c_code/4_2/compiler_msgs.o \
c_code/4_2/compiler_options.o \
c_code/4_2/compiler_lists.o \
c_code/4_2/stdlib_strtabs.o \
c_code/4_2/stdlib_hashes.o \
c_code/4_2/stdlib_etcpriv.o \
c_code/4_2/stdlib_osproc.o \
c_code/4_2/stdlib_streams.o \
c_code/4_2/stdlib_cpuinfo.o \
c_code/4_2/stdlib_sets.o \
c_code/4_2/stdlib_math.o \
c_code/4_2/stdlib_tables.o \
c_code/4_2/compiler_ropes.o \
c_code/4_2/compiler_platform.o \
c_code/4_2/stdlib_terminal.o \
c_code/4_2/stdlib_macros.o \
c_code/4_2/stdlib_termios.o \
c_code/4_2/compiler_nversion.o \
c_code/4_2/compiler_condsyms.o \
c_code/4_2/compiler_idents.o \
c_code/4_2/compiler_extccomp.o \
c_code/4_2/stdlib_securehash.o \
c_code/4_2/stdlib_unsigned.o \
c_code/4_2/compiler_wordrecg.o \
c_code/4_2/compiler_nimblecmd.o \
c_code/4_2/stdlib_parseopt.o \
c_code/4_2/compiler_lexer.o \
c_code/4_2/compiler_nimlexbase.o \
c_code/4_2/compiler_llstream.o \
c_code/4_2/compiler_nimconf.o \
c_code/4_2/compiler_main.o \
c_code/4_2/compiler_ast.o \
c_code/4_2/stdlib_intsets.o \
c_code/4_2/compiler_idgen.o \
c_code/4_2/compiler_astalgo.o \
c_code/4_2/compiler_rodutils.o \
c_code/4_2/compiler_syntaxes.o \
c_code/4_2/compiler_parser.o \
c_code/4_2/compiler_pbraces.o \
c_code/4_2/compiler_filters.o \
c_code/4_2/compiler_renderer.o \
c_code/4_2/compiler_filter_tmpl.o \
c_code/4_2/compiler_rodread.o \
c_code/4_2/compiler_types.o \
c_code/4_2/compiler_trees.o \
c_code/4_2/stdlib_memfiles.o \
c_code/4_2/compiler_rodwrite.o \
c_code/4_2/compiler_passes.o \
c_code/4_2/compiler_magicsys.o \
c_code/4_2/compiler_nimsets.o \
c_code/4_2/compiler_bitsets.o \
c_code/4_2/compiler_importer.o \
c_code/4_2/compiler_lookups.o \
c_code/4_2/compiler_semdata.o \
c_code/4_2/compiler_treetab.o \
c_code/4_2/compiler_vmdef.o \
c_code/4_2/compiler_prettybase.o \
c_code/4_2/stdlib_lexbase.o \
c_code/4_2/compiler_sem.o \
c_code/4_2/compiler_semfold.o \
c_code/4_2/compiler_saturate.o \
c_code/4_2/compiler_procfind.o \
c_code/4_2/compiler_pragmas.o \
c_code/4_2/compiler_semtypinst.o \
c_code/4_2/compiler_sigmatch.o \
c_code/4_2/compiler_parampatterns.o \
c_code/4_2/compiler_pretty.o \
c_code/4_2/compiler_docgen.o \
c_code/4_2/docutils_rstast.o \
c_code/4_2/stdlib_json.o \
c_code/4_2/stdlib_unicode.o \
c_code/4_2/docutils_rst.o \
c_code/4_2/docutils_rstgen.o \
c_code/4_2/docutils_highlite.o \
c_code/4_2/stdlib_sequtils.o \
c_code/4_2/stdlib_algorithm.o \
c_code/4_2/compiler_sempass2.o \
c_code/4_2/compiler_guards.o \
c_code/4_2/compiler_writetracking.o \
c_code/4_2/stdlib_xmltree.o \
c_code/4_2/stdlib_cgi.o \
c_code/4_2/stdlib_cookies.o \
c_code/4_2/compiler_typesrenderer.o \
c_code/4_2/compiler_transf.o \
c_code/4_2/compiler_cgmeth.o \
c_code/4_2/compiler_lambdalifting.o \
c_code/4_2/compiler_lowerings.o \
c_code/4_2/compiler_vm.o \
c_code/4_2/compiler_vmgen.o \
c_code/4_2/compiler_vmdeps.o \
c_code/4_2/compiler_vmmarshal.o \
c_code/4_2/compiler_evaltempl.o \
c_code/4_2/compiler_aliases.o \
c_code/4_2/compiler_patterns.o \
c_code/4_2/compiler_semmacrosanity.o \
c_code/4_2/compiler_semparallel.o \
c_code/4_2/compiler_pluginsupport.o \
c_code/4_2/compiler_active.o \
c_code/4_2/compiler_locals.o \
c_code/4_2/compiler_itersgen.o \
c_code/4_2/compiler_cgen.o \
c_code/4_2/compiler_ccgutils.o \
c_code/4_2/compiler_cgendata.o \
c_code/4_2/compiler_ccgmerge.o \
c_code/4_2/compiler_jsgen.o \
c_code/4_2/compiler_passaux.o \
c_code/4_2/compiler_depends.o \
c_code/4_2/compiler_docgen2.o \
c_code/4_2/compiler_service.o \
c_code/4_2/stdlib_net.o \
c_code/4_2/stdlib_nativesockets.o \
c_code/4_2/compiler_modules.o \
c_code/4_2/compiler_nodejs.o \
c_code/4_2/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  powerpc64)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  arm)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_nim.c -o c_code/4_5/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_system.c -o c_code/4_5/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_testability.c -o c_code/4_5/compiler_testability.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_commands.c -o c_code/4_5/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_os.c -o c_code/4_5/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_strutils.c -o c_code/4_5/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_parseutils.c -o c_code/4_5/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_times.c -o c_code/4_5/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_posix.c -o c_code/4_5/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_msgs.c -o c_code/4_5/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_options.c -o c_code/4_5/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_lists.c -o c_code/4_5/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_strtabs.c -o c_code/4_5/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_hashes.c -o c_code/4_5/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_etcpriv.c -o c_code/4_5/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_osproc.c -o c_code/4_5/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_streams.c -o c_code/4_5/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_cpuinfo.c -o c_code/4_5/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_sets.c -o c_code/4_5/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_math.c -o c_code/4_5/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_tables.c -o c_code/4_5/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_ropes.c -o c_code/4_5/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_platform.c -o c_code/4_5/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_terminal.c -o c_code/4_5/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_macros.c -o c_code/4_5/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_termios.c -o c_code/4_5/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_nversion.c -o c_code/4_5/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_condsyms.c -o c_code/4_5/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_idents.c -o c_code/4_5/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_extccomp.c -o c_code/4_5/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_securehash.c -o c_code/4_5/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_unsigned.c -o c_code/4_5/stdlib_unsigned.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_wordrecg.c -o c_code/4_5/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_nimblecmd.c -o c_code/4_5/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_parseopt.c -o c_code/4_5/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_lexer.c -o c_code/4_5/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_nimlexbase.c -o c_code/4_5/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_llstream.c -o c_code/4_5/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_nimconf.c -o c_code/4_5/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_main.c -o c_code/4_5/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_ast.c -o c_code/4_5/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_intsets.c -o c_code/4_5/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_idgen.c -o c_code/4_5/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_astalgo.c -o c_code/4_5/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_rodutils.c -o c_code/4_5/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_syntaxes.c -o c_code/4_5/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_parser.c -o c_code/4_5/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_pbraces.c -o c_code/4_5/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_filters.c -o c_code/4_5/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_renderer.c -o c_code/4_5/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_filter_tmpl.c -o c_code/4_5/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_rodread.c -o c_code/4_5/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_types.c -o c_code/4_5/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_trees.c -o c_code/4_5/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_memfiles.c -o c_code/4_5/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_rodwrite.c -o c_code/4_5/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_passes.c -o c_code/4_5/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_magicsys.c -o c_code/4_5/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_nimsets.c -o c_code/4_5/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_bitsets.c -o c_code/4_5/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_importer.c -o c_code/4_5/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_lookups.c -o c_code/4_5/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_semdata.c -o c_code/4_5/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_treetab.c -o c_code/4_5/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_vmdef.c -o c_code/4_5/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_prettybase.c -o c_code/4_5/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_lexbase.c -o c_code/4_5/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_sem.c -o c_code/4_5/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_semfold.c -o c_code/4_5/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_saturate.c -o c_code/4_5/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_procfind.c -o c_code/4_5/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_pragmas.c -o c_code/4_5/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_semtypinst.c -o c_code/4_5/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_sigmatch.c -o c_code/4_5/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_parampatterns.c -o c_code/4_5/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_pretty.c -o c_code/4_5/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_docgen.c -o c_code/4_5/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/docutils_rstast.c -o c_code/4_5/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_json.c -o c_code/4_5/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_unicode.c -o c_code/4_5/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/docutils_rst.c -o c_code/4_5/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/docutils_rstgen.c -o c_code/4_5/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/docutils_highlite.c -o c_code/4_5/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_sequtils.c -o c_code/4_5/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_algorithm.c -o c_code/4_5/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_sempass2.c -o c_code/4_5/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_guards.c -o c_code/4_5/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_writetracking.c -o c_code/4_5/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_xmltree.c -o c_code/4_5/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_cgi.c -o c_code/4_5/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_cookies.c -o c_code/4_5/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_typesrenderer.c -o c_code/4_5/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_transf.c -o c_code/4_5/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_cgmeth.c -o c_code/4_5/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_lambdalifting.c -o c_code/4_5/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_lowerings.c -o c_code/4_5/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_vm.c -o c_code/4_5/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_vmgen.c -o c_code/4_5/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_vmdeps.c -o c_code/4_5/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_vmmarshal.c -o c_code/4_5/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_evaltempl.c -o c_code/4_5/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_aliases.c -o c_code/4_5/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_patterns.c -o c_code/4_5/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_semmacrosanity.c -o c_code/4_5/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_semparallel.c -o c_code/4_5/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_pluginsupport.c -o c_code/4_5/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_active.c -o c_code/4_5/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_locals.c -o c_code/4_5/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_itersgen.c -o c_code/4_5/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_cgen.c -o c_code/4_5/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_ccgutils.c -o c_code/4_5/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_cgendata.c -o c_code/4_5/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_ccgmerge.c -o c_code/4_5/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_jsgen.c -o c_code/4_5/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_passaux.c -o c_code/4_5/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_depends.c -o c_code/4_5/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_docgen2.c -o c_code/4_5/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_service.c -o c_code/4_5/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_net.c -o c_code/4_5/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_nativesockets.c -o c_code/4_5/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_modules.c -o c_code/4_5/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_nodejs.c -o c_code/4_5/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_scriptconfig.c -o c_code/4_5/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/4_5/compiler_nim.o \
c_code/4_5/stdlib_system.o \
c_code/4_5/compiler_testability.o \
c_code/4_5/compiler_commands.o \
c_code/4_5/stdlib_os.o \
c_code/4_5/stdlib_strutils.o \
c_code/4_5/stdlib_parseutils.o \
c_code/4_5/stdlib_times.o \
c_code/4_5/stdlib_posix.o \
c_code/4_5/compiler_msgs.o \
c_code/4_5/compiler_options.o \
c_code/4_5/compiler_lists.o \
c_code/4_5/stdlib_strtabs.o \
c_code/4_5/stdlib_hashes.o \
c_code/4_5/stdlib_etcpriv.o \
c_code/4_5/stdlib_osproc.o \
c_code/4_5/stdlib_streams.o \
c_code/4_5/stdlib_cpuinfo.o \
c_code/4_5/stdlib_sets.o \
c_code/4_5/stdlib_math.o \
c_code/4_5/stdlib_tables.o \
c_code/4_5/compiler_ropes.o \
c_code/4_5/compiler_platform.o \
c_code/4_5/stdlib_terminal.o \
c_code/4_5/stdlib_macros.o \
c_code/4_5/stdlib_termios.o \
c_code/4_5/compiler_nversion.o \
c_code/4_5/compiler_condsyms.o \
c_code/4_5/compiler_idents.o \
c_code/4_5/compiler_extccomp.o \
c_code/4_5/stdlib_securehash.o \
c_code/4_5/stdlib_unsigned.o \
c_code/4_5/compiler_wordrecg.o \
c_code/4_5/compiler_nimblecmd.o \
c_code/4_5/stdlib_parseopt.o \
c_code/4_5/compiler_lexer.o \
c_code/4_5/compiler_nimlexbase.o \
c_code/4_5/compiler_llstream.o \
c_code/4_5/compiler_nimconf.o \
c_code/4_5/compiler_main.o \
c_code/4_5/compiler_ast.o \
c_code/4_5/stdlib_intsets.o \
c_code/4_5/compiler_idgen.o \
c_code/4_5/compiler_astalgo.o \
c_code/4_5/compiler_rodutils.o \
c_code/4_5/compiler_syntaxes.o \
c_code/4_5/compiler_parser.o \
c_code/4_5/compiler_pbraces.o \
c_code/4_5/compiler_filters.o \
c_code/4_5/compiler_renderer.o \
c_code/4_5/compiler_filter_tmpl.o \
c_code/4_5/compiler_rodread.o \
c_code/4_5/compiler_types.o \
c_code/4_5/compiler_trees.o \
c_code/4_5/stdlib_memfiles.o \
c_code/4_5/compiler_rodwrite.o \
c_code/4_5/compiler_passes.o \
c_code/4_5/compiler_magicsys.o \
c_code/4_5/compiler_nimsets.o \
c_code/4_5/compiler_bitsets.o \
c_code/4_5/compiler_importer.o \
c_code/4_5/compiler_lookups.o \
c_code/4_5/compiler_semdata.o \
c_code/4_5/compiler_treetab.o \
c_code/4_5/compiler_vmdef.o \
c_code/4_5/compiler_prettybase.o \
c_code/4_5/stdlib_lexbase.o \
c_code/4_5/compiler_sem.o \
c_code/4_5/compiler_semfold.o \
c_code/4_5/compiler_saturate.o \
c_code/4_5/compiler_procfind.o \
c_code/4_5/compiler_pragmas.o \
c_code/4_5/compiler_semtypinst.o \
c_code/4_5/compiler_sigmatch.o \
c_code/4_5/compiler_parampatterns.o \
c_code/4_5/compiler_pretty.o \
c_code/4_5/compiler_docgen.o \
c_code/4_5/docutils_rstast.o \
c_code/4_5/stdlib_json.o \
c_code/4_5/stdlib_unicode.o \
c_code/4_5/docutils_rst.o \
c_code/4_5/docutils_rstgen.o \
c_code/4_5/docutils_highlite.o \
c_code/4_5/stdlib_sequtils.o \
c_code/4_5/stdlib_algorithm.o \
c_code/4_5/compiler_sempass2.o \
c_code/4_5/compiler_guards.o \
c_code/4_5/compiler_writetracking.o \
c_code/4_5/stdlib_xmltree.o \
c_code/4_5/stdlib_cgi.o \
c_code/4_5/stdlib_cookies.o \
c_code/4_5/compiler_typesrenderer.o \
c_code/4_5/compiler_transf.o \
c_code/4_5/compiler_cgmeth.o \
c_code/4_5/compiler_lambdalifting.o \
c_code/4_5/compiler_lowerings.o \
c_code/4_5/compiler_vm.o \
c_code/4_5/compiler_vmgen.o \
c_code/4_5/compiler_vmdeps.o \
c_code/4_5/compiler_vmmarshal.o \
c_code/4_5/compiler_evaltempl.o \
c_code/4_5/compiler_aliases.o \
c_code/4_5/compiler_patterns.o \
c_code/4_5/compiler_semmacrosanity.o \
c_code/4_5/compiler_semparallel.o \
c_code/4_5/compiler_pluginsupport.o \
c_code/4_5/compiler_active.o \
c_code/4_5/compiler_locals.o \
c_code/4_5/compiler_itersgen.o \
c_code/4_5/compiler_cgen.o \
c_code/4_5/compiler_ccgutils.o \
c_code/4_5/compiler_cgendata.o \
c_code/4_5/compiler_ccgmerge.o \
c_code/4_5/compiler_jsgen.o \
c_code/4_5/compiler_passaux.o \
c_code/4_5/compiler_depends.o \
c_code/4_5/compiler_docgen2.o \
c_code/4_5/compiler_service.o \
c_code/4_5/stdlib_net.o \
c_code/4_5/stdlib_nativesockets.o \
c_code/4_5/compiler_modules.o \
c_code/4_5/compiler_nodejs.o \
c_code/4_5/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  mips)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  mipsel)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc64el)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  arm64)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  *)
    echo 2>&1 "Error: no C code generated for: [$myos: $mycpu]"
    exit 1
    ;;
  esac
  ;;
freebsd) 
  case $mycpu in
  i386)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_nim.c -o c_code/5_1/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_system.c -o c_code/5_1/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_testability.c -o c_code/5_1/compiler_testability.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_commands.c -o c_code/5_1/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_os.c -o c_code/5_1/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_strutils.c -o c_code/5_1/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_parseutils.c -o c_code/5_1/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_times.c -o c_code/5_1/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_posix.c -o c_code/5_1/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_msgs.c -o c_code/5_1/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_options.c -o c_code/5_1/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_lists.c -o c_code/5_1/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_strtabs.c -o c_code/5_1/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_hashes.c -o c_code/5_1/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_etcpriv.c -o c_code/5_1/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_osproc.c -o c_code/5_1/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_streams.c -o c_code/5_1/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_cpuinfo.c -o c_code/5_1/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_sets.c -o c_code/5_1/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_math.c -o c_code/5_1/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_tables.c -o c_code/5_1/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_ropes.c -o c_code/5_1/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_platform.c -o c_code/5_1/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_terminal.c -o c_code/5_1/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_macros.c -o c_code/5_1/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_termios.c -o c_code/5_1/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_nversion.c -o c_code/5_1/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_condsyms.c -o c_code/5_1/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_idents.c -o c_code/5_1/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_extccomp.c -o c_code/5_1/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_securehash.c -o c_code/5_1/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_unsigned.c -o c_code/5_1/stdlib_unsigned.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_wordrecg.c -o c_code/5_1/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_nimblecmd.c -o c_code/5_1/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_parseopt.c -o c_code/5_1/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_lexer.c -o c_code/5_1/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_nimlexbase.c -o c_code/5_1/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_llstream.c -o c_code/5_1/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_nimconf.c -o c_code/5_1/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_main.c -o c_code/5_1/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_ast.c -o c_code/5_1/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_intsets.c -o c_code/5_1/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_idgen.c -o c_code/5_1/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_astalgo.c -o c_code/5_1/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_rodutils.c -o c_code/5_1/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_syntaxes.c -o c_code/5_1/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_parser.c -o c_code/5_1/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_pbraces.c -o c_code/5_1/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_filters.c -o c_code/5_1/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_renderer.c -o c_code/5_1/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_filter_tmpl.c -o c_code/5_1/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_rodread.c -o c_code/5_1/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_types.c -o c_code/5_1/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_trees.c -o c_code/5_1/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_memfiles.c -o c_code/5_1/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_rodwrite.c -o c_code/5_1/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_passes.c -o c_code/5_1/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_magicsys.c -o c_code/5_1/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_nimsets.c -o c_code/5_1/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_bitsets.c -o c_code/5_1/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_importer.c -o c_code/5_1/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_lookups.c -o c_code/5_1/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_semdata.c -o c_code/5_1/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_treetab.c -o c_code/5_1/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_vmdef.c -o c_code/5_1/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_prettybase.c -o c_code/5_1/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_lexbase.c -o c_code/5_1/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_sem.c -o c_code/5_1/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_semfold.c -o c_code/5_1/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_saturate.c -o c_code/5_1/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_procfind.c -o c_code/5_1/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_pragmas.c -o c_code/5_1/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_semtypinst.c -o c_code/5_1/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_sigmatch.c -o c_code/5_1/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_parampatterns.c -o c_code/5_1/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_pretty.c -o c_code/5_1/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_docgen.c -o c_code/5_1/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/docutils_rstast.c -o c_code/5_1/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_json.c -o c_code/5_1/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_unicode.c -o c_code/5_1/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/docutils_rst.c -o c_code/5_1/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/docutils_rstgen.c -o c_code/5_1/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/docutils_highlite.c -o c_code/5_1/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_sequtils.c -o c_code/5_1/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_algorithm.c -o c_code/5_1/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_sempass2.c -o c_code/5_1/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_guards.c -o c_code/5_1/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_writetracking.c -o c_code/5_1/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_xmltree.c -o c_code/5_1/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_cgi.c -o c_code/5_1/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_cookies.c -o c_code/5_1/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_typesrenderer.c -o c_code/5_1/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_transf.c -o c_code/5_1/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_cgmeth.c -o c_code/5_1/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_lambdalifting.c -o c_code/5_1/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_lowerings.c -o c_code/5_1/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_vm.c -o c_code/5_1/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_vmgen.c -o c_code/5_1/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_vmdeps.c -o c_code/5_1/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_vmmarshal.c -o c_code/5_1/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_evaltempl.c -o c_code/5_1/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_aliases.c -o c_code/5_1/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_patterns.c -o c_code/5_1/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_semmacrosanity.c -o c_code/5_1/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_semparallel.c -o c_code/5_1/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_pluginsupport.c -o c_code/5_1/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_active.c -o c_code/5_1/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_locals.c -o c_code/5_1/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_itersgen.c -o c_code/5_1/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_cgen.c -o c_code/5_1/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_ccgutils.c -o c_code/5_1/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_cgendata.c -o c_code/5_1/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_ccgmerge.c -o c_code/5_1/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_jsgen.c -o c_code/5_1/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_passaux.c -o c_code/5_1/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_depends.c -o c_code/5_1/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_docgen2.c -o c_code/5_1/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_service.c -o c_code/5_1/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_net.c -o c_code/5_1/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_nativesockets.c -o c_code/5_1/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_modules.c -o c_code/5_1/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_nodejs.c -o c_code/5_1/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_scriptconfig.c -o c_code/5_1/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/5_1/compiler_nim.o \
c_code/5_1/stdlib_system.o \
c_code/5_1/compiler_testability.o \
c_code/5_1/compiler_commands.o \
c_code/5_1/stdlib_os.o \
c_code/5_1/stdlib_strutils.o \
c_code/5_1/stdlib_parseutils.o \
c_code/5_1/stdlib_times.o \
c_code/5_1/stdlib_posix.o \
c_code/5_1/compiler_msgs.o \
c_code/5_1/compiler_options.o \
c_code/5_1/compiler_lists.o \
c_code/5_1/stdlib_strtabs.o \
c_code/5_1/stdlib_hashes.o \
c_code/5_1/stdlib_etcpriv.o \
c_code/5_1/stdlib_osproc.o \
c_code/5_1/stdlib_streams.o \
c_code/5_1/stdlib_cpuinfo.o \
c_code/5_1/stdlib_sets.o \
c_code/5_1/stdlib_math.o \
c_code/5_1/stdlib_tables.o \
c_code/5_1/compiler_ropes.o \
c_code/5_1/compiler_platform.o \
c_code/5_1/stdlib_terminal.o \
c_code/5_1/stdlib_macros.o \
c_code/5_1/stdlib_termios.o \
c_code/5_1/compiler_nversion.o \
c_code/5_1/compiler_condsyms.o \
c_code/5_1/compiler_idents.o \
c_code/5_1/compiler_extccomp.o \
c_code/5_1/stdlib_securehash.o \
c_code/5_1/stdlib_unsigned.o \
c_code/5_1/compiler_wordrecg.o \
c_code/5_1/compiler_nimblecmd.o \
c_code/5_1/stdlib_parseopt.o \
c_code/5_1/compiler_lexer.o \
c_code/5_1/compiler_nimlexbase.o \
c_code/5_1/compiler_llstream.o \
c_code/5_1/compiler_nimconf.o \
c_code/5_1/compiler_main.o \
c_code/5_1/compiler_ast.o \
c_code/5_1/stdlib_intsets.o \
c_code/5_1/compiler_idgen.o \
c_code/5_1/compiler_astalgo.o \
c_code/5_1/compiler_rodutils.o \
c_code/5_1/compiler_syntaxes.o \
c_code/5_1/compiler_parser.o \
c_code/5_1/compiler_pbraces.o \
c_code/5_1/compiler_filters.o \
c_code/5_1/compiler_renderer.o \
c_code/5_1/compiler_filter_tmpl.o \
c_code/5_1/compiler_rodread.o \
c_code/5_1/compiler_types.o \
c_code/5_1/compiler_trees.o \
c_code/5_1/stdlib_memfiles.o \
c_code/5_1/compiler_rodwrite.o \
c_code/5_1/compiler_passes.o \
c_code/5_1/compiler_magicsys.o \
c_code/5_1/compiler_nimsets.o \
c_code/5_1/compiler_bitsets.o \
c_code/5_1/compiler_importer.o \
c_code/5_1/compiler_lookups.o \
c_code/5_1/compiler_semdata.o \
c_code/5_1/compiler_treetab.o \
c_code/5_1/compiler_vmdef.o \
c_code/5_1/compiler_prettybase.o \
c_code/5_1/stdlib_lexbase.o \
c_code/5_1/compiler_sem.o \
c_code/5_1/compiler_semfold.o \
c_code/5_1/compiler_saturate.o \
c_code/5_1/compiler_procfind.o \
c_code/5_1/compiler_pragmas.o \
c_code/5_1/compiler_semtypinst.o \
c_code/5_1/compiler_sigmatch.o \
c_code/5_1/compiler_parampatterns.o \
c_code/5_1/compiler_pretty.o \
c_code/5_1/compiler_docgen.o \
c_code/5_1/docutils_rstast.o \
c_code/5_1/stdlib_json.o \
c_code/5_1/stdlib_unicode.o \
c_code/5_1/docutils_rst.o \
c_code/5_1/docutils_rstgen.o \
c_code/5_1/docutils_highlite.o \
c_code/5_1/stdlib_sequtils.o \
c_code/5_1/stdlib_algorithm.o \
c_code/5_1/compiler_sempass2.o \
c_code/5_1/compiler_guards.o \
c_code/5_1/compiler_writetracking.o \
c_code/5_1/stdlib_xmltree.o \
c_code/5_1/stdlib_cgi.o \
c_code/5_1/stdlib_cookies.o \
c_code/5_1/compiler_typesrenderer.o \
c_code/5_1/compiler_transf.o \
c_code/5_1/compiler_cgmeth.o \
c_code/5_1/compiler_lambdalifting.o \
c_code/5_1/compiler_lowerings.o \
c_code/5_1/compiler_vm.o \
c_code/5_1/compiler_vmgen.o \
c_code/5_1/compiler_vmdeps.o \
c_code/5_1/compiler_vmmarshal.o \
c_code/5_1/compiler_evaltempl.o \
c_code/5_1/compiler_aliases.o \
c_code/5_1/compiler_patterns.o \
c_code/5_1/compiler_semmacrosanity.o \
c_code/5_1/compiler_semparallel.o \
c_code/5_1/compiler_pluginsupport.o \
c_code/5_1/compiler_active.o \
c_code/5_1/compiler_locals.o \
c_code/5_1/compiler_itersgen.o \
c_code/5_1/compiler_cgen.o \
c_code/5_1/compiler_ccgutils.o \
c_code/5_1/compiler_cgendata.o \
c_code/5_1/compiler_ccgmerge.o \
c_code/5_1/compiler_jsgen.o \
c_code/5_1/compiler_passaux.o \
c_code/5_1/compiler_depends.o \
c_code/5_1/compiler_docgen2.o \
c_code/5_1/compiler_service.o \
c_code/5_1/stdlib_net.o \
c_code/5_1/stdlib_nativesockets.o \
c_code/5_1/compiler_modules.o \
c_code/5_1/compiler_nodejs.o \
c_code/5_1/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  amd64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_nim.c -o c_code/5_2/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_system.c -o c_code/5_2/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_testability.c -o c_code/5_2/compiler_testability.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_commands.c -o c_code/5_2/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_os.c -o c_code/5_2/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_strutils.c -o c_code/5_2/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_parseutils.c -o c_code/5_2/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_times.c -o c_code/5_2/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_posix.c -o c_code/5_2/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_msgs.c -o c_code/5_2/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_options.c -o c_code/5_2/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_lists.c -o c_code/5_2/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_strtabs.c -o c_code/5_2/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_hashes.c -o c_code/5_2/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_etcpriv.c -o c_code/5_2/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_osproc.c -o c_code/5_2/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_streams.c -o c_code/5_2/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_cpuinfo.c -o c_code/5_2/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_sets.c -o c_code/5_2/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_math.c -o c_code/5_2/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_tables.c -o c_code/5_2/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_ropes.c -o c_code/5_2/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_platform.c -o c_code/5_2/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_terminal.c -o c_code/5_2/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_macros.c -o c_code/5_2/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_termios.c -o c_code/5_2/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_nversion.c -o c_code/5_2/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_condsyms.c -o c_code/5_2/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_idents.c -o c_code/5_2/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_extccomp.c -o c_code/5_2/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_securehash.c -o c_code/5_2/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_unsigned.c -o c_code/5_2/stdlib_unsigned.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_wordrecg.c -o c_code/5_2/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_nimblecmd.c -o c_code/5_2/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_parseopt.c -o c_code/5_2/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_lexer.c -o c_code/5_2/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_nimlexbase.c -o c_code/5_2/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_llstream.c -o c_code/5_2/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_nimconf.c -o c_code/5_2/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_main.c -o c_code/5_2/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_ast.c -o c_code/5_2/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_intsets.c -o c_code/5_2/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_idgen.c -o c_code/5_2/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_astalgo.c -o c_code/5_2/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_rodutils.c -o c_code/5_2/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_syntaxes.c -o c_code/5_2/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_parser.c -o c_code/5_2/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_pbraces.c -o c_code/5_2/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_filters.c -o c_code/5_2/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_renderer.c -o c_code/5_2/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_filter_tmpl.c -o c_code/5_2/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_rodread.c -o c_code/5_2/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_types.c -o c_code/5_2/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_trees.c -o c_code/5_2/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_memfiles.c -o c_code/5_2/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_rodwrite.c -o c_code/5_2/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_passes.c -o c_code/5_2/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_magicsys.c -o c_code/5_2/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_nimsets.c -o c_code/5_2/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_bitsets.c -o c_code/5_2/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_importer.c -o c_code/5_2/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_lookups.c -o c_code/5_2/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_semdata.c -o c_code/5_2/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_treetab.c -o c_code/5_2/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_vmdef.c -o c_code/5_2/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_prettybase.c -o c_code/5_2/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_lexbase.c -o c_code/5_2/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_sem.c -o c_code/5_2/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_semfold.c -o c_code/5_2/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_saturate.c -o c_code/5_2/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_procfind.c -o c_code/5_2/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_pragmas.c -o c_code/5_2/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_semtypinst.c -o c_code/5_2/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_sigmatch.c -o c_code/5_2/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_parampatterns.c -o c_code/5_2/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_pretty.c -o c_code/5_2/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_docgen.c -o c_code/5_2/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/docutils_rstast.c -o c_code/5_2/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_json.c -o c_code/5_2/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_unicode.c -o c_code/5_2/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/docutils_rst.c -o c_code/5_2/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/docutils_rstgen.c -o c_code/5_2/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/docutils_highlite.c -o c_code/5_2/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_sequtils.c -o c_code/5_2/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_algorithm.c -o c_code/5_2/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_sempass2.c -o c_code/5_2/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_guards.c -o c_code/5_2/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_writetracking.c -o c_code/5_2/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_xmltree.c -o c_code/5_2/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_cgi.c -o c_code/5_2/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_cookies.c -o c_code/5_2/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_typesrenderer.c -o c_code/5_2/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_transf.c -o c_code/5_2/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_cgmeth.c -o c_code/5_2/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_lambdalifting.c -o c_code/5_2/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_lowerings.c -o c_code/5_2/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_vm.c -o c_code/5_2/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_vmgen.c -o c_code/5_2/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_vmdeps.c -o c_code/5_2/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_vmmarshal.c -o c_code/5_2/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_evaltempl.c -o c_code/5_2/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_aliases.c -o c_code/5_2/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_patterns.c -o c_code/5_2/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_semmacrosanity.c -o c_code/5_2/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_semparallel.c -o c_code/5_2/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_pluginsupport.c -o c_code/5_2/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_active.c -o c_code/5_2/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_locals.c -o c_code/5_2/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_itersgen.c -o c_code/5_2/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_cgen.c -o c_code/5_2/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_ccgutils.c -o c_code/5_2/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_cgendata.c -o c_code/5_2/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_ccgmerge.c -o c_code/5_2/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_jsgen.c -o c_code/5_2/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_passaux.c -o c_code/5_2/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_depends.c -o c_code/5_2/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_docgen2.c -o c_code/5_2/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_service.c -o c_code/5_2/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_net.c -o c_code/5_2/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_nativesockets.c -o c_code/5_2/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_modules.c -o c_code/5_2/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_nodejs.c -o c_code/5_2/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_scriptconfig.c -o c_code/5_2/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/5_2/compiler_nim.o \
c_code/5_2/stdlib_system.o \
c_code/5_2/compiler_testability.o \
c_code/5_2/compiler_commands.o \
c_code/5_2/stdlib_os.o \
c_code/5_2/stdlib_strutils.o \
c_code/5_2/stdlib_parseutils.o \
c_code/5_2/stdlib_times.o \
c_code/5_2/stdlib_posix.o \
c_code/5_2/compiler_msgs.o \
c_code/5_2/compiler_options.o \
c_code/5_2/compiler_lists.o \
c_code/5_2/stdlib_strtabs.o \
c_code/5_2/stdlib_hashes.o \
c_code/5_2/stdlib_etcpriv.o \
c_code/5_2/stdlib_osproc.o \
c_code/5_2/stdlib_streams.o \
c_code/5_2/stdlib_cpuinfo.o \
c_code/5_2/stdlib_sets.o \
c_code/5_2/stdlib_math.o \
c_code/5_2/stdlib_tables.o \
c_code/5_2/compiler_ropes.o \
c_code/5_2/compiler_platform.o \
c_code/5_2/stdlib_terminal.o \
c_code/5_2/stdlib_macros.o \
c_code/5_2/stdlib_termios.o \
c_code/5_2/compiler_nversion.o \
c_code/5_2/compiler_condsyms.o \
c_code/5_2/compiler_idents.o \
c_code/5_2/compiler_extccomp.o \
c_code/5_2/stdlib_securehash.o \
c_code/5_2/stdlib_unsigned.o \
c_code/5_2/compiler_wordrecg.o \
c_code/5_2/compiler_nimblecmd.o \
c_code/5_2/stdlib_parseopt.o \
c_code/5_2/compiler_lexer.o \
c_code/5_2/compiler_nimlexbase.o \
c_code/5_2/compiler_llstream.o \
c_code/5_2/compiler_nimconf.o \
c_code/5_2/compiler_main.o \
c_code/5_2/compiler_ast.o \
c_code/5_2/stdlib_intsets.o \
c_code/5_2/compiler_idgen.o \
c_code/5_2/compiler_astalgo.o \
c_code/5_2/compiler_rodutils.o \
c_code/5_2/compiler_syntaxes.o \
c_code/5_2/compiler_parser.o \
c_code/5_2/compiler_pbraces.o \
c_code/5_2/compiler_filters.o \
c_code/5_2/compiler_renderer.o \
c_code/5_2/compiler_filter_tmpl.o \
c_code/5_2/compiler_rodread.o \
c_code/5_2/compiler_types.o \
c_code/5_2/compiler_trees.o \
c_code/5_2/stdlib_memfiles.o \
c_code/5_2/compiler_rodwrite.o \
c_code/5_2/compiler_passes.o \
c_code/5_2/compiler_magicsys.o \
c_code/5_2/compiler_nimsets.o \
c_code/5_2/compiler_bitsets.o \
c_code/5_2/compiler_importer.o \
c_code/5_2/compiler_lookups.o \
c_code/5_2/compiler_semdata.o \
c_code/5_2/compiler_treetab.o \
c_code/5_2/compiler_vmdef.o \
c_code/5_2/compiler_prettybase.o \
c_code/5_2/stdlib_lexbase.o \
c_code/5_2/compiler_sem.o \
c_code/5_2/compiler_semfold.o \
c_code/5_2/compiler_saturate.o \
c_code/5_2/compiler_procfind.o \
c_code/5_2/compiler_pragmas.o \
c_code/5_2/compiler_semtypinst.o \
c_code/5_2/compiler_sigmatch.o \
c_code/5_2/compiler_parampatterns.o \
c_code/5_2/compiler_pretty.o \
c_code/5_2/compiler_docgen.o \
c_code/5_2/docutils_rstast.o \
c_code/5_2/stdlib_json.o \
c_code/5_2/stdlib_unicode.o \
c_code/5_2/docutils_rst.o \
c_code/5_2/docutils_rstgen.o \
c_code/5_2/docutils_highlite.o \
c_code/5_2/stdlib_sequtils.o \
c_code/5_2/stdlib_algorithm.o \
c_code/5_2/compiler_sempass2.o \
c_code/5_2/compiler_guards.o \
c_code/5_2/compiler_writetracking.o \
c_code/5_2/stdlib_xmltree.o \
c_code/5_2/stdlib_cgi.o \
c_code/5_2/stdlib_cookies.o \
c_code/5_2/compiler_typesrenderer.o \
c_code/5_2/compiler_transf.o \
c_code/5_2/compiler_cgmeth.o \
c_code/5_2/compiler_lambdalifting.o \
c_code/5_2/compiler_lowerings.o \
c_code/5_2/compiler_vm.o \
c_code/5_2/compiler_vmgen.o \
c_code/5_2/compiler_vmdeps.o \
c_code/5_2/compiler_vmmarshal.o \
c_code/5_2/compiler_evaltempl.o \
c_code/5_2/compiler_aliases.o \
c_code/5_2/compiler_patterns.o \
c_code/5_2/compiler_semmacrosanity.o \
c_code/5_2/compiler_semparallel.o \
c_code/5_2/compiler_pluginsupport.o \
c_code/5_2/compiler_active.o \
c_code/5_2/compiler_locals.o \
c_code/5_2/compiler_itersgen.o \
c_code/5_2/compiler_cgen.o \
c_code/5_2/compiler_ccgutils.o \
c_code/5_2/compiler_cgendata.o \
c_code/5_2/compiler_ccgmerge.o \
c_code/5_2/compiler_jsgen.o \
c_code/5_2/compiler_passaux.o \
c_code/5_2/compiler_depends.o \
c_code/5_2/compiler_docgen2.o \
c_code/5_2/compiler_service.o \
c_code/5_2/stdlib_net.o \
c_code/5_2/stdlib_nativesockets.o \
c_code/5_2/compiler_modules.o \
c_code/5_2/compiler_nodejs.o \
c_code/5_2/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  powerpc64)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  arm)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  mips)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  mipsel)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc64el)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  arm64)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  *)
    echo 2>&1 "Error: no C code generated for: [$myos: $mycpu]"
    exit 1
    ;;
  esac
  ;;
netbsd) 
  case $mycpu in
  i386)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_nim.c -o c_code/6_1/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_system.c -o c_code/6_1/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_testability.c -o c_code/6_1/compiler_testability.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_commands.c -o c_code/6_1/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_os.c -o c_code/6_1/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_strutils.c -o c_code/6_1/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_parseutils.c -o c_code/6_1/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_times.c -o c_code/6_1/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_posix.c -o c_code/6_1/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_msgs.c -o c_code/6_1/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_options.c -o c_code/6_1/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_lists.c -o c_code/6_1/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_strtabs.c -o c_code/6_1/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_hashes.c -o c_code/6_1/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_etcpriv.c -o c_code/6_1/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_osproc.c -o c_code/6_1/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_streams.c -o c_code/6_1/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_cpuinfo.c -o c_code/6_1/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_sets.c -o c_code/6_1/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_math.c -o c_code/6_1/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_tables.c -o c_code/6_1/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_ropes.c -o c_code/6_1/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_platform.c -o c_code/6_1/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_terminal.c -o c_code/6_1/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_macros.c -o c_code/6_1/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_termios.c -o c_code/6_1/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_nversion.c -o c_code/6_1/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_condsyms.c -o c_code/6_1/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_idents.c -o c_code/6_1/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_extccomp.c -o c_code/6_1/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_securehash.c -o c_code/6_1/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_unsigned.c -o c_code/6_1/stdlib_unsigned.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_wordrecg.c -o c_code/6_1/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_nimblecmd.c -o c_code/6_1/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_parseopt.c -o c_code/6_1/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_lexer.c -o c_code/6_1/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_nimlexbase.c -o c_code/6_1/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_llstream.c -o c_code/6_1/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_nimconf.c -o c_code/6_1/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_main.c -o c_code/6_1/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_ast.c -o c_code/6_1/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_intsets.c -o c_code/6_1/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_idgen.c -o c_code/6_1/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_astalgo.c -o c_code/6_1/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_rodutils.c -o c_code/6_1/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_syntaxes.c -o c_code/6_1/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_parser.c -o c_code/6_1/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_pbraces.c -o c_code/6_1/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_filters.c -o c_code/6_1/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_renderer.c -o c_code/6_1/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_filter_tmpl.c -o c_code/6_1/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_rodread.c -o c_code/6_1/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_types.c -o c_code/6_1/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_trees.c -o c_code/6_1/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_memfiles.c -o c_code/6_1/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_rodwrite.c -o c_code/6_1/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_passes.c -o c_code/6_1/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_magicsys.c -o c_code/6_1/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_nimsets.c -o c_code/6_1/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_bitsets.c -o c_code/6_1/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_importer.c -o c_code/6_1/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_lookups.c -o c_code/6_1/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_semdata.c -o c_code/6_1/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_treetab.c -o c_code/6_1/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_vmdef.c -o c_code/6_1/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_prettybase.c -o c_code/6_1/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_lexbase.c -o c_code/6_1/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_sem.c -o c_code/6_1/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_semfold.c -o c_code/6_1/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_saturate.c -o c_code/6_1/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_procfind.c -o c_code/6_1/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_pragmas.c -o c_code/6_1/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_semtypinst.c -o c_code/6_1/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_sigmatch.c -o c_code/6_1/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_parampatterns.c -o c_code/6_1/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_pretty.c -o c_code/6_1/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_docgen.c -o c_code/6_1/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/docutils_rstast.c -o c_code/6_1/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_json.c -o c_code/6_1/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_unicode.c -o c_code/6_1/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/docutils_rst.c -o c_code/6_1/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/docutils_rstgen.c -o c_code/6_1/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/docutils_highlite.c -o c_code/6_1/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_sequtils.c -o c_code/6_1/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_algorithm.c -o c_code/6_1/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_sempass2.c -o c_code/6_1/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_guards.c -o c_code/6_1/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_writetracking.c -o c_code/6_1/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_xmltree.c -o c_code/6_1/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_cgi.c -o c_code/6_1/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_cookies.c -o c_code/6_1/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_typesrenderer.c -o c_code/6_1/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_transf.c -o c_code/6_1/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_cgmeth.c -o c_code/6_1/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_lambdalifting.c -o c_code/6_1/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_lowerings.c -o c_code/6_1/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_vm.c -o c_code/6_1/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_vmgen.c -o c_code/6_1/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_vmdeps.c -o c_code/6_1/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_vmmarshal.c -o c_code/6_1/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_evaltempl.c -o c_code/6_1/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_aliases.c -o c_code/6_1/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_patterns.c -o c_code/6_1/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_semmacrosanity.c -o c_code/6_1/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_semparallel.c -o c_code/6_1/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_pluginsupport.c -o c_code/6_1/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_active.c -o c_code/6_1/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_locals.c -o c_code/6_1/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_itersgen.c -o c_code/6_1/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_cgen.c -o c_code/6_1/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_ccgutils.c -o c_code/6_1/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_cgendata.c -o c_code/6_1/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_ccgmerge.c -o c_code/6_1/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_jsgen.c -o c_code/6_1/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_passaux.c -o c_code/6_1/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_depends.c -o c_code/6_1/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_docgen2.c -o c_code/6_1/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_service.c -o c_code/6_1/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_net.c -o c_code/6_1/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_nativesockets.c -o c_code/6_1/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_modules.c -o c_code/6_1/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_nodejs.c -o c_code/6_1/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_scriptconfig.c -o c_code/6_1/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/6_1/compiler_nim.o \
c_code/6_1/stdlib_system.o \
c_code/6_1/compiler_testability.o \
c_code/6_1/compiler_commands.o \
c_code/6_1/stdlib_os.o \
c_code/6_1/stdlib_strutils.o \
c_code/6_1/stdlib_parseutils.o \
c_code/6_1/stdlib_times.o \
c_code/6_1/stdlib_posix.o \
c_code/6_1/compiler_msgs.o \
c_code/6_1/compiler_options.o \
c_code/6_1/compiler_lists.o \
c_code/6_1/stdlib_strtabs.o \
c_code/6_1/stdlib_hashes.o \
c_code/6_1/stdlib_etcpriv.o \
c_code/6_1/stdlib_osproc.o \
c_code/6_1/stdlib_streams.o \
c_code/6_1/stdlib_cpuinfo.o \
c_code/6_1/stdlib_sets.o \
c_code/6_1/stdlib_math.o \
c_code/6_1/stdlib_tables.o \
c_code/6_1/compiler_ropes.o \
c_code/6_1/compiler_platform.o \
c_code/6_1/stdlib_terminal.o \
c_code/6_1/stdlib_macros.o \
c_code/6_1/stdlib_termios.o \
c_code/6_1/compiler_nversion.o \
c_code/6_1/compiler_condsyms.o \
c_code/6_1/compiler_idents.o \
c_code/6_1/compiler_extccomp.o \
c_code/6_1/stdlib_securehash.o \
c_code/6_1/stdlib_unsigned.o \
c_code/6_1/compiler_wordrecg.o \
c_code/6_1/compiler_nimblecmd.o \
c_code/6_1/stdlib_parseopt.o \
c_code/6_1/compiler_lexer.o \
c_code/6_1/compiler_nimlexbase.o \
c_code/6_1/compiler_llstream.o \
c_code/6_1/compiler_nimconf.o \
c_code/6_1/compiler_main.o \
c_code/6_1/compiler_ast.o \
c_code/6_1/stdlib_intsets.o \
c_code/6_1/compiler_idgen.o \
c_code/6_1/compiler_astalgo.o \
c_code/6_1/compiler_rodutils.o \
c_code/6_1/compiler_syntaxes.o \
c_code/6_1/compiler_parser.o \
c_code/6_1/compiler_pbraces.o \
c_code/6_1/compiler_filters.o \
c_code/6_1/compiler_renderer.o \
c_code/6_1/compiler_filter_tmpl.o \
c_code/6_1/compiler_rodread.o \
c_code/6_1/compiler_types.o \
c_code/6_1/compiler_trees.o \
c_code/6_1/stdlib_memfiles.o \
c_code/6_1/compiler_rodwrite.o \
c_code/6_1/compiler_passes.o \
c_code/6_1/compiler_magicsys.o \
c_code/6_1/compiler_nimsets.o \
c_code/6_1/compiler_bitsets.o \
c_code/6_1/compiler_importer.o \
c_code/6_1/compiler_lookups.o \
c_code/6_1/compiler_semdata.o \
c_code/6_1/compiler_treetab.o \
c_code/6_1/compiler_vmdef.o \
c_code/6_1/compiler_prettybase.o \
c_code/6_1/stdlib_lexbase.o \
c_code/6_1/compiler_sem.o \
c_code/6_1/compiler_semfold.o \
c_code/6_1/compiler_saturate.o \
c_code/6_1/compiler_procfind.o \
c_code/6_1/compiler_pragmas.o \
c_code/6_1/compiler_semtypinst.o \
c_code/6_1/compiler_sigmatch.o \
c_code/6_1/compiler_parampatterns.o \
c_code/6_1/compiler_pretty.o \
c_code/6_1/compiler_docgen.o \
c_code/6_1/docutils_rstast.o \
c_code/6_1/stdlib_json.o \
c_code/6_1/stdlib_unicode.o \
c_code/6_1/docutils_rst.o \
c_code/6_1/docutils_rstgen.o \
c_code/6_1/docutils_highlite.o \
c_code/6_1/stdlib_sequtils.o \
c_code/6_1/stdlib_algorithm.o \
c_code/6_1/compiler_sempass2.o \
c_code/6_1/compiler_guards.o \
c_code/6_1/compiler_writetracking.o \
c_code/6_1/stdlib_xmltree.o \
c_code/6_1/stdlib_cgi.o \
c_code/6_1/stdlib_cookies.o \
c_code/6_1/compiler_typesrenderer.o \
c_code/6_1/compiler_transf.o \
c_code/6_1/compiler_cgmeth.o \
c_code/6_1/compiler_lambdalifting.o \
c_code/6_1/compiler_lowerings.o \
c_code/6_1/compiler_vm.o \
c_code/6_1/compiler_vmgen.o \
c_code/6_1/compiler_vmdeps.o \
c_code/6_1/compiler_vmmarshal.o \
c_code/6_1/compiler_evaltempl.o \
c_code/6_1/compiler_aliases.o \
c_code/6_1/compiler_patterns.o \
c_code/6_1/compiler_semmacrosanity.o \
c_code/6_1/compiler_semparallel.o \
c_code/6_1/compiler_pluginsupport.o \
c_code/6_1/compiler_active.o \
c_code/6_1/compiler_locals.o \
c_code/6_1/compiler_itersgen.o \
c_code/6_1/compiler_cgen.o \
c_code/6_1/compiler_ccgutils.o \
c_code/6_1/compiler_cgendata.o \
c_code/6_1/compiler_ccgmerge.o \
c_code/6_1/compiler_jsgen.o \
c_code/6_1/compiler_passaux.o \
c_code/6_1/compiler_depends.o \
c_code/6_1/compiler_docgen2.o \
c_code/6_1/compiler_service.o \
c_code/6_1/stdlib_net.o \
c_code/6_1/stdlib_nativesockets.o \
c_code/6_1/compiler_modules.o \
c_code/6_1/compiler_nodejs.o \
c_code/6_1/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  amd64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_nim.c -o c_code/6_2/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_system.c -o c_code/6_2/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_testability.c -o c_code/6_2/compiler_testability.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_commands.c -o c_code/6_2/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_os.c -o c_code/6_2/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_strutils.c -o c_code/6_2/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_parseutils.c -o c_code/6_2/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_times.c -o c_code/6_2/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_posix.c -o c_code/6_2/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_msgs.c -o c_code/6_2/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_options.c -o c_code/6_2/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_lists.c -o c_code/6_2/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_strtabs.c -o c_code/6_2/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_hashes.c -o c_code/6_2/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_etcpriv.c -o c_code/6_2/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_osproc.c -o c_code/6_2/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_streams.c -o c_code/6_2/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_cpuinfo.c -o c_code/6_2/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_sets.c -o c_code/6_2/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_math.c -o c_code/6_2/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_tables.c -o c_code/6_2/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_ropes.c -o c_code/6_2/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_platform.c -o c_code/6_2/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_terminal.c -o c_code/6_2/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_macros.c -o c_code/6_2/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_termios.c -o c_code/6_2/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_nversion.c -o c_code/6_2/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_condsyms.c -o c_code/6_2/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_idents.c -o c_code/6_2/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_extccomp.c -o c_code/6_2/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_securehash.c -o c_code/6_2/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_unsigned.c -o c_code/6_2/stdlib_unsigned.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_wordrecg.c -o c_code/6_2/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_nimblecmd.c -o c_code/6_2/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_parseopt.c -o c_code/6_2/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_lexer.c -o c_code/6_2/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_nimlexbase.c -o c_code/6_2/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_llstream.c -o c_code/6_2/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_nimconf.c -o c_code/6_2/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_main.c -o c_code/6_2/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_ast.c -o c_code/6_2/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_intsets.c -o c_code/6_2/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_idgen.c -o c_code/6_2/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_astalgo.c -o c_code/6_2/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_rodutils.c -o c_code/6_2/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_syntaxes.c -o c_code/6_2/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_parser.c -o c_code/6_2/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_pbraces.c -o c_code/6_2/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_filters.c -o c_code/6_2/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_renderer.c -o c_code/6_2/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_filter_tmpl.c -o c_code/6_2/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_rodread.c -o c_code/6_2/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_types.c -o c_code/6_2/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_trees.c -o c_code/6_2/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_memfiles.c -o c_code/6_2/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_rodwrite.c -o c_code/6_2/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_passes.c -o c_code/6_2/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_magicsys.c -o c_code/6_2/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_nimsets.c -o c_code/6_2/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_bitsets.c -o c_code/6_2/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_importer.c -o c_code/6_2/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_lookups.c -o c_code/6_2/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_semdata.c -o c_code/6_2/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_treetab.c -o c_code/6_2/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_vmdef.c -o c_code/6_2/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_prettybase.c -o c_code/6_2/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_lexbase.c -o c_code/6_2/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_sem.c -o c_code/6_2/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_semfold.c -o c_code/6_2/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_saturate.c -o c_code/6_2/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_procfind.c -o c_code/6_2/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_pragmas.c -o c_code/6_2/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_semtypinst.c -o c_code/6_2/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_sigmatch.c -o c_code/6_2/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_parampatterns.c -o c_code/6_2/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_pretty.c -o c_code/6_2/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_docgen.c -o c_code/6_2/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/docutils_rstast.c -o c_code/6_2/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_json.c -o c_code/6_2/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_unicode.c -o c_code/6_2/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/docutils_rst.c -o c_code/6_2/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/docutils_rstgen.c -o c_code/6_2/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/docutils_highlite.c -o c_code/6_2/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_sequtils.c -o c_code/6_2/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_algorithm.c -o c_code/6_2/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_sempass2.c -o c_code/6_2/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_guards.c -o c_code/6_2/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_writetracking.c -o c_code/6_2/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_xmltree.c -o c_code/6_2/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_cgi.c -o c_code/6_2/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_cookies.c -o c_code/6_2/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_typesrenderer.c -o c_code/6_2/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_transf.c -o c_code/6_2/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_cgmeth.c -o c_code/6_2/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_lambdalifting.c -o c_code/6_2/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_lowerings.c -o c_code/6_2/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_vm.c -o c_code/6_2/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_vmgen.c -o c_code/6_2/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_vmdeps.c -o c_code/6_2/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_vmmarshal.c -o c_code/6_2/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_evaltempl.c -o c_code/6_2/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_aliases.c -o c_code/6_2/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_patterns.c -o c_code/6_2/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_semmacrosanity.c -o c_code/6_2/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_semparallel.c -o c_code/6_2/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_pluginsupport.c -o c_code/6_2/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_active.c -o c_code/6_2/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_locals.c -o c_code/6_2/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_itersgen.c -o c_code/6_2/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_cgen.c -o c_code/6_2/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_ccgutils.c -o c_code/6_2/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_cgendata.c -o c_code/6_2/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_ccgmerge.c -o c_code/6_2/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_jsgen.c -o c_code/6_2/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_passaux.c -o c_code/6_2/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_depends.c -o c_code/6_2/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_docgen2.c -o c_code/6_2/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_service.c -o c_code/6_2/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_net.c -o c_code/6_2/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_nativesockets.c -o c_code/6_2/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_modules.c -o c_code/6_2/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_nodejs.c -o c_code/6_2/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_scriptconfig.c -o c_code/6_2/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/6_2/compiler_nim.o \
c_code/6_2/stdlib_system.o \
c_code/6_2/compiler_testability.o \
c_code/6_2/compiler_commands.o \
c_code/6_2/stdlib_os.o \
c_code/6_2/stdlib_strutils.o \
c_code/6_2/stdlib_parseutils.o \
c_code/6_2/stdlib_times.o \
c_code/6_2/stdlib_posix.o \
c_code/6_2/compiler_msgs.o \
c_code/6_2/compiler_options.o \
c_code/6_2/compiler_lists.o \
c_code/6_2/stdlib_strtabs.o \
c_code/6_2/stdlib_hashes.o \
c_code/6_2/stdlib_etcpriv.o \
c_code/6_2/stdlib_osproc.o \
c_code/6_2/stdlib_streams.o \
c_code/6_2/stdlib_cpuinfo.o \
c_code/6_2/stdlib_sets.o \
c_code/6_2/stdlib_math.o \
c_code/6_2/stdlib_tables.o \
c_code/6_2/compiler_ropes.o \
c_code/6_2/compiler_platform.o \
c_code/6_2/stdlib_terminal.o \
c_code/6_2/stdlib_macros.o \
c_code/6_2/stdlib_termios.o \
c_code/6_2/compiler_nversion.o \
c_code/6_2/compiler_condsyms.o \
c_code/6_2/compiler_idents.o \
c_code/6_2/compiler_extccomp.o \
c_code/6_2/stdlib_securehash.o \
c_code/6_2/stdlib_unsigned.o \
c_code/6_2/compiler_wordrecg.o \
c_code/6_2/compiler_nimblecmd.o \
c_code/6_2/stdlib_parseopt.o \
c_code/6_2/compiler_lexer.o \
c_code/6_2/compiler_nimlexbase.o \
c_code/6_2/compiler_llstream.o \
c_code/6_2/compiler_nimconf.o \
c_code/6_2/compiler_main.o \
c_code/6_2/compiler_ast.o \
c_code/6_2/stdlib_intsets.o \
c_code/6_2/compiler_idgen.o \
c_code/6_2/compiler_astalgo.o \
c_code/6_2/compiler_rodutils.o \
c_code/6_2/compiler_syntaxes.o \
c_code/6_2/compiler_parser.o \
c_code/6_2/compiler_pbraces.o \
c_code/6_2/compiler_filters.o \
c_code/6_2/compiler_renderer.o \
c_code/6_2/compiler_filter_tmpl.o \
c_code/6_2/compiler_rodread.o \
c_code/6_2/compiler_types.o \
c_code/6_2/compiler_trees.o \
c_code/6_2/stdlib_memfiles.o \
c_code/6_2/compiler_rodwrite.o \
c_code/6_2/compiler_passes.o \
c_code/6_2/compiler_magicsys.o \
c_code/6_2/compiler_nimsets.o \
c_code/6_2/compiler_bitsets.o \
c_code/6_2/compiler_importer.o \
c_code/6_2/compiler_lookups.o \
c_code/6_2/compiler_semdata.o \
c_code/6_2/compiler_treetab.o \
c_code/6_2/compiler_vmdef.o \
c_code/6_2/compiler_prettybase.o \
c_code/6_2/stdlib_lexbase.o \
c_code/6_2/compiler_sem.o \
c_code/6_2/compiler_semfold.o \
c_code/6_2/compiler_saturate.o \
c_code/6_2/compiler_procfind.o \
c_code/6_2/compiler_pragmas.o \
c_code/6_2/compiler_semtypinst.o \
c_code/6_2/compiler_sigmatch.o \
c_code/6_2/compiler_parampatterns.o \
c_code/6_2/compiler_pretty.o \
c_code/6_2/compiler_docgen.o \
c_code/6_2/docutils_rstast.o \
c_code/6_2/stdlib_json.o \
c_code/6_2/stdlib_unicode.o \
c_code/6_2/docutils_rst.o \
c_code/6_2/docutils_rstgen.o \
c_code/6_2/docutils_highlite.o \
c_code/6_2/stdlib_sequtils.o \
c_code/6_2/stdlib_algorithm.o \
c_code/6_2/compiler_sempass2.o \
c_code/6_2/compiler_guards.o \
c_code/6_2/compiler_writetracking.o \
c_code/6_2/stdlib_xmltree.o \
c_code/6_2/stdlib_cgi.o \
c_code/6_2/stdlib_cookies.o \
c_code/6_2/compiler_typesrenderer.o \
c_code/6_2/compiler_transf.o \
c_code/6_2/compiler_cgmeth.o \
c_code/6_2/compiler_lambdalifting.o \
c_code/6_2/compiler_lowerings.o \
c_code/6_2/compiler_vm.o \
c_code/6_2/compiler_vmgen.o \
c_code/6_2/compiler_vmdeps.o \
c_code/6_2/compiler_vmmarshal.o \
c_code/6_2/compiler_evaltempl.o \
c_code/6_2/compiler_aliases.o \
c_code/6_2/compiler_patterns.o \
c_code/6_2/compiler_semmacrosanity.o \
c_code/6_2/compiler_semparallel.o \
c_code/6_2/compiler_pluginsupport.o \
c_code/6_2/compiler_active.o \
c_code/6_2/compiler_locals.o \
c_code/6_2/compiler_itersgen.o \
c_code/6_2/compiler_cgen.o \
c_code/6_2/compiler_ccgutils.o \
c_code/6_2/compiler_cgendata.o \
c_code/6_2/compiler_ccgmerge.o \
c_code/6_2/compiler_jsgen.o \
c_code/6_2/compiler_passaux.o \
c_code/6_2/compiler_depends.o \
c_code/6_2/compiler_docgen2.o \
c_code/6_2/compiler_service.o \
c_code/6_2/stdlib_net.o \
c_code/6_2/stdlib_nativesockets.o \
c_code/6_2/compiler_modules.o \
c_code/6_2/compiler_nodejs.o \
c_code/6_2/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  powerpc64)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  arm)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  mips)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  mipsel)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc64el)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  arm64)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  *)
    echo 2>&1 "Error: no C code generated for: [$myos: $mycpu]"
    exit 1
    ;;
  esac
  ;;
openbsd) 
  case $mycpu in
  i386)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_nim.c -o c_code/7_1/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_system.c -o c_code/7_1/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_testability.c -o c_code/7_1/compiler_testability.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_commands.c -o c_code/7_1/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_os.c -o c_code/7_1/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_strutils.c -o c_code/7_1/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_parseutils.c -o c_code/7_1/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_times.c -o c_code/7_1/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_posix.c -o c_code/7_1/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_msgs.c -o c_code/7_1/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_options.c -o c_code/7_1/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_lists.c -o c_code/7_1/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_strtabs.c -o c_code/7_1/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_hashes.c -o c_code/7_1/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_etcpriv.c -o c_code/7_1/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_osproc.c -o c_code/7_1/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_streams.c -o c_code/7_1/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_cpuinfo.c -o c_code/7_1/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_sets.c -o c_code/7_1/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_math.c -o c_code/7_1/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_tables.c -o c_code/7_1/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_ropes.c -o c_code/7_1/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_platform.c -o c_code/7_1/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_terminal.c -o c_code/7_1/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_macros.c -o c_code/7_1/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_termios.c -o c_code/7_1/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_nversion.c -o c_code/7_1/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_condsyms.c -o c_code/7_1/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_idents.c -o c_code/7_1/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_extccomp.c -o c_code/7_1/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_securehash.c -o c_code/7_1/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_unsigned.c -o c_code/7_1/stdlib_unsigned.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_wordrecg.c -o c_code/7_1/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_nimblecmd.c -o c_code/7_1/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_parseopt.c -o c_code/7_1/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_lexer.c -o c_code/7_1/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_nimlexbase.c -o c_code/7_1/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_llstream.c -o c_code/7_1/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_nimconf.c -o c_code/7_1/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_main.c -o c_code/7_1/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_ast.c -o c_code/7_1/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_intsets.c -o c_code/7_1/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_idgen.c -o c_code/7_1/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_astalgo.c -o c_code/7_1/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_rodutils.c -o c_code/7_1/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_syntaxes.c -o c_code/7_1/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_parser.c -o c_code/7_1/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_pbraces.c -o c_code/7_1/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_filters.c -o c_code/7_1/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_renderer.c -o c_code/7_1/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_filter_tmpl.c -o c_code/7_1/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_rodread.c -o c_code/7_1/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_types.c -o c_code/7_1/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_trees.c -o c_code/7_1/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_memfiles.c -o c_code/7_1/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_rodwrite.c -o c_code/7_1/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_passes.c -o c_code/7_1/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_magicsys.c -o c_code/7_1/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_nimsets.c -o c_code/7_1/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_bitsets.c -o c_code/7_1/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_importer.c -o c_code/7_1/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_lookups.c -o c_code/7_1/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_semdata.c -o c_code/7_1/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_treetab.c -o c_code/7_1/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_vmdef.c -o c_code/7_1/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_prettybase.c -o c_code/7_1/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_lexbase.c -o c_code/7_1/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_sem.c -o c_code/7_1/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_semfold.c -o c_code/7_1/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_saturate.c -o c_code/7_1/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_procfind.c -o c_code/7_1/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_pragmas.c -o c_code/7_1/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_semtypinst.c -o c_code/7_1/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_sigmatch.c -o c_code/7_1/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_parampatterns.c -o c_code/7_1/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_pretty.c -o c_code/7_1/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_docgen.c -o c_code/7_1/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/docutils_rstast.c -o c_code/7_1/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_json.c -o c_code/7_1/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_unicode.c -o c_code/7_1/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/docutils_rst.c -o c_code/7_1/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/docutils_rstgen.c -o c_code/7_1/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/docutils_highlite.c -o c_code/7_1/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_sequtils.c -o c_code/7_1/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_algorithm.c -o c_code/7_1/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_sempass2.c -o c_code/7_1/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_guards.c -o c_code/7_1/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_writetracking.c -o c_code/7_1/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_xmltree.c -o c_code/7_1/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_cgi.c -o c_code/7_1/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_cookies.c -o c_code/7_1/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_typesrenderer.c -o c_code/7_1/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_transf.c -o c_code/7_1/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_cgmeth.c -o c_code/7_1/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_lambdalifting.c -o c_code/7_1/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_lowerings.c -o c_code/7_1/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_vm.c -o c_code/7_1/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_vmgen.c -o c_code/7_1/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_vmdeps.c -o c_code/7_1/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_vmmarshal.c -o c_code/7_1/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_evaltempl.c -o c_code/7_1/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_aliases.c -o c_code/7_1/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_patterns.c -o c_code/7_1/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_semmacrosanity.c -o c_code/7_1/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_semparallel.c -o c_code/7_1/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_pluginsupport.c -o c_code/7_1/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_active.c -o c_code/7_1/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_locals.c -o c_code/7_1/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_itersgen.c -o c_code/7_1/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_cgen.c -o c_code/7_1/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_ccgutils.c -o c_code/7_1/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_cgendata.c -o c_code/7_1/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_ccgmerge.c -o c_code/7_1/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_jsgen.c -o c_code/7_1/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_passaux.c -o c_code/7_1/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_depends.c -o c_code/7_1/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_docgen2.c -o c_code/7_1/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_service.c -o c_code/7_1/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_net.c -o c_code/7_1/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_nativesockets.c -o c_code/7_1/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_modules.c -o c_code/7_1/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_nodejs.c -o c_code/7_1/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_scriptconfig.c -o c_code/7_1/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/7_1/compiler_nim.o \
c_code/7_1/stdlib_system.o \
c_code/7_1/compiler_testability.o \
c_code/7_1/compiler_commands.o \
c_code/7_1/stdlib_os.o \
c_code/7_1/stdlib_strutils.o \
c_code/7_1/stdlib_parseutils.o \
c_code/7_1/stdlib_times.o \
c_code/7_1/stdlib_posix.o \
c_code/7_1/compiler_msgs.o \
c_code/7_1/compiler_options.o \
c_code/7_1/compiler_lists.o \
c_code/7_1/stdlib_strtabs.o \
c_code/7_1/stdlib_hashes.o \
c_code/7_1/stdlib_etcpriv.o \
c_code/7_1/stdlib_osproc.o \
c_code/7_1/stdlib_streams.o \
c_code/7_1/stdlib_cpuinfo.o \
c_code/7_1/stdlib_sets.o \
c_code/7_1/stdlib_math.o \
c_code/7_1/stdlib_tables.o \
c_code/7_1/compiler_ropes.o \
c_code/7_1/compiler_platform.o \
c_code/7_1/stdlib_terminal.o \
c_code/7_1/stdlib_macros.o \
c_code/7_1/stdlib_termios.o \
c_code/7_1/compiler_nversion.o \
c_code/7_1/compiler_condsyms.o \
c_code/7_1/compiler_idents.o \
c_code/7_1/compiler_extccomp.o \
c_code/7_1/stdlib_securehash.o \
c_code/7_1/stdlib_unsigned.o \
c_code/7_1/compiler_wordrecg.o \
c_code/7_1/compiler_nimblecmd.o \
c_code/7_1/stdlib_parseopt.o \
c_code/7_1/compiler_lexer.o \
c_code/7_1/compiler_nimlexbase.o \
c_code/7_1/compiler_llstream.o \
c_code/7_1/compiler_nimconf.o \
c_code/7_1/compiler_main.o \
c_code/7_1/compiler_ast.o \
c_code/7_1/stdlib_intsets.o \
c_code/7_1/compiler_idgen.o \
c_code/7_1/compiler_astalgo.o \
c_code/7_1/compiler_rodutils.o \
c_code/7_1/compiler_syntaxes.o \
c_code/7_1/compiler_parser.o \
c_code/7_1/compiler_pbraces.o \
c_code/7_1/compiler_filters.o \
c_code/7_1/compiler_renderer.o \
c_code/7_1/compiler_filter_tmpl.o \
c_code/7_1/compiler_rodread.o \
c_code/7_1/compiler_types.o \
c_code/7_1/compiler_trees.o \
c_code/7_1/stdlib_memfiles.o \
c_code/7_1/compiler_rodwrite.o \
c_code/7_1/compiler_passes.o \
c_code/7_1/compiler_magicsys.o \
c_code/7_1/compiler_nimsets.o \
c_code/7_1/compiler_bitsets.o \
c_code/7_1/compiler_importer.o \
c_code/7_1/compiler_lookups.o \
c_code/7_1/compiler_semdata.o \
c_code/7_1/compiler_treetab.o \
c_code/7_1/compiler_vmdef.o \
c_code/7_1/compiler_prettybase.o \
c_code/7_1/stdlib_lexbase.o \
c_code/7_1/compiler_sem.o \
c_code/7_1/compiler_semfold.o \
c_code/7_1/compiler_saturate.o \
c_code/7_1/compiler_procfind.o \
c_code/7_1/compiler_pragmas.o \
c_code/7_1/compiler_semtypinst.o \
c_code/7_1/compiler_sigmatch.o \
c_code/7_1/compiler_parampatterns.o \
c_code/7_1/compiler_pretty.o \
c_code/7_1/compiler_docgen.o \
c_code/7_1/docutils_rstast.o \
c_code/7_1/stdlib_json.o \
c_code/7_1/stdlib_unicode.o \
c_code/7_1/docutils_rst.o \
c_code/7_1/docutils_rstgen.o \
c_code/7_1/docutils_highlite.o \
c_code/7_1/stdlib_sequtils.o \
c_code/7_1/stdlib_algorithm.o \
c_code/7_1/compiler_sempass2.o \
c_code/7_1/compiler_guards.o \
c_code/7_1/compiler_writetracking.o \
c_code/7_1/stdlib_xmltree.o \
c_code/7_1/stdlib_cgi.o \
c_code/7_1/stdlib_cookies.o \
c_code/7_1/compiler_typesrenderer.o \
c_code/7_1/compiler_transf.o \
c_code/7_1/compiler_cgmeth.o \
c_code/7_1/compiler_lambdalifting.o \
c_code/7_1/compiler_lowerings.o \
c_code/7_1/compiler_vm.o \
c_code/7_1/compiler_vmgen.o \
c_code/7_1/compiler_vmdeps.o \
c_code/7_1/compiler_vmmarshal.o \
c_code/7_1/compiler_evaltempl.o \
c_code/7_1/compiler_aliases.o \
c_code/7_1/compiler_patterns.o \
c_code/7_1/compiler_semmacrosanity.o \
c_code/7_1/compiler_semparallel.o \
c_code/7_1/compiler_pluginsupport.o \
c_code/7_1/compiler_active.o \
c_code/7_1/compiler_locals.o \
c_code/7_1/compiler_itersgen.o \
c_code/7_1/compiler_cgen.o \
c_code/7_1/compiler_ccgutils.o \
c_code/7_1/compiler_cgendata.o \
c_code/7_1/compiler_ccgmerge.o \
c_code/7_1/compiler_jsgen.o \
c_code/7_1/compiler_passaux.o \
c_code/7_1/compiler_depends.o \
c_code/7_1/compiler_docgen2.o \
c_code/7_1/compiler_service.o \
c_code/7_1/stdlib_net.o \
c_code/7_1/stdlib_nativesockets.o \
c_code/7_1/compiler_modules.o \
c_code/7_1/compiler_nodejs.o \
c_code/7_1/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  amd64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_nim.c -o c_code/7_2/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_system.c -o c_code/7_2/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_testability.c -o c_code/7_2/compiler_testability.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_commands.c -o c_code/7_2/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_os.c -o c_code/7_2/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_strutils.c -o c_code/7_2/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_parseutils.c -o c_code/7_2/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_times.c -o c_code/7_2/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_posix.c -o c_code/7_2/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_msgs.c -o c_code/7_2/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_options.c -o c_code/7_2/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_lists.c -o c_code/7_2/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_strtabs.c -o c_code/7_2/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_hashes.c -o c_code/7_2/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_etcpriv.c -o c_code/7_2/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_osproc.c -o c_code/7_2/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_streams.c -o c_code/7_2/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_cpuinfo.c -o c_code/7_2/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_sets.c -o c_code/7_2/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_math.c -o c_code/7_2/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_tables.c -o c_code/7_2/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_ropes.c -o c_code/7_2/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_platform.c -o c_code/7_2/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_terminal.c -o c_code/7_2/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_macros.c -o c_code/7_2/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_termios.c -o c_code/7_2/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_nversion.c -o c_code/7_2/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_condsyms.c -o c_code/7_2/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_idents.c -o c_code/7_2/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_extccomp.c -o c_code/7_2/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_securehash.c -o c_code/7_2/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_unsigned.c -o c_code/7_2/stdlib_unsigned.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_wordrecg.c -o c_code/7_2/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_nimblecmd.c -o c_code/7_2/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_parseopt.c -o c_code/7_2/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_lexer.c -o c_code/7_2/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_nimlexbase.c -o c_code/7_2/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_llstream.c -o c_code/7_2/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_nimconf.c -o c_code/7_2/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_main.c -o c_code/7_2/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_ast.c -o c_code/7_2/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_intsets.c -o c_code/7_2/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_idgen.c -o c_code/7_2/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_astalgo.c -o c_code/7_2/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_rodutils.c -o c_code/7_2/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_syntaxes.c -o c_code/7_2/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_parser.c -o c_code/7_2/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_pbraces.c -o c_code/7_2/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_filters.c -o c_code/7_2/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_renderer.c -o c_code/7_2/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_filter_tmpl.c -o c_code/7_2/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_rodread.c -o c_code/7_2/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_types.c -o c_code/7_2/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_trees.c -o c_code/7_2/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_memfiles.c -o c_code/7_2/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_rodwrite.c -o c_code/7_2/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_passes.c -o c_code/7_2/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_magicsys.c -o c_code/7_2/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_nimsets.c -o c_code/7_2/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_bitsets.c -o c_code/7_2/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_importer.c -o c_code/7_2/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_lookups.c -o c_code/7_2/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_semdata.c -o c_code/7_2/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_treetab.c -o c_code/7_2/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_vmdef.c -o c_code/7_2/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_prettybase.c -o c_code/7_2/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_lexbase.c -o c_code/7_2/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_sem.c -o c_code/7_2/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_semfold.c -o c_code/7_2/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_saturate.c -o c_code/7_2/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_procfind.c -o c_code/7_2/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_pragmas.c -o c_code/7_2/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_semtypinst.c -o c_code/7_2/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_sigmatch.c -o c_code/7_2/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_parampatterns.c -o c_code/7_2/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_pretty.c -o c_code/7_2/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_docgen.c -o c_code/7_2/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/docutils_rstast.c -o c_code/7_2/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_json.c -o c_code/7_2/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_unicode.c -o c_code/7_2/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/docutils_rst.c -o c_code/7_2/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/docutils_rstgen.c -o c_code/7_2/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/docutils_highlite.c -o c_code/7_2/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_sequtils.c -o c_code/7_2/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_algorithm.c -o c_code/7_2/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_sempass2.c -o c_code/7_2/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_guards.c -o c_code/7_2/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_writetracking.c -o c_code/7_2/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_xmltree.c -o c_code/7_2/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_cgi.c -o c_code/7_2/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_cookies.c -o c_code/7_2/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_typesrenderer.c -o c_code/7_2/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_transf.c -o c_code/7_2/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_cgmeth.c -o c_code/7_2/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_lambdalifting.c -o c_code/7_2/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_lowerings.c -o c_code/7_2/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_vm.c -o c_code/7_2/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_vmgen.c -o c_code/7_2/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_vmdeps.c -o c_code/7_2/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_vmmarshal.c -o c_code/7_2/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_evaltempl.c -o c_code/7_2/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_aliases.c -o c_code/7_2/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_patterns.c -o c_code/7_2/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_semmacrosanity.c -o c_code/7_2/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_semparallel.c -o c_code/7_2/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_pluginsupport.c -o c_code/7_2/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_active.c -o c_code/7_2/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_locals.c -o c_code/7_2/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_itersgen.c -o c_code/7_2/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_cgen.c -o c_code/7_2/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_ccgutils.c -o c_code/7_2/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_cgendata.c -o c_code/7_2/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_ccgmerge.c -o c_code/7_2/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_jsgen.c -o c_code/7_2/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_passaux.c -o c_code/7_2/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_depends.c -o c_code/7_2/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_docgen2.c -o c_code/7_2/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_service.c -o c_code/7_2/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_net.c -o c_code/7_2/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_nativesockets.c -o c_code/7_2/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_modules.c -o c_code/7_2/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_nodejs.c -o c_code/7_2/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_scriptconfig.c -o c_code/7_2/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/7_2/compiler_nim.o \
c_code/7_2/stdlib_system.o \
c_code/7_2/compiler_testability.o \
c_code/7_2/compiler_commands.o \
c_code/7_2/stdlib_os.o \
c_code/7_2/stdlib_strutils.o \
c_code/7_2/stdlib_parseutils.o \
c_code/7_2/stdlib_times.o \
c_code/7_2/stdlib_posix.o \
c_code/7_2/compiler_msgs.o \
c_code/7_2/compiler_options.o \
c_code/7_2/compiler_lists.o \
c_code/7_2/stdlib_strtabs.o \
c_code/7_2/stdlib_hashes.o \
c_code/7_2/stdlib_etcpriv.o \
c_code/7_2/stdlib_osproc.o \
c_code/7_2/stdlib_streams.o \
c_code/7_2/stdlib_cpuinfo.o \
c_code/7_2/stdlib_sets.o \
c_code/7_2/stdlib_math.o \
c_code/7_2/stdlib_tables.o \
c_code/7_2/compiler_ropes.o \
c_code/7_2/compiler_platform.o \
c_code/7_2/stdlib_terminal.o \
c_code/7_2/stdlib_macros.o \
c_code/7_2/stdlib_termios.o \
c_code/7_2/compiler_nversion.o \
c_code/7_2/compiler_condsyms.o \
c_code/7_2/compiler_idents.o \
c_code/7_2/compiler_extccomp.o \
c_code/7_2/stdlib_securehash.o \
c_code/7_2/stdlib_unsigned.o \
c_code/7_2/compiler_wordrecg.o \
c_code/7_2/compiler_nimblecmd.o \
c_code/7_2/stdlib_parseopt.o \
c_code/7_2/compiler_lexer.o \
c_code/7_2/compiler_nimlexbase.o \
c_code/7_2/compiler_llstream.o \
c_code/7_2/compiler_nimconf.o \
c_code/7_2/compiler_main.o \
c_code/7_2/compiler_ast.o \
c_code/7_2/stdlib_intsets.o \
c_code/7_2/compiler_idgen.o \
c_code/7_2/compiler_astalgo.o \
c_code/7_2/compiler_rodutils.o \
c_code/7_2/compiler_syntaxes.o \
c_code/7_2/compiler_parser.o \
c_code/7_2/compiler_pbraces.o \
c_code/7_2/compiler_filters.o \
c_code/7_2/compiler_renderer.o \
c_code/7_2/compiler_filter_tmpl.o \
c_code/7_2/compiler_rodread.o \
c_code/7_2/compiler_types.o \
c_code/7_2/compiler_trees.o \
c_code/7_2/stdlib_memfiles.o \
c_code/7_2/compiler_rodwrite.o \
c_code/7_2/compiler_passes.o \
c_code/7_2/compiler_magicsys.o \
c_code/7_2/compiler_nimsets.o \
c_code/7_2/compiler_bitsets.o \
c_code/7_2/compiler_importer.o \
c_code/7_2/compiler_lookups.o \
c_code/7_2/compiler_semdata.o \
c_code/7_2/compiler_treetab.o \
c_code/7_2/compiler_vmdef.o \
c_code/7_2/compiler_prettybase.o \
c_code/7_2/stdlib_lexbase.o \
c_code/7_2/compiler_sem.o \
c_code/7_2/compiler_semfold.o \
c_code/7_2/compiler_saturate.o \
c_code/7_2/compiler_procfind.o \
c_code/7_2/compiler_pragmas.o \
c_code/7_2/compiler_semtypinst.o \
c_code/7_2/compiler_sigmatch.o \
c_code/7_2/compiler_parampatterns.o \
c_code/7_2/compiler_pretty.o \
c_code/7_2/compiler_docgen.o \
c_code/7_2/docutils_rstast.o \
c_code/7_2/stdlib_json.o \
c_code/7_2/stdlib_unicode.o \
c_code/7_2/docutils_rst.o \
c_code/7_2/docutils_rstgen.o \
c_code/7_2/docutils_highlite.o \
c_code/7_2/stdlib_sequtils.o \
c_code/7_2/stdlib_algorithm.o \
c_code/7_2/compiler_sempass2.o \
c_code/7_2/compiler_guards.o \
c_code/7_2/compiler_writetracking.o \
c_code/7_2/stdlib_xmltree.o \
c_code/7_2/stdlib_cgi.o \
c_code/7_2/stdlib_cookies.o \
c_code/7_2/compiler_typesrenderer.o \
c_code/7_2/compiler_transf.o \
c_code/7_2/compiler_cgmeth.o \
c_code/7_2/compiler_lambdalifting.o \
c_code/7_2/compiler_lowerings.o \
c_code/7_2/compiler_vm.o \
c_code/7_2/compiler_vmgen.o \
c_code/7_2/compiler_vmdeps.o \
c_code/7_2/compiler_vmmarshal.o \
c_code/7_2/compiler_evaltempl.o \
c_code/7_2/compiler_aliases.o \
c_code/7_2/compiler_patterns.o \
c_code/7_2/compiler_semmacrosanity.o \
c_code/7_2/compiler_semparallel.o \
c_code/7_2/compiler_pluginsupport.o \
c_code/7_2/compiler_active.o \
c_code/7_2/compiler_locals.o \
c_code/7_2/compiler_itersgen.o \
c_code/7_2/compiler_cgen.o \
c_code/7_2/compiler_ccgutils.o \
c_code/7_2/compiler_cgendata.o \
c_code/7_2/compiler_ccgmerge.o \
c_code/7_2/compiler_jsgen.o \
c_code/7_2/compiler_passaux.o \
c_code/7_2/compiler_depends.o \
c_code/7_2/compiler_docgen2.o \
c_code/7_2/compiler_service.o \
c_code/7_2/stdlib_net.o \
c_code/7_2/stdlib_nativesockets.o \
c_code/7_2/compiler_modules.o \
c_code/7_2/compiler_nodejs.o \
c_code/7_2/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  powerpc64)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  arm)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  mips)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  mipsel)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc64el)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  arm64)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  *)
    echo 2>&1 "Error: no C code generated for: [$myos: $mycpu]"
    exit 1
    ;;
  esac
  ;;
haiku) 
  case $mycpu in
  i386)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_nim.c -o c_code/8_1/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_system.c -o c_code/8_1/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_testability.c -o c_code/8_1/compiler_testability.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_commands.c -o c_code/8_1/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_os.c -o c_code/8_1/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_strutils.c -o c_code/8_1/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_parseutils.c -o c_code/8_1/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_times.c -o c_code/8_1/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_posix.c -o c_code/8_1/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_msgs.c -o c_code/8_1/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_options.c -o c_code/8_1/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_lists.c -o c_code/8_1/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_strtabs.c -o c_code/8_1/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_hashes.c -o c_code/8_1/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_etcpriv.c -o c_code/8_1/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_osproc.c -o c_code/8_1/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_streams.c -o c_code/8_1/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_cpuinfo.c -o c_code/8_1/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_sets.c -o c_code/8_1/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_math.c -o c_code/8_1/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_tables.c -o c_code/8_1/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_ropes.c -o c_code/8_1/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_platform.c -o c_code/8_1/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_terminal.c -o c_code/8_1/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_macros.c -o c_code/8_1/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_termios.c -o c_code/8_1/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_nversion.c -o c_code/8_1/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_condsyms.c -o c_code/8_1/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_idents.c -o c_code/8_1/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_extccomp.c -o c_code/8_1/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_securehash.c -o c_code/8_1/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_unsigned.c -o c_code/8_1/stdlib_unsigned.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_wordrecg.c -o c_code/8_1/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_nimblecmd.c -o c_code/8_1/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_parseopt.c -o c_code/8_1/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_lexer.c -o c_code/8_1/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_nimlexbase.c -o c_code/8_1/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_llstream.c -o c_code/8_1/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_nimconf.c -o c_code/8_1/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_main.c -o c_code/8_1/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_ast.c -o c_code/8_1/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_intsets.c -o c_code/8_1/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_idgen.c -o c_code/8_1/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_astalgo.c -o c_code/8_1/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_rodutils.c -o c_code/8_1/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_syntaxes.c -o c_code/8_1/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_parser.c -o c_code/8_1/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_pbraces.c -o c_code/8_1/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_filters.c -o c_code/8_1/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_renderer.c -o c_code/8_1/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_filter_tmpl.c -o c_code/8_1/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_rodread.c -o c_code/8_1/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_types.c -o c_code/8_1/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_trees.c -o c_code/8_1/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_memfiles.c -o c_code/8_1/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_rodwrite.c -o c_code/8_1/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_passes.c -o c_code/8_1/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_magicsys.c -o c_code/8_1/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_nimsets.c -o c_code/8_1/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_bitsets.c -o c_code/8_1/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_importer.c -o c_code/8_1/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_lookups.c -o c_code/8_1/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_semdata.c -o c_code/8_1/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_treetab.c -o c_code/8_1/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_vmdef.c -o c_code/8_1/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_prettybase.c -o c_code/8_1/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_lexbase.c -o c_code/8_1/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_sem.c -o c_code/8_1/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_semfold.c -o c_code/8_1/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_saturate.c -o c_code/8_1/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_procfind.c -o c_code/8_1/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_pragmas.c -o c_code/8_1/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_semtypinst.c -o c_code/8_1/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_sigmatch.c -o c_code/8_1/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_parampatterns.c -o c_code/8_1/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_pretty.c -o c_code/8_1/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_docgen.c -o c_code/8_1/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/docutils_rstast.c -o c_code/8_1/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_json.c -o c_code/8_1/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_unicode.c -o c_code/8_1/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/docutils_rst.c -o c_code/8_1/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/docutils_rstgen.c -o c_code/8_1/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/docutils_highlite.c -o c_code/8_1/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_sequtils.c -o c_code/8_1/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_algorithm.c -o c_code/8_1/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_sempass2.c -o c_code/8_1/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_guards.c -o c_code/8_1/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_writetracking.c -o c_code/8_1/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_xmltree.c -o c_code/8_1/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_cgi.c -o c_code/8_1/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_cookies.c -o c_code/8_1/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_typesrenderer.c -o c_code/8_1/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_transf.c -o c_code/8_1/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_cgmeth.c -o c_code/8_1/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_lambdalifting.c -o c_code/8_1/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_lowerings.c -o c_code/8_1/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_vm.c -o c_code/8_1/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_vmgen.c -o c_code/8_1/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_vmdeps.c -o c_code/8_1/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_vmmarshal.c -o c_code/8_1/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_evaltempl.c -o c_code/8_1/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_aliases.c -o c_code/8_1/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_patterns.c -o c_code/8_1/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_semmacrosanity.c -o c_code/8_1/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_semparallel.c -o c_code/8_1/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_pluginsupport.c -o c_code/8_1/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_active.c -o c_code/8_1/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_locals.c -o c_code/8_1/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_itersgen.c -o c_code/8_1/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_cgen.c -o c_code/8_1/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_ccgutils.c -o c_code/8_1/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_cgendata.c -o c_code/8_1/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_ccgmerge.c -o c_code/8_1/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_jsgen.c -o c_code/8_1/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_passaux.c -o c_code/8_1/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_depends.c -o c_code/8_1/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_docgen2.c -o c_code/8_1/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_service.c -o c_code/8_1/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_net.c -o c_code/8_1/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_nativesockets.c -o c_code/8_1/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_modules.c -o c_code/8_1/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_nodejs.c -o c_code/8_1/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_scriptconfig.c -o c_code/8_1/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/8_1/compiler_nim.o \
c_code/8_1/stdlib_system.o \
c_code/8_1/compiler_testability.o \
c_code/8_1/compiler_commands.o \
c_code/8_1/stdlib_os.o \
c_code/8_1/stdlib_strutils.o \
c_code/8_1/stdlib_parseutils.o \
c_code/8_1/stdlib_times.o \
c_code/8_1/stdlib_posix.o \
c_code/8_1/compiler_msgs.o \
c_code/8_1/compiler_options.o \
c_code/8_1/compiler_lists.o \
c_code/8_1/stdlib_strtabs.o \
c_code/8_1/stdlib_hashes.o \
c_code/8_1/stdlib_etcpriv.o \
c_code/8_1/stdlib_osproc.o \
c_code/8_1/stdlib_streams.o \
c_code/8_1/stdlib_cpuinfo.o \
c_code/8_1/stdlib_sets.o \
c_code/8_1/stdlib_math.o \
c_code/8_1/stdlib_tables.o \
c_code/8_1/compiler_ropes.o \
c_code/8_1/compiler_platform.o \
c_code/8_1/stdlib_terminal.o \
c_code/8_1/stdlib_macros.o \
c_code/8_1/stdlib_termios.o \
c_code/8_1/compiler_nversion.o \
c_code/8_1/compiler_condsyms.o \
c_code/8_1/compiler_idents.o \
c_code/8_1/compiler_extccomp.o \
c_code/8_1/stdlib_securehash.o \
c_code/8_1/stdlib_unsigned.o \
c_code/8_1/compiler_wordrecg.o \
c_code/8_1/compiler_nimblecmd.o \
c_code/8_1/stdlib_parseopt.o \
c_code/8_1/compiler_lexer.o \
c_code/8_1/compiler_nimlexbase.o \
c_code/8_1/compiler_llstream.o \
c_code/8_1/compiler_nimconf.o \
c_code/8_1/compiler_main.o \
c_code/8_1/compiler_ast.o \
c_code/8_1/stdlib_intsets.o \
c_code/8_1/compiler_idgen.o \
c_code/8_1/compiler_astalgo.o \
c_code/8_1/compiler_rodutils.o \
c_code/8_1/compiler_syntaxes.o \
c_code/8_1/compiler_parser.o \
c_code/8_1/compiler_pbraces.o \
c_code/8_1/compiler_filters.o \
c_code/8_1/compiler_renderer.o \
c_code/8_1/compiler_filter_tmpl.o \
c_code/8_1/compiler_rodread.o \
c_code/8_1/compiler_types.o \
c_code/8_1/compiler_trees.o \
c_code/8_1/stdlib_memfiles.o \
c_code/8_1/compiler_rodwrite.o \
c_code/8_1/compiler_passes.o \
c_code/8_1/compiler_magicsys.o \
c_code/8_1/compiler_nimsets.o \
c_code/8_1/compiler_bitsets.o \
c_code/8_1/compiler_importer.o \
c_code/8_1/compiler_lookups.o \
c_code/8_1/compiler_semdata.o \
c_code/8_1/compiler_treetab.o \
c_code/8_1/compiler_vmdef.o \
c_code/8_1/compiler_prettybase.o \
c_code/8_1/stdlib_lexbase.o \
c_code/8_1/compiler_sem.o \
c_code/8_1/compiler_semfold.o \
c_code/8_1/compiler_saturate.o \
c_code/8_1/compiler_procfind.o \
c_code/8_1/compiler_pragmas.o \
c_code/8_1/compiler_semtypinst.o \
c_code/8_1/compiler_sigmatch.o \
c_code/8_1/compiler_parampatterns.o \
c_code/8_1/compiler_pretty.o \
c_code/8_1/compiler_docgen.o \
c_code/8_1/docutils_rstast.o \
c_code/8_1/stdlib_json.o \
c_code/8_1/stdlib_unicode.o \
c_code/8_1/docutils_rst.o \
c_code/8_1/docutils_rstgen.o \
c_code/8_1/docutils_highlite.o \
c_code/8_1/stdlib_sequtils.o \
c_code/8_1/stdlib_algorithm.o \
c_code/8_1/compiler_sempass2.o \
c_code/8_1/compiler_guards.o \
c_code/8_1/compiler_writetracking.o \
c_code/8_1/stdlib_xmltree.o \
c_code/8_1/stdlib_cgi.o \
c_code/8_1/stdlib_cookies.o \
c_code/8_1/compiler_typesrenderer.o \
c_code/8_1/compiler_transf.o \
c_code/8_1/compiler_cgmeth.o \
c_code/8_1/compiler_lambdalifting.o \
c_code/8_1/compiler_lowerings.o \
c_code/8_1/compiler_vm.o \
c_code/8_1/compiler_vmgen.o \
c_code/8_1/compiler_vmdeps.o \
c_code/8_1/compiler_vmmarshal.o \
c_code/8_1/compiler_evaltempl.o \
c_code/8_1/compiler_aliases.o \
c_code/8_1/compiler_patterns.o \
c_code/8_1/compiler_semmacrosanity.o \
c_code/8_1/compiler_semparallel.o \
c_code/8_1/compiler_pluginsupport.o \
c_code/8_1/compiler_active.o \
c_code/8_1/compiler_locals.o \
c_code/8_1/compiler_itersgen.o \
c_code/8_1/compiler_cgen.o \
c_code/8_1/compiler_ccgutils.o \
c_code/8_1/compiler_cgendata.o \
c_code/8_1/compiler_ccgmerge.o \
c_code/8_1/compiler_jsgen.o \
c_code/8_1/compiler_passaux.o \
c_code/8_1/compiler_depends.o \
c_code/8_1/compiler_docgen2.o \
c_code/8_1/compiler_service.o \
c_code/8_1/stdlib_net.o \
c_code/8_1/stdlib_nativesockets.o \
c_code/8_1/compiler_modules.o \
c_code/8_1/compiler_nodejs.o \
c_code/8_1/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  amd64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_nim.c -o c_code/8_2/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_system.c -o c_code/8_2/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_testability.c -o c_code/8_2/compiler_testability.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_commands.c -o c_code/8_2/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_os.c -o c_code/8_2/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_strutils.c -o c_code/8_2/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_parseutils.c -o c_code/8_2/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_times.c -o c_code/8_2/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_posix.c -o c_code/8_2/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_msgs.c -o c_code/8_2/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_options.c -o c_code/8_2/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_lists.c -o c_code/8_2/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_strtabs.c -o c_code/8_2/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_hashes.c -o c_code/8_2/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_etcpriv.c -o c_code/8_2/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_osproc.c -o c_code/8_2/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_streams.c -o c_code/8_2/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_cpuinfo.c -o c_code/8_2/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_sets.c -o c_code/8_2/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_math.c -o c_code/8_2/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_tables.c -o c_code/8_2/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_ropes.c -o c_code/8_2/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_platform.c -o c_code/8_2/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_terminal.c -o c_code/8_2/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_macros.c -o c_code/8_2/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_termios.c -o c_code/8_2/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_nversion.c -o c_code/8_2/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_condsyms.c -o c_code/8_2/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_idents.c -o c_code/8_2/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_extccomp.c -o c_code/8_2/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_securehash.c -o c_code/8_2/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_unsigned.c -o c_code/8_2/stdlib_unsigned.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_wordrecg.c -o c_code/8_2/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_nimblecmd.c -o c_code/8_2/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_parseopt.c -o c_code/8_2/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_lexer.c -o c_code/8_2/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_nimlexbase.c -o c_code/8_2/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_llstream.c -o c_code/8_2/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_nimconf.c -o c_code/8_2/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_main.c -o c_code/8_2/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_ast.c -o c_code/8_2/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_intsets.c -o c_code/8_2/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_idgen.c -o c_code/8_2/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_astalgo.c -o c_code/8_2/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_rodutils.c -o c_code/8_2/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_syntaxes.c -o c_code/8_2/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_parser.c -o c_code/8_2/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_pbraces.c -o c_code/8_2/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_filters.c -o c_code/8_2/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_renderer.c -o c_code/8_2/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_filter_tmpl.c -o c_code/8_2/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_rodread.c -o c_code/8_2/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_types.c -o c_code/8_2/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_trees.c -o c_code/8_2/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_memfiles.c -o c_code/8_2/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_rodwrite.c -o c_code/8_2/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_passes.c -o c_code/8_2/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_magicsys.c -o c_code/8_2/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_nimsets.c -o c_code/8_2/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_bitsets.c -o c_code/8_2/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_importer.c -o c_code/8_2/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_lookups.c -o c_code/8_2/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_semdata.c -o c_code/8_2/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_treetab.c -o c_code/8_2/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_vmdef.c -o c_code/8_2/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_prettybase.c -o c_code/8_2/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_lexbase.c -o c_code/8_2/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_sem.c -o c_code/8_2/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_semfold.c -o c_code/8_2/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_saturate.c -o c_code/8_2/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_procfind.c -o c_code/8_2/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_pragmas.c -o c_code/8_2/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_semtypinst.c -o c_code/8_2/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_sigmatch.c -o c_code/8_2/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_parampatterns.c -o c_code/8_2/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_pretty.c -o c_code/8_2/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_docgen.c -o c_code/8_2/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/docutils_rstast.c -o c_code/8_2/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_json.c -o c_code/8_2/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_unicode.c -o c_code/8_2/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/docutils_rst.c -o c_code/8_2/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/docutils_rstgen.c -o c_code/8_2/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/docutils_highlite.c -o c_code/8_2/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_sequtils.c -o c_code/8_2/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_algorithm.c -o c_code/8_2/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_sempass2.c -o c_code/8_2/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_guards.c -o c_code/8_2/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_writetracking.c -o c_code/8_2/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_xmltree.c -o c_code/8_2/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_cgi.c -o c_code/8_2/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_cookies.c -o c_code/8_2/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_typesrenderer.c -o c_code/8_2/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_transf.c -o c_code/8_2/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_cgmeth.c -o c_code/8_2/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_lambdalifting.c -o c_code/8_2/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_lowerings.c -o c_code/8_2/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_vm.c -o c_code/8_2/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_vmgen.c -o c_code/8_2/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_vmdeps.c -o c_code/8_2/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_vmmarshal.c -o c_code/8_2/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_evaltempl.c -o c_code/8_2/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_aliases.c -o c_code/8_2/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_patterns.c -o c_code/8_2/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_semmacrosanity.c -o c_code/8_2/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_semparallel.c -o c_code/8_2/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_pluginsupport.c -o c_code/8_2/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_active.c -o c_code/8_2/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_locals.c -o c_code/8_2/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_itersgen.c -o c_code/8_2/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_cgen.c -o c_code/8_2/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_ccgutils.c -o c_code/8_2/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_cgendata.c -o c_code/8_2/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_ccgmerge.c -o c_code/8_2/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_jsgen.c -o c_code/8_2/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_passaux.c -o c_code/8_2/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_depends.c -o c_code/8_2/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_docgen2.c -o c_code/8_2/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_service.c -o c_code/8_2/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_net.c -o c_code/8_2/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_nativesockets.c -o c_code/8_2/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_modules.c -o c_code/8_2/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_nodejs.c -o c_code/8_2/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_scriptconfig.c -o c_code/8_2/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/8_2/compiler_nim.o \
c_code/8_2/stdlib_system.o \
c_code/8_2/compiler_testability.o \
c_code/8_2/compiler_commands.o \
c_code/8_2/stdlib_os.o \
c_code/8_2/stdlib_strutils.o \
c_code/8_2/stdlib_parseutils.o \
c_code/8_2/stdlib_times.o \
c_code/8_2/stdlib_posix.o \
c_code/8_2/compiler_msgs.o \
c_code/8_2/compiler_options.o \
c_code/8_2/compiler_lists.o \
c_code/8_2/stdlib_strtabs.o \
c_code/8_2/stdlib_hashes.o \
c_code/8_2/stdlib_etcpriv.o \
c_code/8_2/stdlib_osproc.o \
c_code/8_2/stdlib_streams.o \
c_code/8_2/stdlib_cpuinfo.o \
c_code/8_2/stdlib_sets.o \
c_code/8_2/stdlib_math.o \
c_code/8_2/stdlib_tables.o \
c_code/8_2/compiler_ropes.o \
c_code/8_2/compiler_platform.o \
c_code/8_2/stdlib_terminal.o \
c_code/8_2/stdlib_macros.o \
c_code/8_2/stdlib_termios.o \
c_code/8_2/compiler_nversion.o \
c_code/8_2/compiler_condsyms.o \
c_code/8_2/compiler_idents.o \
c_code/8_2/compiler_extccomp.o \
c_code/8_2/stdlib_securehash.o \
c_code/8_2/stdlib_unsigned.o \
c_code/8_2/compiler_wordrecg.o \
c_code/8_2/compiler_nimblecmd.o \
c_code/8_2/stdlib_parseopt.o \
c_code/8_2/compiler_lexer.o \
c_code/8_2/compiler_nimlexbase.o \
c_code/8_2/compiler_llstream.o \
c_code/8_2/compiler_nimconf.o \
c_code/8_2/compiler_main.o \
c_code/8_2/compiler_ast.o \
c_code/8_2/stdlib_intsets.o \
c_code/8_2/compiler_idgen.o \
c_code/8_2/compiler_astalgo.o \
c_code/8_2/compiler_rodutils.o \
c_code/8_2/compiler_syntaxes.o \
c_code/8_2/compiler_parser.o \
c_code/8_2/compiler_pbraces.o \
c_code/8_2/compiler_filters.o \
c_code/8_2/compiler_renderer.o \
c_code/8_2/compiler_filter_tmpl.o \
c_code/8_2/compiler_rodread.o \
c_code/8_2/compiler_types.o \
c_code/8_2/compiler_trees.o \
c_code/8_2/stdlib_memfiles.o \
c_code/8_2/compiler_rodwrite.o \
c_code/8_2/compiler_passes.o \
c_code/8_2/compiler_magicsys.o \
c_code/8_2/compiler_nimsets.o \
c_code/8_2/compiler_bitsets.o \
c_code/8_2/compiler_importer.o \
c_code/8_2/compiler_lookups.o \
c_code/8_2/compiler_semdata.o \
c_code/8_2/compiler_treetab.o \
c_code/8_2/compiler_vmdef.o \
c_code/8_2/compiler_prettybase.o \
c_code/8_2/stdlib_lexbase.o \
c_code/8_2/compiler_sem.o \
c_code/8_2/compiler_semfold.o \
c_code/8_2/compiler_saturate.o \
c_code/8_2/compiler_procfind.o \
c_code/8_2/compiler_pragmas.o \
c_code/8_2/compiler_semtypinst.o \
c_code/8_2/compiler_sigmatch.o \
c_code/8_2/compiler_parampatterns.o \
c_code/8_2/compiler_pretty.o \
c_code/8_2/compiler_docgen.o \
c_code/8_2/docutils_rstast.o \
c_code/8_2/stdlib_json.o \
c_code/8_2/stdlib_unicode.o \
c_code/8_2/docutils_rst.o \
c_code/8_2/docutils_rstgen.o \
c_code/8_2/docutils_highlite.o \
c_code/8_2/stdlib_sequtils.o \
c_code/8_2/stdlib_algorithm.o \
c_code/8_2/compiler_sempass2.o \
c_code/8_2/compiler_guards.o \
c_code/8_2/compiler_writetracking.o \
c_code/8_2/stdlib_xmltree.o \
c_code/8_2/stdlib_cgi.o \
c_code/8_2/stdlib_cookies.o \
c_code/8_2/compiler_typesrenderer.o \
c_code/8_2/compiler_transf.o \
c_code/8_2/compiler_cgmeth.o \
c_code/8_2/compiler_lambdalifting.o \
c_code/8_2/compiler_lowerings.o \
c_code/8_2/compiler_vm.o \
c_code/8_2/compiler_vmgen.o \
c_code/8_2/compiler_vmdeps.o \
c_code/8_2/compiler_vmmarshal.o \
c_code/8_2/compiler_evaltempl.o \
c_code/8_2/compiler_aliases.o \
c_code/8_2/compiler_patterns.o \
c_code/8_2/compiler_semmacrosanity.o \
c_code/8_2/compiler_semparallel.o \
c_code/8_2/compiler_pluginsupport.o \
c_code/8_2/compiler_active.o \
c_code/8_2/compiler_locals.o \
c_code/8_2/compiler_itersgen.o \
c_code/8_2/compiler_cgen.o \
c_code/8_2/compiler_ccgutils.o \
c_code/8_2/compiler_cgendata.o \
c_code/8_2/compiler_ccgmerge.o \
c_code/8_2/compiler_jsgen.o \
c_code/8_2/compiler_passaux.o \
c_code/8_2/compiler_depends.o \
c_code/8_2/compiler_docgen2.o \
c_code/8_2/compiler_service.o \
c_code/8_2/stdlib_net.o \
c_code/8_2/stdlib_nativesockets.o \
c_code/8_2/compiler_modules.o \
c_code/8_2/compiler_nodejs.o \
c_code/8_2/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  powerpc64)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  arm)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  mips)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  mipsel)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc64el)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  arm64)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
    ;;
  *)
    echo 2>&1 "Error: no C code generated for: [$myos: $mycpu]"
    exit 1
    ;;
  esac
  ;;
*) 
  echo 2>&1 "Error: no C code generated for: [$myos: $mycpu]"
  exit 1
  ;;
esac

: SUCCESS


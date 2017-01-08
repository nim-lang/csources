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
COMP_FLAGS="${CPPFLAGS:-} ${CFLAGS:-} -w -O3 -fno-strict-aliasing$extraBuildArgs"
LINK_FLAGS="${LDFLAGS:-} "
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
    LINK_FLAGS="$LINK_FLAGS -ldl -lm -lrt"
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
    LINK_FLAGS="$LINK_FLAGS -lroot -lnetwork"
    ;;
  *mingw* )
    myos="windows"
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
    mycpu="sparc"
    if [ "$(isainfo -b)" = "64" ]; then
      mycpu="sparc64"
    fi
    ;;
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
  *aarch64* )
    mycpu="arm64" ;;
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
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_commands.c -o c_code/1_1/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_os.c -o c_code/1_1/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strutils.c -o c_code/1_1/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parseutils.c -o c_code/1_1/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_math.c -o c_code/1_1/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_algorithm.c -o c_code/1_1/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_times.c -o c_code/1_1/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_winlean.c -o c_code/1_1/stdlib_winlean.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_dynlib.c -o c_code/1_1/stdlib_dynlib.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_msgs.c -o c_code/1_1/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_options.c -o c_code/1_1/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_tables.c -o c_code/1_1/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_ropes.c -o c_code/1_1/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_platform.c -o c_code/1_1/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_terminal.c -o c_code/1_1/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_macros.c -o c_code/1_1/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_lists.c -o c_code/1_1/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strtabs.c -o c_code/1_1/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_osproc.c -o c_code/1_1/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sets.c -o c_code/1_1/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_hashes.c -o c_code/1_1/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_etcpriv.c -o c_code/1_1/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_streams.c -o c_code/1_1/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cpuinfo.c -o c_code/1_1/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_nversion.c -o c_code/1_1/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_condsyms.c -o c_code/1_1/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_idents.c -o c_code/1_1/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_wordrecg.c -o c_code/1_1/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_extccomp.c -o c_code/1_1/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_securehash.c -o c_code/1_1/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_json.c -o c_code/1_1/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_lexbase.c -o c_code/1_1/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_unicode.c -o c_code/1_1/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_nimblecmd.c -o c_code/1_1/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parseopt.c -o c_code/1_1/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_lexer.c -o c_code/1_1/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_nimlexbase.c -o c_code/1_1/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_llstream.c -o c_code/1_1/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_nimconf.c -o c_code/1_1/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_main.c -o c_code/1_1/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_ast.c -o c_code/1_1/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_astalgo.c -o c_code/1_1/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_syntaxes.c -o c_code/1_1/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_renderer.c -o c_code/1_1/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_rodread.c -o c_code/1_1/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_rodwrite.c -o c_code/1_1/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_sem.c -o c_code/1_1/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_semdata.c -o c_code/1_1/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_passes.c -o c_code/1_1/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_docgen.c -o c_code/1_1/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_cgen.c -o c_code/1_1/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_jsgen.c -o c_code/1_1/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_importer.c -o c_code/1_1/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_passaux.c -o c_code/1_1/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_depends.c -o c_code/1_1/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_vm.c -o c_code/1_1/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_vmdef.c -o c_code/1_1/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_types.c -o c_code/1_1/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_idgen.c -o c_code/1_1/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_docgen2.c -o c_code/1_1/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_service.c -o c_code/1_1/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_parser.c -o c_code/1_1/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_modules.c -o c_code/1_1/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_ccgutils.c -o c_code/1_1/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_sigmatch.c -o c_code/1_1/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_modulegraphs.c -o c_code/1_1/compiler_modulegraphs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_intsets.c -o c_code/1_1/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_rodutils.c -o c_code/1_1/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_pbraces.c -o c_code/1_1/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_filters.c -o c_code/1_1/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_filter_tmpl.c -o c_code/1_1/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_memfiles.c -o c_code/1_1/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_trees.c -o c_code/1_1/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_magicsys.c -o c_code/1_1/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_nimsets.c -o c_code/1_1/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_bitsets.c -o c_code/1_1/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_lookups.c -o c_code/1_1/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_prettybase.c -o c_code/1_1/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_treetab.c -o c_code/1_1/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_semfold.c -o c_code/1_1/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_procfind.c -o c_code/1_1/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_pragmas.c -o c_code/1_1/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_semtypinst.c -o c_code/1_1/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_transf.c -o c_code/1_1/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_aliases.c -o c_code/1_1/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_cgmeth.c -o c_code/1_1/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_lambdalifting.c -o c_code/1_1/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_evaltempl.c -o c_code/1_1/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_patterns.c -o c_code/1_1/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_parampatterns.c -o c_code/1_1/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_sempass2.c -o c_code/1_1/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_pretty.c -o c_code/1_1/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_semmacrosanity.c -o c_code/1_1/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_semparallel.c -o c_code/1_1/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_lowerings.c -o c_code/1_1/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_pluginsupport.c -o c_code/1_1/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_active.c -o c_code/1_1/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_saturate.c -o c_code/1_1/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/docutils_rstast.c -o c_code/1_1/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/docutils_rst.c -o c_code/1_1/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/docutils_rstgen.c -o c_code/1_1/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/docutils_highlite.c -o c_code/1_1/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_xmltree.c -o c_code/1_1/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cgi.c -o c_code/1_1/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_typesrenderer.c -o c_code/1_1/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sequtils.c -o c_code/1_1/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_guards.c -o c_code/1_1/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_writetracking.c -o c_code/1_1/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cookies.c -o c_code/1_1/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_vmgen.c -o c_code/1_1/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_vmdeps.c -o c_code/1_1/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_vmmarshal.c -o c_code/1_1/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_locals.c -o c_code/1_1/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_itersgen.c -o c_code/1_1/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_cgendata.c -o c_code/1_1/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_ccgmerge.c -o c_code/1_1/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_sighashes.c -o c_code/1_1/compiler_sighashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_md5.c -o c_code/1_1/stdlib_md5.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_net.c -o c_code/1_1/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_nativesockets.c -o c_code/1_1/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_nodejs.c -o c_code/1_1/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/compiler_scriptconfig.c -o c_code/1_1/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/1_1/compiler_nim.o \
c_code/1_1/stdlib_system.o \
c_code/1_1/compiler_commands.o \
c_code/1_1/stdlib_os.o \
c_code/1_1/stdlib_strutils.o \
c_code/1_1/stdlib_parseutils.o \
c_code/1_1/stdlib_math.o \
c_code/1_1/stdlib_algorithm.o \
c_code/1_1/stdlib_times.o \
c_code/1_1/stdlib_winlean.o \
c_code/1_1/stdlib_dynlib.o \
c_code/1_1/compiler_msgs.o \
c_code/1_1/compiler_options.o \
c_code/1_1/stdlib_tables.o \
c_code/1_1/compiler_ropes.o \
c_code/1_1/compiler_platform.o \
c_code/1_1/stdlib_terminal.o \
c_code/1_1/stdlib_macros.o \
c_code/1_1/compiler_lists.o \
c_code/1_1/stdlib_strtabs.o \
c_code/1_1/stdlib_osproc.o \
c_code/1_1/stdlib_sets.o \
c_code/1_1/stdlib_hashes.o \
c_code/1_1/stdlib_etcpriv.o \
c_code/1_1/stdlib_streams.o \
c_code/1_1/stdlib_cpuinfo.o \
c_code/1_1/compiler_nversion.o \
c_code/1_1/compiler_condsyms.o \
c_code/1_1/compiler_idents.o \
c_code/1_1/compiler_wordrecg.o \
c_code/1_1/compiler_extccomp.o \
c_code/1_1/stdlib_securehash.o \
c_code/1_1/stdlib_json.o \
c_code/1_1/stdlib_lexbase.o \
c_code/1_1/stdlib_unicode.o \
c_code/1_1/compiler_nimblecmd.o \
c_code/1_1/stdlib_parseopt.o \
c_code/1_1/compiler_lexer.o \
c_code/1_1/compiler_nimlexbase.o \
c_code/1_1/compiler_llstream.o \
c_code/1_1/compiler_nimconf.o \
c_code/1_1/compiler_main.o \
c_code/1_1/compiler_ast.o \
c_code/1_1/compiler_astalgo.o \
c_code/1_1/compiler_syntaxes.o \
c_code/1_1/compiler_renderer.o \
c_code/1_1/compiler_rodread.o \
c_code/1_1/compiler_rodwrite.o \
c_code/1_1/compiler_sem.o \
c_code/1_1/compiler_semdata.o \
c_code/1_1/compiler_passes.o \
c_code/1_1/compiler_docgen.o \
c_code/1_1/compiler_cgen.o \
c_code/1_1/compiler_jsgen.o \
c_code/1_1/compiler_importer.o \
c_code/1_1/compiler_passaux.o \
c_code/1_1/compiler_depends.o \
c_code/1_1/compiler_vm.o \
c_code/1_1/compiler_vmdef.o \
c_code/1_1/compiler_types.o \
c_code/1_1/compiler_idgen.o \
c_code/1_1/compiler_docgen2.o \
c_code/1_1/compiler_service.o \
c_code/1_1/compiler_parser.o \
c_code/1_1/compiler_modules.o \
c_code/1_1/compiler_ccgutils.o \
c_code/1_1/compiler_sigmatch.o \
c_code/1_1/compiler_modulegraphs.o \
c_code/1_1/stdlib_intsets.o \
c_code/1_1/compiler_rodutils.o \
c_code/1_1/compiler_pbraces.o \
c_code/1_1/compiler_filters.o \
c_code/1_1/compiler_filter_tmpl.o \
c_code/1_1/stdlib_memfiles.o \
c_code/1_1/compiler_trees.o \
c_code/1_1/compiler_magicsys.o \
c_code/1_1/compiler_nimsets.o \
c_code/1_1/compiler_bitsets.o \
c_code/1_1/compiler_lookups.o \
c_code/1_1/compiler_prettybase.o \
c_code/1_1/compiler_treetab.o \
c_code/1_1/compiler_semfold.o \
c_code/1_1/compiler_procfind.o \
c_code/1_1/compiler_pragmas.o \
c_code/1_1/compiler_semtypinst.o \
c_code/1_1/compiler_transf.o \
c_code/1_1/compiler_aliases.o \
c_code/1_1/compiler_cgmeth.o \
c_code/1_1/compiler_lambdalifting.o \
c_code/1_1/compiler_evaltempl.o \
c_code/1_1/compiler_patterns.o \
c_code/1_1/compiler_parampatterns.o \
c_code/1_1/compiler_sempass2.o \
c_code/1_1/compiler_pretty.o \
c_code/1_1/compiler_semmacrosanity.o \
c_code/1_1/compiler_semparallel.o \
c_code/1_1/compiler_lowerings.o \
c_code/1_1/compiler_pluginsupport.o \
c_code/1_1/compiler_active.o \
c_code/1_1/compiler_saturate.o \
c_code/1_1/docutils_rstast.o \
c_code/1_1/docutils_rst.o \
c_code/1_1/docutils_rstgen.o \
c_code/1_1/docutils_highlite.o \
c_code/1_1/stdlib_xmltree.o \
c_code/1_1/stdlib_cgi.o \
c_code/1_1/compiler_typesrenderer.o \
c_code/1_1/stdlib_sequtils.o \
c_code/1_1/compiler_guards.o \
c_code/1_1/compiler_writetracking.o \
c_code/1_1/stdlib_cookies.o \
c_code/1_1/compiler_vmgen.o \
c_code/1_1/compiler_vmdeps.o \
c_code/1_1/compiler_vmmarshal.o \
c_code/1_1/compiler_locals.o \
c_code/1_1/compiler_itersgen.o \
c_code/1_1/compiler_cgendata.o \
c_code/1_1/compiler_ccgmerge.o \
c_code/1_1/compiler_sighashes.o \
c_code/1_1/stdlib_md5.o \
c_code/1_1/stdlib_net.o \
c_code/1_1/stdlib_nativesockets.o \
c_code/1_1/compiler_nodejs.o \
c_code/1_1/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  amd64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_nim.c -o c_code/1_2/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_system.c -o c_code/1_2/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_commands.c -o c_code/1_2/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_os.c -o c_code/1_2/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strutils.c -o c_code/1_2/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parseutils.c -o c_code/1_2/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_math.c -o c_code/1_2/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_algorithm.c -o c_code/1_2/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_times.c -o c_code/1_2/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_winlean.c -o c_code/1_2/stdlib_winlean.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_dynlib.c -o c_code/1_2/stdlib_dynlib.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_msgs.c -o c_code/1_2/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_options.c -o c_code/1_2/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_tables.c -o c_code/1_2/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_ropes.c -o c_code/1_2/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_platform.c -o c_code/1_2/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_terminal.c -o c_code/1_2/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_macros.c -o c_code/1_2/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_lists.c -o c_code/1_2/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strtabs.c -o c_code/1_2/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_osproc.c -o c_code/1_2/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sets.c -o c_code/1_2/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_hashes.c -o c_code/1_2/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_etcpriv.c -o c_code/1_2/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_streams.c -o c_code/1_2/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cpuinfo.c -o c_code/1_2/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_nversion.c -o c_code/1_2/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_condsyms.c -o c_code/1_2/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_idents.c -o c_code/1_2/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_wordrecg.c -o c_code/1_2/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_extccomp.c -o c_code/1_2/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_securehash.c -o c_code/1_2/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_json.c -o c_code/1_2/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_lexbase.c -o c_code/1_2/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_unicode.c -o c_code/1_2/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_nimblecmd.c -o c_code/1_2/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parseopt.c -o c_code/1_2/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_lexer.c -o c_code/1_2/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_nimlexbase.c -o c_code/1_2/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_llstream.c -o c_code/1_2/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_nimconf.c -o c_code/1_2/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_main.c -o c_code/1_2/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_ast.c -o c_code/1_2/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_astalgo.c -o c_code/1_2/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_syntaxes.c -o c_code/1_2/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_renderer.c -o c_code/1_2/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_rodread.c -o c_code/1_2/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_rodwrite.c -o c_code/1_2/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_sem.c -o c_code/1_2/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_semdata.c -o c_code/1_2/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_passes.c -o c_code/1_2/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_docgen.c -o c_code/1_2/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_cgen.c -o c_code/1_2/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_jsgen.c -o c_code/1_2/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_importer.c -o c_code/1_2/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_passaux.c -o c_code/1_2/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_depends.c -o c_code/1_2/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_vm.c -o c_code/1_2/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_vmdef.c -o c_code/1_2/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_types.c -o c_code/1_2/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_idgen.c -o c_code/1_2/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_docgen2.c -o c_code/1_2/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_service.c -o c_code/1_2/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_parser.c -o c_code/1_2/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_modules.c -o c_code/1_2/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_ccgutils.c -o c_code/1_2/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_sigmatch.c -o c_code/1_2/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_modulegraphs.c -o c_code/1_2/compiler_modulegraphs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_intsets.c -o c_code/1_2/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_rodutils.c -o c_code/1_2/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_pbraces.c -o c_code/1_2/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_filters.c -o c_code/1_2/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_filter_tmpl.c -o c_code/1_2/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_memfiles.c -o c_code/1_2/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_trees.c -o c_code/1_2/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_magicsys.c -o c_code/1_2/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_nimsets.c -o c_code/1_2/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_bitsets.c -o c_code/1_2/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_lookups.c -o c_code/1_2/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_prettybase.c -o c_code/1_2/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_treetab.c -o c_code/1_2/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_semfold.c -o c_code/1_2/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_procfind.c -o c_code/1_2/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_pragmas.c -o c_code/1_2/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_semtypinst.c -o c_code/1_2/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_transf.c -o c_code/1_2/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_aliases.c -o c_code/1_2/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_cgmeth.c -o c_code/1_2/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_lambdalifting.c -o c_code/1_2/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_evaltempl.c -o c_code/1_2/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_patterns.c -o c_code/1_2/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_parampatterns.c -o c_code/1_2/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_sempass2.c -o c_code/1_2/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_pretty.c -o c_code/1_2/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_semmacrosanity.c -o c_code/1_2/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_semparallel.c -o c_code/1_2/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_lowerings.c -o c_code/1_2/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_pluginsupport.c -o c_code/1_2/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_active.c -o c_code/1_2/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_saturate.c -o c_code/1_2/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/docutils_rstast.c -o c_code/1_2/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/docutils_rst.c -o c_code/1_2/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/docutils_rstgen.c -o c_code/1_2/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/docutils_highlite.c -o c_code/1_2/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_xmltree.c -o c_code/1_2/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cgi.c -o c_code/1_2/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_typesrenderer.c -o c_code/1_2/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sequtils.c -o c_code/1_2/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_guards.c -o c_code/1_2/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_writetracking.c -o c_code/1_2/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cookies.c -o c_code/1_2/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_vmgen.c -o c_code/1_2/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_vmdeps.c -o c_code/1_2/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_vmmarshal.c -o c_code/1_2/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_locals.c -o c_code/1_2/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_itersgen.c -o c_code/1_2/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_cgendata.c -o c_code/1_2/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_ccgmerge.c -o c_code/1_2/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_sighashes.c -o c_code/1_2/compiler_sighashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_md5.c -o c_code/1_2/stdlib_md5.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_net.c -o c_code/1_2/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_nativesockets.c -o c_code/1_2/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_nodejs.c -o c_code/1_2/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/compiler_scriptconfig.c -o c_code/1_2/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/1_2/compiler_nim.o \
c_code/1_2/stdlib_system.o \
c_code/1_2/compiler_commands.o \
c_code/1_2/stdlib_os.o \
c_code/1_2/stdlib_strutils.o \
c_code/1_2/stdlib_parseutils.o \
c_code/1_2/stdlib_math.o \
c_code/1_2/stdlib_algorithm.o \
c_code/1_2/stdlib_times.o \
c_code/1_2/stdlib_winlean.o \
c_code/1_2/stdlib_dynlib.o \
c_code/1_2/compiler_msgs.o \
c_code/1_2/compiler_options.o \
c_code/1_2/stdlib_tables.o \
c_code/1_2/compiler_ropes.o \
c_code/1_2/compiler_platform.o \
c_code/1_2/stdlib_terminal.o \
c_code/1_2/stdlib_macros.o \
c_code/1_2/compiler_lists.o \
c_code/1_2/stdlib_strtabs.o \
c_code/1_2/stdlib_osproc.o \
c_code/1_2/stdlib_sets.o \
c_code/1_2/stdlib_hashes.o \
c_code/1_2/stdlib_etcpriv.o \
c_code/1_2/stdlib_streams.o \
c_code/1_2/stdlib_cpuinfo.o \
c_code/1_2/compiler_nversion.o \
c_code/1_2/compiler_condsyms.o \
c_code/1_2/compiler_idents.o \
c_code/1_2/compiler_wordrecg.o \
c_code/1_2/compiler_extccomp.o \
c_code/1_2/stdlib_securehash.o \
c_code/1_2/stdlib_json.o \
c_code/1_2/stdlib_lexbase.o \
c_code/1_2/stdlib_unicode.o \
c_code/1_2/compiler_nimblecmd.o \
c_code/1_2/stdlib_parseopt.o \
c_code/1_2/compiler_lexer.o \
c_code/1_2/compiler_nimlexbase.o \
c_code/1_2/compiler_llstream.o \
c_code/1_2/compiler_nimconf.o \
c_code/1_2/compiler_main.o \
c_code/1_2/compiler_ast.o \
c_code/1_2/compiler_astalgo.o \
c_code/1_2/compiler_syntaxes.o \
c_code/1_2/compiler_renderer.o \
c_code/1_2/compiler_rodread.o \
c_code/1_2/compiler_rodwrite.o \
c_code/1_2/compiler_sem.o \
c_code/1_2/compiler_semdata.o \
c_code/1_2/compiler_passes.o \
c_code/1_2/compiler_docgen.o \
c_code/1_2/compiler_cgen.o \
c_code/1_2/compiler_jsgen.o \
c_code/1_2/compiler_importer.o \
c_code/1_2/compiler_passaux.o \
c_code/1_2/compiler_depends.o \
c_code/1_2/compiler_vm.o \
c_code/1_2/compiler_vmdef.o \
c_code/1_2/compiler_types.o \
c_code/1_2/compiler_idgen.o \
c_code/1_2/compiler_docgen2.o \
c_code/1_2/compiler_service.o \
c_code/1_2/compiler_parser.o \
c_code/1_2/compiler_modules.o \
c_code/1_2/compiler_ccgutils.o \
c_code/1_2/compiler_sigmatch.o \
c_code/1_2/compiler_modulegraphs.o \
c_code/1_2/stdlib_intsets.o \
c_code/1_2/compiler_rodutils.o \
c_code/1_2/compiler_pbraces.o \
c_code/1_2/compiler_filters.o \
c_code/1_2/compiler_filter_tmpl.o \
c_code/1_2/stdlib_memfiles.o \
c_code/1_2/compiler_trees.o \
c_code/1_2/compiler_magicsys.o \
c_code/1_2/compiler_nimsets.o \
c_code/1_2/compiler_bitsets.o \
c_code/1_2/compiler_lookups.o \
c_code/1_2/compiler_prettybase.o \
c_code/1_2/compiler_treetab.o \
c_code/1_2/compiler_semfold.o \
c_code/1_2/compiler_procfind.o \
c_code/1_2/compiler_pragmas.o \
c_code/1_2/compiler_semtypinst.o \
c_code/1_2/compiler_transf.o \
c_code/1_2/compiler_aliases.o \
c_code/1_2/compiler_cgmeth.o \
c_code/1_2/compiler_lambdalifting.o \
c_code/1_2/compiler_evaltempl.o \
c_code/1_2/compiler_patterns.o \
c_code/1_2/compiler_parampatterns.o \
c_code/1_2/compiler_sempass2.o \
c_code/1_2/compiler_pretty.o \
c_code/1_2/compiler_semmacrosanity.o \
c_code/1_2/compiler_semparallel.o \
c_code/1_2/compiler_lowerings.o \
c_code/1_2/compiler_pluginsupport.o \
c_code/1_2/compiler_active.o \
c_code/1_2/compiler_saturate.o \
c_code/1_2/docutils_rstast.o \
c_code/1_2/docutils_rst.o \
c_code/1_2/docutils_rstgen.o \
c_code/1_2/docutils_highlite.o \
c_code/1_2/stdlib_xmltree.o \
c_code/1_2/stdlib_cgi.o \
c_code/1_2/compiler_typesrenderer.o \
c_code/1_2/stdlib_sequtils.o \
c_code/1_2/compiler_guards.o \
c_code/1_2/compiler_writetracking.o \
c_code/1_2/stdlib_cookies.o \
c_code/1_2/compiler_vmgen.o \
c_code/1_2/compiler_vmdeps.o \
c_code/1_2/compiler_vmmarshal.o \
c_code/1_2/compiler_locals.o \
c_code/1_2/compiler_itersgen.o \
c_code/1_2/compiler_cgendata.o \
c_code/1_2/compiler_ccgmerge.o \
c_code/1_2/compiler_sighashes.o \
c_code/1_2/stdlib_md5.o \
c_code/1_2/stdlib_net.o \
c_code/1_2/stdlib_nativesockets.o \
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
  sparc64)
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
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_commands.c -o c_code/2_1/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_os.c -o c_code/2_1/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.c -o c_code/2_1/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.c -o c_code/2_1/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.c -o c_code/2_1/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_algorithm.c -o c_code/2_1/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_times.c -o c_code/2_1/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_posix.c -o c_code/2_1/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_msgs.c -o c_code/2_1/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_options.c -o c_code/2_1/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_tables.c -o c_code/2_1/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ropes.c -o c_code/2_1/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_platform.c -o c_code/2_1/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.c -o c_code/2_1/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_macros.c -o c_code/2_1/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lists.c -o c_code/2_1/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strtabs.c -o c_code/2_1/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_osproc.c -o c_code/2_1/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sets.c -o c_code/2_1/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_hashes.c -o c_code/2_1/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_etcpriv.c -o c_code/2_1/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_streams.c -o c_code/2_1/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cpuinfo.c -o c_code/2_1/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_linux.c -o c_code/2_1/stdlib_linux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_termios.c -o c_code/2_1/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nversion.c -o c_code/2_1/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_condsyms.c -o c_code/2_1/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idents.c -o c_code/2_1/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_wordrecg.c -o c_code/2_1/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_extccomp.c -o c_code/2_1/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_securehash.c -o c_code/2_1/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_json.c -o c_code/2_1/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.c -o c_code/2_1/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.c -o c_code/2_1/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimblecmd.c -o c_code/2_1/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.c -o c_code/2_1/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lexer.c -o c_code/2_1/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimlexbase.c -o c_code/2_1/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_llstream.c -o c_code/2_1/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimconf.c -o c_code/2_1/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_main.c -o c_code/2_1/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ast.c -o c_code/2_1/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_astalgo.c -o c_code/2_1/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_syntaxes.c -o c_code/2_1/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_renderer.c -o c_code/2_1/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodread.c -o c_code/2_1/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodwrite.c -o c_code/2_1/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sem.c -o c_code/2_1/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semdata.c -o c_code/2_1/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passes.c -o c_code/2_1/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_docgen.c -o c_code/2_1/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgen.c -o c_code/2_1/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_jsgen.c -o c_code/2_1/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_importer.c -o c_code/2_1/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passaux.c -o c_code/2_1/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_depends.c -o c_code/2_1/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vm.c -o c_code/2_1/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmdef.c -o c_code/2_1/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_types.c -o c_code/2_1/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idgen.c -o c_code/2_1/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_docgen2.c -o c_code/2_1/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_service.c -o c_code/2_1/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parser.c -o c_code/2_1/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_modules.c -o c_code/2_1/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgutils.c -o c_code/2_1/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sigmatch.c -o c_code/2_1/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_modulegraphs.c -o c_code/2_1/compiler_modulegraphs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_intsets.c -o c_code/2_1/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodutils.c -o c_code/2_1/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pbraces.c -o c_code/2_1/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filters.c -o c_code/2_1/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filter_tmpl.c -o c_code/2_1/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_memfiles.c -o c_code/2_1/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_trees.c -o c_code/2_1/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_magicsys.c -o c_code/2_1/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimsets.c -o c_code/2_1/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_bitsets.c -o c_code/2_1/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lookups.c -o c_code/2_1/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_prettybase.c -o c_code/2_1/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_treetab.c -o c_code/2_1/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semfold.c -o c_code/2_1/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_procfind.c -o c_code/2_1/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pragmas.c -o c_code/2_1/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semtypinst.c -o c_code/2_1/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_transf.c -o c_code/2_1/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_aliases.c -o c_code/2_1/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgmeth.c -o c_code/2_1/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lambdalifting.c -o c_code/2_1/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_evaltempl.c -o c_code/2_1/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_patterns.c -o c_code/2_1/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parampatterns.c -o c_code/2_1/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sempass2.c -o c_code/2_1/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pretty.c -o c_code/2_1/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semmacrosanity.c -o c_code/2_1/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semparallel.c -o c_code/2_1/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lowerings.c -o c_code/2_1/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pluginsupport.c -o c_code/2_1/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_active.c -o c_code/2_1/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_saturate.c -o c_code/2_1/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rstast.c -o c_code/2_1/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rst.c -o c_code/2_1/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rstgen.c -o c_code/2_1/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_highlite.c -o c_code/2_1/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_xmltree.c -o c_code/2_1/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cgi.c -o c_code/2_1/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_typesrenderer.c -o c_code/2_1/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sequtils.c -o c_code/2_1/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_guards.c -o c_code/2_1/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_writetracking.c -o c_code/2_1/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cookies.c -o c_code/2_1/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmgen.c -o c_code/2_1/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmdeps.c -o c_code/2_1/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmmarshal.c -o c_code/2_1/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_locals.c -o c_code/2_1/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_itersgen.c -o c_code/2_1/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgendata.c -o c_code/2_1/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgmerge.c -o c_code/2_1/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sighashes.c -o c_code/2_1/compiler_sighashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_md5.c -o c_code/2_1/stdlib_md5.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.c -o c_code/2_1/stdlib_dynlib.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_net.c -o c_code/2_1/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_nativesockets.c -o c_code/2_1/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nodejs.c -o c_code/2_1/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_scriptconfig.c -o c_code/2_1/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/2_1/compiler_nim.o \
c_code/2_1/stdlib_system.o \
c_code/2_1/compiler_commands.o \
c_code/2_1/stdlib_os.o \
c_code/2_1/stdlib_strutils.o \
c_code/2_1/stdlib_parseutils.o \
c_code/2_1/stdlib_math.o \
c_code/2_1/stdlib_algorithm.o \
c_code/2_1/stdlib_times.o \
c_code/2_1/stdlib_posix.o \
c_code/2_1/compiler_msgs.o \
c_code/2_1/compiler_options.o \
c_code/2_1/stdlib_tables.o \
c_code/2_1/compiler_ropes.o \
c_code/2_1/compiler_platform.o \
c_code/2_1/stdlib_terminal.o \
c_code/2_1/stdlib_macros.o \
c_code/2_1/compiler_lists.o \
c_code/2_1/stdlib_strtabs.o \
c_code/2_1/stdlib_osproc.o \
c_code/2_1/stdlib_sets.o \
c_code/2_1/stdlib_hashes.o \
c_code/2_1/stdlib_etcpriv.o \
c_code/2_1/stdlib_streams.o \
c_code/2_1/stdlib_cpuinfo.o \
c_code/2_1/stdlib_linux.o \
c_code/2_1/stdlib_termios.o \
c_code/2_1/compiler_nversion.o \
c_code/2_1/compiler_condsyms.o \
c_code/2_1/compiler_idents.o \
c_code/2_1/compiler_wordrecg.o \
c_code/2_1/compiler_extccomp.o \
c_code/2_1/stdlib_securehash.o \
c_code/2_1/stdlib_json.o \
c_code/2_1/stdlib_lexbase.o \
c_code/2_1/stdlib_unicode.o \
c_code/2_1/compiler_nimblecmd.o \
c_code/2_1/stdlib_parseopt.o \
c_code/2_1/compiler_lexer.o \
c_code/2_1/compiler_nimlexbase.o \
c_code/2_1/compiler_llstream.o \
c_code/2_1/compiler_nimconf.o \
c_code/2_1/compiler_main.o \
c_code/2_1/compiler_ast.o \
c_code/2_1/compiler_astalgo.o \
c_code/2_1/compiler_syntaxes.o \
c_code/2_1/compiler_renderer.o \
c_code/2_1/compiler_rodread.o \
c_code/2_1/compiler_rodwrite.o \
c_code/2_1/compiler_sem.o \
c_code/2_1/compiler_semdata.o \
c_code/2_1/compiler_passes.o \
c_code/2_1/compiler_docgen.o \
c_code/2_1/compiler_cgen.o \
c_code/2_1/compiler_jsgen.o \
c_code/2_1/compiler_importer.o \
c_code/2_1/compiler_passaux.o \
c_code/2_1/compiler_depends.o \
c_code/2_1/compiler_vm.o \
c_code/2_1/compiler_vmdef.o \
c_code/2_1/compiler_types.o \
c_code/2_1/compiler_idgen.o \
c_code/2_1/compiler_docgen2.o \
c_code/2_1/compiler_service.o \
c_code/2_1/compiler_parser.o \
c_code/2_1/compiler_modules.o \
c_code/2_1/compiler_ccgutils.o \
c_code/2_1/compiler_sigmatch.o \
c_code/2_1/compiler_modulegraphs.o \
c_code/2_1/stdlib_intsets.o \
c_code/2_1/compiler_rodutils.o \
c_code/2_1/compiler_pbraces.o \
c_code/2_1/compiler_filters.o \
c_code/2_1/compiler_filter_tmpl.o \
c_code/2_1/stdlib_memfiles.o \
c_code/2_1/compiler_trees.o \
c_code/2_1/compiler_magicsys.o \
c_code/2_1/compiler_nimsets.o \
c_code/2_1/compiler_bitsets.o \
c_code/2_1/compiler_lookups.o \
c_code/2_1/compiler_prettybase.o \
c_code/2_1/compiler_treetab.o \
c_code/2_1/compiler_semfold.o \
c_code/2_1/compiler_procfind.o \
c_code/2_1/compiler_pragmas.o \
c_code/2_1/compiler_semtypinst.o \
c_code/2_1/compiler_transf.o \
c_code/2_1/compiler_aliases.o \
c_code/2_1/compiler_cgmeth.o \
c_code/2_1/compiler_lambdalifting.o \
c_code/2_1/compiler_evaltempl.o \
c_code/2_1/compiler_patterns.o \
c_code/2_1/compiler_parampatterns.o \
c_code/2_1/compiler_sempass2.o \
c_code/2_1/compiler_pretty.o \
c_code/2_1/compiler_semmacrosanity.o \
c_code/2_1/compiler_semparallel.o \
c_code/2_1/compiler_lowerings.o \
c_code/2_1/compiler_pluginsupport.o \
c_code/2_1/compiler_active.o \
c_code/2_1/compiler_saturate.o \
c_code/2_1/docutils_rstast.o \
c_code/2_1/docutils_rst.o \
c_code/2_1/docutils_rstgen.o \
c_code/2_1/docutils_highlite.o \
c_code/2_1/stdlib_xmltree.o \
c_code/2_1/stdlib_cgi.o \
c_code/2_1/compiler_typesrenderer.o \
c_code/2_1/stdlib_sequtils.o \
c_code/2_1/compiler_guards.o \
c_code/2_1/compiler_writetracking.o \
c_code/2_1/stdlib_cookies.o \
c_code/2_1/compiler_vmgen.o \
c_code/2_1/compiler_vmdeps.o \
c_code/2_1/compiler_vmmarshal.o \
c_code/2_1/compiler_locals.o \
c_code/2_1/compiler_itersgen.o \
c_code/2_1/compiler_cgendata.o \
c_code/2_1/compiler_ccgmerge.o \
c_code/2_1/compiler_sighashes.o \
c_code/2_1/stdlib_md5.o \
c_code/2_1/stdlib_dynlib.o \
c_code/2_1/stdlib_net.o \
c_code/2_1/stdlib_nativesockets.o \
c_code/2_1/compiler_nodejs.o \
c_code/2_1/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  amd64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nim.c -o c_code/2_2/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_system.c -o c_code/2_2/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_commands.c -o c_code/2_2/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_os.c -o c_code/2_2/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.c -o c_code/2_2/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.c -o c_code/2_2/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.c -o c_code/2_2/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_algorithm.c -o c_code/2_2/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_times.c -o c_code/2_2/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_posix.c -o c_code/2_2/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_msgs.c -o c_code/2_2/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_options.c -o c_code/2_2/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_tables.c -o c_code/2_2/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ropes.c -o c_code/2_2/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_platform.c -o c_code/2_2/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.c -o c_code/2_2/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_macros.c -o c_code/2_2/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lists.c -o c_code/2_2/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strtabs.c -o c_code/2_2/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_osproc.c -o c_code/2_2/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sets.c -o c_code/2_2/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_hashes.c -o c_code/2_2/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_etcpriv.c -o c_code/2_2/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_streams.c -o c_code/2_2/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cpuinfo.c -o c_code/2_2/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_linux.c -o c_code/2_2/stdlib_linux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_termios.c -o c_code/2_2/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nversion.c -o c_code/2_2/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_condsyms.c -o c_code/2_2/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_idents.c -o c_code/2_2/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_wordrecg.c -o c_code/2_2/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_extccomp.c -o c_code/2_2/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_securehash.c -o c_code/2_2/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_json.c -o c_code/2_2/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.c -o c_code/2_2/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.c -o c_code/2_2/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimblecmd.c -o c_code/2_2/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.c -o c_code/2_2/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lexer.c -o c_code/2_2/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimlexbase.c -o c_code/2_2/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_llstream.c -o c_code/2_2/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimconf.c -o c_code/2_2/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_main.c -o c_code/2_2/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ast.c -o c_code/2_2/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_astalgo.c -o c_code/2_2/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_syntaxes.c -o c_code/2_2/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_renderer.c -o c_code/2_2/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodread.c -o c_code/2_2/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodwrite.c -o c_code/2_2/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sem.c -o c_code/2_2/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semdata.c -o c_code/2_2/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_passes.c -o c_code/2_2/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_docgen.c -o c_code/2_2/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgen.c -o c_code/2_2/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_jsgen.c -o c_code/2_2/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_importer.c -o c_code/2_2/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_passaux.c -o c_code/2_2/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_depends.c -o c_code/2_2/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vm.c -o c_code/2_2/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmdef.c -o c_code/2_2/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_types.c -o c_code/2_2/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_idgen.c -o c_code/2_2/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_docgen2.c -o c_code/2_2/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_service.c -o c_code/2_2/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_parser.c -o c_code/2_2/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_modules.c -o c_code/2_2/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ccgutils.c -o c_code/2_2/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sigmatch.c -o c_code/2_2/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_modulegraphs.c -o c_code/2_2/compiler_modulegraphs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_intsets.c -o c_code/2_2/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodutils.c -o c_code/2_2/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pbraces.c -o c_code/2_2/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_filters.c -o c_code/2_2/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_filter_tmpl.c -o c_code/2_2/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_memfiles.c -o c_code/2_2/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_trees.c -o c_code/2_2/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_magicsys.c -o c_code/2_2/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimsets.c -o c_code/2_2/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_bitsets.c -o c_code/2_2/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lookups.c -o c_code/2_2/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_prettybase.c -o c_code/2_2/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_treetab.c -o c_code/2_2/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semfold.c -o c_code/2_2/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_procfind.c -o c_code/2_2/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pragmas.c -o c_code/2_2/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semtypinst.c -o c_code/2_2/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_transf.c -o c_code/2_2/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_aliases.c -o c_code/2_2/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgmeth.c -o c_code/2_2/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lambdalifting.c -o c_code/2_2/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_evaltempl.c -o c_code/2_2/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_patterns.c -o c_code/2_2/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_parampatterns.c -o c_code/2_2/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sempass2.c -o c_code/2_2/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pretty.c -o c_code/2_2/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semmacrosanity.c -o c_code/2_2/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semparallel.c -o c_code/2_2/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lowerings.c -o c_code/2_2/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pluginsupport.c -o c_code/2_2/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_active.c -o c_code/2_2/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_saturate.c -o c_code/2_2/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rstast.c -o c_code/2_2/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rst.c -o c_code/2_2/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rstgen.c -o c_code/2_2/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_highlite.c -o c_code/2_2/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_xmltree.c -o c_code/2_2/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cgi.c -o c_code/2_2/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_typesrenderer.c -o c_code/2_2/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sequtils.c -o c_code/2_2/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_guards.c -o c_code/2_2/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_writetracking.c -o c_code/2_2/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cookies.c -o c_code/2_2/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmgen.c -o c_code/2_2/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmdeps.c -o c_code/2_2/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmmarshal.c -o c_code/2_2/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_locals.c -o c_code/2_2/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_itersgen.c -o c_code/2_2/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgendata.c -o c_code/2_2/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ccgmerge.c -o c_code/2_2/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sighashes.c -o c_code/2_2/compiler_sighashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_md5.c -o c_code/2_2/stdlib_md5.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.c -o c_code/2_2/stdlib_dynlib.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_net.c -o c_code/2_2/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_nativesockets.c -o c_code/2_2/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nodejs.c -o c_code/2_2/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_scriptconfig.c -o c_code/2_2/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/2_2/compiler_nim.o \
c_code/2_2/stdlib_system.o \
c_code/2_2/compiler_commands.o \
c_code/2_2/stdlib_os.o \
c_code/2_2/stdlib_strutils.o \
c_code/2_2/stdlib_parseutils.o \
c_code/2_2/stdlib_math.o \
c_code/2_2/stdlib_algorithm.o \
c_code/2_2/stdlib_times.o \
c_code/2_2/stdlib_posix.o \
c_code/2_2/compiler_msgs.o \
c_code/2_2/compiler_options.o \
c_code/2_2/stdlib_tables.o \
c_code/2_2/compiler_ropes.o \
c_code/2_2/compiler_platform.o \
c_code/2_2/stdlib_terminal.o \
c_code/2_2/stdlib_macros.o \
c_code/2_2/compiler_lists.o \
c_code/2_2/stdlib_strtabs.o \
c_code/2_2/stdlib_osproc.o \
c_code/2_2/stdlib_sets.o \
c_code/2_2/stdlib_hashes.o \
c_code/2_2/stdlib_etcpriv.o \
c_code/2_2/stdlib_streams.o \
c_code/2_2/stdlib_cpuinfo.o \
c_code/2_2/stdlib_linux.o \
c_code/2_2/stdlib_termios.o \
c_code/2_2/compiler_nversion.o \
c_code/2_2/compiler_condsyms.o \
c_code/2_2/compiler_idents.o \
c_code/2_2/compiler_wordrecg.o \
c_code/2_2/compiler_extccomp.o \
c_code/2_2/stdlib_securehash.o \
c_code/2_2/stdlib_json.o \
c_code/2_2/stdlib_lexbase.o \
c_code/2_2/stdlib_unicode.o \
c_code/2_2/compiler_nimblecmd.o \
c_code/2_2/stdlib_parseopt.o \
c_code/2_2/compiler_lexer.o \
c_code/2_2/compiler_nimlexbase.o \
c_code/2_2/compiler_llstream.o \
c_code/2_2/compiler_nimconf.o \
c_code/2_2/compiler_main.o \
c_code/2_2/compiler_ast.o \
c_code/2_2/compiler_astalgo.o \
c_code/2_2/compiler_syntaxes.o \
c_code/2_2/compiler_renderer.o \
c_code/2_2/compiler_rodread.o \
c_code/2_2/compiler_rodwrite.o \
c_code/2_2/compiler_sem.o \
c_code/2_2/compiler_semdata.o \
c_code/2_2/compiler_passes.o \
c_code/2_2/compiler_docgen.o \
c_code/2_2/compiler_cgen.o \
c_code/2_2/compiler_jsgen.o \
c_code/2_2/compiler_importer.o \
c_code/2_2/compiler_passaux.o \
c_code/2_2/compiler_depends.o \
c_code/2_2/compiler_vm.o \
c_code/2_2/compiler_vmdef.o \
c_code/2_2/compiler_types.o \
c_code/2_2/compiler_idgen.o \
c_code/2_2/compiler_docgen2.o \
c_code/2_2/compiler_service.o \
c_code/2_2/compiler_parser.o \
c_code/2_2/compiler_modules.o \
c_code/2_2/compiler_ccgutils.o \
c_code/2_2/compiler_sigmatch.o \
c_code/2_2/compiler_modulegraphs.o \
c_code/2_2/stdlib_intsets.o \
c_code/2_2/compiler_rodutils.o \
c_code/2_2/compiler_pbraces.o \
c_code/2_2/compiler_filters.o \
c_code/2_2/compiler_filter_tmpl.o \
c_code/2_2/stdlib_memfiles.o \
c_code/2_2/compiler_trees.o \
c_code/2_2/compiler_magicsys.o \
c_code/2_2/compiler_nimsets.o \
c_code/2_2/compiler_bitsets.o \
c_code/2_2/compiler_lookups.o \
c_code/2_2/compiler_prettybase.o \
c_code/2_2/compiler_treetab.o \
c_code/2_2/compiler_semfold.o \
c_code/2_2/compiler_procfind.o \
c_code/2_2/compiler_pragmas.o \
c_code/2_2/compiler_semtypinst.o \
c_code/2_2/compiler_transf.o \
c_code/2_2/compiler_aliases.o \
c_code/2_2/compiler_cgmeth.o \
c_code/2_2/compiler_lambdalifting.o \
c_code/2_2/compiler_evaltempl.o \
c_code/2_2/compiler_patterns.o \
c_code/2_2/compiler_parampatterns.o \
c_code/2_2/compiler_sempass2.o \
c_code/2_2/compiler_pretty.o \
c_code/2_2/compiler_semmacrosanity.o \
c_code/2_2/compiler_semparallel.o \
c_code/2_2/compiler_lowerings.o \
c_code/2_2/compiler_pluginsupport.o \
c_code/2_2/compiler_active.o \
c_code/2_2/compiler_saturate.o \
c_code/2_2/docutils_rstast.o \
c_code/2_2/docutils_rst.o \
c_code/2_2/docutils_rstgen.o \
c_code/2_2/docutils_highlite.o \
c_code/2_2/stdlib_xmltree.o \
c_code/2_2/stdlib_cgi.o \
c_code/2_2/compiler_typesrenderer.o \
c_code/2_2/stdlib_sequtils.o \
c_code/2_2/compiler_guards.o \
c_code/2_2/compiler_writetracking.o \
c_code/2_2/stdlib_cookies.o \
c_code/2_2/compiler_vmgen.o \
c_code/2_2/compiler_vmdeps.o \
c_code/2_2/compiler_vmmarshal.o \
c_code/2_2/compiler_locals.o \
c_code/2_2/compiler_itersgen.o \
c_code/2_2/compiler_cgendata.o \
c_code/2_2/compiler_ccgmerge.o \
c_code/2_2/compiler_sighashes.o \
c_code/2_2/stdlib_md5.o \
c_code/2_2/stdlib_dynlib.o \
c_code/2_2/stdlib_net.o \
c_code/2_2/stdlib_nativesockets.o \
c_code/2_2/compiler_nodejs.o \
c_code/2_2/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  powerpc64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nim.c -o c_code/2_2/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_system.c -o c_code/2_3/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_commands.c -o c_code/2_2/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_os.c -o c_code/2_2/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.c -o c_code/2_2/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.c -o c_code/2_2/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.c -o c_code/2_2/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_algorithm.c -o c_code/2_2/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_times.c -o c_code/2_2/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_posix.c -o c_code/2_2/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_msgs.c -o c_code/2_2/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_options.c -o c_code/2_2/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_tables.c -o c_code/2_2/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ropes.c -o c_code/2_2/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_platform.c -o c_code/2_3/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.c -o c_code/2_2/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_macros.c -o c_code/2_2/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lists.c -o c_code/2_2/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strtabs.c -o c_code/2_2/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_osproc.c -o c_code/2_2/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sets.c -o c_code/2_2/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_hashes.c -o c_code/2_2/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_etcpriv.c -o c_code/2_2/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_streams.c -o c_code/2_2/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cpuinfo.c -o c_code/2_2/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_linux.c -o c_code/2_2/stdlib_linux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_termios.c -o c_code/2_2/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nversion.c -o c_code/2_2/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_condsyms.c -o c_code/2_2/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_idents.c -o c_code/2_2/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_wordrecg.c -o c_code/2_2/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_extccomp.c -o c_code/2_2/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_securehash.c -o c_code/2_2/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_json.c -o c_code/2_2/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.c -o c_code/2_2/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.c -o c_code/2_2/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimblecmd.c -o c_code/2_2/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.c -o c_code/2_2/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lexer.c -o c_code/2_2/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimlexbase.c -o c_code/2_2/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_llstream.c -o c_code/2_2/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimconf.c -o c_code/2_2/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_main.c -o c_code/2_2/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ast.c -o c_code/2_2/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_astalgo.c -o c_code/2_2/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_syntaxes.c -o c_code/2_2/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_renderer.c -o c_code/2_2/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodread.c -o c_code/2_2/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodwrite.c -o c_code/2_2/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sem.c -o c_code/2_2/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semdata.c -o c_code/2_2/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_passes.c -o c_code/2_2/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_docgen.c -o c_code/2_2/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgen.c -o c_code/2_2/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_jsgen.c -o c_code/2_2/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_importer.c -o c_code/2_2/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_passaux.c -o c_code/2_2/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_depends.c -o c_code/2_2/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/compiler_vm.c -o c_code/2_3/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmdef.c -o c_code/2_2/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_types.c -o c_code/2_2/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_idgen.c -o c_code/2_2/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_docgen2.c -o c_code/2_2/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_service.c -o c_code/2_2/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_parser.c -o c_code/2_2/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_modules.c -o c_code/2_2/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ccgutils.c -o c_code/2_2/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sigmatch.c -o c_code/2_2/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_modulegraphs.c -o c_code/2_2/compiler_modulegraphs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_intsets.c -o c_code/2_2/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodutils.c -o c_code/2_2/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pbraces.c -o c_code/2_2/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_filters.c -o c_code/2_2/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_filter_tmpl.c -o c_code/2_2/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_memfiles.c -o c_code/2_2/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_trees.c -o c_code/2_2/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_magicsys.c -o c_code/2_2/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimsets.c -o c_code/2_2/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_bitsets.c -o c_code/2_2/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lookups.c -o c_code/2_2/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_prettybase.c -o c_code/2_2/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_treetab.c -o c_code/2_2/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semfold.c -o c_code/2_2/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_procfind.c -o c_code/2_2/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pragmas.c -o c_code/2_2/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semtypinst.c -o c_code/2_2/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_transf.c -o c_code/2_2/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_aliases.c -o c_code/2_2/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgmeth.c -o c_code/2_2/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lambdalifting.c -o c_code/2_2/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_evaltempl.c -o c_code/2_2/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_patterns.c -o c_code/2_2/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_parampatterns.c -o c_code/2_2/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sempass2.c -o c_code/2_2/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pretty.c -o c_code/2_2/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semmacrosanity.c -o c_code/2_2/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semparallel.c -o c_code/2_2/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lowerings.c -o c_code/2_2/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pluginsupport.c -o c_code/2_2/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_active.c -o c_code/2_2/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_saturate.c -o c_code/2_2/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rstast.c -o c_code/2_2/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rst.c -o c_code/2_2/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rstgen.c -o c_code/2_2/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_highlite.c -o c_code/2_2/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_xmltree.c -o c_code/2_2/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cgi.c -o c_code/2_2/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_typesrenderer.c -o c_code/2_2/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sequtils.c -o c_code/2_2/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_guards.c -o c_code/2_2/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_writetracking.c -o c_code/2_2/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cookies.c -o c_code/2_2/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmgen.c -o c_code/2_2/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmdeps.c -o c_code/2_2/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmmarshal.c -o c_code/2_2/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_locals.c -o c_code/2_2/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_itersgen.c -o c_code/2_2/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgendata.c -o c_code/2_2/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ccgmerge.c -o c_code/2_2/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sighashes.c -o c_code/2_2/compiler_sighashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_md5.c -o c_code/2_2/stdlib_md5.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.c -o c_code/2_2/stdlib_dynlib.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_net.c -o c_code/2_2/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_nativesockets.c -o c_code/2_2/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nodejs.c -o c_code/2_2/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_scriptconfig.c -o c_code/2_2/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/2_2/compiler_nim.o \
c_code/2_3/stdlib_system.o \
c_code/2_2/compiler_commands.o \
c_code/2_2/stdlib_os.o \
c_code/2_2/stdlib_strutils.o \
c_code/2_2/stdlib_parseutils.o \
c_code/2_2/stdlib_math.o \
c_code/2_2/stdlib_algorithm.o \
c_code/2_2/stdlib_times.o \
c_code/2_2/stdlib_posix.o \
c_code/2_2/compiler_msgs.o \
c_code/2_2/compiler_options.o \
c_code/2_2/stdlib_tables.o \
c_code/2_2/compiler_ropes.o \
c_code/2_3/compiler_platform.o \
c_code/2_2/stdlib_terminal.o \
c_code/2_2/stdlib_macros.o \
c_code/2_2/compiler_lists.o \
c_code/2_2/stdlib_strtabs.o \
c_code/2_2/stdlib_osproc.o \
c_code/2_2/stdlib_sets.o \
c_code/2_2/stdlib_hashes.o \
c_code/2_2/stdlib_etcpriv.o \
c_code/2_2/stdlib_streams.o \
c_code/2_2/stdlib_cpuinfo.o \
c_code/2_2/stdlib_linux.o \
c_code/2_2/stdlib_termios.o \
c_code/2_2/compiler_nversion.o \
c_code/2_2/compiler_condsyms.o \
c_code/2_2/compiler_idents.o \
c_code/2_2/compiler_wordrecg.o \
c_code/2_2/compiler_extccomp.o \
c_code/2_2/stdlib_securehash.o \
c_code/2_2/stdlib_json.o \
c_code/2_2/stdlib_lexbase.o \
c_code/2_2/stdlib_unicode.o \
c_code/2_2/compiler_nimblecmd.o \
c_code/2_2/stdlib_parseopt.o \
c_code/2_2/compiler_lexer.o \
c_code/2_2/compiler_nimlexbase.o \
c_code/2_2/compiler_llstream.o \
c_code/2_2/compiler_nimconf.o \
c_code/2_2/compiler_main.o \
c_code/2_2/compiler_ast.o \
c_code/2_2/compiler_astalgo.o \
c_code/2_2/compiler_syntaxes.o \
c_code/2_2/compiler_renderer.o \
c_code/2_2/compiler_rodread.o \
c_code/2_2/compiler_rodwrite.o \
c_code/2_2/compiler_sem.o \
c_code/2_2/compiler_semdata.o \
c_code/2_2/compiler_passes.o \
c_code/2_2/compiler_docgen.o \
c_code/2_2/compiler_cgen.o \
c_code/2_2/compiler_jsgen.o \
c_code/2_2/compiler_importer.o \
c_code/2_2/compiler_passaux.o \
c_code/2_2/compiler_depends.o \
c_code/2_3/compiler_vm.o \
c_code/2_2/compiler_vmdef.o \
c_code/2_2/compiler_types.o \
c_code/2_2/compiler_idgen.o \
c_code/2_2/compiler_docgen2.o \
c_code/2_2/compiler_service.o \
c_code/2_2/compiler_parser.o \
c_code/2_2/compiler_modules.o \
c_code/2_2/compiler_ccgutils.o \
c_code/2_2/compiler_sigmatch.o \
c_code/2_2/compiler_modulegraphs.o \
c_code/2_2/stdlib_intsets.o \
c_code/2_2/compiler_rodutils.o \
c_code/2_2/compiler_pbraces.o \
c_code/2_2/compiler_filters.o \
c_code/2_2/compiler_filter_tmpl.o \
c_code/2_2/stdlib_memfiles.o \
c_code/2_2/compiler_trees.o \
c_code/2_2/compiler_magicsys.o \
c_code/2_2/compiler_nimsets.o \
c_code/2_2/compiler_bitsets.o \
c_code/2_2/compiler_lookups.o \
c_code/2_2/compiler_prettybase.o \
c_code/2_2/compiler_treetab.o \
c_code/2_2/compiler_semfold.o \
c_code/2_2/compiler_procfind.o \
c_code/2_2/compiler_pragmas.o \
c_code/2_2/compiler_semtypinst.o \
c_code/2_2/compiler_transf.o \
c_code/2_2/compiler_aliases.o \
c_code/2_2/compiler_cgmeth.o \
c_code/2_2/compiler_lambdalifting.o \
c_code/2_2/compiler_evaltempl.o \
c_code/2_2/compiler_patterns.o \
c_code/2_2/compiler_parampatterns.o \
c_code/2_2/compiler_sempass2.o \
c_code/2_2/compiler_pretty.o \
c_code/2_2/compiler_semmacrosanity.o \
c_code/2_2/compiler_semparallel.o \
c_code/2_2/compiler_lowerings.o \
c_code/2_2/compiler_pluginsupport.o \
c_code/2_2/compiler_active.o \
c_code/2_2/compiler_saturate.o \
c_code/2_2/docutils_rstast.o \
c_code/2_2/docutils_rst.o \
c_code/2_2/docutils_rstgen.o \
c_code/2_2/docutils_highlite.o \
c_code/2_2/stdlib_xmltree.o \
c_code/2_2/stdlib_cgi.o \
c_code/2_2/compiler_typesrenderer.o \
c_code/2_2/stdlib_sequtils.o \
c_code/2_2/compiler_guards.o \
c_code/2_2/compiler_writetracking.o \
c_code/2_2/stdlib_cookies.o \
c_code/2_2/compiler_vmgen.o \
c_code/2_2/compiler_vmdeps.o \
c_code/2_2/compiler_vmmarshal.o \
c_code/2_2/compiler_locals.o \
c_code/2_2/compiler_itersgen.o \
c_code/2_2/compiler_cgendata.o \
c_code/2_2/compiler_ccgmerge.o \
c_code/2_2/compiler_sighashes.o \
c_code/2_2/stdlib_md5.o \
c_code/2_2/stdlib_dynlib.o \
c_code/2_2/stdlib_net.o \
c_code/2_2/stdlib_nativesockets.o \
c_code/2_2/compiler_nodejs.o \
c_code/2_2/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  arm)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nim.c -o c_code/2_1/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_system.c -o c_code/2_4/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_commands.c -o c_code/2_1/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_os.c -o c_code/2_1/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.c -o c_code/2_1/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.c -o c_code/2_1/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.c -o c_code/2_1/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_algorithm.c -o c_code/2_1/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_times.c -o c_code/2_1/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_posix.c -o c_code/2_1/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_msgs.c -o c_code/2_1/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_options.c -o c_code/2_1/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_tables.c -o c_code/2_1/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ropes.c -o c_code/2_1/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/compiler_platform.c -o c_code/2_4/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.c -o c_code/2_1/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_macros.c -o c_code/2_1/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lists.c -o c_code/2_1/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strtabs.c -o c_code/2_1/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_osproc.c -o c_code/2_1/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sets.c -o c_code/2_1/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_hashes.c -o c_code/2_1/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_etcpriv.c -o c_code/2_1/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_streams.c -o c_code/2_1/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cpuinfo.c -o c_code/2_1/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_linux.c -o c_code/2_1/stdlib_linux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_termios.c -o c_code/2_1/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nversion.c -o c_code/2_1/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_condsyms.c -o c_code/2_1/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idents.c -o c_code/2_1/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_wordrecg.c -o c_code/2_1/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_extccomp.c -o c_code/2_1/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_securehash.c -o c_code/2_1/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_json.c -o c_code/2_1/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.c -o c_code/2_1/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.c -o c_code/2_1/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimblecmd.c -o c_code/2_1/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.c -o c_code/2_1/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lexer.c -o c_code/2_1/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimlexbase.c -o c_code/2_1/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_llstream.c -o c_code/2_1/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimconf.c -o c_code/2_1/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_main.c -o c_code/2_1/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ast.c -o c_code/2_1/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_astalgo.c -o c_code/2_1/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_syntaxes.c -o c_code/2_1/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_renderer.c -o c_code/2_1/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodread.c -o c_code/2_1/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodwrite.c -o c_code/2_1/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sem.c -o c_code/2_1/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semdata.c -o c_code/2_1/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passes.c -o c_code/2_1/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_docgen.c -o c_code/2_1/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgen.c -o c_code/2_1/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_jsgen.c -o c_code/2_1/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_importer.c -o c_code/2_1/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passaux.c -o c_code/2_1/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_depends.c -o c_code/2_1/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vm.c -o c_code/2_1/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmdef.c -o c_code/2_1/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_types.c -o c_code/2_1/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idgen.c -o c_code/2_1/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_docgen2.c -o c_code/2_1/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_service.c -o c_code/2_1/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parser.c -o c_code/2_1/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_modules.c -o c_code/2_1/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgutils.c -o c_code/2_1/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sigmatch.c -o c_code/2_1/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_modulegraphs.c -o c_code/2_1/compiler_modulegraphs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_intsets.c -o c_code/2_1/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodutils.c -o c_code/2_1/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pbraces.c -o c_code/2_1/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filters.c -o c_code/2_1/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filter_tmpl.c -o c_code/2_1/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_memfiles.c -o c_code/2_1/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_trees.c -o c_code/2_1/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_magicsys.c -o c_code/2_1/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimsets.c -o c_code/2_1/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_bitsets.c -o c_code/2_1/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lookups.c -o c_code/2_1/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_prettybase.c -o c_code/2_1/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_treetab.c -o c_code/2_1/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semfold.c -o c_code/2_1/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_procfind.c -o c_code/2_1/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pragmas.c -o c_code/2_1/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semtypinst.c -o c_code/2_1/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_transf.c -o c_code/2_1/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_aliases.c -o c_code/2_1/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgmeth.c -o c_code/2_1/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lambdalifting.c -o c_code/2_1/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_evaltempl.c -o c_code/2_1/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_patterns.c -o c_code/2_1/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parampatterns.c -o c_code/2_1/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sempass2.c -o c_code/2_1/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pretty.c -o c_code/2_1/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semmacrosanity.c -o c_code/2_1/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semparallel.c -o c_code/2_1/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lowerings.c -o c_code/2_1/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pluginsupport.c -o c_code/2_1/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_active.c -o c_code/2_1/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_saturate.c -o c_code/2_1/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rstast.c -o c_code/2_1/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rst.c -o c_code/2_1/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rstgen.c -o c_code/2_1/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_highlite.c -o c_code/2_1/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_xmltree.c -o c_code/2_1/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cgi.c -o c_code/2_1/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_typesrenderer.c -o c_code/2_1/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sequtils.c -o c_code/2_1/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_guards.c -o c_code/2_1/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_writetracking.c -o c_code/2_1/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cookies.c -o c_code/2_1/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmgen.c -o c_code/2_1/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmdeps.c -o c_code/2_1/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmmarshal.c -o c_code/2_1/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_locals.c -o c_code/2_1/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_itersgen.c -o c_code/2_1/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgendata.c -o c_code/2_1/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgmerge.c -o c_code/2_1/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sighashes.c -o c_code/2_1/compiler_sighashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_md5.c -o c_code/2_1/stdlib_md5.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.c -o c_code/2_1/stdlib_dynlib.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_net.c -o c_code/2_1/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_nativesockets.c -o c_code/2_1/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nodejs.c -o c_code/2_1/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_scriptconfig.c -o c_code/2_1/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/2_1/compiler_nim.o \
c_code/2_4/stdlib_system.o \
c_code/2_1/compiler_commands.o \
c_code/2_1/stdlib_os.o \
c_code/2_1/stdlib_strutils.o \
c_code/2_1/stdlib_parseutils.o \
c_code/2_1/stdlib_math.o \
c_code/2_1/stdlib_algorithm.o \
c_code/2_1/stdlib_times.o \
c_code/2_1/stdlib_posix.o \
c_code/2_1/compiler_msgs.o \
c_code/2_1/compiler_options.o \
c_code/2_1/stdlib_tables.o \
c_code/2_1/compiler_ropes.o \
c_code/2_4/compiler_platform.o \
c_code/2_1/stdlib_terminal.o \
c_code/2_1/stdlib_macros.o \
c_code/2_1/compiler_lists.o \
c_code/2_1/stdlib_strtabs.o \
c_code/2_1/stdlib_osproc.o \
c_code/2_1/stdlib_sets.o \
c_code/2_1/stdlib_hashes.o \
c_code/2_1/stdlib_etcpriv.o \
c_code/2_1/stdlib_streams.o \
c_code/2_1/stdlib_cpuinfo.o \
c_code/2_1/stdlib_linux.o \
c_code/2_1/stdlib_termios.o \
c_code/2_1/compiler_nversion.o \
c_code/2_1/compiler_condsyms.o \
c_code/2_1/compiler_idents.o \
c_code/2_1/compiler_wordrecg.o \
c_code/2_1/compiler_extccomp.o \
c_code/2_1/stdlib_securehash.o \
c_code/2_1/stdlib_json.o \
c_code/2_1/stdlib_lexbase.o \
c_code/2_1/stdlib_unicode.o \
c_code/2_1/compiler_nimblecmd.o \
c_code/2_1/stdlib_parseopt.o \
c_code/2_1/compiler_lexer.o \
c_code/2_1/compiler_nimlexbase.o \
c_code/2_1/compiler_llstream.o \
c_code/2_1/compiler_nimconf.o \
c_code/2_1/compiler_main.o \
c_code/2_1/compiler_ast.o \
c_code/2_1/compiler_astalgo.o \
c_code/2_1/compiler_syntaxes.o \
c_code/2_1/compiler_renderer.o \
c_code/2_1/compiler_rodread.o \
c_code/2_1/compiler_rodwrite.o \
c_code/2_1/compiler_sem.o \
c_code/2_1/compiler_semdata.o \
c_code/2_1/compiler_passes.o \
c_code/2_1/compiler_docgen.o \
c_code/2_1/compiler_cgen.o \
c_code/2_1/compiler_jsgen.o \
c_code/2_1/compiler_importer.o \
c_code/2_1/compiler_passaux.o \
c_code/2_1/compiler_depends.o \
c_code/2_1/compiler_vm.o \
c_code/2_1/compiler_vmdef.o \
c_code/2_1/compiler_types.o \
c_code/2_1/compiler_idgen.o \
c_code/2_1/compiler_docgen2.o \
c_code/2_1/compiler_service.o \
c_code/2_1/compiler_parser.o \
c_code/2_1/compiler_modules.o \
c_code/2_1/compiler_ccgutils.o \
c_code/2_1/compiler_sigmatch.o \
c_code/2_1/compiler_modulegraphs.o \
c_code/2_1/stdlib_intsets.o \
c_code/2_1/compiler_rodutils.o \
c_code/2_1/compiler_pbraces.o \
c_code/2_1/compiler_filters.o \
c_code/2_1/compiler_filter_tmpl.o \
c_code/2_1/stdlib_memfiles.o \
c_code/2_1/compiler_trees.o \
c_code/2_1/compiler_magicsys.o \
c_code/2_1/compiler_nimsets.o \
c_code/2_1/compiler_bitsets.o \
c_code/2_1/compiler_lookups.o \
c_code/2_1/compiler_prettybase.o \
c_code/2_1/compiler_treetab.o \
c_code/2_1/compiler_semfold.o \
c_code/2_1/compiler_procfind.o \
c_code/2_1/compiler_pragmas.o \
c_code/2_1/compiler_semtypinst.o \
c_code/2_1/compiler_transf.o \
c_code/2_1/compiler_aliases.o \
c_code/2_1/compiler_cgmeth.o \
c_code/2_1/compiler_lambdalifting.o \
c_code/2_1/compiler_evaltempl.o \
c_code/2_1/compiler_patterns.o \
c_code/2_1/compiler_parampatterns.o \
c_code/2_1/compiler_sempass2.o \
c_code/2_1/compiler_pretty.o \
c_code/2_1/compiler_semmacrosanity.o \
c_code/2_1/compiler_semparallel.o \
c_code/2_1/compiler_lowerings.o \
c_code/2_1/compiler_pluginsupport.o \
c_code/2_1/compiler_active.o \
c_code/2_1/compiler_saturate.o \
c_code/2_1/docutils_rstast.o \
c_code/2_1/docutils_rst.o \
c_code/2_1/docutils_rstgen.o \
c_code/2_1/docutils_highlite.o \
c_code/2_1/stdlib_xmltree.o \
c_code/2_1/stdlib_cgi.o \
c_code/2_1/compiler_typesrenderer.o \
c_code/2_1/stdlib_sequtils.o \
c_code/2_1/compiler_guards.o \
c_code/2_1/compiler_writetracking.o \
c_code/2_1/stdlib_cookies.o \
c_code/2_1/compiler_vmgen.o \
c_code/2_1/compiler_vmdeps.o \
c_code/2_1/compiler_vmmarshal.o \
c_code/2_1/compiler_locals.o \
c_code/2_1/compiler_itersgen.o \
c_code/2_1/compiler_cgendata.o \
c_code/2_1/compiler_ccgmerge.o \
c_code/2_1/compiler_sighashes.o \
c_code/2_1/stdlib_md5.o \
c_code/2_1/stdlib_dynlib.o \
c_code/2_1/stdlib_net.o \
c_code/2_1/stdlib_nativesockets.o \
c_code/2_1/compiler_nodejs.o \
c_code/2_1/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  sparc)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nim.c -o c_code/2_1/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_system.c -o c_code/2_5/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_commands.c -o c_code/2_1/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_os.c -o c_code/2_1/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.c -o c_code/2_1/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.c -o c_code/2_1/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.c -o c_code/2_1/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_algorithm.c -o c_code/2_1/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_times.c -o c_code/2_1/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_posix.c -o c_code/2_1/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_msgs.c -o c_code/2_1/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_options.c -o c_code/2_1/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_tables.c -o c_code/2_1/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ropes.c -o c_code/2_1/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_platform.c -o c_code/2_5/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.c -o c_code/2_1/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_macros.c -o c_code/2_1/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lists.c -o c_code/2_1/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strtabs.c -o c_code/2_1/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_osproc.c -o c_code/2_1/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sets.c -o c_code/2_1/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_hashes.c -o c_code/2_1/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_etcpriv.c -o c_code/2_1/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_streams.c -o c_code/2_1/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cpuinfo.c -o c_code/2_1/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_linux.c -o c_code/2_1/stdlib_linux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_termios.c -o c_code/2_1/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nversion.c -o c_code/2_1/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_condsyms.c -o c_code/2_1/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idents.c -o c_code/2_1/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_wordrecg.c -o c_code/2_1/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_extccomp.c -o c_code/2_1/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_securehash.c -o c_code/2_1/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_json.c -o c_code/2_1/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.c -o c_code/2_1/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.c -o c_code/2_1/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimblecmd.c -o c_code/2_1/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.c -o c_code/2_1/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lexer.c -o c_code/2_1/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimlexbase.c -o c_code/2_1/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_llstream.c -o c_code/2_1/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimconf.c -o c_code/2_1/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_main.c -o c_code/2_1/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ast.c -o c_code/2_1/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_astalgo.c -o c_code/2_1/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_syntaxes.c -o c_code/2_1/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_renderer.c -o c_code/2_1/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodread.c -o c_code/2_1/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodwrite.c -o c_code/2_1/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sem.c -o c_code/2_1/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semdata.c -o c_code/2_1/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passes.c -o c_code/2_1/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_docgen.c -o c_code/2_1/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgen.c -o c_code/2_1/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_jsgen.c -o c_code/2_1/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_importer.c -o c_code/2_1/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passaux.c -o c_code/2_1/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_depends.c -o c_code/2_1/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_vm.c -o c_code/2_5/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmdef.c -o c_code/2_1/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_types.c -o c_code/2_1/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idgen.c -o c_code/2_1/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_docgen2.c -o c_code/2_1/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_service.c -o c_code/2_1/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parser.c -o c_code/2_1/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_modules.c -o c_code/2_1/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgutils.c -o c_code/2_1/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sigmatch.c -o c_code/2_1/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_modulegraphs.c -o c_code/2_1/compiler_modulegraphs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_intsets.c -o c_code/2_1/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodutils.c -o c_code/2_1/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pbraces.c -o c_code/2_1/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filters.c -o c_code/2_1/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filter_tmpl.c -o c_code/2_1/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_memfiles.c -o c_code/2_1/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_trees.c -o c_code/2_1/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_magicsys.c -o c_code/2_1/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimsets.c -o c_code/2_1/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_bitsets.c -o c_code/2_1/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lookups.c -o c_code/2_1/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_prettybase.c -o c_code/2_1/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_treetab.c -o c_code/2_1/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semfold.c -o c_code/2_1/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_procfind.c -o c_code/2_1/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pragmas.c -o c_code/2_1/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semtypinst.c -o c_code/2_1/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_transf.c -o c_code/2_1/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_aliases.c -o c_code/2_1/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgmeth.c -o c_code/2_1/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lambdalifting.c -o c_code/2_1/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_evaltempl.c -o c_code/2_1/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_patterns.c -o c_code/2_1/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parampatterns.c -o c_code/2_1/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sempass2.c -o c_code/2_1/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pretty.c -o c_code/2_1/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semmacrosanity.c -o c_code/2_1/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semparallel.c -o c_code/2_1/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lowerings.c -o c_code/2_1/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pluginsupport.c -o c_code/2_1/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_active.c -o c_code/2_1/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_saturate.c -o c_code/2_1/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rstast.c -o c_code/2_1/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rst.c -o c_code/2_1/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rstgen.c -o c_code/2_1/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_highlite.c -o c_code/2_1/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_xmltree.c -o c_code/2_1/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cgi.c -o c_code/2_1/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_typesrenderer.c -o c_code/2_1/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sequtils.c -o c_code/2_1/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_guards.c -o c_code/2_1/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_writetracking.c -o c_code/2_1/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cookies.c -o c_code/2_1/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmgen.c -o c_code/2_1/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmdeps.c -o c_code/2_1/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmmarshal.c -o c_code/2_1/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_locals.c -o c_code/2_1/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_itersgen.c -o c_code/2_1/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgendata.c -o c_code/2_1/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgmerge.c -o c_code/2_1/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sighashes.c -o c_code/2_1/compiler_sighashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_md5.c -o c_code/2_1/stdlib_md5.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.c -o c_code/2_1/stdlib_dynlib.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_net.c -o c_code/2_1/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_nativesockets.c -o c_code/2_1/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nodejs.c -o c_code/2_1/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_scriptconfig.c -o c_code/2_1/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/2_1/compiler_nim.o \
c_code/2_5/stdlib_system.o \
c_code/2_1/compiler_commands.o \
c_code/2_1/stdlib_os.o \
c_code/2_1/stdlib_strutils.o \
c_code/2_1/stdlib_parseutils.o \
c_code/2_1/stdlib_math.o \
c_code/2_1/stdlib_algorithm.o \
c_code/2_1/stdlib_times.o \
c_code/2_1/stdlib_posix.o \
c_code/2_1/compiler_msgs.o \
c_code/2_1/compiler_options.o \
c_code/2_1/stdlib_tables.o \
c_code/2_1/compiler_ropes.o \
c_code/2_5/compiler_platform.o \
c_code/2_1/stdlib_terminal.o \
c_code/2_1/stdlib_macros.o \
c_code/2_1/compiler_lists.o \
c_code/2_1/stdlib_strtabs.o \
c_code/2_1/stdlib_osproc.o \
c_code/2_1/stdlib_sets.o \
c_code/2_1/stdlib_hashes.o \
c_code/2_1/stdlib_etcpriv.o \
c_code/2_1/stdlib_streams.o \
c_code/2_1/stdlib_cpuinfo.o \
c_code/2_1/stdlib_linux.o \
c_code/2_1/stdlib_termios.o \
c_code/2_1/compiler_nversion.o \
c_code/2_1/compiler_condsyms.o \
c_code/2_1/compiler_idents.o \
c_code/2_1/compiler_wordrecg.o \
c_code/2_1/compiler_extccomp.o \
c_code/2_1/stdlib_securehash.o \
c_code/2_1/stdlib_json.o \
c_code/2_1/stdlib_lexbase.o \
c_code/2_1/stdlib_unicode.o \
c_code/2_1/compiler_nimblecmd.o \
c_code/2_1/stdlib_parseopt.o \
c_code/2_1/compiler_lexer.o \
c_code/2_1/compiler_nimlexbase.o \
c_code/2_1/compiler_llstream.o \
c_code/2_1/compiler_nimconf.o \
c_code/2_1/compiler_main.o \
c_code/2_1/compiler_ast.o \
c_code/2_1/compiler_astalgo.o \
c_code/2_1/compiler_syntaxes.o \
c_code/2_1/compiler_renderer.o \
c_code/2_1/compiler_rodread.o \
c_code/2_1/compiler_rodwrite.o \
c_code/2_1/compiler_sem.o \
c_code/2_1/compiler_semdata.o \
c_code/2_1/compiler_passes.o \
c_code/2_1/compiler_docgen.o \
c_code/2_1/compiler_cgen.o \
c_code/2_1/compiler_jsgen.o \
c_code/2_1/compiler_importer.o \
c_code/2_1/compiler_passaux.o \
c_code/2_1/compiler_depends.o \
c_code/2_5/compiler_vm.o \
c_code/2_1/compiler_vmdef.o \
c_code/2_1/compiler_types.o \
c_code/2_1/compiler_idgen.o \
c_code/2_1/compiler_docgen2.o \
c_code/2_1/compiler_service.o \
c_code/2_1/compiler_parser.o \
c_code/2_1/compiler_modules.o \
c_code/2_1/compiler_ccgutils.o \
c_code/2_1/compiler_sigmatch.o \
c_code/2_1/compiler_modulegraphs.o \
c_code/2_1/stdlib_intsets.o \
c_code/2_1/compiler_rodutils.o \
c_code/2_1/compiler_pbraces.o \
c_code/2_1/compiler_filters.o \
c_code/2_1/compiler_filter_tmpl.o \
c_code/2_1/stdlib_memfiles.o \
c_code/2_1/compiler_trees.o \
c_code/2_1/compiler_magicsys.o \
c_code/2_1/compiler_nimsets.o \
c_code/2_1/compiler_bitsets.o \
c_code/2_1/compiler_lookups.o \
c_code/2_1/compiler_prettybase.o \
c_code/2_1/compiler_treetab.o \
c_code/2_1/compiler_semfold.o \
c_code/2_1/compiler_procfind.o \
c_code/2_1/compiler_pragmas.o \
c_code/2_1/compiler_semtypinst.o \
c_code/2_1/compiler_transf.o \
c_code/2_1/compiler_aliases.o \
c_code/2_1/compiler_cgmeth.o \
c_code/2_1/compiler_lambdalifting.o \
c_code/2_1/compiler_evaltempl.o \
c_code/2_1/compiler_patterns.o \
c_code/2_1/compiler_parampatterns.o \
c_code/2_1/compiler_sempass2.o \
c_code/2_1/compiler_pretty.o \
c_code/2_1/compiler_semmacrosanity.o \
c_code/2_1/compiler_semparallel.o \
c_code/2_1/compiler_lowerings.o \
c_code/2_1/compiler_pluginsupport.o \
c_code/2_1/compiler_active.o \
c_code/2_1/compiler_saturate.o \
c_code/2_1/docutils_rstast.o \
c_code/2_1/docutils_rst.o \
c_code/2_1/docutils_rstgen.o \
c_code/2_1/docutils_highlite.o \
c_code/2_1/stdlib_xmltree.o \
c_code/2_1/stdlib_cgi.o \
c_code/2_1/compiler_typesrenderer.o \
c_code/2_1/stdlib_sequtils.o \
c_code/2_1/compiler_guards.o \
c_code/2_1/compiler_writetracking.o \
c_code/2_1/stdlib_cookies.o \
c_code/2_1/compiler_vmgen.o \
c_code/2_1/compiler_vmdeps.o \
c_code/2_1/compiler_vmmarshal.o \
c_code/2_1/compiler_locals.o \
c_code/2_1/compiler_itersgen.o \
c_code/2_1/compiler_cgendata.o \
c_code/2_1/compiler_ccgmerge.o \
c_code/2_1/compiler_sighashes.o \
c_code/2_1/stdlib_md5.o \
c_code/2_1/stdlib_dynlib.o \
c_code/2_1/stdlib_net.o \
c_code/2_1/stdlib_nativesockets.o \
c_code/2_1/compiler_nodejs.o \
c_code/2_1/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  mips)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nim.c -o c_code/2_1/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_system.c -o c_code/2_4/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_commands.c -o c_code/2_1/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_os.c -o c_code/2_1/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.c -o c_code/2_1/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.c -o c_code/2_1/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.c -o c_code/2_1/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_algorithm.c -o c_code/2_1/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_times.c -o c_code/2_1/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_posix.c -o c_code/2_1/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_msgs.c -o c_code/2_1/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_options.c -o c_code/2_1/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_tables.c -o c_code/2_1/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ropes.c -o c_code/2_1/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/compiler_platform.c -o c_code/2_6/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.c -o c_code/2_1/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_macros.c -o c_code/2_1/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lists.c -o c_code/2_1/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strtabs.c -o c_code/2_1/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_osproc.c -o c_code/2_1/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sets.c -o c_code/2_1/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_hashes.c -o c_code/2_1/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_etcpriv.c -o c_code/2_1/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_streams.c -o c_code/2_1/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cpuinfo.c -o c_code/2_1/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_linux.c -o c_code/2_1/stdlib_linux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_termios.c -o c_code/2_1/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nversion.c -o c_code/2_1/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_condsyms.c -o c_code/2_1/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idents.c -o c_code/2_1/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_wordrecg.c -o c_code/2_1/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_extccomp.c -o c_code/2_1/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_securehash.c -o c_code/2_1/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_json.c -o c_code/2_1/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.c -o c_code/2_1/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.c -o c_code/2_1/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimblecmd.c -o c_code/2_1/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.c -o c_code/2_1/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lexer.c -o c_code/2_1/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimlexbase.c -o c_code/2_1/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_llstream.c -o c_code/2_1/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimconf.c -o c_code/2_1/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_main.c -o c_code/2_1/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ast.c -o c_code/2_1/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_astalgo.c -o c_code/2_1/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_syntaxes.c -o c_code/2_1/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_renderer.c -o c_code/2_1/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodread.c -o c_code/2_1/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodwrite.c -o c_code/2_1/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sem.c -o c_code/2_1/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semdata.c -o c_code/2_1/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passes.c -o c_code/2_1/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_docgen.c -o c_code/2_1/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgen.c -o c_code/2_1/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_jsgen.c -o c_code/2_1/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_importer.c -o c_code/2_1/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passaux.c -o c_code/2_1/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_depends.c -o c_code/2_1/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_vm.c -o c_code/2_5/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmdef.c -o c_code/2_1/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_types.c -o c_code/2_1/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idgen.c -o c_code/2_1/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_docgen2.c -o c_code/2_1/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_service.c -o c_code/2_1/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parser.c -o c_code/2_1/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_modules.c -o c_code/2_1/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgutils.c -o c_code/2_1/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sigmatch.c -o c_code/2_1/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_modulegraphs.c -o c_code/2_1/compiler_modulegraphs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_intsets.c -o c_code/2_1/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodutils.c -o c_code/2_1/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pbraces.c -o c_code/2_1/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filters.c -o c_code/2_1/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filter_tmpl.c -o c_code/2_1/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_memfiles.c -o c_code/2_1/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_trees.c -o c_code/2_1/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_magicsys.c -o c_code/2_1/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimsets.c -o c_code/2_1/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_bitsets.c -o c_code/2_1/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lookups.c -o c_code/2_1/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_prettybase.c -o c_code/2_1/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_treetab.c -o c_code/2_1/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semfold.c -o c_code/2_1/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_procfind.c -o c_code/2_1/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pragmas.c -o c_code/2_1/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semtypinst.c -o c_code/2_1/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_transf.c -o c_code/2_1/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_aliases.c -o c_code/2_1/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgmeth.c -o c_code/2_1/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lambdalifting.c -o c_code/2_1/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_evaltempl.c -o c_code/2_1/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_patterns.c -o c_code/2_1/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parampatterns.c -o c_code/2_1/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sempass2.c -o c_code/2_1/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pretty.c -o c_code/2_1/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semmacrosanity.c -o c_code/2_1/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semparallel.c -o c_code/2_1/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lowerings.c -o c_code/2_1/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pluginsupport.c -o c_code/2_1/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_active.c -o c_code/2_1/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_saturate.c -o c_code/2_1/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rstast.c -o c_code/2_1/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rst.c -o c_code/2_1/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rstgen.c -o c_code/2_1/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_highlite.c -o c_code/2_1/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_xmltree.c -o c_code/2_1/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cgi.c -o c_code/2_1/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_typesrenderer.c -o c_code/2_1/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sequtils.c -o c_code/2_1/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_guards.c -o c_code/2_1/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_writetracking.c -o c_code/2_1/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cookies.c -o c_code/2_1/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmgen.c -o c_code/2_1/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmdeps.c -o c_code/2_1/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmmarshal.c -o c_code/2_1/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_locals.c -o c_code/2_1/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_itersgen.c -o c_code/2_1/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgendata.c -o c_code/2_1/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgmerge.c -o c_code/2_1/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sighashes.c -o c_code/2_1/compiler_sighashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_md5.c -o c_code/2_1/stdlib_md5.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.c -o c_code/2_1/stdlib_dynlib.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_net.c -o c_code/2_1/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_nativesockets.c -o c_code/2_1/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nodejs.c -o c_code/2_1/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_scriptconfig.c -o c_code/2_1/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/2_1/compiler_nim.o \
c_code/2_4/stdlib_system.o \
c_code/2_1/compiler_commands.o \
c_code/2_1/stdlib_os.o \
c_code/2_1/stdlib_strutils.o \
c_code/2_1/stdlib_parseutils.o \
c_code/2_1/stdlib_math.o \
c_code/2_1/stdlib_algorithm.o \
c_code/2_1/stdlib_times.o \
c_code/2_1/stdlib_posix.o \
c_code/2_1/compiler_msgs.o \
c_code/2_1/compiler_options.o \
c_code/2_1/stdlib_tables.o \
c_code/2_1/compiler_ropes.o \
c_code/2_6/compiler_platform.o \
c_code/2_1/stdlib_terminal.o \
c_code/2_1/stdlib_macros.o \
c_code/2_1/compiler_lists.o \
c_code/2_1/stdlib_strtabs.o \
c_code/2_1/stdlib_osproc.o \
c_code/2_1/stdlib_sets.o \
c_code/2_1/stdlib_hashes.o \
c_code/2_1/stdlib_etcpriv.o \
c_code/2_1/stdlib_streams.o \
c_code/2_1/stdlib_cpuinfo.o \
c_code/2_1/stdlib_linux.o \
c_code/2_1/stdlib_termios.o \
c_code/2_1/compiler_nversion.o \
c_code/2_1/compiler_condsyms.o \
c_code/2_1/compiler_idents.o \
c_code/2_1/compiler_wordrecg.o \
c_code/2_1/compiler_extccomp.o \
c_code/2_1/stdlib_securehash.o \
c_code/2_1/stdlib_json.o \
c_code/2_1/stdlib_lexbase.o \
c_code/2_1/stdlib_unicode.o \
c_code/2_1/compiler_nimblecmd.o \
c_code/2_1/stdlib_parseopt.o \
c_code/2_1/compiler_lexer.o \
c_code/2_1/compiler_nimlexbase.o \
c_code/2_1/compiler_llstream.o \
c_code/2_1/compiler_nimconf.o \
c_code/2_1/compiler_main.o \
c_code/2_1/compiler_ast.o \
c_code/2_1/compiler_astalgo.o \
c_code/2_1/compiler_syntaxes.o \
c_code/2_1/compiler_renderer.o \
c_code/2_1/compiler_rodread.o \
c_code/2_1/compiler_rodwrite.o \
c_code/2_1/compiler_sem.o \
c_code/2_1/compiler_semdata.o \
c_code/2_1/compiler_passes.o \
c_code/2_1/compiler_docgen.o \
c_code/2_1/compiler_cgen.o \
c_code/2_1/compiler_jsgen.o \
c_code/2_1/compiler_importer.o \
c_code/2_1/compiler_passaux.o \
c_code/2_1/compiler_depends.o \
c_code/2_5/compiler_vm.o \
c_code/2_1/compiler_vmdef.o \
c_code/2_1/compiler_types.o \
c_code/2_1/compiler_idgen.o \
c_code/2_1/compiler_docgen2.o \
c_code/2_1/compiler_service.o \
c_code/2_1/compiler_parser.o \
c_code/2_1/compiler_modules.o \
c_code/2_1/compiler_ccgutils.o \
c_code/2_1/compiler_sigmatch.o \
c_code/2_1/compiler_modulegraphs.o \
c_code/2_1/stdlib_intsets.o \
c_code/2_1/compiler_rodutils.o \
c_code/2_1/compiler_pbraces.o \
c_code/2_1/compiler_filters.o \
c_code/2_1/compiler_filter_tmpl.o \
c_code/2_1/stdlib_memfiles.o \
c_code/2_1/compiler_trees.o \
c_code/2_1/compiler_magicsys.o \
c_code/2_1/compiler_nimsets.o \
c_code/2_1/compiler_bitsets.o \
c_code/2_1/compiler_lookups.o \
c_code/2_1/compiler_prettybase.o \
c_code/2_1/compiler_treetab.o \
c_code/2_1/compiler_semfold.o \
c_code/2_1/compiler_procfind.o \
c_code/2_1/compiler_pragmas.o \
c_code/2_1/compiler_semtypinst.o \
c_code/2_1/compiler_transf.o \
c_code/2_1/compiler_aliases.o \
c_code/2_1/compiler_cgmeth.o \
c_code/2_1/compiler_lambdalifting.o \
c_code/2_1/compiler_evaltempl.o \
c_code/2_1/compiler_patterns.o \
c_code/2_1/compiler_parampatterns.o \
c_code/2_1/compiler_sempass2.o \
c_code/2_1/compiler_pretty.o \
c_code/2_1/compiler_semmacrosanity.o \
c_code/2_1/compiler_semparallel.o \
c_code/2_1/compiler_lowerings.o \
c_code/2_1/compiler_pluginsupport.o \
c_code/2_1/compiler_active.o \
c_code/2_1/compiler_saturate.o \
c_code/2_1/docutils_rstast.o \
c_code/2_1/docutils_rst.o \
c_code/2_1/docutils_rstgen.o \
c_code/2_1/docutils_highlite.o \
c_code/2_1/stdlib_xmltree.o \
c_code/2_1/stdlib_cgi.o \
c_code/2_1/compiler_typesrenderer.o \
c_code/2_1/stdlib_sequtils.o \
c_code/2_1/compiler_guards.o \
c_code/2_1/compiler_writetracking.o \
c_code/2_1/stdlib_cookies.o \
c_code/2_1/compiler_vmgen.o \
c_code/2_1/compiler_vmdeps.o \
c_code/2_1/compiler_vmmarshal.o \
c_code/2_1/compiler_locals.o \
c_code/2_1/compiler_itersgen.o \
c_code/2_1/compiler_cgendata.o \
c_code/2_1/compiler_ccgmerge.o \
c_code/2_1/compiler_sighashes.o \
c_code/2_1/stdlib_md5.o \
c_code/2_1/stdlib_dynlib.o \
c_code/2_1/stdlib_net.o \
c_code/2_1/stdlib_nativesockets.o \
c_code/2_1/compiler_nodejs.o \
c_code/2_1/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  mipsel)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nim.c -o c_code/2_1/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_system.c -o c_code/2_4/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_commands.c -o c_code/2_1/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_os.c -o c_code/2_1/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.c -o c_code/2_1/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.c -o c_code/2_1/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.c -o c_code/2_1/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_algorithm.c -o c_code/2_1/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_times.c -o c_code/2_1/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_posix.c -o c_code/2_1/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_msgs.c -o c_code/2_1/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_options.c -o c_code/2_1/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_tables.c -o c_code/2_1/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ropes.c -o c_code/2_1/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/compiler_platform.c -o c_code/2_7/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.c -o c_code/2_1/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_macros.c -o c_code/2_1/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lists.c -o c_code/2_1/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strtabs.c -o c_code/2_1/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_osproc.c -o c_code/2_1/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sets.c -o c_code/2_1/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_hashes.c -o c_code/2_1/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_etcpriv.c -o c_code/2_1/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_streams.c -o c_code/2_1/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cpuinfo.c -o c_code/2_1/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_linux.c -o c_code/2_1/stdlib_linux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_termios.c -o c_code/2_1/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nversion.c -o c_code/2_1/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_condsyms.c -o c_code/2_1/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idents.c -o c_code/2_1/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_wordrecg.c -o c_code/2_1/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_extccomp.c -o c_code/2_1/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_securehash.c -o c_code/2_1/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_json.c -o c_code/2_1/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.c -o c_code/2_1/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.c -o c_code/2_1/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimblecmd.c -o c_code/2_1/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.c -o c_code/2_1/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lexer.c -o c_code/2_1/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimlexbase.c -o c_code/2_1/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_llstream.c -o c_code/2_1/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimconf.c -o c_code/2_1/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_main.c -o c_code/2_1/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ast.c -o c_code/2_1/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_astalgo.c -o c_code/2_1/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_syntaxes.c -o c_code/2_1/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_renderer.c -o c_code/2_1/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodread.c -o c_code/2_1/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodwrite.c -o c_code/2_1/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sem.c -o c_code/2_1/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semdata.c -o c_code/2_1/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passes.c -o c_code/2_1/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_docgen.c -o c_code/2_1/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgen.c -o c_code/2_1/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_jsgen.c -o c_code/2_1/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_importer.c -o c_code/2_1/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passaux.c -o c_code/2_1/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_depends.c -o c_code/2_1/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vm.c -o c_code/2_1/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmdef.c -o c_code/2_1/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_types.c -o c_code/2_1/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idgen.c -o c_code/2_1/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_docgen2.c -o c_code/2_1/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_service.c -o c_code/2_1/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parser.c -o c_code/2_1/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_modules.c -o c_code/2_1/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgutils.c -o c_code/2_1/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sigmatch.c -o c_code/2_1/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_modulegraphs.c -o c_code/2_1/compiler_modulegraphs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_intsets.c -o c_code/2_1/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodutils.c -o c_code/2_1/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pbraces.c -o c_code/2_1/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filters.c -o c_code/2_1/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filter_tmpl.c -o c_code/2_1/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_memfiles.c -o c_code/2_1/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_trees.c -o c_code/2_1/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_magicsys.c -o c_code/2_1/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimsets.c -o c_code/2_1/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_bitsets.c -o c_code/2_1/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lookups.c -o c_code/2_1/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_prettybase.c -o c_code/2_1/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_treetab.c -o c_code/2_1/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semfold.c -o c_code/2_1/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_procfind.c -o c_code/2_1/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pragmas.c -o c_code/2_1/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semtypinst.c -o c_code/2_1/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_transf.c -o c_code/2_1/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_aliases.c -o c_code/2_1/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgmeth.c -o c_code/2_1/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lambdalifting.c -o c_code/2_1/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_evaltempl.c -o c_code/2_1/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_patterns.c -o c_code/2_1/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parampatterns.c -o c_code/2_1/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sempass2.c -o c_code/2_1/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pretty.c -o c_code/2_1/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semmacrosanity.c -o c_code/2_1/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semparallel.c -o c_code/2_1/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lowerings.c -o c_code/2_1/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pluginsupport.c -o c_code/2_1/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_active.c -o c_code/2_1/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_saturate.c -o c_code/2_1/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rstast.c -o c_code/2_1/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rst.c -o c_code/2_1/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rstgen.c -o c_code/2_1/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_highlite.c -o c_code/2_1/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_xmltree.c -o c_code/2_1/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cgi.c -o c_code/2_1/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_typesrenderer.c -o c_code/2_1/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sequtils.c -o c_code/2_1/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_guards.c -o c_code/2_1/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_writetracking.c -o c_code/2_1/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cookies.c -o c_code/2_1/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmgen.c -o c_code/2_1/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmdeps.c -o c_code/2_1/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmmarshal.c -o c_code/2_1/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_locals.c -o c_code/2_1/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_itersgen.c -o c_code/2_1/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgendata.c -o c_code/2_1/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgmerge.c -o c_code/2_1/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sighashes.c -o c_code/2_1/compiler_sighashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_md5.c -o c_code/2_1/stdlib_md5.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.c -o c_code/2_1/stdlib_dynlib.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_net.c -o c_code/2_1/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_nativesockets.c -o c_code/2_1/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nodejs.c -o c_code/2_1/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_scriptconfig.c -o c_code/2_1/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/2_1/compiler_nim.o \
c_code/2_4/stdlib_system.o \
c_code/2_1/compiler_commands.o \
c_code/2_1/stdlib_os.o \
c_code/2_1/stdlib_strutils.o \
c_code/2_1/stdlib_parseutils.o \
c_code/2_1/stdlib_math.o \
c_code/2_1/stdlib_algorithm.o \
c_code/2_1/stdlib_times.o \
c_code/2_1/stdlib_posix.o \
c_code/2_1/compiler_msgs.o \
c_code/2_1/compiler_options.o \
c_code/2_1/stdlib_tables.o \
c_code/2_1/compiler_ropes.o \
c_code/2_7/compiler_platform.o \
c_code/2_1/stdlib_terminal.o \
c_code/2_1/stdlib_macros.o \
c_code/2_1/compiler_lists.o \
c_code/2_1/stdlib_strtabs.o \
c_code/2_1/stdlib_osproc.o \
c_code/2_1/stdlib_sets.o \
c_code/2_1/stdlib_hashes.o \
c_code/2_1/stdlib_etcpriv.o \
c_code/2_1/stdlib_streams.o \
c_code/2_1/stdlib_cpuinfo.o \
c_code/2_1/stdlib_linux.o \
c_code/2_1/stdlib_termios.o \
c_code/2_1/compiler_nversion.o \
c_code/2_1/compiler_condsyms.o \
c_code/2_1/compiler_idents.o \
c_code/2_1/compiler_wordrecg.o \
c_code/2_1/compiler_extccomp.o \
c_code/2_1/stdlib_securehash.o \
c_code/2_1/stdlib_json.o \
c_code/2_1/stdlib_lexbase.o \
c_code/2_1/stdlib_unicode.o \
c_code/2_1/compiler_nimblecmd.o \
c_code/2_1/stdlib_parseopt.o \
c_code/2_1/compiler_lexer.o \
c_code/2_1/compiler_nimlexbase.o \
c_code/2_1/compiler_llstream.o \
c_code/2_1/compiler_nimconf.o \
c_code/2_1/compiler_main.o \
c_code/2_1/compiler_ast.o \
c_code/2_1/compiler_astalgo.o \
c_code/2_1/compiler_syntaxes.o \
c_code/2_1/compiler_renderer.o \
c_code/2_1/compiler_rodread.o \
c_code/2_1/compiler_rodwrite.o \
c_code/2_1/compiler_sem.o \
c_code/2_1/compiler_semdata.o \
c_code/2_1/compiler_passes.o \
c_code/2_1/compiler_docgen.o \
c_code/2_1/compiler_cgen.o \
c_code/2_1/compiler_jsgen.o \
c_code/2_1/compiler_importer.o \
c_code/2_1/compiler_passaux.o \
c_code/2_1/compiler_depends.o \
c_code/2_1/compiler_vm.o \
c_code/2_1/compiler_vmdef.o \
c_code/2_1/compiler_types.o \
c_code/2_1/compiler_idgen.o \
c_code/2_1/compiler_docgen2.o \
c_code/2_1/compiler_service.o \
c_code/2_1/compiler_parser.o \
c_code/2_1/compiler_modules.o \
c_code/2_1/compiler_ccgutils.o \
c_code/2_1/compiler_sigmatch.o \
c_code/2_1/compiler_modulegraphs.o \
c_code/2_1/stdlib_intsets.o \
c_code/2_1/compiler_rodutils.o \
c_code/2_1/compiler_pbraces.o \
c_code/2_1/compiler_filters.o \
c_code/2_1/compiler_filter_tmpl.o \
c_code/2_1/stdlib_memfiles.o \
c_code/2_1/compiler_trees.o \
c_code/2_1/compiler_magicsys.o \
c_code/2_1/compiler_nimsets.o \
c_code/2_1/compiler_bitsets.o \
c_code/2_1/compiler_lookups.o \
c_code/2_1/compiler_prettybase.o \
c_code/2_1/compiler_treetab.o \
c_code/2_1/compiler_semfold.o \
c_code/2_1/compiler_procfind.o \
c_code/2_1/compiler_pragmas.o \
c_code/2_1/compiler_semtypinst.o \
c_code/2_1/compiler_transf.o \
c_code/2_1/compiler_aliases.o \
c_code/2_1/compiler_cgmeth.o \
c_code/2_1/compiler_lambdalifting.o \
c_code/2_1/compiler_evaltempl.o \
c_code/2_1/compiler_patterns.o \
c_code/2_1/compiler_parampatterns.o \
c_code/2_1/compiler_sempass2.o \
c_code/2_1/compiler_pretty.o \
c_code/2_1/compiler_semmacrosanity.o \
c_code/2_1/compiler_semparallel.o \
c_code/2_1/compiler_lowerings.o \
c_code/2_1/compiler_pluginsupport.o \
c_code/2_1/compiler_active.o \
c_code/2_1/compiler_saturate.o \
c_code/2_1/docutils_rstast.o \
c_code/2_1/docutils_rst.o \
c_code/2_1/docutils_rstgen.o \
c_code/2_1/docutils_highlite.o \
c_code/2_1/stdlib_xmltree.o \
c_code/2_1/stdlib_cgi.o \
c_code/2_1/compiler_typesrenderer.o \
c_code/2_1/stdlib_sequtils.o \
c_code/2_1/compiler_guards.o \
c_code/2_1/compiler_writetracking.o \
c_code/2_1/stdlib_cookies.o \
c_code/2_1/compiler_vmgen.o \
c_code/2_1/compiler_vmdeps.o \
c_code/2_1/compiler_vmmarshal.o \
c_code/2_1/compiler_locals.o \
c_code/2_1/compiler_itersgen.o \
c_code/2_1/compiler_cgendata.o \
c_code/2_1/compiler_ccgmerge.o \
c_code/2_1/compiler_sighashes.o \
c_code/2_1/stdlib_md5.o \
c_code/2_1/stdlib_dynlib.o \
c_code/2_1/stdlib_net.o \
c_code/2_1/stdlib_nativesockets.o \
c_code/2_1/compiler_nodejs.o \
c_code/2_1/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  powerpc)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nim.c -o c_code/2_1/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_system.c -o c_code/2_4/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_commands.c -o c_code/2_1/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_os.c -o c_code/2_1/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.c -o c_code/2_1/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.c -o c_code/2_1/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.c -o c_code/2_1/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_algorithm.c -o c_code/2_1/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_times.c -o c_code/2_1/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_posix.c -o c_code/2_1/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_msgs.c -o c_code/2_1/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_options.c -o c_code/2_1/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_tables.c -o c_code/2_1/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ropes.c -o c_code/2_1/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/compiler_platform.c -o c_code/2_8/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.c -o c_code/2_1/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_macros.c -o c_code/2_1/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lists.c -o c_code/2_1/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strtabs.c -o c_code/2_1/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_osproc.c -o c_code/2_1/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sets.c -o c_code/2_1/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_hashes.c -o c_code/2_1/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_etcpriv.c -o c_code/2_1/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_streams.c -o c_code/2_1/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cpuinfo.c -o c_code/2_1/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_linux.c -o c_code/2_1/stdlib_linux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_termios.c -o c_code/2_1/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nversion.c -o c_code/2_1/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_condsyms.c -o c_code/2_1/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idents.c -o c_code/2_1/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_wordrecg.c -o c_code/2_1/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_extccomp.c -o c_code/2_1/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_securehash.c -o c_code/2_1/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_json.c -o c_code/2_1/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.c -o c_code/2_1/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.c -o c_code/2_1/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimblecmd.c -o c_code/2_1/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.c -o c_code/2_1/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lexer.c -o c_code/2_1/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimlexbase.c -o c_code/2_1/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_llstream.c -o c_code/2_1/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimconf.c -o c_code/2_1/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_main.c -o c_code/2_1/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ast.c -o c_code/2_1/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_astalgo.c -o c_code/2_1/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_syntaxes.c -o c_code/2_1/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_renderer.c -o c_code/2_1/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodread.c -o c_code/2_1/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodwrite.c -o c_code/2_1/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sem.c -o c_code/2_1/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semdata.c -o c_code/2_1/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passes.c -o c_code/2_1/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_docgen.c -o c_code/2_1/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgen.c -o c_code/2_1/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_jsgen.c -o c_code/2_1/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_importer.c -o c_code/2_1/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passaux.c -o c_code/2_1/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_depends.c -o c_code/2_1/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/compiler_vm.c -o c_code/2_5/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmdef.c -o c_code/2_1/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_types.c -o c_code/2_1/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idgen.c -o c_code/2_1/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_docgen2.c -o c_code/2_1/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_service.c -o c_code/2_1/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parser.c -o c_code/2_1/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_modules.c -o c_code/2_1/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgutils.c -o c_code/2_1/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sigmatch.c -o c_code/2_1/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_modulegraphs.c -o c_code/2_1/compiler_modulegraphs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_intsets.c -o c_code/2_1/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodutils.c -o c_code/2_1/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pbraces.c -o c_code/2_1/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filters.c -o c_code/2_1/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filter_tmpl.c -o c_code/2_1/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_memfiles.c -o c_code/2_1/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_trees.c -o c_code/2_1/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_magicsys.c -o c_code/2_1/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimsets.c -o c_code/2_1/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_bitsets.c -o c_code/2_1/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lookups.c -o c_code/2_1/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_prettybase.c -o c_code/2_1/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_treetab.c -o c_code/2_1/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semfold.c -o c_code/2_1/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_procfind.c -o c_code/2_1/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pragmas.c -o c_code/2_1/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semtypinst.c -o c_code/2_1/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_transf.c -o c_code/2_1/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_aliases.c -o c_code/2_1/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgmeth.c -o c_code/2_1/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lambdalifting.c -o c_code/2_1/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_evaltempl.c -o c_code/2_1/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_patterns.c -o c_code/2_1/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parampatterns.c -o c_code/2_1/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sempass2.c -o c_code/2_1/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pretty.c -o c_code/2_1/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semmacrosanity.c -o c_code/2_1/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semparallel.c -o c_code/2_1/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lowerings.c -o c_code/2_1/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pluginsupport.c -o c_code/2_1/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_active.c -o c_code/2_1/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_saturate.c -o c_code/2_1/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rstast.c -o c_code/2_1/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rst.c -o c_code/2_1/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rstgen.c -o c_code/2_1/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_highlite.c -o c_code/2_1/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_xmltree.c -o c_code/2_1/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cgi.c -o c_code/2_1/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_typesrenderer.c -o c_code/2_1/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sequtils.c -o c_code/2_1/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_guards.c -o c_code/2_1/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_writetracking.c -o c_code/2_1/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cookies.c -o c_code/2_1/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmgen.c -o c_code/2_1/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmdeps.c -o c_code/2_1/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmmarshal.c -o c_code/2_1/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_locals.c -o c_code/2_1/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_itersgen.c -o c_code/2_1/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgendata.c -o c_code/2_1/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgmerge.c -o c_code/2_1/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sighashes.c -o c_code/2_1/compiler_sighashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_md5.c -o c_code/2_1/stdlib_md5.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.c -o c_code/2_1/stdlib_dynlib.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_net.c -o c_code/2_1/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_nativesockets.c -o c_code/2_1/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nodejs.c -o c_code/2_1/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_scriptconfig.c -o c_code/2_1/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/2_1/compiler_nim.o \
c_code/2_4/stdlib_system.o \
c_code/2_1/compiler_commands.o \
c_code/2_1/stdlib_os.o \
c_code/2_1/stdlib_strutils.o \
c_code/2_1/stdlib_parseutils.o \
c_code/2_1/stdlib_math.o \
c_code/2_1/stdlib_algorithm.o \
c_code/2_1/stdlib_times.o \
c_code/2_1/stdlib_posix.o \
c_code/2_1/compiler_msgs.o \
c_code/2_1/compiler_options.o \
c_code/2_1/stdlib_tables.o \
c_code/2_1/compiler_ropes.o \
c_code/2_8/compiler_platform.o \
c_code/2_1/stdlib_terminal.o \
c_code/2_1/stdlib_macros.o \
c_code/2_1/compiler_lists.o \
c_code/2_1/stdlib_strtabs.o \
c_code/2_1/stdlib_osproc.o \
c_code/2_1/stdlib_sets.o \
c_code/2_1/stdlib_hashes.o \
c_code/2_1/stdlib_etcpriv.o \
c_code/2_1/stdlib_streams.o \
c_code/2_1/stdlib_cpuinfo.o \
c_code/2_1/stdlib_linux.o \
c_code/2_1/stdlib_termios.o \
c_code/2_1/compiler_nversion.o \
c_code/2_1/compiler_condsyms.o \
c_code/2_1/compiler_idents.o \
c_code/2_1/compiler_wordrecg.o \
c_code/2_1/compiler_extccomp.o \
c_code/2_1/stdlib_securehash.o \
c_code/2_1/stdlib_json.o \
c_code/2_1/stdlib_lexbase.o \
c_code/2_1/stdlib_unicode.o \
c_code/2_1/compiler_nimblecmd.o \
c_code/2_1/stdlib_parseopt.o \
c_code/2_1/compiler_lexer.o \
c_code/2_1/compiler_nimlexbase.o \
c_code/2_1/compiler_llstream.o \
c_code/2_1/compiler_nimconf.o \
c_code/2_1/compiler_main.o \
c_code/2_1/compiler_ast.o \
c_code/2_1/compiler_astalgo.o \
c_code/2_1/compiler_syntaxes.o \
c_code/2_1/compiler_renderer.o \
c_code/2_1/compiler_rodread.o \
c_code/2_1/compiler_rodwrite.o \
c_code/2_1/compiler_sem.o \
c_code/2_1/compiler_semdata.o \
c_code/2_1/compiler_passes.o \
c_code/2_1/compiler_docgen.o \
c_code/2_1/compiler_cgen.o \
c_code/2_1/compiler_jsgen.o \
c_code/2_1/compiler_importer.o \
c_code/2_1/compiler_passaux.o \
c_code/2_1/compiler_depends.o \
c_code/2_5/compiler_vm.o \
c_code/2_1/compiler_vmdef.o \
c_code/2_1/compiler_types.o \
c_code/2_1/compiler_idgen.o \
c_code/2_1/compiler_docgen2.o \
c_code/2_1/compiler_service.o \
c_code/2_1/compiler_parser.o \
c_code/2_1/compiler_modules.o \
c_code/2_1/compiler_ccgutils.o \
c_code/2_1/compiler_sigmatch.o \
c_code/2_1/compiler_modulegraphs.o \
c_code/2_1/stdlib_intsets.o \
c_code/2_1/compiler_rodutils.o \
c_code/2_1/compiler_pbraces.o \
c_code/2_1/compiler_filters.o \
c_code/2_1/compiler_filter_tmpl.o \
c_code/2_1/stdlib_memfiles.o \
c_code/2_1/compiler_trees.o \
c_code/2_1/compiler_magicsys.o \
c_code/2_1/compiler_nimsets.o \
c_code/2_1/compiler_bitsets.o \
c_code/2_1/compiler_lookups.o \
c_code/2_1/compiler_prettybase.o \
c_code/2_1/compiler_treetab.o \
c_code/2_1/compiler_semfold.o \
c_code/2_1/compiler_procfind.o \
c_code/2_1/compiler_pragmas.o \
c_code/2_1/compiler_semtypinst.o \
c_code/2_1/compiler_transf.o \
c_code/2_1/compiler_aliases.o \
c_code/2_1/compiler_cgmeth.o \
c_code/2_1/compiler_lambdalifting.o \
c_code/2_1/compiler_evaltempl.o \
c_code/2_1/compiler_patterns.o \
c_code/2_1/compiler_parampatterns.o \
c_code/2_1/compiler_sempass2.o \
c_code/2_1/compiler_pretty.o \
c_code/2_1/compiler_semmacrosanity.o \
c_code/2_1/compiler_semparallel.o \
c_code/2_1/compiler_lowerings.o \
c_code/2_1/compiler_pluginsupport.o \
c_code/2_1/compiler_active.o \
c_code/2_1/compiler_saturate.o \
c_code/2_1/docutils_rstast.o \
c_code/2_1/docutils_rst.o \
c_code/2_1/docutils_rstgen.o \
c_code/2_1/docutils_highlite.o \
c_code/2_1/stdlib_xmltree.o \
c_code/2_1/stdlib_cgi.o \
c_code/2_1/compiler_typesrenderer.o \
c_code/2_1/stdlib_sequtils.o \
c_code/2_1/compiler_guards.o \
c_code/2_1/compiler_writetracking.o \
c_code/2_1/stdlib_cookies.o \
c_code/2_1/compiler_vmgen.o \
c_code/2_1/compiler_vmdeps.o \
c_code/2_1/compiler_vmmarshal.o \
c_code/2_1/compiler_locals.o \
c_code/2_1/compiler_itersgen.o \
c_code/2_1/compiler_cgendata.o \
c_code/2_1/compiler_ccgmerge.o \
c_code/2_1/compiler_sighashes.o \
c_code/2_1/stdlib_md5.o \
c_code/2_1/stdlib_dynlib.o \
c_code/2_1/stdlib_net.o \
c_code/2_1/stdlib_nativesockets.o \
c_code/2_1/compiler_nodejs.o \
c_code/2_1/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  powerpc64el)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nim.c -o c_code/2_2/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_system.c -o c_code/2_3/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_commands.c -o c_code/2_2/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_os.c -o c_code/2_2/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.c -o c_code/2_2/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.c -o c_code/2_2/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.c -o c_code/2_2/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_algorithm.c -o c_code/2_2/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_times.c -o c_code/2_2/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_posix.c -o c_code/2_2/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_msgs.c -o c_code/2_2/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_options.c -o c_code/2_2/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_tables.c -o c_code/2_2/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ropes.c -o c_code/2_2/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/compiler_platform.c -o c_code/2_9/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.c -o c_code/2_2/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_macros.c -o c_code/2_2/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lists.c -o c_code/2_2/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strtabs.c -o c_code/2_2/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_osproc.c -o c_code/2_2/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sets.c -o c_code/2_2/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_hashes.c -o c_code/2_2/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_etcpriv.c -o c_code/2_2/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_streams.c -o c_code/2_2/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cpuinfo.c -o c_code/2_2/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_linux.c -o c_code/2_2/stdlib_linux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_termios.c -o c_code/2_2/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nversion.c -o c_code/2_2/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_condsyms.c -o c_code/2_2/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_idents.c -o c_code/2_2/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_wordrecg.c -o c_code/2_2/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_extccomp.c -o c_code/2_2/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_securehash.c -o c_code/2_2/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_json.c -o c_code/2_2/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.c -o c_code/2_2/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.c -o c_code/2_2/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimblecmd.c -o c_code/2_2/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.c -o c_code/2_2/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lexer.c -o c_code/2_2/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimlexbase.c -o c_code/2_2/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_llstream.c -o c_code/2_2/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimconf.c -o c_code/2_2/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_main.c -o c_code/2_2/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ast.c -o c_code/2_2/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_astalgo.c -o c_code/2_2/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_syntaxes.c -o c_code/2_2/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_renderer.c -o c_code/2_2/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodread.c -o c_code/2_2/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodwrite.c -o c_code/2_2/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sem.c -o c_code/2_2/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semdata.c -o c_code/2_2/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_passes.c -o c_code/2_2/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_docgen.c -o c_code/2_2/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgen.c -o c_code/2_2/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_jsgen.c -o c_code/2_2/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_importer.c -o c_code/2_2/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_passaux.c -o c_code/2_2/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_depends.c -o c_code/2_2/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vm.c -o c_code/2_2/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmdef.c -o c_code/2_2/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_types.c -o c_code/2_2/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_idgen.c -o c_code/2_2/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_docgen2.c -o c_code/2_2/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_service.c -o c_code/2_2/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_parser.c -o c_code/2_2/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_modules.c -o c_code/2_2/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ccgutils.c -o c_code/2_2/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sigmatch.c -o c_code/2_2/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_modulegraphs.c -o c_code/2_2/compiler_modulegraphs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_intsets.c -o c_code/2_2/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodutils.c -o c_code/2_2/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pbraces.c -o c_code/2_2/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_filters.c -o c_code/2_2/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_filter_tmpl.c -o c_code/2_2/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_memfiles.c -o c_code/2_2/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_trees.c -o c_code/2_2/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_magicsys.c -o c_code/2_2/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimsets.c -o c_code/2_2/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_bitsets.c -o c_code/2_2/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lookups.c -o c_code/2_2/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_prettybase.c -o c_code/2_2/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_treetab.c -o c_code/2_2/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semfold.c -o c_code/2_2/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_procfind.c -o c_code/2_2/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pragmas.c -o c_code/2_2/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semtypinst.c -o c_code/2_2/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_transf.c -o c_code/2_2/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_aliases.c -o c_code/2_2/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgmeth.c -o c_code/2_2/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lambdalifting.c -o c_code/2_2/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_evaltempl.c -o c_code/2_2/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_patterns.c -o c_code/2_2/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_parampatterns.c -o c_code/2_2/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sempass2.c -o c_code/2_2/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pretty.c -o c_code/2_2/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semmacrosanity.c -o c_code/2_2/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semparallel.c -o c_code/2_2/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lowerings.c -o c_code/2_2/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pluginsupport.c -o c_code/2_2/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_active.c -o c_code/2_2/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_saturate.c -o c_code/2_2/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rstast.c -o c_code/2_2/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rst.c -o c_code/2_2/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rstgen.c -o c_code/2_2/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_highlite.c -o c_code/2_2/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_xmltree.c -o c_code/2_2/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cgi.c -o c_code/2_2/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_typesrenderer.c -o c_code/2_2/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sequtils.c -o c_code/2_2/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_guards.c -o c_code/2_2/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_writetracking.c -o c_code/2_2/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cookies.c -o c_code/2_2/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmgen.c -o c_code/2_2/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmdeps.c -o c_code/2_2/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmmarshal.c -o c_code/2_2/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_locals.c -o c_code/2_2/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_itersgen.c -o c_code/2_2/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgendata.c -o c_code/2_2/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ccgmerge.c -o c_code/2_2/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sighashes.c -o c_code/2_2/compiler_sighashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_md5.c -o c_code/2_2/stdlib_md5.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.c -o c_code/2_2/stdlib_dynlib.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_net.c -o c_code/2_2/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_nativesockets.c -o c_code/2_2/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nodejs.c -o c_code/2_2/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_scriptconfig.c -o c_code/2_2/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/2_2/compiler_nim.o \
c_code/2_3/stdlib_system.o \
c_code/2_2/compiler_commands.o \
c_code/2_2/stdlib_os.o \
c_code/2_2/stdlib_strutils.o \
c_code/2_2/stdlib_parseutils.o \
c_code/2_2/stdlib_math.o \
c_code/2_2/stdlib_algorithm.o \
c_code/2_2/stdlib_times.o \
c_code/2_2/stdlib_posix.o \
c_code/2_2/compiler_msgs.o \
c_code/2_2/compiler_options.o \
c_code/2_2/stdlib_tables.o \
c_code/2_2/compiler_ropes.o \
c_code/2_9/compiler_platform.o \
c_code/2_2/stdlib_terminal.o \
c_code/2_2/stdlib_macros.o \
c_code/2_2/compiler_lists.o \
c_code/2_2/stdlib_strtabs.o \
c_code/2_2/stdlib_osproc.o \
c_code/2_2/stdlib_sets.o \
c_code/2_2/stdlib_hashes.o \
c_code/2_2/stdlib_etcpriv.o \
c_code/2_2/stdlib_streams.o \
c_code/2_2/stdlib_cpuinfo.o \
c_code/2_2/stdlib_linux.o \
c_code/2_2/stdlib_termios.o \
c_code/2_2/compiler_nversion.o \
c_code/2_2/compiler_condsyms.o \
c_code/2_2/compiler_idents.o \
c_code/2_2/compiler_wordrecg.o \
c_code/2_2/compiler_extccomp.o \
c_code/2_2/stdlib_securehash.o \
c_code/2_2/stdlib_json.o \
c_code/2_2/stdlib_lexbase.o \
c_code/2_2/stdlib_unicode.o \
c_code/2_2/compiler_nimblecmd.o \
c_code/2_2/stdlib_parseopt.o \
c_code/2_2/compiler_lexer.o \
c_code/2_2/compiler_nimlexbase.o \
c_code/2_2/compiler_llstream.o \
c_code/2_2/compiler_nimconf.o \
c_code/2_2/compiler_main.o \
c_code/2_2/compiler_ast.o \
c_code/2_2/compiler_astalgo.o \
c_code/2_2/compiler_syntaxes.o \
c_code/2_2/compiler_renderer.o \
c_code/2_2/compiler_rodread.o \
c_code/2_2/compiler_rodwrite.o \
c_code/2_2/compiler_sem.o \
c_code/2_2/compiler_semdata.o \
c_code/2_2/compiler_passes.o \
c_code/2_2/compiler_docgen.o \
c_code/2_2/compiler_cgen.o \
c_code/2_2/compiler_jsgen.o \
c_code/2_2/compiler_importer.o \
c_code/2_2/compiler_passaux.o \
c_code/2_2/compiler_depends.o \
c_code/2_2/compiler_vm.o \
c_code/2_2/compiler_vmdef.o \
c_code/2_2/compiler_types.o \
c_code/2_2/compiler_idgen.o \
c_code/2_2/compiler_docgen2.o \
c_code/2_2/compiler_service.o \
c_code/2_2/compiler_parser.o \
c_code/2_2/compiler_modules.o \
c_code/2_2/compiler_ccgutils.o \
c_code/2_2/compiler_sigmatch.o \
c_code/2_2/compiler_modulegraphs.o \
c_code/2_2/stdlib_intsets.o \
c_code/2_2/compiler_rodutils.o \
c_code/2_2/compiler_pbraces.o \
c_code/2_2/compiler_filters.o \
c_code/2_2/compiler_filter_tmpl.o \
c_code/2_2/stdlib_memfiles.o \
c_code/2_2/compiler_trees.o \
c_code/2_2/compiler_magicsys.o \
c_code/2_2/compiler_nimsets.o \
c_code/2_2/compiler_bitsets.o \
c_code/2_2/compiler_lookups.o \
c_code/2_2/compiler_prettybase.o \
c_code/2_2/compiler_treetab.o \
c_code/2_2/compiler_semfold.o \
c_code/2_2/compiler_procfind.o \
c_code/2_2/compiler_pragmas.o \
c_code/2_2/compiler_semtypinst.o \
c_code/2_2/compiler_transf.o \
c_code/2_2/compiler_aliases.o \
c_code/2_2/compiler_cgmeth.o \
c_code/2_2/compiler_lambdalifting.o \
c_code/2_2/compiler_evaltempl.o \
c_code/2_2/compiler_patterns.o \
c_code/2_2/compiler_parampatterns.o \
c_code/2_2/compiler_sempass2.o \
c_code/2_2/compiler_pretty.o \
c_code/2_2/compiler_semmacrosanity.o \
c_code/2_2/compiler_semparallel.o \
c_code/2_2/compiler_lowerings.o \
c_code/2_2/compiler_pluginsupport.o \
c_code/2_2/compiler_active.o \
c_code/2_2/compiler_saturate.o \
c_code/2_2/docutils_rstast.o \
c_code/2_2/docutils_rst.o \
c_code/2_2/docutils_rstgen.o \
c_code/2_2/docutils_highlite.o \
c_code/2_2/stdlib_xmltree.o \
c_code/2_2/stdlib_cgi.o \
c_code/2_2/compiler_typesrenderer.o \
c_code/2_2/stdlib_sequtils.o \
c_code/2_2/compiler_guards.o \
c_code/2_2/compiler_writetracking.o \
c_code/2_2/stdlib_cookies.o \
c_code/2_2/compiler_vmgen.o \
c_code/2_2/compiler_vmdeps.o \
c_code/2_2/compiler_vmmarshal.o \
c_code/2_2/compiler_locals.o \
c_code/2_2/compiler_itersgen.o \
c_code/2_2/compiler_cgendata.o \
c_code/2_2/compiler_ccgmerge.o \
c_code/2_2/compiler_sighashes.o \
c_code/2_2/stdlib_md5.o \
c_code/2_2/stdlib_dynlib.o \
c_code/2_2/stdlib_net.o \
c_code/2_2/stdlib_nativesockets.o \
c_code/2_2/compiler_nodejs.o \
c_code/2_2/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  arm64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nim.c -o c_code/2_2/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_system.c -o c_code/2_3/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_commands.c -o c_code/2_2/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_os.c -o c_code/2_2/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.c -o c_code/2_2/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.c -o c_code/2_2/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.c -o c_code/2_2/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_algorithm.c -o c_code/2_2/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_times.c -o c_code/2_2/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_posix.c -o c_code/2_2/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_msgs.c -o c_code/2_2/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_options.c -o c_code/2_2/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_tables.c -o c_code/2_2/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ropes.c -o c_code/2_2/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/compiler_platform.c -o c_code/2_10/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.c -o c_code/2_2/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_macros.c -o c_code/2_2/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lists.c -o c_code/2_2/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strtabs.c -o c_code/2_2/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_osproc.c -o c_code/2_2/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sets.c -o c_code/2_2/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_hashes.c -o c_code/2_2/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_etcpriv.c -o c_code/2_2/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_streams.c -o c_code/2_2/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cpuinfo.c -o c_code/2_2/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_linux.c -o c_code/2_2/stdlib_linux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_termios.c -o c_code/2_2/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nversion.c -o c_code/2_2/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_condsyms.c -o c_code/2_2/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_idents.c -o c_code/2_2/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_wordrecg.c -o c_code/2_2/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_extccomp.c -o c_code/2_2/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_securehash.c -o c_code/2_2/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_json.c -o c_code/2_2/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.c -o c_code/2_2/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.c -o c_code/2_2/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimblecmd.c -o c_code/2_2/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.c -o c_code/2_2/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lexer.c -o c_code/2_2/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimlexbase.c -o c_code/2_2/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_llstream.c -o c_code/2_2/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimconf.c -o c_code/2_2/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_main.c -o c_code/2_2/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ast.c -o c_code/2_2/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_astalgo.c -o c_code/2_2/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_syntaxes.c -o c_code/2_2/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_renderer.c -o c_code/2_2/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodread.c -o c_code/2_2/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodwrite.c -o c_code/2_2/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sem.c -o c_code/2_2/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semdata.c -o c_code/2_2/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_passes.c -o c_code/2_2/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_docgen.c -o c_code/2_2/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgen.c -o c_code/2_2/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_jsgen.c -o c_code/2_2/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_importer.c -o c_code/2_2/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_passaux.c -o c_code/2_2/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_depends.c -o c_code/2_2/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vm.c -o c_code/2_2/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmdef.c -o c_code/2_2/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_types.c -o c_code/2_2/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_idgen.c -o c_code/2_2/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_docgen2.c -o c_code/2_2/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_service.c -o c_code/2_2/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_parser.c -o c_code/2_2/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_modules.c -o c_code/2_2/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ccgutils.c -o c_code/2_2/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sigmatch.c -o c_code/2_2/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_modulegraphs.c -o c_code/2_2/compiler_modulegraphs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_intsets.c -o c_code/2_2/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodutils.c -o c_code/2_2/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pbraces.c -o c_code/2_2/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_filters.c -o c_code/2_2/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_filter_tmpl.c -o c_code/2_2/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_memfiles.c -o c_code/2_2/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_trees.c -o c_code/2_2/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_magicsys.c -o c_code/2_2/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimsets.c -o c_code/2_2/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_bitsets.c -o c_code/2_2/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lookups.c -o c_code/2_2/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_prettybase.c -o c_code/2_2/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_treetab.c -o c_code/2_2/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semfold.c -o c_code/2_2/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_procfind.c -o c_code/2_2/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pragmas.c -o c_code/2_2/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semtypinst.c -o c_code/2_2/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_transf.c -o c_code/2_2/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_aliases.c -o c_code/2_2/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgmeth.c -o c_code/2_2/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lambdalifting.c -o c_code/2_2/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_evaltempl.c -o c_code/2_2/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_patterns.c -o c_code/2_2/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_parampatterns.c -o c_code/2_2/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sempass2.c -o c_code/2_2/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pretty.c -o c_code/2_2/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semmacrosanity.c -o c_code/2_2/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semparallel.c -o c_code/2_2/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lowerings.c -o c_code/2_2/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pluginsupport.c -o c_code/2_2/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_active.c -o c_code/2_2/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_saturate.c -o c_code/2_2/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rstast.c -o c_code/2_2/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rst.c -o c_code/2_2/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rstgen.c -o c_code/2_2/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_highlite.c -o c_code/2_2/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_xmltree.c -o c_code/2_2/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cgi.c -o c_code/2_2/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_typesrenderer.c -o c_code/2_2/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sequtils.c -o c_code/2_2/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_guards.c -o c_code/2_2/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_writetracking.c -o c_code/2_2/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cookies.c -o c_code/2_2/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmgen.c -o c_code/2_2/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmdeps.c -o c_code/2_2/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmmarshal.c -o c_code/2_2/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_locals.c -o c_code/2_2/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_itersgen.c -o c_code/2_2/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgendata.c -o c_code/2_2/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ccgmerge.c -o c_code/2_2/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sighashes.c -o c_code/2_2/compiler_sighashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_md5.c -o c_code/2_2/stdlib_md5.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.c -o c_code/2_2/stdlib_dynlib.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_net.c -o c_code/2_2/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_nativesockets.c -o c_code/2_2/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nodejs.c -o c_code/2_2/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_scriptconfig.c -o c_code/2_2/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/2_2/compiler_nim.o \
c_code/2_3/stdlib_system.o \
c_code/2_2/compiler_commands.o \
c_code/2_2/stdlib_os.o \
c_code/2_2/stdlib_strutils.o \
c_code/2_2/stdlib_parseutils.o \
c_code/2_2/stdlib_math.o \
c_code/2_2/stdlib_algorithm.o \
c_code/2_2/stdlib_times.o \
c_code/2_2/stdlib_posix.o \
c_code/2_2/compiler_msgs.o \
c_code/2_2/compiler_options.o \
c_code/2_2/stdlib_tables.o \
c_code/2_2/compiler_ropes.o \
c_code/2_10/compiler_platform.o \
c_code/2_2/stdlib_terminal.o \
c_code/2_2/stdlib_macros.o \
c_code/2_2/compiler_lists.o \
c_code/2_2/stdlib_strtabs.o \
c_code/2_2/stdlib_osproc.o \
c_code/2_2/stdlib_sets.o \
c_code/2_2/stdlib_hashes.o \
c_code/2_2/stdlib_etcpriv.o \
c_code/2_2/stdlib_streams.o \
c_code/2_2/stdlib_cpuinfo.o \
c_code/2_2/stdlib_linux.o \
c_code/2_2/stdlib_termios.o \
c_code/2_2/compiler_nversion.o \
c_code/2_2/compiler_condsyms.o \
c_code/2_2/compiler_idents.o \
c_code/2_2/compiler_wordrecg.o \
c_code/2_2/compiler_extccomp.o \
c_code/2_2/stdlib_securehash.o \
c_code/2_2/stdlib_json.o \
c_code/2_2/stdlib_lexbase.o \
c_code/2_2/stdlib_unicode.o \
c_code/2_2/compiler_nimblecmd.o \
c_code/2_2/stdlib_parseopt.o \
c_code/2_2/compiler_lexer.o \
c_code/2_2/compiler_nimlexbase.o \
c_code/2_2/compiler_llstream.o \
c_code/2_2/compiler_nimconf.o \
c_code/2_2/compiler_main.o \
c_code/2_2/compiler_ast.o \
c_code/2_2/compiler_astalgo.o \
c_code/2_2/compiler_syntaxes.o \
c_code/2_2/compiler_renderer.o \
c_code/2_2/compiler_rodread.o \
c_code/2_2/compiler_rodwrite.o \
c_code/2_2/compiler_sem.o \
c_code/2_2/compiler_semdata.o \
c_code/2_2/compiler_passes.o \
c_code/2_2/compiler_docgen.o \
c_code/2_2/compiler_cgen.o \
c_code/2_2/compiler_jsgen.o \
c_code/2_2/compiler_importer.o \
c_code/2_2/compiler_passaux.o \
c_code/2_2/compiler_depends.o \
c_code/2_2/compiler_vm.o \
c_code/2_2/compiler_vmdef.o \
c_code/2_2/compiler_types.o \
c_code/2_2/compiler_idgen.o \
c_code/2_2/compiler_docgen2.o \
c_code/2_2/compiler_service.o \
c_code/2_2/compiler_parser.o \
c_code/2_2/compiler_modules.o \
c_code/2_2/compiler_ccgutils.o \
c_code/2_2/compiler_sigmatch.o \
c_code/2_2/compiler_modulegraphs.o \
c_code/2_2/stdlib_intsets.o \
c_code/2_2/compiler_rodutils.o \
c_code/2_2/compiler_pbraces.o \
c_code/2_2/compiler_filters.o \
c_code/2_2/compiler_filter_tmpl.o \
c_code/2_2/stdlib_memfiles.o \
c_code/2_2/compiler_trees.o \
c_code/2_2/compiler_magicsys.o \
c_code/2_2/compiler_nimsets.o \
c_code/2_2/compiler_bitsets.o \
c_code/2_2/compiler_lookups.o \
c_code/2_2/compiler_prettybase.o \
c_code/2_2/compiler_treetab.o \
c_code/2_2/compiler_semfold.o \
c_code/2_2/compiler_procfind.o \
c_code/2_2/compiler_pragmas.o \
c_code/2_2/compiler_semtypinst.o \
c_code/2_2/compiler_transf.o \
c_code/2_2/compiler_aliases.o \
c_code/2_2/compiler_cgmeth.o \
c_code/2_2/compiler_lambdalifting.o \
c_code/2_2/compiler_evaltempl.o \
c_code/2_2/compiler_patterns.o \
c_code/2_2/compiler_parampatterns.o \
c_code/2_2/compiler_sempass2.o \
c_code/2_2/compiler_pretty.o \
c_code/2_2/compiler_semmacrosanity.o \
c_code/2_2/compiler_semparallel.o \
c_code/2_2/compiler_lowerings.o \
c_code/2_2/compiler_pluginsupport.o \
c_code/2_2/compiler_active.o \
c_code/2_2/compiler_saturate.o \
c_code/2_2/docutils_rstast.o \
c_code/2_2/docutils_rst.o \
c_code/2_2/docutils_rstgen.o \
c_code/2_2/docutils_highlite.o \
c_code/2_2/stdlib_xmltree.o \
c_code/2_2/stdlib_cgi.o \
c_code/2_2/compiler_typesrenderer.o \
c_code/2_2/stdlib_sequtils.o \
c_code/2_2/compiler_guards.o \
c_code/2_2/compiler_writetracking.o \
c_code/2_2/stdlib_cookies.o \
c_code/2_2/compiler_vmgen.o \
c_code/2_2/compiler_vmdeps.o \
c_code/2_2/compiler_vmmarshal.o \
c_code/2_2/compiler_locals.o \
c_code/2_2/compiler_itersgen.o \
c_code/2_2/compiler_cgendata.o \
c_code/2_2/compiler_ccgmerge.o \
c_code/2_2/compiler_sighashes.o \
c_code/2_2/stdlib_md5.o \
c_code/2_2/stdlib_dynlib.o \
c_code/2_2/stdlib_net.o \
c_code/2_2/stdlib_nativesockets.o \
c_code/2_2/compiler_nodejs.o \
c_code/2_2/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  sparc64)
    set -x
    $LINKER -o $binDir/nim  $LINK_FLAGS
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
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_commands.c -o c_code/3_1/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_os.c -o c_code/3_1/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_strutils.c -o c_code/3_1/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.c -o c_code/2_1/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.c -o c_code/2_1/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_algorithm.c -o c_code/2_1/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_times.c -o c_code/3_1/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_posix.c -o c_code/3_1/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_msgs.c -o c_code/3_1/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_options.c -o c_code/3_1/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_tables.c -o c_code/2_1/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ropes.c -o c_code/2_1/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_platform.c -o c_code/3_1/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.c -o c_code/2_1/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_macros.c -o c_code/2_1/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lists.c -o c_code/2_1/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strtabs.c -o c_code/2_1/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_osproc.c -o c_code/3_1/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sets.c -o c_code/2_1/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_hashes.c -o c_code/2_1/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_etcpriv.c -o c_code/2_1/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_streams.c -o c_code/3_1/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_cpuinfo.c -o c_code/3_1/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_kqueue.c -o c_code/3_1/stdlib_kqueue.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_termios.c -o c_code/2_1/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nversion.c -o c_code/2_1/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_condsyms.c -o c_code/2_1/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idents.c -o c_code/2_1/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_wordrecg.c -o c_code/2_1/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_extccomp.c -o c_code/3_1/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_securehash.c -o c_code/2_1/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_json.c -o c_code/2_1/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.c -o c_code/2_1/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.c -o c_code/2_1/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_nimblecmd.c -o c_code/3_1/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.c -o c_code/2_1/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_lexer.c -o c_code/3_1/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimlexbase.c -o c_code/2_1/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_llstream.c -o c_code/2_1/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimconf.c -o c_code/2_1/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_main.c -o c_code/2_1/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ast.c -o c_code/2_1/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_astalgo.c -o c_code/2_1/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_syntaxes.c -o c_code/2_1/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_renderer.c -o c_code/2_1/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_rodread.c -o c_code/3_1/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodwrite.c -o c_code/2_1/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_sem.c -o c_code/3_1/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semdata.c -o c_code/2_1/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passes.c -o c_code/2_1/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_docgen.c -o c_code/2_1/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgen.c -o c_code/2_1/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_jsgen.c -o c_code/2_1/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_importer.c -o c_code/3_1/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passaux.c -o c_code/2_1/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_depends.c -o c_code/2_1/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_vm.c -o c_code/3_1/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmdef.c -o c_code/2_1/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_types.c -o c_code/2_1/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idgen.c -o c_code/2_1/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_docgen2.c -o c_code/3_1/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_service.c -o c_code/2_1/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parser.c -o c_code/2_1/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_modules.c -o c_code/2_1/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgutils.c -o c_code/2_1/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_sigmatch.c -o c_code/3_1/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_modulegraphs.c -o c_code/2_1/compiler_modulegraphs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_intsets.c -o c_code/2_1/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodutils.c -o c_code/2_1/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pbraces.c -o c_code/2_1/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filters.c -o c_code/2_1/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filter_tmpl.c -o c_code/2_1/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_memfiles.c -o c_code/3_1/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_trees.c -o c_code/2_1/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_magicsys.c -o c_code/2_1/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimsets.c -o c_code/2_1/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_bitsets.c -o c_code/2_1/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lookups.c -o c_code/2_1/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_prettybase.c -o c_code/3_1/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_treetab.c -o c_code/2_1/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_semfold.c -o c_code/3_1/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_procfind.c -o c_code/2_1/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_pragmas.c -o c_code/3_1/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semtypinst.c -o c_code/2_1/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_transf.c -o c_code/2_1/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_aliases.c -o c_code/2_1/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgmeth.c -o c_code/2_1/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lambdalifting.c -o c_code/2_1/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_evaltempl.c -o c_code/2_1/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_patterns.c -o c_code/3_1/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parampatterns.c -o c_code/2_1/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sempass2.c -o c_code/2_1/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pretty.c -o c_code/2_1/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semmacrosanity.c -o c_code/2_1/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semparallel.c -o c_code/2_1/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lowerings.c -o c_code/2_1/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pluginsupport.c -o c_code/2_1/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_active.c -o c_code/2_1/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_saturate.c -o c_code/2_1/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rstast.c -o c_code/2_1/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rst.c -o c_code/2_1/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/docutils_rstgen.c -o c_code/3_1/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_highlite.c -o c_code/2_1/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_xmltree.c -o c_code/2_1/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cgi.c -o c_code/2_1/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_typesrenderer.c -o c_code/2_1/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sequtils.c -o c_code/2_1/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_guards.c -o c_code/2_1/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_writetracking.c -o c_code/2_1/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cookies.c -o c_code/2_1/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmgen.c -o c_code/2_1/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_vmdeps.c -o c_code/3_1/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmmarshal.c -o c_code/2_1/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_locals.c -o c_code/2_1/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_itersgen.c -o c_code/2_1/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgendata.c -o c_code/2_1/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgmerge.c -o c_code/2_1/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sighashes.c -o c_code/2_1/compiler_sighashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_md5.c -o c_code/2_1/stdlib_md5.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.c -o c_code/2_1/stdlib_dynlib.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_net.c -o c_code/2_1/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_nativesockets.c -o c_code/2_1/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nodejs.c -o c_code/2_1/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_scriptconfig.c -o c_code/3_1/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/3_1/compiler_nim.o \
c_code/3_1/stdlib_system.o \
c_code/3_1/compiler_commands.o \
c_code/3_1/stdlib_os.o \
c_code/3_1/stdlib_strutils.o \
c_code/2_1/stdlib_parseutils.o \
c_code/2_1/stdlib_math.o \
c_code/2_1/stdlib_algorithm.o \
c_code/3_1/stdlib_times.o \
c_code/3_1/stdlib_posix.o \
c_code/3_1/compiler_msgs.o \
c_code/3_1/compiler_options.o \
c_code/2_1/stdlib_tables.o \
c_code/2_1/compiler_ropes.o \
c_code/3_1/compiler_platform.o \
c_code/2_1/stdlib_terminal.o \
c_code/2_1/stdlib_macros.o \
c_code/2_1/compiler_lists.o \
c_code/2_1/stdlib_strtabs.o \
c_code/3_1/stdlib_osproc.o \
c_code/2_1/stdlib_sets.o \
c_code/2_1/stdlib_hashes.o \
c_code/2_1/stdlib_etcpriv.o \
c_code/3_1/stdlib_streams.o \
c_code/3_1/stdlib_cpuinfo.o \
c_code/3_1/stdlib_kqueue.o \
c_code/2_1/stdlib_termios.o \
c_code/2_1/compiler_nversion.o \
c_code/2_1/compiler_condsyms.o \
c_code/2_1/compiler_idents.o \
c_code/2_1/compiler_wordrecg.o \
c_code/3_1/compiler_extccomp.o \
c_code/2_1/stdlib_securehash.o \
c_code/2_1/stdlib_json.o \
c_code/2_1/stdlib_lexbase.o \
c_code/2_1/stdlib_unicode.o \
c_code/3_1/compiler_nimblecmd.o \
c_code/2_1/stdlib_parseopt.o \
c_code/3_1/compiler_lexer.o \
c_code/2_1/compiler_nimlexbase.o \
c_code/2_1/compiler_llstream.o \
c_code/2_1/compiler_nimconf.o \
c_code/2_1/compiler_main.o \
c_code/2_1/compiler_ast.o \
c_code/2_1/compiler_astalgo.o \
c_code/2_1/compiler_syntaxes.o \
c_code/2_1/compiler_renderer.o \
c_code/3_1/compiler_rodread.o \
c_code/2_1/compiler_rodwrite.o \
c_code/3_1/compiler_sem.o \
c_code/2_1/compiler_semdata.o \
c_code/2_1/compiler_passes.o \
c_code/2_1/compiler_docgen.o \
c_code/2_1/compiler_cgen.o \
c_code/2_1/compiler_jsgen.o \
c_code/3_1/compiler_importer.o \
c_code/2_1/compiler_passaux.o \
c_code/2_1/compiler_depends.o \
c_code/3_1/compiler_vm.o \
c_code/2_1/compiler_vmdef.o \
c_code/2_1/compiler_types.o \
c_code/2_1/compiler_idgen.o \
c_code/3_1/compiler_docgen2.o \
c_code/2_1/compiler_service.o \
c_code/2_1/compiler_parser.o \
c_code/2_1/compiler_modules.o \
c_code/2_1/compiler_ccgutils.o \
c_code/3_1/compiler_sigmatch.o \
c_code/2_1/compiler_modulegraphs.o \
c_code/2_1/stdlib_intsets.o \
c_code/2_1/compiler_rodutils.o \
c_code/2_1/compiler_pbraces.o \
c_code/2_1/compiler_filters.o \
c_code/2_1/compiler_filter_tmpl.o \
c_code/3_1/stdlib_memfiles.o \
c_code/2_1/compiler_trees.o \
c_code/2_1/compiler_magicsys.o \
c_code/2_1/compiler_nimsets.o \
c_code/2_1/compiler_bitsets.o \
c_code/2_1/compiler_lookups.o \
c_code/3_1/compiler_prettybase.o \
c_code/2_1/compiler_treetab.o \
c_code/3_1/compiler_semfold.o \
c_code/2_1/compiler_procfind.o \
c_code/3_1/compiler_pragmas.o \
c_code/2_1/compiler_semtypinst.o \
c_code/2_1/compiler_transf.o \
c_code/2_1/compiler_aliases.o \
c_code/2_1/compiler_cgmeth.o \
c_code/2_1/compiler_lambdalifting.o \
c_code/2_1/compiler_evaltempl.o \
c_code/3_1/compiler_patterns.o \
c_code/2_1/compiler_parampatterns.o \
c_code/2_1/compiler_sempass2.o \
c_code/2_1/compiler_pretty.o \
c_code/2_1/compiler_semmacrosanity.o \
c_code/2_1/compiler_semparallel.o \
c_code/2_1/compiler_lowerings.o \
c_code/2_1/compiler_pluginsupport.o \
c_code/2_1/compiler_active.o \
c_code/2_1/compiler_saturate.o \
c_code/2_1/docutils_rstast.o \
c_code/2_1/docutils_rst.o \
c_code/3_1/docutils_rstgen.o \
c_code/2_1/docutils_highlite.o \
c_code/2_1/stdlib_xmltree.o \
c_code/2_1/stdlib_cgi.o \
c_code/2_1/compiler_typesrenderer.o \
c_code/2_1/stdlib_sequtils.o \
c_code/2_1/compiler_guards.o \
c_code/2_1/compiler_writetracking.o \
c_code/2_1/stdlib_cookies.o \
c_code/2_1/compiler_vmgen.o \
c_code/3_1/compiler_vmdeps.o \
c_code/2_1/compiler_vmmarshal.o \
c_code/2_1/compiler_locals.o \
c_code/2_1/compiler_itersgen.o \
c_code/2_1/compiler_cgendata.o \
c_code/2_1/compiler_ccgmerge.o \
c_code/2_1/compiler_sighashes.o \
c_code/2_1/stdlib_md5.o \
c_code/2_1/stdlib_dynlib.o \
c_code/2_1/stdlib_net.o \
c_code/2_1/stdlib_nativesockets.o \
c_code/2_1/compiler_nodejs.o \
c_code/3_1/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  amd64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_nim.c -o c_code/3_2/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_system.c -o c_code/3_2/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_commands.c -o c_code/3_2/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_os.c -o c_code/3_2/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_strutils.c -o c_code/3_2/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.c -o c_code/2_2/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.c -o c_code/2_2/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_algorithm.c -o c_code/2_2/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_times.c -o c_code/3_2/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_posix.c -o c_code/3_2/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_msgs.c -o c_code/3_2/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_options.c -o c_code/3_2/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_tables.c -o c_code/2_2/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ropes.c -o c_code/2_2/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_platform.c -o c_code/3_2/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.c -o c_code/2_2/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_macros.c -o c_code/2_2/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lists.c -o c_code/2_2/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strtabs.c -o c_code/2_2/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_osproc.c -o c_code/3_2/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sets.c -o c_code/2_2/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_hashes.c -o c_code/2_2/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_etcpriv.c -o c_code/2_2/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_streams.c -o c_code/3_2/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_cpuinfo.c -o c_code/3_2/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_kqueue.c -o c_code/3_2/stdlib_kqueue.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_termios.c -o c_code/2_2/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nversion.c -o c_code/2_2/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_condsyms.c -o c_code/2_2/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_idents.c -o c_code/2_2/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_wordrecg.c -o c_code/2_2/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_extccomp.c -o c_code/3_2/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_securehash.c -o c_code/2_2/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_json.c -o c_code/2_2/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.c -o c_code/2_2/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.c -o c_code/2_2/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_nimblecmd.c -o c_code/3_2/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.c -o c_code/2_2/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_lexer.c -o c_code/3_2/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimlexbase.c -o c_code/2_2/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_llstream.c -o c_code/2_2/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimconf.c -o c_code/2_2/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_main.c -o c_code/2_2/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ast.c -o c_code/2_2/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_astalgo.c -o c_code/2_2/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_syntaxes.c -o c_code/2_2/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_renderer.c -o c_code/2_2/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_rodread.c -o c_code/3_2/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodwrite.c -o c_code/2_2/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_sem.c -o c_code/3_2/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semdata.c -o c_code/2_2/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_passes.c -o c_code/2_2/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_docgen.c -o c_code/2_2/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgen.c -o c_code/2_2/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_jsgen.c -o c_code/2_2/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_importer.c -o c_code/3_2/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_passaux.c -o c_code/2_2/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_depends.c -o c_code/2_2/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_vm.c -o c_code/3_2/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmdef.c -o c_code/2_2/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_types.c -o c_code/2_2/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_idgen.c -o c_code/2_2/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_docgen2.c -o c_code/3_2/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_service.c -o c_code/2_2/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_parser.c -o c_code/2_2/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_modules.c -o c_code/2_2/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ccgutils.c -o c_code/2_2/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_sigmatch.c -o c_code/3_2/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_modulegraphs.c -o c_code/2_2/compiler_modulegraphs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_intsets.c -o c_code/2_2/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodutils.c -o c_code/2_2/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pbraces.c -o c_code/2_2/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_filters.c -o c_code/2_2/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_filter_tmpl.c -o c_code/2_2/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_memfiles.c -o c_code/3_2/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_trees.c -o c_code/2_2/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_magicsys.c -o c_code/2_2/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimsets.c -o c_code/2_2/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_bitsets.c -o c_code/2_2/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lookups.c -o c_code/2_2/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_prettybase.c -o c_code/3_2/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_treetab.c -o c_code/2_2/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_semfold.c -o c_code/3_2/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_procfind.c -o c_code/2_2/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_pragmas.c -o c_code/3_2/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semtypinst.c -o c_code/2_2/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_transf.c -o c_code/2_2/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_aliases.c -o c_code/2_2/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgmeth.c -o c_code/2_2/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lambdalifting.c -o c_code/2_2/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_evaltempl.c -o c_code/2_2/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_patterns.c -o c_code/3_2/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_parampatterns.c -o c_code/2_2/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sempass2.c -o c_code/2_2/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pretty.c -o c_code/2_2/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semmacrosanity.c -o c_code/2_2/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semparallel.c -o c_code/2_2/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lowerings.c -o c_code/2_2/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pluginsupport.c -o c_code/2_2/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_active.c -o c_code/2_2/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_saturate.c -o c_code/2_2/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rstast.c -o c_code/2_2/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rst.c -o c_code/2_2/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/docutils_rstgen.c -o c_code/3_2/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_highlite.c -o c_code/2_2/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_xmltree.c -o c_code/2_2/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cgi.c -o c_code/2_2/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_typesrenderer.c -o c_code/2_2/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sequtils.c -o c_code/2_2/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_guards.c -o c_code/2_2/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_writetracking.c -o c_code/2_2/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cookies.c -o c_code/2_2/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmgen.c -o c_code/2_2/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_vmdeps.c -o c_code/3_2/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmmarshal.c -o c_code/2_2/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_locals.c -o c_code/2_2/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_itersgen.c -o c_code/2_2/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgendata.c -o c_code/2_2/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ccgmerge.c -o c_code/2_2/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sighashes.c -o c_code/2_2/compiler_sighashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_md5.c -o c_code/2_2/stdlib_md5.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.c -o c_code/2_2/stdlib_dynlib.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_net.c -o c_code/2_2/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_nativesockets.c -o c_code/2_2/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nodejs.c -o c_code/2_2/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_scriptconfig.c -o c_code/3_2/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/3_2/compiler_nim.o \
c_code/3_2/stdlib_system.o \
c_code/3_2/compiler_commands.o \
c_code/3_2/stdlib_os.o \
c_code/3_2/stdlib_strutils.o \
c_code/2_2/stdlib_parseutils.o \
c_code/2_2/stdlib_math.o \
c_code/2_2/stdlib_algorithm.o \
c_code/3_2/stdlib_times.o \
c_code/3_2/stdlib_posix.o \
c_code/3_2/compiler_msgs.o \
c_code/3_2/compiler_options.o \
c_code/2_2/stdlib_tables.o \
c_code/2_2/compiler_ropes.o \
c_code/3_2/compiler_platform.o \
c_code/2_2/stdlib_terminal.o \
c_code/2_2/stdlib_macros.o \
c_code/2_2/compiler_lists.o \
c_code/2_2/stdlib_strtabs.o \
c_code/3_2/stdlib_osproc.o \
c_code/2_2/stdlib_sets.o \
c_code/2_2/stdlib_hashes.o \
c_code/2_2/stdlib_etcpriv.o \
c_code/3_2/stdlib_streams.o \
c_code/3_2/stdlib_cpuinfo.o \
c_code/3_2/stdlib_kqueue.o \
c_code/2_2/stdlib_termios.o \
c_code/2_2/compiler_nversion.o \
c_code/2_2/compiler_condsyms.o \
c_code/2_2/compiler_idents.o \
c_code/2_2/compiler_wordrecg.o \
c_code/3_2/compiler_extccomp.o \
c_code/2_2/stdlib_securehash.o \
c_code/2_2/stdlib_json.o \
c_code/2_2/stdlib_lexbase.o \
c_code/2_2/stdlib_unicode.o \
c_code/3_2/compiler_nimblecmd.o \
c_code/2_2/stdlib_parseopt.o \
c_code/3_2/compiler_lexer.o \
c_code/2_2/compiler_nimlexbase.o \
c_code/2_2/compiler_llstream.o \
c_code/2_2/compiler_nimconf.o \
c_code/2_2/compiler_main.o \
c_code/2_2/compiler_ast.o \
c_code/2_2/compiler_astalgo.o \
c_code/2_2/compiler_syntaxes.o \
c_code/2_2/compiler_renderer.o \
c_code/3_2/compiler_rodread.o \
c_code/2_2/compiler_rodwrite.o \
c_code/3_2/compiler_sem.o \
c_code/2_2/compiler_semdata.o \
c_code/2_2/compiler_passes.o \
c_code/2_2/compiler_docgen.o \
c_code/2_2/compiler_cgen.o \
c_code/2_2/compiler_jsgen.o \
c_code/3_2/compiler_importer.o \
c_code/2_2/compiler_passaux.o \
c_code/2_2/compiler_depends.o \
c_code/3_2/compiler_vm.o \
c_code/2_2/compiler_vmdef.o \
c_code/2_2/compiler_types.o \
c_code/2_2/compiler_idgen.o \
c_code/3_2/compiler_docgen2.o \
c_code/2_2/compiler_service.o \
c_code/2_2/compiler_parser.o \
c_code/2_2/compiler_modules.o \
c_code/2_2/compiler_ccgutils.o \
c_code/3_2/compiler_sigmatch.o \
c_code/2_2/compiler_modulegraphs.o \
c_code/2_2/stdlib_intsets.o \
c_code/2_2/compiler_rodutils.o \
c_code/2_2/compiler_pbraces.o \
c_code/2_2/compiler_filters.o \
c_code/2_2/compiler_filter_tmpl.o \
c_code/3_2/stdlib_memfiles.o \
c_code/2_2/compiler_trees.o \
c_code/2_2/compiler_magicsys.o \
c_code/2_2/compiler_nimsets.o \
c_code/2_2/compiler_bitsets.o \
c_code/2_2/compiler_lookups.o \
c_code/3_2/compiler_prettybase.o \
c_code/2_2/compiler_treetab.o \
c_code/3_2/compiler_semfold.o \
c_code/2_2/compiler_procfind.o \
c_code/3_2/compiler_pragmas.o \
c_code/2_2/compiler_semtypinst.o \
c_code/2_2/compiler_transf.o \
c_code/2_2/compiler_aliases.o \
c_code/2_2/compiler_cgmeth.o \
c_code/2_2/compiler_lambdalifting.o \
c_code/2_2/compiler_evaltempl.o \
c_code/3_2/compiler_patterns.o \
c_code/2_2/compiler_parampatterns.o \
c_code/2_2/compiler_sempass2.o \
c_code/2_2/compiler_pretty.o \
c_code/2_2/compiler_semmacrosanity.o \
c_code/2_2/compiler_semparallel.o \
c_code/2_2/compiler_lowerings.o \
c_code/2_2/compiler_pluginsupport.o \
c_code/2_2/compiler_active.o \
c_code/2_2/compiler_saturate.o \
c_code/2_2/docutils_rstast.o \
c_code/2_2/docutils_rst.o \
c_code/3_2/docutils_rstgen.o \
c_code/2_2/docutils_highlite.o \
c_code/2_2/stdlib_xmltree.o \
c_code/2_2/stdlib_cgi.o \
c_code/2_2/compiler_typesrenderer.o \
c_code/2_2/stdlib_sequtils.o \
c_code/2_2/compiler_guards.o \
c_code/2_2/compiler_writetracking.o \
c_code/2_2/stdlib_cookies.o \
c_code/2_2/compiler_vmgen.o \
c_code/3_2/compiler_vmdeps.o \
c_code/2_2/compiler_vmmarshal.o \
c_code/2_2/compiler_locals.o \
c_code/2_2/compiler_itersgen.o \
c_code/2_2/compiler_cgendata.o \
c_code/2_2/compiler_ccgmerge.o \
c_code/2_2/compiler_sighashes.o \
c_code/2_2/stdlib_md5.o \
c_code/2_2/stdlib_dynlib.o \
c_code/2_2/stdlib_net.o \
c_code/2_2/stdlib_nativesockets.o \
c_code/2_2/compiler_nodejs.o \
c_code/3_2/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  powerpc64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_nim.c -o c_code/3_2/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_system.c -o c_code/3_3/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_commands.c -o c_code/3_2/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_os.c -o c_code/3_2/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_strutils.c -o c_code/3_2/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.c -o c_code/2_2/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.c -o c_code/2_2/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_algorithm.c -o c_code/2_2/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_times.c -o c_code/3_2/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_posix.c -o c_code/3_2/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_msgs.c -o c_code/3_2/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_options.c -o c_code/3_2/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_tables.c -o c_code/2_2/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ropes.c -o c_code/2_2/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_platform.c -o c_code/3_3/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.c -o c_code/2_2/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_macros.c -o c_code/2_2/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lists.c -o c_code/2_2/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strtabs.c -o c_code/2_2/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_osproc.c -o c_code/3_2/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sets.c -o c_code/2_2/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_hashes.c -o c_code/2_2/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_etcpriv.c -o c_code/2_2/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_streams.c -o c_code/3_2/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_cpuinfo.c -o c_code/3_2/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_kqueue.c -o c_code/3_2/stdlib_kqueue.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_termios.c -o c_code/2_2/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nversion.c -o c_code/2_2/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_condsyms.c -o c_code/2_2/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_idents.c -o c_code/2_2/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_wordrecg.c -o c_code/2_2/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_extccomp.c -o c_code/3_2/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_securehash.c -o c_code/2_2/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_json.c -o c_code/2_2/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.c -o c_code/2_2/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.c -o c_code/2_2/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_nimblecmd.c -o c_code/3_2/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.c -o c_code/2_2/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_lexer.c -o c_code/3_2/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimlexbase.c -o c_code/2_2/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_llstream.c -o c_code/2_2/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimconf.c -o c_code/2_2/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_main.c -o c_code/2_2/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ast.c -o c_code/2_2/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_astalgo.c -o c_code/2_2/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_syntaxes.c -o c_code/2_2/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_renderer.c -o c_code/2_2/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_rodread.c -o c_code/3_2/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodwrite.c -o c_code/2_2/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_sem.c -o c_code/3_2/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semdata.c -o c_code/2_2/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_passes.c -o c_code/2_2/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_docgen.c -o c_code/2_2/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgen.c -o c_code/2_2/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_jsgen.c -o c_code/2_2/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_importer.c -o c_code/3_2/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_passaux.c -o c_code/2_2/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_depends.c -o c_code/2_2/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/compiler_vm.c -o c_code/3_3/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmdef.c -o c_code/2_2/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_types.c -o c_code/2_2/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_idgen.c -o c_code/2_2/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_docgen2.c -o c_code/3_2/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_service.c -o c_code/2_2/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_parser.c -o c_code/2_2/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_modules.c -o c_code/2_2/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ccgutils.c -o c_code/2_2/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_sigmatch.c -o c_code/3_2/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_modulegraphs.c -o c_code/2_2/compiler_modulegraphs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_intsets.c -o c_code/2_2/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodutils.c -o c_code/2_2/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pbraces.c -o c_code/2_2/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_filters.c -o c_code/2_2/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_filter_tmpl.c -o c_code/2_2/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_memfiles.c -o c_code/3_2/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_trees.c -o c_code/2_2/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_magicsys.c -o c_code/2_2/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimsets.c -o c_code/2_2/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_bitsets.c -o c_code/2_2/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lookups.c -o c_code/2_2/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_prettybase.c -o c_code/3_2/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_treetab.c -o c_code/2_2/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_semfold.c -o c_code/3_2/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_procfind.c -o c_code/2_2/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_pragmas.c -o c_code/3_2/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semtypinst.c -o c_code/2_2/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_transf.c -o c_code/2_2/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_aliases.c -o c_code/2_2/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgmeth.c -o c_code/2_2/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lambdalifting.c -o c_code/2_2/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_evaltempl.c -o c_code/2_2/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_patterns.c -o c_code/3_2/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_parampatterns.c -o c_code/2_2/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sempass2.c -o c_code/2_2/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pretty.c -o c_code/2_2/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semmacrosanity.c -o c_code/2_2/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semparallel.c -o c_code/2_2/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lowerings.c -o c_code/2_2/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pluginsupport.c -o c_code/2_2/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_active.c -o c_code/2_2/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_saturate.c -o c_code/2_2/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rstast.c -o c_code/2_2/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rst.c -o c_code/2_2/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/docutils_rstgen.c -o c_code/3_2/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_highlite.c -o c_code/2_2/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_xmltree.c -o c_code/2_2/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cgi.c -o c_code/2_2/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_typesrenderer.c -o c_code/2_2/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sequtils.c -o c_code/2_2/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_guards.c -o c_code/2_2/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_writetracking.c -o c_code/2_2/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cookies.c -o c_code/2_2/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmgen.c -o c_code/2_2/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_vmdeps.c -o c_code/3_2/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmmarshal.c -o c_code/2_2/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_locals.c -o c_code/2_2/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_itersgen.c -o c_code/2_2/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgendata.c -o c_code/2_2/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ccgmerge.c -o c_code/2_2/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sighashes.c -o c_code/2_2/compiler_sighashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_md5.c -o c_code/2_2/stdlib_md5.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.c -o c_code/2_2/stdlib_dynlib.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_net.c -o c_code/2_2/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_nativesockets.c -o c_code/2_2/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nodejs.c -o c_code/2_2/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_scriptconfig.c -o c_code/3_2/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/3_2/compiler_nim.o \
c_code/3_3/stdlib_system.o \
c_code/3_2/compiler_commands.o \
c_code/3_2/stdlib_os.o \
c_code/3_2/stdlib_strutils.o \
c_code/2_2/stdlib_parseutils.o \
c_code/2_2/stdlib_math.o \
c_code/2_2/stdlib_algorithm.o \
c_code/3_2/stdlib_times.o \
c_code/3_2/stdlib_posix.o \
c_code/3_2/compiler_msgs.o \
c_code/3_2/compiler_options.o \
c_code/2_2/stdlib_tables.o \
c_code/2_2/compiler_ropes.o \
c_code/3_3/compiler_platform.o \
c_code/2_2/stdlib_terminal.o \
c_code/2_2/stdlib_macros.o \
c_code/2_2/compiler_lists.o \
c_code/2_2/stdlib_strtabs.o \
c_code/3_2/stdlib_osproc.o \
c_code/2_2/stdlib_sets.o \
c_code/2_2/stdlib_hashes.o \
c_code/2_2/stdlib_etcpriv.o \
c_code/3_2/stdlib_streams.o \
c_code/3_2/stdlib_cpuinfo.o \
c_code/3_2/stdlib_kqueue.o \
c_code/2_2/stdlib_termios.o \
c_code/2_2/compiler_nversion.o \
c_code/2_2/compiler_condsyms.o \
c_code/2_2/compiler_idents.o \
c_code/2_2/compiler_wordrecg.o \
c_code/3_2/compiler_extccomp.o \
c_code/2_2/stdlib_securehash.o \
c_code/2_2/stdlib_json.o \
c_code/2_2/stdlib_lexbase.o \
c_code/2_2/stdlib_unicode.o \
c_code/3_2/compiler_nimblecmd.o \
c_code/2_2/stdlib_parseopt.o \
c_code/3_2/compiler_lexer.o \
c_code/2_2/compiler_nimlexbase.o \
c_code/2_2/compiler_llstream.o \
c_code/2_2/compiler_nimconf.o \
c_code/2_2/compiler_main.o \
c_code/2_2/compiler_ast.o \
c_code/2_2/compiler_astalgo.o \
c_code/2_2/compiler_syntaxes.o \
c_code/2_2/compiler_renderer.o \
c_code/3_2/compiler_rodread.o \
c_code/2_2/compiler_rodwrite.o \
c_code/3_2/compiler_sem.o \
c_code/2_2/compiler_semdata.o \
c_code/2_2/compiler_passes.o \
c_code/2_2/compiler_docgen.o \
c_code/2_2/compiler_cgen.o \
c_code/2_2/compiler_jsgen.o \
c_code/3_2/compiler_importer.o \
c_code/2_2/compiler_passaux.o \
c_code/2_2/compiler_depends.o \
c_code/3_3/compiler_vm.o \
c_code/2_2/compiler_vmdef.o \
c_code/2_2/compiler_types.o \
c_code/2_2/compiler_idgen.o \
c_code/3_2/compiler_docgen2.o \
c_code/2_2/compiler_service.o \
c_code/2_2/compiler_parser.o \
c_code/2_2/compiler_modules.o \
c_code/2_2/compiler_ccgutils.o \
c_code/3_2/compiler_sigmatch.o \
c_code/2_2/compiler_modulegraphs.o \
c_code/2_2/stdlib_intsets.o \
c_code/2_2/compiler_rodutils.o \
c_code/2_2/compiler_pbraces.o \
c_code/2_2/compiler_filters.o \
c_code/2_2/compiler_filter_tmpl.o \
c_code/3_2/stdlib_memfiles.o \
c_code/2_2/compiler_trees.o \
c_code/2_2/compiler_magicsys.o \
c_code/2_2/compiler_nimsets.o \
c_code/2_2/compiler_bitsets.o \
c_code/2_2/compiler_lookups.o \
c_code/3_2/compiler_prettybase.o \
c_code/2_2/compiler_treetab.o \
c_code/3_2/compiler_semfold.o \
c_code/2_2/compiler_procfind.o \
c_code/3_2/compiler_pragmas.o \
c_code/2_2/compiler_semtypinst.o \
c_code/2_2/compiler_transf.o \
c_code/2_2/compiler_aliases.o \
c_code/2_2/compiler_cgmeth.o \
c_code/2_2/compiler_lambdalifting.o \
c_code/2_2/compiler_evaltempl.o \
c_code/3_2/compiler_patterns.o \
c_code/2_2/compiler_parampatterns.o \
c_code/2_2/compiler_sempass2.o \
c_code/2_2/compiler_pretty.o \
c_code/2_2/compiler_semmacrosanity.o \
c_code/2_2/compiler_semparallel.o \
c_code/2_2/compiler_lowerings.o \
c_code/2_2/compiler_pluginsupport.o \
c_code/2_2/compiler_active.o \
c_code/2_2/compiler_saturate.o \
c_code/2_2/docutils_rstast.o \
c_code/2_2/docutils_rst.o \
c_code/3_2/docutils_rstgen.o \
c_code/2_2/docutils_highlite.o \
c_code/2_2/stdlib_xmltree.o \
c_code/2_2/stdlib_cgi.o \
c_code/2_2/compiler_typesrenderer.o \
c_code/2_2/stdlib_sequtils.o \
c_code/2_2/compiler_guards.o \
c_code/2_2/compiler_writetracking.o \
c_code/2_2/stdlib_cookies.o \
c_code/2_2/compiler_vmgen.o \
c_code/3_2/compiler_vmdeps.o \
c_code/2_2/compiler_vmmarshal.o \
c_code/2_2/compiler_locals.o \
c_code/2_2/compiler_itersgen.o \
c_code/2_2/compiler_cgendata.o \
c_code/2_2/compiler_ccgmerge.o \
c_code/2_2/compiler_sighashes.o \
c_code/2_2/stdlib_md5.o \
c_code/2_2/stdlib_dynlib.o \
c_code/2_2/stdlib_net.o \
c_code/2_2/stdlib_nativesockets.o \
c_code/2_2/compiler_nodejs.o \
c_code/3_2/compiler_scriptconfig.o $LINK_FLAGS
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
  sparc64)
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
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_commands.c -o c_code/3_1/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_os.c -o c_code/4_1/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.c -o c_code/2_1/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.c -o c_code/2_1/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.c -o c_code/2_1/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_algorithm.c -o c_code/2_1/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_times.c -o c_code/2_1/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_posix.c -o c_code/3_1/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_msgs.c -o c_code/3_1/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_options.c -o c_code/3_1/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_tables.c -o c_code/2_1/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ropes.c -o c_code/2_1/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_platform.c -o c_code/4_1/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.c -o c_code/2_1/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_macros.c -o c_code/2_1/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lists.c -o c_code/2_1/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strtabs.c -o c_code/2_1/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_osproc.c -o c_code/4_1/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sets.c -o c_code/2_1/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_hashes.c -o c_code/2_1/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_etcpriv.c -o c_code/2_1/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_streams.c -o c_code/3_1/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cpuinfo.c -o c_code/2_1/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_termios.c -o c_code/2_1/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nversion.c -o c_code/2_1/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_condsyms.c -o c_code/2_1/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idents.c -o c_code/2_1/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_wordrecg.c -o c_code/2_1/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_extccomp.c -o c_code/4_1/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_securehash.c -o c_code/2_1/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_json.c -o c_code/2_1/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.c -o c_code/2_1/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.c -o c_code/2_1/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_nimblecmd.c -o c_code/4_1/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.c -o c_code/2_1/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_lexer.c -o c_code/3_1/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimlexbase.c -o c_code/2_1/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_llstream.c -o c_code/2_1/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimconf.c -o c_code/2_1/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_main.c -o c_code/2_1/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ast.c -o c_code/2_1/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_astalgo.c -o c_code/2_1/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_syntaxes.c -o c_code/2_1/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_renderer.c -o c_code/2_1/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_rodread.c -o c_code/3_1/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodwrite.c -o c_code/2_1/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_sem.c -o c_code/4_1/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semdata.c -o c_code/2_1/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passes.c -o c_code/2_1/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_docgen.c -o c_code/2_1/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgen.c -o c_code/2_1/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_jsgen.c -o c_code/2_1/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_importer.c -o c_code/3_1/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passaux.c -o c_code/2_1/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_depends.c -o c_code/2_1/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_vm.c -o c_code/4_1/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmdef.c -o c_code/2_1/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_types.c -o c_code/2_1/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idgen.c -o c_code/2_1/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_docgen2.c -o c_code/3_1/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_service.c -o c_code/2_1/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parser.c -o c_code/2_1/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_modules.c -o c_code/2_1/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgutils.c -o c_code/2_1/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_sigmatch.c -o c_code/3_1/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_modulegraphs.c -o c_code/2_1/compiler_modulegraphs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_intsets.c -o c_code/2_1/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodutils.c -o c_code/2_1/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pbraces.c -o c_code/2_1/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filters.c -o c_code/2_1/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filter_tmpl.c -o c_code/2_1/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_memfiles.c -o c_code/3_1/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_trees.c -o c_code/2_1/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_magicsys.c -o c_code/2_1/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimsets.c -o c_code/2_1/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_bitsets.c -o c_code/2_1/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lookups.c -o c_code/2_1/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_prettybase.c -o c_code/3_1/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_treetab.c -o c_code/2_1/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_semfold.c -o c_code/3_1/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_procfind.c -o c_code/2_1/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_pragmas.c -o c_code/3_1/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semtypinst.c -o c_code/2_1/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_transf.c -o c_code/2_1/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_aliases.c -o c_code/2_1/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgmeth.c -o c_code/2_1/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lambdalifting.c -o c_code/2_1/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_evaltempl.c -o c_code/2_1/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_patterns.c -o c_code/4_1/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parampatterns.c -o c_code/2_1/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sempass2.c -o c_code/2_1/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pretty.c -o c_code/2_1/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semmacrosanity.c -o c_code/2_1/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semparallel.c -o c_code/2_1/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lowerings.c -o c_code/2_1/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pluginsupport.c -o c_code/2_1/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_active.c -o c_code/2_1/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_saturate.c -o c_code/2_1/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rstast.c -o c_code/2_1/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rst.c -o c_code/2_1/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/docutils_rstgen.c -o c_code/4_1/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_highlite.c -o c_code/2_1/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_xmltree.c -o c_code/2_1/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cgi.c -o c_code/2_1/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_typesrenderer.c -o c_code/2_1/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sequtils.c -o c_code/2_1/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_guards.c -o c_code/2_1/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_writetracking.c -o c_code/2_1/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cookies.c -o c_code/2_1/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmgen.c -o c_code/2_1/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_vmdeps.c -o c_code/3_1/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmmarshal.c -o c_code/2_1/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_locals.c -o c_code/2_1/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_itersgen.c -o c_code/2_1/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgendata.c -o c_code/2_1/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgmerge.c -o c_code/2_1/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sighashes.c -o c_code/2_1/compiler_sighashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_md5.c -o c_code/2_1/stdlib_md5.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.c -o c_code/2_1/stdlib_dynlib.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_net.c -o c_code/2_1/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_nativesockets.c -o c_code/2_1/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nodejs.c -o c_code/2_1/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_scriptconfig.c -o c_code/4_1/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/4_1/compiler_nim.o \
c_code/4_1/stdlib_system.o \
c_code/3_1/compiler_commands.o \
c_code/4_1/stdlib_os.o \
c_code/2_1/stdlib_strutils.o \
c_code/2_1/stdlib_parseutils.o \
c_code/2_1/stdlib_math.o \
c_code/2_1/stdlib_algorithm.o \
c_code/2_1/stdlib_times.o \
c_code/3_1/stdlib_posix.o \
c_code/3_1/compiler_msgs.o \
c_code/3_1/compiler_options.o \
c_code/2_1/stdlib_tables.o \
c_code/2_1/compiler_ropes.o \
c_code/4_1/compiler_platform.o \
c_code/2_1/stdlib_terminal.o \
c_code/2_1/stdlib_macros.o \
c_code/2_1/compiler_lists.o \
c_code/2_1/stdlib_strtabs.o \
c_code/4_1/stdlib_osproc.o \
c_code/2_1/stdlib_sets.o \
c_code/2_1/stdlib_hashes.o \
c_code/2_1/stdlib_etcpriv.o \
c_code/3_1/stdlib_streams.o \
c_code/2_1/stdlib_cpuinfo.o \
c_code/2_1/stdlib_termios.o \
c_code/2_1/compiler_nversion.o \
c_code/2_1/compiler_condsyms.o \
c_code/2_1/compiler_idents.o \
c_code/2_1/compiler_wordrecg.o \
c_code/4_1/compiler_extccomp.o \
c_code/2_1/stdlib_securehash.o \
c_code/2_1/stdlib_json.o \
c_code/2_1/stdlib_lexbase.o \
c_code/2_1/stdlib_unicode.o \
c_code/4_1/compiler_nimblecmd.o \
c_code/2_1/stdlib_parseopt.o \
c_code/3_1/compiler_lexer.o \
c_code/2_1/compiler_nimlexbase.o \
c_code/2_1/compiler_llstream.o \
c_code/2_1/compiler_nimconf.o \
c_code/2_1/compiler_main.o \
c_code/2_1/compiler_ast.o \
c_code/2_1/compiler_astalgo.o \
c_code/2_1/compiler_syntaxes.o \
c_code/2_1/compiler_renderer.o \
c_code/3_1/compiler_rodread.o \
c_code/2_1/compiler_rodwrite.o \
c_code/4_1/compiler_sem.o \
c_code/2_1/compiler_semdata.o \
c_code/2_1/compiler_passes.o \
c_code/2_1/compiler_docgen.o \
c_code/2_1/compiler_cgen.o \
c_code/2_1/compiler_jsgen.o \
c_code/3_1/compiler_importer.o \
c_code/2_1/compiler_passaux.o \
c_code/2_1/compiler_depends.o \
c_code/4_1/compiler_vm.o \
c_code/2_1/compiler_vmdef.o \
c_code/2_1/compiler_types.o \
c_code/2_1/compiler_idgen.o \
c_code/3_1/compiler_docgen2.o \
c_code/2_1/compiler_service.o \
c_code/2_1/compiler_parser.o \
c_code/2_1/compiler_modules.o \
c_code/2_1/compiler_ccgutils.o \
c_code/3_1/compiler_sigmatch.o \
c_code/2_1/compiler_modulegraphs.o \
c_code/2_1/stdlib_intsets.o \
c_code/2_1/compiler_rodutils.o \
c_code/2_1/compiler_pbraces.o \
c_code/2_1/compiler_filters.o \
c_code/2_1/compiler_filter_tmpl.o \
c_code/3_1/stdlib_memfiles.o \
c_code/2_1/compiler_trees.o \
c_code/2_1/compiler_magicsys.o \
c_code/2_1/compiler_nimsets.o \
c_code/2_1/compiler_bitsets.o \
c_code/2_1/compiler_lookups.o \
c_code/3_1/compiler_prettybase.o \
c_code/2_1/compiler_treetab.o \
c_code/3_1/compiler_semfold.o \
c_code/2_1/compiler_procfind.o \
c_code/3_1/compiler_pragmas.o \
c_code/2_1/compiler_semtypinst.o \
c_code/2_1/compiler_transf.o \
c_code/2_1/compiler_aliases.o \
c_code/2_1/compiler_cgmeth.o \
c_code/2_1/compiler_lambdalifting.o \
c_code/2_1/compiler_evaltempl.o \
c_code/4_1/compiler_patterns.o \
c_code/2_1/compiler_parampatterns.o \
c_code/2_1/compiler_sempass2.o \
c_code/2_1/compiler_pretty.o \
c_code/2_1/compiler_semmacrosanity.o \
c_code/2_1/compiler_semparallel.o \
c_code/2_1/compiler_lowerings.o \
c_code/2_1/compiler_pluginsupport.o \
c_code/2_1/compiler_active.o \
c_code/2_1/compiler_saturate.o \
c_code/2_1/docutils_rstast.o \
c_code/2_1/docutils_rst.o \
c_code/4_1/docutils_rstgen.o \
c_code/2_1/docutils_highlite.o \
c_code/2_1/stdlib_xmltree.o \
c_code/2_1/stdlib_cgi.o \
c_code/2_1/compiler_typesrenderer.o \
c_code/2_1/stdlib_sequtils.o \
c_code/2_1/compiler_guards.o \
c_code/2_1/compiler_writetracking.o \
c_code/2_1/stdlib_cookies.o \
c_code/2_1/compiler_vmgen.o \
c_code/3_1/compiler_vmdeps.o \
c_code/2_1/compiler_vmmarshal.o \
c_code/2_1/compiler_locals.o \
c_code/2_1/compiler_itersgen.o \
c_code/2_1/compiler_cgendata.o \
c_code/2_1/compiler_ccgmerge.o \
c_code/2_1/compiler_sighashes.o \
c_code/2_1/stdlib_md5.o \
c_code/2_1/stdlib_dynlib.o \
c_code/2_1/stdlib_net.o \
c_code/2_1/stdlib_nativesockets.o \
c_code/2_1/compiler_nodejs.o \
c_code/4_1/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  amd64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_nim.c -o c_code/4_2/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_system.c -o c_code/4_2/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_commands.c -o c_code/3_2/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_os.c -o c_code/4_2/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.c -o c_code/2_2/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.c -o c_code/2_2/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.c -o c_code/2_2/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_algorithm.c -o c_code/2_2/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_times.c -o c_code/2_2/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_posix.c -o c_code/3_2/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_msgs.c -o c_code/3_2/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_options.c -o c_code/3_2/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_tables.c -o c_code/2_2/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ropes.c -o c_code/2_2/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_platform.c -o c_code/4_2/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.c -o c_code/2_2/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_macros.c -o c_code/2_2/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lists.c -o c_code/2_2/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strtabs.c -o c_code/2_2/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_osproc.c -o c_code/4_2/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sets.c -o c_code/2_2/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_hashes.c -o c_code/2_2/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_etcpriv.c -o c_code/2_2/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_streams.c -o c_code/3_2/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cpuinfo.c -o c_code/2_2/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_termios.c -o c_code/2_2/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nversion.c -o c_code/2_2/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_condsyms.c -o c_code/2_2/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_idents.c -o c_code/2_2/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_wordrecg.c -o c_code/2_2/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_extccomp.c -o c_code/4_2/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_securehash.c -o c_code/2_2/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_json.c -o c_code/2_2/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.c -o c_code/2_2/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.c -o c_code/2_2/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_nimblecmd.c -o c_code/4_2/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.c -o c_code/2_2/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_lexer.c -o c_code/3_2/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimlexbase.c -o c_code/2_2/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_llstream.c -o c_code/2_2/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimconf.c -o c_code/2_2/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_main.c -o c_code/2_2/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ast.c -o c_code/2_2/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_astalgo.c -o c_code/2_2/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_syntaxes.c -o c_code/2_2/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_renderer.c -o c_code/2_2/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_rodread.c -o c_code/3_2/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodwrite.c -o c_code/2_2/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_sem.c -o c_code/4_2/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semdata.c -o c_code/2_2/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_passes.c -o c_code/2_2/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_docgen.c -o c_code/2_2/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgen.c -o c_code/2_2/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_jsgen.c -o c_code/2_2/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_importer.c -o c_code/3_2/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_passaux.c -o c_code/2_2/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_depends.c -o c_code/2_2/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_vm.c -o c_code/4_2/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmdef.c -o c_code/2_2/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_types.c -o c_code/2_2/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_idgen.c -o c_code/2_2/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_docgen2.c -o c_code/3_2/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_service.c -o c_code/2_2/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_parser.c -o c_code/2_2/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_modules.c -o c_code/2_2/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ccgutils.c -o c_code/2_2/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_sigmatch.c -o c_code/3_2/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_modulegraphs.c -o c_code/2_2/compiler_modulegraphs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_intsets.c -o c_code/2_2/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodutils.c -o c_code/2_2/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pbraces.c -o c_code/2_2/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_filters.c -o c_code/2_2/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_filter_tmpl.c -o c_code/2_2/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_memfiles.c -o c_code/3_2/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_trees.c -o c_code/2_2/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_magicsys.c -o c_code/2_2/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimsets.c -o c_code/2_2/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_bitsets.c -o c_code/2_2/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lookups.c -o c_code/2_2/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_prettybase.c -o c_code/3_2/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_treetab.c -o c_code/2_2/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_semfold.c -o c_code/3_2/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_procfind.c -o c_code/2_2/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_pragmas.c -o c_code/3_2/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semtypinst.c -o c_code/2_2/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_transf.c -o c_code/2_2/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_aliases.c -o c_code/2_2/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgmeth.c -o c_code/2_2/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lambdalifting.c -o c_code/2_2/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_evaltempl.c -o c_code/2_2/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_patterns.c -o c_code/4_2/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_parampatterns.c -o c_code/2_2/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sempass2.c -o c_code/2_2/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pretty.c -o c_code/2_2/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semmacrosanity.c -o c_code/2_2/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semparallel.c -o c_code/2_2/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lowerings.c -o c_code/2_2/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pluginsupport.c -o c_code/2_2/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_active.c -o c_code/2_2/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_saturate.c -o c_code/2_2/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rstast.c -o c_code/2_2/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rst.c -o c_code/2_2/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/docutils_rstgen.c -o c_code/4_2/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_highlite.c -o c_code/2_2/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_xmltree.c -o c_code/2_2/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cgi.c -o c_code/2_2/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_typesrenderer.c -o c_code/2_2/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sequtils.c -o c_code/2_2/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_guards.c -o c_code/2_2/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_writetracking.c -o c_code/2_2/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cookies.c -o c_code/2_2/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmgen.c -o c_code/2_2/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_vmdeps.c -o c_code/3_2/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmmarshal.c -o c_code/2_2/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_locals.c -o c_code/2_2/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_itersgen.c -o c_code/2_2/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgendata.c -o c_code/2_2/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ccgmerge.c -o c_code/2_2/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sighashes.c -o c_code/2_2/compiler_sighashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_md5.c -o c_code/2_2/stdlib_md5.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.c -o c_code/2_2/stdlib_dynlib.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_net.c -o c_code/2_2/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_nativesockets.c -o c_code/2_2/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nodejs.c -o c_code/2_2/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_scriptconfig.c -o c_code/4_2/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/4_2/compiler_nim.o \
c_code/4_2/stdlib_system.o \
c_code/3_2/compiler_commands.o \
c_code/4_2/stdlib_os.o \
c_code/2_2/stdlib_strutils.o \
c_code/2_2/stdlib_parseutils.o \
c_code/2_2/stdlib_math.o \
c_code/2_2/stdlib_algorithm.o \
c_code/2_2/stdlib_times.o \
c_code/3_2/stdlib_posix.o \
c_code/3_2/compiler_msgs.o \
c_code/3_2/compiler_options.o \
c_code/2_2/stdlib_tables.o \
c_code/2_2/compiler_ropes.o \
c_code/4_2/compiler_platform.o \
c_code/2_2/stdlib_terminal.o \
c_code/2_2/stdlib_macros.o \
c_code/2_2/compiler_lists.o \
c_code/2_2/stdlib_strtabs.o \
c_code/4_2/stdlib_osproc.o \
c_code/2_2/stdlib_sets.o \
c_code/2_2/stdlib_hashes.o \
c_code/2_2/stdlib_etcpriv.o \
c_code/3_2/stdlib_streams.o \
c_code/2_2/stdlib_cpuinfo.o \
c_code/2_2/stdlib_termios.o \
c_code/2_2/compiler_nversion.o \
c_code/2_2/compiler_condsyms.o \
c_code/2_2/compiler_idents.o \
c_code/2_2/compiler_wordrecg.o \
c_code/4_2/compiler_extccomp.o \
c_code/2_2/stdlib_securehash.o \
c_code/2_2/stdlib_json.o \
c_code/2_2/stdlib_lexbase.o \
c_code/2_2/stdlib_unicode.o \
c_code/4_2/compiler_nimblecmd.o \
c_code/2_2/stdlib_parseopt.o \
c_code/3_2/compiler_lexer.o \
c_code/2_2/compiler_nimlexbase.o \
c_code/2_2/compiler_llstream.o \
c_code/2_2/compiler_nimconf.o \
c_code/2_2/compiler_main.o \
c_code/2_2/compiler_ast.o \
c_code/2_2/compiler_astalgo.o \
c_code/2_2/compiler_syntaxes.o \
c_code/2_2/compiler_renderer.o \
c_code/3_2/compiler_rodread.o \
c_code/2_2/compiler_rodwrite.o \
c_code/4_2/compiler_sem.o \
c_code/2_2/compiler_semdata.o \
c_code/2_2/compiler_passes.o \
c_code/2_2/compiler_docgen.o \
c_code/2_2/compiler_cgen.o \
c_code/2_2/compiler_jsgen.o \
c_code/3_2/compiler_importer.o \
c_code/2_2/compiler_passaux.o \
c_code/2_2/compiler_depends.o \
c_code/4_2/compiler_vm.o \
c_code/2_2/compiler_vmdef.o \
c_code/2_2/compiler_types.o \
c_code/2_2/compiler_idgen.o \
c_code/3_2/compiler_docgen2.o \
c_code/2_2/compiler_service.o \
c_code/2_2/compiler_parser.o \
c_code/2_2/compiler_modules.o \
c_code/2_2/compiler_ccgutils.o \
c_code/3_2/compiler_sigmatch.o \
c_code/2_2/compiler_modulegraphs.o \
c_code/2_2/stdlib_intsets.o \
c_code/2_2/compiler_rodutils.o \
c_code/2_2/compiler_pbraces.o \
c_code/2_2/compiler_filters.o \
c_code/2_2/compiler_filter_tmpl.o \
c_code/3_2/stdlib_memfiles.o \
c_code/2_2/compiler_trees.o \
c_code/2_2/compiler_magicsys.o \
c_code/2_2/compiler_nimsets.o \
c_code/2_2/compiler_bitsets.o \
c_code/2_2/compiler_lookups.o \
c_code/3_2/compiler_prettybase.o \
c_code/2_2/compiler_treetab.o \
c_code/3_2/compiler_semfold.o \
c_code/2_2/compiler_procfind.o \
c_code/3_2/compiler_pragmas.o \
c_code/2_2/compiler_semtypinst.o \
c_code/2_2/compiler_transf.o \
c_code/2_2/compiler_aliases.o \
c_code/2_2/compiler_cgmeth.o \
c_code/2_2/compiler_lambdalifting.o \
c_code/2_2/compiler_evaltempl.o \
c_code/4_2/compiler_patterns.o \
c_code/2_2/compiler_parampatterns.o \
c_code/2_2/compiler_sempass2.o \
c_code/2_2/compiler_pretty.o \
c_code/2_2/compiler_semmacrosanity.o \
c_code/2_2/compiler_semparallel.o \
c_code/2_2/compiler_lowerings.o \
c_code/2_2/compiler_pluginsupport.o \
c_code/2_2/compiler_active.o \
c_code/2_2/compiler_saturate.o \
c_code/2_2/docutils_rstast.o \
c_code/2_2/docutils_rst.o \
c_code/4_2/docutils_rstgen.o \
c_code/2_2/docutils_highlite.o \
c_code/2_2/stdlib_xmltree.o \
c_code/2_2/stdlib_cgi.o \
c_code/2_2/compiler_typesrenderer.o \
c_code/2_2/stdlib_sequtils.o \
c_code/2_2/compiler_guards.o \
c_code/2_2/compiler_writetracking.o \
c_code/2_2/stdlib_cookies.o \
c_code/2_2/compiler_vmgen.o \
c_code/3_2/compiler_vmdeps.o \
c_code/2_2/compiler_vmmarshal.o \
c_code/2_2/compiler_locals.o \
c_code/2_2/compiler_itersgen.o \
c_code/2_2/compiler_cgendata.o \
c_code/2_2/compiler_ccgmerge.o \
c_code/2_2/compiler_sighashes.o \
c_code/2_2/stdlib_md5.o \
c_code/2_2/stdlib_dynlib.o \
c_code/2_2/stdlib_net.o \
c_code/2_2/stdlib_nativesockets.o \
c_code/2_2/compiler_nodejs.o \
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
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_nim.c -o c_code/4_1/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_system.c -o c_code/4_5/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_commands.c -o c_code/3_1/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_os.c -o c_code/4_1/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.c -o c_code/2_1/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.c -o c_code/2_1/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.c -o c_code/2_1/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_algorithm.c -o c_code/2_1/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_times.c -o c_code/2_1/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_posix.c -o c_code/3_1/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_msgs.c -o c_code/3_1/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_options.c -o c_code/3_1/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_tables.c -o c_code/2_1/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ropes.c -o c_code/2_1/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_platform.c -o c_code/4_5/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.c -o c_code/2_1/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_macros.c -o c_code/2_1/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lists.c -o c_code/2_1/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strtabs.c -o c_code/2_1/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_osproc.c -o c_code/4_1/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sets.c -o c_code/2_1/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_hashes.c -o c_code/2_1/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_etcpriv.c -o c_code/2_1/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_streams.c -o c_code/3_1/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cpuinfo.c -o c_code/2_1/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_termios.c -o c_code/2_1/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nversion.c -o c_code/2_1/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_condsyms.c -o c_code/2_1/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idents.c -o c_code/2_1/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_wordrecg.c -o c_code/2_1/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_extccomp.c -o c_code/4_1/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_securehash.c -o c_code/2_1/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_json.c -o c_code/2_1/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.c -o c_code/2_1/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.c -o c_code/2_1/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_nimblecmd.c -o c_code/4_1/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.c -o c_code/2_1/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_lexer.c -o c_code/3_1/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimlexbase.c -o c_code/2_1/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_llstream.c -o c_code/2_1/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimconf.c -o c_code/2_1/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_main.c -o c_code/2_1/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ast.c -o c_code/2_1/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_astalgo.c -o c_code/2_1/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_syntaxes.c -o c_code/2_1/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_renderer.c -o c_code/2_1/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_rodread.c -o c_code/3_1/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodwrite.c -o c_code/2_1/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_sem.c -o c_code/4_1/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semdata.c -o c_code/2_1/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passes.c -o c_code/2_1/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_docgen.c -o c_code/2_1/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgen.c -o c_code/2_1/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_jsgen.c -o c_code/2_1/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_importer.c -o c_code/3_1/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passaux.c -o c_code/2_1/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_depends.c -o c_code/2_1/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/compiler_vm.c -o c_code/4_5/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmdef.c -o c_code/2_1/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_types.c -o c_code/2_1/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idgen.c -o c_code/2_1/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_docgen2.c -o c_code/3_1/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_service.c -o c_code/2_1/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parser.c -o c_code/2_1/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_modules.c -o c_code/2_1/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgutils.c -o c_code/2_1/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_sigmatch.c -o c_code/3_1/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_modulegraphs.c -o c_code/2_1/compiler_modulegraphs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_intsets.c -o c_code/2_1/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodutils.c -o c_code/2_1/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pbraces.c -o c_code/2_1/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filters.c -o c_code/2_1/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filter_tmpl.c -o c_code/2_1/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_memfiles.c -o c_code/3_1/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_trees.c -o c_code/2_1/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_magicsys.c -o c_code/2_1/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimsets.c -o c_code/2_1/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_bitsets.c -o c_code/2_1/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lookups.c -o c_code/2_1/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_prettybase.c -o c_code/3_1/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_treetab.c -o c_code/2_1/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_semfold.c -o c_code/3_1/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_procfind.c -o c_code/2_1/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_pragmas.c -o c_code/3_1/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semtypinst.c -o c_code/2_1/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_transf.c -o c_code/2_1/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_aliases.c -o c_code/2_1/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgmeth.c -o c_code/2_1/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lambdalifting.c -o c_code/2_1/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_evaltempl.c -o c_code/2_1/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_patterns.c -o c_code/4_1/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parampatterns.c -o c_code/2_1/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sempass2.c -o c_code/2_1/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pretty.c -o c_code/2_1/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semmacrosanity.c -o c_code/2_1/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semparallel.c -o c_code/2_1/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lowerings.c -o c_code/2_1/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pluginsupport.c -o c_code/2_1/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_active.c -o c_code/2_1/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_saturate.c -o c_code/2_1/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rstast.c -o c_code/2_1/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rst.c -o c_code/2_1/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/docutils_rstgen.c -o c_code/4_1/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_highlite.c -o c_code/2_1/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_xmltree.c -o c_code/2_1/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cgi.c -o c_code/2_1/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_typesrenderer.c -o c_code/2_1/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sequtils.c -o c_code/2_1/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_guards.c -o c_code/2_1/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_writetracking.c -o c_code/2_1/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cookies.c -o c_code/2_1/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmgen.c -o c_code/2_1/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_vmdeps.c -o c_code/3_1/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmmarshal.c -o c_code/2_1/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_locals.c -o c_code/2_1/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_itersgen.c -o c_code/2_1/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgendata.c -o c_code/2_1/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgmerge.c -o c_code/2_1/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sighashes.c -o c_code/2_1/compiler_sighashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_md5.c -o c_code/2_1/stdlib_md5.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.c -o c_code/2_1/stdlib_dynlib.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_net.c -o c_code/2_1/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_nativesockets.c -o c_code/2_1/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nodejs.c -o c_code/2_1/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/compiler_scriptconfig.c -o c_code/4_1/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/4_1/compiler_nim.o \
c_code/4_5/stdlib_system.o \
c_code/3_1/compiler_commands.o \
c_code/4_1/stdlib_os.o \
c_code/2_1/stdlib_strutils.o \
c_code/2_1/stdlib_parseutils.o \
c_code/2_1/stdlib_math.o \
c_code/2_1/stdlib_algorithm.o \
c_code/2_1/stdlib_times.o \
c_code/3_1/stdlib_posix.o \
c_code/3_1/compiler_msgs.o \
c_code/3_1/compiler_options.o \
c_code/2_1/stdlib_tables.o \
c_code/2_1/compiler_ropes.o \
c_code/4_5/compiler_platform.o \
c_code/2_1/stdlib_terminal.o \
c_code/2_1/stdlib_macros.o \
c_code/2_1/compiler_lists.o \
c_code/2_1/stdlib_strtabs.o \
c_code/4_1/stdlib_osproc.o \
c_code/2_1/stdlib_sets.o \
c_code/2_1/stdlib_hashes.o \
c_code/2_1/stdlib_etcpriv.o \
c_code/3_1/stdlib_streams.o \
c_code/2_1/stdlib_cpuinfo.o \
c_code/2_1/stdlib_termios.o \
c_code/2_1/compiler_nversion.o \
c_code/2_1/compiler_condsyms.o \
c_code/2_1/compiler_idents.o \
c_code/2_1/compiler_wordrecg.o \
c_code/4_1/compiler_extccomp.o \
c_code/2_1/stdlib_securehash.o \
c_code/2_1/stdlib_json.o \
c_code/2_1/stdlib_lexbase.o \
c_code/2_1/stdlib_unicode.o \
c_code/4_1/compiler_nimblecmd.o \
c_code/2_1/stdlib_parseopt.o \
c_code/3_1/compiler_lexer.o \
c_code/2_1/compiler_nimlexbase.o \
c_code/2_1/compiler_llstream.o \
c_code/2_1/compiler_nimconf.o \
c_code/2_1/compiler_main.o \
c_code/2_1/compiler_ast.o \
c_code/2_1/compiler_astalgo.o \
c_code/2_1/compiler_syntaxes.o \
c_code/2_1/compiler_renderer.o \
c_code/3_1/compiler_rodread.o \
c_code/2_1/compiler_rodwrite.o \
c_code/4_1/compiler_sem.o \
c_code/2_1/compiler_semdata.o \
c_code/2_1/compiler_passes.o \
c_code/2_1/compiler_docgen.o \
c_code/2_1/compiler_cgen.o \
c_code/2_1/compiler_jsgen.o \
c_code/3_1/compiler_importer.o \
c_code/2_1/compiler_passaux.o \
c_code/2_1/compiler_depends.o \
c_code/4_5/compiler_vm.o \
c_code/2_1/compiler_vmdef.o \
c_code/2_1/compiler_types.o \
c_code/2_1/compiler_idgen.o \
c_code/3_1/compiler_docgen2.o \
c_code/2_1/compiler_service.o \
c_code/2_1/compiler_parser.o \
c_code/2_1/compiler_modules.o \
c_code/2_1/compiler_ccgutils.o \
c_code/3_1/compiler_sigmatch.o \
c_code/2_1/compiler_modulegraphs.o \
c_code/2_1/stdlib_intsets.o \
c_code/2_1/compiler_rodutils.o \
c_code/2_1/compiler_pbraces.o \
c_code/2_1/compiler_filters.o \
c_code/2_1/compiler_filter_tmpl.o \
c_code/3_1/stdlib_memfiles.o \
c_code/2_1/compiler_trees.o \
c_code/2_1/compiler_magicsys.o \
c_code/2_1/compiler_nimsets.o \
c_code/2_1/compiler_bitsets.o \
c_code/2_1/compiler_lookups.o \
c_code/3_1/compiler_prettybase.o \
c_code/2_1/compiler_treetab.o \
c_code/3_1/compiler_semfold.o \
c_code/2_1/compiler_procfind.o \
c_code/3_1/compiler_pragmas.o \
c_code/2_1/compiler_semtypinst.o \
c_code/2_1/compiler_transf.o \
c_code/2_1/compiler_aliases.o \
c_code/2_1/compiler_cgmeth.o \
c_code/2_1/compiler_lambdalifting.o \
c_code/2_1/compiler_evaltempl.o \
c_code/4_1/compiler_patterns.o \
c_code/2_1/compiler_parampatterns.o \
c_code/2_1/compiler_sempass2.o \
c_code/2_1/compiler_pretty.o \
c_code/2_1/compiler_semmacrosanity.o \
c_code/2_1/compiler_semparallel.o \
c_code/2_1/compiler_lowerings.o \
c_code/2_1/compiler_pluginsupport.o \
c_code/2_1/compiler_active.o \
c_code/2_1/compiler_saturate.o \
c_code/2_1/docutils_rstast.o \
c_code/2_1/docutils_rst.o \
c_code/4_1/docutils_rstgen.o \
c_code/2_1/docutils_highlite.o \
c_code/2_1/stdlib_xmltree.o \
c_code/2_1/stdlib_cgi.o \
c_code/2_1/compiler_typesrenderer.o \
c_code/2_1/stdlib_sequtils.o \
c_code/2_1/compiler_guards.o \
c_code/2_1/compiler_writetracking.o \
c_code/2_1/stdlib_cookies.o \
c_code/2_1/compiler_vmgen.o \
c_code/3_1/compiler_vmdeps.o \
c_code/2_1/compiler_vmmarshal.o \
c_code/2_1/compiler_locals.o \
c_code/2_1/compiler_itersgen.o \
c_code/2_1/compiler_cgendata.o \
c_code/2_1/compiler_ccgmerge.o \
c_code/2_1/compiler_sighashes.o \
c_code/2_1/stdlib_md5.o \
c_code/2_1/stdlib_dynlib.o \
c_code/2_1/stdlib_net.o \
c_code/2_1/stdlib_nativesockets.o \
c_code/2_1/compiler_nodejs.o \
c_code/4_1/compiler_scriptconfig.o $LINK_FLAGS
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
  sparc64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_nim.c -o c_code/4_2/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_11/stdlib_system.c -o c_code/4_11/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_commands.c -o c_code/3_2/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_os.c -o c_code/4_2/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.c -o c_code/2_2/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.c -o c_code/2_2/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.c -o c_code/2_2/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_algorithm.c -o c_code/2_2/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_times.c -o c_code/2_2/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_posix.c -o c_code/3_2/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_msgs.c -o c_code/3_2/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_options.c -o c_code/3_2/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_tables.c -o c_code/2_2/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ropes.c -o c_code/2_2/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_11/compiler_platform.c -o c_code/4_11/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.c -o c_code/2_2/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_macros.c -o c_code/2_2/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lists.c -o c_code/2_2/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strtabs.c -o c_code/2_2/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_osproc.c -o c_code/4_2/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sets.c -o c_code/2_2/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_hashes.c -o c_code/2_2/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_etcpriv.c -o c_code/2_2/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_streams.c -o c_code/3_2/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cpuinfo.c -o c_code/2_2/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_termios.c -o c_code/2_2/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nversion.c -o c_code/2_2/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_condsyms.c -o c_code/2_2/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_idents.c -o c_code/2_2/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_wordrecg.c -o c_code/2_2/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_extccomp.c -o c_code/4_2/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_securehash.c -o c_code/2_2/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_json.c -o c_code/2_2/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.c -o c_code/2_2/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.c -o c_code/2_2/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_nimblecmd.c -o c_code/4_2/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.c -o c_code/2_2/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_lexer.c -o c_code/3_2/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimlexbase.c -o c_code/2_2/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_llstream.c -o c_code/2_2/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimconf.c -o c_code/2_2/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_main.c -o c_code/2_2/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ast.c -o c_code/2_2/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_astalgo.c -o c_code/2_2/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_syntaxes.c -o c_code/2_2/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_renderer.c -o c_code/2_2/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_rodread.c -o c_code/3_2/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodwrite.c -o c_code/2_2/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_sem.c -o c_code/4_2/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semdata.c -o c_code/2_2/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_passes.c -o c_code/2_2/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_docgen.c -o c_code/2_2/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgen.c -o c_code/2_2/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_jsgen.c -o c_code/2_2/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_importer.c -o c_code/3_2/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_passaux.c -o c_code/2_2/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_depends.c -o c_code/2_2/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_11/compiler_vm.c -o c_code/4_11/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmdef.c -o c_code/2_2/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_types.c -o c_code/2_2/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_idgen.c -o c_code/2_2/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_docgen2.c -o c_code/3_2/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_service.c -o c_code/2_2/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_parser.c -o c_code/2_2/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_modules.c -o c_code/2_2/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ccgutils.c -o c_code/2_2/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_sigmatch.c -o c_code/3_2/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_modulegraphs.c -o c_code/2_2/compiler_modulegraphs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_intsets.c -o c_code/2_2/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodutils.c -o c_code/2_2/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pbraces.c -o c_code/2_2/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_filters.c -o c_code/2_2/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_filter_tmpl.c -o c_code/2_2/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_memfiles.c -o c_code/3_2/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_trees.c -o c_code/2_2/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_magicsys.c -o c_code/2_2/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimsets.c -o c_code/2_2/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_bitsets.c -o c_code/2_2/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lookups.c -o c_code/2_2/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_prettybase.c -o c_code/3_2/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_treetab.c -o c_code/2_2/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_semfold.c -o c_code/3_2/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_procfind.c -o c_code/2_2/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_pragmas.c -o c_code/3_2/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semtypinst.c -o c_code/2_2/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_transf.c -o c_code/2_2/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_aliases.c -o c_code/2_2/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgmeth.c -o c_code/2_2/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lambdalifting.c -o c_code/2_2/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_evaltempl.c -o c_code/2_2/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_patterns.c -o c_code/4_2/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_parampatterns.c -o c_code/2_2/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sempass2.c -o c_code/2_2/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pretty.c -o c_code/2_2/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semmacrosanity.c -o c_code/2_2/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semparallel.c -o c_code/2_2/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lowerings.c -o c_code/2_2/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pluginsupport.c -o c_code/2_2/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_active.c -o c_code/2_2/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_saturate.c -o c_code/2_2/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rstast.c -o c_code/2_2/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rst.c -o c_code/2_2/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/docutils_rstgen.c -o c_code/4_2/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_highlite.c -o c_code/2_2/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_xmltree.c -o c_code/2_2/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cgi.c -o c_code/2_2/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_typesrenderer.c -o c_code/2_2/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sequtils.c -o c_code/2_2/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_guards.c -o c_code/2_2/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_writetracking.c -o c_code/2_2/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cookies.c -o c_code/2_2/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmgen.c -o c_code/2_2/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_vmdeps.c -o c_code/3_2/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmmarshal.c -o c_code/2_2/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_locals.c -o c_code/2_2/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_itersgen.c -o c_code/2_2/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgendata.c -o c_code/2_2/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ccgmerge.c -o c_code/2_2/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sighashes.c -o c_code/2_2/compiler_sighashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_md5.c -o c_code/2_2/stdlib_md5.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.c -o c_code/2_2/stdlib_dynlib.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_net.c -o c_code/2_2/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_nativesockets.c -o c_code/2_2/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nodejs.c -o c_code/2_2/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/compiler_scriptconfig.c -o c_code/4_2/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/4_2/compiler_nim.o \
c_code/4_11/stdlib_system.o \
c_code/3_2/compiler_commands.o \
c_code/4_2/stdlib_os.o \
c_code/2_2/stdlib_strutils.o \
c_code/2_2/stdlib_parseutils.o \
c_code/2_2/stdlib_math.o \
c_code/2_2/stdlib_algorithm.o \
c_code/2_2/stdlib_times.o \
c_code/3_2/stdlib_posix.o \
c_code/3_2/compiler_msgs.o \
c_code/3_2/compiler_options.o \
c_code/2_2/stdlib_tables.o \
c_code/2_2/compiler_ropes.o \
c_code/4_11/compiler_platform.o \
c_code/2_2/stdlib_terminal.o \
c_code/2_2/stdlib_macros.o \
c_code/2_2/compiler_lists.o \
c_code/2_2/stdlib_strtabs.o \
c_code/4_2/stdlib_osproc.o \
c_code/2_2/stdlib_sets.o \
c_code/2_2/stdlib_hashes.o \
c_code/2_2/stdlib_etcpriv.o \
c_code/3_2/stdlib_streams.o \
c_code/2_2/stdlib_cpuinfo.o \
c_code/2_2/stdlib_termios.o \
c_code/2_2/compiler_nversion.o \
c_code/2_2/compiler_condsyms.o \
c_code/2_2/compiler_idents.o \
c_code/2_2/compiler_wordrecg.o \
c_code/4_2/compiler_extccomp.o \
c_code/2_2/stdlib_securehash.o \
c_code/2_2/stdlib_json.o \
c_code/2_2/stdlib_lexbase.o \
c_code/2_2/stdlib_unicode.o \
c_code/4_2/compiler_nimblecmd.o \
c_code/2_2/stdlib_parseopt.o \
c_code/3_2/compiler_lexer.o \
c_code/2_2/compiler_nimlexbase.o \
c_code/2_2/compiler_llstream.o \
c_code/2_2/compiler_nimconf.o \
c_code/2_2/compiler_main.o \
c_code/2_2/compiler_ast.o \
c_code/2_2/compiler_astalgo.o \
c_code/2_2/compiler_syntaxes.o \
c_code/2_2/compiler_renderer.o \
c_code/3_2/compiler_rodread.o \
c_code/2_2/compiler_rodwrite.o \
c_code/4_2/compiler_sem.o \
c_code/2_2/compiler_semdata.o \
c_code/2_2/compiler_passes.o \
c_code/2_2/compiler_docgen.o \
c_code/2_2/compiler_cgen.o \
c_code/2_2/compiler_jsgen.o \
c_code/3_2/compiler_importer.o \
c_code/2_2/compiler_passaux.o \
c_code/2_2/compiler_depends.o \
c_code/4_11/compiler_vm.o \
c_code/2_2/compiler_vmdef.o \
c_code/2_2/compiler_types.o \
c_code/2_2/compiler_idgen.o \
c_code/3_2/compiler_docgen2.o \
c_code/2_2/compiler_service.o \
c_code/2_2/compiler_parser.o \
c_code/2_2/compiler_modules.o \
c_code/2_2/compiler_ccgutils.o \
c_code/3_2/compiler_sigmatch.o \
c_code/2_2/compiler_modulegraphs.o \
c_code/2_2/stdlib_intsets.o \
c_code/2_2/compiler_rodutils.o \
c_code/2_2/compiler_pbraces.o \
c_code/2_2/compiler_filters.o \
c_code/2_2/compiler_filter_tmpl.o \
c_code/3_2/stdlib_memfiles.o \
c_code/2_2/compiler_trees.o \
c_code/2_2/compiler_magicsys.o \
c_code/2_2/compiler_nimsets.o \
c_code/2_2/compiler_bitsets.o \
c_code/2_2/compiler_lookups.o \
c_code/3_2/compiler_prettybase.o \
c_code/2_2/compiler_treetab.o \
c_code/3_2/compiler_semfold.o \
c_code/2_2/compiler_procfind.o \
c_code/3_2/compiler_pragmas.o \
c_code/2_2/compiler_semtypinst.o \
c_code/2_2/compiler_transf.o \
c_code/2_2/compiler_aliases.o \
c_code/2_2/compiler_cgmeth.o \
c_code/2_2/compiler_lambdalifting.o \
c_code/2_2/compiler_evaltempl.o \
c_code/4_2/compiler_patterns.o \
c_code/2_2/compiler_parampatterns.o \
c_code/2_2/compiler_sempass2.o \
c_code/2_2/compiler_pretty.o \
c_code/2_2/compiler_semmacrosanity.o \
c_code/2_2/compiler_semparallel.o \
c_code/2_2/compiler_lowerings.o \
c_code/2_2/compiler_pluginsupport.o \
c_code/2_2/compiler_active.o \
c_code/2_2/compiler_saturate.o \
c_code/2_2/docutils_rstast.o \
c_code/2_2/docutils_rst.o \
c_code/4_2/docutils_rstgen.o \
c_code/2_2/docutils_highlite.o \
c_code/2_2/stdlib_xmltree.o \
c_code/2_2/stdlib_cgi.o \
c_code/2_2/compiler_typesrenderer.o \
c_code/2_2/stdlib_sequtils.o \
c_code/2_2/compiler_guards.o \
c_code/2_2/compiler_writetracking.o \
c_code/2_2/stdlib_cookies.o \
c_code/2_2/compiler_vmgen.o \
c_code/3_2/compiler_vmdeps.o \
c_code/2_2/compiler_vmmarshal.o \
c_code/2_2/compiler_locals.o \
c_code/2_2/compiler_itersgen.o \
c_code/2_2/compiler_cgendata.o \
c_code/2_2/compiler_ccgmerge.o \
c_code/2_2/compiler_sighashes.o \
c_code/2_2/stdlib_md5.o \
c_code/2_2/stdlib_dynlib.o \
c_code/2_2/stdlib_net.o \
c_code/2_2/stdlib_nativesockets.o \
c_code/2_2/compiler_nodejs.o \
c_code/4_2/compiler_scriptconfig.o $LINK_FLAGS
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
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_nim.c -o c_code/3_1/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_system.c -o c_code/5_1/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_commands.c -o c_code/3_1/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_os.c -o c_code/5_1/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.c -o c_code/2_1/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.c -o c_code/2_1/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.c -o c_code/2_1/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_algorithm.c -o c_code/2_1/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_times.c -o c_code/5_1/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_posix.c -o c_code/3_1/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_msgs.c -o c_code/3_1/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_options.c -o c_code/3_1/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_tables.c -o c_code/2_1/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ropes.c -o c_code/2_1/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_platform.c -o c_code/5_1/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.c -o c_code/2_1/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_macros.c -o c_code/2_1/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lists.c -o c_code/2_1/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strtabs.c -o c_code/2_1/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_osproc.c -o c_code/5_1/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sets.c -o c_code/2_1/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_hashes.c -o c_code/2_1/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_etcpriv.c -o c_code/2_1/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_streams.c -o c_code/3_1/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_cpuinfo.c -o c_code/3_1/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_kqueue.c -o c_code/3_1/stdlib_kqueue.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_termios.c -o c_code/2_1/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nversion.c -o c_code/2_1/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_condsyms.c -o c_code/2_1/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idents.c -o c_code/2_1/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_wordrecg.c -o c_code/2_1/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_extccomp.c -o c_code/5_1/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_securehash.c -o c_code/2_1/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_json.c -o c_code/2_1/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.c -o c_code/2_1/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.c -o c_code/2_1/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_nimblecmd.c -o c_code/3_1/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.c -o c_code/2_1/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_lexer.c -o c_code/3_1/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimlexbase.c -o c_code/2_1/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_llstream.c -o c_code/2_1/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimconf.c -o c_code/2_1/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_main.c -o c_code/2_1/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ast.c -o c_code/2_1/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_astalgo.c -o c_code/2_1/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_syntaxes.c -o c_code/2_1/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_renderer.c -o c_code/2_1/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_rodread.c -o c_code/3_1/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodwrite.c -o c_code/2_1/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_sem.c -o c_code/5_1/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semdata.c -o c_code/2_1/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passes.c -o c_code/2_1/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_docgen.c -o c_code/2_1/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgen.c -o c_code/2_1/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_jsgen.c -o c_code/2_1/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_importer.c -o c_code/3_1/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passaux.c -o c_code/2_1/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_depends.c -o c_code/2_1/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_vm.c -o c_code/5_1/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmdef.c -o c_code/2_1/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_types.c -o c_code/2_1/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idgen.c -o c_code/2_1/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_docgen2.c -o c_code/3_1/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_service.c -o c_code/2_1/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parser.c -o c_code/2_1/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_modules.c -o c_code/2_1/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgutils.c -o c_code/2_1/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_sigmatch.c -o c_code/3_1/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_modulegraphs.c -o c_code/2_1/compiler_modulegraphs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_intsets.c -o c_code/2_1/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodutils.c -o c_code/2_1/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pbraces.c -o c_code/2_1/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filters.c -o c_code/2_1/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filter_tmpl.c -o c_code/2_1/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_memfiles.c -o c_code/3_1/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_trees.c -o c_code/2_1/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_magicsys.c -o c_code/2_1/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimsets.c -o c_code/2_1/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_bitsets.c -o c_code/2_1/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lookups.c -o c_code/2_1/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_prettybase.c -o c_code/3_1/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_treetab.c -o c_code/2_1/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_semfold.c -o c_code/3_1/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_procfind.c -o c_code/2_1/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_pragmas.c -o c_code/3_1/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semtypinst.c -o c_code/2_1/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_transf.c -o c_code/2_1/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_aliases.c -o c_code/2_1/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgmeth.c -o c_code/2_1/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lambdalifting.c -o c_code/2_1/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_evaltempl.c -o c_code/2_1/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_patterns.c -o c_code/5_1/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parampatterns.c -o c_code/2_1/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sempass2.c -o c_code/2_1/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pretty.c -o c_code/2_1/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semmacrosanity.c -o c_code/2_1/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semparallel.c -o c_code/2_1/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lowerings.c -o c_code/2_1/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pluginsupport.c -o c_code/2_1/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_active.c -o c_code/2_1/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_saturate.c -o c_code/2_1/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rstast.c -o c_code/2_1/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rst.c -o c_code/2_1/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/docutils_rstgen.c -o c_code/3_1/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_highlite.c -o c_code/2_1/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_xmltree.c -o c_code/2_1/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cgi.c -o c_code/2_1/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_typesrenderer.c -o c_code/2_1/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sequtils.c -o c_code/2_1/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_guards.c -o c_code/2_1/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_writetracking.c -o c_code/2_1/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cookies.c -o c_code/2_1/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmgen.c -o c_code/2_1/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_vmdeps.c -o c_code/3_1/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmmarshal.c -o c_code/2_1/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_locals.c -o c_code/2_1/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_itersgen.c -o c_code/2_1/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgendata.c -o c_code/2_1/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgmerge.c -o c_code/2_1/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sighashes.c -o c_code/2_1/compiler_sighashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_md5.c -o c_code/2_1/stdlib_md5.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.c -o c_code/2_1/stdlib_dynlib.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_net.c -o c_code/2_1/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_nativesockets.c -o c_code/2_1/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nodejs.c -o c_code/2_1/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_scriptconfig.c -o c_code/5_1/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/3_1/compiler_nim.o \
c_code/5_1/stdlib_system.o \
c_code/3_1/compiler_commands.o \
c_code/5_1/stdlib_os.o \
c_code/2_1/stdlib_strutils.o \
c_code/2_1/stdlib_parseutils.o \
c_code/2_1/stdlib_math.o \
c_code/2_1/stdlib_algorithm.o \
c_code/5_1/stdlib_times.o \
c_code/3_1/stdlib_posix.o \
c_code/3_1/compiler_msgs.o \
c_code/3_1/compiler_options.o \
c_code/2_1/stdlib_tables.o \
c_code/2_1/compiler_ropes.o \
c_code/5_1/compiler_platform.o \
c_code/2_1/stdlib_terminal.o \
c_code/2_1/stdlib_macros.o \
c_code/2_1/compiler_lists.o \
c_code/2_1/stdlib_strtabs.o \
c_code/5_1/stdlib_osproc.o \
c_code/2_1/stdlib_sets.o \
c_code/2_1/stdlib_hashes.o \
c_code/2_1/stdlib_etcpriv.o \
c_code/3_1/stdlib_streams.o \
c_code/3_1/stdlib_cpuinfo.o \
c_code/3_1/stdlib_kqueue.o \
c_code/2_1/stdlib_termios.o \
c_code/2_1/compiler_nversion.o \
c_code/2_1/compiler_condsyms.o \
c_code/2_1/compiler_idents.o \
c_code/2_1/compiler_wordrecg.o \
c_code/5_1/compiler_extccomp.o \
c_code/2_1/stdlib_securehash.o \
c_code/2_1/stdlib_json.o \
c_code/2_1/stdlib_lexbase.o \
c_code/2_1/stdlib_unicode.o \
c_code/3_1/compiler_nimblecmd.o \
c_code/2_1/stdlib_parseopt.o \
c_code/3_1/compiler_lexer.o \
c_code/2_1/compiler_nimlexbase.o \
c_code/2_1/compiler_llstream.o \
c_code/2_1/compiler_nimconf.o \
c_code/2_1/compiler_main.o \
c_code/2_1/compiler_ast.o \
c_code/2_1/compiler_astalgo.o \
c_code/2_1/compiler_syntaxes.o \
c_code/2_1/compiler_renderer.o \
c_code/3_1/compiler_rodread.o \
c_code/2_1/compiler_rodwrite.o \
c_code/5_1/compiler_sem.o \
c_code/2_1/compiler_semdata.o \
c_code/2_1/compiler_passes.o \
c_code/2_1/compiler_docgen.o \
c_code/2_1/compiler_cgen.o \
c_code/2_1/compiler_jsgen.o \
c_code/3_1/compiler_importer.o \
c_code/2_1/compiler_passaux.o \
c_code/2_1/compiler_depends.o \
c_code/5_1/compiler_vm.o \
c_code/2_1/compiler_vmdef.o \
c_code/2_1/compiler_types.o \
c_code/2_1/compiler_idgen.o \
c_code/3_1/compiler_docgen2.o \
c_code/2_1/compiler_service.o \
c_code/2_1/compiler_parser.o \
c_code/2_1/compiler_modules.o \
c_code/2_1/compiler_ccgutils.o \
c_code/3_1/compiler_sigmatch.o \
c_code/2_1/compiler_modulegraphs.o \
c_code/2_1/stdlib_intsets.o \
c_code/2_1/compiler_rodutils.o \
c_code/2_1/compiler_pbraces.o \
c_code/2_1/compiler_filters.o \
c_code/2_1/compiler_filter_tmpl.o \
c_code/3_1/stdlib_memfiles.o \
c_code/2_1/compiler_trees.o \
c_code/2_1/compiler_magicsys.o \
c_code/2_1/compiler_nimsets.o \
c_code/2_1/compiler_bitsets.o \
c_code/2_1/compiler_lookups.o \
c_code/3_1/compiler_prettybase.o \
c_code/2_1/compiler_treetab.o \
c_code/3_1/compiler_semfold.o \
c_code/2_1/compiler_procfind.o \
c_code/3_1/compiler_pragmas.o \
c_code/2_1/compiler_semtypinst.o \
c_code/2_1/compiler_transf.o \
c_code/2_1/compiler_aliases.o \
c_code/2_1/compiler_cgmeth.o \
c_code/2_1/compiler_lambdalifting.o \
c_code/2_1/compiler_evaltempl.o \
c_code/5_1/compiler_patterns.o \
c_code/2_1/compiler_parampatterns.o \
c_code/2_1/compiler_sempass2.o \
c_code/2_1/compiler_pretty.o \
c_code/2_1/compiler_semmacrosanity.o \
c_code/2_1/compiler_semparallel.o \
c_code/2_1/compiler_lowerings.o \
c_code/2_1/compiler_pluginsupport.o \
c_code/2_1/compiler_active.o \
c_code/2_1/compiler_saturate.o \
c_code/2_1/docutils_rstast.o \
c_code/2_1/docutils_rst.o \
c_code/3_1/docutils_rstgen.o \
c_code/2_1/docutils_highlite.o \
c_code/2_1/stdlib_xmltree.o \
c_code/2_1/stdlib_cgi.o \
c_code/2_1/compiler_typesrenderer.o \
c_code/2_1/stdlib_sequtils.o \
c_code/2_1/compiler_guards.o \
c_code/2_1/compiler_writetracking.o \
c_code/2_1/stdlib_cookies.o \
c_code/2_1/compiler_vmgen.o \
c_code/3_1/compiler_vmdeps.o \
c_code/2_1/compiler_vmmarshal.o \
c_code/2_1/compiler_locals.o \
c_code/2_1/compiler_itersgen.o \
c_code/2_1/compiler_cgendata.o \
c_code/2_1/compiler_ccgmerge.o \
c_code/2_1/compiler_sighashes.o \
c_code/2_1/stdlib_md5.o \
c_code/2_1/stdlib_dynlib.o \
c_code/2_1/stdlib_net.o \
c_code/2_1/stdlib_nativesockets.o \
c_code/2_1/compiler_nodejs.o \
c_code/5_1/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  amd64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_nim.c -o c_code/3_2/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_system.c -o c_code/5_2/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_commands.c -o c_code/3_2/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_os.c -o c_code/5_2/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.c -o c_code/2_2/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.c -o c_code/2_2/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.c -o c_code/2_2/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_algorithm.c -o c_code/2_2/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_times.c -o c_code/5_2/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_posix.c -o c_code/3_2/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_msgs.c -o c_code/3_2/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_options.c -o c_code/3_2/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_tables.c -o c_code/2_2/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ropes.c -o c_code/2_2/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_platform.c -o c_code/5_2/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.c -o c_code/2_2/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_macros.c -o c_code/2_2/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lists.c -o c_code/2_2/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strtabs.c -o c_code/2_2/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_osproc.c -o c_code/5_2/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sets.c -o c_code/2_2/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_hashes.c -o c_code/2_2/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_etcpriv.c -o c_code/2_2/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_streams.c -o c_code/3_2/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_cpuinfo.c -o c_code/3_2/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_kqueue.c -o c_code/3_2/stdlib_kqueue.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_termios.c -o c_code/2_2/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nversion.c -o c_code/2_2/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_condsyms.c -o c_code/2_2/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_idents.c -o c_code/2_2/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_wordrecg.c -o c_code/2_2/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_extccomp.c -o c_code/5_2/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_securehash.c -o c_code/2_2/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_json.c -o c_code/2_2/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.c -o c_code/2_2/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.c -o c_code/2_2/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_nimblecmd.c -o c_code/3_2/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.c -o c_code/2_2/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_lexer.c -o c_code/3_2/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimlexbase.c -o c_code/2_2/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_llstream.c -o c_code/2_2/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimconf.c -o c_code/2_2/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_main.c -o c_code/2_2/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ast.c -o c_code/2_2/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_astalgo.c -o c_code/2_2/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_syntaxes.c -o c_code/2_2/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_renderer.c -o c_code/2_2/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_rodread.c -o c_code/3_2/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodwrite.c -o c_code/2_2/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_sem.c -o c_code/5_2/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semdata.c -o c_code/2_2/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_passes.c -o c_code/2_2/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_docgen.c -o c_code/2_2/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgen.c -o c_code/2_2/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_jsgen.c -o c_code/2_2/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_importer.c -o c_code/3_2/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_passaux.c -o c_code/2_2/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_depends.c -o c_code/2_2/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_vm.c -o c_code/5_2/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmdef.c -o c_code/2_2/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_types.c -o c_code/2_2/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_idgen.c -o c_code/2_2/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_docgen2.c -o c_code/3_2/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_service.c -o c_code/2_2/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_parser.c -o c_code/2_2/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_modules.c -o c_code/2_2/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ccgutils.c -o c_code/2_2/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_sigmatch.c -o c_code/3_2/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_modulegraphs.c -o c_code/2_2/compiler_modulegraphs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_intsets.c -o c_code/2_2/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodutils.c -o c_code/2_2/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pbraces.c -o c_code/2_2/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_filters.c -o c_code/2_2/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_filter_tmpl.c -o c_code/2_2/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_memfiles.c -o c_code/3_2/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_trees.c -o c_code/2_2/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_magicsys.c -o c_code/2_2/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimsets.c -o c_code/2_2/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_bitsets.c -o c_code/2_2/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lookups.c -o c_code/2_2/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_prettybase.c -o c_code/3_2/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_treetab.c -o c_code/2_2/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_semfold.c -o c_code/3_2/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_procfind.c -o c_code/2_2/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_pragmas.c -o c_code/3_2/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semtypinst.c -o c_code/2_2/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_transf.c -o c_code/2_2/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_aliases.c -o c_code/2_2/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgmeth.c -o c_code/2_2/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lambdalifting.c -o c_code/2_2/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_evaltempl.c -o c_code/2_2/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_patterns.c -o c_code/5_2/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_parampatterns.c -o c_code/2_2/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sempass2.c -o c_code/2_2/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pretty.c -o c_code/2_2/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semmacrosanity.c -o c_code/2_2/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semparallel.c -o c_code/2_2/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lowerings.c -o c_code/2_2/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pluginsupport.c -o c_code/2_2/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_active.c -o c_code/2_2/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_saturate.c -o c_code/2_2/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rstast.c -o c_code/2_2/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rst.c -o c_code/2_2/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/docutils_rstgen.c -o c_code/3_2/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_highlite.c -o c_code/2_2/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_xmltree.c -o c_code/2_2/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cgi.c -o c_code/2_2/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_typesrenderer.c -o c_code/2_2/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sequtils.c -o c_code/2_2/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_guards.c -o c_code/2_2/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_writetracking.c -o c_code/2_2/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cookies.c -o c_code/2_2/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmgen.c -o c_code/2_2/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_vmdeps.c -o c_code/3_2/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmmarshal.c -o c_code/2_2/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_locals.c -o c_code/2_2/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_itersgen.c -o c_code/2_2/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgendata.c -o c_code/2_2/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ccgmerge.c -o c_code/2_2/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sighashes.c -o c_code/2_2/compiler_sighashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_md5.c -o c_code/2_2/stdlib_md5.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.c -o c_code/2_2/stdlib_dynlib.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_net.c -o c_code/2_2/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_nativesockets.c -o c_code/2_2/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nodejs.c -o c_code/2_2/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_scriptconfig.c -o c_code/5_2/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/3_2/compiler_nim.o \
c_code/5_2/stdlib_system.o \
c_code/3_2/compiler_commands.o \
c_code/5_2/stdlib_os.o \
c_code/2_2/stdlib_strutils.o \
c_code/2_2/stdlib_parseutils.o \
c_code/2_2/stdlib_math.o \
c_code/2_2/stdlib_algorithm.o \
c_code/5_2/stdlib_times.o \
c_code/3_2/stdlib_posix.o \
c_code/3_2/compiler_msgs.o \
c_code/3_2/compiler_options.o \
c_code/2_2/stdlib_tables.o \
c_code/2_2/compiler_ropes.o \
c_code/5_2/compiler_platform.o \
c_code/2_2/stdlib_terminal.o \
c_code/2_2/stdlib_macros.o \
c_code/2_2/compiler_lists.o \
c_code/2_2/stdlib_strtabs.o \
c_code/5_2/stdlib_osproc.o \
c_code/2_2/stdlib_sets.o \
c_code/2_2/stdlib_hashes.o \
c_code/2_2/stdlib_etcpriv.o \
c_code/3_2/stdlib_streams.o \
c_code/3_2/stdlib_cpuinfo.o \
c_code/3_2/stdlib_kqueue.o \
c_code/2_2/stdlib_termios.o \
c_code/2_2/compiler_nversion.o \
c_code/2_2/compiler_condsyms.o \
c_code/2_2/compiler_idents.o \
c_code/2_2/compiler_wordrecg.o \
c_code/5_2/compiler_extccomp.o \
c_code/2_2/stdlib_securehash.o \
c_code/2_2/stdlib_json.o \
c_code/2_2/stdlib_lexbase.o \
c_code/2_2/stdlib_unicode.o \
c_code/3_2/compiler_nimblecmd.o \
c_code/2_2/stdlib_parseopt.o \
c_code/3_2/compiler_lexer.o \
c_code/2_2/compiler_nimlexbase.o \
c_code/2_2/compiler_llstream.o \
c_code/2_2/compiler_nimconf.o \
c_code/2_2/compiler_main.o \
c_code/2_2/compiler_ast.o \
c_code/2_2/compiler_astalgo.o \
c_code/2_2/compiler_syntaxes.o \
c_code/2_2/compiler_renderer.o \
c_code/3_2/compiler_rodread.o \
c_code/2_2/compiler_rodwrite.o \
c_code/5_2/compiler_sem.o \
c_code/2_2/compiler_semdata.o \
c_code/2_2/compiler_passes.o \
c_code/2_2/compiler_docgen.o \
c_code/2_2/compiler_cgen.o \
c_code/2_2/compiler_jsgen.o \
c_code/3_2/compiler_importer.o \
c_code/2_2/compiler_passaux.o \
c_code/2_2/compiler_depends.o \
c_code/5_2/compiler_vm.o \
c_code/2_2/compiler_vmdef.o \
c_code/2_2/compiler_types.o \
c_code/2_2/compiler_idgen.o \
c_code/3_2/compiler_docgen2.o \
c_code/2_2/compiler_service.o \
c_code/2_2/compiler_parser.o \
c_code/2_2/compiler_modules.o \
c_code/2_2/compiler_ccgutils.o \
c_code/3_2/compiler_sigmatch.o \
c_code/2_2/compiler_modulegraphs.o \
c_code/2_2/stdlib_intsets.o \
c_code/2_2/compiler_rodutils.o \
c_code/2_2/compiler_pbraces.o \
c_code/2_2/compiler_filters.o \
c_code/2_2/compiler_filter_tmpl.o \
c_code/3_2/stdlib_memfiles.o \
c_code/2_2/compiler_trees.o \
c_code/2_2/compiler_magicsys.o \
c_code/2_2/compiler_nimsets.o \
c_code/2_2/compiler_bitsets.o \
c_code/2_2/compiler_lookups.o \
c_code/3_2/compiler_prettybase.o \
c_code/2_2/compiler_treetab.o \
c_code/3_2/compiler_semfold.o \
c_code/2_2/compiler_procfind.o \
c_code/3_2/compiler_pragmas.o \
c_code/2_2/compiler_semtypinst.o \
c_code/2_2/compiler_transf.o \
c_code/2_2/compiler_aliases.o \
c_code/2_2/compiler_cgmeth.o \
c_code/2_2/compiler_lambdalifting.o \
c_code/2_2/compiler_evaltempl.o \
c_code/5_2/compiler_patterns.o \
c_code/2_2/compiler_parampatterns.o \
c_code/2_2/compiler_sempass2.o \
c_code/2_2/compiler_pretty.o \
c_code/2_2/compiler_semmacrosanity.o \
c_code/2_2/compiler_semparallel.o \
c_code/2_2/compiler_lowerings.o \
c_code/2_2/compiler_pluginsupport.o \
c_code/2_2/compiler_active.o \
c_code/2_2/compiler_saturate.o \
c_code/2_2/docutils_rstast.o \
c_code/2_2/docutils_rst.o \
c_code/3_2/docutils_rstgen.o \
c_code/2_2/docutils_highlite.o \
c_code/2_2/stdlib_xmltree.o \
c_code/2_2/stdlib_cgi.o \
c_code/2_2/compiler_typesrenderer.o \
c_code/2_2/stdlib_sequtils.o \
c_code/2_2/compiler_guards.o \
c_code/2_2/compiler_writetracking.o \
c_code/2_2/stdlib_cookies.o \
c_code/2_2/compiler_vmgen.o \
c_code/3_2/compiler_vmdeps.o \
c_code/2_2/compiler_vmmarshal.o \
c_code/2_2/compiler_locals.o \
c_code/2_2/compiler_itersgen.o \
c_code/2_2/compiler_cgendata.o \
c_code/2_2/compiler_ccgmerge.o \
c_code/2_2/compiler_sighashes.o \
c_code/2_2/stdlib_md5.o \
c_code/2_2/stdlib_dynlib.o \
c_code/2_2/stdlib_net.o \
c_code/2_2/stdlib_nativesockets.o \
c_code/2_2/compiler_nodejs.o \
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
  sparc64)
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
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_nim.c -o c_code/3_1/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_system.c -o c_code/5_1/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_commands.c -o c_code/3_1/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_os.c -o c_code/6_1/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.c -o c_code/2_1/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.c -o c_code/2_1/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.c -o c_code/2_1/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_algorithm.c -o c_code/2_1/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_times.c -o c_code/5_1/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_posix.c -o c_code/3_1/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_msgs.c -o c_code/3_1/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_options.c -o c_code/3_1/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_tables.c -o c_code/2_1/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ropes.c -o c_code/2_1/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/compiler_platform.c -o c_code/6_1/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.c -o c_code/2_1/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_macros.c -o c_code/2_1/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lists.c -o c_code/2_1/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strtabs.c -o c_code/2_1/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_osproc.c -o c_code/6_1/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sets.c -o c_code/2_1/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_hashes.c -o c_code/2_1/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_etcpriv.c -o c_code/2_1/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_streams.c -o c_code/3_1/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_cpuinfo.c -o c_code/6_1/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_kqueue.c -o c_code/3_1/stdlib_kqueue.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_termios.c -o c_code/2_1/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nversion.c -o c_code/2_1/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_condsyms.c -o c_code/2_1/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idents.c -o c_code/2_1/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_wordrecg.c -o c_code/2_1/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_extccomp.c -o c_code/5_1/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_securehash.c -o c_code/2_1/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_json.c -o c_code/2_1/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.c -o c_code/2_1/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.c -o c_code/2_1/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_nimblecmd.c -o c_code/3_1/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.c -o c_code/2_1/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_lexer.c -o c_code/3_1/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimlexbase.c -o c_code/2_1/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_llstream.c -o c_code/2_1/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimconf.c -o c_code/2_1/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_main.c -o c_code/2_1/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ast.c -o c_code/2_1/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_astalgo.c -o c_code/2_1/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_syntaxes.c -o c_code/2_1/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_renderer.c -o c_code/2_1/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_rodread.c -o c_code/3_1/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodwrite.c -o c_code/2_1/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_sem.c -o c_code/5_1/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semdata.c -o c_code/2_1/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passes.c -o c_code/2_1/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_docgen.c -o c_code/2_1/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgen.c -o c_code/2_1/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_jsgen.c -o c_code/2_1/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_importer.c -o c_code/3_1/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passaux.c -o c_code/2_1/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_depends.c -o c_code/2_1/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_vm.c -o c_code/5_1/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmdef.c -o c_code/2_1/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_types.c -o c_code/2_1/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idgen.c -o c_code/2_1/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_docgen2.c -o c_code/3_1/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_service.c -o c_code/2_1/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parser.c -o c_code/2_1/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_modules.c -o c_code/2_1/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgutils.c -o c_code/2_1/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_sigmatch.c -o c_code/3_1/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_modulegraphs.c -o c_code/2_1/compiler_modulegraphs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_intsets.c -o c_code/2_1/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodutils.c -o c_code/2_1/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pbraces.c -o c_code/2_1/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filters.c -o c_code/2_1/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filter_tmpl.c -o c_code/2_1/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_memfiles.c -o c_code/3_1/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_trees.c -o c_code/2_1/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_magicsys.c -o c_code/2_1/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimsets.c -o c_code/2_1/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_bitsets.c -o c_code/2_1/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lookups.c -o c_code/2_1/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_prettybase.c -o c_code/3_1/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_treetab.c -o c_code/2_1/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_semfold.c -o c_code/3_1/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_procfind.c -o c_code/2_1/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_pragmas.c -o c_code/3_1/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semtypinst.c -o c_code/2_1/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_transf.c -o c_code/2_1/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_aliases.c -o c_code/2_1/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgmeth.c -o c_code/2_1/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lambdalifting.c -o c_code/2_1/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_evaltempl.c -o c_code/2_1/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_patterns.c -o c_code/5_1/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parampatterns.c -o c_code/2_1/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sempass2.c -o c_code/2_1/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pretty.c -o c_code/2_1/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semmacrosanity.c -o c_code/2_1/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semparallel.c -o c_code/2_1/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lowerings.c -o c_code/2_1/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pluginsupport.c -o c_code/2_1/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_active.c -o c_code/2_1/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_saturate.c -o c_code/2_1/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rstast.c -o c_code/2_1/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rst.c -o c_code/2_1/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/docutils_rstgen.c -o c_code/3_1/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_highlite.c -o c_code/2_1/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_xmltree.c -o c_code/2_1/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cgi.c -o c_code/2_1/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_typesrenderer.c -o c_code/2_1/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sequtils.c -o c_code/2_1/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_guards.c -o c_code/2_1/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_writetracking.c -o c_code/2_1/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cookies.c -o c_code/2_1/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmgen.c -o c_code/2_1/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_vmdeps.c -o c_code/3_1/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmmarshal.c -o c_code/2_1/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_locals.c -o c_code/2_1/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_itersgen.c -o c_code/2_1/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgendata.c -o c_code/2_1/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgmerge.c -o c_code/2_1/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sighashes.c -o c_code/2_1/compiler_sighashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_md5.c -o c_code/2_1/stdlib_md5.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.c -o c_code/2_1/stdlib_dynlib.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_net.c -o c_code/2_1/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_nativesockets.c -o c_code/2_1/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nodejs.c -o c_code/2_1/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_scriptconfig.c -o c_code/5_1/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/3_1/compiler_nim.o \
c_code/5_1/stdlib_system.o \
c_code/3_1/compiler_commands.o \
c_code/6_1/stdlib_os.o \
c_code/2_1/stdlib_strutils.o \
c_code/2_1/stdlib_parseutils.o \
c_code/2_1/stdlib_math.o \
c_code/2_1/stdlib_algorithm.o \
c_code/5_1/stdlib_times.o \
c_code/3_1/stdlib_posix.o \
c_code/3_1/compiler_msgs.o \
c_code/3_1/compiler_options.o \
c_code/2_1/stdlib_tables.o \
c_code/2_1/compiler_ropes.o \
c_code/6_1/compiler_platform.o \
c_code/2_1/stdlib_terminal.o \
c_code/2_1/stdlib_macros.o \
c_code/2_1/compiler_lists.o \
c_code/2_1/stdlib_strtabs.o \
c_code/6_1/stdlib_osproc.o \
c_code/2_1/stdlib_sets.o \
c_code/2_1/stdlib_hashes.o \
c_code/2_1/stdlib_etcpriv.o \
c_code/3_1/stdlib_streams.o \
c_code/6_1/stdlib_cpuinfo.o \
c_code/3_1/stdlib_kqueue.o \
c_code/2_1/stdlib_termios.o \
c_code/2_1/compiler_nversion.o \
c_code/2_1/compiler_condsyms.o \
c_code/2_1/compiler_idents.o \
c_code/2_1/compiler_wordrecg.o \
c_code/5_1/compiler_extccomp.o \
c_code/2_1/stdlib_securehash.o \
c_code/2_1/stdlib_json.o \
c_code/2_1/stdlib_lexbase.o \
c_code/2_1/stdlib_unicode.o \
c_code/3_1/compiler_nimblecmd.o \
c_code/2_1/stdlib_parseopt.o \
c_code/3_1/compiler_lexer.o \
c_code/2_1/compiler_nimlexbase.o \
c_code/2_1/compiler_llstream.o \
c_code/2_1/compiler_nimconf.o \
c_code/2_1/compiler_main.o \
c_code/2_1/compiler_ast.o \
c_code/2_1/compiler_astalgo.o \
c_code/2_1/compiler_syntaxes.o \
c_code/2_1/compiler_renderer.o \
c_code/3_1/compiler_rodread.o \
c_code/2_1/compiler_rodwrite.o \
c_code/5_1/compiler_sem.o \
c_code/2_1/compiler_semdata.o \
c_code/2_1/compiler_passes.o \
c_code/2_1/compiler_docgen.o \
c_code/2_1/compiler_cgen.o \
c_code/2_1/compiler_jsgen.o \
c_code/3_1/compiler_importer.o \
c_code/2_1/compiler_passaux.o \
c_code/2_1/compiler_depends.o \
c_code/5_1/compiler_vm.o \
c_code/2_1/compiler_vmdef.o \
c_code/2_1/compiler_types.o \
c_code/2_1/compiler_idgen.o \
c_code/3_1/compiler_docgen2.o \
c_code/2_1/compiler_service.o \
c_code/2_1/compiler_parser.o \
c_code/2_1/compiler_modules.o \
c_code/2_1/compiler_ccgutils.o \
c_code/3_1/compiler_sigmatch.o \
c_code/2_1/compiler_modulegraphs.o \
c_code/2_1/stdlib_intsets.o \
c_code/2_1/compiler_rodutils.o \
c_code/2_1/compiler_pbraces.o \
c_code/2_1/compiler_filters.o \
c_code/2_1/compiler_filter_tmpl.o \
c_code/3_1/stdlib_memfiles.o \
c_code/2_1/compiler_trees.o \
c_code/2_1/compiler_magicsys.o \
c_code/2_1/compiler_nimsets.o \
c_code/2_1/compiler_bitsets.o \
c_code/2_1/compiler_lookups.o \
c_code/3_1/compiler_prettybase.o \
c_code/2_1/compiler_treetab.o \
c_code/3_1/compiler_semfold.o \
c_code/2_1/compiler_procfind.o \
c_code/3_1/compiler_pragmas.o \
c_code/2_1/compiler_semtypinst.o \
c_code/2_1/compiler_transf.o \
c_code/2_1/compiler_aliases.o \
c_code/2_1/compiler_cgmeth.o \
c_code/2_1/compiler_lambdalifting.o \
c_code/2_1/compiler_evaltempl.o \
c_code/5_1/compiler_patterns.o \
c_code/2_1/compiler_parampatterns.o \
c_code/2_1/compiler_sempass2.o \
c_code/2_1/compiler_pretty.o \
c_code/2_1/compiler_semmacrosanity.o \
c_code/2_1/compiler_semparallel.o \
c_code/2_1/compiler_lowerings.o \
c_code/2_1/compiler_pluginsupport.o \
c_code/2_1/compiler_active.o \
c_code/2_1/compiler_saturate.o \
c_code/2_1/docutils_rstast.o \
c_code/2_1/docutils_rst.o \
c_code/3_1/docutils_rstgen.o \
c_code/2_1/docutils_highlite.o \
c_code/2_1/stdlib_xmltree.o \
c_code/2_1/stdlib_cgi.o \
c_code/2_1/compiler_typesrenderer.o \
c_code/2_1/stdlib_sequtils.o \
c_code/2_1/compiler_guards.o \
c_code/2_1/compiler_writetracking.o \
c_code/2_1/stdlib_cookies.o \
c_code/2_1/compiler_vmgen.o \
c_code/3_1/compiler_vmdeps.o \
c_code/2_1/compiler_vmmarshal.o \
c_code/2_1/compiler_locals.o \
c_code/2_1/compiler_itersgen.o \
c_code/2_1/compiler_cgendata.o \
c_code/2_1/compiler_ccgmerge.o \
c_code/2_1/compiler_sighashes.o \
c_code/2_1/stdlib_md5.o \
c_code/2_1/stdlib_dynlib.o \
c_code/2_1/stdlib_net.o \
c_code/2_1/stdlib_nativesockets.o \
c_code/2_1/compiler_nodejs.o \
c_code/5_1/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  amd64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_nim.c -o c_code/3_2/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_system.c -o c_code/5_2/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_commands.c -o c_code/3_2/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_os.c -o c_code/6_2/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.c -o c_code/2_2/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.c -o c_code/2_2/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.c -o c_code/2_2/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_algorithm.c -o c_code/2_2/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_times.c -o c_code/5_2/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_posix.c -o c_code/3_2/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_msgs.c -o c_code/3_2/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_options.c -o c_code/3_2/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_tables.c -o c_code/2_2/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ropes.c -o c_code/2_2/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/compiler_platform.c -o c_code/6_2/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.c -o c_code/2_2/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_macros.c -o c_code/2_2/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lists.c -o c_code/2_2/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strtabs.c -o c_code/2_2/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_osproc.c -o c_code/6_2/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sets.c -o c_code/2_2/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_hashes.c -o c_code/2_2/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_etcpriv.c -o c_code/2_2/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_streams.c -o c_code/3_2/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_cpuinfo.c -o c_code/6_2/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_kqueue.c -o c_code/3_2/stdlib_kqueue.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_termios.c -o c_code/2_2/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nversion.c -o c_code/2_2/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_condsyms.c -o c_code/2_2/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_idents.c -o c_code/2_2/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_wordrecg.c -o c_code/2_2/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_extccomp.c -o c_code/5_2/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_securehash.c -o c_code/2_2/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_json.c -o c_code/2_2/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.c -o c_code/2_2/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.c -o c_code/2_2/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_nimblecmd.c -o c_code/3_2/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.c -o c_code/2_2/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_lexer.c -o c_code/3_2/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimlexbase.c -o c_code/2_2/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_llstream.c -o c_code/2_2/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimconf.c -o c_code/2_2/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_main.c -o c_code/2_2/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ast.c -o c_code/2_2/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_astalgo.c -o c_code/2_2/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_syntaxes.c -o c_code/2_2/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_renderer.c -o c_code/2_2/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_rodread.c -o c_code/3_2/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodwrite.c -o c_code/2_2/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_sem.c -o c_code/5_2/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semdata.c -o c_code/2_2/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_passes.c -o c_code/2_2/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_docgen.c -o c_code/2_2/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgen.c -o c_code/2_2/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_jsgen.c -o c_code/2_2/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_importer.c -o c_code/3_2/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_passaux.c -o c_code/2_2/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_depends.c -o c_code/2_2/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_vm.c -o c_code/5_2/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmdef.c -o c_code/2_2/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_types.c -o c_code/2_2/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_idgen.c -o c_code/2_2/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_docgen2.c -o c_code/3_2/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_service.c -o c_code/2_2/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_parser.c -o c_code/2_2/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_modules.c -o c_code/2_2/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ccgutils.c -o c_code/2_2/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_sigmatch.c -o c_code/3_2/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_modulegraphs.c -o c_code/2_2/compiler_modulegraphs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_intsets.c -o c_code/2_2/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodutils.c -o c_code/2_2/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pbraces.c -o c_code/2_2/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_filters.c -o c_code/2_2/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_filter_tmpl.c -o c_code/2_2/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_memfiles.c -o c_code/3_2/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_trees.c -o c_code/2_2/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_magicsys.c -o c_code/2_2/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimsets.c -o c_code/2_2/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_bitsets.c -o c_code/2_2/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lookups.c -o c_code/2_2/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_prettybase.c -o c_code/3_2/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_treetab.c -o c_code/2_2/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_semfold.c -o c_code/3_2/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_procfind.c -o c_code/2_2/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_pragmas.c -o c_code/3_2/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semtypinst.c -o c_code/2_2/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_transf.c -o c_code/2_2/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_aliases.c -o c_code/2_2/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgmeth.c -o c_code/2_2/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lambdalifting.c -o c_code/2_2/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_evaltempl.c -o c_code/2_2/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_patterns.c -o c_code/5_2/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_parampatterns.c -o c_code/2_2/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sempass2.c -o c_code/2_2/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pretty.c -o c_code/2_2/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semmacrosanity.c -o c_code/2_2/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semparallel.c -o c_code/2_2/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lowerings.c -o c_code/2_2/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pluginsupport.c -o c_code/2_2/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_active.c -o c_code/2_2/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_saturate.c -o c_code/2_2/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rstast.c -o c_code/2_2/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rst.c -o c_code/2_2/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/docutils_rstgen.c -o c_code/3_2/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_highlite.c -o c_code/2_2/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_xmltree.c -o c_code/2_2/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cgi.c -o c_code/2_2/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_typesrenderer.c -o c_code/2_2/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sequtils.c -o c_code/2_2/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_guards.c -o c_code/2_2/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_writetracking.c -o c_code/2_2/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cookies.c -o c_code/2_2/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmgen.c -o c_code/2_2/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_vmdeps.c -o c_code/3_2/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmmarshal.c -o c_code/2_2/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_locals.c -o c_code/2_2/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_itersgen.c -o c_code/2_2/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgendata.c -o c_code/2_2/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ccgmerge.c -o c_code/2_2/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sighashes.c -o c_code/2_2/compiler_sighashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_md5.c -o c_code/2_2/stdlib_md5.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.c -o c_code/2_2/stdlib_dynlib.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_net.c -o c_code/2_2/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_nativesockets.c -o c_code/2_2/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nodejs.c -o c_code/2_2/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_scriptconfig.c -o c_code/5_2/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/3_2/compiler_nim.o \
c_code/5_2/stdlib_system.o \
c_code/3_2/compiler_commands.o \
c_code/6_2/stdlib_os.o \
c_code/2_2/stdlib_strutils.o \
c_code/2_2/stdlib_parseutils.o \
c_code/2_2/stdlib_math.o \
c_code/2_2/stdlib_algorithm.o \
c_code/5_2/stdlib_times.o \
c_code/3_2/stdlib_posix.o \
c_code/3_2/compiler_msgs.o \
c_code/3_2/compiler_options.o \
c_code/2_2/stdlib_tables.o \
c_code/2_2/compiler_ropes.o \
c_code/6_2/compiler_platform.o \
c_code/2_2/stdlib_terminal.o \
c_code/2_2/stdlib_macros.o \
c_code/2_2/compiler_lists.o \
c_code/2_2/stdlib_strtabs.o \
c_code/6_2/stdlib_osproc.o \
c_code/2_2/stdlib_sets.o \
c_code/2_2/stdlib_hashes.o \
c_code/2_2/stdlib_etcpriv.o \
c_code/3_2/stdlib_streams.o \
c_code/6_2/stdlib_cpuinfo.o \
c_code/3_2/stdlib_kqueue.o \
c_code/2_2/stdlib_termios.o \
c_code/2_2/compiler_nversion.o \
c_code/2_2/compiler_condsyms.o \
c_code/2_2/compiler_idents.o \
c_code/2_2/compiler_wordrecg.o \
c_code/5_2/compiler_extccomp.o \
c_code/2_2/stdlib_securehash.o \
c_code/2_2/stdlib_json.o \
c_code/2_2/stdlib_lexbase.o \
c_code/2_2/stdlib_unicode.o \
c_code/3_2/compiler_nimblecmd.o \
c_code/2_2/stdlib_parseopt.o \
c_code/3_2/compiler_lexer.o \
c_code/2_2/compiler_nimlexbase.o \
c_code/2_2/compiler_llstream.o \
c_code/2_2/compiler_nimconf.o \
c_code/2_2/compiler_main.o \
c_code/2_2/compiler_ast.o \
c_code/2_2/compiler_astalgo.o \
c_code/2_2/compiler_syntaxes.o \
c_code/2_2/compiler_renderer.o \
c_code/3_2/compiler_rodread.o \
c_code/2_2/compiler_rodwrite.o \
c_code/5_2/compiler_sem.o \
c_code/2_2/compiler_semdata.o \
c_code/2_2/compiler_passes.o \
c_code/2_2/compiler_docgen.o \
c_code/2_2/compiler_cgen.o \
c_code/2_2/compiler_jsgen.o \
c_code/3_2/compiler_importer.o \
c_code/2_2/compiler_passaux.o \
c_code/2_2/compiler_depends.o \
c_code/5_2/compiler_vm.o \
c_code/2_2/compiler_vmdef.o \
c_code/2_2/compiler_types.o \
c_code/2_2/compiler_idgen.o \
c_code/3_2/compiler_docgen2.o \
c_code/2_2/compiler_service.o \
c_code/2_2/compiler_parser.o \
c_code/2_2/compiler_modules.o \
c_code/2_2/compiler_ccgutils.o \
c_code/3_2/compiler_sigmatch.o \
c_code/2_2/compiler_modulegraphs.o \
c_code/2_2/stdlib_intsets.o \
c_code/2_2/compiler_rodutils.o \
c_code/2_2/compiler_pbraces.o \
c_code/2_2/compiler_filters.o \
c_code/2_2/compiler_filter_tmpl.o \
c_code/3_2/stdlib_memfiles.o \
c_code/2_2/compiler_trees.o \
c_code/2_2/compiler_magicsys.o \
c_code/2_2/compiler_nimsets.o \
c_code/2_2/compiler_bitsets.o \
c_code/2_2/compiler_lookups.o \
c_code/3_2/compiler_prettybase.o \
c_code/2_2/compiler_treetab.o \
c_code/3_2/compiler_semfold.o \
c_code/2_2/compiler_procfind.o \
c_code/3_2/compiler_pragmas.o \
c_code/2_2/compiler_semtypinst.o \
c_code/2_2/compiler_transf.o \
c_code/2_2/compiler_aliases.o \
c_code/2_2/compiler_cgmeth.o \
c_code/2_2/compiler_lambdalifting.o \
c_code/2_2/compiler_evaltempl.o \
c_code/5_2/compiler_patterns.o \
c_code/2_2/compiler_parampatterns.o \
c_code/2_2/compiler_sempass2.o \
c_code/2_2/compiler_pretty.o \
c_code/2_2/compiler_semmacrosanity.o \
c_code/2_2/compiler_semparallel.o \
c_code/2_2/compiler_lowerings.o \
c_code/2_2/compiler_pluginsupport.o \
c_code/2_2/compiler_active.o \
c_code/2_2/compiler_saturate.o \
c_code/2_2/docutils_rstast.o \
c_code/2_2/docutils_rst.o \
c_code/3_2/docutils_rstgen.o \
c_code/2_2/docutils_highlite.o \
c_code/2_2/stdlib_xmltree.o \
c_code/2_2/stdlib_cgi.o \
c_code/2_2/compiler_typesrenderer.o \
c_code/2_2/stdlib_sequtils.o \
c_code/2_2/compiler_guards.o \
c_code/2_2/compiler_writetracking.o \
c_code/2_2/stdlib_cookies.o \
c_code/2_2/compiler_vmgen.o \
c_code/3_2/compiler_vmdeps.o \
c_code/2_2/compiler_vmmarshal.o \
c_code/2_2/compiler_locals.o \
c_code/2_2/compiler_itersgen.o \
c_code/2_2/compiler_cgendata.o \
c_code/2_2/compiler_ccgmerge.o \
c_code/2_2/compiler_sighashes.o \
c_code/2_2/stdlib_md5.o \
c_code/2_2/stdlib_dynlib.o \
c_code/2_2/stdlib_net.o \
c_code/2_2/stdlib_nativesockets.o \
c_code/2_2/compiler_nodejs.o \
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
  sparc64)
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
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_nim.c -o c_code/3_1/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_system.c -o c_code/5_1/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_commands.c -o c_code/3_1/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_os.c -o c_code/7_1/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.c -o c_code/2_1/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.c -o c_code/2_1/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.c -o c_code/2_1/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_algorithm.c -o c_code/2_1/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_times.c -o c_code/5_1/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_posix.c -o c_code/3_1/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_msgs.c -o c_code/3_1/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_options.c -o c_code/3_1/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_tables.c -o c_code/2_1/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ropes.c -o c_code/2_1/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/compiler_platform.c -o c_code/7_1/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.c -o c_code/2_1/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_macros.c -o c_code/2_1/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lists.c -o c_code/2_1/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strtabs.c -o c_code/2_1/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_osproc.c -o c_code/5_1/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sets.c -o c_code/2_1/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_hashes.c -o c_code/2_1/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_etcpriv.c -o c_code/2_1/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_streams.c -o c_code/3_1/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_cpuinfo.c -o c_code/6_1/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_kqueue.c -o c_code/3_1/stdlib_kqueue.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_termios.c -o c_code/2_1/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nversion.c -o c_code/2_1/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_condsyms.c -o c_code/2_1/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idents.c -o c_code/2_1/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_wordrecg.c -o c_code/2_1/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_extccomp.c -o c_code/5_1/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_securehash.c -o c_code/2_1/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_json.c -o c_code/2_1/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.c -o c_code/2_1/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.c -o c_code/2_1/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_nimblecmd.c -o c_code/3_1/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.c -o c_code/2_1/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_lexer.c -o c_code/3_1/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimlexbase.c -o c_code/2_1/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_llstream.c -o c_code/2_1/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimconf.c -o c_code/2_1/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_main.c -o c_code/2_1/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ast.c -o c_code/2_1/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_astalgo.c -o c_code/2_1/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_syntaxes.c -o c_code/2_1/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_renderer.c -o c_code/2_1/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_rodread.c -o c_code/3_1/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodwrite.c -o c_code/2_1/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_sem.c -o c_code/5_1/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semdata.c -o c_code/2_1/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passes.c -o c_code/2_1/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_docgen.c -o c_code/2_1/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgen.c -o c_code/2_1/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_jsgen.c -o c_code/2_1/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_importer.c -o c_code/3_1/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passaux.c -o c_code/2_1/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_depends.c -o c_code/2_1/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_vm.c -o c_code/5_1/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmdef.c -o c_code/2_1/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_types.c -o c_code/2_1/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idgen.c -o c_code/2_1/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_docgen2.c -o c_code/3_1/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_service.c -o c_code/2_1/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parser.c -o c_code/2_1/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_modules.c -o c_code/2_1/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgutils.c -o c_code/2_1/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_sigmatch.c -o c_code/3_1/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_modulegraphs.c -o c_code/2_1/compiler_modulegraphs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_intsets.c -o c_code/2_1/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodutils.c -o c_code/2_1/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pbraces.c -o c_code/2_1/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filters.c -o c_code/2_1/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filter_tmpl.c -o c_code/2_1/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_memfiles.c -o c_code/3_1/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_trees.c -o c_code/2_1/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_magicsys.c -o c_code/2_1/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimsets.c -o c_code/2_1/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_bitsets.c -o c_code/2_1/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lookups.c -o c_code/2_1/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_prettybase.c -o c_code/3_1/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_treetab.c -o c_code/2_1/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_semfold.c -o c_code/3_1/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_procfind.c -o c_code/2_1/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_pragmas.c -o c_code/3_1/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semtypinst.c -o c_code/2_1/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_transf.c -o c_code/2_1/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_aliases.c -o c_code/2_1/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgmeth.c -o c_code/2_1/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lambdalifting.c -o c_code/2_1/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_evaltempl.c -o c_code/2_1/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_patterns.c -o c_code/5_1/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parampatterns.c -o c_code/2_1/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sempass2.c -o c_code/2_1/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pretty.c -o c_code/2_1/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semmacrosanity.c -o c_code/2_1/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semparallel.c -o c_code/2_1/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lowerings.c -o c_code/2_1/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pluginsupport.c -o c_code/2_1/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_active.c -o c_code/2_1/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_saturate.c -o c_code/2_1/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rstast.c -o c_code/2_1/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rst.c -o c_code/2_1/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/docutils_rstgen.c -o c_code/3_1/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_highlite.c -o c_code/2_1/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_xmltree.c -o c_code/2_1/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cgi.c -o c_code/2_1/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_typesrenderer.c -o c_code/2_1/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sequtils.c -o c_code/2_1/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_guards.c -o c_code/2_1/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_writetracking.c -o c_code/2_1/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cookies.c -o c_code/2_1/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmgen.c -o c_code/2_1/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/compiler_vmdeps.c -o c_code/3_1/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmmarshal.c -o c_code/2_1/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_locals.c -o c_code/2_1/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_itersgen.c -o c_code/2_1/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgendata.c -o c_code/2_1/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgmerge.c -o c_code/2_1/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sighashes.c -o c_code/2_1/compiler_sighashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_md5.c -o c_code/2_1/stdlib_md5.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.c -o c_code/2_1/stdlib_dynlib.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_net.c -o c_code/2_1/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_nativesockets.c -o c_code/2_1/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nodejs.c -o c_code/2_1/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_scriptconfig.c -o c_code/5_1/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/3_1/compiler_nim.o \
c_code/5_1/stdlib_system.o \
c_code/3_1/compiler_commands.o \
c_code/7_1/stdlib_os.o \
c_code/2_1/stdlib_strutils.o \
c_code/2_1/stdlib_parseutils.o \
c_code/2_1/stdlib_math.o \
c_code/2_1/stdlib_algorithm.o \
c_code/5_1/stdlib_times.o \
c_code/3_1/stdlib_posix.o \
c_code/3_1/compiler_msgs.o \
c_code/3_1/compiler_options.o \
c_code/2_1/stdlib_tables.o \
c_code/2_1/compiler_ropes.o \
c_code/7_1/compiler_platform.o \
c_code/2_1/stdlib_terminal.o \
c_code/2_1/stdlib_macros.o \
c_code/2_1/compiler_lists.o \
c_code/2_1/stdlib_strtabs.o \
c_code/5_1/stdlib_osproc.o \
c_code/2_1/stdlib_sets.o \
c_code/2_1/stdlib_hashes.o \
c_code/2_1/stdlib_etcpriv.o \
c_code/3_1/stdlib_streams.o \
c_code/6_1/stdlib_cpuinfo.o \
c_code/3_1/stdlib_kqueue.o \
c_code/2_1/stdlib_termios.o \
c_code/2_1/compiler_nversion.o \
c_code/2_1/compiler_condsyms.o \
c_code/2_1/compiler_idents.o \
c_code/2_1/compiler_wordrecg.o \
c_code/5_1/compiler_extccomp.o \
c_code/2_1/stdlib_securehash.o \
c_code/2_1/stdlib_json.o \
c_code/2_1/stdlib_lexbase.o \
c_code/2_1/stdlib_unicode.o \
c_code/3_1/compiler_nimblecmd.o \
c_code/2_1/stdlib_parseopt.o \
c_code/3_1/compiler_lexer.o \
c_code/2_1/compiler_nimlexbase.o \
c_code/2_1/compiler_llstream.o \
c_code/2_1/compiler_nimconf.o \
c_code/2_1/compiler_main.o \
c_code/2_1/compiler_ast.o \
c_code/2_1/compiler_astalgo.o \
c_code/2_1/compiler_syntaxes.o \
c_code/2_1/compiler_renderer.o \
c_code/3_1/compiler_rodread.o \
c_code/2_1/compiler_rodwrite.o \
c_code/5_1/compiler_sem.o \
c_code/2_1/compiler_semdata.o \
c_code/2_1/compiler_passes.o \
c_code/2_1/compiler_docgen.o \
c_code/2_1/compiler_cgen.o \
c_code/2_1/compiler_jsgen.o \
c_code/3_1/compiler_importer.o \
c_code/2_1/compiler_passaux.o \
c_code/2_1/compiler_depends.o \
c_code/5_1/compiler_vm.o \
c_code/2_1/compiler_vmdef.o \
c_code/2_1/compiler_types.o \
c_code/2_1/compiler_idgen.o \
c_code/3_1/compiler_docgen2.o \
c_code/2_1/compiler_service.o \
c_code/2_1/compiler_parser.o \
c_code/2_1/compiler_modules.o \
c_code/2_1/compiler_ccgutils.o \
c_code/3_1/compiler_sigmatch.o \
c_code/2_1/compiler_modulegraphs.o \
c_code/2_1/stdlib_intsets.o \
c_code/2_1/compiler_rodutils.o \
c_code/2_1/compiler_pbraces.o \
c_code/2_1/compiler_filters.o \
c_code/2_1/compiler_filter_tmpl.o \
c_code/3_1/stdlib_memfiles.o \
c_code/2_1/compiler_trees.o \
c_code/2_1/compiler_magicsys.o \
c_code/2_1/compiler_nimsets.o \
c_code/2_1/compiler_bitsets.o \
c_code/2_1/compiler_lookups.o \
c_code/3_1/compiler_prettybase.o \
c_code/2_1/compiler_treetab.o \
c_code/3_1/compiler_semfold.o \
c_code/2_1/compiler_procfind.o \
c_code/3_1/compiler_pragmas.o \
c_code/2_1/compiler_semtypinst.o \
c_code/2_1/compiler_transf.o \
c_code/2_1/compiler_aliases.o \
c_code/2_1/compiler_cgmeth.o \
c_code/2_1/compiler_lambdalifting.o \
c_code/2_1/compiler_evaltempl.o \
c_code/5_1/compiler_patterns.o \
c_code/2_1/compiler_parampatterns.o \
c_code/2_1/compiler_sempass2.o \
c_code/2_1/compiler_pretty.o \
c_code/2_1/compiler_semmacrosanity.o \
c_code/2_1/compiler_semparallel.o \
c_code/2_1/compiler_lowerings.o \
c_code/2_1/compiler_pluginsupport.o \
c_code/2_1/compiler_active.o \
c_code/2_1/compiler_saturate.o \
c_code/2_1/docutils_rstast.o \
c_code/2_1/docutils_rst.o \
c_code/3_1/docutils_rstgen.o \
c_code/2_1/docutils_highlite.o \
c_code/2_1/stdlib_xmltree.o \
c_code/2_1/stdlib_cgi.o \
c_code/2_1/compiler_typesrenderer.o \
c_code/2_1/stdlib_sequtils.o \
c_code/2_1/compiler_guards.o \
c_code/2_1/compiler_writetracking.o \
c_code/2_1/stdlib_cookies.o \
c_code/2_1/compiler_vmgen.o \
c_code/3_1/compiler_vmdeps.o \
c_code/2_1/compiler_vmmarshal.o \
c_code/2_1/compiler_locals.o \
c_code/2_1/compiler_itersgen.o \
c_code/2_1/compiler_cgendata.o \
c_code/2_1/compiler_ccgmerge.o \
c_code/2_1/compiler_sighashes.o \
c_code/2_1/stdlib_md5.o \
c_code/2_1/stdlib_dynlib.o \
c_code/2_1/stdlib_net.o \
c_code/2_1/stdlib_nativesockets.o \
c_code/2_1/compiler_nodejs.o \
c_code/5_1/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  amd64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_nim.c -o c_code/3_2/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_system.c -o c_code/5_2/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_commands.c -o c_code/3_2/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_os.c -o c_code/7_2/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.c -o c_code/2_2/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.c -o c_code/2_2/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.c -o c_code/2_2/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_algorithm.c -o c_code/2_2/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_times.c -o c_code/5_2/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_posix.c -o c_code/3_2/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_msgs.c -o c_code/3_2/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_options.c -o c_code/3_2/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_tables.c -o c_code/2_2/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ropes.c -o c_code/2_2/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/compiler_platform.c -o c_code/7_2/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.c -o c_code/2_2/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_macros.c -o c_code/2_2/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lists.c -o c_code/2_2/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strtabs.c -o c_code/2_2/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_osproc.c -o c_code/5_2/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sets.c -o c_code/2_2/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_hashes.c -o c_code/2_2/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_etcpriv.c -o c_code/2_2/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_streams.c -o c_code/3_2/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_cpuinfo.c -o c_code/6_2/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_kqueue.c -o c_code/3_2/stdlib_kqueue.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_termios.c -o c_code/2_2/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nversion.c -o c_code/2_2/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_condsyms.c -o c_code/2_2/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_idents.c -o c_code/2_2/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_wordrecg.c -o c_code/2_2/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_extccomp.c -o c_code/5_2/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_securehash.c -o c_code/2_2/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_json.c -o c_code/2_2/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.c -o c_code/2_2/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.c -o c_code/2_2/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_nimblecmd.c -o c_code/3_2/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.c -o c_code/2_2/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_lexer.c -o c_code/3_2/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimlexbase.c -o c_code/2_2/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_llstream.c -o c_code/2_2/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimconf.c -o c_code/2_2/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_main.c -o c_code/2_2/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ast.c -o c_code/2_2/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_astalgo.c -o c_code/2_2/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_syntaxes.c -o c_code/2_2/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_renderer.c -o c_code/2_2/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_rodread.c -o c_code/3_2/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodwrite.c -o c_code/2_2/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_sem.c -o c_code/5_2/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semdata.c -o c_code/2_2/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_passes.c -o c_code/2_2/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_docgen.c -o c_code/2_2/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgen.c -o c_code/2_2/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_jsgen.c -o c_code/2_2/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_importer.c -o c_code/3_2/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_passaux.c -o c_code/2_2/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_depends.c -o c_code/2_2/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_vm.c -o c_code/5_2/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmdef.c -o c_code/2_2/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_types.c -o c_code/2_2/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_idgen.c -o c_code/2_2/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_docgen2.c -o c_code/3_2/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_service.c -o c_code/2_2/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_parser.c -o c_code/2_2/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_modules.c -o c_code/2_2/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ccgutils.c -o c_code/2_2/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_sigmatch.c -o c_code/3_2/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_modulegraphs.c -o c_code/2_2/compiler_modulegraphs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_intsets.c -o c_code/2_2/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodutils.c -o c_code/2_2/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pbraces.c -o c_code/2_2/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_filters.c -o c_code/2_2/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_filter_tmpl.c -o c_code/2_2/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_memfiles.c -o c_code/3_2/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_trees.c -o c_code/2_2/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_magicsys.c -o c_code/2_2/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimsets.c -o c_code/2_2/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_bitsets.c -o c_code/2_2/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lookups.c -o c_code/2_2/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_prettybase.c -o c_code/3_2/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_treetab.c -o c_code/2_2/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_semfold.c -o c_code/3_2/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_procfind.c -o c_code/2_2/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_pragmas.c -o c_code/3_2/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semtypinst.c -o c_code/2_2/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_transf.c -o c_code/2_2/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_aliases.c -o c_code/2_2/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgmeth.c -o c_code/2_2/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lambdalifting.c -o c_code/2_2/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_evaltempl.c -o c_code/2_2/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_patterns.c -o c_code/5_2/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_parampatterns.c -o c_code/2_2/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sempass2.c -o c_code/2_2/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pretty.c -o c_code/2_2/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semmacrosanity.c -o c_code/2_2/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semparallel.c -o c_code/2_2/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lowerings.c -o c_code/2_2/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pluginsupport.c -o c_code/2_2/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_active.c -o c_code/2_2/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_saturate.c -o c_code/2_2/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rstast.c -o c_code/2_2/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rst.c -o c_code/2_2/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/docutils_rstgen.c -o c_code/3_2/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_highlite.c -o c_code/2_2/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_xmltree.c -o c_code/2_2/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cgi.c -o c_code/2_2/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_typesrenderer.c -o c_code/2_2/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sequtils.c -o c_code/2_2/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_guards.c -o c_code/2_2/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_writetracking.c -o c_code/2_2/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cookies.c -o c_code/2_2/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmgen.c -o c_code/2_2/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/compiler_vmdeps.c -o c_code/3_2/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmmarshal.c -o c_code/2_2/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_locals.c -o c_code/2_2/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_itersgen.c -o c_code/2_2/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgendata.c -o c_code/2_2/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ccgmerge.c -o c_code/2_2/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sighashes.c -o c_code/2_2/compiler_sighashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_md5.c -o c_code/2_2/stdlib_md5.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.c -o c_code/2_2/stdlib_dynlib.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_net.c -o c_code/2_2/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_nativesockets.c -o c_code/2_2/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nodejs.c -o c_code/2_2/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_scriptconfig.c -o c_code/5_2/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/3_2/compiler_nim.o \
c_code/5_2/stdlib_system.o \
c_code/3_2/compiler_commands.o \
c_code/7_2/stdlib_os.o \
c_code/2_2/stdlib_strutils.o \
c_code/2_2/stdlib_parseutils.o \
c_code/2_2/stdlib_math.o \
c_code/2_2/stdlib_algorithm.o \
c_code/5_2/stdlib_times.o \
c_code/3_2/stdlib_posix.o \
c_code/3_2/compiler_msgs.o \
c_code/3_2/compiler_options.o \
c_code/2_2/stdlib_tables.o \
c_code/2_2/compiler_ropes.o \
c_code/7_2/compiler_platform.o \
c_code/2_2/stdlib_terminal.o \
c_code/2_2/stdlib_macros.o \
c_code/2_2/compiler_lists.o \
c_code/2_2/stdlib_strtabs.o \
c_code/5_2/stdlib_osproc.o \
c_code/2_2/stdlib_sets.o \
c_code/2_2/stdlib_hashes.o \
c_code/2_2/stdlib_etcpriv.o \
c_code/3_2/stdlib_streams.o \
c_code/6_2/stdlib_cpuinfo.o \
c_code/3_2/stdlib_kqueue.o \
c_code/2_2/stdlib_termios.o \
c_code/2_2/compiler_nversion.o \
c_code/2_2/compiler_condsyms.o \
c_code/2_2/compiler_idents.o \
c_code/2_2/compiler_wordrecg.o \
c_code/5_2/compiler_extccomp.o \
c_code/2_2/stdlib_securehash.o \
c_code/2_2/stdlib_json.o \
c_code/2_2/stdlib_lexbase.o \
c_code/2_2/stdlib_unicode.o \
c_code/3_2/compiler_nimblecmd.o \
c_code/2_2/stdlib_parseopt.o \
c_code/3_2/compiler_lexer.o \
c_code/2_2/compiler_nimlexbase.o \
c_code/2_2/compiler_llstream.o \
c_code/2_2/compiler_nimconf.o \
c_code/2_2/compiler_main.o \
c_code/2_2/compiler_ast.o \
c_code/2_2/compiler_astalgo.o \
c_code/2_2/compiler_syntaxes.o \
c_code/2_2/compiler_renderer.o \
c_code/3_2/compiler_rodread.o \
c_code/2_2/compiler_rodwrite.o \
c_code/5_2/compiler_sem.o \
c_code/2_2/compiler_semdata.o \
c_code/2_2/compiler_passes.o \
c_code/2_2/compiler_docgen.o \
c_code/2_2/compiler_cgen.o \
c_code/2_2/compiler_jsgen.o \
c_code/3_2/compiler_importer.o \
c_code/2_2/compiler_passaux.o \
c_code/2_2/compiler_depends.o \
c_code/5_2/compiler_vm.o \
c_code/2_2/compiler_vmdef.o \
c_code/2_2/compiler_types.o \
c_code/2_2/compiler_idgen.o \
c_code/3_2/compiler_docgen2.o \
c_code/2_2/compiler_service.o \
c_code/2_2/compiler_parser.o \
c_code/2_2/compiler_modules.o \
c_code/2_2/compiler_ccgutils.o \
c_code/3_2/compiler_sigmatch.o \
c_code/2_2/compiler_modulegraphs.o \
c_code/2_2/stdlib_intsets.o \
c_code/2_2/compiler_rodutils.o \
c_code/2_2/compiler_pbraces.o \
c_code/2_2/compiler_filters.o \
c_code/2_2/compiler_filter_tmpl.o \
c_code/3_2/stdlib_memfiles.o \
c_code/2_2/compiler_trees.o \
c_code/2_2/compiler_magicsys.o \
c_code/2_2/compiler_nimsets.o \
c_code/2_2/compiler_bitsets.o \
c_code/2_2/compiler_lookups.o \
c_code/3_2/compiler_prettybase.o \
c_code/2_2/compiler_treetab.o \
c_code/3_2/compiler_semfold.o \
c_code/2_2/compiler_procfind.o \
c_code/3_2/compiler_pragmas.o \
c_code/2_2/compiler_semtypinst.o \
c_code/2_2/compiler_transf.o \
c_code/2_2/compiler_aliases.o \
c_code/2_2/compiler_cgmeth.o \
c_code/2_2/compiler_lambdalifting.o \
c_code/2_2/compiler_evaltempl.o \
c_code/5_2/compiler_patterns.o \
c_code/2_2/compiler_parampatterns.o \
c_code/2_2/compiler_sempass2.o \
c_code/2_2/compiler_pretty.o \
c_code/2_2/compiler_semmacrosanity.o \
c_code/2_2/compiler_semparallel.o \
c_code/2_2/compiler_lowerings.o \
c_code/2_2/compiler_pluginsupport.o \
c_code/2_2/compiler_active.o \
c_code/2_2/compiler_saturate.o \
c_code/2_2/docutils_rstast.o \
c_code/2_2/docutils_rst.o \
c_code/3_2/docutils_rstgen.o \
c_code/2_2/docutils_highlite.o \
c_code/2_2/stdlib_xmltree.o \
c_code/2_2/stdlib_cgi.o \
c_code/2_2/compiler_typesrenderer.o \
c_code/2_2/stdlib_sequtils.o \
c_code/2_2/compiler_guards.o \
c_code/2_2/compiler_writetracking.o \
c_code/2_2/stdlib_cookies.o \
c_code/2_2/compiler_vmgen.o \
c_code/3_2/compiler_vmdeps.o \
c_code/2_2/compiler_vmmarshal.o \
c_code/2_2/compiler_locals.o \
c_code/2_2/compiler_itersgen.o \
c_code/2_2/compiler_cgendata.o \
c_code/2_2/compiler_ccgmerge.o \
c_code/2_2/compiler_sighashes.o \
c_code/2_2/stdlib_md5.o \
c_code/2_2/stdlib_dynlib.o \
c_code/2_2/stdlib_net.o \
c_code/2_2/stdlib_nativesockets.o \
c_code/2_2/compiler_nodejs.o \
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
  sparc64)
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
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_commands.c -o c_code/2_1/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_os.c -o c_code/8_1/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.c -o c_code/2_1/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.c -o c_code/2_1/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.c -o c_code/2_1/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_algorithm.c -o c_code/2_1/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_times.c -o c_code/2_1/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_posix.c -o c_code/3_1/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_msgs.c -o c_code/2_1/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_options.c -o c_code/2_1/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_tables.c -o c_code/2_1/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ropes.c -o c_code/2_1/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_platform.c -o c_code/8_1/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.c -o c_code/2_1/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_macros.c -o c_code/2_1/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lists.c -o c_code/2_1/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strtabs.c -o c_code/2_1/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_osproc.c -o c_code/8_1/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sets.c -o c_code/2_1/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_hashes.c -o c_code/2_1/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_etcpriv.c -o c_code/2_1/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_streams.c -o c_code/2_1/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cpuinfo.c -o c_code/2_1/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_termios.c -o c_code/2_1/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nversion.c -o c_code/2_1/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_condsyms.c -o c_code/2_1/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idents.c -o c_code/2_1/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_wordrecg.c -o c_code/2_1/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_extccomp.c -o c_code/5_1/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_securehash.c -o c_code/2_1/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_json.c -o c_code/2_1/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.c -o c_code/2_1/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.c -o c_code/2_1/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_nimblecmd.c -o c_code/8_1/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.c -o c_code/2_1/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lexer.c -o c_code/2_1/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimlexbase.c -o c_code/2_1/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_llstream.c -o c_code/2_1/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimconf.c -o c_code/2_1/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_main.c -o c_code/2_1/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ast.c -o c_code/2_1/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_astalgo.c -o c_code/2_1/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_syntaxes.c -o c_code/2_1/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_renderer.c -o c_code/2_1/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodread.c -o c_code/2_1/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodwrite.c -o c_code/2_1/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_sem.c -o c_code/8_1/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semdata.c -o c_code/2_1/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passes.c -o c_code/2_1/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_docgen.c -o c_code/2_1/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgen.c -o c_code/2_1/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_jsgen.c -o c_code/2_1/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_importer.c -o c_code/2_1/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_passaux.c -o c_code/2_1/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_depends.c -o c_code/2_1/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_vm.c -o c_code/8_1/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmdef.c -o c_code/2_1/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_types.c -o c_code/2_1/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_idgen.c -o c_code/2_1/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_docgen2.c -o c_code/2_1/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_service.c -o c_code/2_1/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parser.c -o c_code/2_1/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_modules.c -o c_code/2_1/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgutils.c -o c_code/2_1/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sigmatch.c -o c_code/2_1/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_modulegraphs.c -o c_code/2_1/compiler_modulegraphs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_intsets.c -o c_code/2_1/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_rodutils.c -o c_code/2_1/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pbraces.c -o c_code/2_1/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filters.c -o c_code/2_1/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_filter_tmpl.c -o c_code/2_1/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_memfiles.c -o c_code/3_1/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_trees.c -o c_code/2_1/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_magicsys.c -o c_code/2_1/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nimsets.c -o c_code/2_1/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_bitsets.c -o c_code/2_1/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lookups.c -o c_code/2_1/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_prettybase.c -o c_code/2_1/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_treetab.c -o c_code/2_1/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semfold.c -o c_code/2_1/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_procfind.c -o c_code/2_1/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pragmas.c -o c_code/2_1/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semtypinst.c -o c_code/2_1/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_transf.c -o c_code/2_1/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_aliases.c -o c_code/2_1/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgmeth.c -o c_code/2_1/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lambdalifting.c -o c_code/2_1/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_evaltempl.c -o c_code/2_1/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/compiler_patterns.c -o c_code/5_1/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_parampatterns.c -o c_code/2_1/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sempass2.c -o c_code/2_1/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pretty.c -o c_code/2_1/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semmacrosanity.c -o c_code/2_1/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_semparallel.c -o c_code/2_1/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_lowerings.c -o c_code/2_1/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_pluginsupport.c -o c_code/2_1/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_active.c -o c_code/2_1/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_saturate.c -o c_code/2_1/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rstast.c -o c_code/2_1/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_rst.c -o c_code/2_1/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/docutils_rstgen.c -o c_code/8_1/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docutils_highlite.c -o c_code/2_1/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_xmltree.c -o c_code/2_1/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cgi.c -o c_code/2_1/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_typesrenderer.c -o c_code/2_1/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sequtils.c -o c_code/2_1/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_guards.c -o c_code/2_1/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_writetracking.c -o c_code/2_1/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cookies.c -o c_code/2_1/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmgen.c -o c_code/2_1/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmdeps.c -o c_code/2_1/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_vmmarshal.c -o c_code/2_1/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_locals.c -o c_code/2_1/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_itersgen.c -o c_code/2_1/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_cgendata.c -o c_code/2_1/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_ccgmerge.c -o c_code/2_1/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_sighashes.c -o c_code/2_1/compiler_sighashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_md5.c -o c_code/2_1/stdlib_md5.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.c -o c_code/2_1/stdlib_dynlib.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_net.c -o c_code/2_1/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_nativesockets.c -o c_code/2_1/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/compiler_nodejs.c -o c_code/2_1/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/compiler_scriptconfig.c -o c_code/8_1/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/8_1/compiler_nim.o \
c_code/8_1/stdlib_system.o \
c_code/2_1/compiler_commands.o \
c_code/8_1/stdlib_os.o \
c_code/2_1/stdlib_strutils.o \
c_code/2_1/stdlib_parseutils.o \
c_code/2_1/stdlib_math.o \
c_code/2_1/stdlib_algorithm.o \
c_code/2_1/stdlib_times.o \
c_code/3_1/stdlib_posix.o \
c_code/2_1/compiler_msgs.o \
c_code/2_1/compiler_options.o \
c_code/2_1/stdlib_tables.o \
c_code/2_1/compiler_ropes.o \
c_code/8_1/compiler_platform.o \
c_code/2_1/stdlib_terminal.o \
c_code/2_1/stdlib_macros.o \
c_code/2_1/compiler_lists.o \
c_code/2_1/stdlib_strtabs.o \
c_code/8_1/stdlib_osproc.o \
c_code/2_1/stdlib_sets.o \
c_code/2_1/stdlib_hashes.o \
c_code/2_1/stdlib_etcpriv.o \
c_code/2_1/stdlib_streams.o \
c_code/2_1/stdlib_cpuinfo.o \
c_code/2_1/stdlib_termios.o \
c_code/2_1/compiler_nversion.o \
c_code/2_1/compiler_condsyms.o \
c_code/2_1/compiler_idents.o \
c_code/2_1/compiler_wordrecg.o \
c_code/5_1/compiler_extccomp.o \
c_code/2_1/stdlib_securehash.o \
c_code/2_1/stdlib_json.o \
c_code/2_1/stdlib_lexbase.o \
c_code/2_1/stdlib_unicode.o \
c_code/8_1/compiler_nimblecmd.o \
c_code/2_1/stdlib_parseopt.o \
c_code/2_1/compiler_lexer.o \
c_code/2_1/compiler_nimlexbase.o \
c_code/2_1/compiler_llstream.o \
c_code/2_1/compiler_nimconf.o \
c_code/2_1/compiler_main.o \
c_code/2_1/compiler_ast.o \
c_code/2_1/compiler_astalgo.o \
c_code/2_1/compiler_syntaxes.o \
c_code/2_1/compiler_renderer.o \
c_code/2_1/compiler_rodread.o \
c_code/2_1/compiler_rodwrite.o \
c_code/8_1/compiler_sem.o \
c_code/2_1/compiler_semdata.o \
c_code/2_1/compiler_passes.o \
c_code/2_1/compiler_docgen.o \
c_code/2_1/compiler_cgen.o \
c_code/2_1/compiler_jsgen.o \
c_code/2_1/compiler_importer.o \
c_code/2_1/compiler_passaux.o \
c_code/2_1/compiler_depends.o \
c_code/8_1/compiler_vm.o \
c_code/2_1/compiler_vmdef.o \
c_code/2_1/compiler_types.o \
c_code/2_1/compiler_idgen.o \
c_code/2_1/compiler_docgen2.o \
c_code/2_1/compiler_service.o \
c_code/2_1/compiler_parser.o \
c_code/2_1/compiler_modules.o \
c_code/2_1/compiler_ccgutils.o \
c_code/2_1/compiler_sigmatch.o \
c_code/2_1/compiler_modulegraphs.o \
c_code/2_1/stdlib_intsets.o \
c_code/2_1/compiler_rodutils.o \
c_code/2_1/compiler_pbraces.o \
c_code/2_1/compiler_filters.o \
c_code/2_1/compiler_filter_tmpl.o \
c_code/3_1/stdlib_memfiles.o \
c_code/2_1/compiler_trees.o \
c_code/2_1/compiler_magicsys.o \
c_code/2_1/compiler_nimsets.o \
c_code/2_1/compiler_bitsets.o \
c_code/2_1/compiler_lookups.o \
c_code/2_1/compiler_prettybase.o \
c_code/2_1/compiler_treetab.o \
c_code/2_1/compiler_semfold.o \
c_code/2_1/compiler_procfind.o \
c_code/2_1/compiler_pragmas.o \
c_code/2_1/compiler_semtypinst.o \
c_code/2_1/compiler_transf.o \
c_code/2_1/compiler_aliases.o \
c_code/2_1/compiler_cgmeth.o \
c_code/2_1/compiler_lambdalifting.o \
c_code/2_1/compiler_evaltempl.o \
c_code/5_1/compiler_patterns.o \
c_code/2_1/compiler_parampatterns.o \
c_code/2_1/compiler_sempass2.o \
c_code/2_1/compiler_pretty.o \
c_code/2_1/compiler_semmacrosanity.o \
c_code/2_1/compiler_semparallel.o \
c_code/2_1/compiler_lowerings.o \
c_code/2_1/compiler_pluginsupport.o \
c_code/2_1/compiler_active.o \
c_code/2_1/compiler_saturate.o \
c_code/2_1/docutils_rstast.o \
c_code/2_1/docutils_rst.o \
c_code/8_1/docutils_rstgen.o \
c_code/2_1/docutils_highlite.o \
c_code/2_1/stdlib_xmltree.o \
c_code/2_1/stdlib_cgi.o \
c_code/2_1/compiler_typesrenderer.o \
c_code/2_1/stdlib_sequtils.o \
c_code/2_1/compiler_guards.o \
c_code/2_1/compiler_writetracking.o \
c_code/2_1/stdlib_cookies.o \
c_code/2_1/compiler_vmgen.o \
c_code/2_1/compiler_vmdeps.o \
c_code/2_1/compiler_vmmarshal.o \
c_code/2_1/compiler_locals.o \
c_code/2_1/compiler_itersgen.o \
c_code/2_1/compiler_cgendata.o \
c_code/2_1/compiler_ccgmerge.o \
c_code/2_1/compiler_sighashes.o \
c_code/2_1/stdlib_md5.o \
c_code/2_1/stdlib_dynlib.o \
c_code/2_1/stdlib_net.o \
c_code/2_1/stdlib_nativesockets.o \
c_code/2_1/compiler_nodejs.o \
c_code/8_1/compiler_scriptconfig.o $LINK_FLAGS
    ;;
  amd64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_nim.c -o c_code/8_2/compiler_nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_system.c -o c_code/8_2/stdlib_system.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_commands.c -o c_code/2_2/compiler_commands.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_os.c -o c_code/8_2/stdlib_os.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.c -o c_code/2_2/stdlib_strutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.c -o c_code/2_2/stdlib_parseutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.c -o c_code/2_2/stdlib_math.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_algorithm.c -o c_code/2_2/stdlib_algorithm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_times.c -o c_code/2_2/stdlib_times.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_posix.c -o c_code/3_2/stdlib_posix.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_msgs.c -o c_code/2_2/compiler_msgs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_options.c -o c_code/2_2/compiler_options.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_tables.c -o c_code/2_2/stdlib_tables.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ropes.c -o c_code/2_2/compiler_ropes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_platform.c -o c_code/8_2/compiler_platform.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.c -o c_code/2_2/stdlib_terminal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_macros.c -o c_code/2_2/stdlib_macros.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lists.c -o c_code/2_2/compiler_lists.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strtabs.c -o c_code/2_2/stdlib_strtabs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_osproc.c -o c_code/8_2/stdlib_osproc.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sets.c -o c_code/2_2/stdlib_sets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_hashes.c -o c_code/2_2/stdlib_hashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_etcpriv.c -o c_code/2_2/stdlib_etcpriv.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_streams.c -o c_code/2_2/stdlib_streams.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cpuinfo.c -o c_code/2_2/stdlib_cpuinfo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_termios.c -o c_code/2_2/stdlib_termios.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nversion.c -o c_code/2_2/compiler_nversion.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_condsyms.c -o c_code/2_2/compiler_condsyms.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_idents.c -o c_code/2_2/compiler_idents.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_wordrecg.c -o c_code/2_2/compiler_wordrecg.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_extccomp.c -o c_code/5_2/compiler_extccomp.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_securehash.c -o c_code/2_2/stdlib_securehash.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_json.c -o c_code/2_2/stdlib_json.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.c -o c_code/2_2/stdlib_lexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.c -o c_code/2_2/stdlib_unicode.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_nimblecmd.c -o c_code/8_2/compiler_nimblecmd.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.c -o c_code/2_2/stdlib_parseopt.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lexer.c -o c_code/2_2/compiler_lexer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimlexbase.c -o c_code/2_2/compiler_nimlexbase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_llstream.c -o c_code/2_2/compiler_llstream.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimconf.c -o c_code/2_2/compiler_nimconf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_main.c -o c_code/2_2/compiler_main.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ast.c -o c_code/2_2/compiler_ast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_astalgo.c -o c_code/2_2/compiler_astalgo.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_syntaxes.c -o c_code/2_2/compiler_syntaxes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_renderer.c -o c_code/2_2/compiler_renderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodread.c -o c_code/2_2/compiler_rodread.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodwrite.c -o c_code/2_2/compiler_rodwrite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_sem.c -o c_code/8_2/compiler_sem.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semdata.c -o c_code/2_2/compiler_semdata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_passes.c -o c_code/2_2/compiler_passes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_docgen.c -o c_code/2_2/compiler_docgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgen.c -o c_code/2_2/compiler_cgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_jsgen.c -o c_code/2_2/compiler_jsgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_importer.c -o c_code/2_2/compiler_importer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_passaux.c -o c_code/2_2/compiler_passaux.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_depends.c -o c_code/2_2/compiler_depends.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_vm.c -o c_code/8_2/compiler_vm.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmdef.c -o c_code/2_2/compiler_vmdef.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_types.c -o c_code/2_2/compiler_types.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_idgen.c -o c_code/2_2/compiler_idgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_docgen2.c -o c_code/2_2/compiler_docgen2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_service.c -o c_code/2_2/compiler_service.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_parser.c -o c_code/2_2/compiler_parser.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_modules.c -o c_code/2_2/compiler_modules.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ccgutils.c -o c_code/2_2/compiler_ccgutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sigmatch.c -o c_code/2_2/compiler_sigmatch.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_modulegraphs.c -o c_code/2_2/compiler_modulegraphs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_intsets.c -o c_code/2_2/stdlib_intsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_rodutils.c -o c_code/2_2/compiler_rodutils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pbraces.c -o c_code/2_2/compiler_pbraces.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_filters.c -o c_code/2_2/compiler_filters.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_filter_tmpl.c -o c_code/2_2/compiler_filter_tmpl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_memfiles.c -o c_code/3_2/stdlib_memfiles.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_trees.c -o c_code/2_2/compiler_trees.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_magicsys.c -o c_code/2_2/compiler_magicsys.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nimsets.c -o c_code/2_2/compiler_nimsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_bitsets.c -o c_code/2_2/compiler_bitsets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lookups.c -o c_code/2_2/compiler_lookups.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_prettybase.c -o c_code/2_2/compiler_prettybase.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_treetab.c -o c_code/2_2/compiler_treetab.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semfold.c -o c_code/2_2/compiler_semfold.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_procfind.c -o c_code/2_2/compiler_procfind.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pragmas.c -o c_code/2_2/compiler_pragmas.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semtypinst.c -o c_code/2_2/compiler_semtypinst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_transf.c -o c_code/2_2/compiler_transf.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_aliases.c -o c_code/2_2/compiler_aliases.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgmeth.c -o c_code/2_2/compiler_cgmeth.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lambdalifting.c -o c_code/2_2/compiler_lambdalifting.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_evaltempl.c -o c_code/2_2/compiler_evaltempl.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/compiler_patterns.c -o c_code/5_2/compiler_patterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_parampatterns.c -o c_code/2_2/compiler_parampatterns.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sempass2.c -o c_code/2_2/compiler_sempass2.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pretty.c -o c_code/2_2/compiler_pretty.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semmacrosanity.c -o c_code/2_2/compiler_semmacrosanity.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_semparallel.c -o c_code/2_2/compiler_semparallel.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_lowerings.c -o c_code/2_2/compiler_lowerings.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_pluginsupport.c -o c_code/2_2/compiler_pluginsupport.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_active.c -o c_code/2_2/compiler_active.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_saturate.c -o c_code/2_2/compiler_saturate.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rstast.c -o c_code/2_2/docutils_rstast.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_rst.c -o c_code/2_2/docutils_rst.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/docutils_rstgen.c -o c_code/8_2/docutils_rstgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docutils_highlite.c -o c_code/2_2/docutils_highlite.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_xmltree.c -o c_code/2_2/stdlib_xmltree.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cgi.c -o c_code/2_2/stdlib_cgi.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_typesrenderer.c -o c_code/2_2/compiler_typesrenderer.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sequtils.c -o c_code/2_2/stdlib_sequtils.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_guards.c -o c_code/2_2/compiler_guards.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_writetracking.c -o c_code/2_2/compiler_writetracking.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cookies.c -o c_code/2_2/stdlib_cookies.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmgen.c -o c_code/2_2/compiler_vmgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmdeps.c -o c_code/2_2/compiler_vmdeps.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_vmmarshal.c -o c_code/2_2/compiler_vmmarshal.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_locals.c -o c_code/2_2/compiler_locals.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_itersgen.c -o c_code/2_2/compiler_itersgen.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_cgendata.c -o c_code/2_2/compiler_cgendata.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_ccgmerge.c -o c_code/2_2/compiler_ccgmerge.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_sighashes.c -o c_code/2_2/compiler_sighashes.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_md5.c -o c_code/2_2/stdlib_md5.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.c -o c_code/2_2/stdlib_dynlib.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_net.c -o c_code/2_2/stdlib_net.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_nativesockets.c -o c_code/2_2/stdlib_nativesockets.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/compiler_nodejs.c -o c_code/2_2/compiler_nodejs.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/compiler_scriptconfig.c -o c_code/8_2/compiler_scriptconfig.o
    $LINKER -o $binDir/nim  \
c_code/8_2/compiler_nim.o \
c_code/8_2/stdlib_system.o \
c_code/2_2/compiler_commands.o \
c_code/8_2/stdlib_os.o \
c_code/2_2/stdlib_strutils.o \
c_code/2_2/stdlib_parseutils.o \
c_code/2_2/stdlib_math.o \
c_code/2_2/stdlib_algorithm.o \
c_code/2_2/stdlib_times.o \
c_code/3_2/stdlib_posix.o \
c_code/2_2/compiler_msgs.o \
c_code/2_2/compiler_options.o \
c_code/2_2/stdlib_tables.o \
c_code/2_2/compiler_ropes.o \
c_code/8_2/compiler_platform.o \
c_code/2_2/stdlib_terminal.o \
c_code/2_2/stdlib_macros.o \
c_code/2_2/compiler_lists.o \
c_code/2_2/stdlib_strtabs.o \
c_code/8_2/stdlib_osproc.o \
c_code/2_2/stdlib_sets.o \
c_code/2_2/stdlib_hashes.o \
c_code/2_2/stdlib_etcpriv.o \
c_code/2_2/stdlib_streams.o \
c_code/2_2/stdlib_cpuinfo.o \
c_code/2_2/stdlib_termios.o \
c_code/2_2/compiler_nversion.o \
c_code/2_2/compiler_condsyms.o \
c_code/2_2/compiler_idents.o \
c_code/2_2/compiler_wordrecg.o \
c_code/5_2/compiler_extccomp.o \
c_code/2_2/stdlib_securehash.o \
c_code/2_2/stdlib_json.o \
c_code/2_2/stdlib_lexbase.o \
c_code/2_2/stdlib_unicode.o \
c_code/8_2/compiler_nimblecmd.o \
c_code/2_2/stdlib_parseopt.o \
c_code/2_2/compiler_lexer.o \
c_code/2_2/compiler_nimlexbase.o \
c_code/2_2/compiler_llstream.o \
c_code/2_2/compiler_nimconf.o \
c_code/2_2/compiler_main.o \
c_code/2_2/compiler_ast.o \
c_code/2_2/compiler_astalgo.o \
c_code/2_2/compiler_syntaxes.o \
c_code/2_2/compiler_renderer.o \
c_code/2_2/compiler_rodread.o \
c_code/2_2/compiler_rodwrite.o \
c_code/8_2/compiler_sem.o \
c_code/2_2/compiler_semdata.o \
c_code/2_2/compiler_passes.o \
c_code/2_2/compiler_docgen.o \
c_code/2_2/compiler_cgen.o \
c_code/2_2/compiler_jsgen.o \
c_code/2_2/compiler_importer.o \
c_code/2_2/compiler_passaux.o \
c_code/2_2/compiler_depends.o \
c_code/8_2/compiler_vm.o \
c_code/2_2/compiler_vmdef.o \
c_code/2_2/compiler_types.o \
c_code/2_2/compiler_idgen.o \
c_code/2_2/compiler_docgen2.o \
c_code/2_2/compiler_service.o \
c_code/2_2/compiler_parser.o \
c_code/2_2/compiler_modules.o \
c_code/2_2/compiler_ccgutils.o \
c_code/2_2/compiler_sigmatch.o \
c_code/2_2/compiler_modulegraphs.o \
c_code/2_2/stdlib_intsets.o \
c_code/2_2/compiler_rodutils.o \
c_code/2_2/compiler_pbraces.o \
c_code/2_2/compiler_filters.o \
c_code/2_2/compiler_filter_tmpl.o \
c_code/3_2/stdlib_memfiles.o \
c_code/2_2/compiler_trees.o \
c_code/2_2/compiler_magicsys.o \
c_code/2_2/compiler_nimsets.o \
c_code/2_2/compiler_bitsets.o \
c_code/2_2/compiler_lookups.o \
c_code/2_2/compiler_prettybase.o \
c_code/2_2/compiler_treetab.o \
c_code/2_2/compiler_semfold.o \
c_code/2_2/compiler_procfind.o \
c_code/2_2/compiler_pragmas.o \
c_code/2_2/compiler_semtypinst.o \
c_code/2_2/compiler_transf.o \
c_code/2_2/compiler_aliases.o \
c_code/2_2/compiler_cgmeth.o \
c_code/2_2/compiler_lambdalifting.o \
c_code/2_2/compiler_evaltempl.o \
c_code/5_2/compiler_patterns.o \
c_code/2_2/compiler_parampatterns.o \
c_code/2_2/compiler_sempass2.o \
c_code/2_2/compiler_pretty.o \
c_code/2_2/compiler_semmacrosanity.o \
c_code/2_2/compiler_semparallel.o \
c_code/2_2/compiler_lowerings.o \
c_code/2_2/compiler_pluginsupport.o \
c_code/2_2/compiler_active.o \
c_code/2_2/compiler_saturate.o \
c_code/2_2/docutils_rstast.o \
c_code/2_2/docutils_rst.o \
c_code/8_2/docutils_rstgen.o \
c_code/2_2/docutils_highlite.o \
c_code/2_2/stdlib_xmltree.o \
c_code/2_2/stdlib_cgi.o \
c_code/2_2/compiler_typesrenderer.o \
c_code/2_2/stdlib_sequtils.o \
c_code/2_2/compiler_guards.o \
c_code/2_2/compiler_writetracking.o \
c_code/2_2/stdlib_cookies.o \
c_code/2_2/compiler_vmgen.o \
c_code/2_2/compiler_vmdeps.o \
c_code/2_2/compiler_vmmarshal.o \
c_code/2_2/compiler_locals.o \
c_code/2_2/compiler_itersgen.o \
c_code/2_2/compiler_cgendata.o \
c_code/2_2/compiler_ccgmerge.o \
c_code/2_2/compiler_sighashes.o \
c_code/2_2/stdlib_md5.o \
c_code/2_2/stdlib_dynlib.o \
c_code/2_2/stdlib_net.o \
c_code/2_2/stdlib_nativesockets.o \
c_code/2_2/compiler_nodejs.o \
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
  sparc64)
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


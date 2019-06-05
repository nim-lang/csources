#! /bin/sh
# Generated from niminst
# Template is in tools/niminst/buildsh.nimf
# To regenerate run ``niminst csource`` or ``koch csource``

set -e

while :
do
  case "$1" in
    --os)
      optos=$2
      shift 2
      ;;
    --cpu)
      optcpu=$2
      shift 2
      ;;
    --osname)
      optosname=$2
      shift 2
      ;;
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

CC="${CC:-gcc}"
COMP_FLAGS="${CPPFLAGS:-} ${CFLAGS:-} -w -O3 -fno-strict-aliasing$extraBuildArgs"
LINK_FLAGS="${LDFLAGS:-} "
PS4=""
# platform detection
ucpu=`uname -m`
uos=`uname`
uosname=
# bin dir detection
binDir=bin

if [ -s ../koch.nim ]; then
  binDir="../bin"
fi

if [ ! -d $binDir ]; then
  mkdir $binDir
fi

# override OS, CPU and OS Name with command-line arguments
if [ -n "$optos" ]; then
  uos="$optos"
fi
if [ -n "$optcpu" ]; then
  ucpu="$optcpu"
fi
if [ -n "$optcpu" ]; then
  uosname="$optosname"
fi

# convert to lower case:
ucpu=`echo $ucpu | tr "[:upper:]" "[:lower:]"`
uos=`echo $uos | tr "[:upper:]" "[:lower:]"`
uosname=`echo $uosname | tr "[:upper:]" "[:lower:]"`

case $uos in
  *linux* )
    myos="linux"
    LINK_FLAGS="$LINK_FLAGS -ldl -lm -lrt"
    ;;
  *dragonfly* )
    myos="dragonfly"
    LINK_FLAGS="$LINK_FLAGS -lm"
    ;;
  *freebsd* )
    myos="freebsd"
    CC="clang"
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
  *mingw* | *msys* )
    myos="windows"
    ;;
  *android* )
    myos="android"
    LINK_FLAGS="$LINK_FLAGS -ldl -lm -lrt"
    LINK_FLAGS="$LINK_FLAGS -landroid-glob"
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
    if [ "$myos" = "linux" ] ; then
      if [ "$(getconf LONG_BIT)" = "64" ]; then
        mycpu="sparc64"
      elif [ "$(isainfo -b)" = "64" ]; then
        mycpu="sparc64"
      fi
    fi
    ;;
  *ppc64le* )
    mycpu="powerpc64el" ;;
  *ppc64* )
    if [ "$myos" = "linux" ] ; then
      COMP_FLAGS="$COMP_FLAGS -m64"
      LINK_FLAGS="$LINK_FLAGS -m64"
    fi
    mycpu="powerpc64" ;;
  *power*|*ppc* )
    mycpu="powerpc" ;;
  *m68k*)
    mycpu="m68k" ;;
  *mips* )
    mycpu="$("$CC" -dumpmachine | sed 's/-.*//')"
    case $mycpu in
      mips|mipsel|mips64|mips64el)
        ;;
      *)
        echo 2>&1 "Error: unknown MIPS target: $mycpu"
        exit 1
    esac
    ;;
  *alpha* )
    mycpu="alpha" ;;
  *arm*|*armv6l*|*armv71* )
    mycpu="arm" ;;
  *aarch64* )
    mycpu="arm64" ;;
  *riscv64* )
    mycpu="riscv64" ;;
  *)
    echo 2>&1 "Error: unknown processor: $ucpu"
    exit 1
    ;;
esac

case $uosname in
  *android* )
    LINK_FLAGS="$LINK_FLAGS -landroid-glob"
    myosname="android"
    myos="android"
    ;;
esac

# call the compiler:
echo \# OS:  $myos
echo \# CPU: $mycpu

case $myos in
windows)
  case $mycpu in
  i386)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_assertions.nim.c -o c_code/1_1/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_dollars.nim.c -o c_code/1_1/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_widestrs.nim.c -o c_code/1_1/stdlib_widestrs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_io.nim.c -o c_code/1_1/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_system.nim.c -o c_code/1_1/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parseutils.nim.c -o c_code/1_1/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_math.nim.c -o c_code/1_1/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_algorithm.nim.c -o c_code/1_1/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_unicode.nim.c -o c_code/1_1/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strutils.nim.c -o c_code/1_1/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_pathnorm.nim.c -o c_code/1_1/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_dynlib.nim.c -o c_code/1_1/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_winlean.nim.c -o c_code/1_1/stdlib_winlean.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_times.nim.c -o c_code/1_1/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_os.nim.c -o c_code/1_1/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_hashes.nim.c -o c_code/1_1/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strtabs.nim.c -o c_code/1_1/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_streams.nim.c -o c_code/1_1/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cpuinfo.nim.c -o c_code/1_1/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_osproc.nim.c -o c_code/1_1/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sets.nim.c -o c_code/1_1/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/pathutils.nim.c -o c_code/1_1/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ropes.nim.c -o c_code/1_1/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_tables.nim.c -o c_code/1_1/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lineinfos.nim.c -o c_code/1_1/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/platform.nim.c -o c_code/1_1/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/prefixmatches.nim.c -o c_code/1_1/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_terminal.nim.c -o c_code/1_1/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/options.nim.c -o c_code/1_1/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/msgs.nim.c -o c_code/1_1/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/wordrecg.nim.c -o c_code/1_1/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idents.nim.c -o c_code/1_1/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/condsyms.nim.c -o c_code/1_1/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sha1.nim.c -o c_code/1_1/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_lexbase.nim.c -o c_code/1_1/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parsejson.nim.c -o c_code/1_1/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_json.nim.c -o c_code/1_1/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/extccomp.nim.c -o c_code/1_1/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimblecmd.nim.c -o c_code/1_1/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parseopt.nim.c -o c_code/1_1/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/commands.nim.c -o c_code/1_1/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/llstream.nim.c -o c_code/1_1/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimlexbase.nim.c -o c_code/1_1/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lexer.nim.c -o c_code/1_1/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimconf.nim.c -o c_code/1_1/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_intsets.nim.c -o c_code/1_1/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idgen.nim.c -o c_code/1_1/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ast.nim.c -o c_code/1_1/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/rodutils.nim.c -o c_code/1_1/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/astalgo.nim.c -o c_code/1_1/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parser.nim.c -o c_code/1_1/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/renderer.nim.c -o c_code/1_1/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filters.nim.c -o c_code/1_1/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filter__tmpl.nim.c -o c_code/1_1/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/syntaxes.nim.c -o c_code/1_1/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/trees.nim.c -o c_code/1_1/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/types.nim.c -o c_code/1_1/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/treetab.nim.c -o c_code/1_1/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/incremental.nim.c -o c_code/1_1/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/btrees.nim.c -o c_code/1_1/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_md5.nim.c -o c_code/1_1/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulegraphs.nim.c -o c_code/1_1/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/magicsys.nim.c -o c_code/1_1/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/bitsets.nim.c -o c_code/1_1/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimsets.nim.c -o c_code/1_1/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semfold.nim.c -o c_code/1_1/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulepaths.nim.c -o c_code/1_1/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/reorder.nim.c -o c_code/1_1/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passes.nim.c -o c_code/1_1/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdef.nim.c -o c_code/1_1/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semdata.nim.c -o c_code/1_1/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/linter.nim.c -o c_code/1_1/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimfix7prettybase.nim.c -o c_code/1_1/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lookups.nim.c -o c_code/1_1/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semtypinst.nim.c -o c_code/1_1/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parampatterns.nim.c -o c_code/1_1/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lowerings.nim.c -o c_code/1_1/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rstast.nim.c -o c_code/1_1/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rst.nim.c -o c_code/1_1/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7highlite.nim.c -o c_code/1_1/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rstgen.nim.c -o c_code/1_1/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_xmltree.nim.c -o c_code/1_1/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_uri.nim.c -o c_code/1_1/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cgi.nim.c -o c_code/1_1/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/typesrenderer.nim.c -o c_code/1_1/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/docgen.nim.c -o c_code/1_1/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sigmatch.nim.c -o c_code/1_1/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/importer.nim.c -o c_code/1_1/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/procfind.nim.c -o c_code/1_1/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/pragmas.nim.c -o c_code/1_1/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/saturate.nim.c -o c_code/1_1/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/guards.nim.c -o c_code/1_1/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sighashes.nim.c -o c_code/1_1/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sempass2.nim.c -o c_code/1_1/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgmeth.nim.c -o c_code/1_1/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/aliases.nim.c -o c_code/1_1/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/patterns.nim.c -o c_code/1_1/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/dfa.nim.c -o c_code/1_1/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/injectdestructors.nim.c -o c_code/1_1/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/liftlocals.nim.c -o c_code/1_1/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lambdalifting.nim.c -o c_code/1_1/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/closureiters.nim.c -o c_code/1_1/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/transf.nim.c -o c_code/1_1/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmgen.nim.c -o c_code/1_1/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdeps.nim.c -o c_code/1_1/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmmarshal.nim.c -o c_code/1_1/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/gorgeimpl.nim.c -o c_code/1_1/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/macrocacheimpl.nim.c -o c_code/1_1/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/evaltempl.nim.c -o c_code/1_1/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vm.nim.c -o c_code/1_1/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semmacrosanity.nim.c -o c_code/1_1/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/pluginsupport.nim.c -o c_code/1_1/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7locals.nim.c -o c_code/1_1/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7itersgen.nim.c -o c_code/1_1/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7active.nim.c -o c_code/1_1/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semparallel.nim.c -o c_code/1_1/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sem.nim.c -o c_code/1_1/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgutils.nim.c -o c_code/1_1/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ndi.nim.c -o c_code/1_1/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgendata.nim.c -o c_code/1_1/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgmerge.nim.c -o c_code/1_1/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/enumtostr.nim.c -o c_code/1_1/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgen.nim.c -o c_code/1_1/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passaux.nim.c -o c_code/1_1/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/depends.nim.c -o c_code/1_1/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modules.nim.c -o c_code/1_1/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/jsgen.nim.c -o c_code/1_1/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/docgen2.nim.c -o c_code/1_1/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/main.nim.c -o c_code/1_1/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/scriptconfig.nim.c -o c_code/1_1/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cmdlinehelper.nim.c -o c_code/1_1/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nim.nim.c -o c_code/1_1/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_1/stdlib_assertions.nim.o \
c_code/1_1/stdlib_dollars.nim.o \
c_code/1_1/stdlib_widestrs.nim.o \
c_code/1_1/stdlib_io.nim.o \
c_code/1_1/stdlib_system.nim.o \
c_code/1_1/stdlib_parseutils.nim.o \
c_code/1_1/stdlib_math.nim.o \
c_code/1_1/stdlib_algorithm.nim.o \
c_code/1_1/stdlib_unicode.nim.o \
c_code/1_1/stdlib_strutils.nim.o \
c_code/1_1/stdlib_pathnorm.nim.o \
c_code/1_1/stdlib_dynlib.nim.o \
c_code/1_1/stdlib_winlean.nim.o \
c_code/1_1/stdlib_times.nim.o \
c_code/1_1/stdlib_os.nim.o \
c_code/1_1/stdlib_hashes.nim.o \
c_code/1_1/stdlib_strtabs.nim.o \
c_code/1_1/stdlib_streams.nim.o \
c_code/1_1/stdlib_cpuinfo.nim.o \
c_code/1_1/stdlib_osproc.nim.o \
c_code/1_1/stdlib_sets.nim.o \
c_code/1_1/pathutils.nim.o \
c_code/1_1/ropes.nim.o \
c_code/1_1/stdlib_tables.nim.o \
c_code/1_1/lineinfos.nim.o \
c_code/1_1/platform.nim.o \
c_code/1_1/prefixmatches.nim.o \
c_code/1_1/stdlib_terminal.nim.o \
c_code/1_1/options.nim.o \
c_code/1_1/msgs.nim.o \
c_code/1_1/wordrecg.nim.o \
c_code/1_1/idents.nim.o \
c_code/1_1/condsyms.nim.o \
c_code/1_1/stdlib_sha1.nim.o \
c_code/1_1/stdlib_lexbase.nim.o \
c_code/1_1/stdlib_parsejson.nim.o \
c_code/1_1/stdlib_json.nim.o \
c_code/1_1/extccomp.nim.o \
c_code/1_1/nimblecmd.nim.o \
c_code/1_1/stdlib_parseopt.nim.o \
c_code/1_1/commands.nim.o \
c_code/1_1/llstream.nim.o \
c_code/1_1/nimlexbase.nim.o \
c_code/1_1/lexer.nim.o \
c_code/1_1/nimconf.nim.o \
c_code/1_1/stdlib_intsets.nim.o \
c_code/1_1/idgen.nim.o \
c_code/1_1/ast.nim.o \
c_code/1_1/rodutils.nim.o \
c_code/1_1/astalgo.nim.o \
c_code/1_1/parser.nim.o \
c_code/1_1/renderer.nim.o \
c_code/1_1/filters.nim.o \
c_code/1_1/filter__tmpl.nim.o \
c_code/1_1/syntaxes.nim.o \
c_code/1_1/trees.nim.o \
c_code/1_1/types.nim.o \
c_code/1_1/treetab.nim.o \
c_code/1_1/incremental.nim.o \
c_code/1_1/btrees.nim.o \
c_code/1_1/stdlib_md5.nim.o \
c_code/1_1/modulegraphs.nim.o \
c_code/1_1/magicsys.nim.o \
c_code/1_1/bitsets.nim.o \
c_code/1_1/nimsets.nim.o \
c_code/1_1/semfold.nim.o \
c_code/1_1/modulepaths.nim.o \
c_code/1_1/reorder.nim.o \
c_code/1_1/passes.nim.o \
c_code/1_1/vmdef.nim.o \
c_code/1_1/semdata.nim.o \
c_code/1_1/linter.nim.o \
c_code/1_1/nimfix7prettybase.nim.o \
c_code/1_1/lookups.nim.o \
c_code/1_1/semtypinst.nim.o \
c_code/1_1/parampatterns.nim.o \
c_code/1_1/lowerings.nim.o \
c_code/1_1/_7lib7packages7docutils7rstast.nim.o \
c_code/1_1/_7lib7packages7docutils7rst.nim.o \
c_code/1_1/_7lib7packages7docutils7highlite.nim.o \
c_code/1_1/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_1/stdlib_xmltree.nim.o \
c_code/1_1/stdlib_uri.nim.o \
c_code/1_1/stdlib_cgi.nim.o \
c_code/1_1/typesrenderer.nim.o \
c_code/1_1/docgen.nim.o \
c_code/1_1/sigmatch.nim.o \
c_code/1_1/importer.nim.o \
c_code/1_1/procfind.nim.o \
c_code/1_1/pragmas.nim.o \
c_code/1_1/saturate.nim.o \
c_code/1_1/guards.nim.o \
c_code/1_1/sighashes.nim.o \
c_code/1_1/sempass2.nim.o \
c_code/1_1/cgmeth.nim.o \
c_code/1_1/aliases.nim.o \
c_code/1_1/patterns.nim.o \
c_code/1_1/dfa.nim.o \
c_code/1_1/injectdestructors.nim.o \
c_code/1_1/liftlocals.nim.o \
c_code/1_1/lambdalifting.nim.o \
c_code/1_1/closureiters.nim.o \
c_code/1_1/transf.nim.o \
c_code/1_1/vmgen.nim.o \
c_code/1_1/vmdeps.nim.o \
c_code/1_1/vmmarshal.nim.o \
c_code/1_1/gorgeimpl.nim.o \
c_code/1_1/macrocacheimpl.nim.o \
c_code/1_1/evaltempl.nim.o \
c_code/1_1/vm.nim.o \
c_code/1_1/semmacrosanity.nim.o \
c_code/1_1/pluginsupport.nim.o \
c_code/1_1/plugins7locals.nim.o \
c_code/1_1/plugins7itersgen.nim.o \
c_code/1_1/plugins7active.nim.o \
c_code/1_1/semparallel.nim.o \
c_code/1_1/sem.nim.o \
c_code/1_1/ccgutils.nim.o \
c_code/1_1/ndi.nim.o \
c_code/1_1/cgendata.nim.o \
c_code/1_1/ccgmerge.nim.o \
c_code/1_1/enumtostr.nim.o \
c_code/1_1/cgen.nim.o \
c_code/1_1/passaux.nim.o \
c_code/1_1/depends.nim.o \
c_code/1_1/modules.nim.o \
c_code/1_1/jsgen.nim.o \
c_code/1_1/docgen2.nim.o \
c_code/1_1/main.nim.o \
c_code/1_1/scriptconfig.nim.o \
c_code/1_1/cmdlinehelper.nim.o \
c_code/1_1/nim.nim.o $LINK_FLAGS
    ;;
  amd64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_assertions.nim.c -o c_code/1_2/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_dollars.nim.c -o c_code/1_2/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_widestrs.nim.c -o c_code/1_2/stdlib_widestrs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_io.nim.c -o c_code/1_2/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_system.nim.c -o c_code/1_2/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parseutils.nim.c -o c_code/1_2/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_math.nim.c -o c_code/1_2/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_algorithm.nim.c -o c_code/1_2/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_unicode.nim.c -o c_code/1_2/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strutils.nim.c -o c_code/1_2/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_pathnorm.nim.c -o c_code/1_2/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_dynlib.nim.c -o c_code/1_2/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_winlean.nim.c -o c_code/1_2/stdlib_winlean.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_times.nim.c -o c_code/1_2/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_os.nim.c -o c_code/1_2/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_hashes.nim.c -o c_code/1_2/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strtabs.nim.c -o c_code/1_2/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_streams.nim.c -o c_code/1_2/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cpuinfo.nim.c -o c_code/1_2/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_osproc.nim.c -o c_code/1_2/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sets.nim.c -o c_code/1_2/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/pathutils.nim.c -o c_code/1_2/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ropes.nim.c -o c_code/1_2/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_tables.nim.c -o c_code/1_2/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lineinfos.nim.c -o c_code/1_2/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/platform.nim.c -o c_code/1_2/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/prefixmatches.nim.c -o c_code/1_2/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_terminal.nim.c -o c_code/1_2/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/options.nim.c -o c_code/1_2/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/msgs.nim.c -o c_code/1_2/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/wordrecg.nim.c -o c_code/1_2/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idents.nim.c -o c_code/1_2/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/condsyms.nim.c -o c_code/1_2/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sha1.nim.c -o c_code/1_2/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_lexbase.nim.c -o c_code/1_2/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parsejson.nim.c -o c_code/1_2/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_json.nim.c -o c_code/1_2/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/extccomp.nim.c -o c_code/1_2/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimblecmd.nim.c -o c_code/1_2/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parseopt.nim.c -o c_code/1_2/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/commands.nim.c -o c_code/1_2/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/llstream.nim.c -o c_code/1_2/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimlexbase.nim.c -o c_code/1_2/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lexer.nim.c -o c_code/1_2/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimconf.nim.c -o c_code/1_2/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_intsets.nim.c -o c_code/1_2/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idgen.nim.c -o c_code/1_2/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ast.nim.c -o c_code/1_2/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/rodutils.nim.c -o c_code/1_2/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/astalgo.nim.c -o c_code/1_2/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parser.nim.c -o c_code/1_2/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/renderer.nim.c -o c_code/1_2/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filters.nim.c -o c_code/1_2/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filter__tmpl.nim.c -o c_code/1_2/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/syntaxes.nim.c -o c_code/1_2/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/trees.nim.c -o c_code/1_2/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/types.nim.c -o c_code/1_2/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/treetab.nim.c -o c_code/1_2/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/incremental.nim.c -o c_code/1_2/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/btrees.nim.c -o c_code/1_2/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_md5.nim.c -o c_code/1_2/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulegraphs.nim.c -o c_code/1_2/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/magicsys.nim.c -o c_code/1_2/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/bitsets.nim.c -o c_code/1_2/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimsets.nim.c -o c_code/1_2/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semfold.nim.c -o c_code/1_2/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulepaths.nim.c -o c_code/1_2/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/reorder.nim.c -o c_code/1_2/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passes.nim.c -o c_code/1_2/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdef.nim.c -o c_code/1_2/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semdata.nim.c -o c_code/1_2/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/linter.nim.c -o c_code/1_2/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimfix7prettybase.nim.c -o c_code/1_2/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lookups.nim.c -o c_code/1_2/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semtypinst.nim.c -o c_code/1_2/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parampatterns.nim.c -o c_code/1_2/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lowerings.nim.c -o c_code/1_2/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rstast.nim.c -o c_code/1_2/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rst.nim.c -o c_code/1_2/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7highlite.nim.c -o c_code/1_2/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rstgen.nim.c -o c_code/1_2/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_xmltree.nim.c -o c_code/1_2/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_uri.nim.c -o c_code/1_2/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cgi.nim.c -o c_code/1_2/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/typesrenderer.nim.c -o c_code/1_2/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/docgen.nim.c -o c_code/1_2/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sigmatch.nim.c -o c_code/1_2/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/importer.nim.c -o c_code/1_2/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/procfind.nim.c -o c_code/1_2/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/pragmas.nim.c -o c_code/1_2/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/saturate.nim.c -o c_code/1_2/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/guards.nim.c -o c_code/1_2/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sighashes.nim.c -o c_code/1_2/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sempass2.nim.c -o c_code/1_2/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgmeth.nim.c -o c_code/1_2/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/aliases.nim.c -o c_code/1_2/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/patterns.nim.c -o c_code/1_2/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/dfa.nim.c -o c_code/1_2/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/injectdestructors.nim.c -o c_code/1_2/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/liftlocals.nim.c -o c_code/1_2/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lambdalifting.nim.c -o c_code/1_2/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/closureiters.nim.c -o c_code/1_2/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/transf.nim.c -o c_code/1_2/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmgen.nim.c -o c_code/1_2/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdeps.nim.c -o c_code/1_2/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmmarshal.nim.c -o c_code/1_2/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/gorgeimpl.nim.c -o c_code/1_2/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/macrocacheimpl.nim.c -o c_code/1_2/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/evaltempl.nim.c -o c_code/1_2/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vm.nim.c -o c_code/1_2/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semmacrosanity.nim.c -o c_code/1_2/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/pluginsupport.nim.c -o c_code/1_2/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7locals.nim.c -o c_code/1_2/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7itersgen.nim.c -o c_code/1_2/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7active.nim.c -o c_code/1_2/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semparallel.nim.c -o c_code/1_2/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sem.nim.c -o c_code/1_2/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgutils.nim.c -o c_code/1_2/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ndi.nim.c -o c_code/1_2/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgendata.nim.c -o c_code/1_2/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgmerge.nim.c -o c_code/1_2/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/enumtostr.nim.c -o c_code/1_2/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgen.nim.c -o c_code/1_2/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passaux.nim.c -o c_code/1_2/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/depends.nim.c -o c_code/1_2/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modules.nim.c -o c_code/1_2/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/jsgen.nim.c -o c_code/1_2/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/docgen2.nim.c -o c_code/1_2/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/main.nim.c -o c_code/1_2/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/scriptconfig.nim.c -o c_code/1_2/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cmdlinehelper.nim.c -o c_code/1_2/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nim.nim.c -o c_code/1_2/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_2/stdlib_assertions.nim.o \
c_code/1_2/stdlib_dollars.nim.o \
c_code/1_2/stdlib_widestrs.nim.o \
c_code/1_2/stdlib_io.nim.o \
c_code/1_2/stdlib_system.nim.o \
c_code/1_2/stdlib_parseutils.nim.o \
c_code/1_2/stdlib_math.nim.o \
c_code/1_2/stdlib_algorithm.nim.o \
c_code/1_2/stdlib_unicode.nim.o \
c_code/1_2/stdlib_strutils.nim.o \
c_code/1_2/stdlib_pathnorm.nim.o \
c_code/1_2/stdlib_dynlib.nim.o \
c_code/1_2/stdlib_winlean.nim.o \
c_code/1_2/stdlib_times.nim.o \
c_code/1_2/stdlib_os.nim.o \
c_code/1_2/stdlib_hashes.nim.o \
c_code/1_2/stdlib_strtabs.nim.o \
c_code/1_2/stdlib_streams.nim.o \
c_code/1_2/stdlib_cpuinfo.nim.o \
c_code/1_2/stdlib_osproc.nim.o \
c_code/1_2/stdlib_sets.nim.o \
c_code/1_2/pathutils.nim.o \
c_code/1_2/ropes.nim.o \
c_code/1_2/stdlib_tables.nim.o \
c_code/1_2/lineinfos.nim.o \
c_code/1_2/platform.nim.o \
c_code/1_2/prefixmatches.nim.o \
c_code/1_2/stdlib_terminal.nim.o \
c_code/1_2/options.nim.o \
c_code/1_2/msgs.nim.o \
c_code/1_2/wordrecg.nim.o \
c_code/1_2/idents.nim.o \
c_code/1_2/condsyms.nim.o \
c_code/1_2/stdlib_sha1.nim.o \
c_code/1_2/stdlib_lexbase.nim.o \
c_code/1_2/stdlib_parsejson.nim.o \
c_code/1_2/stdlib_json.nim.o \
c_code/1_2/extccomp.nim.o \
c_code/1_2/nimblecmd.nim.o \
c_code/1_2/stdlib_parseopt.nim.o \
c_code/1_2/commands.nim.o \
c_code/1_2/llstream.nim.o \
c_code/1_2/nimlexbase.nim.o \
c_code/1_2/lexer.nim.o \
c_code/1_2/nimconf.nim.o \
c_code/1_2/stdlib_intsets.nim.o \
c_code/1_2/idgen.nim.o \
c_code/1_2/ast.nim.o \
c_code/1_2/rodutils.nim.o \
c_code/1_2/astalgo.nim.o \
c_code/1_2/parser.nim.o \
c_code/1_2/renderer.nim.o \
c_code/1_2/filters.nim.o \
c_code/1_2/filter__tmpl.nim.o \
c_code/1_2/syntaxes.nim.o \
c_code/1_2/trees.nim.o \
c_code/1_2/types.nim.o \
c_code/1_2/treetab.nim.o \
c_code/1_2/incremental.nim.o \
c_code/1_2/btrees.nim.o \
c_code/1_2/stdlib_md5.nim.o \
c_code/1_2/modulegraphs.nim.o \
c_code/1_2/magicsys.nim.o \
c_code/1_2/bitsets.nim.o \
c_code/1_2/nimsets.nim.o \
c_code/1_2/semfold.nim.o \
c_code/1_2/modulepaths.nim.o \
c_code/1_2/reorder.nim.o \
c_code/1_2/passes.nim.o \
c_code/1_2/vmdef.nim.o \
c_code/1_2/semdata.nim.o \
c_code/1_2/linter.nim.o \
c_code/1_2/nimfix7prettybase.nim.o \
c_code/1_2/lookups.nim.o \
c_code/1_2/semtypinst.nim.o \
c_code/1_2/parampatterns.nim.o \
c_code/1_2/lowerings.nim.o \
c_code/1_2/_7lib7packages7docutils7rstast.nim.o \
c_code/1_2/_7lib7packages7docutils7rst.nim.o \
c_code/1_2/_7lib7packages7docutils7highlite.nim.o \
c_code/1_2/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_2/stdlib_xmltree.nim.o \
c_code/1_2/stdlib_uri.nim.o \
c_code/1_2/stdlib_cgi.nim.o \
c_code/1_2/typesrenderer.nim.o \
c_code/1_2/docgen.nim.o \
c_code/1_2/sigmatch.nim.o \
c_code/1_2/importer.nim.o \
c_code/1_2/procfind.nim.o \
c_code/1_2/pragmas.nim.o \
c_code/1_2/saturate.nim.o \
c_code/1_2/guards.nim.o \
c_code/1_2/sighashes.nim.o \
c_code/1_2/sempass2.nim.o \
c_code/1_2/cgmeth.nim.o \
c_code/1_2/aliases.nim.o \
c_code/1_2/patterns.nim.o \
c_code/1_2/dfa.nim.o \
c_code/1_2/injectdestructors.nim.o \
c_code/1_2/liftlocals.nim.o \
c_code/1_2/lambdalifting.nim.o \
c_code/1_2/closureiters.nim.o \
c_code/1_2/transf.nim.o \
c_code/1_2/vmgen.nim.o \
c_code/1_2/vmdeps.nim.o \
c_code/1_2/vmmarshal.nim.o \
c_code/1_2/gorgeimpl.nim.o \
c_code/1_2/macrocacheimpl.nim.o \
c_code/1_2/evaltempl.nim.o \
c_code/1_2/vm.nim.o \
c_code/1_2/semmacrosanity.nim.o \
c_code/1_2/pluginsupport.nim.o \
c_code/1_2/plugins7locals.nim.o \
c_code/1_2/plugins7itersgen.nim.o \
c_code/1_2/plugins7active.nim.o \
c_code/1_2/semparallel.nim.o \
c_code/1_2/sem.nim.o \
c_code/1_2/ccgutils.nim.o \
c_code/1_2/ndi.nim.o \
c_code/1_2/cgendata.nim.o \
c_code/1_2/ccgmerge.nim.o \
c_code/1_2/enumtostr.nim.o \
c_code/1_2/cgen.nim.o \
c_code/1_2/passaux.nim.o \
c_code/1_2/depends.nim.o \
c_code/1_2/modules.nim.o \
c_code/1_2/jsgen.nim.o \
c_code/1_2/docgen2.nim.o \
c_code/1_2/main.nim.o \
c_code/1_2/scriptconfig.nim.o \
c_code/1_2/cmdlinehelper.nim.o \
c_code/1_2/nim.nim.o $LINK_FLAGS
    ;;
  alpha)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  arm)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  m68k)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mipsel)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips64el)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc64el)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  arm64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  riscv64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
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
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_assertions.nim.c -o c_code/1_1/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_dollars.nim.c -o c_code/1_1/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_io.nim.c -o c_code/2_1/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_system.nim.c -o c_code/2_1/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.nim.c -o c_code/2_1/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.nim.c -o c_code/2_1/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_algorithm.nim.c -o c_code/1_1/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.nim.c -o c_code/2_1/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.nim.c -o c_code/2_1/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_pathnorm.nim.c -o c_code/2_1/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_posix.nim.c -o c_code/2_1/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_times.nim.c -o c_code/2_1/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_os.nim.c -o c_code/2_1/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_hashes.nim.c -o c_code/1_1/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strtabs.nim.c -o c_code/1_1/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_streams.nim.c -o c_code/2_1/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cpuinfo.nim.c -o c_code/2_1/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_osproc.nim.c -o c_code/2_1/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sets.nim.c -o c_code/1_1/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pathutils.nim.c -o c_code/2_1/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ropes.nim.c -o c_code/1_1/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_tables.nim.c -o c_code/1_1/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lineinfos.nim.c -o c_code/1_1/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/platform.nim.c -o c_code/2_1/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/prefixmatches.nim.c -o c_code/1_1/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strformat.nim.c -o c_code/2_1/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.nim.c -o c_code/2_1/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/options.nim.c -o c_code/2_1/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/msgs.nim.c -o c_code/2_1/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/wordrecg.nim.c -o c_code/1_1/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idents.nim.c -o c_code/1_1/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/condsyms.nim.c -o c_code/1_1/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sha1.nim.c -o c_code/1_1/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.nim.c -o c_code/2_1/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parsejson.nim.c -o c_code/1_1/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_json.nim.c -o c_code/1_1/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/extccomp.nim.c -o c_code/2_1/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimblecmd.nim.c -o c_code/2_1/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.nim.c -o c_code/2_1/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/commands.nim.c -o c_code/1_1/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/llstream.nim.c -o c_code/1_1/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimlexbase.nim.c -o c_code/1_1/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lexer.nim.c -o c_code/1_1/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimconf.nim.c -o c_code/2_1/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_intsets.nim.c -o c_code/1_1/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idgen.nim.c -o c_code/1_1/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ast.nim.c -o c_code/1_1/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/rodutils.nim.c -o c_code/1_1/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/astalgo.nim.c -o c_code/2_1/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parser.nim.c -o c_code/1_1/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/renderer.nim.c -o c_code/1_1/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filters.nim.c -o c_code/1_1/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filter__tmpl.nim.c -o c_code/1_1/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/syntaxes.nim.c -o c_code/1_1/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/trees.nim.c -o c_code/1_1/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/types.nim.c -o c_code/1_1/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/treetab.nim.c -o c_code/1_1/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/incremental.nim.c -o c_code/1_1/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/btrees.nim.c -o c_code/1_1/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_md5.nim.c -o c_code/1_1/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulegraphs.nim.c -o c_code/1_1/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/magicsys.nim.c -o c_code/1_1/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/bitsets.nim.c -o c_code/1_1/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimsets.nim.c -o c_code/1_1/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semfold.nim.c -o c_code/1_1/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulepaths.nim.c -o c_code/1_1/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/reorder.nim.c -o c_code/1_1/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passes.nim.c -o c_code/1_1/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdef.nim.c -o c_code/1_1/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semdata.nim.c -o c_code/1_1/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/linter.nim.c -o c_code/1_1/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimfix7prettybase.nim.c -o c_code/1_1/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lookups.nim.c -o c_code/1_1/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semtypinst.nim.c -o c_code/1_1/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parampatterns.nim.c -o c_code/1_1/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lowerings.nim.c -o c_code/1_1/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rstast.nim.c -o c_code/1_1/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rst.nim.c -o c_code/1_1/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7highlite.nim.c -o c_code/1_1/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/_7lib7packages7docutils7rstgen.nim.c -o c_code/2_1/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_xmltree.nim.c -o c_code/1_1/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_uri.nim.c -o c_code/1_1/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cgi.nim.c -o c_code/1_1/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/typesrenderer.nim.c -o c_code/1_1/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docgen.nim.c -o c_code/2_1/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sigmatch.nim.c -o c_code/1_1/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/importer.nim.c -o c_code/1_1/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/procfind.nim.c -o c_code/1_1/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pragmas.nim.c -o c_code/2_1/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/saturate.nim.c -o c_code/1_1/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/guards.nim.c -o c_code/1_1/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sighashes.nim.c -o c_code/1_1/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sempass2.nim.c -o c_code/1_1/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgmeth.nim.c -o c_code/1_1/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/aliases.nim.c -o c_code/1_1/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/patterns.nim.c -o c_code/1_1/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/dfa.nim.c -o c_code/1_1/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/injectdestructors.nim.c -o c_code/1_1/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/liftlocals.nim.c -o c_code/1_1/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lambdalifting.nim.c -o c_code/1_1/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/closureiters.nim.c -o c_code/1_1/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/transf.nim.c -o c_code/1_1/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmgen.nim.c -o c_code/1_1/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdeps.nim.c -o c_code/1_1/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmmarshal.nim.c -o c_code/1_1/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/gorgeimpl.nim.c -o c_code/2_1/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/macrocacheimpl.nim.c -o c_code/1_1/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/evaltempl.nim.c -o c_code/1_1/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/vm.nim.c -o c_code/2_1/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semmacrosanity.nim.c -o c_code/1_1/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/pluginsupport.nim.c -o c_code/1_1/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7locals.nim.c -o c_code/1_1/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7itersgen.nim.c -o c_code/1_1/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7active.nim.c -o c_code/1_1/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semparallel.nim.c -o c_code/1_1/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sem.nim.c -o c_code/1_1/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgutils.nim.c -o c_code/1_1/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ndi.nim.c -o c_code/1_1/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgendata.nim.c -o c_code/1_1/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgmerge.nim.c -o c_code/1_1/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/enumtostr.nim.c -o c_code/1_1/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.nim.c -o c_code/2_1/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgen.nim.c -o c_code/1_1/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passaux.nim.c -o c_code/1_1/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/depends.nim.c -o c_code/1_1/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modules.nim.c -o c_code/1_1/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/jsgen.nim.c -o c_code/1_1/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/docgen2.nim.c -o c_code/1_1/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/main.nim.c -o c_code/1_1/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/scriptconfig.nim.c -o c_code/2_1/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/cmdlinehelper.nim.c -o c_code/2_1/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nim.nim.c -o c_code/2_1/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_1/stdlib_assertions.nim.o \
c_code/1_1/stdlib_dollars.nim.o \
c_code/2_1/stdlib_io.nim.o \
c_code/2_1/stdlib_system.nim.o \
c_code/2_1/stdlib_parseutils.nim.o \
c_code/2_1/stdlib_math.nim.o \
c_code/1_1/stdlib_algorithm.nim.o \
c_code/2_1/stdlib_unicode.nim.o \
c_code/2_1/stdlib_strutils.nim.o \
c_code/2_1/stdlib_pathnorm.nim.o \
c_code/2_1/stdlib_posix.nim.o \
c_code/2_1/stdlib_times.nim.o \
c_code/2_1/stdlib_os.nim.o \
c_code/1_1/stdlib_hashes.nim.o \
c_code/1_1/stdlib_strtabs.nim.o \
c_code/2_1/stdlib_streams.nim.o \
c_code/2_1/stdlib_cpuinfo.nim.o \
c_code/2_1/stdlib_osproc.nim.o \
c_code/1_1/stdlib_sets.nim.o \
c_code/2_1/pathutils.nim.o \
c_code/1_1/ropes.nim.o \
c_code/1_1/stdlib_tables.nim.o \
c_code/1_1/lineinfos.nim.o \
c_code/2_1/platform.nim.o \
c_code/1_1/prefixmatches.nim.o \
c_code/2_1/stdlib_strformat.nim.o \
c_code/2_1/stdlib_terminal.nim.o \
c_code/2_1/options.nim.o \
c_code/2_1/msgs.nim.o \
c_code/1_1/wordrecg.nim.o \
c_code/1_1/idents.nim.o \
c_code/1_1/condsyms.nim.o \
c_code/1_1/stdlib_sha1.nim.o \
c_code/2_1/stdlib_lexbase.nim.o \
c_code/1_1/stdlib_parsejson.nim.o \
c_code/1_1/stdlib_json.nim.o \
c_code/2_1/extccomp.nim.o \
c_code/2_1/nimblecmd.nim.o \
c_code/2_1/stdlib_parseopt.nim.o \
c_code/1_1/commands.nim.o \
c_code/1_1/llstream.nim.o \
c_code/1_1/nimlexbase.nim.o \
c_code/1_1/lexer.nim.o \
c_code/2_1/nimconf.nim.o \
c_code/1_1/stdlib_intsets.nim.o \
c_code/1_1/idgen.nim.o \
c_code/1_1/ast.nim.o \
c_code/1_1/rodutils.nim.o \
c_code/2_1/astalgo.nim.o \
c_code/1_1/parser.nim.o \
c_code/1_1/renderer.nim.o \
c_code/1_1/filters.nim.o \
c_code/1_1/filter__tmpl.nim.o \
c_code/1_1/syntaxes.nim.o \
c_code/1_1/trees.nim.o \
c_code/1_1/types.nim.o \
c_code/1_1/treetab.nim.o \
c_code/1_1/incremental.nim.o \
c_code/1_1/btrees.nim.o \
c_code/1_1/stdlib_md5.nim.o \
c_code/1_1/modulegraphs.nim.o \
c_code/1_1/magicsys.nim.o \
c_code/1_1/bitsets.nim.o \
c_code/1_1/nimsets.nim.o \
c_code/1_1/semfold.nim.o \
c_code/1_1/modulepaths.nim.o \
c_code/1_1/reorder.nim.o \
c_code/1_1/passes.nim.o \
c_code/1_1/vmdef.nim.o \
c_code/1_1/semdata.nim.o \
c_code/1_1/linter.nim.o \
c_code/1_1/nimfix7prettybase.nim.o \
c_code/1_1/lookups.nim.o \
c_code/1_1/semtypinst.nim.o \
c_code/1_1/parampatterns.nim.o \
c_code/1_1/lowerings.nim.o \
c_code/1_1/_7lib7packages7docutils7rstast.nim.o \
c_code/1_1/_7lib7packages7docutils7rst.nim.o \
c_code/1_1/_7lib7packages7docutils7highlite.nim.o \
c_code/2_1/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_1/stdlib_xmltree.nim.o \
c_code/1_1/stdlib_uri.nim.o \
c_code/1_1/stdlib_cgi.nim.o \
c_code/1_1/typesrenderer.nim.o \
c_code/2_1/docgen.nim.o \
c_code/1_1/sigmatch.nim.o \
c_code/1_1/importer.nim.o \
c_code/1_1/procfind.nim.o \
c_code/2_1/pragmas.nim.o \
c_code/1_1/saturate.nim.o \
c_code/1_1/guards.nim.o \
c_code/1_1/sighashes.nim.o \
c_code/1_1/sempass2.nim.o \
c_code/1_1/cgmeth.nim.o \
c_code/1_1/aliases.nim.o \
c_code/1_1/patterns.nim.o \
c_code/1_1/dfa.nim.o \
c_code/1_1/injectdestructors.nim.o \
c_code/1_1/liftlocals.nim.o \
c_code/1_1/lambdalifting.nim.o \
c_code/1_1/closureiters.nim.o \
c_code/1_1/transf.nim.o \
c_code/1_1/vmgen.nim.o \
c_code/1_1/vmdeps.nim.o \
c_code/1_1/vmmarshal.nim.o \
c_code/2_1/gorgeimpl.nim.o \
c_code/1_1/macrocacheimpl.nim.o \
c_code/1_1/evaltempl.nim.o \
c_code/2_1/vm.nim.o \
c_code/1_1/semmacrosanity.nim.o \
c_code/1_1/pluginsupport.nim.o \
c_code/1_1/plugins7locals.nim.o \
c_code/1_1/plugins7itersgen.nim.o \
c_code/1_1/plugins7active.nim.o \
c_code/1_1/semparallel.nim.o \
c_code/1_1/sem.nim.o \
c_code/1_1/ccgutils.nim.o \
c_code/1_1/ndi.nim.o \
c_code/1_1/cgendata.nim.o \
c_code/1_1/ccgmerge.nim.o \
c_code/1_1/enumtostr.nim.o \
c_code/2_1/stdlib_dynlib.nim.o \
c_code/1_1/cgen.nim.o \
c_code/1_1/passaux.nim.o \
c_code/1_1/depends.nim.o \
c_code/1_1/modules.nim.o \
c_code/1_1/jsgen.nim.o \
c_code/1_1/docgen2.nim.o \
c_code/1_1/main.nim.o \
c_code/2_1/scriptconfig.nim.o \
c_code/2_1/cmdlinehelper.nim.o \
c_code/2_1/nim.nim.o $LINK_FLAGS
    ;;
  amd64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_assertions.nim.c -o c_code/1_2/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_dollars.nim.c -o c_code/1_2/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_io.nim.c -o c_code/2_2/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_system.nim.c -o c_code/2_2/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.nim.c -o c_code/2_2/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.nim.c -o c_code/2_2/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_algorithm.nim.c -o c_code/1_2/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.nim.c -o c_code/2_2/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.nim.c -o c_code/2_2/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_pathnorm.nim.c -o c_code/2_2/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_posix.nim.c -o c_code/2_2/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_times.nim.c -o c_code/2_2/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_os.nim.c -o c_code/2_2/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_hashes.nim.c -o c_code/1_2/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strtabs.nim.c -o c_code/1_2/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_streams.nim.c -o c_code/2_2/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cpuinfo.nim.c -o c_code/2_2/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_osproc.nim.c -o c_code/2_2/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sets.nim.c -o c_code/1_2/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/pathutils.nim.c -o c_code/2_2/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ropes.nim.c -o c_code/1_2/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_tables.nim.c -o c_code/1_2/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lineinfos.nim.c -o c_code/1_2/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/platform.nim.c -o c_code/2_2/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/prefixmatches.nim.c -o c_code/1_2/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strformat.nim.c -o c_code/2_2/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.nim.c -o c_code/2_2/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/options.nim.c -o c_code/2_2/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/msgs.nim.c -o c_code/2_2/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/wordrecg.nim.c -o c_code/1_2/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idents.nim.c -o c_code/1_2/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/condsyms.nim.c -o c_code/1_2/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sha1.nim.c -o c_code/1_2/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.nim.c -o c_code/2_2/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parsejson.nim.c -o c_code/1_2/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_json.nim.c -o c_code/2_2/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/extccomp.nim.c -o c_code/2_2/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimblecmd.nim.c -o c_code/2_2/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.nim.c -o c_code/2_2/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/commands.nim.c -o c_code/2_2/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/llstream.nim.c -o c_code/1_2/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimlexbase.nim.c -o c_code/1_2/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/lexer.nim.c -o c_code/2_2/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimconf.nim.c -o c_code/2_2/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_intsets.nim.c -o c_code/1_2/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idgen.nim.c -o c_code/1_2/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ast.nim.c -o c_code/1_2/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/rodutils.nim.c -o c_code/1_2/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/astalgo.nim.c -o c_code/2_2/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parser.nim.c -o c_code/1_2/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/renderer.nim.c -o c_code/1_2/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filters.nim.c -o c_code/1_2/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filter__tmpl.nim.c -o c_code/1_2/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/syntaxes.nim.c -o c_code/1_2/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/trees.nim.c -o c_code/1_2/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/types.nim.c -o c_code/2_2/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/treetab.nim.c -o c_code/1_2/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/incremental.nim.c -o c_code/1_2/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/btrees.nim.c -o c_code/1_2/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_md5.nim.c -o c_code/1_2/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulegraphs.nim.c -o c_code/1_2/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/magicsys.nim.c -o c_code/1_2/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/bitsets.nim.c -o c_code/1_2/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimsets.nim.c -o c_code/1_2/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/semfold.nim.c -o c_code/2_2/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/modulepaths.nim.c -o c_code/2_2/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/reorder.nim.c -o c_code/1_2/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passes.nim.c -o c_code/1_2/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdef.nim.c -o c_code/1_2/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semdata.nim.c -o c_code/1_2/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/linter.nim.c -o c_code/1_2/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimfix7prettybase.nim.c -o c_code/1_2/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lookups.nim.c -o c_code/1_2/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semtypinst.nim.c -o c_code/1_2/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parampatterns.nim.c -o c_code/1_2/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lowerings.nim.c -o c_code/1_2/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rstast.nim.c -o c_code/1_2/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rst.nim.c -o c_code/1_2/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7highlite.nim.c -o c_code/1_2/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/_7lib7packages7docutils7rstgen.nim.c -o c_code/2_2/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_xmltree.nim.c -o c_code/1_2/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_uri.nim.c -o c_code/1_2/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cgi.nim.c -o c_code/1_2/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/typesrenderer.nim.c -o c_code/1_2/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docgen.nim.c -o c_code/2_2/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/sigmatch.nim.c -o c_code/2_2/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/importer.nim.c -o c_code/1_2/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/procfind.nim.c -o c_code/1_2/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/pragmas.nim.c -o c_code/2_2/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/saturate.nim.c -o c_code/1_2/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/guards.nim.c -o c_code/1_2/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sighashes.nim.c -o c_code/1_2/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sempass2.nim.c -o c_code/1_2/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgmeth.nim.c -o c_code/1_2/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/aliases.nim.c -o c_code/1_2/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/patterns.nim.c -o c_code/1_2/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/dfa.nim.c -o c_code/1_2/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/injectdestructors.nim.c -o c_code/1_2/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/liftlocals.nim.c -o c_code/1_2/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lambdalifting.nim.c -o c_code/1_2/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/closureiters.nim.c -o c_code/1_2/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/transf.nim.c -o c_code/1_2/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmgen.nim.c -o c_code/1_2/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/vmdeps.nim.c -o c_code/2_2/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmmarshal.nim.c -o c_code/1_2/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/gorgeimpl.nim.c -o c_code/2_2/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/macrocacheimpl.nim.c -o c_code/1_2/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/evaltempl.nim.c -o c_code/1_2/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/vm.nim.c -o c_code/2_2/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semmacrosanity.nim.c -o c_code/1_2/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/pluginsupport.nim.c -o c_code/1_2/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7locals.nim.c -o c_code/1_2/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7itersgen.nim.c -o c_code/1_2/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7active.nim.c -o c_code/1_2/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semparallel.nim.c -o c_code/1_2/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/sem.nim.c -o c_code/2_2/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgutils.nim.c -o c_code/1_2/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ndi.nim.c -o c_code/1_2/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgendata.nim.c -o c_code/1_2/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgmerge.nim.c -o c_code/1_2/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/enumtostr.nim.c -o c_code/1_2/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.nim.c -o c_code/2_2/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgen.nim.c -o c_code/1_2/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passaux.nim.c -o c_code/1_2/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/depends.nim.c -o c_code/1_2/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modules.nim.c -o c_code/1_2/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/jsgen.nim.c -o c_code/1_2/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docgen2.nim.c -o c_code/2_2/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/main.nim.c -o c_code/1_2/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/scriptconfig.nim.c -o c_code/2_2/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/cmdlinehelper.nim.c -o c_code/2_2/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nim.nim.c -o c_code/2_2/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_2/stdlib_assertions.nim.o \
c_code/1_2/stdlib_dollars.nim.o \
c_code/2_2/stdlib_io.nim.o \
c_code/2_2/stdlib_system.nim.o \
c_code/2_2/stdlib_parseutils.nim.o \
c_code/2_2/stdlib_math.nim.o \
c_code/1_2/stdlib_algorithm.nim.o \
c_code/2_2/stdlib_unicode.nim.o \
c_code/2_2/stdlib_strutils.nim.o \
c_code/2_2/stdlib_pathnorm.nim.o \
c_code/2_2/stdlib_posix.nim.o \
c_code/2_2/stdlib_times.nim.o \
c_code/2_2/stdlib_os.nim.o \
c_code/1_2/stdlib_hashes.nim.o \
c_code/1_2/stdlib_strtabs.nim.o \
c_code/2_2/stdlib_streams.nim.o \
c_code/2_2/stdlib_cpuinfo.nim.o \
c_code/2_2/stdlib_osproc.nim.o \
c_code/1_2/stdlib_sets.nim.o \
c_code/2_2/pathutils.nim.o \
c_code/1_2/ropes.nim.o \
c_code/1_2/stdlib_tables.nim.o \
c_code/1_2/lineinfos.nim.o \
c_code/2_2/platform.nim.o \
c_code/1_2/prefixmatches.nim.o \
c_code/2_2/stdlib_strformat.nim.o \
c_code/2_2/stdlib_terminal.nim.o \
c_code/2_2/options.nim.o \
c_code/2_2/msgs.nim.o \
c_code/1_2/wordrecg.nim.o \
c_code/1_2/idents.nim.o \
c_code/1_2/condsyms.nim.o \
c_code/1_2/stdlib_sha1.nim.o \
c_code/2_2/stdlib_lexbase.nim.o \
c_code/1_2/stdlib_parsejson.nim.o \
c_code/2_2/stdlib_json.nim.o \
c_code/2_2/extccomp.nim.o \
c_code/2_2/nimblecmd.nim.o \
c_code/2_2/stdlib_parseopt.nim.o \
c_code/2_2/commands.nim.o \
c_code/1_2/llstream.nim.o \
c_code/1_2/nimlexbase.nim.o \
c_code/2_2/lexer.nim.o \
c_code/2_2/nimconf.nim.o \
c_code/1_2/stdlib_intsets.nim.o \
c_code/1_2/idgen.nim.o \
c_code/1_2/ast.nim.o \
c_code/1_2/rodutils.nim.o \
c_code/2_2/astalgo.nim.o \
c_code/1_2/parser.nim.o \
c_code/1_2/renderer.nim.o \
c_code/1_2/filters.nim.o \
c_code/1_2/filter__tmpl.nim.o \
c_code/1_2/syntaxes.nim.o \
c_code/1_2/trees.nim.o \
c_code/2_2/types.nim.o \
c_code/1_2/treetab.nim.o \
c_code/1_2/incremental.nim.o \
c_code/1_2/btrees.nim.o \
c_code/1_2/stdlib_md5.nim.o \
c_code/1_2/modulegraphs.nim.o \
c_code/1_2/magicsys.nim.o \
c_code/1_2/bitsets.nim.o \
c_code/1_2/nimsets.nim.o \
c_code/2_2/semfold.nim.o \
c_code/2_2/modulepaths.nim.o \
c_code/1_2/reorder.nim.o \
c_code/1_2/passes.nim.o \
c_code/1_2/vmdef.nim.o \
c_code/1_2/semdata.nim.o \
c_code/1_2/linter.nim.o \
c_code/1_2/nimfix7prettybase.nim.o \
c_code/1_2/lookups.nim.o \
c_code/1_2/semtypinst.nim.o \
c_code/1_2/parampatterns.nim.o \
c_code/1_2/lowerings.nim.o \
c_code/1_2/_7lib7packages7docutils7rstast.nim.o \
c_code/1_2/_7lib7packages7docutils7rst.nim.o \
c_code/1_2/_7lib7packages7docutils7highlite.nim.o \
c_code/2_2/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_2/stdlib_xmltree.nim.o \
c_code/1_2/stdlib_uri.nim.o \
c_code/1_2/stdlib_cgi.nim.o \
c_code/1_2/typesrenderer.nim.o \
c_code/2_2/docgen.nim.o \
c_code/2_2/sigmatch.nim.o \
c_code/1_2/importer.nim.o \
c_code/1_2/procfind.nim.o \
c_code/2_2/pragmas.nim.o \
c_code/1_2/saturate.nim.o \
c_code/1_2/guards.nim.o \
c_code/1_2/sighashes.nim.o \
c_code/1_2/sempass2.nim.o \
c_code/1_2/cgmeth.nim.o \
c_code/1_2/aliases.nim.o \
c_code/1_2/patterns.nim.o \
c_code/1_2/dfa.nim.o \
c_code/1_2/injectdestructors.nim.o \
c_code/1_2/liftlocals.nim.o \
c_code/1_2/lambdalifting.nim.o \
c_code/1_2/closureiters.nim.o \
c_code/1_2/transf.nim.o \
c_code/1_2/vmgen.nim.o \
c_code/2_2/vmdeps.nim.o \
c_code/1_2/vmmarshal.nim.o \
c_code/2_2/gorgeimpl.nim.o \
c_code/1_2/macrocacheimpl.nim.o \
c_code/1_2/evaltempl.nim.o \
c_code/2_2/vm.nim.o \
c_code/1_2/semmacrosanity.nim.o \
c_code/1_2/pluginsupport.nim.o \
c_code/1_2/plugins7locals.nim.o \
c_code/1_2/plugins7itersgen.nim.o \
c_code/1_2/plugins7active.nim.o \
c_code/1_2/semparallel.nim.o \
c_code/2_2/sem.nim.o \
c_code/1_2/ccgutils.nim.o \
c_code/1_2/ndi.nim.o \
c_code/1_2/cgendata.nim.o \
c_code/1_2/ccgmerge.nim.o \
c_code/1_2/enumtostr.nim.o \
c_code/2_2/stdlib_dynlib.nim.o \
c_code/1_2/cgen.nim.o \
c_code/1_2/passaux.nim.o \
c_code/1_2/depends.nim.o \
c_code/1_2/modules.nim.o \
c_code/1_2/jsgen.nim.o \
c_code/2_2/docgen2.nim.o \
c_code/1_2/main.nim.o \
c_code/2_2/scriptconfig.nim.o \
c_code/2_2/cmdlinehelper.nim.o \
c_code/2_2/nim.nim.o $LINK_FLAGS
    ;;
  alpha)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_assertions.nim.c -o c_code/1_2/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_dollars.nim.c -o c_code/1_2/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_io.nim.c -o c_code/2_3/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_system.nim.c -o c_code/2_3/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.nim.c -o c_code/2_2/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.nim.c -o c_code/2_2/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_algorithm.nim.c -o c_code/1_2/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.nim.c -o c_code/2_2/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.nim.c -o c_code/2_2/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_pathnorm.nim.c -o c_code/2_2/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_posix.nim.c -o c_code/2_3/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_times.nim.c -o c_code/2_2/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_os.nim.c -o c_code/2_3/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_hashes.nim.c -o c_code/1_2/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strtabs.nim.c -o c_code/1_2/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_streams.nim.c -o c_code/2_3/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_cpuinfo.nim.c -o c_code/2_3/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_osproc.nim.c -o c_code/2_3/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sets.nim.c -o c_code/1_2/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/pathutils.nim.c -o c_code/2_2/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ropes.nim.c -o c_code/1_2/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_tables.nim.c -o c_code/1_2/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lineinfos.nim.c -o c_code/1_2/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/platform.nim.c -o c_code/2_3/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/prefixmatches.nim.c -o c_code/1_2/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strformat.nim.c -o c_code/2_2/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.nim.c -o c_code/2_2/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/options.nim.c -o c_code/2_3/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/msgs.nim.c -o c_code/2_3/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/wordrecg.nim.c -o c_code/1_2/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idents.nim.c -o c_code/1_2/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/condsyms.nim.c -o c_code/1_2/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sha1.nim.c -o c_code/1_2/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.nim.c -o c_code/2_2/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parsejson.nim.c -o c_code/1_2/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_json.nim.c -o c_code/1_2/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/extccomp.nim.c -o c_code/2_3/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/nimblecmd.nim.c -o c_code/2_3/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.nim.c -o c_code/2_2/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/commands.nim.c -o c_code/1_2/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/llstream.nim.c -o c_code/1_2/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimlexbase.nim.c -o c_code/1_2/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lexer.nim.c -o c_code/1_2/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimconf.nim.c -o c_code/2_2/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_intsets.nim.c -o c_code/1_2/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idgen.nim.c -o c_code/1_2/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ast.nim.c -o c_code/1_2/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/rodutils.nim.c -o c_code/1_2/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/astalgo.nim.c -o c_code/2_2/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parser.nim.c -o c_code/1_2/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/renderer.nim.c -o c_code/1_2/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filters.nim.c -o c_code/1_2/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filter__tmpl.nim.c -o c_code/1_2/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/syntaxes.nim.c -o c_code/1_2/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/trees.nim.c -o c_code/1_2/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/types.nim.c -o c_code/1_2/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/treetab.nim.c -o c_code/1_2/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/incremental.nim.c -o c_code/1_2/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/btrees.nim.c -o c_code/1_2/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_md5.nim.c -o c_code/1_2/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulegraphs.nim.c -o c_code/1_2/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/magicsys.nim.c -o c_code/1_2/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/bitsets.nim.c -o c_code/1_2/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimsets.nim.c -o c_code/1_2/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semfold.nim.c -o c_code/1_2/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulepaths.nim.c -o c_code/1_2/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/reorder.nim.c -o c_code/1_2/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passes.nim.c -o c_code/1_2/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdef.nim.c -o c_code/1_2/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semdata.nim.c -o c_code/1_2/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/linter.nim.c -o c_code/1_2/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimfix7prettybase.nim.c -o c_code/1_2/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lookups.nim.c -o c_code/1_2/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semtypinst.nim.c -o c_code/1_2/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parampatterns.nim.c -o c_code/1_2/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lowerings.nim.c -o c_code/1_2/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rstast.nim.c -o c_code/1_2/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rst.nim.c -o c_code/1_2/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7highlite.nim.c -o c_code/1_2/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/_7lib7packages7docutils7rstgen.nim.c -o c_code/2_3/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_xmltree.nim.c -o c_code/1_2/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_uri.nim.c -o c_code/1_2/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cgi.nim.c -o c_code/1_2/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/typesrenderer.nim.c -o c_code/1_2/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docgen.nim.c -o c_code/2_2/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sigmatch.nim.c -o c_code/1_2/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/importer.nim.c -o c_code/1_2/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/procfind.nim.c -o c_code/1_2/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/pragmas.nim.c -o c_code/2_3/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/saturate.nim.c -o c_code/1_2/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/guards.nim.c -o c_code/1_2/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sighashes.nim.c -o c_code/1_2/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sempass2.nim.c -o c_code/1_2/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgmeth.nim.c -o c_code/1_2/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/aliases.nim.c -o c_code/1_2/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/patterns.nim.c -o c_code/1_2/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/dfa.nim.c -o c_code/1_2/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/injectdestructors.nim.c -o c_code/1_2/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/liftlocals.nim.c -o c_code/1_2/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lambdalifting.nim.c -o c_code/1_2/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/closureiters.nim.c -o c_code/1_2/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/transf.nim.c -o c_code/1_2/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmgen.nim.c -o c_code/1_2/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdeps.nim.c -o c_code/1_2/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmmarshal.nim.c -o c_code/1_2/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/gorgeimpl.nim.c -o c_code/2_3/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/macrocacheimpl.nim.c -o c_code/1_2/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/evaltempl.nim.c -o c_code/1_2/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/vm.nim.c -o c_code/2_3/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semmacrosanity.nim.c -o c_code/1_2/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/pluginsupport.nim.c -o c_code/1_2/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7locals.nim.c -o c_code/1_2/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7itersgen.nim.c -o c_code/1_2/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7active.nim.c -o c_code/1_2/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semparallel.nim.c -o c_code/1_2/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sem.nim.c -o c_code/1_2/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgutils.nim.c -o c_code/1_2/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ndi.nim.c -o c_code/1_2/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgendata.nim.c -o c_code/1_2/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgmerge.nim.c -o c_code/1_2/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/enumtostr.nim.c -o c_code/1_2/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.nim.c -o c_code/2_2/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgen.nim.c -o c_code/1_2/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passaux.nim.c -o c_code/1_2/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/depends.nim.c -o c_code/1_2/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modules.nim.c -o c_code/1_2/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/jsgen.nim.c -o c_code/1_2/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/docgen2.nim.c -o c_code/1_2/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/main.nim.c -o c_code/1_2/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/scriptconfig.nim.c -o c_code/2_3/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/cmdlinehelper.nim.c -o c_code/2_3/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nim.nim.c -o c_code/2_2/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_2/stdlib_assertions.nim.o \
c_code/1_2/stdlib_dollars.nim.o \
c_code/2_3/stdlib_io.nim.o \
c_code/2_3/stdlib_system.nim.o \
c_code/2_2/stdlib_parseutils.nim.o \
c_code/2_2/stdlib_math.nim.o \
c_code/1_2/stdlib_algorithm.nim.o \
c_code/2_2/stdlib_unicode.nim.o \
c_code/2_2/stdlib_strutils.nim.o \
c_code/2_2/stdlib_pathnorm.nim.o \
c_code/2_3/stdlib_posix.nim.o \
c_code/2_2/stdlib_times.nim.o \
c_code/2_3/stdlib_os.nim.o \
c_code/1_2/stdlib_hashes.nim.o \
c_code/1_2/stdlib_strtabs.nim.o \
c_code/2_3/stdlib_streams.nim.o \
c_code/2_3/stdlib_cpuinfo.nim.o \
c_code/2_3/stdlib_osproc.nim.o \
c_code/1_2/stdlib_sets.nim.o \
c_code/2_2/pathutils.nim.o \
c_code/1_2/ropes.nim.o \
c_code/1_2/stdlib_tables.nim.o \
c_code/1_2/lineinfos.nim.o \
c_code/2_3/platform.nim.o \
c_code/1_2/prefixmatches.nim.o \
c_code/2_2/stdlib_strformat.nim.o \
c_code/2_2/stdlib_terminal.nim.o \
c_code/2_3/options.nim.o \
c_code/2_3/msgs.nim.o \
c_code/1_2/wordrecg.nim.o \
c_code/1_2/idents.nim.o \
c_code/1_2/condsyms.nim.o \
c_code/1_2/stdlib_sha1.nim.o \
c_code/2_2/stdlib_lexbase.nim.o \
c_code/1_2/stdlib_parsejson.nim.o \
c_code/1_2/stdlib_json.nim.o \
c_code/2_3/extccomp.nim.o \
c_code/2_3/nimblecmd.nim.o \
c_code/2_2/stdlib_parseopt.nim.o \
c_code/1_2/commands.nim.o \
c_code/1_2/llstream.nim.o \
c_code/1_2/nimlexbase.nim.o \
c_code/1_2/lexer.nim.o \
c_code/2_2/nimconf.nim.o \
c_code/1_2/stdlib_intsets.nim.o \
c_code/1_2/idgen.nim.o \
c_code/1_2/ast.nim.o \
c_code/1_2/rodutils.nim.o \
c_code/2_2/astalgo.nim.o \
c_code/1_2/parser.nim.o \
c_code/1_2/renderer.nim.o \
c_code/1_2/filters.nim.o \
c_code/1_2/filter__tmpl.nim.o \
c_code/1_2/syntaxes.nim.o \
c_code/1_2/trees.nim.o \
c_code/1_2/types.nim.o \
c_code/1_2/treetab.nim.o \
c_code/1_2/incremental.nim.o \
c_code/1_2/btrees.nim.o \
c_code/1_2/stdlib_md5.nim.o \
c_code/1_2/modulegraphs.nim.o \
c_code/1_2/magicsys.nim.o \
c_code/1_2/bitsets.nim.o \
c_code/1_2/nimsets.nim.o \
c_code/1_2/semfold.nim.o \
c_code/1_2/modulepaths.nim.o \
c_code/1_2/reorder.nim.o \
c_code/1_2/passes.nim.o \
c_code/1_2/vmdef.nim.o \
c_code/1_2/semdata.nim.o \
c_code/1_2/linter.nim.o \
c_code/1_2/nimfix7prettybase.nim.o \
c_code/1_2/lookups.nim.o \
c_code/1_2/semtypinst.nim.o \
c_code/1_2/parampatterns.nim.o \
c_code/1_2/lowerings.nim.o \
c_code/1_2/_7lib7packages7docutils7rstast.nim.o \
c_code/1_2/_7lib7packages7docutils7rst.nim.o \
c_code/1_2/_7lib7packages7docutils7highlite.nim.o \
c_code/2_3/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_2/stdlib_xmltree.nim.o \
c_code/1_2/stdlib_uri.nim.o \
c_code/1_2/stdlib_cgi.nim.o \
c_code/1_2/typesrenderer.nim.o \
c_code/2_2/docgen.nim.o \
c_code/1_2/sigmatch.nim.o \
c_code/1_2/importer.nim.o \
c_code/1_2/procfind.nim.o \
c_code/2_3/pragmas.nim.o \
c_code/1_2/saturate.nim.o \
c_code/1_2/guards.nim.o \
c_code/1_2/sighashes.nim.o \
c_code/1_2/sempass2.nim.o \
c_code/1_2/cgmeth.nim.o \
c_code/1_2/aliases.nim.o \
c_code/1_2/patterns.nim.o \
c_code/1_2/dfa.nim.o \
c_code/1_2/injectdestructors.nim.o \
c_code/1_2/liftlocals.nim.o \
c_code/1_2/lambdalifting.nim.o \
c_code/1_2/closureiters.nim.o \
c_code/1_2/transf.nim.o \
c_code/1_2/vmgen.nim.o \
c_code/1_2/vmdeps.nim.o \
c_code/1_2/vmmarshal.nim.o \
c_code/2_3/gorgeimpl.nim.o \
c_code/1_2/macrocacheimpl.nim.o \
c_code/1_2/evaltempl.nim.o \
c_code/2_3/vm.nim.o \
c_code/1_2/semmacrosanity.nim.o \
c_code/1_2/pluginsupport.nim.o \
c_code/1_2/plugins7locals.nim.o \
c_code/1_2/plugins7itersgen.nim.o \
c_code/1_2/plugins7active.nim.o \
c_code/1_2/semparallel.nim.o \
c_code/1_2/sem.nim.o \
c_code/1_2/ccgutils.nim.o \
c_code/1_2/ndi.nim.o \
c_code/1_2/cgendata.nim.o \
c_code/1_2/ccgmerge.nim.o \
c_code/1_2/enumtostr.nim.o \
c_code/2_2/stdlib_dynlib.nim.o \
c_code/1_2/cgen.nim.o \
c_code/1_2/passaux.nim.o \
c_code/1_2/depends.nim.o \
c_code/1_2/modules.nim.o \
c_code/1_2/jsgen.nim.o \
c_code/1_2/docgen2.nim.o \
c_code/1_2/main.nim.o \
c_code/2_3/scriptconfig.nim.o \
c_code/2_3/cmdlinehelper.nim.o \
c_code/2_2/nim.nim.o $LINK_FLAGS
    ;;
  powerpc64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_assertions.nim.c -o c_code/1_2/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_dollars.nim.c -o c_code/1_2/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_io.nim.c -o c_code/2_3/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_system.nim.c -o c_code/2_3/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.nim.c -o c_code/2_2/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.nim.c -o c_code/2_2/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_algorithm.nim.c -o c_code/1_2/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.nim.c -o c_code/2_2/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.nim.c -o c_code/2_2/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_pathnorm.nim.c -o c_code/2_2/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_posix.nim.c -o c_code/2_3/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_times.nim.c -o c_code/2_2/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_os.nim.c -o c_code/2_3/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_hashes.nim.c -o c_code/1_2/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strtabs.nim.c -o c_code/1_2/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_streams.nim.c -o c_code/2_3/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_cpuinfo.nim.c -o c_code/2_3/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_osproc.nim.c -o c_code/2_3/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sets.nim.c -o c_code/1_2/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/pathutils.nim.c -o c_code/2_2/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ropes.nim.c -o c_code/1_2/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_tables.nim.c -o c_code/1_2/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lineinfos.nim.c -o c_code/1_2/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/platform.nim.c -o c_code/2_4/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/prefixmatches.nim.c -o c_code/1_2/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strformat.nim.c -o c_code/2_2/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.nim.c -o c_code/2_2/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/options.nim.c -o c_code/2_3/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/msgs.nim.c -o c_code/2_3/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/wordrecg.nim.c -o c_code/1_2/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idents.nim.c -o c_code/1_2/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/condsyms.nim.c -o c_code/1_2/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_sha1.nim.c -o c_code/2_4/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.nim.c -o c_code/2_2/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parsejson.nim.c -o c_code/1_2/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_json.nim.c -o c_code/1_2/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/extccomp.nim.c -o c_code/2_3/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/nimblecmd.nim.c -o c_code/2_3/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.nim.c -o c_code/2_2/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/commands.nim.c -o c_code/1_2/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/llstream.nim.c -o c_code/1_2/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimlexbase.nim.c -o c_code/1_2/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lexer.nim.c -o c_code/1_2/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimconf.nim.c -o c_code/2_2/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_intsets.nim.c -o c_code/1_2/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idgen.nim.c -o c_code/1_2/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ast.nim.c -o c_code/1_2/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/rodutils.nim.c -o c_code/1_2/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/astalgo.nim.c -o c_code/2_2/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parser.nim.c -o c_code/1_2/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/renderer.nim.c -o c_code/1_2/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filters.nim.c -o c_code/1_2/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filter__tmpl.nim.c -o c_code/1_2/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/syntaxes.nim.c -o c_code/1_2/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/trees.nim.c -o c_code/1_2/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/types.nim.c -o c_code/1_2/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/treetab.nim.c -o c_code/1_2/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/incremental.nim.c -o c_code/1_2/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/btrees.nim.c -o c_code/1_2/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_md5.nim.c -o c_code/1_2/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulegraphs.nim.c -o c_code/1_2/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/magicsys.nim.c -o c_code/1_2/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/bitsets.nim.c -o c_code/1_2/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimsets.nim.c -o c_code/1_2/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semfold.nim.c -o c_code/1_2/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulepaths.nim.c -o c_code/1_2/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/reorder.nim.c -o c_code/1_2/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passes.nim.c -o c_code/1_2/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdef.nim.c -o c_code/1_2/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semdata.nim.c -o c_code/1_2/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/linter.nim.c -o c_code/1_2/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimfix7prettybase.nim.c -o c_code/1_2/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lookups.nim.c -o c_code/1_2/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semtypinst.nim.c -o c_code/1_2/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parampatterns.nim.c -o c_code/1_2/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lowerings.nim.c -o c_code/1_2/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rstast.nim.c -o c_code/1_2/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rst.nim.c -o c_code/1_2/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7highlite.nim.c -o c_code/1_2/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/_7lib7packages7docutils7rstgen.nim.c -o c_code/2_3/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_xmltree.nim.c -o c_code/1_2/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_uri.nim.c -o c_code/1_2/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cgi.nim.c -o c_code/1_2/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/typesrenderer.nim.c -o c_code/1_2/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docgen.nim.c -o c_code/2_2/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sigmatch.nim.c -o c_code/1_2/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/importer.nim.c -o c_code/1_2/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/procfind.nim.c -o c_code/1_2/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/pragmas.nim.c -o c_code/2_3/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/saturate.nim.c -o c_code/1_2/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/guards.nim.c -o c_code/1_2/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sighashes.nim.c -o c_code/1_2/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sempass2.nim.c -o c_code/1_2/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgmeth.nim.c -o c_code/1_2/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/aliases.nim.c -o c_code/1_2/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/patterns.nim.c -o c_code/1_2/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/dfa.nim.c -o c_code/1_2/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/injectdestructors.nim.c -o c_code/1_2/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/liftlocals.nim.c -o c_code/1_2/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lambdalifting.nim.c -o c_code/1_2/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/closureiters.nim.c -o c_code/1_2/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/transf.nim.c -o c_code/1_2/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmgen.nim.c -o c_code/1_2/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdeps.nim.c -o c_code/1_2/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmmarshal.nim.c -o c_code/1_2/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/gorgeimpl.nim.c -o c_code/2_3/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/macrocacheimpl.nim.c -o c_code/1_2/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/evaltempl.nim.c -o c_code/1_2/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/vm.nim.c -o c_code/2_4/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semmacrosanity.nim.c -o c_code/1_2/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/pluginsupport.nim.c -o c_code/1_2/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7locals.nim.c -o c_code/1_2/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7itersgen.nim.c -o c_code/1_2/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7active.nim.c -o c_code/1_2/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semparallel.nim.c -o c_code/1_2/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sem.nim.c -o c_code/1_2/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgutils.nim.c -o c_code/1_2/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ndi.nim.c -o c_code/1_2/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgendata.nim.c -o c_code/1_2/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgmerge.nim.c -o c_code/1_2/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/enumtostr.nim.c -o c_code/1_2/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.nim.c -o c_code/2_2/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgen.nim.c -o c_code/1_2/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passaux.nim.c -o c_code/1_2/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/depends.nim.c -o c_code/1_2/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modules.nim.c -o c_code/1_2/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/jsgen.nim.c -o c_code/1_2/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/docgen2.nim.c -o c_code/1_2/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/main.nim.c -o c_code/1_2/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/scriptconfig.nim.c -o c_code/2_3/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/cmdlinehelper.nim.c -o c_code/2_3/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nim.nim.c -o c_code/2_2/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_2/stdlib_assertions.nim.o \
c_code/1_2/stdlib_dollars.nim.o \
c_code/2_3/stdlib_io.nim.o \
c_code/2_3/stdlib_system.nim.o \
c_code/2_2/stdlib_parseutils.nim.o \
c_code/2_2/stdlib_math.nim.o \
c_code/1_2/stdlib_algorithm.nim.o \
c_code/2_2/stdlib_unicode.nim.o \
c_code/2_2/stdlib_strutils.nim.o \
c_code/2_2/stdlib_pathnorm.nim.o \
c_code/2_3/stdlib_posix.nim.o \
c_code/2_2/stdlib_times.nim.o \
c_code/2_3/stdlib_os.nim.o \
c_code/1_2/stdlib_hashes.nim.o \
c_code/1_2/stdlib_strtabs.nim.o \
c_code/2_3/stdlib_streams.nim.o \
c_code/2_3/stdlib_cpuinfo.nim.o \
c_code/2_3/stdlib_osproc.nim.o \
c_code/1_2/stdlib_sets.nim.o \
c_code/2_2/pathutils.nim.o \
c_code/1_2/ropes.nim.o \
c_code/1_2/stdlib_tables.nim.o \
c_code/1_2/lineinfos.nim.o \
c_code/2_4/platform.nim.o \
c_code/1_2/prefixmatches.nim.o \
c_code/2_2/stdlib_strformat.nim.o \
c_code/2_2/stdlib_terminal.nim.o \
c_code/2_3/options.nim.o \
c_code/2_3/msgs.nim.o \
c_code/1_2/wordrecg.nim.o \
c_code/1_2/idents.nim.o \
c_code/1_2/condsyms.nim.o \
c_code/2_4/stdlib_sha1.nim.o \
c_code/2_2/stdlib_lexbase.nim.o \
c_code/1_2/stdlib_parsejson.nim.o \
c_code/1_2/stdlib_json.nim.o \
c_code/2_3/extccomp.nim.o \
c_code/2_3/nimblecmd.nim.o \
c_code/2_2/stdlib_parseopt.nim.o \
c_code/1_2/commands.nim.o \
c_code/1_2/llstream.nim.o \
c_code/1_2/nimlexbase.nim.o \
c_code/1_2/lexer.nim.o \
c_code/2_2/nimconf.nim.o \
c_code/1_2/stdlib_intsets.nim.o \
c_code/1_2/idgen.nim.o \
c_code/1_2/ast.nim.o \
c_code/1_2/rodutils.nim.o \
c_code/2_2/astalgo.nim.o \
c_code/1_2/parser.nim.o \
c_code/1_2/renderer.nim.o \
c_code/1_2/filters.nim.o \
c_code/1_2/filter__tmpl.nim.o \
c_code/1_2/syntaxes.nim.o \
c_code/1_2/trees.nim.o \
c_code/1_2/types.nim.o \
c_code/1_2/treetab.nim.o \
c_code/1_2/incremental.nim.o \
c_code/1_2/btrees.nim.o \
c_code/1_2/stdlib_md5.nim.o \
c_code/1_2/modulegraphs.nim.o \
c_code/1_2/magicsys.nim.o \
c_code/1_2/bitsets.nim.o \
c_code/1_2/nimsets.nim.o \
c_code/1_2/semfold.nim.o \
c_code/1_2/modulepaths.nim.o \
c_code/1_2/reorder.nim.o \
c_code/1_2/passes.nim.o \
c_code/1_2/vmdef.nim.o \
c_code/1_2/semdata.nim.o \
c_code/1_2/linter.nim.o \
c_code/1_2/nimfix7prettybase.nim.o \
c_code/1_2/lookups.nim.o \
c_code/1_2/semtypinst.nim.o \
c_code/1_2/parampatterns.nim.o \
c_code/1_2/lowerings.nim.o \
c_code/1_2/_7lib7packages7docutils7rstast.nim.o \
c_code/1_2/_7lib7packages7docutils7rst.nim.o \
c_code/1_2/_7lib7packages7docutils7highlite.nim.o \
c_code/2_3/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_2/stdlib_xmltree.nim.o \
c_code/1_2/stdlib_uri.nim.o \
c_code/1_2/stdlib_cgi.nim.o \
c_code/1_2/typesrenderer.nim.o \
c_code/2_2/docgen.nim.o \
c_code/1_2/sigmatch.nim.o \
c_code/1_2/importer.nim.o \
c_code/1_2/procfind.nim.o \
c_code/2_3/pragmas.nim.o \
c_code/1_2/saturate.nim.o \
c_code/1_2/guards.nim.o \
c_code/1_2/sighashes.nim.o \
c_code/1_2/sempass2.nim.o \
c_code/1_2/cgmeth.nim.o \
c_code/1_2/aliases.nim.o \
c_code/1_2/patterns.nim.o \
c_code/1_2/dfa.nim.o \
c_code/1_2/injectdestructors.nim.o \
c_code/1_2/liftlocals.nim.o \
c_code/1_2/lambdalifting.nim.o \
c_code/1_2/closureiters.nim.o \
c_code/1_2/transf.nim.o \
c_code/1_2/vmgen.nim.o \
c_code/1_2/vmdeps.nim.o \
c_code/1_2/vmmarshal.nim.o \
c_code/2_3/gorgeimpl.nim.o \
c_code/1_2/macrocacheimpl.nim.o \
c_code/1_2/evaltempl.nim.o \
c_code/2_4/vm.nim.o \
c_code/1_2/semmacrosanity.nim.o \
c_code/1_2/pluginsupport.nim.o \
c_code/1_2/plugins7locals.nim.o \
c_code/1_2/plugins7itersgen.nim.o \
c_code/1_2/plugins7active.nim.o \
c_code/1_2/semparallel.nim.o \
c_code/1_2/sem.nim.o \
c_code/1_2/ccgutils.nim.o \
c_code/1_2/ndi.nim.o \
c_code/1_2/cgendata.nim.o \
c_code/1_2/ccgmerge.nim.o \
c_code/1_2/enumtostr.nim.o \
c_code/2_2/stdlib_dynlib.nim.o \
c_code/1_2/cgen.nim.o \
c_code/1_2/passaux.nim.o \
c_code/1_2/depends.nim.o \
c_code/1_2/modules.nim.o \
c_code/1_2/jsgen.nim.o \
c_code/1_2/docgen2.nim.o \
c_code/1_2/main.nim.o \
c_code/2_3/scriptconfig.nim.o \
c_code/2_3/cmdlinehelper.nim.o \
c_code/2_2/nim.nim.o $LINK_FLAGS
    ;;
  arm)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_assertions.nim.c -o c_code/1_1/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_dollars.nim.c -o c_code/1_1/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_io.nim.c -o c_code/2_1/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_system.nim.c -o c_code/2_1/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.nim.c -o c_code/2_1/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.nim.c -o c_code/2_1/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_algorithm.nim.c -o c_code/1_1/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.nim.c -o c_code/2_1/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.nim.c -o c_code/2_1/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_pathnorm.nim.c -o c_code/2_1/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_posix.nim.c -o c_code/2_1/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_times.nim.c -o c_code/2_1/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_os.nim.c -o c_code/2_1/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_hashes.nim.c -o c_code/1_1/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strtabs.nim.c -o c_code/1_1/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_streams.nim.c -o c_code/2_1/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cpuinfo.nim.c -o c_code/2_1/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_osproc.nim.c -o c_code/2_1/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sets.nim.c -o c_code/1_1/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pathutils.nim.c -o c_code/2_1/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ropes.nim.c -o c_code/1_1/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_tables.nim.c -o c_code/1_1/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lineinfos.nim.c -o c_code/1_1/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/platform.nim.c -o c_code/2_5/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/prefixmatches.nim.c -o c_code/1_1/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strformat.nim.c -o c_code/2_1/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.nim.c -o c_code/2_1/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/options.nim.c -o c_code/2_1/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/msgs.nim.c -o c_code/2_1/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/wordrecg.nim.c -o c_code/1_1/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idents.nim.c -o c_code/1_1/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/condsyms.nim.c -o c_code/1_1/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sha1.nim.c -o c_code/1_1/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.nim.c -o c_code/2_1/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parsejson.nim.c -o c_code/1_1/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_json.nim.c -o c_code/1_1/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/extccomp.nim.c -o c_code/2_1/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimblecmd.nim.c -o c_code/2_1/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.nim.c -o c_code/2_1/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/commands.nim.c -o c_code/1_1/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/llstream.nim.c -o c_code/1_1/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimlexbase.nim.c -o c_code/1_1/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lexer.nim.c -o c_code/1_1/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimconf.nim.c -o c_code/2_1/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_intsets.nim.c -o c_code/1_1/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idgen.nim.c -o c_code/1_1/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ast.nim.c -o c_code/1_1/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/rodutils.nim.c -o c_code/1_1/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/astalgo.nim.c -o c_code/2_1/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parser.nim.c -o c_code/1_1/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/renderer.nim.c -o c_code/1_1/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filters.nim.c -o c_code/1_1/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filter__tmpl.nim.c -o c_code/1_1/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/syntaxes.nim.c -o c_code/1_1/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/trees.nim.c -o c_code/1_1/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/types.nim.c -o c_code/1_1/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/treetab.nim.c -o c_code/1_1/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/incremental.nim.c -o c_code/1_1/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/btrees.nim.c -o c_code/1_1/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_md5.nim.c -o c_code/1_1/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulegraphs.nim.c -o c_code/1_1/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/magicsys.nim.c -o c_code/1_1/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/bitsets.nim.c -o c_code/1_1/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimsets.nim.c -o c_code/1_1/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semfold.nim.c -o c_code/1_1/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulepaths.nim.c -o c_code/1_1/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/reorder.nim.c -o c_code/1_1/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passes.nim.c -o c_code/1_1/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdef.nim.c -o c_code/1_1/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semdata.nim.c -o c_code/1_1/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/linter.nim.c -o c_code/1_1/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimfix7prettybase.nim.c -o c_code/1_1/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lookups.nim.c -o c_code/1_1/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semtypinst.nim.c -o c_code/1_1/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parampatterns.nim.c -o c_code/1_1/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lowerings.nim.c -o c_code/1_1/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rstast.nim.c -o c_code/1_1/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rst.nim.c -o c_code/1_1/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7highlite.nim.c -o c_code/1_1/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/_7lib7packages7docutils7rstgen.nim.c -o c_code/2_1/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_xmltree.nim.c -o c_code/1_1/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_uri.nim.c -o c_code/1_1/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cgi.nim.c -o c_code/1_1/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/typesrenderer.nim.c -o c_code/1_1/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docgen.nim.c -o c_code/2_1/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sigmatch.nim.c -o c_code/1_1/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/importer.nim.c -o c_code/1_1/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/procfind.nim.c -o c_code/1_1/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pragmas.nim.c -o c_code/2_1/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/saturate.nim.c -o c_code/1_1/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/guards.nim.c -o c_code/1_1/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sighashes.nim.c -o c_code/1_1/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sempass2.nim.c -o c_code/1_1/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgmeth.nim.c -o c_code/1_1/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/aliases.nim.c -o c_code/1_1/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/patterns.nim.c -o c_code/1_1/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/dfa.nim.c -o c_code/1_1/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/injectdestructors.nim.c -o c_code/1_1/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/liftlocals.nim.c -o c_code/1_1/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lambdalifting.nim.c -o c_code/1_1/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/closureiters.nim.c -o c_code/1_1/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/transf.nim.c -o c_code/1_1/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmgen.nim.c -o c_code/1_1/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdeps.nim.c -o c_code/1_1/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmmarshal.nim.c -o c_code/1_1/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/gorgeimpl.nim.c -o c_code/2_1/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/macrocacheimpl.nim.c -o c_code/1_1/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/evaltempl.nim.c -o c_code/1_1/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/vm.nim.c -o c_code/2_1/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semmacrosanity.nim.c -o c_code/1_1/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/pluginsupport.nim.c -o c_code/1_1/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7locals.nim.c -o c_code/1_1/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7itersgen.nim.c -o c_code/1_1/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7active.nim.c -o c_code/1_1/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semparallel.nim.c -o c_code/1_1/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sem.nim.c -o c_code/1_1/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgutils.nim.c -o c_code/1_1/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ndi.nim.c -o c_code/1_1/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgendata.nim.c -o c_code/1_1/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgmerge.nim.c -o c_code/1_1/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/enumtostr.nim.c -o c_code/1_1/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.nim.c -o c_code/2_1/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgen.nim.c -o c_code/1_1/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passaux.nim.c -o c_code/1_1/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/depends.nim.c -o c_code/1_1/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modules.nim.c -o c_code/1_1/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/jsgen.nim.c -o c_code/1_1/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/docgen2.nim.c -o c_code/1_1/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/main.nim.c -o c_code/1_1/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/scriptconfig.nim.c -o c_code/2_1/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/cmdlinehelper.nim.c -o c_code/2_1/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nim.nim.c -o c_code/2_1/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_1/stdlib_assertions.nim.o \
c_code/1_1/stdlib_dollars.nim.o \
c_code/2_1/stdlib_io.nim.o \
c_code/2_1/stdlib_system.nim.o \
c_code/2_1/stdlib_parseutils.nim.o \
c_code/2_1/stdlib_math.nim.o \
c_code/1_1/stdlib_algorithm.nim.o \
c_code/2_1/stdlib_unicode.nim.o \
c_code/2_1/stdlib_strutils.nim.o \
c_code/2_1/stdlib_pathnorm.nim.o \
c_code/2_1/stdlib_posix.nim.o \
c_code/2_1/stdlib_times.nim.o \
c_code/2_1/stdlib_os.nim.o \
c_code/1_1/stdlib_hashes.nim.o \
c_code/1_1/stdlib_strtabs.nim.o \
c_code/2_1/stdlib_streams.nim.o \
c_code/2_1/stdlib_cpuinfo.nim.o \
c_code/2_1/stdlib_osproc.nim.o \
c_code/1_1/stdlib_sets.nim.o \
c_code/2_1/pathutils.nim.o \
c_code/1_1/ropes.nim.o \
c_code/1_1/stdlib_tables.nim.o \
c_code/1_1/lineinfos.nim.o \
c_code/2_5/platform.nim.o \
c_code/1_1/prefixmatches.nim.o \
c_code/2_1/stdlib_strformat.nim.o \
c_code/2_1/stdlib_terminal.nim.o \
c_code/2_1/options.nim.o \
c_code/2_1/msgs.nim.o \
c_code/1_1/wordrecg.nim.o \
c_code/1_1/idents.nim.o \
c_code/1_1/condsyms.nim.o \
c_code/1_1/stdlib_sha1.nim.o \
c_code/2_1/stdlib_lexbase.nim.o \
c_code/1_1/stdlib_parsejson.nim.o \
c_code/1_1/stdlib_json.nim.o \
c_code/2_1/extccomp.nim.o \
c_code/2_1/nimblecmd.nim.o \
c_code/2_1/stdlib_parseopt.nim.o \
c_code/1_1/commands.nim.o \
c_code/1_1/llstream.nim.o \
c_code/1_1/nimlexbase.nim.o \
c_code/1_1/lexer.nim.o \
c_code/2_1/nimconf.nim.o \
c_code/1_1/stdlib_intsets.nim.o \
c_code/1_1/idgen.nim.o \
c_code/1_1/ast.nim.o \
c_code/1_1/rodutils.nim.o \
c_code/2_1/astalgo.nim.o \
c_code/1_1/parser.nim.o \
c_code/1_1/renderer.nim.o \
c_code/1_1/filters.nim.o \
c_code/1_1/filter__tmpl.nim.o \
c_code/1_1/syntaxes.nim.o \
c_code/1_1/trees.nim.o \
c_code/1_1/types.nim.o \
c_code/1_1/treetab.nim.o \
c_code/1_1/incremental.nim.o \
c_code/1_1/btrees.nim.o \
c_code/1_1/stdlib_md5.nim.o \
c_code/1_1/modulegraphs.nim.o \
c_code/1_1/magicsys.nim.o \
c_code/1_1/bitsets.nim.o \
c_code/1_1/nimsets.nim.o \
c_code/1_1/semfold.nim.o \
c_code/1_1/modulepaths.nim.o \
c_code/1_1/reorder.nim.o \
c_code/1_1/passes.nim.o \
c_code/1_1/vmdef.nim.o \
c_code/1_1/semdata.nim.o \
c_code/1_1/linter.nim.o \
c_code/1_1/nimfix7prettybase.nim.o \
c_code/1_1/lookups.nim.o \
c_code/1_1/semtypinst.nim.o \
c_code/1_1/parampatterns.nim.o \
c_code/1_1/lowerings.nim.o \
c_code/1_1/_7lib7packages7docutils7rstast.nim.o \
c_code/1_1/_7lib7packages7docutils7rst.nim.o \
c_code/1_1/_7lib7packages7docutils7highlite.nim.o \
c_code/2_1/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_1/stdlib_xmltree.nim.o \
c_code/1_1/stdlib_uri.nim.o \
c_code/1_1/stdlib_cgi.nim.o \
c_code/1_1/typesrenderer.nim.o \
c_code/2_1/docgen.nim.o \
c_code/1_1/sigmatch.nim.o \
c_code/1_1/importer.nim.o \
c_code/1_1/procfind.nim.o \
c_code/2_1/pragmas.nim.o \
c_code/1_1/saturate.nim.o \
c_code/1_1/guards.nim.o \
c_code/1_1/sighashes.nim.o \
c_code/1_1/sempass2.nim.o \
c_code/1_1/cgmeth.nim.o \
c_code/1_1/aliases.nim.o \
c_code/1_1/patterns.nim.o \
c_code/1_1/dfa.nim.o \
c_code/1_1/injectdestructors.nim.o \
c_code/1_1/liftlocals.nim.o \
c_code/1_1/lambdalifting.nim.o \
c_code/1_1/closureiters.nim.o \
c_code/1_1/transf.nim.o \
c_code/1_1/vmgen.nim.o \
c_code/1_1/vmdeps.nim.o \
c_code/1_1/vmmarshal.nim.o \
c_code/2_1/gorgeimpl.nim.o \
c_code/1_1/macrocacheimpl.nim.o \
c_code/1_1/evaltempl.nim.o \
c_code/2_1/vm.nim.o \
c_code/1_1/semmacrosanity.nim.o \
c_code/1_1/pluginsupport.nim.o \
c_code/1_1/plugins7locals.nim.o \
c_code/1_1/plugins7itersgen.nim.o \
c_code/1_1/plugins7active.nim.o \
c_code/1_1/semparallel.nim.o \
c_code/1_1/sem.nim.o \
c_code/1_1/ccgutils.nim.o \
c_code/1_1/ndi.nim.o \
c_code/1_1/cgendata.nim.o \
c_code/1_1/ccgmerge.nim.o \
c_code/1_1/enumtostr.nim.o \
c_code/2_1/stdlib_dynlib.nim.o \
c_code/1_1/cgen.nim.o \
c_code/1_1/passaux.nim.o \
c_code/1_1/depends.nim.o \
c_code/1_1/modules.nim.o \
c_code/1_1/jsgen.nim.o \
c_code/1_1/docgen2.nim.o \
c_code/1_1/main.nim.o \
c_code/2_1/scriptconfig.nim.o \
c_code/2_1/cmdlinehelper.nim.o \
c_code/2_1/nim.nim.o $LINK_FLAGS
    ;;
  sparc)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_assertions.nim.c -o c_code/1_1/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_dollars.nim.c -o c_code/1_1/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_io.nim.c -o c_code/2_1/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_system.nim.c -o c_code/2_6/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.nim.c -o c_code/2_1/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.nim.c -o c_code/2_1/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_algorithm.nim.c -o c_code/1_1/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.nim.c -o c_code/2_1/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.nim.c -o c_code/2_1/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_pathnorm.nim.c -o c_code/2_1/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_posix.nim.c -o c_code/2_1/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_times.nim.c -o c_code/2_1/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_os.nim.c -o c_code/2_1/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_hashes.nim.c -o c_code/1_1/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strtabs.nim.c -o c_code/1_1/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_streams.nim.c -o c_code/2_1/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cpuinfo.nim.c -o c_code/2_1/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_osproc.nim.c -o c_code/2_1/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sets.nim.c -o c_code/1_1/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pathutils.nim.c -o c_code/2_1/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ropes.nim.c -o c_code/1_1/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_tables.nim.c -o c_code/1_1/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lineinfos.nim.c -o c_code/1_1/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/platform.nim.c -o c_code/2_6/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/prefixmatches.nim.c -o c_code/1_1/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strformat.nim.c -o c_code/2_1/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.nim.c -o c_code/2_1/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/options.nim.c -o c_code/2_1/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/msgs.nim.c -o c_code/2_1/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/wordrecg.nim.c -o c_code/1_1/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idents.nim.c -o c_code/1_1/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/condsyms.nim.c -o c_code/1_1/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_sha1.nim.c -o c_code/2_6/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.nim.c -o c_code/2_1/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parsejson.nim.c -o c_code/1_1/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_json.nim.c -o c_code/1_1/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/extccomp.nim.c -o c_code/2_1/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimblecmd.nim.c -o c_code/2_1/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.nim.c -o c_code/2_1/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/commands.nim.c -o c_code/1_1/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/llstream.nim.c -o c_code/1_1/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimlexbase.nim.c -o c_code/1_1/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lexer.nim.c -o c_code/1_1/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimconf.nim.c -o c_code/2_1/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_intsets.nim.c -o c_code/1_1/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idgen.nim.c -o c_code/1_1/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ast.nim.c -o c_code/1_1/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/rodutils.nim.c -o c_code/1_1/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/astalgo.nim.c -o c_code/2_1/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parser.nim.c -o c_code/1_1/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/renderer.nim.c -o c_code/1_1/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filters.nim.c -o c_code/1_1/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filter__tmpl.nim.c -o c_code/1_1/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/syntaxes.nim.c -o c_code/1_1/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/trees.nim.c -o c_code/1_1/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/types.nim.c -o c_code/1_1/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/treetab.nim.c -o c_code/1_1/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/incremental.nim.c -o c_code/1_1/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/btrees.nim.c -o c_code/1_1/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_md5.nim.c -o c_code/1_1/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulegraphs.nim.c -o c_code/1_1/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/magicsys.nim.c -o c_code/1_1/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/bitsets.nim.c -o c_code/1_1/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimsets.nim.c -o c_code/1_1/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semfold.nim.c -o c_code/1_1/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulepaths.nim.c -o c_code/1_1/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/reorder.nim.c -o c_code/1_1/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passes.nim.c -o c_code/1_1/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdef.nim.c -o c_code/1_1/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semdata.nim.c -o c_code/1_1/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/linter.nim.c -o c_code/1_1/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimfix7prettybase.nim.c -o c_code/1_1/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lookups.nim.c -o c_code/1_1/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semtypinst.nim.c -o c_code/1_1/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parampatterns.nim.c -o c_code/1_1/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lowerings.nim.c -o c_code/1_1/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rstast.nim.c -o c_code/1_1/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rst.nim.c -o c_code/1_1/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7highlite.nim.c -o c_code/1_1/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/_7lib7packages7docutils7rstgen.nim.c -o c_code/2_1/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_xmltree.nim.c -o c_code/1_1/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_uri.nim.c -o c_code/1_1/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cgi.nim.c -o c_code/1_1/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/typesrenderer.nim.c -o c_code/1_1/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docgen.nim.c -o c_code/2_1/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sigmatch.nim.c -o c_code/1_1/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/importer.nim.c -o c_code/1_1/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/procfind.nim.c -o c_code/1_1/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pragmas.nim.c -o c_code/2_1/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/saturate.nim.c -o c_code/1_1/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/guards.nim.c -o c_code/1_1/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sighashes.nim.c -o c_code/1_1/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sempass2.nim.c -o c_code/1_1/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgmeth.nim.c -o c_code/1_1/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/aliases.nim.c -o c_code/1_1/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/patterns.nim.c -o c_code/1_1/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/dfa.nim.c -o c_code/1_1/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/injectdestructors.nim.c -o c_code/1_1/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/liftlocals.nim.c -o c_code/1_1/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lambdalifting.nim.c -o c_code/1_1/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/closureiters.nim.c -o c_code/1_1/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/transf.nim.c -o c_code/1_1/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmgen.nim.c -o c_code/1_1/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdeps.nim.c -o c_code/1_1/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmmarshal.nim.c -o c_code/1_1/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/gorgeimpl.nim.c -o c_code/2_1/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/macrocacheimpl.nim.c -o c_code/1_1/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/evaltempl.nim.c -o c_code/1_1/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/vm.nim.c -o c_code/2_6/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semmacrosanity.nim.c -o c_code/1_1/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/pluginsupport.nim.c -o c_code/1_1/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7locals.nim.c -o c_code/1_1/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7itersgen.nim.c -o c_code/1_1/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7active.nim.c -o c_code/1_1/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semparallel.nim.c -o c_code/1_1/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sem.nim.c -o c_code/1_1/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgutils.nim.c -o c_code/1_1/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ndi.nim.c -o c_code/1_1/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgendata.nim.c -o c_code/1_1/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgmerge.nim.c -o c_code/1_1/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/enumtostr.nim.c -o c_code/1_1/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.nim.c -o c_code/2_1/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgen.nim.c -o c_code/1_1/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passaux.nim.c -o c_code/1_1/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/depends.nim.c -o c_code/1_1/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modules.nim.c -o c_code/1_1/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/jsgen.nim.c -o c_code/1_1/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/docgen2.nim.c -o c_code/1_1/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/main.nim.c -o c_code/1_1/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/scriptconfig.nim.c -o c_code/2_1/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/cmdlinehelper.nim.c -o c_code/2_1/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nim.nim.c -o c_code/2_1/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_1/stdlib_assertions.nim.o \
c_code/1_1/stdlib_dollars.nim.o \
c_code/2_1/stdlib_io.nim.o \
c_code/2_6/stdlib_system.nim.o \
c_code/2_1/stdlib_parseutils.nim.o \
c_code/2_1/stdlib_math.nim.o \
c_code/1_1/stdlib_algorithm.nim.o \
c_code/2_1/stdlib_unicode.nim.o \
c_code/2_1/stdlib_strutils.nim.o \
c_code/2_1/stdlib_pathnorm.nim.o \
c_code/2_1/stdlib_posix.nim.o \
c_code/2_1/stdlib_times.nim.o \
c_code/2_1/stdlib_os.nim.o \
c_code/1_1/stdlib_hashes.nim.o \
c_code/1_1/stdlib_strtabs.nim.o \
c_code/2_1/stdlib_streams.nim.o \
c_code/2_1/stdlib_cpuinfo.nim.o \
c_code/2_1/stdlib_osproc.nim.o \
c_code/1_1/stdlib_sets.nim.o \
c_code/2_1/pathutils.nim.o \
c_code/1_1/ropes.nim.o \
c_code/1_1/stdlib_tables.nim.o \
c_code/1_1/lineinfos.nim.o \
c_code/2_6/platform.nim.o \
c_code/1_1/prefixmatches.nim.o \
c_code/2_1/stdlib_strformat.nim.o \
c_code/2_1/stdlib_terminal.nim.o \
c_code/2_1/options.nim.o \
c_code/2_1/msgs.nim.o \
c_code/1_1/wordrecg.nim.o \
c_code/1_1/idents.nim.o \
c_code/1_1/condsyms.nim.o \
c_code/2_6/stdlib_sha1.nim.o \
c_code/2_1/stdlib_lexbase.nim.o \
c_code/1_1/stdlib_parsejson.nim.o \
c_code/1_1/stdlib_json.nim.o \
c_code/2_1/extccomp.nim.o \
c_code/2_1/nimblecmd.nim.o \
c_code/2_1/stdlib_parseopt.nim.o \
c_code/1_1/commands.nim.o \
c_code/1_1/llstream.nim.o \
c_code/1_1/nimlexbase.nim.o \
c_code/1_1/lexer.nim.o \
c_code/2_1/nimconf.nim.o \
c_code/1_1/stdlib_intsets.nim.o \
c_code/1_1/idgen.nim.o \
c_code/1_1/ast.nim.o \
c_code/1_1/rodutils.nim.o \
c_code/2_1/astalgo.nim.o \
c_code/1_1/parser.nim.o \
c_code/1_1/renderer.nim.o \
c_code/1_1/filters.nim.o \
c_code/1_1/filter__tmpl.nim.o \
c_code/1_1/syntaxes.nim.o \
c_code/1_1/trees.nim.o \
c_code/1_1/types.nim.o \
c_code/1_1/treetab.nim.o \
c_code/1_1/incremental.nim.o \
c_code/1_1/btrees.nim.o \
c_code/1_1/stdlib_md5.nim.o \
c_code/1_1/modulegraphs.nim.o \
c_code/1_1/magicsys.nim.o \
c_code/1_1/bitsets.nim.o \
c_code/1_1/nimsets.nim.o \
c_code/1_1/semfold.nim.o \
c_code/1_1/modulepaths.nim.o \
c_code/1_1/reorder.nim.o \
c_code/1_1/passes.nim.o \
c_code/1_1/vmdef.nim.o \
c_code/1_1/semdata.nim.o \
c_code/1_1/linter.nim.o \
c_code/1_1/nimfix7prettybase.nim.o \
c_code/1_1/lookups.nim.o \
c_code/1_1/semtypinst.nim.o \
c_code/1_1/parampatterns.nim.o \
c_code/1_1/lowerings.nim.o \
c_code/1_1/_7lib7packages7docutils7rstast.nim.o \
c_code/1_1/_7lib7packages7docutils7rst.nim.o \
c_code/1_1/_7lib7packages7docutils7highlite.nim.o \
c_code/2_1/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_1/stdlib_xmltree.nim.o \
c_code/1_1/stdlib_uri.nim.o \
c_code/1_1/stdlib_cgi.nim.o \
c_code/1_1/typesrenderer.nim.o \
c_code/2_1/docgen.nim.o \
c_code/1_1/sigmatch.nim.o \
c_code/1_1/importer.nim.o \
c_code/1_1/procfind.nim.o \
c_code/2_1/pragmas.nim.o \
c_code/1_1/saturate.nim.o \
c_code/1_1/guards.nim.o \
c_code/1_1/sighashes.nim.o \
c_code/1_1/sempass2.nim.o \
c_code/1_1/cgmeth.nim.o \
c_code/1_1/aliases.nim.o \
c_code/1_1/patterns.nim.o \
c_code/1_1/dfa.nim.o \
c_code/1_1/injectdestructors.nim.o \
c_code/1_1/liftlocals.nim.o \
c_code/1_1/lambdalifting.nim.o \
c_code/1_1/closureiters.nim.o \
c_code/1_1/transf.nim.o \
c_code/1_1/vmgen.nim.o \
c_code/1_1/vmdeps.nim.o \
c_code/1_1/vmmarshal.nim.o \
c_code/2_1/gorgeimpl.nim.o \
c_code/1_1/macrocacheimpl.nim.o \
c_code/1_1/evaltempl.nim.o \
c_code/2_6/vm.nim.o \
c_code/1_1/semmacrosanity.nim.o \
c_code/1_1/pluginsupport.nim.o \
c_code/1_1/plugins7locals.nim.o \
c_code/1_1/plugins7itersgen.nim.o \
c_code/1_1/plugins7active.nim.o \
c_code/1_1/semparallel.nim.o \
c_code/1_1/sem.nim.o \
c_code/1_1/ccgutils.nim.o \
c_code/1_1/ndi.nim.o \
c_code/1_1/cgendata.nim.o \
c_code/1_1/ccgmerge.nim.o \
c_code/1_1/enumtostr.nim.o \
c_code/2_1/stdlib_dynlib.nim.o \
c_code/1_1/cgen.nim.o \
c_code/1_1/passaux.nim.o \
c_code/1_1/depends.nim.o \
c_code/1_1/modules.nim.o \
c_code/1_1/jsgen.nim.o \
c_code/1_1/docgen2.nim.o \
c_code/1_1/main.nim.o \
c_code/2_1/scriptconfig.nim.o \
c_code/2_1/cmdlinehelper.nim.o \
c_code/2_1/nim.nim.o $LINK_FLAGS
    ;;
  sparc64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_assertions.nim.c -o c_code/1_2/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_dollars.nim.c -o c_code/1_2/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_io.nim.c -o c_code/2_3/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_system.nim.c -o c_code/2_3/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.nim.c -o c_code/2_2/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.nim.c -o c_code/2_2/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_algorithm.nim.c -o c_code/1_2/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.nim.c -o c_code/2_2/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.nim.c -o c_code/2_2/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_pathnorm.nim.c -o c_code/2_2/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_posix.nim.c -o c_code/2_3/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_times.nim.c -o c_code/2_2/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_os.nim.c -o c_code/2_3/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_hashes.nim.c -o c_code/1_2/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strtabs.nim.c -o c_code/1_2/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_streams.nim.c -o c_code/2_3/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_cpuinfo.nim.c -o c_code/2_3/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_osproc.nim.c -o c_code/2_3/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sets.nim.c -o c_code/1_2/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/pathutils.nim.c -o c_code/2_2/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ropes.nim.c -o c_code/1_2/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_tables.nim.c -o c_code/1_2/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lineinfos.nim.c -o c_code/1_2/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/platform.nim.c -o c_code/2_7/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/prefixmatches.nim.c -o c_code/1_2/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strformat.nim.c -o c_code/2_2/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.nim.c -o c_code/2_2/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/options.nim.c -o c_code/2_3/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/msgs.nim.c -o c_code/2_3/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/wordrecg.nim.c -o c_code/1_2/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idents.nim.c -o c_code/1_2/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/condsyms.nim.c -o c_code/1_2/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_sha1.nim.c -o c_code/2_4/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.nim.c -o c_code/2_2/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parsejson.nim.c -o c_code/1_2/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_json.nim.c -o c_code/1_2/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/extccomp.nim.c -o c_code/2_3/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/nimblecmd.nim.c -o c_code/2_3/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.nim.c -o c_code/2_2/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/commands.nim.c -o c_code/1_2/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/llstream.nim.c -o c_code/1_2/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimlexbase.nim.c -o c_code/1_2/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lexer.nim.c -o c_code/1_2/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimconf.nim.c -o c_code/2_2/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_intsets.nim.c -o c_code/1_2/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idgen.nim.c -o c_code/1_2/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ast.nim.c -o c_code/1_2/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/rodutils.nim.c -o c_code/1_2/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/astalgo.nim.c -o c_code/2_2/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parser.nim.c -o c_code/1_2/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/renderer.nim.c -o c_code/1_2/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filters.nim.c -o c_code/1_2/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filter__tmpl.nim.c -o c_code/1_2/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/syntaxes.nim.c -o c_code/1_2/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/trees.nim.c -o c_code/1_2/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/types.nim.c -o c_code/1_2/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/treetab.nim.c -o c_code/1_2/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/incremental.nim.c -o c_code/1_2/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/btrees.nim.c -o c_code/1_2/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_md5.nim.c -o c_code/1_2/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulegraphs.nim.c -o c_code/1_2/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/magicsys.nim.c -o c_code/1_2/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/bitsets.nim.c -o c_code/1_2/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimsets.nim.c -o c_code/1_2/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semfold.nim.c -o c_code/1_2/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulepaths.nim.c -o c_code/1_2/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/reorder.nim.c -o c_code/1_2/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passes.nim.c -o c_code/1_2/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdef.nim.c -o c_code/1_2/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semdata.nim.c -o c_code/1_2/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/linter.nim.c -o c_code/1_2/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimfix7prettybase.nim.c -o c_code/1_2/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lookups.nim.c -o c_code/1_2/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semtypinst.nim.c -o c_code/1_2/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parampatterns.nim.c -o c_code/1_2/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lowerings.nim.c -o c_code/1_2/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rstast.nim.c -o c_code/1_2/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rst.nim.c -o c_code/1_2/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7highlite.nim.c -o c_code/1_2/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/_7lib7packages7docutils7rstgen.nim.c -o c_code/2_3/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_xmltree.nim.c -o c_code/1_2/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_uri.nim.c -o c_code/1_2/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cgi.nim.c -o c_code/1_2/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/typesrenderer.nim.c -o c_code/1_2/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docgen.nim.c -o c_code/2_2/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sigmatch.nim.c -o c_code/1_2/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/importer.nim.c -o c_code/1_2/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/procfind.nim.c -o c_code/1_2/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/pragmas.nim.c -o c_code/2_3/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/saturate.nim.c -o c_code/1_2/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/guards.nim.c -o c_code/1_2/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sighashes.nim.c -o c_code/1_2/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sempass2.nim.c -o c_code/1_2/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgmeth.nim.c -o c_code/1_2/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/aliases.nim.c -o c_code/1_2/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/patterns.nim.c -o c_code/1_2/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/dfa.nim.c -o c_code/1_2/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/injectdestructors.nim.c -o c_code/1_2/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/liftlocals.nim.c -o c_code/1_2/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lambdalifting.nim.c -o c_code/1_2/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/closureiters.nim.c -o c_code/1_2/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/transf.nim.c -o c_code/1_2/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmgen.nim.c -o c_code/1_2/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdeps.nim.c -o c_code/1_2/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmmarshal.nim.c -o c_code/1_2/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/gorgeimpl.nim.c -o c_code/2_3/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/macrocacheimpl.nim.c -o c_code/1_2/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/evaltempl.nim.c -o c_code/1_2/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/vm.nim.c -o c_code/2_4/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semmacrosanity.nim.c -o c_code/1_2/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/pluginsupport.nim.c -o c_code/1_2/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7locals.nim.c -o c_code/1_2/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7itersgen.nim.c -o c_code/1_2/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7active.nim.c -o c_code/1_2/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semparallel.nim.c -o c_code/1_2/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sem.nim.c -o c_code/1_2/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgutils.nim.c -o c_code/1_2/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ndi.nim.c -o c_code/1_2/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgendata.nim.c -o c_code/1_2/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgmerge.nim.c -o c_code/1_2/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/enumtostr.nim.c -o c_code/1_2/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.nim.c -o c_code/2_2/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgen.nim.c -o c_code/1_2/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passaux.nim.c -o c_code/1_2/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/depends.nim.c -o c_code/1_2/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modules.nim.c -o c_code/1_2/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/jsgen.nim.c -o c_code/1_2/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/docgen2.nim.c -o c_code/1_2/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/main.nim.c -o c_code/1_2/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/scriptconfig.nim.c -o c_code/2_3/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/cmdlinehelper.nim.c -o c_code/2_3/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nim.nim.c -o c_code/2_2/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_2/stdlib_assertions.nim.o \
c_code/1_2/stdlib_dollars.nim.o \
c_code/2_3/stdlib_io.nim.o \
c_code/2_3/stdlib_system.nim.o \
c_code/2_2/stdlib_parseutils.nim.o \
c_code/2_2/stdlib_math.nim.o \
c_code/1_2/stdlib_algorithm.nim.o \
c_code/2_2/stdlib_unicode.nim.o \
c_code/2_2/stdlib_strutils.nim.o \
c_code/2_2/stdlib_pathnorm.nim.o \
c_code/2_3/stdlib_posix.nim.o \
c_code/2_2/stdlib_times.nim.o \
c_code/2_3/stdlib_os.nim.o \
c_code/1_2/stdlib_hashes.nim.o \
c_code/1_2/stdlib_strtabs.nim.o \
c_code/2_3/stdlib_streams.nim.o \
c_code/2_3/stdlib_cpuinfo.nim.o \
c_code/2_3/stdlib_osproc.nim.o \
c_code/1_2/stdlib_sets.nim.o \
c_code/2_2/pathutils.nim.o \
c_code/1_2/ropes.nim.o \
c_code/1_2/stdlib_tables.nim.o \
c_code/1_2/lineinfos.nim.o \
c_code/2_7/platform.nim.o \
c_code/1_2/prefixmatches.nim.o \
c_code/2_2/stdlib_strformat.nim.o \
c_code/2_2/stdlib_terminal.nim.o \
c_code/2_3/options.nim.o \
c_code/2_3/msgs.nim.o \
c_code/1_2/wordrecg.nim.o \
c_code/1_2/idents.nim.o \
c_code/1_2/condsyms.nim.o \
c_code/2_4/stdlib_sha1.nim.o \
c_code/2_2/stdlib_lexbase.nim.o \
c_code/1_2/stdlib_parsejson.nim.o \
c_code/1_2/stdlib_json.nim.o \
c_code/2_3/extccomp.nim.o \
c_code/2_3/nimblecmd.nim.o \
c_code/2_2/stdlib_parseopt.nim.o \
c_code/1_2/commands.nim.o \
c_code/1_2/llstream.nim.o \
c_code/1_2/nimlexbase.nim.o \
c_code/1_2/lexer.nim.o \
c_code/2_2/nimconf.nim.o \
c_code/1_2/stdlib_intsets.nim.o \
c_code/1_2/idgen.nim.o \
c_code/1_2/ast.nim.o \
c_code/1_2/rodutils.nim.o \
c_code/2_2/astalgo.nim.o \
c_code/1_2/parser.nim.o \
c_code/1_2/renderer.nim.o \
c_code/1_2/filters.nim.o \
c_code/1_2/filter__tmpl.nim.o \
c_code/1_2/syntaxes.nim.o \
c_code/1_2/trees.nim.o \
c_code/1_2/types.nim.o \
c_code/1_2/treetab.nim.o \
c_code/1_2/incremental.nim.o \
c_code/1_2/btrees.nim.o \
c_code/1_2/stdlib_md5.nim.o \
c_code/1_2/modulegraphs.nim.o \
c_code/1_2/magicsys.nim.o \
c_code/1_2/bitsets.nim.o \
c_code/1_2/nimsets.nim.o \
c_code/1_2/semfold.nim.o \
c_code/1_2/modulepaths.nim.o \
c_code/1_2/reorder.nim.o \
c_code/1_2/passes.nim.o \
c_code/1_2/vmdef.nim.o \
c_code/1_2/semdata.nim.o \
c_code/1_2/linter.nim.o \
c_code/1_2/nimfix7prettybase.nim.o \
c_code/1_2/lookups.nim.o \
c_code/1_2/semtypinst.nim.o \
c_code/1_2/parampatterns.nim.o \
c_code/1_2/lowerings.nim.o \
c_code/1_2/_7lib7packages7docutils7rstast.nim.o \
c_code/1_2/_7lib7packages7docutils7rst.nim.o \
c_code/1_2/_7lib7packages7docutils7highlite.nim.o \
c_code/2_3/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_2/stdlib_xmltree.nim.o \
c_code/1_2/stdlib_uri.nim.o \
c_code/1_2/stdlib_cgi.nim.o \
c_code/1_2/typesrenderer.nim.o \
c_code/2_2/docgen.nim.o \
c_code/1_2/sigmatch.nim.o \
c_code/1_2/importer.nim.o \
c_code/1_2/procfind.nim.o \
c_code/2_3/pragmas.nim.o \
c_code/1_2/saturate.nim.o \
c_code/1_2/guards.nim.o \
c_code/1_2/sighashes.nim.o \
c_code/1_2/sempass2.nim.o \
c_code/1_2/cgmeth.nim.o \
c_code/1_2/aliases.nim.o \
c_code/1_2/patterns.nim.o \
c_code/1_2/dfa.nim.o \
c_code/1_2/injectdestructors.nim.o \
c_code/1_2/liftlocals.nim.o \
c_code/1_2/lambdalifting.nim.o \
c_code/1_2/closureiters.nim.o \
c_code/1_2/transf.nim.o \
c_code/1_2/vmgen.nim.o \
c_code/1_2/vmdeps.nim.o \
c_code/1_2/vmmarshal.nim.o \
c_code/2_3/gorgeimpl.nim.o \
c_code/1_2/macrocacheimpl.nim.o \
c_code/1_2/evaltempl.nim.o \
c_code/2_4/vm.nim.o \
c_code/1_2/semmacrosanity.nim.o \
c_code/1_2/pluginsupport.nim.o \
c_code/1_2/plugins7locals.nim.o \
c_code/1_2/plugins7itersgen.nim.o \
c_code/1_2/plugins7active.nim.o \
c_code/1_2/semparallel.nim.o \
c_code/1_2/sem.nim.o \
c_code/1_2/ccgutils.nim.o \
c_code/1_2/ndi.nim.o \
c_code/1_2/cgendata.nim.o \
c_code/1_2/ccgmerge.nim.o \
c_code/1_2/enumtostr.nim.o \
c_code/2_2/stdlib_dynlib.nim.o \
c_code/1_2/cgen.nim.o \
c_code/1_2/passaux.nim.o \
c_code/1_2/depends.nim.o \
c_code/1_2/modules.nim.o \
c_code/1_2/jsgen.nim.o \
c_code/1_2/docgen2.nim.o \
c_code/1_2/main.nim.o \
c_code/2_3/scriptconfig.nim.o \
c_code/2_3/cmdlinehelper.nim.o \
c_code/2_2/nim.nim.o $LINK_FLAGS
    ;;
  m68k)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_assertions.nim.c -o c_code/1_1/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_dollars.nim.c -o c_code/1_1/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_io.nim.c -o c_code/2_1/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_system.nim.c -o c_code/2_1/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.nim.c -o c_code/2_1/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.nim.c -o c_code/2_1/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_algorithm.nim.c -o c_code/1_1/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.nim.c -o c_code/2_1/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.nim.c -o c_code/2_1/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_pathnorm.nim.c -o c_code/2_1/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_posix.nim.c -o c_code/2_1/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_times.nim.c -o c_code/2_1/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_os.nim.c -o c_code/2_1/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_hashes.nim.c -o c_code/1_1/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strtabs.nim.c -o c_code/1_1/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_streams.nim.c -o c_code/2_1/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cpuinfo.nim.c -o c_code/2_1/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_osproc.nim.c -o c_code/2_1/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sets.nim.c -o c_code/1_1/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pathutils.nim.c -o c_code/2_1/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ropes.nim.c -o c_code/1_1/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_tables.nim.c -o c_code/1_1/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lineinfos.nim.c -o c_code/1_1/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_8/platform.nim.c -o c_code/2_8/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/prefixmatches.nim.c -o c_code/1_1/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strformat.nim.c -o c_code/2_1/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.nim.c -o c_code/2_1/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/options.nim.c -o c_code/2_1/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/msgs.nim.c -o c_code/2_1/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/wordrecg.nim.c -o c_code/1_1/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idents.nim.c -o c_code/1_1/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/condsyms.nim.c -o c_code/1_1/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_sha1.nim.c -o c_code/2_6/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.nim.c -o c_code/2_1/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parsejson.nim.c -o c_code/1_1/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_json.nim.c -o c_code/1_1/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/extccomp.nim.c -o c_code/2_1/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimblecmd.nim.c -o c_code/2_1/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.nim.c -o c_code/2_1/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/commands.nim.c -o c_code/1_1/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/llstream.nim.c -o c_code/1_1/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimlexbase.nim.c -o c_code/1_1/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lexer.nim.c -o c_code/1_1/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimconf.nim.c -o c_code/2_1/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_intsets.nim.c -o c_code/1_1/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idgen.nim.c -o c_code/1_1/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ast.nim.c -o c_code/1_1/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/rodutils.nim.c -o c_code/1_1/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/astalgo.nim.c -o c_code/2_1/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parser.nim.c -o c_code/1_1/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/renderer.nim.c -o c_code/1_1/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filters.nim.c -o c_code/1_1/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filter__tmpl.nim.c -o c_code/1_1/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/syntaxes.nim.c -o c_code/1_1/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/trees.nim.c -o c_code/1_1/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/types.nim.c -o c_code/1_1/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/treetab.nim.c -o c_code/1_1/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/incremental.nim.c -o c_code/1_1/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/btrees.nim.c -o c_code/1_1/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_md5.nim.c -o c_code/1_1/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulegraphs.nim.c -o c_code/1_1/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/magicsys.nim.c -o c_code/1_1/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/bitsets.nim.c -o c_code/1_1/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimsets.nim.c -o c_code/1_1/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semfold.nim.c -o c_code/1_1/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulepaths.nim.c -o c_code/1_1/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/reorder.nim.c -o c_code/1_1/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passes.nim.c -o c_code/1_1/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdef.nim.c -o c_code/1_1/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semdata.nim.c -o c_code/1_1/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/linter.nim.c -o c_code/1_1/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimfix7prettybase.nim.c -o c_code/1_1/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lookups.nim.c -o c_code/1_1/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semtypinst.nim.c -o c_code/1_1/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parampatterns.nim.c -o c_code/1_1/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lowerings.nim.c -o c_code/1_1/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rstast.nim.c -o c_code/1_1/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rst.nim.c -o c_code/1_1/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7highlite.nim.c -o c_code/1_1/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/_7lib7packages7docutils7rstgen.nim.c -o c_code/2_1/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_xmltree.nim.c -o c_code/1_1/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_uri.nim.c -o c_code/1_1/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cgi.nim.c -o c_code/1_1/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/typesrenderer.nim.c -o c_code/1_1/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docgen.nim.c -o c_code/2_1/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sigmatch.nim.c -o c_code/1_1/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/importer.nim.c -o c_code/1_1/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/procfind.nim.c -o c_code/1_1/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pragmas.nim.c -o c_code/2_1/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/saturate.nim.c -o c_code/1_1/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/guards.nim.c -o c_code/1_1/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sighashes.nim.c -o c_code/1_1/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sempass2.nim.c -o c_code/1_1/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgmeth.nim.c -o c_code/1_1/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/aliases.nim.c -o c_code/1_1/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/patterns.nim.c -o c_code/1_1/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/dfa.nim.c -o c_code/1_1/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/injectdestructors.nim.c -o c_code/1_1/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/liftlocals.nim.c -o c_code/1_1/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lambdalifting.nim.c -o c_code/1_1/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/closureiters.nim.c -o c_code/1_1/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/transf.nim.c -o c_code/1_1/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmgen.nim.c -o c_code/1_1/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdeps.nim.c -o c_code/1_1/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmmarshal.nim.c -o c_code/1_1/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/gorgeimpl.nim.c -o c_code/2_1/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/macrocacheimpl.nim.c -o c_code/1_1/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/evaltempl.nim.c -o c_code/1_1/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/vm.nim.c -o c_code/2_6/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semmacrosanity.nim.c -o c_code/1_1/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/pluginsupport.nim.c -o c_code/1_1/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7locals.nim.c -o c_code/1_1/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7itersgen.nim.c -o c_code/1_1/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7active.nim.c -o c_code/1_1/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semparallel.nim.c -o c_code/1_1/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sem.nim.c -o c_code/1_1/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgutils.nim.c -o c_code/1_1/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ndi.nim.c -o c_code/1_1/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgendata.nim.c -o c_code/1_1/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgmerge.nim.c -o c_code/1_1/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/enumtostr.nim.c -o c_code/1_1/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.nim.c -o c_code/2_1/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgen.nim.c -o c_code/1_1/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passaux.nim.c -o c_code/1_1/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/depends.nim.c -o c_code/1_1/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modules.nim.c -o c_code/1_1/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/jsgen.nim.c -o c_code/1_1/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/docgen2.nim.c -o c_code/1_1/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/main.nim.c -o c_code/1_1/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/scriptconfig.nim.c -o c_code/2_1/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/cmdlinehelper.nim.c -o c_code/2_1/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nim.nim.c -o c_code/2_1/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_1/stdlib_assertions.nim.o \
c_code/1_1/stdlib_dollars.nim.o \
c_code/2_1/stdlib_io.nim.o \
c_code/2_1/stdlib_system.nim.o \
c_code/2_1/stdlib_parseutils.nim.o \
c_code/2_1/stdlib_math.nim.o \
c_code/1_1/stdlib_algorithm.nim.o \
c_code/2_1/stdlib_unicode.nim.o \
c_code/2_1/stdlib_strutils.nim.o \
c_code/2_1/stdlib_pathnorm.nim.o \
c_code/2_1/stdlib_posix.nim.o \
c_code/2_1/stdlib_times.nim.o \
c_code/2_1/stdlib_os.nim.o \
c_code/1_1/stdlib_hashes.nim.o \
c_code/1_1/stdlib_strtabs.nim.o \
c_code/2_1/stdlib_streams.nim.o \
c_code/2_1/stdlib_cpuinfo.nim.o \
c_code/2_1/stdlib_osproc.nim.o \
c_code/1_1/stdlib_sets.nim.o \
c_code/2_1/pathutils.nim.o \
c_code/1_1/ropes.nim.o \
c_code/1_1/stdlib_tables.nim.o \
c_code/1_1/lineinfos.nim.o \
c_code/2_8/platform.nim.o \
c_code/1_1/prefixmatches.nim.o \
c_code/2_1/stdlib_strformat.nim.o \
c_code/2_1/stdlib_terminal.nim.o \
c_code/2_1/options.nim.o \
c_code/2_1/msgs.nim.o \
c_code/1_1/wordrecg.nim.o \
c_code/1_1/idents.nim.o \
c_code/1_1/condsyms.nim.o \
c_code/2_6/stdlib_sha1.nim.o \
c_code/2_1/stdlib_lexbase.nim.o \
c_code/1_1/stdlib_parsejson.nim.o \
c_code/1_1/stdlib_json.nim.o \
c_code/2_1/extccomp.nim.o \
c_code/2_1/nimblecmd.nim.o \
c_code/2_1/stdlib_parseopt.nim.o \
c_code/1_1/commands.nim.o \
c_code/1_1/llstream.nim.o \
c_code/1_1/nimlexbase.nim.o \
c_code/1_1/lexer.nim.o \
c_code/2_1/nimconf.nim.o \
c_code/1_1/stdlib_intsets.nim.o \
c_code/1_1/idgen.nim.o \
c_code/1_1/ast.nim.o \
c_code/1_1/rodutils.nim.o \
c_code/2_1/astalgo.nim.o \
c_code/1_1/parser.nim.o \
c_code/1_1/renderer.nim.o \
c_code/1_1/filters.nim.o \
c_code/1_1/filter__tmpl.nim.o \
c_code/1_1/syntaxes.nim.o \
c_code/1_1/trees.nim.o \
c_code/1_1/types.nim.o \
c_code/1_1/treetab.nim.o \
c_code/1_1/incremental.nim.o \
c_code/1_1/btrees.nim.o \
c_code/1_1/stdlib_md5.nim.o \
c_code/1_1/modulegraphs.nim.o \
c_code/1_1/magicsys.nim.o \
c_code/1_1/bitsets.nim.o \
c_code/1_1/nimsets.nim.o \
c_code/1_1/semfold.nim.o \
c_code/1_1/modulepaths.nim.o \
c_code/1_1/reorder.nim.o \
c_code/1_1/passes.nim.o \
c_code/1_1/vmdef.nim.o \
c_code/1_1/semdata.nim.o \
c_code/1_1/linter.nim.o \
c_code/1_1/nimfix7prettybase.nim.o \
c_code/1_1/lookups.nim.o \
c_code/1_1/semtypinst.nim.o \
c_code/1_1/parampatterns.nim.o \
c_code/1_1/lowerings.nim.o \
c_code/1_1/_7lib7packages7docutils7rstast.nim.o \
c_code/1_1/_7lib7packages7docutils7rst.nim.o \
c_code/1_1/_7lib7packages7docutils7highlite.nim.o \
c_code/2_1/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_1/stdlib_xmltree.nim.o \
c_code/1_1/stdlib_uri.nim.o \
c_code/1_1/stdlib_cgi.nim.o \
c_code/1_1/typesrenderer.nim.o \
c_code/2_1/docgen.nim.o \
c_code/1_1/sigmatch.nim.o \
c_code/1_1/importer.nim.o \
c_code/1_1/procfind.nim.o \
c_code/2_1/pragmas.nim.o \
c_code/1_1/saturate.nim.o \
c_code/1_1/guards.nim.o \
c_code/1_1/sighashes.nim.o \
c_code/1_1/sempass2.nim.o \
c_code/1_1/cgmeth.nim.o \
c_code/1_1/aliases.nim.o \
c_code/1_1/patterns.nim.o \
c_code/1_1/dfa.nim.o \
c_code/1_1/injectdestructors.nim.o \
c_code/1_1/liftlocals.nim.o \
c_code/1_1/lambdalifting.nim.o \
c_code/1_1/closureiters.nim.o \
c_code/1_1/transf.nim.o \
c_code/1_1/vmgen.nim.o \
c_code/1_1/vmdeps.nim.o \
c_code/1_1/vmmarshal.nim.o \
c_code/2_1/gorgeimpl.nim.o \
c_code/1_1/macrocacheimpl.nim.o \
c_code/1_1/evaltempl.nim.o \
c_code/2_6/vm.nim.o \
c_code/1_1/semmacrosanity.nim.o \
c_code/1_1/pluginsupport.nim.o \
c_code/1_1/plugins7locals.nim.o \
c_code/1_1/plugins7itersgen.nim.o \
c_code/1_1/plugins7active.nim.o \
c_code/1_1/semparallel.nim.o \
c_code/1_1/sem.nim.o \
c_code/1_1/ccgutils.nim.o \
c_code/1_1/ndi.nim.o \
c_code/1_1/cgendata.nim.o \
c_code/1_1/ccgmerge.nim.o \
c_code/1_1/enumtostr.nim.o \
c_code/2_1/stdlib_dynlib.nim.o \
c_code/1_1/cgen.nim.o \
c_code/1_1/passaux.nim.o \
c_code/1_1/depends.nim.o \
c_code/1_1/modules.nim.o \
c_code/1_1/jsgen.nim.o \
c_code/1_1/docgen2.nim.o \
c_code/1_1/main.nim.o \
c_code/2_1/scriptconfig.nim.o \
c_code/2_1/cmdlinehelper.nim.o \
c_code/2_1/nim.nim.o $LINK_FLAGS
    ;;
  mips)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_assertions.nim.c -o c_code/1_1/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_dollars.nim.c -o c_code/1_1/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_io.nim.c -o c_code/2_1/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_system.nim.c -o c_code/2_1/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.nim.c -o c_code/2_1/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.nim.c -o c_code/2_1/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_algorithm.nim.c -o c_code/1_1/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.nim.c -o c_code/2_1/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.nim.c -o c_code/2_1/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_pathnorm.nim.c -o c_code/2_1/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_posix.nim.c -o c_code/2_1/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_times.nim.c -o c_code/2_1/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_os.nim.c -o c_code/2_1/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_hashes.nim.c -o c_code/1_1/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strtabs.nim.c -o c_code/1_1/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_streams.nim.c -o c_code/2_1/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cpuinfo.nim.c -o c_code/2_1/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_osproc.nim.c -o c_code/2_1/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sets.nim.c -o c_code/1_1/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pathutils.nim.c -o c_code/2_1/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ropes.nim.c -o c_code/1_1/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_tables.nim.c -o c_code/1_1/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lineinfos.nim.c -o c_code/1_1/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_9/platform.nim.c -o c_code/2_9/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/prefixmatches.nim.c -o c_code/1_1/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strformat.nim.c -o c_code/2_1/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.nim.c -o c_code/2_1/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/options.nim.c -o c_code/2_1/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/msgs.nim.c -o c_code/2_1/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/wordrecg.nim.c -o c_code/1_1/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idents.nim.c -o c_code/1_1/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/condsyms.nim.c -o c_code/1_1/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_sha1.nim.c -o c_code/2_6/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.nim.c -o c_code/2_1/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parsejson.nim.c -o c_code/1_1/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_json.nim.c -o c_code/1_1/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/extccomp.nim.c -o c_code/2_1/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimblecmd.nim.c -o c_code/2_1/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.nim.c -o c_code/2_1/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/commands.nim.c -o c_code/1_1/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/llstream.nim.c -o c_code/1_1/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimlexbase.nim.c -o c_code/1_1/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lexer.nim.c -o c_code/1_1/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimconf.nim.c -o c_code/2_1/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_intsets.nim.c -o c_code/1_1/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idgen.nim.c -o c_code/1_1/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ast.nim.c -o c_code/1_1/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/rodutils.nim.c -o c_code/1_1/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/astalgo.nim.c -o c_code/2_1/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parser.nim.c -o c_code/1_1/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/renderer.nim.c -o c_code/1_1/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filters.nim.c -o c_code/1_1/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filter__tmpl.nim.c -o c_code/1_1/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/syntaxes.nim.c -o c_code/1_1/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/trees.nim.c -o c_code/1_1/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/types.nim.c -o c_code/1_1/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/treetab.nim.c -o c_code/1_1/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/incremental.nim.c -o c_code/1_1/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/btrees.nim.c -o c_code/1_1/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_md5.nim.c -o c_code/1_1/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulegraphs.nim.c -o c_code/1_1/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/magicsys.nim.c -o c_code/1_1/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/bitsets.nim.c -o c_code/1_1/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimsets.nim.c -o c_code/1_1/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semfold.nim.c -o c_code/1_1/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulepaths.nim.c -o c_code/1_1/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/reorder.nim.c -o c_code/1_1/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passes.nim.c -o c_code/1_1/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdef.nim.c -o c_code/1_1/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semdata.nim.c -o c_code/1_1/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/linter.nim.c -o c_code/1_1/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimfix7prettybase.nim.c -o c_code/1_1/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lookups.nim.c -o c_code/1_1/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semtypinst.nim.c -o c_code/1_1/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parampatterns.nim.c -o c_code/1_1/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lowerings.nim.c -o c_code/1_1/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rstast.nim.c -o c_code/1_1/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rst.nim.c -o c_code/1_1/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7highlite.nim.c -o c_code/1_1/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/_7lib7packages7docutils7rstgen.nim.c -o c_code/2_1/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_xmltree.nim.c -o c_code/1_1/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_uri.nim.c -o c_code/1_1/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cgi.nim.c -o c_code/1_1/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/typesrenderer.nim.c -o c_code/1_1/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docgen.nim.c -o c_code/2_1/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sigmatch.nim.c -o c_code/1_1/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/importer.nim.c -o c_code/1_1/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/procfind.nim.c -o c_code/1_1/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pragmas.nim.c -o c_code/2_1/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/saturate.nim.c -o c_code/1_1/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/guards.nim.c -o c_code/1_1/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sighashes.nim.c -o c_code/1_1/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sempass2.nim.c -o c_code/1_1/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgmeth.nim.c -o c_code/1_1/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/aliases.nim.c -o c_code/1_1/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/patterns.nim.c -o c_code/1_1/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/dfa.nim.c -o c_code/1_1/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/injectdestructors.nim.c -o c_code/1_1/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/liftlocals.nim.c -o c_code/1_1/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lambdalifting.nim.c -o c_code/1_1/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/closureiters.nim.c -o c_code/1_1/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/transf.nim.c -o c_code/1_1/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmgen.nim.c -o c_code/1_1/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdeps.nim.c -o c_code/1_1/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmmarshal.nim.c -o c_code/1_1/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/gorgeimpl.nim.c -o c_code/2_1/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/macrocacheimpl.nim.c -o c_code/1_1/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/evaltempl.nim.c -o c_code/1_1/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/vm.nim.c -o c_code/2_6/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semmacrosanity.nim.c -o c_code/1_1/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/pluginsupport.nim.c -o c_code/1_1/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7locals.nim.c -o c_code/1_1/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7itersgen.nim.c -o c_code/1_1/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7active.nim.c -o c_code/1_1/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semparallel.nim.c -o c_code/1_1/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sem.nim.c -o c_code/1_1/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgutils.nim.c -o c_code/1_1/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ndi.nim.c -o c_code/1_1/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgendata.nim.c -o c_code/1_1/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgmerge.nim.c -o c_code/1_1/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/enumtostr.nim.c -o c_code/1_1/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.nim.c -o c_code/2_1/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgen.nim.c -o c_code/1_1/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passaux.nim.c -o c_code/1_1/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/depends.nim.c -o c_code/1_1/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modules.nim.c -o c_code/1_1/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/jsgen.nim.c -o c_code/1_1/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/docgen2.nim.c -o c_code/1_1/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/main.nim.c -o c_code/1_1/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/scriptconfig.nim.c -o c_code/2_1/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/cmdlinehelper.nim.c -o c_code/2_1/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nim.nim.c -o c_code/2_1/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_1/stdlib_assertions.nim.o \
c_code/1_1/stdlib_dollars.nim.o \
c_code/2_1/stdlib_io.nim.o \
c_code/2_1/stdlib_system.nim.o \
c_code/2_1/stdlib_parseutils.nim.o \
c_code/2_1/stdlib_math.nim.o \
c_code/1_1/stdlib_algorithm.nim.o \
c_code/2_1/stdlib_unicode.nim.o \
c_code/2_1/stdlib_strutils.nim.o \
c_code/2_1/stdlib_pathnorm.nim.o \
c_code/2_1/stdlib_posix.nim.o \
c_code/2_1/stdlib_times.nim.o \
c_code/2_1/stdlib_os.nim.o \
c_code/1_1/stdlib_hashes.nim.o \
c_code/1_1/stdlib_strtabs.nim.o \
c_code/2_1/stdlib_streams.nim.o \
c_code/2_1/stdlib_cpuinfo.nim.o \
c_code/2_1/stdlib_osproc.nim.o \
c_code/1_1/stdlib_sets.nim.o \
c_code/2_1/pathutils.nim.o \
c_code/1_1/ropes.nim.o \
c_code/1_1/stdlib_tables.nim.o \
c_code/1_1/lineinfos.nim.o \
c_code/2_9/platform.nim.o \
c_code/1_1/prefixmatches.nim.o \
c_code/2_1/stdlib_strformat.nim.o \
c_code/2_1/stdlib_terminal.nim.o \
c_code/2_1/options.nim.o \
c_code/2_1/msgs.nim.o \
c_code/1_1/wordrecg.nim.o \
c_code/1_1/idents.nim.o \
c_code/1_1/condsyms.nim.o \
c_code/2_6/stdlib_sha1.nim.o \
c_code/2_1/stdlib_lexbase.nim.o \
c_code/1_1/stdlib_parsejson.nim.o \
c_code/1_1/stdlib_json.nim.o \
c_code/2_1/extccomp.nim.o \
c_code/2_1/nimblecmd.nim.o \
c_code/2_1/stdlib_parseopt.nim.o \
c_code/1_1/commands.nim.o \
c_code/1_1/llstream.nim.o \
c_code/1_1/nimlexbase.nim.o \
c_code/1_1/lexer.nim.o \
c_code/2_1/nimconf.nim.o \
c_code/1_1/stdlib_intsets.nim.o \
c_code/1_1/idgen.nim.o \
c_code/1_1/ast.nim.o \
c_code/1_1/rodutils.nim.o \
c_code/2_1/astalgo.nim.o \
c_code/1_1/parser.nim.o \
c_code/1_1/renderer.nim.o \
c_code/1_1/filters.nim.o \
c_code/1_1/filter__tmpl.nim.o \
c_code/1_1/syntaxes.nim.o \
c_code/1_1/trees.nim.o \
c_code/1_1/types.nim.o \
c_code/1_1/treetab.nim.o \
c_code/1_1/incremental.nim.o \
c_code/1_1/btrees.nim.o \
c_code/1_1/stdlib_md5.nim.o \
c_code/1_1/modulegraphs.nim.o \
c_code/1_1/magicsys.nim.o \
c_code/1_1/bitsets.nim.o \
c_code/1_1/nimsets.nim.o \
c_code/1_1/semfold.nim.o \
c_code/1_1/modulepaths.nim.o \
c_code/1_1/reorder.nim.o \
c_code/1_1/passes.nim.o \
c_code/1_1/vmdef.nim.o \
c_code/1_1/semdata.nim.o \
c_code/1_1/linter.nim.o \
c_code/1_1/nimfix7prettybase.nim.o \
c_code/1_1/lookups.nim.o \
c_code/1_1/semtypinst.nim.o \
c_code/1_1/parampatterns.nim.o \
c_code/1_1/lowerings.nim.o \
c_code/1_1/_7lib7packages7docutils7rstast.nim.o \
c_code/1_1/_7lib7packages7docutils7rst.nim.o \
c_code/1_1/_7lib7packages7docutils7highlite.nim.o \
c_code/2_1/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_1/stdlib_xmltree.nim.o \
c_code/1_1/stdlib_uri.nim.o \
c_code/1_1/stdlib_cgi.nim.o \
c_code/1_1/typesrenderer.nim.o \
c_code/2_1/docgen.nim.o \
c_code/1_1/sigmatch.nim.o \
c_code/1_1/importer.nim.o \
c_code/1_1/procfind.nim.o \
c_code/2_1/pragmas.nim.o \
c_code/1_1/saturate.nim.o \
c_code/1_1/guards.nim.o \
c_code/1_1/sighashes.nim.o \
c_code/1_1/sempass2.nim.o \
c_code/1_1/cgmeth.nim.o \
c_code/1_1/aliases.nim.o \
c_code/1_1/patterns.nim.o \
c_code/1_1/dfa.nim.o \
c_code/1_1/injectdestructors.nim.o \
c_code/1_1/liftlocals.nim.o \
c_code/1_1/lambdalifting.nim.o \
c_code/1_1/closureiters.nim.o \
c_code/1_1/transf.nim.o \
c_code/1_1/vmgen.nim.o \
c_code/1_1/vmdeps.nim.o \
c_code/1_1/vmmarshal.nim.o \
c_code/2_1/gorgeimpl.nim.o \
c_code/1_1/macrocacheimpl.nim.o \
c_code/1_1/evaltempl.nim.o \
c_code/2_6/vm.nim.o \
c_code/1_1/semmacrosanity.nim.o \
c_code/1_1/pluginsupport.nim.o \
c_code/1_1/plugins7locals.nim.o \
c_code/1_1/plugins7itersgen.nim.o \
c_code/1_1/plugins7active.nim.o \
c_code/1_1/semparallel.nim.o \
c_code/1_1/sem.nim.o \
c_code/1_1/ccgutils.nim.o \
c_code/1_1/ndi.nim.o \
c_code/1_1/cgendata.nim.o \
c_code/1_1/ccgmerge.nim.o \
c_code/1_1/enumtostr.nim.o \
c_code/2_1/stdlib_dynlib.nim.o \
c_code/1_1/cgen.nim.o \
c_code/1_1/passaux.nim.o \
c_code/1_1/depends.nim.o \
c_code/1_1/modules.nim.o \
c_code/1_1/jsgen.nim.o \
c_code/1_1/docgen2.nim.o \
c_code/1_1/main.nim.o \
c_code/2_1/scriptconfig.nim.o \
c_code/2_1/cmdlinehelper.nim.o \
c_code/2_1/nim.nim.o $LINK_FLAGS
    ;;
  mipsel)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_assertions.nim.c -o c_code/1_1/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_dollars.nim.c -o c_code/1_1/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_io.nim.c -o c_code/2_1/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_system.nim.c -o c_code/2_1/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.nim.c -o c_code/2_1/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.nim.c -o c_code/2_1/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_algorithm.nim.c -o c_code/1_1/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.nim.c -o c_code/2_1/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.nim.c -o c_code/2_1/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_pathnorm.nim.c -o c_code/2_1/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_posix.nim.c -o c_code/2_1/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_times.nim.c -o c_code/2_1/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_os.nim.c -o c_code/2_1/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_hashes.nim.c -o c_code/1_1/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strtabs.nim.c -o c_code/1_1/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_streams.nim.c -o c_code/2_1/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cpuinfo.nim.c -o c_code/2_1/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_osproc.nim.c -o c_code/2_1/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sets.nim.c -o c_code/1_1/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pathutils.nim.c -o c_code/2_1/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ropes.nim.c -o c_code/1_1/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_tables.nim.c -o c_code/1_1/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lineinfos.nim.c -o c_code/1_1/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_10/platform.nim.c -o c_code/2_10/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/prefixmatches.nim.c -o c_code/1_1/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strformat.nim.c -o c_code/2_1/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.nim.c -o c_code/2_1/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/options.nim.c -o c_code/2_1/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/msgs.nim.c -o c_code/2_1/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/wordrecg.nim.c -o c_code/1_1/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idents.nim.c -o c_code/1_1/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/condsyms.nim.c -o c_code/1_1/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sha1.nim.c -o c_code/1_1/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.nim.c -o c_code/2_1/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parsejson.nim.c -o c_code/1_1/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_json.nim.c -o c_code/1_1/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/extccomp.nim.c -o c_code/2_1/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimblecmd.nim.c -o c_code/2_1/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.nim.c -o c_code/2_1/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/commands.nim.c -o c_code/1_1/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/llstream.nim.c -o c_code/1_1/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimlexbase.nim.c -o c_code/1_1/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lexer.nim.c -o c_code/1_1/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimconf.nim.c -o c_code/2_1/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_intsets.nim.c -o c_code/1_1/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idgen.nim.c -o c_code/1_1/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ast.nim.c -o c_code/1_1/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/rodutils.nim.c -o c_code/1_1/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/astalgo.nim.c -o c_code/2_1/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parser.nim.c -o c_code/1_1/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/renderer.nim.c -o c_code/1_1/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filters.nim.c -o c_code/1_1/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filter__tmpl.nim.c -o c_code/1_1/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/syntaxes.nim.c -o c_code/1_1/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/trees.nim.c -o c_code/1_1/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/types.nim.c -o c_code/1_1/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/treetab.nim.c -o c_code/1_1/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/incremental.nim.c -o c_code/1_1/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/btrees.nim.c -o c_code/1_1/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_md5.nim.c -o c_code/1_1/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulegraphs.nim.c -o c_code/1_1/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/magicsys.nim.c -o c_code/1_1/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/bitsets.nim.c -o c_code/1_1/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimsets.nim.c -o c_code/1_1/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semfold.nim.c -o c_code/1_1/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulepaths.nim.c -o c_code/1_1/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/reorder.nim.c -o c_code/1_1/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passes.nim.c -o c_code/1_1/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdef.nim.c -o c_code/1_1/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semdata.nim.c -o c_code/1_1/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/linter.nim.c -o c_code/1_1/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimfix7prettybase.nim.c -o c_code/1_1/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lookups.nim.c -o c_code/1_1/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semtypinst.nim.c -o c_code/1_1/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parampatterns.nim.c -o c_code/1_1/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lowerings.nim.c -o c_code/1_1/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rstast.nim.c -o c_code/1_1/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rst.nim.c -o c_code/1_1/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7highlite.nim.c -o c_code/1_1/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/_7lib7packages7docutils7rstgen.nim.c -o c_code/2_1/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_xmltree.nim.c -o c_code/1_1/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_uri.nim.c -o c_code/1_1/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cgi.nim.c -o c_code/1_1/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/typesrenderer.nim.c -o c_code/1_1/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docgen.nim.c -o c_code/2_1/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sigmatch.nim.c -o c_code/1_1/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/importer.nim.c -o c_code/1_1/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/procfind.nim.c -o c_code/1_1/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pragmas.nim.c -o c_code/2_1/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/saturate.nim.c -o c_code/1_1/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/guards.nim.c -o c_code/1_1/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sighashes.nim.c -o c_code/1_1/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sempass2.nim.c -o c_code/1_1/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgmeth.nim.c -o c_code/1_1/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/aliases.nim.c -o c_code/1_1/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/patterns.nim.c -o c_code/1_1/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/dfa.nim.c -o c_code/1_1/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/injectdestructors.nim.c -o c_code/1_1/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/liftlocals.nim.c -o c_code/1_1/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lambdalifting.nim.c -o c_code/1_1/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/closureiters.nim.c -o c_code/1_1/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/transf.nim.c -o c_code/1_1/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmgen.nim.c -o c_code/1_1/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdeps.nim.c -o c_code/1_1/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmmarshal.nim.c -o c_code/1_1/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/gorgeimpl.nim.c -o c_code/2_1/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/macrocacheimpl.nim.c -o c_code/1_1/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/evaltempl.nim.c -o c_code/1_1/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/vm.nim.c -o c_code/2_1/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semmacrosanity.nim.c -o c_code/1_1/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/pluginsupport.nim.c -o c_code/1_1/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7locals.nim.c -o c_code/1_1/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7itersgen.nim.c -o c_code/1_1/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7active.nim.c -o c_code/1_1/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semparallel.nim.c -o c_code/1_1/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sem.nim.c -o c_code/1_1/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgutils.nim.c -o c_code/1_1/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ndi.nim.c -o c_code/1_1/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgendata.nim.c -o c_code/1_1/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgmerge.nim.c -o c_code/1_1/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/enumtostr.nim.c -o c_code/1_1/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.nim.c -o c_code/2_1/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgen.nim.c -o c_code/1_1/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passaux.nim.c -o c_code/1_1/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/depends.nim.c -o c_code/1_1/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modules.nim.c -o c_code/1_1/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/jsgen.nim.c -o c_code/1_1/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/docgen2.nim.c -o c_code/1_1/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/main.nim.c -o c_code/1_1/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/scriptconfig.nim.c -o c_code/2_1/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/cmdlinehelper.nim.c -o c_code/2_1/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nim.nim.c -o c_code/2_1/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_1/stdlib_assertions.nim.o \
c_code/1_1/stdlib_dollars.nim.o \
c_code/2_1/stdlib_io.nim.o \
c_code/2_1/stdlib_system.nim.o \
c_code/2_1/stdlib_parseutils.nim.o \
c_code/2_1/stdlib_math.nim.o \
c_code/1_1/stdlib_algorithm.nim.o \
c_code/2_1/stdlib_unicode.nim.o \
c_code/2_1/stdlib_strutils.nim.o \
c_code/2_1/stdlib_pathnorm.nim.o \
c_code/2_1/stdlib_posix.nim.o \
c_code/2_1/stdlib_times.nim.o \
c_code/2_1/stdlib_os.nim.o \
c_code/1_1/stdlib_hashes.nim.o \
c_code/1_1/stdlib_strtabs.nim.o \
c_code/2_1/stdlib_streams.nim.o \
c_code/2_1/stdlib_cpuinfo.nim.o \
c_code/2_1/stdlib_osproc.nim.o \
c_code/1_1/stdlib_sets.nim.o \
c_code/2_1/pathutils.nim.o \
c_code/1_1/ropes.nim.o \
c_code/1_1/stdlib_tables.nim.o \
c_code/1_1/lineinfos.nim.o \
c_code/2_10/platform.nim.o \
c_code/1_1/prefixmatches.nim.o \
c_code/2_1/stdlib_strformat.nim.o \
c_code/2_1/stdlib_terminal.nim.o \
c_code/2_1/options.nim.o \
c_code/2_1/msgs.nim.o \
c_code/1_1/wordrecg.nim.o \
c_code/1_1/idents.nim.o \
c_code/1_1/condsyms.nim.o \
c_code/1_1/stdlib_sha1.nim.o \
c_code/2_1/stdlib_lexbase.nim.o \
c_code/1_1/stdlib_parsejson.nim.o \
c_code/1_1/stdlib_json.nim.o \
c_code/2_1/extccomp.nim.o \
c_code/2_1/nimblecmd.nim.o \
c_code/2_1/stdlib_parseopt.nim.o \
c_code/1_1/commands.nim.o \
c_code/1_1/llstream.nim.o \
c_code/1_1/nimlexbase.nim.o \
c_code/1_1/lexer.nim.o \
c_code/2_1/nimconf.nim.o \
c_code/1_1/stdlib_intsets.nim.o \
c_code/1_1/idgen.nim.o \
c_code/1_1/ast.nim.o \
c_code/1_1/rodutils.nim.o \
c_code/2_1/astalgo.nim.o \
c_code/1_1/parser.nim.o \
c_code/1_1/renderer.nim.o \
c_code/1_1/filters.nim.o \
c_code/1_1/filter__tmpl.nim.o \
c_code/1_1/syntaxes.nim.o \
c_code/1_1/trees.nim.o \
c_code/1_1/types.nim.o \
c_code/1_1/treetab.nim.o \
c_code/1_1/incremental.nim.o \
c_code/1_1/btrees.nim.o \
c_code/1_1/stdlib_md5.nim.o \
c_code/1_1/modulegraphs.nim.o \
c_code/1_1/magicsys.nim.o \
c_code/1_1/bitsets.nim.o \
c_code/1_1/nimsets.nim.o \
c_code/1_1/semfold.nim.o \
c_code/1_1/modulepaths.nim.o \
c_code/1_1/reorder.nim.o \
c_code/1_1/passes.nim.o \
c_code/1_1/vmdef.nim.o \
c_code/1_1/semdata.nim.o \
c_code/1_1/linter.nim.o \
c_code/1_1/nimfix7prettybase.nim.o \
c_code/1_1/lookups.nim.o \
c_code/1_1/semtypinst.nim.o \
c_code/1_1/parampatterns.nim.o \
c_code/1_1/lowerings.nim.o \
c_code/1_1/_7lib7packages7docutils7rstast.nim.o \
c_code/1_1/_7lib7packages7docutils7rst.nim.o \
c_code/1_1/_7lib7packages7docutils7highlite.nim.o \
c_code/2_1/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_1/stdlib_xmltree.nim.o \
c_code/1_1/stdlib_uri.nim.o \
c_code/1_1/stdlib_cgi.nim.o \
c_code/1_1/typesrenderer.nim.o \
c_code/2_1/docgen.nim.o \
c_code/1_1/sigmatch.nim.o \
c_code/1_1/importer.nim.o \
c_code/1_1/procfind.nim.o \
c_code/2_1/pragmas.nim.o \
c_code/1_1/saturate.nim.o \
c_code/1_1/guards.nim.o \
c_code/1_1/sighashes.nim.o \
c_code/1_1/sempass2.nim.o \
c_code/1_1/cgmeth.nim.o \
c_code/1_1/aliases.nim.o \
c_code/1_1/patterns.nim.o \
c_code/1_1/dfa.nim.o \
c_code/1_1/injectdestructors.nim.o \
c_code/1_1/liftlocals.nim.o \
c_code/1_1/lambdalifting.nim.o \
c_code/1_1/closureiters.nim.o \
c_code/1_1/transf.nim.o \
c_code/1_1/vmgen.nim.o \
c_code/1_1/vmdeps.nim.o \
c_code/1_1/vmmarshal.nim.o \
c_code/2_1/gorgeimpl.nim.o \
c_code/1_1/macrocacheimpl.nim.o \
c_code/1_1/evaltempl.nim.o \
c_code/2_1/vm.nim.o \
c_code/1_1/semmacrosanity.nim.o \
c_code/1_1/pluginsupport.nim.o \
c_code/1_1/plugins7locals.nim.o \
c_code/1_1/plugins7itersgen.nim.o \
c_code/1_1/plugins7active.nim.o \
c_code/1_1/semparallel.nim.o \
c_code/1_1/sem.nim.o \
c_code/1_1/ccgutils.nim.o \
c_code/1_1/ndi.nim.o \
c_code/1_1/cgendata.nim.o \
c_code/1_1/ccgmerge.nim.o \
c_code/1_1/enumtostr.nim.o \
c_code/2_1/stdlib_dynlib.nim.o \
c_code/1_1/cgen.nim.o \
c_code/1_1/passaux.nim.o \
c_code/1_1/depends.nim.o \
c_code/1_1/modules.nim.o \
c_code/1_1/jsgen.nim.o \
c_code/1_1/docgen2.nim.o \
c_code/1_1/main.nim.o \
c_code/2_1/scriptconfig.nim.o \
c_code/2_1/cmdlinehelper.nim.o \
c_code/2_1/nim.nim.o $LINK_FLAGS
    ;;
  mips64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_assertions.nim.c -o c_code/1_2/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_dollars.nim.c -o c_code/1_2/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_io.nim.c -o c_code/2_3/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_system.nim.c -o c_code/2_3/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.nim.c -o c_code/2_2/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.nim.c -o c_code/2_2/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_algorithm.nim.c -o c_code/1_2/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.nim.c -o c_code/2_2/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.nim.c -o c_code/2_2/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_pathnorm.nim.c -o c_code/2_2/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_posix.nim.c -o c_code/2_3/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_times.nim.c -o c_code/2_2/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_os.nim.c -o c_code/2_3/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_hashes.nim.c -o c_code/1_2/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strtabs.nim.c -o c_code/1_2/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_streams.nim.c -o c_code/2_3/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_cpuinfo.nim.c -o c_code/2_3/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_osproc.nim.c -o c_code/2_3/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sets.nim.c -o c_code/1_2/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/pathutils.nim.c -o c_code/2_2/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ropes.nim.c -o c_code/1_2/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_tables.nim.c -o c_code/1_2/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lineinfos.nim.c -o c_code/1_2/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_11/platform.nim.c -o c_code/2_11/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/prefixmatches.nim.c -o c_code/1_2/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strformat.nim.c -o c_code/2_2/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.nim.c -o c_code/2_2/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/options.nim.c -o c_code/2_3/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/msgs.nim.c -o c_code/2_3/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/wordrecg.nim.c -o c_code/1_2/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idents.nim.c -o c_code/1_2/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/condsyms.nim.c -o c_code/1_2/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_sha1.nim.c -o c_code/2_4/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.nim.c -o c_code/2_2/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parsejson.nim.c -o c_code/1_2/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_json.nim.c -o c_code/1_2/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/extccomp.nim.c -o c_code/2_3/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/nimblecmd.nim.c -o c_code/2_3/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.nim.c -o c_code/2_2/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/commands.nim.c -o c_code/1_2/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/llstream.nim.c -o c_code/1_2/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimlexbase.nim.c -o c_code/1_2/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lexer.nim.c -o c_code/1_2/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimconf.nim.c -o c_code/2_2/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_intsets.nim.c -o c_code/1_2/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idgen.nim.c -o c_code/1_2/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ast.nim.c -o c_code/1_2/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/rodutils.nim.c -o c_code/1_2/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/astalgo.nim.c -o c_code/2_2/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parser.nim.c -o c_code/1_2/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/renderer.nim.c -o c_code/1_2/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filters.nim.c -o c_code/1_2/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filter__tmpl.nim.c -o c_code/1_2/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/syntaxes.nim.c -o c_code/1_2/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/trees.nim.c -o c_code/1_2/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/types.nim.c -o c_code/1_2/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/treetab.nim.c -o c_code/1_2/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/incremental.nim.c -o c_code/1_2/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/btrees.nim.c -o c_code/1_2/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_md5.nim.c -o c_code/1_2/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulegraphs.nim.c -o c_code/1_2/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/magicsys.nim.c -o c_code/1_2/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/bitsets.nim.c -o c_code/1_2/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimsets.nim.c -o c_code/1_2/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semfold.nim.c -o c_code/1_2/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulepaths.nim.c -o c_code/1_2/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/reorder.nim.c -o c_code/1_2/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passes.nim.c -o c_code/1_2/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdef.nim.c -o c_code/1_2/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semdata.nim.c -o c_code/1_2/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/linter.nim.c -o c_code/1_2/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimfix7prettybase.nim.c -o c_code/1_2/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lookups.nim.c -o c_code/1_2/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semtypinst.nim.c -o c_code/1_2/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parampatterns.nim.c -o c_code/1_2/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lowerings.nim.c -o c_code/1_2/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rstast.nim.c -o c_code/1_2/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rst.nim.c -o c_code/1_2/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7highlite.nim.c -o c_code/1_2/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/_7lib7packages7docutils7rstgen.nim.c -o c_code/2_3/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_xmltree.nim.c -o c_code/1_2/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_uri.nim.c -o c_code/1_2/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cgi.nim.c -o c_code/1_2/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/typesrenderer.nim.c -o c_code/1_2/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docgen.nim.c -o c_code/2_2/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sigmatch.nim.c -o c_code/1_2/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/importer.nim.c -o c_code/1_2/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/procfind.nim.c -o c_code/1_2/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/pragmas.nim.c -o c_code/2_3/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/saturate.nim.c -o c_code/1_2/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/guards.nim.c -o c_code/1_2/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sighashes.nim.c -o c_code/1_2/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sempass2.nim.c -o c_code/1_2/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgmeth.nim.c -o c_code/1_2/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/aliases.nim.c -o c_code/1_2/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/patterns.nim.c -o c_code/1_2/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/dfa.nim.c -o c_code/1_2/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/injectdestructors.nim.c -o c_code/1_2/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/liftlocals.nim.c -o c_code/1_2/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lambdalifting.nim.c -o c_code/1_2/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/closureiters.nim.c -o c_code/1_2/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/transf.nim.c -o c_code/1_2/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmgen.nim.c -o c_code/1_2/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdeps.nim.c -o c_code/1_2/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmmarshal.nim.c -o c_code/1_2/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/gorgeimpl.nim.c -o c_code/2_3/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/macrocacheimpl.nim.c -o c_code/1_2/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/evaltempl.nim.c -o c_code/1_2/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/vm.nim.c -o c_code/2_4/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semmacrosanity.nim.c -o c_code/1_2/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/pluginsupport.nim.c -o c_code/1_2/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7locals.nim.c -o c_code/1_2/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7itersgen.nim.c -o c_code/1_2/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7active.nim.c -o c_code/1_2/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semparallel.nim.c -o c_code/1_2/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sem.nim.c -o c_code/1_2/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgutils.nim.c -o c_code/1_2/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ndi.nim.c -o c_code/1_2/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgendata.nim.c -o c_code/1_2/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgmerge.nim.c -o c_code/1_2/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/enumtostr.nim.c -o c_code/1_2/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.nim.c -o c_code/2_2/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgen.nim.c -o c_code/1_2/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passaux.nim.c -o c_code/1_2/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/depends.nim.c -o c_code/1_2/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modules.nim.c -o c_code/1_2/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/jsgen.nim.c -o c_code/1_2/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/docgen2.nim.c -o c_code/1_2/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/main.nim.c -o c_code/1_2/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/scriptconfig.nim.c -o c_code/2_3/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/cmdlinehelper.nim.c -o c_code/2_3/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nim.nim.c -o c_code/2_2/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_2/stdlib_assertions.nim.o \
c_code/1_2/stdlib_dollars.nim.o \
c_code/2_3/stdlib_io.nim.o \
c_code/2_3/stdlib_system.nim.o \
c_code/2_2/stdlib_parseutils.nim.o \
c_code/2_2/stdlib_math.nim.o \
c_code/1_2/stdlib_algorithm.nim.o \
c_code/2_2/stdlib_unicode.nim.o \
c_code/2_2/stdlib_strutils.nim.o \
c_code/2_2/stdlib_pathnorm.nim.o \
c_code/2_3/stdlib_posix.nim.o \
c_code/2_2/stdlib_times.nim.o \
c_code/2_3/stdlib_os.nim.o \
c_code/1_2/stdlib_hashes.nim.o \
c_code/1_2/stdlib_strtabs.nim.o \
c_code/2_3/stdlib_streams.nim.o \
c_code/2_3/stdlib_cpuinfo.nim.o \
c_code/2_3/stdlib_osproc.nim.o \
c_code/1_2/stdlib_sets.nim.o \
c_code/2_2/pathutils.nim.o \
c_code/1_2/ropes.nim.o \
c_code/1_2/stdlib_tables.nim.o \
c_code/1_2/lineinfos.nim.o \
c_code/2_11/platform.nim.o \
c_code/1_2/prefixmatches.nim.o \
c_code/2_2/stdlib_strformat.nim.o \
c_code/2_2/stdlib_terminal.nim.o \
c_code/2_3/options.nim.o \
c_code/2_3/msgs.nim.o \
c_code/1_2/wordrecg.nim.o \
c_code/1_2/idents.nim.o \
c_code/1_2/condsyms.nim.o \
c_code/2_4/stdlib_sha1.nim.o \
c_code/2_2/stdlib_lexbase.nim.o \
c_code/1_2/stdlib_parsejson.nim.o \
c_code/1_2/stdlib_json.nim.o \
c_code/2_3/extccomp.nim.o \
c_code/2_3/nimblecmd.nim.o \
c_code/2_2/stdlib_parseopt.nim.o \
c_code/1_2/commands.nim.o \
c_code/1_2/llstream.nim.o \
c_code/1_2/nimlexbase.nim.o \
c_code/1_2/lexer.nim.o \
c_code/2_2/nimconf.nim.o \
c_code/1_2/stdlib_intsets.nim.o \
c_code/1_2/idgen.nim.o \
c_code/1_2/ast.nim.o \
c_code/1_2/rodutils.nim.o \
c_code/2_2/astalgo.nim.o \
c_code/1_2/parser.nim.o \
c_code/1_2/renderer.nim.o \
c_code/1_2/filters.nim.o \
c_code/1_2/filter__tmpl.nim.o \
c_code/1_2/syntaxes.nim.o \
c_code/1_2/trees.nim.o \
c_code/1_2/types.nim.o \
c_code/1_2/treetab.nim.o \
c_code/1_2/incremental.nim.o \
c_code/1_2/btrees.nim.o \
c_code/1_2/stdlib_md5.nim.o \
c_code/1_2/modulegraphs.nim.o \
c_code/1_2/magicsys.nim.o \
c_code/1_2/bitsets.nim.o \
c_code/1_2/nimsets.nim.o \
c_code/1_2/semfold.nim.o \
c_code/1_2/modulepaths.nim.o \
c_code/1_2/reorder.nim.o \
c_code/1_2/passes.nim.o \
c_code/1_2/vmdef.nim.o \
c_code/1_2/semdata.nim.o \
c_code/1_2/linter.nim.o \
c_code/1_2/nimfix7prettybase.nim.o \
c_code/1_2/lookups.nim.o \
c_code/1_2/semtypinst.nim.o \
c_code/1_2/parampatterns.nim.o \
c_code/1_2/lowerings.nim.o \
c_code/1_2/_7lib7packages7docutils7rstast.nim.o \
c_code/1_2/_7lib7packages7docutils7rst.nim.o \
c_code/1_2/_7lib7packages7docutils7highlite.nim.o \
c_code/2_3/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_2/stdlib_xmltree.nim.o \
c_code/1_2/stdlib_uri.nim.o \
c_code/1_2/stdlib_cgi.nim.o \
c_code/1_2/typesrenderer.nim.o \
c_code/2_2/docgen.nim.o \
c_code/1_2/sigmatch.nim.o \
c_code/1_2/importer.nim.o \
c_code/1_2/procfind.nim.o \
c_code/2_3/pragmas.nim.o \
c_code/1_2/saturate.nim.o \
c_code/1_2/guards.nim.o \
c_code/1_2/sighashes.nim.o \
c_code/1_2/sempass2.nim.o \
c_code/1_2/cgmeth.nim.o \
c_code/1_2/aliases.nim.o \
c_code/1_2/patterns.nim.o \
c_code/1_2/dfa.nim.o \
c_code/1_2/injectdestructors.nim.o \
c_code/1_2/liftlocals.nim.o \
c_code/1_2/lambdalifting.nim.o \
c_code/1_2/closureiters.nim.o \
c_code/1_2/transf.nim.o \
c_code/1_2/vmgen.nim.o \
c_code/1_2/vmdeps.nim.o \
c_code/1_2/vmmarshal.nim.o \
c_code/2_3/gorgeimpl.nim.o \
c_code/1_2/macrocacheimpl.nim.o \
c_code/1_2/evaltempl.nim.o \
c_code/2_4/vm.nim.o \
c_code/1_2/semmacrosanity.nim.o \
c_code/1_2/pluginsupport.nim.o \
c_code/1_2/plugins7locals.nim.o \
c_code/1_2/plugins7itersgen.nim.o \
c_code/1_2/plugins7active.nim.o \
c_code/1_2/semparallel.nim.o \
c_code/1_2/sem.nim.o \
c_code/1_2/ccgutils.nim.o \
c_code/1_2/ndi.nim.o \
c_code/1_2/cgendata.nim.o \
c_code/1_2/ccgmerge.nim.o \
c_code/1_2/enumtostr.nim.o \
c_code/2_2/stdlib_dynlib.nim.o \
c_code/1_2/cgen.nim.o \
c_code/1_2/passaux.nim.o \
c_code/1_2/depends.nim.o \
c_code/1_2/modules.nim.o \
c_code/1_2/jsgen.nim.o \
c_code/1_2/docgen2.nim.o \
c_code/1_2/main.nim.o \
c_code/2_3/scriptconfig.nim.o \
c_code/2_3/cmdlinehelper.nim.o \
c_code/2_2/nim.nim.o $LINK_FLAGS
    ;;
  mips64el)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_assertions.nim.c -o c_code/1_2/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_dollars.nim.c -o c_code/1_2/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_io.nim.c -o c_code/2_3/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_system.nim.c -o c_code/2_3/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.nim.c -o c_code/2_2/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.nim.c -o c_code/2_2/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_algorithm.nim.c -o c_code/1_2/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.nim.c -o c_code/2_2/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.nim.c -o c_code/2_2/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_pathnorm.nim.c -o c_code/2_2/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_posix.nim.c -o c_code/2_3/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_times.nim.c -o c_code/2_2/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_os.nim.c -o c_code/2_3/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_hashes.nim.c -o c_code/1_2/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strtabs.nim.c -o c_code/1_2/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_streams.nim.c -o c_code/2_3/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_cpuinfo.nim.c -o c_code/2_3/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_osproc.nim.c -o c_code/2_3/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sets.nim.c -o c_code/1_2/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/pathutils.nim.c -o c_code/2_2/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ropes.nim.c -o c_code/1_2/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_tables.nim.c -o c_code/1_2/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lineinfos.nim.c -o c_code/1_2/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_12/platform.nim.c -o c_code/2_12/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/prefixmatches.nim.c -o c_code/1_2/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strformat.nim.c -o c_code/2_2/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.nim.c -o c_code/2_2/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/options.nim.c -o c_code/2_3/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/msgs.nim.c -o c_code/2_3/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/wordrecg.nim.c -o c_code/1_2/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idents.nim.c -o c_code/1_2/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/condsyms.nim.c -o c_code/1_2/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sha1.nim.c -o c_code/1_2/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.nim.c -o c_code/2_2/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parsejson.nim.c -o c_code/1_2/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_json.nim.c -o c_code/1_2/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/extccomp.nim.c -o c_code/2_3/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/nimblecmd.nim.c -o c_code/2_3/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.nim.c -o c_code/2_2/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/commands.nim.c -o c_code/1_2/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/llstream.nim.c -o c_code/1_2/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimlexbase.nim.c -o c_code/1_2/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lexer.nim.c -o c_code/1_2/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimconf.nim.c -o c_code/2_2/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_intsets.nim.c -o c_code/1_2/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idgen.nim.c -o c_code/1_2/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ast.nim.c -o c_code/1_2/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/rodutils.nim.c -o c_code/1_2/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/astalgo.nim.c -o c_code/2_2/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parser.nim.c -o c_code/1_2/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/renderer.nim.c -o c_code/1_2/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filters.nim.c -o c_code/1_2/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filter__tmpl.nim.c -o c_code/1_2/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/syntaxes.nim.c -o c_code/1_2/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/trees.nim.c -o c_code/1_2/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/types.nim.c -o c_code/1_2/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/treetab.nim.c -o c_code/1_2/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/incremental.nim.c -o c_code/1_2/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/btrees.nim.c -o c_code/1_2/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_md5.nim.c -o c_code/1_2/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulegraphs.nim.c -o c_code/1_2/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/magicsys.nim.c -o c_code/1_2/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/bitsets.nim.c -o c_code/1_2/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimsets.nim.c -o c_code/1_2/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semfold.nim.c -o c_code/1_2/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulepaths.nim.c -o c_code/1_2/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/reorder.nim.c -o c_code/1_2/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passes.nim.c -o c_code/1_2/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdef.nim.c -o c_code/1_2/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semdata.nim.c -o c_code/1_2/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/linter.nim.c -o c_code/1_2/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimfix7prettybase.nim.c -o c_code/1_2/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lookups.nim.c -o c_code/1_2/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semtypinst.nim.c -o c_code/1_2/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parampatterns.nim.c -o c_code/1_2/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lowerings.nim.c -o c_code/1_2/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rstast.nim.c -o c_code/1_2/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rst.nim.c -o c_code/1_2/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7highlite.nim.c -o c_code/1_2/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/_7lib7packages7docutils7rstgen.nim.c -o c_code/2_3/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_xmltree.nim.c -o c_code/1_2/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_uri.nim.c -o c_code/1_2/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cgi.nim.c -o c_code/1_2/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/typesrenderer.nim.c -o c_code/1_2/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docgen.nim.c -o c_code/2_2/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sigmatch.nim.c -o c_code/1_2/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/importer.nim.c -o c_code/1_2/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/procfind.nim.c -o c_code/1_2/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/pragmas.nim.c -o c_code/2_3/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/saturate.nim.c -o c_code/1_2/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/guards.nim.c -o c_code/1_2/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sighashes.nim.c -o c_code/1_2/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sempass2.nim.c -o c_code/1_2/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgmeth.nim.c -o c_code/1_2/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/aliases.nim.c -o c_code/1_2/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/patterns.nim.c -o c_code/1_2/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/dfa.nim.c -o c_code/1_2/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/injectdestructors.nim.c -o c_code/1_2/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/liftlocals.nim.c -o c_code/1_2/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lambdalifting.nim.c -o c_code/1_2/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/closureiters.nim.c -o c_code/1_2/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/transf.nim.c -o c_code/1_2/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmgen.nim.c -o c_code/1_2/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdeps.nim.c -o c_code/1_2/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmmarshal.nim.c -o c_code/1_2/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/gorgeimpl.nim.c -o c_code/2_3/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/macrocacheimpl.nim.c -o c_code/1_2/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/evaltempl.nim.c -o c_code/1_2/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/vm.nim.c -o c_code/2_3/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semmacrosanity.nim.c -o c_code/1_2/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/pluginsupport.nim.c -o c_code/1_2/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7locals.nim.c -o c_code/1_2/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7itersgen.nim.c -o c_code/1_2/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7active.nim.c -o c_code/1_2/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semparallel.nim.c -o c_code/1_2/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sem.nim.c -o c_code/1_2/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgutils.nim.c -o c_code/1_2/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ndi.nim.c -o c_code/1_2/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgendata.nim.c -o c_code/1_2/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgmerge.nim.c -o c_code/1_2/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/enumtostr.nim.c -o c_code/1_2/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.nim.c -o c_code/2_2/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgen.nim.c -o c_code/1_2/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passaux.nim.c -o c_code/1_2/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/depends.nim.c -o c_code/1_2/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modules.nim.c -o c_code/1_2/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/jsgen.nim.c -o c_code/1_2/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/docgen2.nim.c -o c_code/1_2/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/main.nim.c -o c_code/1_2/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/scriptconfig.nim.c -o c_code/2_3/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/cmdlinehelper.nim.c -o c_code/2_3/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nim.nim.c -o c_code/2_2/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_2/stdlib_assertions.nim.o \
c_code/1_2/stdlib_dollars.nim.o \
c_code/2_3/stdlib_io.nim.o \
c_code/2_3/stdlib_system.nim.o \
c_code/2_2/stdlib_parseutils.nim.o \
c_code/2_2/stdlib_math.nim.o \
c_code/1_2/stdlib_algorithm.nim.o \
c_code/2_2/stdlib_unicode.nim.o \
c_code/2_2/stdlib_strutils.nim.o \
c_code/2_2/stdlib_pathnorm.nim.o \
c_code/2_3/stdlib_posix.nim.o \
c_code/2_2/stdlib_times.nim.o \
c_code/2_3/stdlib_os.nim.o \
c_code/1_2/stdlib_hashes.nim.o \
c_code/1_2/stdlib_strtabs.nim.o \
c_code/2_3/stdlib_streams.nim.o \
c_code/2_3/stdlib_cpuinfo.nim.o \
c_code/2_3/stdlib_osproc.nim.o \
c_code/1_2/stdlib_sets.nim.o \
c_code/2_2/pathutils.nim.o \
c_code/1_2/ropes.nim.o \
c_code/1_2/stdlib_tables.nim.o \
c_code/1_2/lineinfos.nim.o \
c_code/2_12/platform.nim.o \
c_code/1_2/prefixmatches.nim.o \
c_code/2_2/stdlib_strformat.nim.o \
c_code/2_2/stdlib_terminal.nim.o \
c_code/2_3/options.nim.o \
c_code/2_3/msgs.nim.o \
c_code/1_2/wordrecg.nim.o \
c_code/1_2/idents.nim.o \
c_code/1_2/condsyms.nim.o \
c_code/1_2/stdlib_sha1.nim.o \
c_code/2_2/stdlib_lexbase.nim.o \
c_code/1_2/stdlib_parsejson.nim.o \
c_code/1_2/stdlib_json.nim.o \
c_code/2_3/extccomp.nim.o \
c_code/2_3/nimblecmd.nim.o \
c_code/2_2/stdlib_parseopt.nim.o \
c_code/1_2/commands.nim.o \
c_code/1_2/llstream.nim.o \
c_code/1_2/nimlexbase.nim.o \
c_code/1_2/lexer.nim.o \
c_code/2_2/nimconf.nim.o \
c_code/1_2/stdlib_intsets.nim.o \
c_code/1_2/idgen.nim.o \
c_code/1_2/ast.nim.o \
c_code/1_2/rodutils.nim.o \
c_code/2_2/astalgo.nim.o \
c_code/1_2/parser.nim.o \
c_code/1_2/renderer.nim.o \
c_code/1_2/filters.nim.o \
c_code/1_2/filter__tmpl.nim.o \
c_code/1_2/syntaxes.nim.o \
c_code/1_2/trees.nim.o \
c_code/1_2/types.nim.o \
c_code/1_2/treetab.nim.o \
c_code/1_2/incremental.nim.o \
c_code/1_2/btrees.nim.o \
c_code/1_2/stdlib_md5.nim.o \
c_code/1_2/modulegraphs.nim.o \
c_code/1_2/magicsys.nim.o \
c_code/1_2/bitsets.nim.o \
c_code/1_2/nimsets.nim.o \
c_code/1_2/semfold.nim.o \
c_code/1_2/modulepaths.nim.o \
c_code/1_2/reorder.nim.o \
c_code/1_2/passes.nim.o \
c_code/1_2/vmdef.nim.o \
c_code/1_2/semdata.nim.o \
c_code/1_2/linter.nim.o \
c_code/1_2/nimfix7prettybase.nim.o \
c_code/1_2/lookups.nim.o \
c_code/1_2/semtypinst.nim.o \
c_code/1_2/parampatterns.nim.o \
c_code/1_2/lowerings.nim.o \
c_code/1_2/_7lib7packages7docutils7rstast.nim.o \
c_code/1_2/_7lib7packages7docutils7rst.nim.o \
c_code/1_2/_7lib7packages7docutils7highlite.nim.o \
c_code/2_3/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_2/stdlib_xmltree.nim.o \
c_code/1_2/stdlib_uri.nim.o \
c_code/1_2/stdlib_cgi.nim.o \
c_code/1_2/typesrenderer.nim.o \
c_code/2_2/docgen.nim.o \
c_code/1_2/sigmatch.nim.o \
c_code/1_2/importer.nim.o \
c_code/1_2/procfind.nim.o \
c_code/2_3/pragmas.nim.o \
c_code/1_2/saturate.nim.o \
c_code/1_2/guards.nim.o \
c_code/1_2/sighashes.nim.o \
c_code/1_2/sempass2.nim.o \
c_code/1_2/cgmeth.nim.o \
c_code/1_2/aliases.nim.o \
c_code/1_2/patterns.nim.o \
c_code/1_2/dfa.nim.o \
c_code/1_2/injectdestructors.nim.o \
c_code/1_2/liftlocals.nim.o \
c_code/1_2/lambdalifting.nim.o \
c_code/1_2/closureiters.nim.o \
c_code/1_2/transf.nim.o \
c_code/1_2/vmgen.nim.o \
c_code/1_2/vmdeps.nim.o \
c_code/1_2/vmmarshal.nim.o \
c_code/2_3/gorgeimpl.nim.o \
c_code/1_2/macrocacheimpl.nim.o \
c_code/1_2/evaltempl.nim.o \
c_code/2_3/vm.nim.o \
c_code/1_2/semmacrosanity.nim.o \
c_code/1_2/pluginsupport.nim.o \
c_code/1_2/plugins7locals.nim.o \
c_code/1_2/plugins7itersgen.nim.o \
c_code/1_2/plugins7active.nim.o \
c_code/1_2/semparallel.nim.o \
c_code/1_2/sem.nim.o \
c_code/1_2/ccgutils.nim.o \
c_code/1_2/ndi.nim.o \
c_code/1_2/cgendata.nim.o \
c_code/1_2/ccgmerge.nim.o \
c_code/1_2/enumtostr.nim.o \
c_code/2_2/stdlib_dynlib.nim.o \
c_code/1_2/cgen.nim.o \
c_code/1_2/passaux.nim.o \
c_code/1_2/depends.nim.o \
c_code/1_2/modules.nim.o \
c_code/1_2/jsgen.nim.o \
c_code/1_2/docgen2.nim.o \
c_code/1_2/main.nim.o \
c_code/2_3/scriptconfig.nim.o \
c_code/2_3/cmdlinehelper.nim.o \
c_code/2_2/nim.nim.o $LINK_FLAGS
    ;;
  powerpc)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_assertions.nim.c -o c_code/1_1/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_dollars.nim.c -o c_code/1_1/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_io.nim.c -o c_code/2_1/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_system.nim.c -o c_code/2_1/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.nim.c -o c_code/2_1/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.nim.c -o c_code/2_1/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_algorithm.nim.c -o c_code/1_1/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.nim.c -o c_code/2_1/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.nim.c -o c_code/2_1/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_pathnorm.nim.c -o c_code/2_1/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_posix.nim.c -o c_code/2_1/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_times.nim.c -o c_code/2_1/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_os.nim.c -o c_code/2_1/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_hashes.nim.c -o c_code/1_1/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strtabs.nim.c -o c_code/1_1/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_streams.nim.c -o c_code/2_1/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cpuinfo.nim.c -o c_code/2_1/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_osproc.nim.c -o c_code/2_1/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sets.nim.c -o c_code/1_1/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pathutils.nim.c -o c_code/2_1/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ropes.nim.c -o c_code/1_1/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_tables.nim.c -o c_code/1_1/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lineinfos.nim.c -o c_code/1_1/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_13/platform.nim.c -o c_code/2_13/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/prefixmatches.nim.c -o c_code/1_1/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strformat.nim.c -o c_code/2_1/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.nim.c -o c_code/2_1/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/options.nim.c -o c_code/2_1/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/msgs.nim.c -o c_code/2_1/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/wordrecg.nim.c -o c_code/1_1/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idents.nim.c -o c_code/1_1/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/condsyms.nim.c -o c_code/1_1/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_sha1.nim.c -o c_code/2_6/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.nim.c -o c_code/2_1/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parsejson.nim.c -o c_code/1_1/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_json.nim.c -o c_code/1_1/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/extccomp.nim.c -o c_code/2_1/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimblecmd.nim.c -o c_code/2_1/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.nim.c -o c_code/2_1/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/commands.nim.c -o c_code/1_1/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/llstream.nim.c -o c_code/1_1/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimlexbase.nim.c -o c_code/1_1/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lexer.nim.c -o c_code/1_1/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimconf.nim.c -o c_code/2_1/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_intsets.nim.c -o c_code/1_1/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idgen.nim.c -o c_code/1_1/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ast.nim.c -o c_code/1_1/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/rodutils.nim.c -o c_code/1_1/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/astalgo.nim.c -o c_code/2_1/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parser.nim.c -o c_code/1_1/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/renderer.nim.c -o c_code/1_1/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filters.nim.c -o c_code/1_1/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filter__tmpl.nim.c -o c_code/1_1/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/syntaxes.nim.c -o c_code/1_1/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/trees.nim.c -o c_code/1_1/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/types.nim.c -o c_code/1_1/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/treetab.nim.c -o c_code/1_1/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/incremental.nim.c -o c_code/1_1/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/btrees.nim.c -o c_code/1_1/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_md5.nim.c -o c_code/1_1/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulegraphs.nim.c -o c_code/1_1/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/magicsys.nim.c -o c_code/1_1/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/bitsets.nim.c -o c_code/1_1/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimsets.nim.c -o c_code/1_1/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semfold.nim.c -o c_code/1_1/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulepaths.nim.c -o c_code/1_1/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/reorder.nim.c -o c_code/1_1/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passes.nim.c -o c_code/1_1/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdef.nim.c -o c_code/1_1/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semdata.nim.c -o c_code/1_1/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/linter.nim.c -o c_code/1_1/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimfix7prettybase.nim.c -o c_code/1_1/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lookups.nim.c -o c_code/1_1/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semtypinst.nim.c -o c_code/1_1/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parampatterns.nim.c -o c_code/1_1/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lowerings.nim.c -o c_code/1_1/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rstast.nim.c -o c_code/1_1/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rst.nim.c -o c_code/1_1/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7highlite.nim.c -o c_code/1_1/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/_7lib7packages7docutils7rstgen.nim.c -o c_code/2_1/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_xmltree.nim.c -o c_code/1_1/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_uri.nim.c -o c_code/1_1/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cgi.nim.c -o c_code/1_1/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/typesrenderer.nim.c -o c_code/1_1/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docgen.nim.c -o c_code/2_1/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sigmatch.nim.c -o c_code/1_1/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/importer.nim.c -o c_code/1_1/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/procfind.nim.c -o c_code/1_1/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pragmas.nim.c -o c_code/2_1/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/saturate.nim.c -o c_code/1_1/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/guards.nim.c -o c_code/1_1/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sighashes.nim.c -o c_code/1_1/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sempass2.nim.c -o c_code/1_1/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgmeth.nim.c -o c_code/1_1/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/aliases.nim.c -o c_code/1_1/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/patterns.nim.c -o c_code/1_1/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/dfa.nim.c -o c_code/1_1/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/injectdestructors.nim.c -o c_code/1_1/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/liftlocals.nim.c -o c_code/1_1/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lambdalifting.nim.c -o c_code/1_1/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/closureiters.nim.c -o c_code/1_1/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/transf.nim.c -o c_code/1_1/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmgen.nim.c -o c_code/1_1/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdeps.nim.c -o c_code/1_1/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmmarshal.nim.c -o c_code/1_1/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/gorgeimpl.nim.c -o c_code/2_1/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/macrocacheimpl.nim.c -o c_code/1_1/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/evaltempl.nim.c -o c_code/1_1/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/vm.nim.c -o c_code/2_6/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semmacrosanity.nim.c -o c_code/1_1/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/pluginsupport.nim.c -o c_code/1_1/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7locals.nim.c -o c_code/1_1/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7itersgen.nim.c -o c_code/1_1/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7active.nim.c -o c_code/1_1/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semparallel.nim.c -o c_code/1_1/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sem.nim.c -o c_code/1_1/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgutils.nim.c -o c_code/1_1/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ndi.nim.c -o c_code/1_1/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgendata.nim.c -o c_code/1_1/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgmerge.nim.c -o c_code/1_1/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/enumtostr.nim.c -o c_code/1_1/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.nim.c -o c_code/2_1/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgen.nim.c -o c_code/1_1/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passaux.nim.c -o c_code/1_1/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/depends.nim.c -o c_code/1_1/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modules.nim.c -o c_code/1_1/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/jsgen.nim.c -o c_code/1_1/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/docgen2.nim.c -o c_code/1_1/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/main.nim.c -o c_code/1_1/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/scriptconfig.nim.c -o c_code/2_1/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/cmdlinehelper.nim.c -o c_code/2_1/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nim.nim.c -o c_code/2_1/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_1/stdlib_assertions.nim.o \
c_code/1_1/stdlib_dollars.nim.o \
c_code/2_1/stdlib_io.nim.o \
c_code/2_1/stdlib_system.nim.o \
c_code/2_1/stdlib_parseutils.nim.o \
c_code/2_1/stdlib_math.nim.o \
c_code/1_1/stdlib_algorithm.nim.o \
c_code/2_1/stdlib_unicode.nim.o \
c_code/2_1/stdlib_strutils.nim.o \
c_code/2_1/stdlib_pathnorm.nim.o \
c_code/2_1/stdlib_posix.nim.o \
c_code/2_1/stdlib_times.nim.o \
c_code/2_1/stdlib_os.nim.o \
c_code/1_1/stdlib_hashes.nim.o \
c_code/1_1/stdlib_strtabs.nim.o \
c_code/2_1/stdlib_streams.nim.o \
c_code/2_1/stdlib_cpuinfo.nim.o \
c_code/2_1/stdlib_osproc.nim.o \
c_code/1_1/stdlib_sets.nim.o \
c_code/2_1/pathutils.nim.o \
c_code/1_1/ropes.nim.o \
c_code/1_1/stdlib_tables.nim.o \
c_code/1_1/lineinfos.nim.o \
c_code/2_13/platform.nim.o \
c_code/1_1/prefixmatches.nim.o \
c_code/2_1/stdlib_strformat.nim.o \
c_code/2_1/stdlib_terminal.nim.o \
c_code/2_1/options.nim.o \
c_code/2_1/msgs.nim.o \
c_code/1_1/wordrecg.nim.o \
c_code/1_1/idents.nim.o \
c_code/1_1/condsyms.nim.o \
c_code/2_6/stdlib_sha1.nim.o \
c_code/2_1/stdlib_lexbase.nim.o \
c_code/1_1/stdlib_parsejson.nim.o \
c_code/1_1/stdlib_json.nim.o \
c_code/2_1/extccomp.nim.o \
c_code/2_1/nimblecmd.nim.o \
c_code/2_1/stdlib_parseopt.nim.o \
c_code/1_1/commands.nim.o \
c_code/1_1/llstream.nim.o \
c_code/1_1/nimlexbase.nim.o \
c_code/1_1/lexer.nim.o \
c_code/2_1/nimconf.nim.o \
c_code/1_1/stdlib_intsets.nim.o \
c_code/1_1/idgen.nim.o \
c_code/1_1/ast.nim.o \
c_code/1_1/rodutils.nim.o \
c_code/2_1/astalgo.nim.o \
c_code/1_1/parser.nim.o \
c_code/1_1/renderer.nim.o \
c_code/1_1/filters.nim.o \
c_code/1_1/filter__tmpl.nim.o \
c_code/1_1/syntaxes.nim.o \
c_code/1_1/trees.nim.o \
c_code/1_1/types.nim.o \
c_code/1_1/treetab.nim.o \
c_code/1_1/incremental.nim.o \
c_code/1_1/btrees.nim.o \
c_code/1_1/stdlib_md5.nim.o \
c_code/1_1/modulegraphs.nim.o \
c_code/1_1/magicsys.nim.o \
c_code/1_1/bitsets.nim.o \
c_code/1_1/nimsets.nim.o \
c_code/1_1/semfold.nim.o \
c_code/1_1/modulepaths.nim.o \
c_code/1_1/reorder.nim.o \
c_code/1_1/passes.nim.o \
c_code/1_1/vmdef.nim.o \
c_code/1_1/semdata.nim.o \
c_code/1_1/linter.nim.o \
c_code/1_1/nimfix7prettybase.nim.o \
c_code/1_1/lookups.nim.o \
c_code/1_1/semtypinst.nim.o \
c_code/1_1/parampatterns.nim.o \
c_code/1_1/lowerings.nim.o \
c_code/1_1/_7lib7packages7docutils7rstast.nim.o \
c_code/1_1/_7lib7packages7docutils7rst.nim.o \
c_code/1_1/_7lib7packages7docutils7highlite.nim.o \
c_code/2_1/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_1/stdlib_xmltree.nim.o \
c_code/1_1/stdlib_uri.nim.o \
c_code/1_1/stdlib_cgi.nim.o \
c_code/1_1/typesrenderer.nim.o \
c_code/2_1/docgen.nim.o \
c_code/1_1/sigmatch.nim.o \
c_code/1_1/importer.nim.o \
c_code/1_1/procfind.nim.o \
c_code/2_1/pragmas.nim.o \
c_code/1_1/saturate.nim.o \
c_code/1_1/guards.nim.o \
c_code/1_1/sighashes.nim.o \
c_code/1_1/sempass2.nim.o \
c_code/1_1/cgmeth.nim.o \
c_code/1_1/aliases.nim.o \
c_code/1_1/patterns.nim.o \
c_code/1_1/dfa.nim.o \
c_code/1_1/injectdestructors.nim.o \
c_code/1_1/liftlocals.nim.o \
c_code/1_1/lambdalifting.nim.o \
c_code/1_1/closureiters.nim.o \
c_code/1_1/transf.nim.o \
c_code/1_1/vmgen.nim.o \
c_code/1_1/vmdeps.nim.o \
c_code/1_1/vmmarshal.nim.o \
c_code/2_1/gorgeimpl.nim.o \
c_code/1_1/macrocacheimpl.nim.o \
c_code/1_1/evaltempl.nim.o \
c_code/2_6/vm.nim.o \
c_code/1_1/semmacrosanity.nim.o \
c_code/1_1/pluginsupport.nim.o \
c_code/1_1/plugins7locals.nim.o \
c_code/1_1/plugins7itersgen.nim.o \
c_code/1_1/plugins7active.nim.o \
c_code/1_1/semparallel.nim.o \
c_code/1_1/sem.nim.o \
c_code/1_1/ccgutils.nim.o \
c_code/1_1/ndi.nim.o \
c_code/1_1/cgendata.nim.o \
c_code/1_1/ccgmerge.nim.o \
c_code/1_1/enumtostr.nim.o \
c_code/2_1/stdlib_dynlib.nim.o \
c_code/1_1/cgen.nim.o \
c_code/1_1/passaux.nim.o \
c_code/1_1/depends.nim.o \
c_code/1_1/modules.nim.o \
c_code/1_1/jsgen.nim.o \
c_code/1_1/docgen2.nim.o \
c_code/1_1/main.nim.o \
c_code/2_1/scriptconfig.nim.o \
c_code/2_1/cmdlinehelper.nim.o \
c_code/2_1/nim.nim.o $LINK_FLAGS
    ;;
  powerpc64el)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_assertions.nim.c -o c_code/1_2/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_dollars.nim.c -o c_code/1_2/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_io.nim.c -o c_code/2_3/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_system.nim.c -o c_code/2_3/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.nim.c -o c_code/2_2/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.nim.c -o c_code/2_2/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_algorithm.nim.c -o c_code/1_2/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.nim.c -o c_code/2_2/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.nim.c -o c_code/2_2/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_pathnorm.nim.c -o c_code/2_2/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_posix.nim.c -o c_code/2_3/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_times.nim.c -o c_code/2_2/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_os.nim.c -o c_code/2_3/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_hashes.nim.c -o c_code/1_2/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strtabs.nim.c -o c_code/1_2/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_streams.nim.c -o c_code/2_3/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_cpuinfo.nim.c -o c_code/2_3/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_osproc.nim.c -o c_code/2_3/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sets.nim.c -o c_code/1_2/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/pathutils.nim.c -o c_code/2_2/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ropes.nim.c -o c_code/1_2/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_tables.nim.c -o c_code/1_2/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lineinfos.nim.c -o c_code/1_2/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_14/platform.nim.c -o c_code/2_14/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/prefixmatches.nim.c -o c_code/1_2/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strformat.nim.c -o c_code/2_2/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.nim.c -o c_code/2_2/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/options.nim.c -o c_code/2_3/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/msgs.nim.c -o c_code/2_3/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/wordrecg.nim.c -o c_code/1_2/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idents.nim.c -o c_code/1_2/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/condsyms.nim.c -o c_code/1_2/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sha1.nim.c -o c_code/1_2/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.nim.c -o c_code/2_2/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parsejson.nim.c -o c_code/1_2/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_json.nim.c -o c_code/1_2/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/extccomp.nim.c -o c_code/2_3/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/nimblecmd.nim.c -o c_code/2_3/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.nim.c -o c_code/2_2/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/commands.nim.c -o c_code/1_2/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/llstream.nim.c -o c_code/1_2/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimlexbase.nim.c -o c_code/1_2/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lexer.nim.c -o c_code/1_2/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimconf.nim.c -o c_code/2_2/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_intsets.nim.c -o c_code/1_2/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idgen.nim.c -o c_code/1_2/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ast.nim.c -o c_code/1_2/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/rodutils.nim.c -o c_code/1_2/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/astalgo.nim.c -o c_code/2_2/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parser.nim.c -o c_code/1_2/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/renderer.nim.c -o c_code/1_2/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filters.nim.c -o c_code/1_2/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filter__tmpl.nim.c -o c_code/1_2/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/syntaxes.nim.c -o c_code/1_2/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/trees.nim.c -o c_code/1_2/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/types.nim.c -o c_code/1_2/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/treetab.nim.c -o c_code/1_2/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/incremental.nim.c -o c_code/1_2/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/btrees.nim.c -o c_code/1_2/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_md5.nim.c -o c_code/1_2/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulegraphs.nim.c -o c_code/1_2/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/magicsys.nim.c -o c_code/1_2/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/bitsets.nim.c -o c_code/1_2/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimsets.nim.c -o c_code/1_2/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semfold.nim.c -o c_code/1_2/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulepaths.nim.c -o c_code/1_2/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/reorder.nim.c -o c_code/1_2/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passes.nim.c -o c_code/1_2/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdef.nim.c -o c_code/1_2/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semdata.nim.c -o c_code/1_2/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/linter.nim.c -o c_code/1_2/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimfix7prettybase.nim.c -o c_code/1_2/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lookups.nim.c -o c_code/1_2/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semtypinst.nim.c -o c_code/1_2/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parampatterns.nim.c -o c_code/1_2/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lowerings.nim.c -o c_code/1_2/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rstast.nim.c -o c_code/1_2/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rst.nim.c -o c_code/1_2/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7highlite.nim.c -o c_code/1_2/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/_7lib7packages7docutils7rstgen.nim.c -o c_code/2_3/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_xmltree.nim.c -o c_code/1_2/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_uri.nim.c -o c_code/1_2/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cgi.nim.c -o c_code/1_2/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/typesrenderer.nim.c -o c_code/1_2/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docgen.nim.c -o c_code/2_2/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sigmatch.nim.c -o c_code/1_2/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/importer.nim.c -o c_code/1_2/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/procfind.nim.c -o c_code/1_2/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/pragmas.nim.c -o c_code/2_3/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/saturate.nim.c -o c_code/1_2/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/guards.nim.c -o c_code/1_2/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sighashes.nim.c -o c_code/1_2/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sempass2.nim.c -o c_code/1_2/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgmeth.nim.c -o c_code/1_2/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/aliases.nim.c -o c_code/1_2/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/patterns.nim.c -o c_code/1_2/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/dfa.nim.c -o c_code/1_2/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/injectdestructors.nim.c -o c_code/1_2/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/liftlocals.nim.c -o c_code/1_2/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lambdalifting.nim.c -o c_code/1_2/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/closureiters.nim.c -o c_code/1_2/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/transf.nim.c -o c_code/1_2/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmgen.nim.c -o c_code/1_2/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdeps.nim.c -o c_code/1_2/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmmarshal.nim.c -o c_code/1_2/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/gorgeimpl.nim.c -o c_code/2_3/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/macrocacheimpl.nim.c -o c_code/1_2/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/evaltempl.nim.c -o c_code/1_2/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/vm.nim.c -o c_code/2_3/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semmacrosanity.nim.c -o c_code/1_2/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/pluginsupport.nim.c -o c_code/1_2/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7locals.nim.c -o c_code/1_2/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7itersgen.nim.c -o c_code/1_2/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7active.nim.c -o c_code/1_2/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semparallel.nim.c -o c_code/1_2/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sem.nim.c -o c_code/1_2/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgutils.nim.c -o c_code/1_2/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ndi.nim.c -o c_code/1_2/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgendata.nim.c -o c_code/1_2/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgmerge.nim.c -o c_code/1_2/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/enumtostr.nim.c -o c_code/1_2/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.nim.c -o c_code/2_2/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgen.nim.c -o c_code/1_2/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passaux.nim.c -o c_code/1_2/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/depends.nim.c -o c_code/1_2/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modules.nim.c -o c_code/1_2/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/jsgen.nim.c -o c_code/1_2/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/docgen2.nim.c -o c_code/1_2/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/main.nim.c -o c_code/1_2/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/scriptconfig.nim.c -o c_code/2_3/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/cmdlinehelper.nim.c -o c_code/2_3/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nim.nim.c -o c_code/2_2/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_2/stdlib_assertions.nim.o \
c_code/1_2/stdlib_dollars.nim.o \
c_code/2_3/stdlib_io.nim.o \
c_code/2_3/stdlib_system.nim.o \
c_code/2_2/stdlib_parseutils.nim.o \
c_code/2_2/stdlib_math.nim.o \
c_code/1_2/stdlib_algorithm.nim.o \
c_code/2_2/stdlib_unicode.nim.o \
c_code/2_2/stdlib_strutils.nim.o \
c_code/2_2/stdlib_pathnorm.nim.o \
c_code/2_3/stdlib_posix.nim.o \
c_code/2_2/stdlib_times.nim.o \
c_code/2_3/stdlib_os.nim.o \
c_code/1_2/stdlib_hashes.nim.o \
c_code/1_2/stdlib_strtabs.nim.o \
c_code/2_3/stdlib_streams.nim.o \
c_code/2_3/stdlib_cpuinfo.nim.o \
c_code/2_3/stdlib_osproc.nim.o \
c_code/1_2/stdlib_sets.nim.o \
c_code/2_2/pathutils.nim.o \
c_code/1_2/ropes.nim.o \
c_code/1_2/stdlib_tables.nim.o \
c_code/1_2/lineinfos.nim.o \
c_code/2_14/platform.nim.o \
c_code/1_2/prefixmatches.nim.o \
c_code/2_2/stdlib_strformat.nim.o \
c_code/2_2/stdlib_terminal.nim.o \
c_code/2_3/options.nim.o \
c_code/2_3/msgs.nim.o \
c_code/1_2/wordrecg.nim.o \
c_code/1_2/idents.nim.o \
c_code/1_2/condsyms.nim.o \
c_code/1_2/stdlib_sha1.nim.o \
c_code/2_2/stdlib_lexbase.nim.o \
c_code/1_2/stdlib_parsejson.nim.o \
c_code/1_2/stdlib_json.nim.o \
c_code/2_3/extccomp.nim.o \
c_code/2_3/nimblecmd.nim.o \
c_code/2_2/stdlib_parseopt.nim.o \
c_code/1_2/commands.nim.o \
c_code/1_2/llstream.nim.o \
c_code/1_2/nimlexbase.nim.o \
c_code/1_2/lexer.nim.o \
c_code/2_2/nimconf.nim.o \
c_code/1_2/stdlib_intsets.nim.o \
c_code/1_2/idgen.nim.o \
c_code/1_2/ast.nim.o \
c_code/1_2/rodutils.nim.o \
c_code/2_2/astalgo.nim.o \
c_code/1_2/parser.nim.o \
c_code/1_2/renderer.nim.o \
c_code/1_2/filters.nim.o \
c_code/1_2/filter__tmpl.nim.o \
c_code/1_2/syntaxes.nim.o \
c_code/1_2/trees.nim.o \
c_code/1_2/types.nim.o \
c_code/1_2/treetab.nim.o \
c_code/1_2/incremental.nim.o \
c_code/1_2/btrees.nim.o \
c_code/1_2/stdlib_md5.nim.o \
c_code/1_2/modulegraphs.nim.o \
c_code/1_2/magicsys.nim.o \
c_code/1_2/bitsets.nim.o \
c_code/1_2/nimsets.nim.o \
c_code/1_2/semfold.nim.o \
c_code/1_2/modulepaths.nim.o \
c_code/1_2/reorder.nim.o \
c_code/1_2/passes.nim.o \
c_code/1_2/vmdef.nim.o \
c_code/1_2/semdata.nim.o \
c_code/1_2/linter.nim.o \
c_code/1_2/nimfix7prettybase.nim.o \
c_code/1_2/lookups.nim.o \
c_code/1_2/semtypinst.nim.o \
c_code/1_2/parampatterns.nim.o \
c_code/1_2/lowerings.nim.o \
c_code/1_2/_7lib7packages7docutils7rstast.nim.o \
c_code/1_2/_7lib7packages7docutils7rst.nim.o \
c_code/1_2/_7lib7packages7docutils7highlite.nim.o \
c_code/2_3/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_2/stdlib_xmltree.nim.o \
c_code/1_2/stdlib_uri.nim.o \
c_code/1_2/stdlib_cgi.nim.o \
c_code/1_2/typesrenderer.nim.o \
c_code/2_2/docgen.nim.o \
c_code/1_2/sigmatch.nim.o \
c_code/1_2/importer.nim.o \
c_code/1_2/procfind.nim.o \
c_code/2_3/pragmas.nim.o \
c_code/1_2/saturate.nim.o \
c_code/1_2/guards.nim.o \
c_code/1_2/sighashes.nim.o \
c_code/1_2/sempass2.nim.o \
c_code/1_2/cgmeth.nim.o \
c_code/1_2/aliases.nim.o \
c_code/1_2/patterns.nim.o \
c_code/1_2/dfa.nim.o \
c_code/1_2/injectdestructors.nim.o \
c_code/1_2/liftlocals.nim.o \
c_code/1_2/lambdalifting.nim.o \
c_code/1_2/closureiters.nim.o \
c_code/1_2/transf.nim.o \
c_code/1_2/vmgen.nim.o \
c_code/1_2/vmdeps.nim.o \
c_code/1_2/vmmarshal.nim.o \
c_code/2_3/gorgeimpl.nim.o \
c_code/1_2/macrocacheimpl.nim.o \
c_code/1_2/evaltempl.nim.o \
c_code/2_3/vm.nim.o \
c_code/1_2/semmacrosanity.nim.o \
c_code/1_2/pluginsupport.nim.o \
c_code/1_2/plugins7locals.nim.o \
c_code/1_2/plugins7itersgen.nim.o \
c_code/1_2/plugins7active.nim.o \
c_code/1_2/semparallel.nim.o \
c_code/1_2/sem.nim.o \
c_code/1_2/ccgutils.nim.o \
c_code/1_2/ndi.nim.o \
c_code/1_2/cgendata.nim.o \
c_code/1_2/ccgmerge.nim.o \
c_code/1_2/enumtostr.nim.o \
c_code/2_2/stdlib_dynlib.nim.o \
c_code/1_2/cgen.nim.o \
c_code/1_2/passaux.nim.o \
c_code/1_2/depends.nim.o \
c_code/1_2/modules.nim.o \
c_code/1_2/jsgen.nim.o \
c_code/1_2/docgen2.nim.o \
c_code/1_2/main.nim.o \
c_code/2_3/scriptconfig.nim.o \
c_code/2_3/cmdlinehelper.nim.o \
c_code/2_2/nim.nim.o $LINK_FLAGS
    ;;
  arm64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_assertions.nim.c -o c_code/1_2/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_dollars.nim.c -o c_code/1_2/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_io.nim.c -o c_code/2_3/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_system.nim.c -o c_code/2_3/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.nim.c -o c_code/2_2/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.nim.c -o c_code/2_2/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_algorithm.nim.c -o c_code/1_2/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.nim.c -o c_code/2_2/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.nim.c -o c_code/2_2/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_pathnorm.nim.c -o c_code/2_2/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_posix.nim.c -o c_code/2_3/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_times.nim.c -o c_code/2_2/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_os.nim.c -o c_code/2_3/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_hashes.nim.c -o c_code/1_2/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strtabs.nim.c -o c_code/1_2/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_streams.nim.c -o c_code/2_3/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_cpuinfo.nim.c -o c_code/2_3/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_osproc.nim.c -o c_code/2_3/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sets.nim.c -o c_code/1_2/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/pathutils.nim.c -o c_code/2_2/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ropes.nim.c -o c_code/1_2/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_tables.nim.c -o c_code/1_2/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lineinfos.nim.c -o c_code/1_2/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_15/platform.nim.c -o c_code/2_15/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/prefixmatches.nim.c -o c_code/1_2/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strformat.nim.c -o c_code/2_2/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.nim.c -o c_code/2_2/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/options.nim.c -o c_code/2_3/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/msgs.nim.c -o c_code/2_3/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/wordrecg.nim.c -o c_code/1_2/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idents.nim.c -o c_code/1_2/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/condsyms.nim.c -o c_code/1_2/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sha1.nim.c -o c_code/1_2/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.nim.c -o c_code/2_2/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parsejson.nim.c -o c_code/1_2/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_json.nim.c -o c_code/1_2/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/extccomp.nim.c -o c_code/2_3/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/nimblecmd.nim.c -o c_code/2_3/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.nim.c -o c_code/2_2/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/commands.nim.c -o c_code/1_2/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/llstream.nim.c -o c_code/1_2/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimlexbase.nim.c -o c_code/1_2/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lexer.nim.c -o c_code/1_2/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimconf.nim.c -o c_code/2_2/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_intsets.nim.c -o c_code/1_2/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idgen.nim.c -o c_code/1_2/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ast.nim.c -o c_code/1_2/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/rodutils.nim.c -o c_code/1_2/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/astalgo.nim.c -o c_code/2_2/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parser.nim.c -o c_code/1_2/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/renderer.nim.c -o c_code/1_2/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filters.nim.c -o c_code/1_2/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filter__tmpl.nim.c -o c_code/1_2/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/syntaxes.nim.c -o c_code/1_2/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/trees.nim.c -o c_code/1_2/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/types.nim.c -o c_code/1_2/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/treetab.nim.c -o c_code/1_2/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/incremental.nim.c -o c_code/1_2/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/btrees.nim.c -o c_code/1_2/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_md5.nim.c -o c_code/1_2/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulegraphs.nim.c -o c_code/1_2/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/magicsys.nim.c -o c_code/1_2/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/bitsets.nim.c -o c_code/1_2/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimsets.nim.c -o c_code/1_2/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semfold.nim.c -o c_code/1_2/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulepaths.nim.c -o c_code/1_2/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/reorder.nim.c -o c_code/1_2/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passes.nim.c -o c_code/1_2/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdef.nim.c -o c_code/1_2/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semdata.nim.c -o c_code/1_2/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/linter.nim.c -o c_code/1_2/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimfix7prettybase.nim.c -o c_code/1_2/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lookups.nim.c -o c_code/1_2/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semtypinst.nim.c -o c_code/1_2/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parampatterns.nim.c -o c_code/1_2/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lowerings.nim.c -o c_code/1_2/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rstast.nim.c -o c_code/1_2/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rst.nim.c -o c_code/1_2/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7highlite.nim.c -o c_code/1_2/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/_7lib7packages7docutils7rstgen.nim.c -o c_code/2_3/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_xmltree.nim.c -o c_code/1_2/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_uri.nim.c -o c_code/1_2/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cgi.nim.c -o c_code/1_2/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/typesrenderer.nim.c -o c_code/1_2/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docgen.nim.c -o c_code/2_2/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sigmatch.nim.c -o c_code/1_2/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/importer.nim.c -o c_code/1_2/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/procfind.nim.c -o c_code/1_2/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/pragmas.nim.c -o c_code/2_3/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/saturate.nim.c -o c_code/1_2/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/guards.nim.c -o c_code/1_2/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sighashes.nim.c -o c_code/1_2/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sempass2.nim.c -o c_code/1_2/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgmeth.nim.c -o c_code/1_2/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/aliases.nim.c -o c_code/1_2/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/patterns.nim.c -o c_code/1_2/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/dfa.nim.c -o c_code/1_2/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/injectdestructors.nim.c -o c_code/1_2/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/liftlocals.nim.c -o c_code/1_2/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lambdalifting.nim.c -o c_code/1_2/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/closureiters.nim.c -o c_code/1_2/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/transf.nim.c -o c_code/1_2/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmgen.nim.c -o c_code/1_2/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdeps.nim.c -o c_code/1_2/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmmarshal.nim.c -o c_code/1_2/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/gorgeimpl.nim.c -o c_code/2_3/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/macrocacheimpl.nim.c -o c_code/1_2/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/evaltempl.nim.c -o c_code/1_2/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/vm.nim.c -o c_code/2_3/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semmacrosanity.nim.c -o c_code/1_2/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/pluginsupport.nim.c -o c_code/1_2/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7locals.nim.c -o c_code/1_2/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7itersgen.nim.c -o c_code/1_2/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7active.nim.c -o c_code/1_2/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semparallel.nim.c -o c_code/1_2/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sem.nim.c -o c_code/1_2/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgutils.nim.c -o c_code/1_2/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ndi.nim.c -o c_code/1_2/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgendata.nim.c -o c_code/1_2/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgmerge.nim.c -o c_code/1_2/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/enumtostr.nim.c -o c_code/1_2/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.nim.c -o c_code/2_2/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgen.nim.c -o c_code/1_2/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passaux.nim.c -o c_code/1_2/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/depends.nim.c -o c_code/1_2/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modules.nim.c -o c_code/1_2/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/jsgen.nim.c -o c_code/1_2/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/docgen2.nim.c -o c_code/1_2/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/main.nim.c -o c_code/1_2/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/scriptconfig.nim.c -o c_code/2_3/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/cmdlinehelper.nim.c -o c_code/2_3/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nim.nim.c -o c_code/2_2/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_2/stdlib_assertions.nim.o \
c_code/1_2/stdlib_dollars.nim.o \
c_code/2_3/stdlib_io.nim.o \
c_code/2_3/stdlib_system.nim.o \
c_code/2_2/stdlib_parseutils.nim.o \
c_code/2_2/stdlib_math.nim.o \
c_code/1_2/stdlib_algorithm.nim.o \
c_code/2_2/stdlib_unicode.nim.o \
c_code/2_2/stdlib_strutils.nim.o \
c_code/2_2/stdlib_pathnorm.nim.o \
c_code/2_3/stdlib_posix.nim.o \
c_code/2_2/stdlib_times.nim.o \
c_code/2_3/stdlib_os.nim.o \
c_code/1_2/stdlib_hashes.nim.o \
c_code/1_2/stdlib_strtabs.nim.o \
c_code/2_3/stdlib_streams.nim.o \
c_code/2_3/stdlib_cpuinfo.nim.o \
c_code/2_3/stdlib_osproc.nim.o \
c_code/1_2/stdlib_sets.nim.o \
c_code/2_2/pathutils.nim.o \
c_code/1_2/ropes.nim.o \
c_code/1_2/stdlib_tables.nim.o \
c_code/1_2/lineinfos.nim.o \
c_code/2_15/platform.nim.o \
c_code/1_2/prefixmatches.nim.o \
c_code/2_2/stdlib_strformat.nim.o \
c_code/2_2/stdlib_terminal.nim.o \
c_code/2_3/options.nim.o \
c_code/2_3/msgs.nim.o \
c_code/1_2/wordrecg.nim.o \
c_code/1_2/idents.nim.o \
c_code/1_2/condsyms.nim.o \
c_code/1_2/stdlib_sha1.nim.o \
c_code/2_2/stdlib_lexbase.nim.o \
c_code/1_2/stdlib_parsejson.nim.o \
c_code/1_2/stdlib_json.nim.o \
c_code/2_3/extccomp.nim.o \
c_code/2_3/nimblecmd.nim.o \
c_code/2_2/stdlib_parseopt.nim.o \
c_code/1_2/commands.nim.o \
c_code/1_2/llstream.nim.o \
c_code/1_2/nimlexbase.nim.o \
c_code/1_2/lexer.nim.o \
c_code/2_2/nimconf.nim.o \
c_code/1_2/stdlib_intsets.nim.o \
c_code/1_2/idgen.nim.o \
c_code/1_2/ast.nim.o \
c_code/1_2/rodutils.nim.o \
c_code/2_2/astalgo.nim.o \
c_code/1_2/parser.nim.o \
c_code/1_2/renderer.nim.o \
c_code/1_2/filters.nim.o \
c_code/1_2/filter__tmpl.nim.o \
c_code/1_2/syntaxes.nim.o \
c_code/1_2/trees.nim.o \
c_code/1_2/types.nim.o \
c_code/1_2/treetab.nim.o \
c_code/1_2/incremental.nim.o \
c_code/1_2/btrees.nim.o \
c_code/1_2/stdlib_md5.nim.o \
c_code/1_2/modulegraphs.nim.o \
c_code/1_2/magicsys.nim.o \
c_code/1_2/bitsets.nim.o \
c_code/1_2/nimsets.nim.o \
c_code/1_2/semfold.nim.o \
c_code/1_2/modulepaths.nim.o \
c_code/1_2/reorder.nim.o \
c_code/1_2/passes.nim.o \
c_code/1_2/vmdef.nim.o \
c_code/1_2/semdata.nim.o \
c_code/1_2/linter.nim.o \
c_code/1_2/nimfix7prettybase.nim.o \
c_code/1_2/lookups.nim.o \
c_code/1_2/semtypinst.nim.o \
c_code/1_2/parampatterns.nim.o \
c_code/1_2/lowerings.nim.o \
c_code/1_2/_7lib7packages7docutils7rstast.nim.o \
c_code/1_2/_7lib7packages7docutils7rst.nim.o \
c_code/1_2/_7lib7packages7docutils7highlite.nim.o \
c_code/2_3/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_2/stdlib_xmltree.nim.o \
c_code/1_2/stdlib_uri.nim.o \
c_code/1_2/stdlib_cgi.nim.o \
c_code/1_2/typesrenderer.nim.o \
c_code/2_2/docgen.nim.o \
c_code/1_2/sigmatch.nim.o \
c_code/1_2/importer.nim.o \
c_code/1_2/procfind.nim.o \
c_code/2_3/pragmas.nim.o \
c_code/1_2/saturate.nim.o \
c_code/1_2/guards.nim.o \
c_code/1_2/sighashes.nim.o \
c_code/1_2/sempass2.nim.o \
c_code/1_2/cgmeth.nim.o \
c_code/1_2/aliases.nim.o \
c_code/1_2/patterns.nim.o \
c_code/1_2/dfa.nim.o \
c_code/1_2/injectdestructors.nim.o \
c_code/1_2/liftlocals.nim.o \
c_code/1_2/lambdalifting.nim.o \
c_code/1_2/closureiters.nim.o \
c_code/1_2/transf.nim.o \
c_code/1_2/vmgen.nim.o \
c_code/1_2/vmdeps.nim.o \
c_code/1_2/vmmarshal.nim.o \
c_code/2_3/gorgeimpl.nim.o \
c_code/1_2/macrocacheimpl.nim.o \
c_code/1_2/evaltempl.nim.o \
c_code/2_3/vm.nim.o \
c_code/1_2/semmacrosanity.nim.o \
c_code/1_2/pluginsupport.nim.o \
c_code/1_2/plugins7locals.nim.o \
c_code/1_2/plugins7itersgen.nim.o \
c_code/1_2/plugins7active.nim.o \
c_code/1_2/semparallel.nim.o \
c_code/1_2/sem.nim.o \
c_code/1_2/ccgutils.nim.o \
c_code/1_2/ndi.nim.o \
c_code/1_2/cgendata.nim.o \
c_code/1_2/ccgmerge.nim.o \
c_code/1_2/enumtostr.nim.o \
c_code/2_2/stdlib_dynlib.nim.o \
c_code/1_2/cgen.nim.o \
c_code/1_2/passaux.nim.o \
c_code/1_2/depends.nim.o \
c_code/1_2/modules.nim.o \
c_code/1_2/jsgen.nim.o \
c_code/1_2/docgen2.nim.o \
c_code/1_2/main.nim.o \
c_code/2_3/scriptconfig.nim.o \
c_code/2_3/cmdlinehelper.nim.o \
c_code/2_2/nim.nim.o $LINK_FLAGS
    ;;
  riscv64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_assertions.nim.c -o c_code/1_2/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_dollars.nim.c -o c_code/1_2/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_io.nim.c -o c_code/2_3/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_system.nim.c -o c_code/2_3/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.nim.c -o c_code/2_2/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.nim.c -o c_code/2_2/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_algorithm.nim.c -o c_code/1_2/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.nim.c -o c_code/2_2/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.nim.c -o c_code/2_2/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_pathnorm.nim.c -o c_code/2_2/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_posix.nim.c -o c_code/2_3/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_times.nim.c -o c_code/2_2/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_os.nim.c -o c_code/2_3/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_hashes.nim.c -o c_code/1_2/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strtabs.nim.c -o c_code/1_2/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_streams.nim.c -o c_code/2_3/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_cpuinfo.nim.c -o c_code/2_3/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_osproc.nim.c -o c_code/2_3/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sets.nim.c -o c_code/1_2/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/pathutils.nim.c -o c_code/2_2/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ropes.nim.c -o c_code/1_2/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_tables.nim.c -o c_code/1_2/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lineinfos.nim.c -o c_code/1_2/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_16/platform.nim.c -o c_code/2_16/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/prefixmatches.nim.c -o c_code/1_2/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strformat.nim.c -o c_code/2_2/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.nim.c -o c_code/2_2/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/options.nim.c -o c_code/2_3/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/msgs.nim.c -o c_code/2_3/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/wordrecg.nim.c -o c_code/1_2/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idents.nim.c -o c_code/1_2/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/condsyms.nim.c -o c_code/1_2/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sha1.nim.c -o c_code/1_2/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.nim.c -o c_code/2_2/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parsejson.nim.c -o c_code/1_2/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_json.nim.c -o c_code/1_2/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/extccomp.nim.c -o c_code/2_3/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/nimblecmd.nim.c -o c_code/2_3/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.nim.c -o c_code/2_2/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/commands.nim.c -o c_code/1_2/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/llstream.nim.c -o c_code/1_2/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimlexbase.nim.c -o c_code/1_2/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lexer.nim.c -o c_code/1_2/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimconf.nim.c -o c_code/2_2/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_intsets.nim.c -o c_code/1_2/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idgen.nim.c -o c_code/1_2/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ast.nim.c -o c_code/1_2/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/rodutils.nim.c -o c_code/1_2/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/astalgo.nim.c -o c_code/2_2/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parser.nim.c -o c_code/1_2/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/renderer.nim.c -o c_code/1_2/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filters.nim.c -o c_code/1_2/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filter__tmpl.nim.c -o c_code/1_2/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/syntaxes.nim.c -o c_code/1_2/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/trees.nim.c -o c_code/1_2/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/types.nim.c -o c_code/1_2/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/treetab.nim.c -o c_code/1_2/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/incremental.nim.c -o c_code/1_2/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/btrees.nim.c -o c_code/1_2/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_md5.nim.c -o c_code/1_2/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulegraphs.nim.c -o c_code/1_2/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/magicsys.nim.c -o c_code/1_2/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/bitsets.nim.c -o c_code/1_2/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimsets.nim.c -o c_code/1_2/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semfold.nim.c -o c_code/1_2/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulepaths.nim.c -o c_code/1_2/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/reorder.nim.c -o c_code/1_2/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passes.nim.c -o c_code/1_2/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdef.nim.c -o c_code/1_2/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semdata.nim.c -o c_code/1_2/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/linter.nim.c -o c_code/1_2/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimfix7prettybase.nim.c -o c_code/1_2/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lookups.nim.c -o c_code/1_2/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semtypinst.nim.c -o c_code/1_2/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parampatterns.nim.c -o c_code/1_2/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lowerings.nim.c -o c_code/1_2/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rstast.nim.c -o c_code/1_2/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rst.nim.c -o c_code/1_2/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7highlite.nim.c -o c_code/1_2/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/_7lib7packages7docutils7rstgen.nim.c -o c_code/2_3/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_xmltree.nim.c -o c_code/1_2/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_uri.nim.c -o c_code/1_2/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cgi.nim.c -o c_code/1_2/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/typesrenderer.nim.c -o c_code/1_2/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docgen.nim.c -o c_code/2_2/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sigmatch.nim.c -o c_code/1_2/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/importer.nim.c -o c_code/1_2/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/procfind.nim.c -o c_code/1_2/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/pragmas.nim.c -o c_code/2_3/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/saturate.nim.c -o c_code/1_2/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/guards.nim.c -o c_code/1_2/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sighashes.nim.c -o c_code/1_2/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sempass2.nim.c -o c_code/1_2/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgmeth.nim.c -o c_code/1_2/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/aliases.nim.c -o c_code/1_2/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/patterns.nim.c -o c_code/1_2/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/dfa.nim.c -o c_code/1_2/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/injectdestructors.nim.c -o c_code/1_2/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/liftlocals.nim.c -o c_code/1_2/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lambdalifting.nim.c -o c_code/1_2/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/closureiters.nim.c -o c_code/1_2/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/transf.nim.c -o c_code/1_2/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmgen.nim.c -o c_code/1_2/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdeps.nim.c -o c_code/1_2/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmmarshal.nim.c -o c_code/1_2/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/gorgeimpl.nim.c -o c_code/2_3/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/macrocacheimpl.nim.c -o c_code/1_2/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/evaltempl.nim.c -o c_code/1_2/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/vm.nim.c -o c_code/2_3/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semmacrosanity.nim.c -o c_code/1_2/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/pluginsupport.nim.c -o c_code/1_2/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7locals.nim.c -o c_code/1_2/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7itersgen.nim.c -o c_code/1_2/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7active.nim.c -o c_code/1_2/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semparallel.nim.c -o c_code/1_2/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sem.nim.c -o c_code/1_2/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgutils.nim.c -o c_code/1_2/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ndi.nim.c -o c_code/1_2/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgendata.nim.c -o c_code/1_2/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgmerge.nim.c -o c_code/1_2/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/enumtostr.nim.c -o c_code/1_2/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.nim.c -o c_code/2_2/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgen.nim.c -o c_code/1_2/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passaux.nim.c -o c_code/1_2/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/depends.nim.c -o c_code/1_2/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modules.nim.c -o c_code/1_2/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/jsgen.nim.c -o c_code/1_2/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/docgen2.nim.c -o c_code/1_2/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/main.nim.c -o c_code/1_2/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/scriptconfig.nim.c -o c_code/2_3/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/cmdlinehelper.nim.c -o c_code/2_3/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nim.nim.c -o c_code/2_2/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_2/stdlib_assertions.nim.o \
c_code/1_2/stdlib_dollars.nim.o \
c_code/2_3/stdlib_io.nim.o \
c_code/2_3/stdlib_system.nim.o \
c_code/2_2/stdlib_parseutils.nim.o \
c_code/2_2/stdlib_math.nim.o \
c_code/1_2/stdlib_algorithm.nim.o \
c_code/2_2/stdlib_unicode.nim.o \
c_code/2_2/stdlib_strutils.nim.o \
c_code/2_2/stdlib_pathnorm.nim.o \
c_code/2_3/stdlib_posix.nim.o \
c_code/2_2/stdlib_times.nim.o \
c_code/2_3/stdlib_os.nim.o \
c_code/1_2/stdlib_hashes.nim.o \
c_code/1_2/stdlib_strtabs.nim.o \
c_code/2_3/stdlib_streams.nim.o \
c_code/2_3/stdlib_cpuinfo.nim.o \
c_code/2_3/stdlib_osproc.nim.o \
c_code/1_2/stdlib_sets.nim.o \
c_code/2_2/pathutils.nim.o \
c_code/1_2/ropes.nim.o \
c_code/1_2/stdlib_tables.nim.o \
c_code/1_2/lineinfos.nim.o \
c_code/2_16/platform.nim.o \
c_code/1_2/prefixmatches.nim.o \
c_code/2_2/stdlib_strformat.nim.o \
c_code/2_2/stdlib_terminal.nim.o \
c_code/2_3/options.nim.o \
c_code/2_3/msgs.nim.o \
c_code/1_2/wordrecg.nim.o \
c_code/1_2/idents.nim.o \
c_code/1_2/condsyms.nim.o \
c_code/1_2/stdlib_sha1.nim.o \
c_code/2_2/stdlib_lexbase.nim.o \
c_code/1_2/stdlib_parsejson.nim.o \
c_code/1_2/stdlib_json.nim.o \
c_code/2_3/extccomp.nim.o \
c_code/2_3/nimblecmd.nim.o \
c_code/2_2/stdlib_parseopt.nim.o \
c_code/1_2/commands.nim.o \
c_code/1_2/llstream.nim.o \
c_code/1_2/nimlexbase.nim.o \
c_code/1_2/lexer.nim.o \
c_code/2_2/nimconf.nim.o \
c_code/1_2/stdlib_intsets.nim.o \
c_code/1_2/idgen.nim.o \
c_code/1_2/ast.nim.o \
c_code/1_2/rodutils.nim.o \
c_code/2_2/astalgo.nim.o \
c_code/1_2/parser.nim.o \
c_code/1_2/renderer.nim.o \
c_code/1_2/filters.nim.o \
c_code/1_2/filter__tmpl.nim.o \
c_code/1_2/syntaxes.nim.o \
c_code/1_2/trees.nim.o \
c_code/1_2/types.nim.o \
c_code/1_2/treetab.nim.o \
c_code/1_2/incremental.nim.o \
c_code/1_2/btrees.nim.o \
c_code/1_2/stdlib_md5.nim.o \
c_code/1_2/modulegraphs.nim.o \
c_code/1_2/magicsys.nim.o \
c_code/1_2/bitsets.nim.o \
c_code/1_2/nimsets.nim.o \
c_code/1_2/semfold.nim.o \
c_code/1_2/modulepaths.nim.o \
c_code/1_2/reorder.nim.o \
c_code/1_2/passes.nim.o \
c_code/1_2/vmdef.nim.o \
c_code/1_2/semdata.nim.o \
c_code/1_2/linter.nim.o \
c_code/1_2/nimfix7prettybase.nim.o \
c_code/1_2/lookups.nim.o \
c_code/1_2/semtypinst.nim.o \
c_code/1_2/parampatterns.nim.o \
c_code/1_2/lowerings.nim.o \
c_code/1_2/_7lib7packages7docutils7rstast.nim.o \
c_code/1_2/_7lib7packages7docutils7rst.nim.o \
c_code/1_2/_7lib7packages7docutils7highlite.nim.o \
c_code/2_3/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_2/stdlib_xmltree.nim.o \
c_code/1_2/stdlib_uri.nim.o \
c_code/1_2/stdlib_cgi.nim.o \
c_code/1_2/typesrenderer.nim.o \
c_code/2_2/docgen.nim.o \
c_code/1_2/sigmatch.nim.o \
c_code/1_2/importer.nim.o \
c_code/1_2/procfind.nim.o \
c_code/2_3/pragmas.nim.o \
c_code/1_2/saturate.nim.o \
c_code/1_2/guards.nim.o \
c_code/1_2/sighashes.nim.o \
c_code/1_2/sempass2.nim.o \
c_code/1_2/cgmeth.nim.o \
c_code/1_2/aliases.nim.o \
c_code/1_2/patterns.nim.o \
c_code/1_2/dfa.nim.o \
c_code/1_2/injectdestructors.nim.o \
c_code/1_2/liftlocals.nim.o \
c_code/1_2/lambdalifting.nim.o \
c_code/1_2/closureiters.nim.o \
c_code/1_2/transf.nim.o \
c_code/1_2/vmgen.nim.o \
c_code/1_2/vmdeps.nim.o \
c_code/1_2/vmmarshal.nim.o \
c_code/2_3/gorgeimpl.nim.o \
c_code/1_2/macrocacheimpl.nim.o \
c_code/1_2/evaltempl.nim.o \
c_code/2_3/vm.nim.o \
c_code/1_2/semmacrosanity.nim.o \
c_code/1_2/pluginsupport.nim.o \
c_code/1_2/plugins7locals.nim.o \
c_code/1_2/plugins7itersgen.nim.o \
c_code/1_2/plugins7active.nim.o \
c_code/1_2/semparallel.nim.o \
c_code/1_2/sem.nim.o \
c_code/1_2/ccgutils.nim.o \
c_code/1_2/ndi.nim.o \
c_code/1_2/cgendata.nim.o \
c_code/1_2/ccgmerge.nim.o \
c_code/1_2/enumtostr.nim.o \
c_code/2_2/stdlib_dynlib.nim.o \
c_code/1_2/cgen.nim.o \
c_code/1_2/passaux.nim.o \
c_code/1_2/depends.nim.o \
c_code/1_2/modules.nim.o \
c_code/1_2/jsgen.nim.o \
c_code/1_2/docgen2.nim.o \
c_code/1_2/main.nim.o \
c_code/2_3/scriptconfig.nim.o \
c_code/2_3/cmdlinehelper.nim.o \
c_code/2_2/nim.nim.o $LINK_FLAGS
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
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_assertions.nim.c -o c_code/1_1/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_dollars.nim.c -o c_code/1_1/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_io.nim.c -o c_code/3_1/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_system.nim.c -o c_code/3_1/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.nim.c -o c_code/2_1/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.nim.c -o c_code/2_1/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_algorithm.nim.c -o c_code/1_1/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.nim.c -o c_code/2_1/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.nim.c -o c_code/2_1/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_pathnorm.nim.c -o c_code/2_1/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_posix.nim.c -o c_code/3_1/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_times.nim.c -o c_code/3_1/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_os.nim.c -o c_code/3_1/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_hashes.nim.c -o c_code/1_1/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strtabs.nim.c -o c_code/1_1/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_streams.nim.c -o c_code/3_1/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_cpuinfo.nim.c -o c_code/3_1/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_osproc.nim.c -o c_code/3_1/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sets.nim.c -o c_code/1_1/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pathutils.nim.c -o c_code/2_1/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ropes.nim.c -o c_code/1_1/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_tables.nim.c -o c_code/1_1/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lineinfos.nim.c -o c_code/1_1/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/platform.nim.c -o c_code/3_1/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/prefixmatches.nim.c -o c_code/1_1/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strformat.nim.c -o c_code/2_1/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.nim.c -o c_code/2_1/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/options.nim.c -o c_code/3_1/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/msgs.nim.c -o c_code/3_1/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/wordrecg.nim.c -o c_code/1_1/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idents.nim.c -o c_code/1_1/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/condsyms.nim.c -o c_code/1_1/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sha1.nim.c -o c_code/1_1/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.nim.c -o c_code/2_1/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parsejson.nim.c -o c_code/1_1/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_json.nim.c -o c_code/3_1/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/extccomp.nim.c -o c_code/3_1/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/nimblecmd.nim.c -o c_code/3_1/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.nim.c -o c_code/2_1/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/commands.nim.c -o c_code/3_1/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/llstream.nim.c -o c_code/1_1/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimlexbase.nim.c -o c_code/1_1/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/lexer.nim.c -o c_code/3_1/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimconf.nim.c -o c_code/2_1/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_intsets.nim.c -o c_code/1_1/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idgen.nim.c -o c_code/1_1/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ast.nim.c -o c_code/1_1/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/rodutils.nim.c -o c_code/1_1/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/astalgo.nim.c -o c_code/2_1/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parser.nim.c -o c_code/1_1/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/renderer.nim.c -o c_code/1_1/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filters.nim.c -o c_code/1_1/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filter__tmpl.nim.c -o c_code/1_1/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/syntaxes.nim.c -o c_code/1_1/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/trees.nim.c -o c_code/1_1/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/types.nim.c -o c_code/3_1/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/treetab.nim.c -o c_code/1_1/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/incremental.nim.c -o c_code/1_1/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/btrees.nim.c -o c_code/1_1/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_md5.nim.c -o c_code/1_1/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulegraphs.nim.c -o c_code/1_1/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/magicsys.nim.c -o c_code/1_1/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/bitsets.nim.c -o c_code/1_1/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimsets.nim.c -o c_code/1_1/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/semfold.nim.c -o c_code/3_1/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/modulepaths.nim.c -o c_code/3_1/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/reorder.nim.c -o c_code/1_1/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passes.nim.c -o c_code/1_1/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdef.nim.c -o c_code/1_1/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semdata.nim.c -o c_code/1_1/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/linter.nim.c -o c_code/1_1/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimfix7prettybase.nim.c -o c_code/1_1/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lookups.nim.c -o c_code/1_1/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semtypinst.nim.c -o c_code/1_1/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parampatterns.nim.c -o c_code/1_1/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lowerings.nim.c -o c_code/1_1/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rstast.nim.c -o c_code/1_1/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rst.nim.c -o c_code/1_1/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7highlite.nim.c -o c_code/1_1/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/_7lib7packages7docutils7rstgen.nim.c -o c_code/3_1/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_xmltree.nim.c -o c_code/1_1/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_uri.nim.c -o c_code/1_1/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cgi.nim.c -o c_code/1_1/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/typesrenderer.nim.c -o c_code/1_1/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docgen.nim.c -o c_code/2_1/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/sigmatch.nim.c -o c_code/3_1/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/importer.nim.c -o c_code/1_1/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/procfind.nim.c -o c_code/1_1/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/pragmas.nim.c -o c_code/3_1/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/saturate.nim.c -o c_code/1_1/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/guards.nim.c -o c_code/1_1/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sighashes.nim.c -o c_code/1_1/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sempass2.nim.c -o c_code/1_1/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgmeth.nim.c -o c_code/1_1/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/aliases.nim.c -o c_code/1_1/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/patterns.nim.c -o c_code/1_1/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/dfa.nim.c -o c_code/1_1/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/injectdestructors.nim.c -o c_code/1_1/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/liftlocals.nim.c -o c_code/1_1/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lambdalifting.nim.c -o c_code/1_1/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/closureiters.nim.c -o c_code/1_1/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/transf.nim.c -o c_code/1_1/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmgen.nim.c -o c_code/1_1/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/vmdeps.nim.c -o c_code/3_1/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmmarshal.nim.c -o c_code/1_1/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/gorgeimpl.nim.c -o c_code/3_1/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/macrocacheimpl.nim.c -o c_code/1_1/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/evaltempl.nim.c -o c_code/1_1/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/vm.nim.c -o c_code/3_1/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semmacrosanity.nim.c -o c_code/1_1/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/pluginsupport.nim.c -o c_code/1_1/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7locals.nim.c -o c_code/1_1/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7itersgen.nim.c -o c_code/1_1/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7active.nim.c -o c_code/1_1/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semparallel.nim.c -o c_code/1_1/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/sem.nim.c -o c_code/3_1/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgutils.nim.c -o c_code/1_1/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ndi.nim.c -o c_code/1_1/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgendata.nim.c -o c_code/1_1/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgmerge.nim.c -o c_code/1_1/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/enumtostr.nim.c -o c_code/1_1/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.nim.c -o c_code/2_1/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgen.nim.c -o c_code/1_1/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passaux.nim.c -o c_code/1_1/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/depends.nim.c -o c_code/1_1/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modules.nim.c -o c_code/1_1/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/jsgen.nim.c -o c_code/1_1/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/docgen2.nim.c -o c_code/3_1/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/main.nim.c -o c_code/1_1/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/scriptconfig.nim.c -o c_code/3_1/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/cmdlinehelper.nim.c -o c_code/3_1/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/nim.nim.c -o c_code/3_1/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_1/stdlib_assertions.nim.o \
c_code/1_1/stdlib_dollars.nim.o \
c_code/3_1/stdlib_io.nim.o \
c_code/3_1/stdlib_system.nim.o \
c_code/2_1/stdlib_parseutils.nim.o \
c_code/2_1/stdlib_math.nim.o \
c_code/1_1/stdlib_algorithm.nim.o \
c_code/2_1/stdlib_unicode.nim.o \
c_code/2_1/stdlib_strutils.nim.o \
c_code/2_1/stdlib_pathnorm.nim.o \
c_code/3_1/stdlib_posix.nim.o \
c_code/3_1/stdlib_times.nim.o \
c_code/3_1/stdlib_os.nim.o \
c_code/1_1/stdlib_hashes.nim.o \
c_code/1_1/stdlib_strtabs.nim.o \
c_code/3_1/stdlib_streams.nim.o \
c_code/3_1/stdlib_cpuinfo.nim.o \
c_code/3_1/stdlib_osproc.nim.o \
c_code/1_1/stdlib_sets.nim.o \
c_code/2_1/pathutils.nim.o \
c_code/1_1/ropes.nim.o \
c_code/1_1/stdlib_tables.nim.o \
c_code/1_1/lineinfos.nim.o \
c_code/3_1/platform.nim.o \
c_code/1_1/prefixmatches.nim.o \
c_code/2_1/stdlib_strformat.nim.o \
c_code/2_1/stdlib_terminal.nim.o \
c_code/3_1/options.nim.o \
c_code/3_1/msgs.nim.o \
c_code/1_1/wordrecg.nim.o \
c_code/1_1/idents.nim.o \
c_code/1_1/condsyms.nim.o \
c_code/1_1/stdlib_sha1.nim.o \
c_code/2_1/stdlib_lexbase.nim.o \
c_code/1_1/stdlib_parsejson.nim.o \
c_code/3_1/stdlib_json.nim.o \
c_code/3_1/extccomp.nim.o \
c_code/3_1/nimblecmd.nim.o \
c_code/2_1/stdlib_parseopt.nim.o \
c_code/3_1/commands.nim.o \
c_code/1_1/llstream.nim.o \
c_code/1_1/nimlexbase.nim.o \
c_code/3_1/lexer.nim.o \
c_code/2_1/nimconf.nim.o \
c_code/1_1/stdlib_intsets.nim.o \
c_code/1_1/idgen.nim.o \
c_code/1_1/ast.nim.o \
c_code/1_1/rodutils.nim.o \
c_code/2_1/astalgo.nim.o \
c_code/1_1/parser.nim.o \
c_code/1_1/renderer.nim.o \
c_code/1_1/filters.nim.o \
c_code/1_1/filter__tmpl.nim.o \
c_code/1_1/syntaxes.nim.o \
c_code/1_1/trees.nim.o \
c_code/3_1/types.nim.o \
c_code/1_1/treetab.nim.o \
c_code/1_1/incremental.nim.o \
c_code/1_1/btrees.nim.o \
c_code/1_1/stdlib_md5.nim.o \
c_code/1_1/modulegraphs.nim.o \
c_code/1_1/magicsys.nim.o \
c_code/1_1/bitsets.nim.o \
c_code/1_1/nimsets.nim.o \
c_code/3_1/semfold.nim.o \
c_code/3_1/modulepaths.nim.o \
c_code/1_1/reorder.nim.o \
c_code/1_1/passes.nim.o \
c_code/1_1/vmdef.nim.o \
c_code/1_1/semdata.nim.o \
c_code/1_1/linter.nim.o \
c_code/1_1/nimfix7prettybase.nim.o \
c_code/1_1/lookups.nim.o \
c_code/1_1/semtypinst.nim.o \
c_code/1_1/parampatterns.nim.o \
c_code/1_1/lowerings.nim.o \
c_code/1_1/_7lib7packages7docutils7rstast.nim.o \
c_code/1_1/_7lib7packages7docutils7rst.nim.o \
c_code/1_1/_7lib7packages7docutils7highlite.nim.o \
c_code/3_1/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_1/stdlib_xmltree.nim.o \
c_code/1_1/stdlib_uri.nim.o \
c_code/1_1/stdlib_cgi.nim.o \
c_code/1_1/typesrenderer.nim.o \
c_code/2_1/docgen.nim.o \
c_code/3_1/sigmatch.nim.o \
c_code/1_1/importer.nim.o \
c_code/1_1/procfind.nim.o \
c_code/3_1/pragmas.nim.o \
c_code/1_1/saturate.nim.o \
c_code/1_1/guards.nim.o \
c_code/1_1/sighashes.nim.o \
c_code/1_1/sempass2.nim.o \
c_code/1_1/cgmeth.nim.o \
c_code/1_1/aliases.nim.o \
c_code/1_1/patterns.nim.o \
c_code/1_1/dfa.nim.o \
c_code/1_1/injectdestructors.nim.o \
c_code/1_1/liftlocals.nim.o \
c_code/1_1/lambdalifting.nim.o \
c_code/1_1/closureiters.nim.o \
c_code/1_1/transf.nim.o \
c_code/1_1/vmgen.nim.o \
c_code/3_1/vmdeps.nim.o \
c_code/1_1/vmmarshal.nim.o \
c_code/3_1/gorgeimpl.nim.o \
c_code/1_1/macrocacheimpl.nim.o \
c_code/1_1/evaltempl.nim.o \
c_code/3_1/vm.nim.o \
c_code/1_1/semmacrosanity.nim.o \
c_code/1_1/pluginsupport.nim.o \
c_code/1_1/plugins7locals.nim.o \
c_code/1_1/plugins7itersgen.nim.o \
c_code/1_1/plugins7active.nim.o \
c_code/1_1/semparallel.nim.o \
c_code/3_1/sem.nim.o \
c_code/1_1/ccgutils.nim.o \
c_code/1_1/ndi.nim.o \
c_code/1_1/cgendata.nim.o \
c_code/1_1/ccgmerge.nim.o \
c_code/1_1/enumtostr.nim.o \
c_code/2_1/stdlib_dynlib.nim.o \
c_code/1_1/cgen.nim.o \
c_code/1_1/passaux.nim.o \
c_code/1_1/depends.nim.o \
c_code/1_1/modules.nim.o \
c_code/1_1/jsgen.nim.o \
c_code/3_1/docgen2.nim.o \
c_code/1_1/main.nim.o \
c_code/3_1/scriptconfig.nim.o \
c_code/3_1/cmdlinehelper.nim.o \
c_code/3_1/nim.nim.o $LINK_FLAGS
    ;;
  amd64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_assertions.nim.c -o c_code/1_2/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_dollars.nim.c -o c_code/1_2/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_io.nim.c -o c_code/3_2/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_system.nim.c -o c_code/3_2/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.nim.c -o c_code/2_2/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.nim.c -o c_code/2_2/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_algorithm.nim.c -o c_code/1_2/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.nim.c -o c_code/2_2/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.nim.c -o c_code/2_2/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_pathnorm.nim.c -o c_code/2_2/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_posix.nim.c -o c_code/3_2/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_times.nim.c -o c_code/3_2/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_os.nim.c -o c_code/3_2/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_hashes.nim.c -o c_code/1_2/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strtabs.nim.c -o c_code/1_2/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_streams.nim.c -o c_code/3_2/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_cpuinfo.nim.c -o c_code/3_2/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_osproc.nim.c -o c_code/3_2/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sets.nim.c -o c_code/1_2/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/pathutils.nim.c -o c_code/2_2/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ropes.nim.c -o c_code/1_2/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_tables.nim.c -o c_code/1_2/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lineinfos.nim.c -o c_code/1_2/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/platform.nim.c -o c_code/3_2/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/prefixmatches.nim.c -o c_code/1_2/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strformat.nim.c -o c_code/2_2/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.nim.c -o c_code/2_2/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/options.nim.c -o c_code/3_2/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/msgs.nim.c -o c_code/3_2/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/wordrecg.nim.c -o c_code/1_2/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idents.nim.c -o c_code/1_2/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/condsyms.nim.c -o c_code/1_2/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sha1.nim.c -o c_code/1_2/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.nim.c -o c_code/2_2/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parsejson.nim.c -o c_code/1_2/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_json.nim.c -o c_code/3_2/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/extccomp.nim.c -o c_code/3_2/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/nimblecmd.nim.c -o c_code/3_2/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.nim.c -o c_code/2_2/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/commands.nim.c -o c_code/3_2/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/llstream.nim.c -o c_code/1_2/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimlexbase.nim.c -o c_code/1_2/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/lexer.nim.c -o c_code/3_2/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimconf.nim.c -o c_code/2_2/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_intsets.nim.c -o c_code/1_2/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idgen.nim.c -o c_code/1_2/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ast.nim.c -o c_code/1_2/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/rodutils.nim.c -o c_code/1_2/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/astalgo.nim.c -o c_code/2_2/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parser.nim.c -o c_code/1_2/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/renderer.nim.c -o c_code/1_2/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filters.nim.c -o c_code/1_2/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filter__tmpl.nim.c -o c_code/1_2/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/syntaxes.nim.c -o c_code/1_2/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/trees.nim.c -o c_code/1_2/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/types.nim.c -o c_code/3_2/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/treetab.nim.c -o c_code/1_2/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/incremental.nim.c -o c_code/1_2/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/btrees.nim.c -o c_code/1_2/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_md5.nim.c -o c_code/1_2/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulegraphs.nim.c -o c_code/1_2/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/magicsys.nim.c -o c_code/1_2/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/bitsets.nim.c -o c_code/1_2/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimsets.nim.c -o c_code/1_2/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/semfold.nim.c -o c_code/3_2/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/modulepaths.nim.c -o c_code/3_2/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/reorder.nim.c -o c_code/1_2/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passes.nim.c -o c_code/1_2/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdef.nim.c -o c_code/1_2/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semdata.nim.c -o c_code/1_2/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/linter.nim.c -o c_code/1_2/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimfix7prettybase.nim.c -o c_code/1_2/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lookups.nim.c -o c_code/1_2/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semtypinst.nim.c -o c_code/1_2/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parampatterns.nim.c -o c_code/1_2/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lowerings.nim.c -o c_code/1_2/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rstast.nim.c -o c_code/1_2/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rst.nim.c -o c_code/1_2/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7highlite.nim.c -o c_code/1_2/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/_7lib7packages7docutils7rstgen.nim.c -o c_code/3_2/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_xmltree.nim.c -o c_code/1_2/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_uri.nim.c -o c_code/1_2/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cgi.nim.c -o c_code/1_2/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/typesrenderer.nim.c -o c_code/1_2/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docgen.nim.c -o c_code/2_2/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/sigmatch.nim.c -o c_code/3_2/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/importer.nim.c -o c_code/1_2/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/procfind.nim.c -o c_code/1_2/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/pragmas.nim.c -o c_code/3_2/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/saturate.nim.c -o c_code/1_2/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/guards.nim.c -o c_code/1_2/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sighashes.nim.c -o c_code/1_2/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sempass2.nim.c -o c_code/1_2/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgmeth.nim.c -o c_code/1_2/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/aliases.nim.c -o c_code/1_2/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/patterns.nim.c -o c_code/1_2/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/dfa.nim.c -o c_code/1_2/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/injectdestructors.nim.c -o c_code/1_2/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/liftlocals.nim.c -o c_code/1_2/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lambdalifting.nim.c -o c_code/1_2/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/closureiters.nim.c -o c_code/1_2/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/transf.nim.c -o c_code/1_2/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmgen.nim.c -o c_code/1_2/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/vmdeps.nim.c -o c_code/3_2/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmmarshal.nim.c -o c_code/1_2/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/gorgeimpl.nim.c -o c_code/3_2/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/macrocacheimpl.nim.c -o c_code/1_2/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/evaltempl.nim.c -o c_code/1_2/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/vm.nim.c -o c_code/3_2/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semmacrosanity.nim.c -o c_code/1_2/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/pluginsupport.nim.c -o c_code/1_2/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7locals.nim.c -o c_code/1_2/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7itersgen.nim.c -o c_code/1_2/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7active.nim.c -o c_code/1_2/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semparallel.nim.c -o c_code/1_2/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/sem.nim.c -o c_code/3_2/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgutils.nim.c -o c_code/1_2/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ndi.nim.c -o c_code/1_2/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgendata.nim.c -o c_code/1_2/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgmerge.nim.c -o c_code/1_2/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/enumtostr.nim.c -o c_code/1_2/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.nim.c -o c_code/2_2/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgen.nim.c -o c_code/1_2/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passaux.nim.c -o c_code/1_2/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/depends.nim.c -o c_code/1_2/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modules.nim.c -o c_code/1_2/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/jsgen.nim.c -o c_code/1_2/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/docgen2.nim.c -o c_code/3_2/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/main.nim.c -o c_code/1_2/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/scriptconfig.nim.c -o c_code/3_2/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/cmdlinehelper.nim.c -o c_code/3_2/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/nim.nim.c -o c_code/3_2/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_2/stdlib_assertions.nim.o \
c_code/1_2/stdlib_dollars.nim.o \
c_code/3_2/stdlib_io.nim.o \
c_code/3_2/stdlib_system.nim.o \
c_code/2_2/stdlib_parseutils.nim.o \
c_code/2_2/stdlib_math.nim.o \
c_code/1_2/stdlib_algorithm.nim.o \
c_code/2_2/stdlib_unicode.nim.o \
c_code/2_2/stdlib_strutils.nim.o \
c_code/2_2/stdlib_pathnorm.nim.o \
c_code/3_2/stdlib_posix.nim.o \
c_code/3_2/stdlib_times.nim.o \
c_code/3_2/stdlib_os.nim.o \
c_code/1_2/stdlib_hashes.nim.o \
c_code/1_2/stdlib_strtabs.nim.o \
c_code/3_2/stdlib_streams.nim.o \
c_code/3_2/stdlib_cpuinfo.nim.o \
c_code/3_2/stdlib_osproc.nim.o \
c_code/1_2/stdlib_sets.nim.o \
c_code/2_2/pathutils.nim.o \
c_code/1_2/ropes.nim.o \
c_code/1_2/stdlib_tables.nim.o \
c_code/1_2/lineinfos.nim.o \
c_code/3_2/platform.nim.o \
c_code/1_2/prefixmatches.nim.o \
c_code/2_2/stdlib_strformat.nim.o \
c_code/2_2/stdlib_terminal.nim.o \
c_code/3_2/options.nim.o \
c_code/3_2/msgs.nim.o \
c_code/1_2/wordrecg.nim.o \
c_code/1_2/idents.nim.o \
c_code/1_2/condsyms.nim.o \
c_code/1_2/stdlib_sha1.nim.o \
c_code/2_2/stdlib_lexbase.nim.o \
c_code/1_2/stdlib_parsejson.nim.o \
c_code/3_2/stdlib_json.nim.o \
c_code/3_2/extccomp.nim.o \
c_code/3_2/nimblecmd.nim.o \
c_code/2_2/stdlib_parseopt.nim.o \
c_code/3_2/commands.nim.o \
c_code/1_2/llstream.nim.o \
c_code/1_2/nimlexbase.nim.o \
c_code/3_2/lexer.nim.o \
c_code/2_2/nimconf.nim.o \
c_code/1_2/stdlib_intsets.nim.o \
c_code/1_2/idgen.nim.o \
c_code/1_2/ast.nim.o \
c_code/1_2/rodutils.nim.o \
c_code/2_2/astalgo.nim.o \
c_code/1_2/parser.nim.o \
c_code/1_2/renderer.nim.o \
c_code/1_2/filters.nim.o \
c_code/1_2/filter__tmpl.nim.o \
c_code/1_2/syntaxes.nim.o \
c_code/1_2/trees.nim.o \
c_code/3_2/types.nim.o \
c_code/1_2/treetab.nim.o \
c_code/1_2/incremental.nim.o \
c_code/1_2/btrees.nim.o \
c_code/1_2/stdlib_md5.nim.o \
c_code/1_2/modulegraphs.nim.o \
c_code/1_2/magicsys.nim.o \
c_code/1_2/bitsets.nim.o \
c_code/1_2/nimsets.nim.o \
c_code/3_2/semfold.nim.o \
c_code/3_2/modulepaths.nim.o \
c_code/1_2/reorder.nim.o \
c_code/1_2/passes.nim.o \
c_code/1_2/vmdef.nim.o \
c_code/1_2/semdata.nim.o \
c_code/1_2/linter.nim.o \
c_code/1_2/nimfix7prettybase.nim.o \
c_code/1_2/lookups.nim.o \
c_code/1_2/semtypinst.nim.o \
c_code/1_2/parampatterns.nim.o \
c_code/1_2/lowerings.nim.o \
c_code/1_2/_7lib7packages7docutils7rstast.nim.o \
c_code/1_2/_7lib7packages7docutils7rst.nim.o \
c_code/1_2/_7lib7packages7docutils7highlite.nim.o \
c_code/3_2/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_2/stdlib_xmltree.nim.o \
c_code/1_2/stdlib_uri.nim.o \
c_code/1_2/stdlib_cgi.nim.o \
c_code/1_2/typesrenderer.nim.o \
c_code/2_2/docgen.nim.o \
c_code/3_2/sigmatch.nim.o \
c_code/1_2/importer.nim.o \
c_code/1_2/procfind.nim.o \
c_code/3_2/pragmas.nim.o \
c_code/1_2/saturate.nim.o \
c_code/1_2/guards.nim.o \
c_code/1_2/sighashes.nim.o \
c_code/1_2/sempass2.nim.o \
c_code/1_2/cgmeth.nim.o \
c_code/1_2/aliases.nim.o \
c_code/1_2/patterns.nim.o \
c_code/1_2/dfa.nim.o \
c_code/1_2/injectdestructors.nim.o \
c_code/1_2/liftlocals.nim.o \
c_code/1_2/lambdalifting.nim.o \
c_code/1_2/closureiters.nim.o \
c_code/1_2/transf.nim.o \
c_code/1_2/vmgen.nim.o \
c_code/3_2/vmdeps.nim.o \
c_code/1_2/vmmarshal.nim.o \
c_code/3_2/gorgeimpl.nim.o \
c_code/1_2/macrocacheimpl.nim.o \
c_code/1_2/evaltempl.nim.o \
c_code/3_2/vm.nim.o \
c_code/1_2/semmacrosanity.nim.o \
c_code/1_2/pluginsupport.nim.o \
c_code/1_2/plugins7locals.nim.o \
c_code/1_2/plugins7itersgen.nim.o \
c_code/1_2/plugins7active.nim.o \
c_code/1_2/semparallel.nim.o \
c_code/3_2/sem.nim.o \
c_code/1_2/ccgutils.nim.o \
c_code/1_2/ndi.nim.o \
c_code/1_2/cgendata.nim.o \
c_code/1_2/ccgmerge.nim.o \
c_code/1_2/enumtostr.nim.o \
c_code/2_2/stdlib_dynlib.nim.o \
c_code/1_2/cgen.nim.o \
c_code/1_2/passaux.nim.o \
c_code/1_2/depends.nim.o \
c_code/1_2/modules.nim.o \
c_code/1_2/jsgen.nim.o \
c_code/3_2/docgen2.nim.o \
c_code/1_2/main.nim.o \
c_code/3_2/scriptconfig.nim.o \
c_code/3_2/cmdlinehelper.nim.o \
c_code/3_2/nim.nim.o $LINK_FLAGS
    ;;
  alpha)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_assertions.nim.c -o c_code/1_2/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_dollars.nim.c -o c_code/1_2/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_io.nim.c -o c_code/3_2/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_4/stdlib_system.nim.c -o c_code/3_4/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.nim.c -o c_code/2_2/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.nim.c -o c_code/2_2/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_algorithm.nim.c -o c_code/1_2/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.nim.c -o c_code/2_2/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.nim.c -o c_code/2_2/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_pathnorm.nim.c -o c_code/2_2/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_posix.nim.c -o c_code/3_2/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_times.nim.c -o c_code/3_2/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_os.nim.c -o c_code/3_2/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_hashes.nim.c -o c_code/1_2/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strtabs.nim.c -o c_code/1_2/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_streams.nim.c -o c_code/3_2/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_cpuinfo.nim.c -o c_code/3_2/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_osproc.nim.c -o c_code/3_2/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sets.nim.c -o c_code/1_2/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/pathutils.nim.c -o c_code/2_2/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ropes.nim.c -o c_code/1_2/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_tables.nim.c -o c_code/1_2/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lineinfos.nim.c -o c_code/1_2/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_4/platform.nim.c -o c_code/3_4/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/prefixmatches.nim.c -o c_code/1_2/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strformat.nim.c -o c_code/2_2/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.nim.c -o c_code/2_2/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/options.nim.c -o c_code/3_2/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/msgs.nim.c -o c_code/3_2/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/wordrecg.nim.c -o c_code/1_2/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idents.nim.c -o c_code/1_2/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/condsyms.nim.c -o c_code/1_2/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_sha1.nim.c -o c_code/2_4/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.nim.c -o c_code/2_2/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parsejson.nim.c -o c_code/1_2/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_json.nim.c -o c_code/3_2/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/extccomp.nim.c -o c_code/3_2/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/nimblecmd.nim.c -o c_code/3_2/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.nim.c -o c_code/2_2/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/commands.nim.c -o c_code/3_2/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/llstream.nim.c -o c_code/1_2/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimlexbase.nim.c -o c_code/1_2/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/lexer.nim.c -o c_code/3_2/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimconf.nim.c -o c_code/2_2/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_intsets.nim.c -o c_code/1_2/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idgen.nim.c -o c_code/1_2/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ast.nim.c -o c_code/1_2/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/rodutils.nim.c -o c_code/1_2/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/astalgo.nim.c -o c_code/2_2/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parser.nim.c -o c_code/1_2/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/renderer.nim.c -o c_code/1_2/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filters.nim.c -o c_code/1_2/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filter__tmpl.nim.c -o c_code/1_2/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/syntaxes.nim.c -o c_code/1_2/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/trees.nim.c -o c_code/1_2/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/types.nim.c -o c_code/3_2/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/treetab.nim.c -o c_code/1_2/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/incremental.nim.c -o c_code/1_2/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/btrees.nim.c -o c_code/1_2/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_md5.nim.c -o c_code/1_2/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulegraphs.nim.c -o c_code/1_2/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/magicsys.nim.c -o c_code/1_2/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/bitsets.nim.c -o c_code/1_2/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimsets.nim.c -o c_code/1_2/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/semfold.nim.c -o c_code/3_2/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/modulepaths.nim.c -o c_code/3_2/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/reorder.nim.c -o c_code/1_2/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passes.nim.c -o c_code/1_2/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdef.nim.c -o c_code/1_2/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semdata.nim.c -o c_code/1_2/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/linter.nim.c -o c_code/1_2/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimfix7prettybase.nim.c -o c_code/1_2/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lookups.nim.c -o c_code/1_2/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semtypinst.nim.c -o c_code/1_2/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parampatterns.nim.c -o c_code/1_2/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lowerings.nim.c -o c_code/1_2/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rstast.nim.c -o c_code/1_2/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rst.nim.c -o c_code/1_2/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7highlite.nim.c -o c_code/1_2/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/_7lib7packages7docutils7rstgen.nim.c -o c_code/3_2/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_xmltree.nim.c -o c_code/1_2/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_uri.nim.c -o c_code/1_2/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cgi.nim.c -o c_code/1_2/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/typesrenderer.nim.c -o c_code/1_2/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docgen.nim.c -o c_code/2_2/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/sigmatch.nim.c -o c_code/3_2/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/importer.nim.c -o c_code/1_2/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/procfind.nim.c -o c_code/1_2/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/pragmas.nim.c -o c_code/3_2/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/saturate.nim.c -o c_code/1_2/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/guards.nim.c -o c_code/1_2/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sighashes.nim.c -o c_code/1_2/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sempass2.nim.c -o c_code/1_2/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgmeth.nim.c -o c_code/1_2/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/aliases.nim.c -o c_code/1_2/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/patterns.nim.c -o c_code/1_2/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/dfa.nim.c -o c_code/1_2/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/injectdestructors.nim.c -o c_code/1_2/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/liftlocals.nim.c -o c_code/1_2/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lambdalifting.nim.c -o c_code/1_2/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/closureiters.nim.c -o c_code/1_2/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/transf.nim.c -o c_code/1_2/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmgen.nim.c -o c_code/1_2/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/vmdeps.nim.c -o c_code/3_2/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmmarshal.nim.c -o c_code/1_2/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/gorgeimpl.nim.c -o c_code/3_2/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/macrocacheimpl.nim.c -o c_code/1_2/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/evaltempl.nim.c -o c_code/1_2/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_4/vm.nim.c -o c_code/3_4/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semmacrosanity.nim.c -o c_code/1_2/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/pluginsupport.nim.c -o c_code/1_2/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7locals.nim.c -o c_code/1_2/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7itersgen.nim.c -o c_code/1_2/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7active.nim.c -o c_code/1_2/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semparallel.nim.c -o c_code/1_2/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/sem.nim.c -o c_code/3_2/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgutils.nim.c -o c_code/1_2/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ndi.nim.c -o c_code/1_2/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgendata.nim.c -o c_code/1_2/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgmerge.nim.c -o c_code/1_2/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/enumtostr.nim.c -o c_code/1_2/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.nim.c -o c_code/2_2/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgen.nim.c -o c_code/1_2/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passaux.nim.c -o c_code/1_2/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/depends.nim.c -o c_code/1_2/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modules.nim.c -o c_code/1_2/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/jsgen.nim.c -o c_code/1_2/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/docgen2.nim.c -o c_code/3_2/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/main.nim.c -o c_code/1_2/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/scriptconfig.nim.c -o c_code/3_2/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/cmdlinehelper.nim.c -o c_code/3_2/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/nim.nim.c -o c_code/3_2/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_2/stdlib_assertions.nim.o \
c_code/1_2/stdlib_dollars.nim.o \
c_code/3_2/stdlib_io.nim.o \
c_code/3_4/stdlib_system.nim.o \
c_code/2_2/stdlib_parseutils.nim.o \
c_code/2_2/stdlib_math.nim.o \
c_code/1_2/stdlib_algorithm.nim.o \
c_code/2_2/stdlib_unicode.nim.o \
c_code/2_2/stdlib_strutils.nim.o \
c_code/2_2/stdlib_pathnorm.nim.o \
c_code/3_2/stdlib_posix.nim.o \
c_code/3_2/stdlib_times.nim.o \
c_code/3_2/stdlib_os.nim.o \
c_code/1_2/stdlib_hashes.nim.o \
c_code/1_2/stdlib_strtabs.nim.o \
c_code/3_2/stdlib_streams.nim.o \
c_code/3_2/stdlib_cpuinfo.nim.o \
c_code/3_2/stdlib_osproc.nim.o \
c_code/1_2/stdlib_sets.nim.o \
c_code/2_2/pathutils.nim.o \
c_code/1_2/ropes.nim.o \
c_code/1_2/stdlib_tables.nim.o \
c_code/1_2/lineinfos.nim.o \
c_code/3_4/platform.nim.o \
c_code/1_2/prefixmatches.nim.o \
c_code/2_2/stdlib_strformat.nim.o \
c_code/2_2/stdlib_terminal.nim.o \
c_code/3_2/options.nim.o \
c_code/3_2/msgs.nim.o \
c_code/1_2/wordrecg.nim.o \
c_code/1_2/idents.nim.o \
c_code/1_2/condsyms.nim.o \
c_code/2_4/stdlib_sha1.nim.o \
c_code/2_2/stdlib_lexbase.nim.o \
c_code/1_2/stdlib_parsejson.nim.o \
c_code/3_2/stdlib_json.nim.o \
c_code/3_2/extccomp.nim.o \
c_code/3_2/nimblecmd.nim.o \
c_code/2_2/stdlib_parseopt.nim.o \
c_code/3_2/commands.nim.o \
c_code/1_2/llstream.nim.o \
c_code/1_2/nimlexbase.nim.o \
c_code/3_2/lexer.nim.o \
c_code/2_2/nimconf.nim.o \
c_code/1_2/stdlib_intsets.nim.o \
c_code/1_2/idgen.nim.o \
c_code/1_2/ast.nim.o \
c_code/1_2/rodutils.nim.o \
c_code/2_2/astalgo.nim.o \
c_code/1_2/parser.nim.o \
c_code/1_2/renderer.nim.o \
c_code/1_2/filters.nim.o \
c_code/1_2/filter__tmpl.nim.o \
c_code/1_2/syntaxes.nim.o \
c_code/1_2/trees.nim.o \
c_code/3_2/types.nim.o \
c_code/1_2/treetab.nim.o \
c_code/1_2/incremental.nim.o \
c_code/1_2/btrees.nim.o \
c_code/1_2/stdlib_md5.nim.o \
c_code/1_2/modulegraphs.nim.o \
c_code/1_2/magicsys.nim.o \
c_code/1_2/bitsets.nim.o \
c_code/1_2/nimsets.nim.o \
c_code/3_2/semfold.nim.o \
c_code/3_2/modulepaths.nim.o \
c_code/1_2/reorder.nim.o \
c_code/1_2/passes.nim.o \
c_code/1_2/vmdef.nim.o \
c_code/1_2/semdata.nim.o \
c_code/1_2/linter.nim.o \
c_code/1_2/nimfix7prettybase.nim.o \
c_code/1_2/lookups.nim.o \
c_code/1_2/semtypinst.nim.o \
c_code/1_2/parampatterns.nim.o \
c_code/1_2/lowerings.nim.o \
c_code/1_2/_7lib7packages7docutils7rstast.nim.o \
c_code/1_2/_7lib7packages7docutils7rst.nim.o \
c_code/1_2/_7lib7packages7docutils7highlite.nim.o \
c_code/3_2/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_2/stdlib_xmltree.nim.o \
c_code/1_2/stdlib_uri.nim.o \
c_code/1_2/stdlib_cgi.nim.o \
c_code/1_2/typesrenderer.nim.o \
c_code/2_2/docgen.nim.o \
c_code/3_2/sigmatch.nim.o \
c_code/1_2/importer.nim.o \
c_code/1_2/procfind.nim.o \
c_code/3_2/pragmas.nim.o \
c_code/1_2/saturate.nim.o \
c_code/1_2/guards.nim.o \
c_code/1_2/sighashes.nim.o \
c_code/1_2/sempass2.nim.o \
c_code/1_2/cgmeth.nim.o \
c_code/1_2/aliases.nim.o \
c_code/1_2/patterns.nim.o \
c_code/1_2/dfa.nim.o \
c_code/1_2/injectdestructors.nim.o \
c_code/1_2/liftlocals.nim.o \
c_code/1_2/lambdalifting.nim.o \
c_code/1_2/closureiters.nim.o \
c_code/1_2/transf.nim.o \
c_code/1_2/vmgen.nim.o \
c_code/3_2/vmdeps.nim.o \
c_code/1_2/vmmarshal.nim.o \
c_code/3_2/gorgeimpl.nim.o \
c_code/1_2/macrocacheimpl.nim.o \
c_code/1_2/evaltempl.nim.o \
c_code/3_4/vm.nim.o \
c_code/1_2/semmacrosanity.nim.o \
c_code/1_2/pluginsupport.nim.o \
c_code/1_2/plugins7locals.nim.o \
c_code/1_2/plugins7itersgen.nim.o \
c_code/1_2/plugins7active.nim.o \
c_code/1_2/semparallel.nim.o \
c_code/3_2/sem.nim.o \
c_code/1_2/ccgutils.nim.o \
c_code/1_2/ndi.nim.o \
c_code/1_2/cgendata.nim.o \
c_code/1_2/ccgmerge.nim.o \
c_code/1_2/enumtostr.nim.o \
c_code/2_2/stdlib_dynlib.nim.o \
c_code/1_2/cgen.nim.o \
c_code/1_2/passaux.nim.o \
c_code/1_2/depends.nim.o \
c_code/1_2/modules.nim.o \
c_code/1_2/jsgen.nim.o \
c_code/3_2/docgen2.nim.o \
c_code/1_2/main.nim.o \
c_code/3_2/scriptconfig.nim.o \
c_code/3_2/cmdlinehelper.nim.o \
c_code/3_2/nim.nim.o $LINK_FLAGS
    ;;
  arm)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  m68k)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mipsel)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips64el)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc64el)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  arm64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  riscv64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
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
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_assertions.nim.c -o c_code/1_1/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_dollars.nim.c -o c_code/1_1/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_io.nim.c -o c_code/3_1/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_system.nim.c -o c_code/4_1/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.nim.c -o c_code/2_1/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.nim.c -o c_code/2_1/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_algorithm.nim.c -o c_code/1_1/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.nim.c -o c_code/2_1/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.nim.c -o c_code/2_1/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_pathnorm.nim.c -o c_code/2_1/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_posix.nim.c -o c_code/3_1/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_times.nim.c -o c_code/4_1/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_os.nim.c -o c_code/4_1/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_hashes.nim.c -o c_code/1_1/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strtabs.nim.c -o c_code/1_1/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_streams.nim.c -o c_code/3_1/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cpuinfo.nim.c -o c_code/2_1/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_osproc.nim.c -o c_code/4_1/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sets.nim.c -o c_code/1_1/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pathutils.nim.c -o c_code/2_1/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ropes.nim.c -o c_code/1_1/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_tables.nim.c -o c_code/1_1/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lineinfos.nim.c -o c_code/1_1/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/platform.nim.c -o c_code/4_1/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/prefixmatches.nim.c -o c_code/1_1/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strformat.nim.c -o c_code/2_1/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.nim.c -o c_code/2_1/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/options.nim.c -o c_code/4_1/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/msgs.nim.c -o c_code/3_1/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/wordrecg.nim.c -o c_code/1_1/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idents.nim.c -o c_code/1_1/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/condsyms.nim.c -o c_code/1_1/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sha1.nim.c -o c_code/1_1/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.nim.c -o c_code/2_1/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parsejson.nim.c -o c_code/1_1/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_json.nim.c -o c_code/3_1/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/extccomp.nim.c -o c_code/4_1/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/nimblecmd.nim.c -o c_code/4_1/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.nim.c -o c_code/2_1/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/commands.nim.c -o c_code/3_1/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/llstream.nim.c -o c_code/1_1/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimlexbase.nim.c -o c_code/1_1/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/lexer.nim.c -o c_code/3_1/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimconf.nim.c -o c_code/2_1/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_intsets.nim.c -o c_code/1_1/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idgen.nim.c -o c_code/1_1/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ast.nim.c -o c_code/1_1/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/rodutils.nim.c -o c_code/1_1/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/astalgo.nim.c -o c_code/2_1/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parser.nim.c -o c_code/1_1/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/renderer.nim.c -o c_code/1_1/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filters.nim.c -o c_code/1_1/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filter__tmpl.nim.c -o c_code/1_1/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/syntaxes.nim.c -o c_code/1_1/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/trees.nim.c -o c_code/1_1/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/types.nim.c -o c_code/3_1/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/treetab.nim.c -o c_code/1_1/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/incremental.nim.c -o c_code/1_1/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/btrees.nim.c -o c_code/1_1/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_md5.nim.c -o c_code/1_1/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulegraphs.nim.c -o c_code/1_1/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/magicsys.nim.c -o c_code/1_1/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/bitsets.nim.c -o c_code/1_1/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimsets.nim.c -o c_code/1_1/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/semfold.nim.c -o c_code/3_1/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/modulepaths.nim.c -o c_code/3_1/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/reorder.nim.c -o c_code/1_1/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passes.nim.c -o c_code/1_1/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdef.nim.c -o c_code/1_1/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semdata.nim.c -o c_code/1_1/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/linter.nim.c -o c_code/1_1/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimfix7prettybase.nim.c -o c_code/1_1/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lookups.nim.c -o c_code/1_1/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semtypinst.nim.c -o c_code/1_1/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parampatterns.nim.c -o c_code/1_1/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lowerings.nim.c -o c_code/1_1/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rstast.nim.c -o c_code/1_1/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rst.nim.c -o c_code/1_1/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7highlite.nim.c -o c_code/1_1/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/_7lib7packages7docutils7rstgen.nim.c -o c_code/4_1/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_xmltree.nim.c -o c_code/1_1/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_uri.nim.c -o c_code/1_1/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cgi.nim.c -o c_code/1_1/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/typesrenderer.nim.c -o c_code/1_1/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docgen.nim.c -o c_code/2_1/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/sigmatch.nim.c -o c_code/3_1/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/importer.nim.c -o c_code/1_1/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/procfind.nim.c -o c_code/1_1/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/pragmas.nim.c -o c_code/3_1/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/saturate.nim.c -o c_code/1_1/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/guards.nim.c -o c_code/1_1/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sighashes.nim.c -o c_code/1_1/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sempass2.nim.c -o c_code/1_1/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgmeth.nim.c -o c_code/1_1/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/aliases.nim.c -o c_code/1_1/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/patterns.nim.c -o c_code/1_1/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/dfa.nim.c -o c_code/1_1/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/injectdestructors.nim.c -o c_code/1_1/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/liftlocals.nim.c -o c_code/1_1/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lambdalifting.nim.c -o c_code/1_1/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/closureiters.nim.c -o c_code/1_1/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/transf.nim.c -o c_code/1_1/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmgen.nim.c -o c_code/1_1/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/vmdeps.nim.c -o c_code/3_1/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmmarshal.nim.c -o c_code/1_1/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/gorgeimpl.nim.c -o c_code/3_1/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/macrocacheimpl.nim.c -o c_code/1_1/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/evaltempl.nim.c -o c_code/1_1/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/vm.nim.c -o c_code/4_1/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semmacrosanity.nim.c -o c_code/1_1/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/pluginsupport.nim.c -o c_code/1_1/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7locals.nim.c -o c_code/1_1/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7itersgen.nim.c -o c_code/1_1/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7active.nim.c -o c_code/1_1/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semparallel.nim.c -o c_code/1_1/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/sem.nim.c -o c_code/3_1/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgutils.nim.c -o c_code/1_1/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ndi.nim.c -o c_code/1_1/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgendata.nim.c -o c_code/1_1/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgmerge.nim.c -o c_code/1_1/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/enumtostr.nim.c -o c_code/1_1/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.nim.c -o c_code/2_1/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgen.nim.c -o c_code/1_1/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passaux.nim.c -o c_code/1_1/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/depends.nim.c -o c_code/1_1/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modules.nim.c -o c_code/1_1/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/jsgen.nim.c -o c_code/1_1/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/docgen2.nim.c -o c_code/3_1/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/main.nim.c -o c_code/1_1/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/scriptconfig.nim.c -o c_code/4_1/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/cmdlinehelper.nim.c -o c_code/3_1/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/nim.nim.c -o c_code/3_1/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_1/stdlib_assertions.nim.o \
c_code/1_1/stdlib_dollars.nim.o \
c_code/3_1/stdlib_io.nim.o \
c_code/4_1/stdlib_system.nim.o \
c_code/2_1/stdlib_parseutils.nim.o \
c_code/2_1/stdlib_math.nim.o \
c_code/1_1/stdlib_algorithm.nim.o \
c_code/2_1/stdlib_unicode.nim.o \
c_code/2_1/stdlib_strutils.nim.o \
c_code/2_1/stdlib_pathnorm.nim.o \
c_code/3_1/stdlib_posix.nim.o \
c_code/4_1/stdlib_times.nim.o \
c_code/4_1/stdlib_os.nim.o \
c_code/1_1/stdlib_hashes.nim.o \
c_code/1_1/stdlib_strtabs.nim.o \
c_code/3_1/stdlib_streams.nim.o \
c_code/2_1/stdlib_cpuinfo.nim.o \
c_code/4_1/stdlib_osproc.nim.o \
c_code/1_1/stdlib_sets.nim.o \
c_code/2_1/pathutils.nim.o \
c_code/1_1/ropes.nim.o \
c_code/1_1/stdlib_tables.nim.o \
c_code/1_1/lineinfos.nim.o \
c_code/4_1/platform.nim.o \
c_code/1_1/prefixmatches.nim.o \
c_code/2_1/stdlib_strformat.nim.o \
c_code/2_1/stdlib_terminal.nim.o \
c_code/4_1/options.nim.o \
c_code/3_1/msgs.nim.o \
c_code/1_1/wordrecg.nim.o \
c_code/1_1/idents.nim.o \
c_code/1_1/condsyms.nim.o \
c_code/1_1/stdlib_sha1.nim.o \
c_code/2_1/stdlib_lexbase.nim.o \
c_code/1_1/stdlib_parsejson.nim.o \
c_code/3_1/stdlib_json.nim.o \
c_code/4_1/extccomp.nim.o \
c_code/4_1/nimblecmd.nim.o \
c_code/2_1/stdlib_parseopt.nim.o \
c_code/3_1/commands.nim.o \
c_code/1_1/llstream.nim.o \
c_code/1_1/nimlexbase.nim.o \
c_code/3_1/lexer.nim.o \
c_code/2_1/nimconf.nim.o \
c_code/1_1/stdlib_intsets.nim.o \
c_code/1_1/idgen.nim.o \
c_code/1_1/ast.nim.o \
c_code/1_1/rodutils.nim.o \
c_code/2_1/astalgo.nim.o \
c_code/1_1/parser.nim.o \
c_code/1_1/renderer.nim.o \
c_code/1_1/filters.nim.o \
c_code/1_1/filter__tmpl.nim.o \
c_code/1_1/syntaxes.nim.o \
c_code/1_1/trees.nim.o \
c_code/3_1/types.nim.o \
c_code/1_1/treetab.nim.o \
c_code/1_1/incremental.nim.o \
c_code/1_1/btrees.nim.o \
c_code/1_1/stdlib_md5.nim.o \
c_code/1_1/modulegraphs.nim.o \
c_code/1_1/magicsys.nim.o \
c_code/1_1/bitsets.nim.o \
c_code/1_1/nimsets.nim.o \
c_code/3_1/semfold.nim.o \
c_code/3_1/modulepaths.nim.o \
c_code/1_1/reorder.nim.o \
c_code/1_1/passes.nim.o \
c_code/1_1/vmdef.nim.o \
c_code/1_1/semdata.nim.o \
c_code/1_1/linter.nim.o \
c_code/1_1/nimfix7prettybase.nim.o \
c_code/1_1/lookups.nim.o \
c_code/1_1/semtypinst.nim.o \
c_code/1_1/parampatterns.nim.o \
c_code/1_1/lowerings.nim.o \
c_code/1_1/_7lib7packages7docutils7rstast.nim.o \
c_code/1_1/_7lib7packages7docutils7rst.nim.o \
c_code/1_1/_7lib7packages7docutils7highlite.nim.o \
c_code/4_1/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_1/stdlib_xmltree.nim.o \
c_code/1_1/stdlib_uri.nim.o \
c_code/1_1/stdlib_cgi.nim.o \
c_code/1_1/typesrenderer.nim.o \
c_code/2_1/docgen.nim.o \
c_code/3_1/sigmatch.nim.o \
c_code/1_1/importer.nim.o \
c_code/1_1/procfind.nim.o \
c_code/3_1/pragmas.nim.o \
c_code/1_1/saturate.nim.o \
c_code/1_1/guards.nim.o \
c_code/1_1/sighashes.nim.o \
c_code/1_1/sempass2.nim.o \
c_code/1_1/cgmeth.nim.o \
c_code/1_1/aliases.nim.o \
c_code/1_1/patterns.nim.o \
c_code/1_1/dfa.nim.o \
c_code/1_1/injectdestructors.nim.o \
c_code/1_1/liftlocals.nim.o \
c_code/1_1/lambdalifting.nim.o \
c_code/1_1/closureiters.nim.o \
c_code/1_1/transf.nim.o \
c_code/1_1/vmgen.nim.o \
c_code/3_1/vmdeps.nim.o \
c_code/1_1/vmmarshal.nim.o \
c_code/3_1/gorgeimpl.nim.o \
c_code/1_1/macrocacheimpl.nim.o \
c_code/1_1/evaltempl.nim.o \
c_code/4_1/vm.nim.o \
c_code/1_1/semmacrosanity.nim.o \
c_code/1_1/pluginsupport.nim.o \
c_code/1_1/plugins7locals.nim.o \
c_code/1_1/plugins7itersgen.nim.o \
c_code/1_1/plugins7active.nim.o \
c_code/1_1/semparallel.nim.o \
c_code/3_1/sem.nim.o \
c_code/1_1/ccgutils.nim.o \
c_code/1_1/ndi.nim.o \
c_code/1_1/cgendata.nim.o \
c_code/1_1/ccgmerge.nim.o \
c_code/1_1/enumtostr.nim.o \
c_code/2_1/stdlib_dynlib.nim.o \
c_code/1_1/cgen.nim.o \
c_code/1_1/passaux.nim.o \
c_code/1_1/depends.nim.o \
c_code/1_1/modules.nim.o \
c_code/1_1/jsgen.nim.o \
c_code/3_1/docgen2.nim.o \
c_code/1_1/main.nim.o \
c_code/4_1/scriptconfig.nim.o \
c_code/3_1/cmdlinehelper.nim.o \
c_code/3_1/nim.nim.o $LINK_FLAGS
    ;;
  amd64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_assertions.nim.c -o c_code/1_2/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_dollars.nim.c -o c_code/1_2/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_io.nim.c -o c_code/3_2/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_system.nim.c -o c_code/4_2/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.nim.c -o c_code/2_2/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.nim.c -o c_code/2_2/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_algorithm.nim.c -o c_code/1_2/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.nim.c -o c_code/2_2/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.nim.c -o c_code/2_2/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_pathnorm.nim.c -o c_code/2_2/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_posix.nim.c -o c_code/3_2/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_times.nim.c -o c_code/4_2/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_os.nim.c -o c_code/4_2/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_hashes.nim.c -o c_code/1_2/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strtabs.nim.c -o c_code/1_2/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_streams.nim.c -o c_code/3_2/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_cpuinfo.nim.c -o c_code/2_3/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_osproc.nim.c -o c_code/4_2/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sets.nim.c -o c_code/1_2/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/pathutils.nim.c -o c_code/2_2/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ropes.nim.c -o c_code/1_2/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_tables.nim.c -o c_code/1_2/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lineinfos.nim.c -o c_code/1_2/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/platform.nim.c -o c_code/4_2/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/prefixmatches.nim.c -o c_code/1_2/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strformat.nim.c -o c_code/2_2/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.nim.c -o c_code/2_2/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/options.nim.c -o c_code/4_2/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/msgs.nim.c -o c_code/3_2/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/wordrecg.nim.c -o c_code/1_2/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idents.nim.c -o c_code/1_2/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/condsyms.nim.c -o c_code/1_2/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sha1.nim.c -o c_code/1_2/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.nim.c -o c_code/2_2/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parsejson.nim.c -o c_code/1_2/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_json.nim.c -o c_code/3_2/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/extccomp.nim.c -o c_code/4_2/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/nimblecmd.nim.c -o c_code/4_2/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.nim.c -o c_code/2_2/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/commands.nim.c -o c_code/3_2/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/llstream.nim.c -o c_code/1_2/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimlexbase.nim.c -o c_code/1_2/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/lexer.nim.c -o c_code/3_2/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimconf.nim.c -o c_code/2_2/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_intsets.nim.c -o c_code/1_2/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idgen.nim.c -o c_code/1_2/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ast.nim.c -o c_code/1_2/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/rodutils.nim.c -o c_code/1_2/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/astalgo.nim.c -o c_code/2_2/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parser.nim.c -o c_code/1_2/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/renderer.nim.c -o c_code/1_2/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filters.nim.c -o c_code/1_2/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filter__tmpl.nim.c -o c_code/1_2/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/syntaxes.nim.c -o c_code/1_2/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/trees.nim.c -o c_code/1_2/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/types.nim.c -o c_code/3_2/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/treetab.nim.c -o c_code/1_2/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/incremental.nim.c -o c_code/1_2/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/btrees.nim.c -o c_code/1_2/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_md5.nim.c -o c_code/1_2/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulegraphs.nim.c -o c_code/1_2/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/magicsys.nim.c -o c_code/1_2/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/bitsets.nim.c -o c_code/1_2/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimsets.nim.c -o c_code/1_2/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/semfold.nim.c -o c_code/3_2/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/modulepaths.nim.c -o c_code/3_2/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/reorder.nim.c -o c_code/1_2/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passes.nim.c -o c_code/1_2/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdef.nim.c -o c_code/1_2/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semdata.nim.c -o c_code/1_2/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/linter.nim.c -o c_code/1_2/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimfix7prettybase.nim.c -o c_code/1_2/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lookups.nim.c -o c_code/1_2/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semtypinst.nim.c -o c_code/1_2/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parampatterns.nim.c -o c_code/1_2/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lowerings.nim.c -o c_code/1_2/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rstast.nim.c -o c_code/1_2/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rst.nim.c -o c_code/1_2/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7highlite.nim.c -o c_code/1_2/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/_7lib7packages7docutils7rstgen.nim.c -o c_code/4_2/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_xmltree.nim.c -o c_code/1_2/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_uri.nim.c -o c_code/1_2/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cgi.nim.c -o c_code/1_2/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/typesrenderer.nim.c -o c_code/1_2/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docgen.nim.c -o c_code/2_2/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/sigmatch.nim.c -o c_code/3_2/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/importer.nim.c -o c_code/1_2/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/procfind.nim.c -o c_code/1_2/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/pragmas.nim.c -o c_code/3_2/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/saturate.nim.c -o c_code/1_2/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/guards.nim.c -o c_code/1_2/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sighashes.nim.c -o c_code/1_2/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sempass2.nim.c -o c_code/1_2/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgmeth.nim.c -o c_code/1_2/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/aliases.nim.c -o c_code/1_2/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/patterns.nim.c -o c_code/1_2/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/dfa.nim.c -o c_code/1_2/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/injectdestructors.nim.c -o c_code/1_2/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/liftlocals.nim.c -o c_code/1_2/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lambdalifting.nim.c -o c_code/1_2/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/closureiters.nim.c -o c_code/1_2/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/transf.nim.c -o c_code/1_2/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmgen.nim.c -o c_code/1_2/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/vmdeps.nim.c -o c_code/3_2/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmmarshal.nim.c -o c_code/1_2/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/gorgeimpl.nim.c -o c_code/3_2/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/macrocacheimpl.nim.c -o c_code/1_2/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/evaltempl.nim.c -o c_code/1_2/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/vm.nim.c -o c_code/4_2/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semmacrosanity.nim.c -o c_code/1_2/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/pluginsupport.nim.c -o c_code/1_2/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7locals.nim.c -o c_code/1_2/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7itersgen.nim.c -o c_code/1_2/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7active.nim.c -o c_code/1_2/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semparallel.nim.c -o c_code/1_2/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/sem.nim.c -o c_code/3_2/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgutils.nim.c -o c_code/1_2/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ndi.nim.c -o c_code/1_2/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgendata.nim.c -o c_code/1_2/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgmerge.nim.c -o c_code/1_2/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/enumtostr.nim.c -o c_code/1_2/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.nim.c -o c_code/2_2/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgen.nim.c -o c_code/1_2/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passaux.nim.c -o c_code/1_2/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/depends.nim.c -o c_code/1_2/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modules.nim.c -o c_code/1_2/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/jsgen.nim.c -o c_code/1_2/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/docgen2.nim.c -o c_code/3_2/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/main.nim.c -o c_code/1_2/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/scriptconfig.nim.c -o c_code/4_2/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/cmdlinehelper.nim.c -o c_code/3_2/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/nim.nim.c -o c_code/3_2/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_2/stdlib_assertions.nim.o \
c_code/1_2/stdlib_dollars.nim.o \
c_code/3_2/stdlib_io.nim.o \
c_code/4_2/stdlib_system.nim.o \
c_code/2_2/stdlib_parseutils.nim.o \
c_code/2_2/stdlib_math.nim.o \
c_code/1_2/stdlib_algorithm.nim.o \
c_code/2_2/stdlib_unicode.nim.o \
c_code/2_2/stdlib_strutils.nim.o \
c_code/2_2/stdlib_pathnorm.nim.o \
c_code/3_2/stdlib_posix.nim.o \
c_code/4_2/stdlib_times.nim.o \
c_code/4_2/stdlib_os.nim.o \
c_code/1_2/stdlib_hashes.nim.o \
c_code/1_2/stdlib_strtabs.nim.o \
c_code/3_2/stdlib_streams.nim.o \
c_code/2_3/stdlib_cpuinfo.nim.o \
c_code/4_2/stdlib_osproc.nim.o \
c_code/1_2/stdlib_sets.nim.o \
c_code/2_2/pathutils.nim.o \
c_code/1_2/ropes.nim.o \
c_code/1_2/stdlib_tables.nim.o \
c_code/1_2/lineinfos.nim.o \
c_code/4_2/platform.nim.o \
c_code/1_2/prefixmatches.nim.o \
c_code/2_2/stdlib_strformat.nim.o \
c_code/2_2/stdlib_terminal.nim.o \
c_code/4_2/options.nim.o \
c_code/3_2/msgs.nim.o \
c_code/1_2/wordrecg.nim.o \
c_code/1_2/idents.nim.o \
c_code/1_2/condsyms.nim.o \
c_code/1_2/stdlib_sha1.nim.o \
c_code/2_2/stdlib_lexbase.nim.o \
c_code/1_2/stdlib_parsejson.nim.o \
c_code/3_2/stdlib_json.nim.o \
c_code/4_2/extccomp.nim.o \
c_code/4_2/nimblecmd.nim.o \
c_code/2_2/stdlib_parseopt.nim.o \
c_code/3_2/commands.nim.o \
c_code/1_2/llstream.nim.o \
c_code/1_2/nimlexbase.nim.o \
c_code/3_2/lexer.nim.o \
c_code/2_2/nimconf.nim.o \
c_code/1_2/stdlib_intsets.nim.o \
c_code/1_2/idgen.nim.o \
c_code/1_2/ast.nim.o \
c_code/1_2/rodutils.nim.o \
c_code/2_2/astalgo.nim.o \
c_code/1_2/parser.nim.o \
c_code/1_2/renderer.nim.o \
c_code/1_2/filters.nim.o \
c_code/1_2/filter__tmpl.nim.o \
c_code/1_2/syntaxes.nim.o \
c_code/1_2/trees.nim.o \
c_code/3_2/types.nim.o \
c_code/1_2/treetab.nim.o \
c_code/1_2/incremental.nim.o \
c_code/1_2/btrees.nim.o \
c_code/1_2/stdlib_md5.nim.o \
c_code/1_2/modulegraphs.nim.o \
c_code/1_2/magicsys.nim.o \
c_code/1_2/bitsets.nim.o \
c_code/1_2/nimsets.nim.o \
c_code/3_2/semfold.nim.o \
c_code/3_2/modulepaths.nim.o \
c_code/1_2/reorder.nim.o \
c_code/1_2/passes.nim.o \
c_code/1_2/vmdef.nim.o \
c_code/1_2/semdata.nim.o \
c_code/1_2/linter.nim.o \
c_code/1_2/nimfix7prettybase.nim.o \
c_code/1_2/lookups.nim.o \
c_code/1_2/semtypinst.nim.o \
c_code/1_2/parampatterns.nim.o \
c_code/1_2/lowerings.nim.o \
c_code/1_2/_7lib7packages7docutils7rstast.nim.o \
c_code/1_2/_7lib7packages7docutils7rst.nim.o \
c_code/1_2/_7lib7packages7docutils7highlite.nim.o \
c_code/4_2/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_2/stdlib_xmltree.nim.o \
c_code/1_2/stdlib_uri.nim.o \
c_code/1_2/stdlib_cgi.nim.o \
c_code/1_2/typesrenderer.nim.o \
c_code/2_2/docgen.nim.o \
c_code/3_2/sigmatch.nim.o \
c_code/1_2/importer.nim.o \
c_code/1_2/procfind.nim.o \
c_code/3_2/pragmas.nim.o \
c_code/1_2/saturate.nim.o \
c_code/1_2/guards.nim.o \
c_code/1_2/sighashes.nim.o \
c_code/1_2/sempass2.nim.o \
c_code/1_2/cgmeth.nim.o \
c_code/1_2/aliases.nim.o \
c_code/1_2/patterns.nim.o \
c_code/1_2/dfa.nim.o \
c_code/1_2/injectdestructors.nim.o \
c_code/1_2/liftlocals.nim.o \
c_code/1_2/lambdalifting.nim.o \
c_code/1_2/closureiters.nim.o \
c_code/1_2/transf.nim.o \
c_code/1_2/vmgen.nim.o \
c_code/3_2/vmdeps.nim.o \
c_code/1_2/vmmarshal.nim.o \
c_code/3_2/gorgeimpl.nim.o \
c_code/1_2/macrocacheimpl.nim.o \
c_code/1_2/evaltempl.nim.o \
c_code/4_2/vm.nim.o \
c_code/1_2/semmacrosanity.nim.o \
c_code/1_2/pluginsupport.nim.o \
c_code/1_2/plugins7locals.nim.o \
c_code/1_2/plugins7itersgen.nim.o \
c_code/1_2/plugins7active.nim.o \
c_code/1_2/semparallel.nim.o \
c_code/3_2/sem.nim.o \
c_code/1_2/ccgutils.nim.o \
c_code/1_2/ndi.nim.o \
c_code/1_2/cgendata.nim.o \
c_code/1_2/ccgmerge.nim.o \
c_code/1_2/enumtostr.nim.o \
c_code/2_2/stdlib_dynlib.nim.o \
c_code/1_2/cgen.nim.o \
c_code/1_2/passaux.nim.o \
c_code/1_2/depends.nim.o \
c_code/1_2/modules.nim.o \
c_code/1_2/jsgen.nim.o \
c_code/3_2/docgen2.nim.o \
c_code/1_2/main.nim.o \
c_code/4_2/scriptconfig.nim.o \
c_code/3_2/cmdlinehelper.nim.o \
c_code/3_2/nim.nim.o $LINK_FLAGS
    ;;
  alpha)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  arm)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_assertions.nim.c -o c_code/1_1/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_dollars.nim.c -o c_code/1_1/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_io.nim.c -o c_code/3_1/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_6/stdlib_system.nim.c -o c_code/4_6/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.nim.c -o c_code/2_1/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.nim.c -o c_code/2_1/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_algorithm.nim.c -o c_code/1_1/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.nim.c -o c_code/2_1/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.nim.c -o c_code/2_1/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_pathnorm.nim.c -o c_code/2_1/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_posix.nim.c -o c_code/3_1/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_times.nim.c -o c_code/4_1/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_os.nim.c -o c_code/4_1/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_hashes.nim.c -o c_code/1_1/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strtabs.nim.c -o c_code/1_1/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_streams.nim.c -o c_code/3_1/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cpuinfo.nim.c -o c_code/2_1/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_osproc.nim.c -o c_code/4_1/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sets.nim.c -o c_code/1_1/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pathutils.nim.c -o c_code/2_1/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ropes.nim.c -o c_code/1_1/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_tables.nim.c -o c_code/1_1/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lineinfos.nim.c -o c_code/1_1/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_6/platform.nim.c -o c_code/4_6/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/prefixmatches.nim.c -o c_code/1_1/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strformat.nim.c -o c_code/2_1/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.nim.c -o c_code/2_1/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/options.nim.c -o c_code/4_1/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/msgs.nim.c -o c_code/3_1/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/wordrecg.nim.c -o c_code/1_1/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idents.nim.c -o c_code/1_1/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/condsyms.nim.c -o c_code/1_1/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_sha1.nim.c -o c_code/2_6/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.nim.c -o c_code/2_1/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parsejson.nim.c -o c_code/1_1/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_json.nim.c -o c_code/3_1/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/extccomp.nim.c -o c_code/4_1/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/nimblecmd.nim.c -o c_code/4_1/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.nim.c -o c_code/2_1/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/commands.nim.c -o c_code/3_1/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/llstream.nim.c -o c_code/1_1/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimlexbase.nim.c -o c_code/1_1/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/lexer.nim.c -o c_code/3_1/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimconf.nim.c -o c_code/2_1/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_intsets.nim.c -o c_code/1_1/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idgen.nim.c -o c_code/1_1/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ast.nim.c -o c_code/1_1/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/rodutils.nim.c -o c_code/1_1/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/astalgo.nim.c -o c_code/2_1/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parser.nim.c -o c_code/1_1/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/renderer.nim.c -o c_code/1_1/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filters.nim.c -o c_code/1_1/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filter__tmpl.nim.c -o c_code/1_1/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/syntaxes.nim.c -o c_code/1_1/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/trees.nim.c -o c_code/1_1/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/types.nim.c -o c_code/3_1/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/treetab.nim.c -o c_code/1_1/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/incremental.nim.c -o c_code/1_1/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/btrees.nim.c -o c_code/1_1/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_md5.nim.c -o c_code/1_1/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulegraphs.nim.c -o c_code/1_1/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/magicsys.nim.c -o c_code/1_1/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/bitsets.nim.c -o c_code/1_1/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimsets.nim.c -o c_code/1_1/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/semfold.nim.c -o c_code/3_1/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/modulepaths.nim.c -o c_code/3_1/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/reorder.nim.c -o c_code/1_1/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passes.nim.c -o c_code/1_1/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdef.nim.c -o c_code/1_1/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semdata.nim.c -o c_code/1_1/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/linter.nim.c -o c_code/1_1/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimfix7prettybase.nim.c -o c_code/1_1/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lookups.nim.c -o c_code/1_1/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semtypinst.nim.c -o c_code/1_1/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parampatterns.nim.c -o c_code/1_1/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lowerings.nim.c -o c_code/1_1/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rstast.nim.c -o c_code/1_1/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rst.nim.c -o c_code/1_1/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7highlite.nim.c -o c_code/1_1/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/_7lib7packages7docutils7rstgen.nim.c -o c_code/4_1/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_xmltree.nim.c -o c_code/1_1/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_uri.nim.c -o c_code/1_1/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cgi.nim.c -o c_code/1_1/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/typesrenderer.nim.c -o c_code/1_1/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docgen.nim.c -o c_code/2_1/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/sigmatch.nim.c -o c_code/3_1/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/importer.nim.c -o c_code/1_1/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/procfind.nim.c -o c_code/1_1/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/pragmas.nim.c -o c_code/3_1/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/saturate.nim.c -o c_code/1_1/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/guards.nim.c -o c_code/1_1/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sighashes.nim.c -o c_code/1_1/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sempass2.nim.c -o c_code/1_1/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgmeth.nim.c -o c_code/1_1/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/aliases.nim.c -o c_code/1_1/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/patterns.nim.c -o c_code/1_1/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/dfa.nim.c -o c_code/1_1/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/injectdestructors.nim.c -o c_code/1_1/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/liftlocals.nim.c -o c_code/1_1/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lambdalifting.nim.c -o c_code/1_1/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/closureiters.nim.c -o c_code/1_1/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/transf.nim.c -o c_code/1_1/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmgen.nim.c -o c_code/1_1/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/vmdeps.nim.c -o c_code/3_1/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmmarshal.nim.c -o c_code/1_1/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/gorgeimpl.nim.c -o c_code/3_1/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/macrocacheimpl.nim.c -o c_code/1_1/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/evaltempl.nim.c -o c_code/1_1/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_6/vm.nim.c -o c_code/4_6/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semmacrosanity.nim.c -o c_code/1_1/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/pluginsupport.nim.c -o c_code/1_1/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7locals.nim.c -o c_code/1_1/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7itersgen.nim.c -o c_code/1_1/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7active.nim.c -o c_code/1_1/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semparallel.nim.c -o c_code/1_1/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/sem.nim.c -o c_code/3_1/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgutils.nim.c -o c_code/1_1/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ndi.nim.c -o c_code/1_1/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgendata.nim.c -o c_code/1_1/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgmerge.nim.c -o c_code/1_1/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/enumtostr.nim.c -o c_code/1_1/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.nim.c -o c_code/2_1/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgen.nim.c -o c_code/1_1/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passaux.nim.c -o c_code/1_1/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/depends.nim.c -o c_code/1_1/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modules.nim.c -o c_code/1_1/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/jsgen.nim.c -o c_code/1_1/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/docgen2.nim.c -o c_code/3_1/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/main.nim.c -o c_code/1_1/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/scriptconfig.nim.c -o c_code/4_1/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/cmdlinehelper.nim.c -o c_code/3_1/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/nim.nim.c -o c_code/3_1/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_1/stdlib_assertions.nim.o \
c_code/1_1/stdlib_dollars.nim.o \
c_code/3_1/stdlib_io.nim.o \
c_code/4_6/stdlib_system.nim.o \
c_code/2_1/stdlib_parseutils.nim.o \
c_code/2_1/stdlib_math.nim.o \
c_code/1_1/stdlib_algorithm.nim.o \
c_code/2_1/stdlib_unicode.nim.o \
c_code/2_1/stdlib_strutils.nim.o \
c_code/2_1/stdlib_pathnorm.nim.o \
c_code/3_1/stdlib_posix.nim.o \
c_code/4_1/stdlib_times.nim.o \
c_code/4_1/stdlib_os.nim.o \
c_code/1_1/stdlib_hashes.nim.o \
c_code/1_1/stdlib_strtabs.nim.o \
c_code/3_1/stdlib_streams.nim.o \
c_code/2_1/stdlib_cpuinfo.nim.o \
c_code/4_1/stdlib_osproc.nim.o \
c_code/1_1/stdlib_sets.nim.o \
c_code/2_1/pathutils.nim.o \
c_code/1_1/ropes.nim.o \
c_code/1_1/stdlib_tables.nim.o \
c_code/1_1/lineinfos.nim.o \
c_code/4_6/platform.nim.o \
c_code/1_1/prefixmatches.nim.o \
c_code/2_1/stdlib_strformat.nim.o \
c_code/2_1/stdlib_terminal.nim.o \
c_code/4_1/options.nim.o \
c_code/3_1/msgs.nim.o \
c_code/1_1/wordrecg.nim.o \
c_code/1_1/idents.nim.o \
c_code/1_1/condsyms.nim.o \
c_code/2_6/stdlib_sha1.nim.o \
c_code/2_1/stdlib_lexbase.nim.o \
c_code/1_1/stdlib_parsejson.nim.o \
c_code/3_1/stdlib_json.nim.o \
c_code/4_1/extccomp.nim.o \
c_code/4_1/nimblecmd.nim.o \
c_code/2_1/stdlib_parseopt.nim.o \
c_code/3_1/commands.nim.o \
c_code/1_1/llstream.nim.o \
c_code/1_1/nimlexbase.nim.o \
c_code/3_1/lexer.nim.o \
c_code/2_1/nimconf.nim.o \
c_code/1_1/stdlib_intsets.nim.o \
c_code/1_1/idgen.nim.o \
c_code/1_1/ast.nim.o \
c_code/1_1/rodutils.nim.o \
c_code/2_1/astalgo.nim.o \
c_code/1_1/parser.nim.o \
c_code/1_1/renderer.nim.o \
c_code/1_1/filters.nim.o \
c_code/1_1/filter__tmpl.nim.o \
c_code/1_1/syntaxes.nim.o \
c_code/1_1/trees.nim.o \
c_code/3_1/types.nim.o \
c_code/1_1/treetab.nim.o \
c_code/1_1/incremental.nim.o \
c_code/1_1/btrees.nim.o \
c_code/1_1/stdlib_md5.nim.o \
c_code/1_1/modulegraphs.nim.o \
c_code/1_1/magicsys.nim.o \
c_code/1_1/bitsets.nim.o \
c_code/1_1/nimsets.nim.o \
c_code/3_1/semfold.nim.o \
c_code/3_1/modulepaths.nim.o \
c_code/1_1/reorder.nim.o \
c_code/1_1/passes.nim.o \
c_code/1_1/vmdef.nim.o \
c_code/1_1/semdata.nim.o \
c_code/1_1/linter.nim.o \
c_code/1_1/nimfix7prettybase.nim.o \
c_code/1_1/lookups.nim.o \
c_code/1_1/semtypinst.nim.o \
c_code/1_1/parampatterns.nim.o \
c_code/1_1/lowerings.nim.o \
c_code/1_1/_7lib7packages7docutils7rstast.nim.o \
c_code/1_1/_7lib7packages7docutils7rst.nim.o \
c_code/1_1/_7lib7packages7docutils7highlite.nim.o \
c_code/4_1/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_1/stdlib_xmltree.nim.o \
c_code/1_1/stdlib_uri.nim.o \
c_code/1_1/stdlib_cgi.nim.o \
c_code/1_1/typesrenderer.nim.o \
c_code/2_1/docgen.nim.o \
c_code/3_1/sigmatch.nim.o \
c_code/1_1/importer.nim.o \
c_code/1_1/procfind.nim.o \
c_code/3_1/pragmas.nim.o \
c_code/1_1/saturate.nim.o \
c_code/1_1/guards.nim.o \
c_code/1_1/sighashes.nim.o \
c_code/1_1/sempass2.nim.o \
c_code/1_1/cgmeth.nim.o \
c_code/1_1/aliases.nim.o \
c_code/1_1/patterns.nim.o \
c_code/1_1/dfa.nim.o \
c_code/1_1/injectdestructors.nim.o \
c_code/1_1/liftlocals.nim.o \
c_code/1_1/lambdalifting.nim.o \
c_code/1_1/closureiters.nim.o \
c_code/1_1/transf.nim.o \
c_code/1_1/vmgen.nim.o \
c_code/3_1/vmdeps.nim.o \
c_code/1_1/vmmarshal.nim.o \
c_code/3_1/gorgeimpl.nim.o \
c_code/1_1/macrocacheimpl.nim.o \
c_code/1_1/evaltempl.nim.o \
c_code/4_6/vm.nim.o \
c_code/1_1/semmacrosanity.nim.o \
c_code/1_1/pluginsupport.nim.o \
c_code/1_1/plugins7locals.nim.o \
c_code/1_1/plugins7itersgen.nim.o \
c_code/1_1/plugins7active.nim.o \
c_code/1_1/semparallel.nim.o \
c_code/3_1/sem.nim.o \
c_code/1_1/ccgutils.nim.o \
c_code/1_1/ndi.nim.o \
c_code/1_1/cgendata.nim.o \
c_code/1_1/ccgmerge.nim.o \
c_code/1_1/enumtostr.nim.o \
c_code/2_1/stdlib_dynlib.nim.o \
c_code/1_1/cgen.nim.o \
c_code/1_1/passaux.nim.o \
c_code/1_1/depends.nim.o \
c_code/1_1/modules.nim.o \
c_code/1_1/jsgen.nim.o \
c_code/3_1/docgen2.nim.o \
c_code/1_1/main.nim.o \
c_code/4_1/scriptconfig.nim.o \
c_code/3_1/cmdlinehelper.nim.o \
c_code/3_1/nim.nim.o $LINK_FLAGS
    ;;
  sparc64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_assertions.nim.c -o c_code/1_2/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_dollars.nim.c -o c_code/1_2/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_io.nim.c -o c_code/3_2/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_7/stdlib_system.nim.c -o c_code/4_7/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.nim.c -o c_code/2_2/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.nim.c -o c_code/2_2/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_algorithm.nim.c -o c_code/1_2/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.nim.c -o c_code/2_2/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.nim.c -o c_code/2_2/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_pathnorm.nim.c -o c_code/2_2/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_posix.nim.c -o c_code/3_2/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_times.nim.c -o c_code/4_2/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_os.nim.c -o c_code/4_2/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_hashes.nim.c -o c_code/1_2/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strtabs.nim.c -o c_code/1_2/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_streams.nim.c -o c_code/3_2/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_cpuinfo.nim.c -o c_code/2_3/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_osproc.nim.c -o c_code/4_2/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sets.nim.c -o c_code/1_2/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/pathutils.nim.c -o c_code/2_2/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ropes.nim.c -o c_code/1_2/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_tables.nim.c -o c_code/1_2/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lineinfos.nim.c -o c_code/1_2/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_7/platform.nim.c -o c_code/4_7/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/prefixmatches.nim.c -o c_code/1_2/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strformat.nim.c -o c_code/2_2/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.nim.c -o c_code/2_2/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/options.nim.c -o c_code/4_2/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/msgs.nim.c -o c_code/3_2/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/wordrecg.nim.c -o c_code/1_2/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idents.nim.c -o c_code/1_2/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/condsyms.nim.c -o c_code/1_2/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_sha1.nim.c -o c_code/2_4/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.nim.c -o c_code/2_2/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parsejson.nim.c -o c_code/1_2/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_json.nim.c -o c_code/3_2/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/extccomp.nim.c -o c_code/4_2/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/nimblecmd.nim.c -o c_code/4_2/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.nim.c -o c_code/2_2/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/commands.nim.c -o c_code/3_2/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/llstream.nim.c -o c_code/1_2/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimlexbase.nim.c -o c_code/1_2/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/lexer.nim.c -o c_code/3_2/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimconf.nim.c -o c_code/2_2/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_intsets.nim.c -o c_code/1_2/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idgen.nim.c -o c_code/1_2/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ast.nim.c -o c_code/1_2/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/rodutils.nim.c -o c_code/1_2/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/astalgo.nim.c -o c_code/2_2/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parser.nim.c -o c_code/1_2/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/renderer.nim.c -o c_code/1_2/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filters.nim.c -o c_code/1_2/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filter__tmpl.nim.c -o c_code/1_2/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/syntaxes.nim.c -o c_code/1_2/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/trees.nim.c -o c_code/1_2/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/types.nim.c -o c_code/3_2/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/treetab.nim.c -o c_code/1_2/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/incremental.nim.c -o c_code/1_2/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/btrees.nim.c -o c_code/1_2/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_md5.nim.c -o c_code/1_2/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulegraphs.nim.c -o c_code/1_2/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/magicsys.nim.c -o c_code/1_2/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/bitsets.nim.c -o c_code/1_2/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimsets.nim.c -o c_code/1_2/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/semfold.nim.c -o c_code/3_2/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/modulepaths.nim.c -o c_code/3_2/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/reorder.nim.c -o c_code/1_2/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passes.nim.c -o c_code/1_2/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdef.nim.c -o c_code/1_2/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semdata.nim.c -o c_code/1_2/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/linter.nim.c -o c_code/1_2/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimfix7prettybase.nim.c -o c_code/1_2/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lookups.nim.c -o c_code/1_2/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semtypinst.nim.c -o c_code/1_2/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parampatterns.nim.c -o c_code/1_2/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lowerings.nim.c -o c_code/1_2/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rstast.nim.c -o c_code/1_2/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rst.nim.c -o c_code/1_2/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7highlite.nim.c -o c_code/1_2/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/_7lib7packages7docutils7rstgen.nim.c -o c_code/4_2/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_xmltree.nim.c -o c_code/1_2/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_uri.nim.c -o c_code/1_2/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cgi.nim.c -o c_code/1_2/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/typesrenderer.nim.c -o c_code/1_2/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docgen.nim.c -o c_code/2_2/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/sigmatch.nim.c -o c_code/3_2/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/importer.nim.c -o c_code/1_2/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/procfind.nim.c -o c_code/1_2/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/pragmas.nim.c -o c_code/3_2/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/saturate.nim.c -o c_code/1_2/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/guards.nim.c -o c_code/1_2/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sighashes.nim.c -o c_code/1_2/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sempass2.nim.c -o c_code/1_2/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgmeth.nim.c -o c_code/1_2/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/aliases.nim.c -o c_code/1_2/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/patterns.nim.c -o c_code/1_2/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/dfa.nim.c -o c_code/1_2/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/injectdestructors.nim.c -o c_code/1_2/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/liftlocals.nim.c -o c_code/1_2/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lambdalifting.nim.c -o c_code/1_2/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/closureiters.nim.c -o c_code/1_2/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/transf.nim.c -o c_code/1_2/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmgen.nim.c -o c_code/1_2/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/vmdeps.nim.c -o c_code/3_2/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmmarshal.nim.c -o c_code/1_2/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/gorgeimpl.nim.c -o c_code/3_2/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/macrocacheimpl.nim.c -o c_code/1_2/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/evaltempl.nim.c -o c_code/1_2/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_7/vm.nim.c -o c_code/4_7/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semmacrosanity.nim.c -o c_code/1_2/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/pluginsupport.nim.c -o c_code/1_2/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7locals.nim.c -o c_code/1_2/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7itersgen.nim.c -o c_code/1_2/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7active.nim.c -o c_code/1_2/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semparallel.nim.c -o c_code/1_2/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/sem.nim.c -o c_code/3_2/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgutils.nim.c -o c_code/1_2/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ndi.nim.c -o c_code/1_2/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgendata.nim.c -o c_code/1_2/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgmerge.nim.c -o c_code/1_2/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/enumtostr.nim.c -o c_code/1_2/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.nim.c -o c_code/2_2/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgen.nim.c -o c_code/1_2/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passaux.nim.c -o c_code/1_2/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/depends.nim.c -o c_code/1_2/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modules.nim.c -o c_code/1_2/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/jsgen.nim.c -o c_code/1_2/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/docgen2.nim.c -o c_code/3_2/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/main.nim.c -o c_code/1_2/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/scriptconfig.nim.c -o c_code/4_2/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/cmdlinehelper.nim.c -o c_code/3_2/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/nim.nim.c -o c_code/3_2/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_2/stdlib_assertions.nim.o \
c_code/1_2/stdlib_dollars.nim.o \
c_code/3_2/stdlib_io.nim.o \
c_code/4_7/stdlib_system.nim.o \
c_code/2_2/stdlib_parseutils.nim.o \
c_code/2_2/stdlib_math.nim.o \
c_code/1_2/stdlib_algorithm.nim.o \
c_code/2_2/stdlib_unicode.nim.o \
c_code/2_2/stdlib_strutils.nim.o \
c_code/2_2/stdlib_pathnorm.nim.o \
c_code/3_2/stdlib_posix.nim.o \
c_code/4_2/stdlib_times.nim.o \
c_code/4_2/stdlib_os.nim.o \
c_code/1_2/stdlib_hashes.nim.o \
c_code/1_2/stdlib_strtabs.nim.o \
c_code/3_2/stdlib_streams.nim.o \
c_code/2_3/stdlib_cpuinfo.nim.o \
c_code/4_2/stdlib_osproc.nim.o \
c_code/1_2/stdlib_sets.nim.o \
c_code/2_2/pathutils.nim.o \
c_code/1_2/ropes.nim.o \
c_code/1_2/stdlib_tables.nim.o \
c_code/1_2/lineinfos.nim.o \
c_code/4_7/platform.nim.o \
c_code/1_2/prefixmatches.nim.o \
c_code/2_2/stdlib_strformat.nim.o \
c_code/2_2/stdlib_terminal.nim.o \
c_code/4_2/options.nim.o \
c_code/3_2/msgs.nim.o \
c_code/1_2/wordrecg.nim.o \
c_code/1_2/idents.nim.o \
c_code/1_2/condsyms.nim.o \
c_code/2_4/stdlib_sha1.nim.o \
c_code/2_2/stdlib_lexbase.nim.o \
c_code/1_2/stdlib_parsejson.nim.o \
c_code/3_2/stdlib_json.nim.o \
c_code/4_2/extccomp.nim.o \
c_code/4_2/nimblecmd.nim.o \
c_code/2_2/stdlib_parseopt.nim.o \
c_code/3_2/commands.nim.o \
c_code/1_2/llstream.nim.o \
c_code/1_2/nimlexbase.nim.o \
c_code/3_2/lexer.nim.o \
c_code/2_2/nimconf.nim.o \
c_code/1_2/stdlib_intsets.nim.o \
c_code/1_2/idgen.nim.o \
c_code/1_2/ast.nim.o \
c_code/1_2/rodutils.nim.o \
c_code/2_2/astalgo.nim.o \
c_code/1_2/parser.nim.o \
c_code/1_2/renderer.nim.o \
c_code/1_2/filters.nim.o \
c_code/1_2/filter__tmpl.nim.o \
c_code/1_2/syntaxes.nim.o \
c_code/1_2/trees.nim.o \
c_code/3_2/types.nim.o \
c_code/1_2/treetab.nim.o \
c_code/1_2/incremental.nim.o \
c_code/1_2/btrees.nim.o \
c_code/1_2/stdlib_md5.nim.o \
c_code/1_2/modulegraphs.nim.o \
c_code/1_2/magicsys.nim.o \
c_code/1_2/bitsets.nim.o \
c_code/1_2/nimsets.nim.o \
c_code/3_2/semfold.nim.o \
c_code/3_2/modulepaths.nim.o \
c_code/1_2/reorder.nim.o \
c_code/1_2/passes.nim.o \
c_code/1_2/vmdef.nim.o \
c_code/1_2/semdata.nim.o \
c_code/1_2/linter.nim.o \
c_code/1_2/nimfix7prettybase.nim.o \
c_code/1_2/lookups.nim.o \
c_code/1_2/semtypinst.nim.o \
c_code/1_2/parampatterns.nim.o \
c_code/1_2/lowerings.nim.o \
c_code/1_2/_7lib7packages7docutils7rstast.nim.o \
c_code/1_2/_7lib7packages7docutils7rst.nim.o \
c_code/1_2/_7lib7packages7docutils7highlite.nim.o \
c_code/4_2/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_2/stdlib_xmltree.nim.o \
c_code/1_2/stdlib_uri.nim.o \
c_code/1_2/stdlib_cgi.nim.o \
c_code/1_2/typesrenderer.nim.o \
c_code/2_2/docgen.nim.o \
c_code/3_2/sigmatch.nim.o \
c_code/1_2/importer.nim.o \
c_code/1_2/procfind.nim.o \
c_code/3_2/pragmas.nim.o \
c_code/1_2/saturate.nim.o \
c_code/1_2/guards.nim.o \
c_code/1_2/sighashes.nim.o \
c_code/1_2/sempass2.nim.o \
c_code/1_2/cgmeth.nim.o \
c_code/1_2/aliases.nim.o \
c_code/1_2/patterns.nim.o \
c_code/1_2/dfa.nim.o \
c_code/1_2/injectdestructors.nim.o \
c_code/1_2/liftlocals.nim.o \
c_code/1_2/lambdalifting.nim.o \
c_code/1_2/closureiters.nim.o \
c_code/1_2/transf.nim.o \
c_code/1_2/vmgen.nim.o \
c_code/3_2/vmdeps.nim.o \
c_code/1_2/vmmarshal.nim.o \
c_code/3_2/gorgeimpl.nim.o \
c_code/1_2/macrocacheimpl.nim.o \
c_code/1_2/evaltempl.nim.o \
c_code/4_7/vm.nim.o \
c_code/1_2/semmacrosanity.nim.o \
c_code/1_2/pluginsupport.nim.o \
c_code/1_2/plugins7locals.nim.o \
c_code/1_2/plugins7itersgen.nim.o \
c_code/1_2/plugins7active.nim.o \
c_code/1_2/semparallel.nim.o \
c_code/3_2/sem.nim.o \
c_code/1_2/ccgutils.nim.o \
c_code/1_2/ndi.nim.o \
c_code/1_2/cgendata.nim.o \
c_code/1_2/ccgmerge.nim.o \
c_code/1_2/enumtostr.nim.o \
c_code/2_2/stdlib_dynlib.nim.o \
c_code/1_2/cgen.nim.o \
c_code/1_2/passaux.nim.o \
c_code/1_2/depends.nim.o \
c_code/1_2/modules.nim.o \
c_code/1_2/jsgen.nim.o \
c_code/3_2/docgen2.nim.o \
c_code/1_2/main.nim.o \
c_code/4_2/scriptconfig.nim.o \
c_code/3_2/cmdlinehelper.nim.o \
c_code/3_2/nim.nim.o $LINK_FLAGS
    ;;
  m68k)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mipsel)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips64el)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc64el)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  arm64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  riscv64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
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
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_assertions.nim.c -o c_code/1_1/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_dollars.nim.c -o c_code/1_1/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_io.nim.c -o c_code/3_1/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_system.nim.c -o c_code/5_1/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.nim.c -o c_code/2_1/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.nim.c -o c_code/2_1/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_algorithm.nim.c -o c_code/1_1/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.nim.c -o c_code/2_1/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.nim.c -o c_code/2_1/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_pathnorm.nim.c -o c_code/2_1/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_posix.nim.c -o c_code/3_1/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_times.nim.c -o c_code/5_1/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_os.nim.c -o c_code/5_1/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_hashes.nim.c -o c_code/1_1/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strtabs.nim.c -o c_code/1_1/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_streams.nim.c -o c_code/3_1/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_cpuinfo.nim.c -o c_code/3_1/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_osproc.nim.c -o c_code/5_1/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sets.nim.c -o c_code/1_1/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pathutils.nim.c -o c_code/2_1/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ropes.nim.c -o c_code/1_1/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_tables.nim.c -o c_code/1_1/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lineinfos.nim.c -o c_code/1_1/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/platform.nim.c -o c_code/5_1/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/prefixmatches.nim.c -o c_code/1_1/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strformat.nim.c -o c_code/2_1/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.nim.c -o c_code/2_1/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/options.nim.c -o c_code/4_1/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/msgs.nim.c -o c_code/3_1/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/wordrecg.nim.c -o c_code/1_1/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idents.nim.c -o c_code/1_1/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/condsyms.nim.c -o c_code/1_1/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sha1.nim.c -o c_code/1_1/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.nim.c -o c_code/2_1/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parsejson.nim.c -o c_code/1_1/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_json.nim.c -o c_code/3_1/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/extccomp.nim.c -o c_code/4_1/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/nimblecmd.nim.c -o c_code/3_1/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.nim.c -o c_code/2_1/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/commands.nim.c -o c_code/3_1/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/llstream.nim.c -o c_code/1_1/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimlexbase.nim.c -o c_code/1_1/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/lexer.nim.c -o c_code/3_1/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimconf.nim.c -o c_code/2_1/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_intsets.nim.c -o c_code/1_1/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idgen.nim.c -o c_code/1_1/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ast.nim.c -o c_code/1_1/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/rodutils.nim.c -o c_code/1_1/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/astalgo.nim.c -o c_code/2_1/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parser.nim.c -o c_code/1_1/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/renderer.nim.c -o c_code/1_1/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filters.nim.c -o c_code/1_1/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filter__tmpl.nim.c -o c_code/1_1/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/syntaxes.nim.c -o c_code/1_1/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/trees.nim.c -o c_code/1_1/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/types.nim.c -o c_code/3_1/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/treetab.nim.c -o c_code/1_1/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/incremental.nim.c -o c_code/1_1/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/btrees.nim.c -o c_code/1_1/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_md5.nim.c -o c_code/1_1/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulegraphs.nim.c -o c_code/1_1/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/magicsys.nim.c -o c_code/1_1/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/bitsets.nim.c -o c_code/1_1/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimsets.nim.c -o c_code/1_1/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/semfold.nim.c -o c_code/3_1/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/modulepaths.nim.c -o c_code/3_1/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/reorder.nim.c -o c_code/1_1/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passes.nim.c -o c_code/1_1/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdef.nim.c -o c_code/1_1/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semdata.nim.c -o c_code/1_1/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/linter.nim.c -o c_code/1_1/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimfix7prettybase.nim.c -o c_code/1_1/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lookups.nim.c -o c_code/1_1/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semtypinst.nim.c -o c_code/1_1/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parampatterns.nim.c -o c_code/1_1/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lowerings.nim.c -o c_code/1_1/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rstast.nim.c -o c_code/1_1/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rst.nim.c -o c_code/1_1/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7highlite.nim.c -o c_code/1_1/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/_7lib7packages7docutils7rstgen.nim.c -o c_code/3_1/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_xmltree.nim.c -o c_code/1_1/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_uri.nim.c -o c_code/1_1/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cgi.nim.c -o c_code/1_1/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/typesrenderer.nim.c -o c_code/1_1/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docgen.nim.c -o c_code/2_1/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/sigmatch.nim.c -o c_code/3_1/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/importer.nim.c -o c_code/1_1/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/procfind.nim.c -o c_code/1_1/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/pragmas.nim.c -o c_code/3_1/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/saturate.nim.c -o c_code/1_1/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/guards.nim.c -o c_code/1_1/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sighashes.nim.c -o c_code/1_1/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sempass2.nim.c -o c_code/1_1/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgmeth.nim.c -o c_code/1_1/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/aliases.nim.c -o c_code/1_1/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/patterns.nim.c -o c_code/1_1/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/dfa.nim.c -o c_code/1_1/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/injectdestructors.nim.c -o c_code/1_1/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/liftlocals.nim.c -o c_code/1_1/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lambdalifting.nim.c -o c_code/1_1/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/closureiters.nim.c -o c_code/1_1/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/transf.nim.c -o c_code/1_1/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmgen.nim.c -o c_code/1_1/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/vmdeps.nim.c -o c_code/3_1/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmmarshal.nim.c -o c_code/1_1/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/gorgeimpl.nim.c -o c_code/3_1/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/macrocacheimpl.nim.c -o c_code/1_1/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/evaltempl.nim.c -o c_code/1_1/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/vm.nim.c -o c_code/3_1/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semmacrosanity.nim.c -o c_code/1_1/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/pluginsupport.nim.c -o c_code/1_1/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7locals.nim.c -o c_code/1_1/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7itersgen.nim.c -o c_code/1_1/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7active.nim.c -o c_code/1_1/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semparallel.nim.c -o c_code/1_1/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/sem.nim.c -o c_code/3_1/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgutils.nim.c -o c_code/1_1/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ndi.nim.c -o c_code/1_1/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgendata.nim.c -o c_code/1_1/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgmerge.nim.c -o c_code/1_1/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/enumtostr.nim.c -o c_code/1_1/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.nim.c -o c_code/2_1/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgen.nim.c -o c_code/1_1/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passaux.nim.c -o c_code/1_1/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/depends.nim.c -o c_code/1_1/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modules.nim.c -o c_code/1_1/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/jsgen.nim.c -o c_code/1_1/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/docgen2.nim.c -o c_code/3_1/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/main.nim.c -o c_code/1_1/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/scriptconfig.nim.c -o c_code/3_1/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/cmdlinehelper.nim.c -o c_code/3_1/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/nim.nim.c -o c_code/3_1/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_1/stdlib_assertions.nim.o \
c_code/1_1/stdlib_dollars.nim.o \
c_code/3_1/stdlib_io.nim.o \
c_code/5_1/stdlib_system.nim.o \
c_code/2_1/stdlib_parseutils.nim.o \
c_code/2_1/stdlib_math.nim.o \
c_code/1_1/stdlib_algorithm.nim.o \
c_code/2_1/stdlib_unicode.nim.o \
c_code/2_1/stdlib_strutils.nim.o \
c_code/2_1/stdlib_pathnorm.nim.o \
c_code/3_1/stdlib_posix.nim.o \
c_code/5_1/stdlib_times.nim.o \
c_code/5_1/stdlib_os.nim.o \
c_code/1_1/stdlib_hashes.nim.o \
c_code/1_1/stdlib_strtabs.nim.o \
c_code/3_1/stdlib_streams.nim.o \
c_code/3_1/stdlib_cpuinfo.nim.o \
c_code/5_1/stdlib_osproc.nim.o \
c_code/1_1/stdlib_sets.nim.o \
c_code/2_1/pathutils.nim.o \
c_code/1_1/ropes.nim.o \
c_code/1_1/stdlib_tables.nim.o \
c_code/1_1/lineinfos.nim.o \
c_code/5_1/platform.nim.o \
c_code/1_1/prefixmatches.nim.o \
c_code/2_1/stdlib_strformat.nim.o \
c_code/2_1/stdlib_terminal.nim.o \
c_code/4_1/options.nim.o \
c_code/3_1/msgs.nim.o \
c_code/1_1/wordrecg.nim.o \
c_code/1_1/idents.nim.o \
c_code/1_1/condsyms.nim.o \
c_code/1_1/stdlib_sha1.nim.o \
c_code/2_1/stdlib_lexbase.nim.o \
c_code/1_1/stdlib_parsejson.nim.o \
c_code/3_1/stdlib_json.nim.o \
c_code/4_1/extccomp.nim.o \
c_code/3_1/nimblecmd.nim.o \
c_code/2_1/stdlib_parseopt.nim.o \
c_code/3_1/commands.nim.o \
c_code/1_1/llstream.nim.o \
c_code/1_1/nimlexbase.nim.o \
c_code/3_1/lexer.nim.o \
c_code/2_1/nimconf.nim.o \
c_code/1_1/stdlib_intsets.nim.o \
c_code/1_1/idgen.nim.o \
c_code/1_1/ast.nim.o \
c_code/1_1/rodutils.nim.o \
c_code/2_1/astalgo.nim.o \
c_code/1_1/parser.nim.o \
c_code/1_1/renderer.nim.o \
c_code/1_1/filters.nim.o \
c_code/1_1/filter__tmpl.nim.o \
c_code/1_1/syntaxes.nim.o \
c_code/1_1/trees.nim.o \
c_code/3_1/types.nim.o \
c_code/1_1/treetab.nim.o \
c_code/1_1/incremental.nim.o \
c_code/1_1/btrees.nim.o \
c_code/1_1/stdlib_md5.nim.o \
c_code/1_1/modulegraphs.nim.o \
c_code/1_1/magicsys.nim.o \
c_code/1_1/bitsets.nim.o \
c_code/1_1/nimsets.nim.o \
c_code/3_1/semfold.nim.o \
c_code/3_1/modulepaths.nim.o \
c_code/1_1/reorder.nim.o \
c_code/1_1/passes.nim.o \
c_code/1_1/vmdef.nim.o \
c_code/1_1/semdata.nim.o \
c_code/1_1/linter.nim.o \
c_code/1_1/nimfix7prettybase.nim.o \
c_code/1_1/lookups.nim.o \
c_code/1_1/semtypinst.nim.o \
c_code/1_1/parampatterns.nim.o \
c_code/1_1/lowerings.nim.o \
c_code/1_1/_7lib7packages7docutils7rstast.nim.o \
c_code/1_1/_7lib7packages7docutils7rst.nim.o \
c_code/1_1/_7lib7packages7docutils7highlite.nim.o \
c_code/3_1/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_1/stdlib_xmltree.nim.o \
c_code/1_1/stdlib_uri.nim.o \
c_code/1_1/stdlib_cgi.nim.o \
c_code/1_1/typesrenderer.nim.o \
c_code/2_1/docgen.nim.o \
c_code/3_1/sigmatch.nim.o \
c_code/1_1/importer.nim.o \
c_code/1_1/procfind.nim.o \
c_code/3_1/pragmas.nim.o \
c_code/1_1/saturate.nim.o \
c_code/1_1/guards.nim.o \
c_code/1_1/sighashes.nim.o \
c_code/1_1/sempass2.nim.o \
c_code/1_1/cgmeth.nim.o \
c_code/1_1/aliases.nim.o \
c_code/1_1/patterns.nim.o \
c_code/1_1/dfa.nim.o \
c_code/1_1/injectdestructors.nim.o \
c_code/1_1/liftlocals.nim.o \
c_code/1_1/lambdalifting.nim.o \
c_code/1_1/closureiters.nim.o \
c_code/1_1/transf.nim.o \
c_code/1_1/vmgen.nim.o \
c_code/3_1/vmdeps.nim.o \
c_code/1_1/vmmarshal.nim.o \
c_code/3_1/gorgeimpl.nim.o \
c_code/1_1/macrocacheimpl.nim.o \
c_code/1_1/evaltempl.nim.o \
c_code/3_1/vm.nim.o \
c_code/1_1/semmacrosanity.nim.o \
c_code/1_1/pluginsupport.nim.o \
c_code/1_1/plugins7locals.nim.o \
c_code/1_1/plugins7itersgen.nim.o \
c_code/1_1/plugins7active.nim.o \
c_code/1_1/semparallel.nim.o \
c_code/3_1/sem.nim.o \
c_code/1_1/ccgutils.nim.o \
c_code/1_1/ndi.nim.o \
c_code/1_1/cgendata.nim.o \
c_code/1_1/ccgmerge.nim.o \
c_code/1_1/enumtostr.nim.o \
c_code/2_1/stdlib_dynlib.nim.o \
c_code/1_1/cgen.nim.o \
c_code/1_1/passaux.nim.o \
c_code/1_1/depends.nim.o \
c_code/1_1/modules.nim.o \
c_code/1_1/jsgen.nim.o \
c_code/3_1/docgen2.nim.o \
c_code/1_1/main.nim.o \
c_code/3_1/scriptconfig.nim.o \
c_code/3_1/cmdlinehelper.nim.o \
c_code/3_1/nim.nim.o $LINK_FLAGS
    ;;
  amd64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_assertions.nim.c -o c_code/1_2/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_dollars.nim.c -o c_code/1_2/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_io.nim.c -o c_code/3_2/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_system.nim.c -o c_code/5_2/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.nim.c -o c_code/2_2/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.nim.c -o c_code/2_2/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_algorithm.nim.c -o c_code/1_2/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.nim.c -o c_code/2_2/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.nim.c -o c_code/2_2/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_pathnorm.nim.c -o c_code/2_2/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_posix.nim.c -o c_code/3_2/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_times.nim.c -o c_code/5_2/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_os.nim.c -o c_code/5_2/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_hashes.nim.c -o c_code/1_2/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strtabs.nim.c -o c_code/1_2/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_streams.nim.c -o c_code/3_2/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_cpuinfo.nim.c -o c_code/3_2/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_osproc.nim.c -o c_code/5_2/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sets.nim.c -o c_code/1_2/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/pathutils.nim.c -o c_code/2_2/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ropes.nim.c -o c_code/1_2/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_tables.nim.c -o c_code/1_2/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lineinfos.nim.c -o c_code/1_2/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/platform.nim.c -o c_code/5_2/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/prefixmatches.nim.c -o c_code/1_2/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strformat.nim.c -o c_code/2_2/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.nim.c -o c_code/2_2/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/options.nim.c -o c_code/5_2/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/msgs.nim.c -o c_code/3_2/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/wordrecg.nim.c -o c_code/1_2/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idents.nim.c -o c_code/1_2/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/condsyms.nim.c -o c_code/1_2/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sha1.nim.c -o c_code/1_2/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.nim.c -o c_code/2_2/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parsejson.nim.c -o c_code/1_2/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_json.nim.c -o c_code/3_2/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/extccomp.nim.c -o c_code/5_2/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/nimblecmd.nim.c -o c_code/5_2/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.nim.c -o c_code/2_2/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/commands.nim.c -o c_code/3_2/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/llstream.nim.c -o c_code/1_2/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimlexbase.nim.c -o c_code/1_2/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/lexer.nim.c -o c_code/3_2/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimconf.nim.c -o c_code/2_2/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_intsets.nim.c -o c_code/1_2/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idgen.nim.c -o c_code/1_2/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ast.nim.c -o c_code/1_2/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/rodutils.nim.c -o c_code/1_2/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/astalgo.nim.c -o c_code/2_2/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parser.nim.c -o c_code/1_2/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/renderer.nim.c -o c_code/1_2/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filters.nim.c -o c_code/1_2/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filter__tmpl.nim.c -o c_code/1_2/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/syntaxes.nim.c -o c_code/1_2/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/trees.nim.c -o c_code/1_2/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/types.nim.c -o c_code/3_2/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/treetab.nim.c -o c_code/1_2/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/incremental.nim.c -o c_code/1_2/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/btrees.nim.c -o c_code/1_2/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_md5.nim.c -o c_code/1_2/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulegraphs.nim.c -o c_code/1_2/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/magicsys.nim.c -o c_code/1_2/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/bitsets.nim.c -o c_code/1_2/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimsets.nim.c -o c_code/1_2/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/semfold.nim.c -o c_code/3_2/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/modulepaths.nim.c -o c_code/3_2/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/reorder.nim.c -o c_code/1_2/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passes.nim.c -o c_code/1_2/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdef.nim.c -o c_code/1_2/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semdata.nim.c -o c_code/1_2/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/linter.nim.c -o c_code/1_2/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimfix7prettybase.nim.c -o c_code/1_2/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lookups.nim.c -o c_code/1_2/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semtypinst.nim.c -o c_code/1_2/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parampatterns.nim.c -o c_code/1_2/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lowerings.nim.c -o c_code/1_2/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rstast.nim.c -o c_code/1_2/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rst.nim.c -o c_code/1_2/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7highlite.nim.c -o c_code/1_2/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/_7lib7packages7docutils7rstgen.nim.c -o c_code/3_2/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_xmltree.nim.c -o c_code/1_2/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_uri.nim.c -o c_code/1_2/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cgi.nim.c -o c_code/1_2/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/typesrenderer.nim.c -o c_code/1_2/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docgen.nim.c -o c_code/2_2/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/sigmatch.nim.c -o c_code/3_2/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/importer.nim.c -o c_code/1_2/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/procfind.nim.c -o c_code/1_2/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/pragmas.nim.c -o c_code/5_2/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/saturate.nim.c -o c_code/1_2/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/guards.nim.c -o c_code/1_2/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sighashes.nim.c -o c_code/1_2/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sempass2.nim.c -o c_code/1_2/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgmeth.nim.c -o c_code/1_2/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/aliases.nim.c -o c_code/1_2/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/patterns.nim.c -o c_code/1_2/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/dfa.nim.c -o c_code/1_2/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/injectdestructors.nim.c -o c_code/1_2/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/liftlocals.nim.c -o c_code/1_2/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lambdalifting.nim.c -o c_code/1_2/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/closureiters.nim.c -o c_code/1_2/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/transf.nim.c -o c_code/1_2/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmgen.nim.c -o c_code/1_2/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/vmdeps.nim.c -o c_code/3_2/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmmarshal.nim.c -o c_code/1_2/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/gorgeimpl.nim.c -o c_code/3_2/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/macrocacheimpl.nim.c -o c_code/1_2/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/evaltempl.nim.c -o c_code/1_2/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/vm.nim.c -o c_code/3_2/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semmacrosanity.nim.c -o c_code/1_2/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/pluginsupport.nim.c -o c_code/1_2/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7locals.nim.c -o c_code/1_2/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7itersgen.nim.c -o c_code/1_2/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7active.nim.c -o c_code/1_2/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semparallel.nim.c -o c_code/1_2/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/sem.nim.c -o c_code/3_2/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgutils.nim.c -o c_code/1_2/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ndi.nim.c -o c_code/1_2/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgendata.nim.c -o c_code/1_2/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgmerge.nim.c -o c_code/1_2/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/enumtostr.nim.c -o c_code/1_2/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.nim.c -o c_code/2_2/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgen.nim.c -o c_code/1_2/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passaux.nim.c -o c_code/1_2/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/depends.nim.c -o c_code/1_2/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modules.nim.c -o c_code/1_2/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/jsgen.nim.c -o c_code/1_2/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/docgen2.nim.c -o c_code/3_2/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/main.nim.c -o c_code/1_2/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/scriptconfig.nim.c -o c_code/3_2/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/cmdlinehelper.nim.c -o c_code/3_2/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/nim.nim.c -o c_code/3_2/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_2/stdlib_assertions.nim.o \
c_code/1_2/stdlib_dollars.nim.o \
c_code/3_2/stdlib_io.nim.o \
c_code/5_2/stdlib_system.nim.o \
c_code/2_2/stdlib_parseutils.nim.o \
c_code/2_2/stdlib_math.nim.o \
c_code/1_2/stdlib_algorithm.nim.o \
c_code/2_2/stdlib_unicode.nim.o \
c_code/2_2/stdlib_strutils.nim.o \
c_code/2_2/stdlib_pathnorm.nim.o \
c_code/3_2/stdlib_posix.nim.o \
c_code/5_2/stdlib_times.nim.o \
c_code/5_2/stdlib_os.nim.o \
c_code/1_2/stdlib_hashes.nim.o \
c_code/1_2/stdlib_strtabs.nim.o \
c_code/3_2/stdlib_streams.nim.o \
c_code/3_2/stdlib_cpuinfo.nim.o \
c_code/5_2/stdlib_osproc.nim.o \
c_code/1_2/stdlib_sets.nim.o \
c_code/2_2/pathutils.nim.o \
c_code/1_2/ropes.nim.o \
c_code/1_2/stdlib_tables.nim.o \
c_code/1_2/lineinfos.nim.o \
c_code/5_2/platform.nim.o \
c_code/1_2/prefixmatches.nim.o \
c_code/2_2/stdlib_strformat.nim.o \
c_code/2_2/stdlib_terminal.nim.o \
c_code/5_2/options.nim.o \
c_code/3_2/msgs.nim.o \
c_code/1_2/wordrecg.nim.o \
c_code/1_2/idents.nim.o \
c_code/1_2/condsyms.nim.o \
c_code/1_2/stdlib_sha1.nim.o \
c_code/2_2/stdlib_lexbase.nim.o \
c_code/1_2/stdlib_parsejson.nim.o \
c_code/3_2/stdlib_json.nim.o \
c_code/5_2/extccomp.nim.o \
c_code/5_2/nimblecmd.nim.o \
c_code/2_2/stdlib_parseopt.nim.o \
c_code/3_2/commands.nim.o \
c_code/1_2/llstream.nim.o \
c_code/1_2/nimlexbase.nim.o \
c_code/3_2/lexer.nim.o \
c_code/2_2/nimconf.nim.o \
c_code/1_2/stdlib_intsets.nim.o \
c_code/1_2/idgen.nim.o \
c_code/1_2/ast.nim.o \
c_code/1_2/rodutils.nim.o \
c_code/2_2/astalgo.nim.o \
c_code/1_2/parser.nim.o \
c_code/1_2/renderer.nim.o \
c_code/1_2/filters.nim.o \
c_code/1_2/filter__tmpl.nim.o \
c_code/1_2/syntaxes.nim.o \
c_code/1_2/trees.nim.o \
c_code/3_2/types.nim.o \
c_code/1_2/treetab.nim.o \
c_code/1_2/incremental.nim.o \
c_code/1_2/btrees.nim.o \
c_code/1_2/stdlib_md5.nim.o \
c_code/1_2/modulegraphs.nim.o \
c_code/1_2/magicsys.nim.o \
c_code/1_2/bitsets.nim.o \
c_code/1_2/nimsets.nim.o \
c_code/3_2/semfold.nim.o \
c_code/3_2/modulepaths.nim.o \
c_code/1_2/reorder.nim.o \
c_code/1_2/passes.nim.o \
c_code/1_2/vmdef.nim.o \
c_code/1_2/semdata.nim.o \
c_code/1_2/linter.nim.o \
c_code/1_2/nimfix7prettybase.nim.o \
c_code/1_2/lookups.nim.o \
c_code/1_2/semtypinst.nim.o \
c_code/1_2/parampatterns.nim.o \
c_code/1_2/lowerings.nim.o \
c_code/1_2/_7lib7packages7docutils7rstast.nim.o \
c_code/1_2/_7lib7packages7docutils7rst.nim.o \
c_code/1_2/_7lib7packages7docutils7highlite.nim.o \
c_code/3_2/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_2/stdlib_xmltree.nim.o \
c_code/1_2/stdlib_uri.nim.o \
c_code/1_2/stdlib_cgi.nim.o \
c_code/1_2/typesrenderer.nim.o \
c_code/2_2/docgen.nim.o \
c_code/3_2/sigmatch.nim.o \
c_code/1_2/importer.nim.o \
c_code/1_2/procfind.nim.o \
c_code/5_2/pragmas.nim.o \
c_code/1_2/saturate.nim.o \
c_code/1_2/guards.nim.o \
c_code/1_2/sighashes.nim.o \
c_code/1_2/sempass2.nim.o \
c_code/1_2/cgmeth.nim.o \
c_code/1_2/aliases.nim.o \
c_code/1_2/patterns.nim.o \
c_code/1_2/dfa.nim.o \
c_code/1_2/injectdestructors.nim.o \
c_code/1_2/liftlocals.nim.o \
c_code/1_2/lambdalifting.nim.o \
c_code/1_2/closureiters.nim.o \
c_code/1_2/transf.nim.o \
c_code/1_2/vmgen.nim.o \
c_code/3_2/vmdeps.nim.o \
c_code/1_2/vmmarshal.nim.o \
c_code/3_2/gorgeimpl.nim.o \
c_code/1_2/macrocacheimpl.nim.o \
c_code/1_2/evaltempl.nim.o \
c_code/3_2/vm.nim.o \
c_code/1_2/semmacrosanity.nim.o \
c_code/1_2/pluginsupport.nim.o \
c_code/1_2/plugins7locals.nim.o \
c_code/1_2/plugins7itersgen.nim.o \
c_code/1_2/plugins7active.nim.o \
c_code/1_2/semparallel.nim.o \
c_code/3_2/sem.nim.o \
c_code/1_2/ccgutils.nim.o \
c_code/1_2/ndi.nim.o \
c_code/1_2/cgendata.nim.o \
c_code/1_2/ccgmerge.nim.o \
c_code/1_2/enumtostr.nim.o \
c_code/2_2/stdlib_dynlib.nim.o \
c_code/1_2/cgen.nim.o \
c_code/1_2/passaux.nim.o \
c_code/1_2/depends.nim.o \
c_code/1_2/modules.nim.o \
c_code/1_2/jsgen.nim.o \
c_code/3_2/docgen2.nim.o \
c_code/1_2/main.nim.o \
c_code/3_2/scriptconfig.nim.o \
c_code/3_2/cmdlinehelper.nim.o \
c_code/3_2/nim.nim.o $LINK_FLAGS
    ;;
  alpha)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  arm)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  m68k)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mipsel)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips64el)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc64el)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  arm64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  riscv64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
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
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_assertions.nim.c -o c_code/1_1/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_dollars.nim.c -o c_code/1_1/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_io.nim.c -o c_code/3_1/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_system.nim.c -o c_code/5_1/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.nim.c -o c_code/2_1/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.nim.c -o c_code/2_1/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_algorithm.nim.c -o c_code/1_1/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.nim.c -o c_code/2_1/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.nim.c -o c_code/2_1/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_pathnorm.nim.c -o c_code/2_1/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_posix.nim.c -o c_code/3_1/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_times.nim.c -o c_code/6_1/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_os.nim.c -o c_code/6_1/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_hashes.nim.c -o c_code/1_1/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strtabs.nim.c -o c_code/1_1/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_streams.nim.c -o c_code/3_1/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_cpuinfo.nim.c -o c_code/6_1/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_osproc.nim.c -o c_code/6_1/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sets.nim.c -o c_code/1_1/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pathutils.nim.c -o c_code/2_1/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ropes.nim.c -o c_code/1_1/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_tables.nim.c -o c_code/1_1/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lineinfos.nim.c -o c_code/1_1/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/platform.nim.c -o c_code/6_1/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/prefixmatches.nim.c -o c_code/1_1/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strformat.nim.c -o c_code/2_1/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.nim.c -o c_code/2_1/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/options.nim.c -o c_code/4_1/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/msgs.nim.c -o c_code/3_1/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/wordrecg.nim.c -o c_code/1_1/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idents.nim.c -o c_code/1_1/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/condsyms.nim.c -o c_code/1_1/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sha1.nim.c -o c_code/1_1/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.nim.c -o c_code/2_1/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parsejson.nim.c -o c_code/1_1/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_json.nim.c -o c_code/3_1/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/extccomp.nim.c -o c_code/4_1/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/nimblecmd.nim.c -o c_code/3_1/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.nim.c -o c_code/2_1/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/commands.nim.c -o c_code/3_1/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/llstream.nim.c -o c_code/1_1/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimlexbase.nim.c -o c_code/1_1/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/lexer.nim.c -o c_code/3_1/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimconf.nim.c -o c_code/2_1/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_intsets.nim.c -o c_code/1_1/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idgen.nim.c -o c_code/1_1/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ast.nim.c -o c_code/1_1/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/rodutils.nim.c -o c_code/1_1/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/astalgo.nim.c -o c_code/2_1/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parser.nim.c -o c_code/1_1/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/renderer.nim.c -o c_code/1_1/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filters.nim.c -o c_code/1_1/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filter__tmpl.nim.c -o c_code/1_1/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/syntaxes.nim.c -o c_code/1_1/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/trees.nim.c -o c_code/1_1/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/types.nim.c -o c_code/3_1/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/treetab.nim.c -o c_code/1_1/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/incremental.nim.c -o c_code/1_1/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/btrees.nim.c -o c_code/1_1/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_md5.nim.c -o c_code/1_1/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulegraphs.nim.c -o c_code/1_1/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/magicsys.nim.c -o c_code/1_1/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/bitsets.nim.c -o c_code/1_1/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimsets.nim.c -o c_code/1_1/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/semfold.nim.c -o c_code/3_1/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/modulepaths.nim.c -o c_code/3_1/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/reorder.nim.c -o c_code/1_1/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passes.nim.c -o c_code/1_1/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdef.nim.c -o c_code/1_1/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semdata.nim.c -o c_code/1_1/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/linter.nim.c -o c_code/1_1/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimfix7prettybase.nim.c -o c_code/1_1/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lookups.nim.c -o c_code/1_1/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semtypinst.nim.c -o c_code/1_1/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parampatterns.nim.c -o c_code/1_1/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lowerings.nim.c -o c_code/1_1/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rstast.nim.c -o c_code/1_1/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rst.nim.c -o c_code/1_1/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7highlite.nim.c -o c_code/1_1/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/_7lib7packages7docutils7rstgen.nim.c -o c_code/3_1/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_xmltree.nim.c -o c_code/1_1/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_uri.nim.c -o c_code/1_1/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cgi.nim.c -o c_code/1_1/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/typesrenderer.nim.c -o c_code/1_1/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docgen.nim.c -o c_code/2_1/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/sigmatch.nim.c -o c_code/3_1/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/importer.nim.c -o c_code/1_1/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/procfind.nim.c -o c_code/1_1/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/pragmas.nim.c -o c_code/3_1/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/saturate.nim.c -o c_code/1_1/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/guards.nim.c -o c_code/1_1/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sighashes.nim.c -o c_code/1_1/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sempass2.nim.c -o c_code/1_1/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgmeth.nim.c -o c_code/1_1/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/aliases.nim.c -o c_code/1_1/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/patterns.nim.c -o c_code/1_1/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/dfa.nim.c -o c_code/1_1/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/injectdestructors.nim.c -o c_code/1_1/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/liftlocals.nim.c -o c_code/1_1/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lambdalifting.nim.c -o c_code/1_1/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/closureiters.nim.c -o c_code/1_1/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/transf.nim.c -o c_code/1_1/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmgen.nim.c -o c_code/1_1/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/vmdeps.nim.c -o c_code/3_1/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmmarshal.nim.c -o c_code/1_1/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/gorgeimpl.nim.c -o c_code/3_1/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/macrocacheimpl.nim.c -o c_code/1_1/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/evaltempl.nim.c -o c_code/1_1/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/vm.nim.c -o c_code/3_1/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semmacrosanity.nim.c -o c_code/1_1/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/pluginsupport.nim.c -o c_code/1_1/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7locals.nim.c -o c_code/1_1/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7itersgen.nim.c -o c_code/1_1/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7active.nim.c -o c_code/1_1/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semparallel.nim.c -o c_code/1_1/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/sem.nim.c -o c_code/3_1/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgutils.nim.c -o c_code/1_1/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ndi.nim.c -o c_code/1_1/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgendata.nim.c -o c_code/1_1/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgmerge.nim.c -o c_code/1_1/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/enumtostr.nim.c -o c_code/1_1/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.nim.c -o c_code/2_1/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgen.nim.c -o c_code/1_1/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passaux.nim.c -o c_code/1_1/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/depends.nim.c -o c_code/1_1/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modules.nim.c -o c_code/1_1/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/jsgen.nim.c -o c_code/1_1/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/docgen2.nim.c -o c_code/3_1/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/main.nim.c -o c_code/1_1/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/scriptconfig.nim.c -o c_code/3_1/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/cmdlinehelper.nim.c -o c_code/3_1/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/nim.nim.c -o c_code/3_1/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_1/stdlib_assertions.nim.o \
c_code/1_1/stdlib_dollars.nim.o \
c_code/3_1/stdlib_io.nim.o \
c_code/5_1/stdlib_system.nim.o \
c_code/2_1/stdlib_parseutils.nim.o \
c_code/2_1/stdlib_math.nim.o \
c_code/1_1/stdlib_algorithm.nim.o \
c_code/2_1/stdlib_unicode.nim.o \
c_code/2_1/stdlib_strutils.nim.o \
c_code/2_1/stdlib_pathnorm.nim.o \
c_code/3_1/stdlib_posix.nim.o \
c_code/6_1/stdlib_times.nim.o \
c_code/6_1/stdlib_os.nim.o \
c_code/1_1/stdlib_hashes.nim.o \
c_code/1_1/stdlib_strtabs.nim.o \
c_code/3_1/stdlib_streams.nim.o \
c_code/6_1/stdlib_cpuinfo.nim.o \
c_code/6_1/stdlib_osproc.nim.o \
c_code/1_1/stdlib_sets.nim.o \
c_code/2_1/pathutils.nim.o \
c_code/1_1/ropes.nim.o \
c_code/1_1/stdlib_tables.nim.o \
c_code/1_1/lineinfos.nim.o \
c_code/6_1/platform.nim.o \
c_code/1_1/prefixmatches.nim.o \
c_code/2_1/stdlib_strformat.nim.o \
c_code/2_1/stdlib_terminal.nim.o \
c_code/4_1/options.nim.o \
c_code/3_1/msgs.nim.o \
c_code/1_1/wordrecg.nim.o \
c_code/1_1/idents.nim.o \
c_code/1_1/condsyms.nim.o \
c_code/1_1/stdlib_sha1.nim.o \
c_code/2_1/stdlib_lexbase.nim.o \
c_code/1_1/stdlib_parsejson.nim.o \
c_code/3_1/stdlib_json.nim.o \
c_code/4_1/extccomp.nim.o \
c_code/3_1/nimblecmd.nim.o \
c_code/2_1/stdlib_parseopt.nim.o \
c_code/3_1/commands.nim.o \
c_code/1_1/llstream.nim.o \
c_code/1_1/nimlexbase.nim.o \
c_code/3_1/lexer.nim.o \
c_code/2_1/nimconf.nim.o \
c_code/1_1/stdlib_intsets.nim.o \
c_code/1_1/idgen.nim.o \
c_code/1_1/ast.nim.o \
c_code/1_1/rodutils.nim.o \
c_code/2_1/astalgo.nim.o \
c_code/1_1/parser.nim.o \
c_code/1_1/renderer.nim.o \
c_code/1_1/filters.nim.o \
c_code/1_1/filter__tmpl.nim.o \
c_code/1_1/syntaxes.nim.o \
c_code/1_1/trees.nim.o \
c_code/3_1/types.nim.o \
c_code/1_1/treetab.nim.o \
c_code/1_1/incremental.nim.o \
c_code/1_1/btrees.nim.o \
c_code/1_1/stdlib_md5.nim.o \
c_code/1_1/modulegraphs.nim.o \
c_code/1_1/magicsys.nim.o \
c_code/1_1/bitsets.nim.o \
c_code/1_1/nimsets.nim.o \
c_code/3_1/semfold.nim.o \
c_code/3_1/modulepaths.nim.o \
c_code/1_1/reorder.nim.o \
c_code/1_1/passes.nim.o \
c_code/1_1/vmdef.nim.o \
c_code/1_1/semdata.nim.o \
c_code/1_1/linter.nim.o \
c_code/1_1/nimfix7prettybase.nim.o \
c_code/1_1/lookups.nim.o \
c_code/1_1/semtypinst.nim.o \
c_code/1_1/parampatterns.nim.o \
c_code/1_1/lowerings.nim.o \
c_code/1_1/_7lib7packages7docutils7rstast.nim.o \
c_code/1_1/_7lib7packages7docutils7rst.nim.o \
c_code/1_1/_7lib7packages7docutils7highlite.nim.o \
c_code/3_1/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_1/stdlib_xmltree.nim.o \
c_code/1_1/stdlib_uri.nim.o \
c_code/1_1/stdlib_cgi.nim.o \
c_code/1_1/typesrenderer.nim.o \
c_code/2_1/docgen.nim.o \
c_code/3_1/sigmatch.nim.o \
c_code/1_1/importer.nim.o \
c_code/1_1/procfind.nim.o \
c_code/3_1/pragmas.nim.o \
c_code/1_1/saturate.nim.o \
c_code/1_1/guards.nim.o \
c_code/1_1/sighashes.nim.o \
c_code/1_1/sempass2.nim.o \
c_code/1_1/cgmeth.nim.o \
c_code/1_1/aliases.nim.o \
c_code/1_1/patterns.nim.o \
c_code/1_1/dfa.nim.o \
c_code/1_1/injectdestructors.nim.o \
c_code/1_1/liftlocals.nim.o \
c_code/1_1/lambdalifting.nim.o \
c_code/1_1/closureiters.nim.o \
c_code/1_1/transf.nim.o \
c_code/1_1/vmgen.nim.o \
c_code/3_1/vmdeps.nim.o \
c_code/1_1/vmmarshal.nim.o \
c_code/3_1/gorgeimpl.nim.o \
c_code/1_1/macrocacheimpl.nim.o \
c_code/1_1/evaltempl.nim.o \
c_code/3_1/vm.nim.o \
c_code/1_1/semmacrosanity.nim.o \
c_code/1_1/pluginsupport.nim.o \
c_code/1_1/plugins7locals.nim.o \
c_code/1_1/plugins7itersgen.nim.o \
c_code/1_1/plugins7active.nim.o \
c_code/1_1/semparallel.nim.o \
c_code/3_1/sem.nim.o \
c_code/1_1/ccgutils.nim.o \
c_code/1_1/ndi.nim.o \
c_code/1_1/cgendata.nim.o \
c_code/1_1/ccgmerge.nim.o \
c_code/1_1/enumtostr.nim.o \
c_code/2_1/stdlib_dynlib.nim.o \
c_code/1_1/cgen.nim.o \
c_code/1_1/passaux.nim.o \
c_code/1_1/depends.nim.o \
c_code/1_1/modules.nim.o \
c_code/1_1/jsgen.nim.o \
c_code/3_1/docgen2.nim.o \
c_code/1_1/main.nim.o \
c_code/3_1/scriptconfig.nim.o \
c_code/3_1/cmdlinehelper.nim.o \
c_code/3_1/nim.nim.o $LINK_FLAGS
    ;;
  amd64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_assertions.nim.c -o c_code/1_2/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_dollars.nim.c -o c_code/1_2/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_io.nim.c -o c_code/3_2/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_system.nim.c -o c_code/5_2/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.nim.c -o c_code/2_2/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.nim.c -o c_code/2_2/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_algorithm.nim.c -o c_code/1_2/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.nim.c -o c_code/2_2/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.nim.c -o c_code/2_2/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_pathnorm.nim.c -o c_code/2_2/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_posix.nim.c -o c_code/3_2/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_times.nim.c -o c_code/6_2/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_os.nim.c -o c_code/6_2/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_hashes.nim.c -o c_code/1_2/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strtabs.nim.c -o c_code/1_2/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_streams.nim.c -o c_code/3_2/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_cpuinfo.nim.c -o c_code/6_2/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_osproc.nim.c -o c_code/6_2/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sets.nim.c -o c_code/1_2/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/pathutils.nim.c -o c_code/2_2/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ropes.nim.c -o c_code/1_2/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_tables.nim.c -o c_code/1_2/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lineinfos.nim.c -o c_code/1_2/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/platform.nim.c -o c_code/6_2/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/prefixmatches.nim.c -o c_code/1_2/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strformat.nim.c -o c_code/2_2/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.nim.c -o c_code/2_2/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/options.nim.c -o c_code/5_2/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/msgs.nim.c -o c_code/3_2/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/wordrecg.nim.c -o c_code/1_2/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idents.nim.c -o c_code/1_2/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/condsyms.nim.c -o c_code/1_2/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sha1.nim.c -o c_code/1_2/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.nim.c -o c_code/2_2/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parsejson.nim.c -o c_code/1_2/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_json.nim.c -o c_code/3_2/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/extccomp.nim.c -o c_code/5_2/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/nimblecmd.nim.c -o c_code/5_2/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.nim.c -o c_code/2_2/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/commands.nim.c -o c_code/3_2/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/llstream.nim.c -o c_code/1_2/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimlexbase.nim.c -o c_code/1_2/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/lexer.nim.c -o c_code/3_2/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimconf.nim.c -o c_code/2_2/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_intsets.nim.c -o c_code/1_2/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idgen.nim.c -o c_code/1_2/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ast.nim.c -o c_code/1_2/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/rodutils.nim.c -o c_code/1_2/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/astalgo.nim.c -o c_code/2_2/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parser.nim.c -o c_code/1_2/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/renderer.nim.c -o c_code/1_2/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filters.nim.c -o c_code/1_2/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filter__tmpl.nim.c -o c_code/1_2/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/syntaxes.nim.c -o c_code/1_2/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/trees.nim.c -o c_code/1_2/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/types.nim.c -o c_code/3_2/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/treetab.nim.c -o c_code/1_2/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/incremental.nim.c -o c_code/1_2/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/btrees.nim.c -o c_code/1_2/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_md5.nim.c -o c_code/1_2/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulegraphs.nim.c -o c_code/1_2/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/magicsys.nim.c -o c_code/1_2/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/bitsets.nim.c -o c_code/1_2/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimsets.nim.c -o c_code/1_2/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/semfold.nim.c -o c_code/3_2/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/modulepaths.nim.c -o c_code/3_2/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/reorder.nim.c -o c_code/1_2/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passes.nim.c -o c_code/1_2/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdef.nim.c -o c_code/1_2/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semdata.nim.c -o c_code/1_2/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/linter.nim.c -o c_code/1_2/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimfix7prettybase.nim.c -o c_code/1_2/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lookups.nim.c -o c_code/1_2/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semtypinst.nim.c -o c_code/1_2/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parampatterns.nim.c -o c_code/1_2/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lowerings.nim.c -o c_code/1_2/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rstast.nim.c -o c_code/1_2/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rst.nim.c -o c_code/1_2/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7highlite.nim.c -o c_code/1_2/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/_7lib7packages7docutils7rstgen.nim.c -o c_code/3_2/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_xmltree.nim.c -o c_code/1_2/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_uri.nim.c -o c_code/1_2/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cgi.nim.c -o c_code/1_2/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/typesrenderer.nim.c -o c_code/1_2/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docgen.nim.c -o c_code/2_2/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/sigmatch.nim.c -o c_code/3_2/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/importer.nim.c -o c_code/1_2/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/procfind.nim.c -o c_code/1_2/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/pragmas.nim.c -o c_code/5_2/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/saturate.nim.c -o c_code/1_2/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/guards.nim.c -o c_code/1_2/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sighashes.nim.c -o c_code/1_2/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sempass2.nim.c -o c_code/1_2/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgmeth.nim.c -o c_code/1_2/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/aliases.nim.c -o c_code/1_2/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/patterns.nim.c -o c_code/1_2/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/dfa.nim.c -o c_code/1_2/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/injectdestructors.nim.c -o c_code/1_2/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/liftlocals.nim.c -o c_code/1_2/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lambdalifting.nim.c -o c_code/1_2/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/closureiters.nim.c -o c_code/1_2/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/transf.nim.c -o c_code/1_2/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmgen.nim.c -o c_code/1_2/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/vmdeps.nim.c -o c_code/3_2/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmmarshal.nim.c -o c_code/1_2/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/gorgeimpl.nim.c -o c_code/3_2/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/macrocacheimpl.nim.c -o c_code/1_2/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/evaltempl.nim.c -o c_code/1_2/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/vm.nim.c -o c_code/3_2/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semmacrosanity.nim.c -o c_code/1_2/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/pluginsupport.nim.c -o c_code/1_2/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7locals.nim.c -o c_code/1_2/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7itersgen.nim.c -o c_code/1_2/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7active.nim.c -o c_code/1_2/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semparallel.nim.c -o c_code/1_2/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/sem.nim.c -o c_code/3_2/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgutils.nim.c -o c_code/1_2/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ndi.nim.c -o c_code/1_2/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgendata.nim.c -o c_code/1_2/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgmerge.nim.c -o c_code/1_2/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/enumtostr.nim.c -o c_code/1_2/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.nim.c -o c_code/2_2/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgen.nim.c -o c_code/1_2/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passaux.nim.c -o c_code/1_2/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/depends.nim.c -o c_code/1_2/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modules.nim.c -o c_code/1_2/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/jsgen.nim.c -o c_code/1_2/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/docgen2.nim.c -o c_code/3_2/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/main.nim.c -o c_code/1_2/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/scriptconfig.nim.c -o c_code/3_2/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/cmdlinehelper.nim.c -o c_code/3_2/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/nim.nim.c -o c_code/3_2/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_2/stdlib_assertions.nim.o \
c_code/1_2/stdlib_dollars.nim.o \
c_code/3_2/stdlib_io.nim.o \
c_code/5_2/stdlib_system.nim.o \
c_code/2_2/stdlib_parseutils.nim.o \
c_code/2_2/stdlib_math.nim.o \
c_code/1_2/stdlib_algorithm.nim.o \
c_code/2_2/stdlib_unicode.nim.o \
c_code/2_2/stdlib_strutils.nim.o \
c_code/2_2/stdlib_pathnorm.nim.o \
c_code/3_2/stdlib_posix.nim.o \
c_code/6_2/stdlib_times.nim.o \
c_code/6_2/stdlib_os.nim.o \
c_code/1_2/stdlib_hashes.nim.o \
c_code/1_2/stdlib_strtabs.nim.o \
c_code/3_2/stdlib_streams.nim.o \
c_code/6_2/stdlib_cpuinfo.nim.o \
c_code/6_2/stdlib_osproc.nim.o \
c_code/1_2/stdlib_sets.nim.o \
c_code/2_2/pathutils.nim.o \
c_code/1_2/ropes.nim.o \
c_code/1_2/stdlib_tables.nim.o \
c_code/1_2/lineinfos.nim.o \
c_code/6_2/platform.nim.o \
c_code/1_2/prefixmatches.nim.o \
c_code/2_2/stdlib_strformat.nim.o \
c_code/2_2/stdlib_terminal.nim.o \
c_code/5_2/options.nim.o \
c_code/3_2/msgs.nim.o \
c_code/1_2/wordrecg.nim.o \
c_code/1_2/idents.nim.o \
c_code/1_2/condsyms.nim.o \
c_code/1_2/stdlib_sha1.nim.o \
c_code/2_2/stdlib_lexbase.nim.o \
c_code/1_2/stdlib_parsejson.nim.o \
c_code/3_2/stdlib_json.nim.o \
c_code/5_2/extccomp.nim.o \
c_code/5_2/nimblecmd.nim.o \
c_code/2_2/stdlib_parseopt.nim.o \
c_code/3_2/commands.nim.o \
c_code/1_2/llstream.nim.o \
c_code/1_2/nimlexbase.nim.o \
c_code/3_2/lexer.nim.o \
c_code/2_2/nimconf.nim.o \
c_code/1_2/stdlib_intsets.nim.o \
c_code/1_2/idgen.nim.o \
c_code/1_2/ast.nim.o \
c_code/1_2/rodutils.nim.o \
c_code/2_2/astalgo.nim.o \
c_code/1_2/parser.nim.o \
c_code/1_2/renderer.nim.o \
c_code/1_2/filters.nim.o \
c_code/1_2/filter__tmpl.nim.o \
c_code/1_2/syntaxes.nim.o \
c_code/1_2/trees.nim.o \
c_code/3_2/types.nim.o \
c_code/1_2/treetab.nim.o \
c_code/1_2/incremental.nim.o \
c_code/1_2/btrees.nim.o \
c_code/1_2/stdlib_md5.nim.o \
c_code/1_2/modulegraphs.nim.o \
c_code/1_2/magicsys.nim.o \
c_code/1_2/bitsets.nim.o \
c_code/1_2/nimsets.nim.o \
c_code/3_2/semfold.nim.o \
c_code/3_2/modulepaths.nim.o \
c_code/1_2/reorder.nim.o \
c_code/1_2/passes.nim.o \
c_code/1_2/vmdef.nim.o \
c_code/1_2/semdata.nim.o \
c_code/1_2/linter.nim.o \
c_code/1_2/nimfix7prettybase.nim.o \
c_code/1_2/lookups.nim.o \
c_code/1_2/semtypinst.nim.o \
c_code/1_2/parampatterns.nim.o \
c_code/1_2/lowerings.nim.o \
c_code/1_2/_7lib7packages7docutils7rstast.nim.o \
c_code/1_2/_7lib7packages7docutils7rst.nim.o \
c_code/1_2/_7lib7packages7docutils7highlite.nim.o \
c_code/3_2/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_2/stdlib_xmltree.nim.o \
c_code/1_2/stdlib_uri.nim.o \
c_code/1_2/stdlib_cgi.nim.o \
c_code/1_2/typesrenderer.nim.o \
c_code/2_2/docgen.nim.o \
c_code/3_2/sigmatch.nim.o \
c_code/1_2/importer.nim.o \
c_code/1_2/procfind.nim.o \
c_code/5_2/pragmas.nim.o \
c_code/1_2/saturate.nim.o \
c_code/1_2/guards.nim.o \
c_code/1_2/sighashes.nim.o \
c_code/1_2/sempass2.nim.o \
c_code/1_2/cgmeth.nim.o \
c_code/1_2/aliases.nim.o \
c_code/1_2/patterns.nim.o \
c_code/1_2/dfa.nim.o \
c_code/1_2/injectdestructors.nim.o \
c_code/1_2/liftlocals.nim.o \
c_code/1_2/lambdalifting.nim.o \
c_code/1_2/closureiters.nim.o \
c_code/1_2/transf.nim.o \
c_code/1_2/vmgen.nim.o \
c_code/3_2/vmdeps.nim.o \
c_code/1_2/vmmarshal.nim.o \
c_code/3_2/gorgeimpl.nim.o \
c_code/1_2/macrocacheimpl.nim.o \
c_code/1_2/evaltempl.nim.o \
c_code/3_2/vm.nim.o \
c_code/1_2/semmacrosanity.nim.o \
c_code/1_2/pluginsupport.nim.o \
c_code/1_2/plugins7locals.nim.o \
c_code/1_2/plugins7itersgen.nim.o \
c_code/1_2/plugins7active.nim.o \
c_code/1_2/semparallel.nim.o \
c_code/3_2/sem.nim.o \
c_code/1_2/ccgutils.nim.o \
c_code/1_2/ndi.nim.o \
c_code/1_2/cgendata.nim.o \
c_code/1_2/ccgmerge.nim.o \
c_code/1_2/enumtostr.nim.o \
c_code/2_2/stdlib_dynlib.nim.o \
c_code/1_2/cgen.nim.o \
c_code/1_2/passaux.nim.o \
c_code/1_2/depends.nim.o \
c_code/1_2/modules.nim.o \
c_code/1_2/jsgen.nim.o \
c_code/3_2/docgen2.nim.o \
c_code/1_2/main.nim.o \
c_code/3_2/scriptconfig.nim.o \
c_code/3_2/cmdlinehelper.nim.o \
c_code/3_2/nim.nim.o $LINK_FLAGS
    ;;
  alpha)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  arm)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  m68k)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mipsel)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips64el)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc64el)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  arm64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  riscv64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
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
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_assertions.nim.c -o c_code/1_1/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_dollars.nim.c -o c_code/1_1/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_io.nim.c -o c_code/3_1/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_system.nim.c -o c_code/5_1/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.nim.c -o c_code/2_1/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.nim.c -o c_code/2_1/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_algorithm.nim.c -o c_code/1_1/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.nim.c -o c_code/2_1/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.nim.c -o c_code/2_1/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_pathnorm.nim.c -o c_code/2_1/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_posix.nim.c -o c_code/3_1/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_times.nim.c -o c_code/5_1/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_os.nim.c -o c_code/7_1/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_hashes.nim.c -o c_code/1_1/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strtabs.nim.c -o c_code/1_1/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_streams.nim.c -o c_code/3_1/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_cpuinfo.nim.c -o c_code/6_1/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_osproc.nim.c -o c_code/5_1/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sets.nim.c -o c_code/1_1/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pathutils.nim.c -o c_code/2_1/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ropes.nim.c -o c_code/1_1/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_tables.nim.c -o c_code/1_1/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lineinfos.nim.c -o c_code/1_1/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/platform.nim.c -o c_code/7_1/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/prefixmatches.nim.c -o c_code/1_1/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strformat.nim.c -o c_code/2_1/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.nim.c -o c_code/2_1/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/options.nim.c -o c_code/4_1/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/msgs.nim.c -o c_code/3_1/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/wordrecg.nim.c -o c_code/1_1/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idents.nim.c -o c_code/1_1/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/condsyms.nim.c -o c_code/1_1/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sha1.nim.c -o c_code/1_1/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.nim.c -o c_code/2_1/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parsejson.nim.c -o c_code/1_1/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_json.nim.c -o c_code/3_1/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/extccomp.nim.c -o c_code/4_1/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/nimblecmd.nim.c -o c_code/3_1/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.nim.c -o c_code/2_1/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/commands.nim.c -o c_code/3_1/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/llstream.nim.c -o c_code/1_1/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimlexbase.nim.c -o c_code/1_1/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/lexer.nim.c -o c_code/3_1/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimconf.nim.c -o c_code/2_1/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_intsets.nim.c -o c_code/1_1/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idgen.nim.c -o c_code/1_1/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ast.nim.c -o c_code/1_1/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/rodutils.nim.c -o c_code/1_1/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/astalgo.nim.c -o c_code/2_1/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parser.nim.c -o c_code/1_1/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/renderer.nim.c -o c_code/1_1/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filters.nim.c -o c_code/1_1/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filter__tmpl.nim.c -o c_code/1_1/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/syntaxes.nim.c -o c_code/1_1/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/trees.nim.c -o c_code/1_1/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/types.nim.c -o c_code/3_1/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/treetab.nim.c -o c_code/1_1/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/incremental.nim.c -o c_code/1_1/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/btrees.nim.c -o c_code/1_1/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_md5.nim.c -o c_code/1_1/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulegraphs.nim.c -o c_code/1_1/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/magicsys.nim.c -o c_code/1_1/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/bitsets.nim.c -o c_code/1_1/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimsets.nim.c -o c_code/1_1/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/semfold.nim.c -o c_code/3_1/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/modulepaths.nim.c -o c_code/3_1/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/reorder.nim.c -o c_code/1_1/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passes.nim.c -o c_code/1_1/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdef.nim.c -o c_code/1_1/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semdata.nim.c -o c_code/1_1/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/linter.nim.c -o c_code/1_1/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimfix7prettybase.nim.c -o c_code/1_1/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lookups.nim.c -o c_code/1_1/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semtypinst.nim.c -o c_code/1_1/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parampatterns.nim.c -o c_code/1_1/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lowerings.nim.c -o c_code/1_1/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rstast.nim.c -o c_code/1_1/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rst.nim.c -o c_code/1_1/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7highlite.nim.c -o c_code/1_1/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/_7lib7packages7docutils7rstgen.nim.c -o c_code/3_1/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_xmltree.nim.c -o c_code/1_1/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_uri.nim.c -o c_code/1_1/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cgi.nim.c -o c_code/1_1/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/typesrenderer.nim.c -o c_code/1_1/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docgen.nim.c -o c_code/2_1/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/sigmatch.nim.c -o c_code/3_1/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/importer.nim.c -o c_code/1_1/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/procfind.nim.c -o c_code/1_1/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/pragmas.nim.c -o c_code/3_1/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/saturate.nim.c -o c_code/1_1/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/guards.nim.c -o c_code/1_1/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sighashes.nim.c -o c_code/1_1/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sempass2.nim.c -o c_code/1_1/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgmeth.nim.c -o c_code/1_1/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/aliases.nim.c -o c_code/1_1/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/patterns.nim.c -o c_code/1_1/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/dfa.nim.c -o c_code/1_1/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/injectdestructors.nim.c -o c_code/1_1/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/liftlocals.nim.c -o c_code/1_1/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lambdalifting.nim.c -o c_code/1_1/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/closureiters.nim.c -o c_code/1_1/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/transf.nim.c -o c_code/1_1/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmgen.nim.c -o c_code/1_1/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/vmdeps.nim.c -o c_code/3_1/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmmarshal.nim.c -o c_code/1_1/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/gorgeimpl.nim.c -o c_code/3_1/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/macrocacheimpl.nim.c -o c_code/1_1/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/evaltempl.nim.c -o c_code/1_1/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/vm.nim.c -o c_code/3_1/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semmacrosanity.nim.c -o c_code/1_1/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/pluginsupport.nim.c -o c_code/1_1/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7locals.nim.c -o c_code/1_1/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7itersgen.nim.c -o c_code/1_1/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7active.nim.c -o c_code/1_1/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semparallel.nim.c -o c_code/1_1/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/sem.nim.c -o c_code/3_1/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgutils.nim.c -o c_code/1_1/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ndi.nim.c -o c_code/1_1/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgendata.nim.c -o c_code/1_1/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgmerge.nim.c -o c_code/1_1/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/enumtostr.nim.c -o c_code/1_1/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.nim.c -o c_code/2_1/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgen.nim.c -o c_code/1_1/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passaux.nim.c -o c_code/1_1/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/depends.nim.c -o c_code/1_1/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modules.nim.c -o c_code/1_1/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/jsgen.nim.c -o c_code/1_1/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/docgen2.nim.c -o c_code/3_1/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/main.nim.c -o c_code/1_1/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/scriptconfig.nim.c -o c_code/3_1/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/cmdlinehelper.nim.c -o c_code/3_1/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/nim.nim.c -o c_code/3_1/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_1/stdlib_assertions.nim.o \
c_code/1_1/stdlib_dollars.nim.o \
c_code/3_1/stdlib_io.nim.o \
c_code/5_1/stdlib_system.nim.o \
c_code/2_1/stdlib_parseutils.nim.o \
c_code/2_1/stdlib_math.nim.o \
c_code/1_1/stdlib_algorithm.nim.o \
c_code/2_1/stdlib_unicode.nim.o \
c_code/2_1/stdlib_strutils.nim.o \
c_code/2_1/stdlib_pathnorm.nim.o \
c_code/3_1/stdlib_posix.nim.o \
c_code/5_1/stdlib_times.nim.o \
c_code/7_1/stdlib_os.nim.o \
c_code/1_1/stdlib_hashes.nim.o \
c_code/1_1/stdlib_strtabs.nim.o \
c_code/3_1/stdlib_streams.nim.o \
c_code/6_1/stdlib_cpuinfo.nim.o \
c_code/5_1/stdlib_osproc.nim.o \
c_code/1_1/stdlib_sets.nim.o \
c_code/2_1/pathutils.nim.o \
c_code/1_1/ropes.nim.o \
c_code/1_1/stdlib_tables.nim.o \
c_code/1_1/lineinfos.nim.o \
c_code/7_1/platform.nim.o \
c_code/1_1/prefixmatches.nim.o \
c_code/2_1/stdlib_strformat.nim.o \
c_code/2_1/stdlib_terminal.nim.o \
c_code/4_1/options.nim.o \
c_code/3_1/msgs.nim.o \
c_code/1_1/wordrecg.nim.o \
c_code/1_1/idents.nim.o \
c_code/1_1/condsyms.nim.o \
c_code/1_1/stdlib_sha1.nim.o \
c_code/2_1/stdlib_lexbase.nim.o \
c_code/1_1/stdlib_parsejson.nim.o \
c_code/3_1/stdlib_json.nim.o \
c_code/4_1/extccomp.nim.o \
c_code/3_1/nimblecmd.nim.o \
c_code/2_1/stdlib_parseopt.nim.o \
c_code/3_1/commands.nim.o \
c_code/1_1/llstream.nim.o \
c_code/1_1/nimlexbase.nim.o \
c_code/3_1/lexer.nim.o \
c_code/2_1/nimconf.nim.o \
c_code/1_1/stdlib_intsets.nim.o \
c_code/1_1/idgen.nim.o \
c_code/1_1/ast.nim.o \
c_code/1_1/rodutils.nim.o \
c_code/2_1/astalgo.nim.o \
c_code/1_1/parser.nim.o \
c_code/1_1/renderer.nim.o \
c_code/1_1/filters.nim.o \
c_code/1_1/filter__tmpl.nim.o \
c_code/1_1/syntaxes.nim.o \
c_code/1_1/trees.nim.o \
c_code/3_1/types.nim.o \
c_code/1_1/treetab.nim.o \
c_code/1_1/incremental.nim.o \
c_code/1_1/btrees.nim.o \
c_code/1_1/stdlib_md5.nim.o \
c_code/1_1/modulegraphs.nim.o \
c_code/1_1/magicsys.nim.o \
c_code/1_1/bitsets.nim.o \
c_code/1_1/nimsets.nim.o \
c_code/3_1/semfold.nim.o \
c_code/3_1/modulepaths.nim.o \
c_code/1_1/reorder.nim.o \
c_code/1_1/passes.nim.o \
c_code/1_1/vmdef.nim.o \
c_code/1_1/semdata.nim.o \
c_code/1_1/linter.nim.o \
c_code/1_1/nimfix7prettybase.nim.o \
c_code/1_1/lookups.nim.o \
c_code/1_1/semtypinst.nim.o \
c_code/1_1/parampatterns.nim.o \
c_code/1_1/lowerings.nim.o \
c_code/1_1/_7lib7packages7docutils7rstast.nim.o \
c_code/1_1/_7lib7packages7docutils7rst.nim.o \
c_code/1_1/_7lib7packages7docutils7highlite.nim.o \
c_code/3_1/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_1/stdlib_xmltree.nim.o \
c_code/1_1/stdlib_uri.nim.o \
c_code/1_1/stdlib_cgi.nim.o \
c_code/1_1/typesrenderer.nim.o \
c_code/2_1/docgen.nim.o \
c_code/3_1/sigmatch.nim.o \
c_code/1_1/importer.nim.o \
c_code/1_1/procfind.nim.o \
c_code/3_1/pragmas.nim.o \
c_code/1_1/saturate.nim.o \
c_code/1_1/guards.nim.o \
c_code/1_1/sighashes.nim.o \
c_code/1_1/sempass2.nim.o \
c_code/1_1/cgmeth.nim.o \
c_code/1_1/aliases.nim.o \
c_code/1_1/patterns.nim.o \
c_code/1_1/dfa.nim.o \
c_code/1_1/injectdestructors.nim.o \
c_code/1_1/liftlocals.nim.o \
c_code/1_1/lambdalifting.nim.o \
c_code/1_1/closureiters.nim.o \
c_code/1_1/transf.nim.o \
c_code/1_1/vmgen.nim.o \
c_code/3_1/vmdeps.nim.o \
c_code/1_1/vmmarshal.nim.o \
c_code/3_1/gorgeimpl.nim.o \
c_code/1_1/macrocacheimpl.nim.o \
c_code/1_1/evaltempl.nim.o \
c_code/3_1/vm.nim.o \
c_code/1_1/semmacrosanity.nim.o \
c_code/1_1/pluginsupport.nim.o \
c_code/1_1/plugins7locals.nim.o \
c_code/1_1/plugins7itersgen.nim.o \
c_code/1_1/plugins7active.nim.o \
c_code/1_1/semparallel.nim.o \
c_code/3_1/sem.nim.o \
c_code/1_1/ccgutils.nim.o \
c_code/1_1/ndi.nim.o \
c_code/1_1/cgendata.nim.o \
c_code/1_1/ccgmerge.nim.o \
c_code/1_1/enumtostr.nim.o \
c_code/2_1/stdlib_dynlib.nim.o \
c_code/1_1/cgen.nim.o \
c_code/1_1/passaux.nim.o \
c_code/1_1/depends.nim.o \
c_code/1_1/modules.nim.o \
c_code/1_1/jsgen.nim.o \
c_code/3_1/docgen2.nim.o \
c_code/1_1/main.nim.o \
c_code/3_1/scriptconfig.nim.o \
c_code/3_1/cmdlinehelper.nim.o \
c_code/3_1/nim.nim.o $LINK_FLAGS
    ;;
  amd64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_assertions.nim.c -o c_code/1_2/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_dollars.nim.c -o c_code/1_2/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_io.nim.c -o c_code/3_2/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_system.nim.c -o c_code/5_2/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.nim.c -o c_code/2_2/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.nim.c -o c_code/2_2/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_algorithm.nim.c -o c_code/1_2/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.nim.c -o c_code/2_2/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.nim.c -o c_code/2_2/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_pathnorm.nim.c -o c_code/2_2/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_posix.nim.c -o c_code/3_2/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_times.nim.c -o c_code/5_2/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_os.nim.c -o c_code/7_2/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_hashes.nim.c -o c_code/1_2/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strtabs.nim.c -o c_code/1_2/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_streams.nim.c -o c_code/3_2/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_cpuinfo.nim.c -o c_code/6_2/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_osproc.nim.c -o c_code/5_2/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sets.nim.c -o c_code/1_2/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/pathutils.nim.c -o c_code/2_2/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ropes.nim.c -o c_code/1_2/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_tables.nim.c -o c_code/1_2/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lineinfos.nim.c -o c_code/1_2/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/platform.nim.c -o c_code/7_2/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/prefixmatches.nim.c -o c_code/1_2/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strformat.nim.c -o c_code/2_2/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.nim.c -o c_code/2_2/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/options.nim.c -o c_code/5_2/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/msgs.nim.c -o c_code/3_2/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/wordrecg.nim.c -o c_code/1_2/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idents.nim.c -o c_code/1_2/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/condsyms.nim.c -o c_code/1_2/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sha1.nim.c -o c_code/1_2/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.nim.c -o c_code/2_2/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parsejson.nim.c -o c_code/1_2/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_json.nim.c -o c_code/3_2/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/extccomp.nim.c -o c_code/5_2/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/nimblecmd.nim.c -o c_code/5_2/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.nim.c -o c_code/2_2/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/commands.nim.c -o c_code/3_2/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/llstream.nim.c -o c_code/1_2/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimlexbase.nim.c -o c_code/1_2/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/lexer.nim.c -o c_code/3_2/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimconf.nim.c -o c_code/2_2/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_intsets.nim.c -o c_code/1_2/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idgen.nim.c -o c_code/1_2/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ast.nim.c -o c_code/1_2/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/rodutils.nim.c -o c_code/1_2/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/astalgo.nim.c -o c_code/2_2/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parser.nim.c -o c_code/1_2/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/renderer.nim.c -o c_code/1_2/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filters.nim.c -o c_code/1_2/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filter__tmpl.nim.c -o c_code/1_2/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/syntaxes.nim.c -o c_code/1_2/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/trees.nim.c -o c_code/1_2/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/types.nim.c -o c_code/3_2/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/treetab.nim.c -o c_code/1_2/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/incremental.nim.c -o c_code/1_2/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/btrees.nim.c -o c_code/1_2/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_md5.nim.c -o c_code/1_2/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulegraphs.nim.c -o c_code/1_2/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/magicsys.nim.c -o c_code/1_2/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/bitsets.nim.c -o c_code/1_2/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimsets.nim.c -o c_code/1_2/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/semfold.nim.c -o c_code/3_2/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/modulepaths.nim.c -o c_code/3_2/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/reorder.nim.c -o c_code/1_2/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passes.nim.c -o c_code/1_2/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdef.nim.c -o c_code/1_2/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semdata.nim.c -o c_code/1_2/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/linter.nim.c -o c_code/1_2/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimfix7prettybase.nim.c -o c_code/1_2/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lookups.nim.c -o c_code/1_2/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semtypinst.nim.c -o c_code/1_2/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parampatterns.nim.c -o c_code/1_2/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lowerings.nim.c -o c_code/1_2/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rstast.nim.c -o c_code/1_2/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rst.nim.c -o c_code/1_2/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7highlite.nim.c -o c_code/1_2/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/_7lib7packages7docutils7rstgen.nim.c -o c_code/3_2/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_xmltree.nim.c -o c_code/1_2/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_uri.nim.c -o c_code/1_2/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cgi.nim.c -o c_code/1_2/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/typesrenderer.nim.c -o c_code/1_2/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docgen.nim.c -o c_code/2_2/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/sigmatch.nim.c -o c_code/3_2/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/importer.nim.c -o c_code/1_2/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/procfind.nim.c -o c_code/1_2/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/pragmas.nim.c -o c_code/5_2/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/saturate.nim.c -o c_code/1_2/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/guards.nim.c -o c_code/1_2/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sighashes.nim.c -o c_code/1_2/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sempass2.nim.c -o c_code/1_2/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgmeth.nim.c -o c_code/1_2/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/aliases.nim.c -o c_code/1_2/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/patterns.nim.c -o c_code/1_2/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/dfa.nim.c -o c_code/1_2/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/injectdestructors.nim.c -o c_code/1_2/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/liftlocals.nim.c -o c_code/1_2/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lambdalifting.nim.c -o c_code/1_2/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/closureiters.nim.c -o c_code/1_2/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/transf.nim.c -o c_code/1_2/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmgen.nim.c -o c_code/1_2/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/vmdeps.nim.c -o c_code/3_2/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmmarshal.nim.c -o c_code/1_2/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/gorgeimpl.nim.c -o c_code/3_2/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/macrocacheimpl.nim.c -o c_code/1_2/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/evaltempl.nim.c -o c_code/1_2/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/vm.nim.c -o c_code/3_2/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semmacrosanity.nim.c -o c_code/1_2/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/pluginsupport.nim.c -o c_code/1_2/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7locals.nim.c -o c_code/1_2/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7itersgen.nim.c -o c_code/1_2/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7active.nim.c -o c_code/1_2/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semparallel.nim.c -o c_code/1_2/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/sem.nim.c -o c_code/3_2/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgutils.nim.c -o c_code/1_2/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ndi.nim.c -o c_code/1_2/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgendata.nim.c -o c_code/1_2/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgmerge.nim.c -o c_code/1_2/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/enumtostr.nim.c -o c_code/1_2/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.nim.c -o c_code/2_2/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgen.nim.c -o c_code/1_2/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passaux.nim.c -o c_code/1_2/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/depends.nim.c -o c_code/1_2/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modules.nim.c -o c_code/1_2/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/jsgen.nim.c -o c_code/1_2/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/docgen2.nim.c -o c_code/3_2/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/main.nim.c -o c_code/1_2/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/scriptconfig.nim.c -o c_code/3_2/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/cmdlinehelper.nim.c -o c_code/3_2/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/nim.nim.c -o c_code/3_2/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_2/stdlib_assertions.nim.o \
c_code/1_2/stdlib_dollars.nim.o \
c_code/3_2/stdlib_io.nim.o \
c_code/5_2/stdlib_system.nim.o \
c_code/2_2/stdlib_parseutils.nim.o \
c_code/2_2/stdlib_math.nim.o \
c_code/1_2/stdlib_algorithm.nim.o \
c_code/2_2/stdlib_unicode.nim.o \
c_code/2_2/stdlib_strutils.nim.o \
c_code/2_2/stdlib_pathnorm.nim.o \
c_code/3_2/stdlib_posix.nim.o \
c_code/5_2/stdlib_times.nim.o \
c_code/7_2/stdlib_os.nim.o \
c_code/1_2/stdlib_hashes.nim.o \
c_code/1_2/stdlib_strtabs.nim.o \
c_code/3_2/stdlib_streams.nim.o \
c_code/6_2/stdlib_cpuinfo.nim.o \
c_code/5_2/stdlib_osproc.nim.o \
c_code/1_2/stdlib_sets.nim.o \
c_code/2_2/pathutils.nim.o \
c_code/1_2/ropes.nim.o \
c_code/1_2/stdlib_tables.nim.o \
c_code/1_2/lineinfos.nim.o \
c_code/7_2/platform.nim.o \
c_code/1_2/prefixmatches.nim.o \
c_code/2_2/stdlib_strformat.nim.o \
c_code/2_2/stdlib_terminal.nim.o \
c_code/5_2/options.nim.o \
c_code/3_2/msgs.nim.o \
c_code/1_2/wordrecg.nim.o \
c_code/1_2/idents.nim.o \
c_code/1_2/condsyms.nim.o \
c_code/1_2/stdlib_sha1.nim.o \
c_code/2_2/stdlib_lexbase.nim.o \
c_code/1_2/stdlib_parsejson.nim.o \
c_code/3_2/stdlib_json.nim.o \
c_code/5_2/extccomp.nim.o \
c_code/5_2/nimblecmd.nim.o \
c_code/2_2/stdlib_parseopt.nim.o \
c_code/3_2/commands.nim.o \
c_code/1_2/llstream.nim.o \
c_code/1_2/nimlexbase.nim.o \
c_code/3_2/lexer.nim.o \
c_code/2_2/nimconf.nim.o \
c_code/1_2/stdlib_intsets.nim.o \
c_code/1_2/idgen.nim.o \
c_code/1_2/ast.nim.o \
c_code/1_2/rodutils.nim.o \
c_code/2_2/astalgo.nim.o \
c_code/1_2/parser.nim.o \
c_code/1_2/renderer.nim.o \
c_code/1_2/filters.nim.o \
c_code/1_2/filter__tmpl.nim.o \
c_code/1_2/syntaxes.nim.o \
c_code/1_2/trees.nim.o \
c_code/3_2/types.nim.o \
c_code/1_2/treetab.nim.o \
c_code/1_2/incremental.nim.o \
c_code/1_2/btrees.nim.o \
c_code/1_2/stdlib_md5.nim.o \
c_code/1_2/modulegraphs.nim.o \
c_code/1_2/magicsys.nim.o \
c_code/1_2/bitsets.nim.o \
c_code/1_2/nimsets.nim.o \
c_code/3_2/semfold.nim.o \
c_code/3_2/modulepaths.nim.o \
c_code/1_2/reorder.nim.o \
c_code/1_2/passes.nim.o \
c_code/1_2/vmdef.nim.o \
c_code/1_2/semdata.nim.o \
c_code/1_2/linter.nim.o \
c_code/1_2/nimfix7prettybase.nim.o \
c_code/1_2/lookups.nim.o \
c_code/1_2/semtypinst.nim.o \
c_code/1_2/parampatterns.nim.o \
c_code/1_2/lowerings.nim.o \
c_code/1_2/_7lib7packages7docutils7rstast.nim.o \
c_code/1_2/_7lib7packages7docutils7rst.nim.o \
c_code/1_2/_7lib7packages7docutils7highlite.nim.o \
c_code/3_2/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_2/stdlib_xmltree.nim.o \
c_code/1_2/stdlib_uri.nim.o \
c_code/1_2/stdlib_cgi.nim.o \
c_code/1_2/typesrenderer.nim.o \
c_code/2_2/docgen.nim.o \
c_code/3_2/sigmatch.nim.o \
c_code/1_2/importer.nim.o \
c_code/1_2/procfind.nim.o \
c_code/5_2/pragmas.nim.o \
c_code/1_2/saturate.nim.o \
c_code/1_2/guards.nim.o \
c_code/1_2/sighashes.nim.o \
c_code/1_2/sempass2.nim.o \
c_code/1_2/cgmeth.nim.o \
c_code/1_2/aliases.nim.o \
c_code/1_2/patterns.nim.o \
c_code/1_2/dfa.nim.o \
c_code/1_2/injectdestructors.nim.o \
c_code/1_2/liftlocals.nim.o \
c_code/1_2/lambdalifting.nim.o \
c_code/1_2/closureiters.nim.o \
c_code/1_2/transf.nim.o \
c_code/1_2/vmgen.nim.o \
c_code/3_2/vmdeps.nim.o \
c_code/1_2/vmmarshal.nim.o \
c_code/3_2/gorgeimpl.nim.o \
c_code/1_2/macrocacheimpl.nim.o \
c_code/1_2/evaltempl.nim.o \
c_code/3_2/vm.nim.o \
c_code/1_2/semmacrosanity.nim.o \
c_code/1_2/pluginsupport.nim.o \
c_code/1_2/plugins7locals.nim.o \
c_code/1_2/plugins7itersgen.nim.o \
c_code/1_2/plugins7active.nim.o \
c_code/1_2/semparallel.nim.o \
c_code/3_2/sem.nim.o \
c_code/1_2/ccgutils.nim.o \
c_code/1_2/ndi.nim.o \
c_code/1_2/cgendata.nim.o \
c_code/1_2/ccgmerge.nim.o \
c_code/1_2/enumtostr.nim.o \
c_code/2_2/stdlib_dynlib.nim.o \
c_code/1_2/cgen.nim.o \
c_code/1_2/passaux.nim.o \
c_code/1_2/depends.nim.o \
c_code/1_2/modules.nim.o \
c_code/1_2/jsgen.nim.o \
c_code/3_2/docgen2.nim.o \
c_code/1_2/main.nim.o \
c_code/3_2/scriptconfig.nim.o \
c_code/3_2/cmdlinehelper.nim.o \
c_code/3_2/nim.nim.o $LINK_FLAGS
    ;;
  alpha)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  arm)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  m68k)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mipsel)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips64el)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc64el)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  arm64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  riscv64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  *)
    echo 2>&1 "Error: no C code generated for: [$myos: $mycpu]"
    exit 1
    ;;
  esac
  ;;
dragonfly)
  case $mycpu in
  i386)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_assertions.nim.c -o c_code/1_1/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_dollars.nim.c -o c_code/1_1/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_io.nim.c -o c_code/3_1/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_system.nim.c -o c_code/5_1/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.nim.c -o c_code/2_1/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.nim.c -o c_code/2_1/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_algorithm.nim.c -o c_code/1_1/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.nim.c -o c_code/2_1/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.nim.c -o c_code/2_1/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_pathnorm.nim.c -o c_code/2_1/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_posix.nim.c -o c_code/3_1/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_times.nim.c -o c_code/2_1/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_os.nim.c -o c_code/8_1/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_hashes.nim.c -o c_code/1_1/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strtabs.nim.c -o c_code/1_1/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_streams.nim.c -o c_code/3_1/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_cpuinfo.nim.c -o c_code/8_1/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_osproc.nim.c -o c_code/5_1/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sets.nim.c -o c_code/1_1/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pathutils.nim.c -o c_code/2_1/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ropes.nim.c -o c_code/1_1/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_tables.nim.c -o c_code/1_1/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lineinfos.nim.c -o c_code/1_1/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/platform.nim.c -o c_code/8_1/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/prefixmatches.nim.c -o c_code/1_1/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strformat.nim.c -o c_code/2_1/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.nim.c -o c_code/2_1/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/options.nim.c -o c_code/4_1/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/msgs.nim.c -o c_code/3_1/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/wordrecg.nim.c -o c_code/1_1/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idents.nim.c -o c_code/1_1/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/condsyms.nim.c -o c_code/1_1/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sha1.nim.c -o c_code/1_1/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.nim.c -o c_code/2_1/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parsejson.nim.c -o c_code/1_1/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_json.nim.c -o c_code/3_1/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/extccomp.nim.c -o c_code/4_1/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/nimblecmd.nim.c -o c_code/8_1/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.nim.c -o c_code/2_1/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/commands.nim.c -o c_code/3_1/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/llstream.nim.c -o c_code/1_1/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimlexbase.nim.c -o c_code/1_1/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/lexer.nim.c -o c_code/3_1/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimconf.nim.c -o c_code/2_1/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_intsets.nim.c -o c_code/1_1/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idgen.nim.c -o c_code/1_1/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ast.nim.c -o c_code/1_1/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/rodutils.nim.c -o c_code/1_1/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/astalgo.nim.c -o c_code/2_1/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parser.nim.c -o c_code/1_1/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/renderer.nim.c -o c_code/1_1/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filters.nim.c -o c_code/1_1/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filter__tmpl.nim.c -o c_code/1_1/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/syntaxes.nim.c -o c_code/1_1/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/trees.nim.c -o c_code/1_1/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/types.nim.c -o c_code/3_1/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/treetab.nim.c -o c_code/1_1/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/incremental.nim.c -o c_code/1_1/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/btrees.nim.c -o c_code/1_1/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_md5.nim.c -o c_code/1_1/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulegraphs.nim.c -o c_code/1_1/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/magicsys.nim.c -o c_code/1_1/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/bitsets.nim.c -o c_code/1_1/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimsets.nim.c -o c_code/1_1/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/semfold.nim.c -o c_code/3_1/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/modulepaths.nim.c -o c_code/3_1/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/reorder.nim.c -o c_code/1_1/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passes.nim.c -o c_code/1_1/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdef.nim.c -o c_code/1_1/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semdata.nim.c -o c_code/1_1/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/linter.nim.c -o c_code/1_1/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimfix7prettybase.nim.c -o c_code/1_1/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lookups.nim.c -o c_code/1_1/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semtypinst.nim.c -o c_code/1_1/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parampatterns.nim.c -o c_code/1_1/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lowerings.nim.c -o c_code/1_1/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rstast.nim.c -o c_code/1_1/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rst.nim.c -o c_code/1_1/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7highlite.nim.c -o c_code/1_1/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/_7lib7packages7docutils7rstgen.nim.c -o c_code/8_1/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_xmltree.nim.c -o c_code/1_1/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_uri.nim.c -o c_code/1_1/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cgi.nim.c -o c_code/1_1/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/typesrenderer.nim.c -o c_code/1_1/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docgen.nim.c -o c_code/2_1/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/sigmatch.nim.c -o c_code/3_1/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/importer.nim.c -o c_code/1_1/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/procfind.nim.c -o c_code/1_1/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/pragmas.nim.c -o c_code/3_1/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/saturate.nim.c -o c_code/1_1/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/guards.nim.c -o c_code/1_1/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sighashes.nim.c -o c_code/1_1/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sempass2.nim.c -o c_code/1_1/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgmeth.nim.c -o c_code/1_1/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/aliases.nim.c -o c_code/1_1/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/patterns.nim.c -o c_code/1_1/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/dfa.nim.c -o c_code/1_1/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/injectdestructors.nim.c -o c_code/1_1/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/liftlocals.nim.c -o c_code/1_1/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lambdalifting.nim.c -o c_code/1_1/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/closureiters.nim.c -o c_code/1_1/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/transf.nim.c -o c_code/1_1/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmgen.nim.c -o c_code/1_1/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/vmdeps.nim.c -o c_code/3_1/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmmarshal.nim.c -o c_code/1_1/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/gorgeimpl.nim.c -o c_code/3_1/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/macrocacheimpl.nim.c -o c_code/1_1/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/evaltempl.nim.c -o c_code/1_1/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/vm.nim.c -o c_code/8_1/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semmacrosanity.nim.c -o c_code/1_1/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/pluginsupport.nim.c -o c_code/1_1/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7locals.nim.c -o c_code/1_1/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7itersgen.nim.c -o c_code/1_1/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7active.nim.c -o c_code/1_1/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semparallel.nim.c -o c_code/1_1/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/sem.nim.c -o c_code/3_1/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgutils.nim.c -o c_code/1_1/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ndi.nim.c -o c_code/1_1/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgendata.nim.c -o c_code/1_1/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgmerge.nim.c -o c_code/1_1/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/enumtostr.nim.c -o c_code/1_1/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.nim.c -o c_code/2_1/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgen.nim.c -o c_code/1_1/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passaux.nim.c -o c_code/1_1/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/depends.nim.c -o c_code/1_1/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modules.nim.c -o c_code/1_1/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/jsgen.nim.c -o c_code/1_1/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/docgen2.nim.c -o c_code/3_1/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/main.nim.c -o c_code/1_1/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/scriptconfig.nim.c -o c_code/8_1/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/cmdlinehelper.nim.c -o c_code/3_1/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/nim.nim.c -o c_code/3_1/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_1/stdlib_assertions.nim.o \
c_code/1_1/stdlib_dollars.nim.o \
c_code/3_1/stdlib_io.nim.o \
c_code/5_1/stdlib_system.nim.o \
c_code/2_1/stdlib_parseutils.nim.o \
c_code/2_1/stdlib_math.nim.o \
c_code/1_1/stdlib_algorithm.nim.o \
c_code/2_1/stdlib_unicode.nim.o \
c_code/2_1/stdlib_strutils.nim.o \
c_code/2_1/stdlib_pathnorm.nim.o \
c_code/3_1/stdlib_posix.nim.o \
c_code/2_1/stdlib_times.nim.o \
c_code/8_1/stdlib_os.nim.o \
c_code/1_1/stdlib_hashes.nim.o \
c_code/1_1/stdlib_strtabs.nim.o \
c_code/3_1/stdlib_streams.nim.o \
c_code/8_1/stdlib_cpuinfo.nim.o \
c_code/5_1/stdlib_osproc.nim.o \
c_code/1_1/stdlib_sets.nim.o \
c_code/2_1/pathutils.nim.o \
c_code/1_1/ropes.nim.o \
c_code/1_1/stdlib_tables.nim.o \
c_code/1_1/lineinfos.nim.o \
c_code/8_1/platform.nim.o \
c_code/1_1/prefixmatches.nim.o \
c_code/2_1/stdlib_strformat.nim.o \
c_code/2_1/stdlib_terminal.nim.o \
c_code/4_1/options.nim.o \
c_code/3_1/msgs.nim.o \
c_code/1_1/wordrecg.nim.o \
c_code/1_1/idents.nim.o \
c_code/1_1/condsyms.nim.o \
c_code/1_1/stdlib_sha1.nim.o \
c_code/2_1/stdlib_lexbase.nim.o \
c_code/1_1/stdlib_parsejson.nim.o \
c_code/3_1/stdlib_json.nim.o \
c_code/4_1/extccomp.nim.o \
c_code/8_1/nimblecmd.nim.o \
c_code/2_1/stdlib_parseopt.nim.o \
c_code/3_1/commands.nim.o \
c_code/1_1/llstream.nim.o \
c_code/1_1/nimlexbase.nim.o \
c_code/3_1/lexer.nim.o \
c_code/2_1/nimconf.nim.o \
c_code/1_1/stdlib_intsets.nim.o \
c_code/1_1/idgen.nim.o \
c_code/1_1/ast.nim.o \
c_code/1_1/rodutils.nim.o \
c_code/2_1/astalgo.nim.o \
c_code/1_1/parser.nim.o \
c_code/1_1/renderer.nim.o \
c_code/1_1/filters.nim.o \
c_code/1_1/filter__tmpl.nim.o \
c_code/1_1/syntaxes.nim.o \
c_code/1_1/trees.nim.o \
c_code/3_1/types.nim.o \
c_code/1_1/treetab.nim.o \
c_code/1_1/incremental.nim.o \
c_code/1_1/btrees.nim.o \
c_code/1_1/stdlib_md5.nim.o \
c_code/1_1/modulegraphs.nim.o \
c_code/1_1/magicsys.nim.o \
c_code/1_1/bitsets.nim.o \
c_code/1_1/nimsets.nim.o \
c_code/3_1/semfold.nim.o \
c_code/3_1/modulepaths.nim.o \
c_code/1_1/reorder.nim.o \
c_code/1_1/passes.nim.o \
c_code/1_1/vmdef.nim.o \
c_code/1_1/semdata.nim.o \
c_code/1_1/linter.nim.o \
c_code/1_1/nimfix7prettybase.nim.o \
c_code/1_1/lookups.nim.o \
c_code/1_1/semtypinst.nim.o \
c_code/1_1/parampatterns.nim.o \
c_code/1_1/lowerings.nim.o \
c_code/1_1/_7lib7packages7docutils7rstast.nim.o \
c_code/1_1/_7lib7packages7docutils7rst.nim.o \
c_code/1_1/_7lib7packages7docutils7highlite.nim.o \
c_code/8_1/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_1/stdlib_xmltree.nim.o \
c_code/1_1/stdlib_uri.nim.o \
c_code/1_1/stdlib_cgi.nim.o \
c_code/1_1/typesrenderer.nim.o \
c_code/2_1/docgen.nim.o \
c_code/3_1/sigmatch.nim.o \
c_code/1_1/importer.nim.o \
c_code/1_1/procfind.nim.o \
c_code/3_1/pragmas.nim.o \
c_code/1_1/saturate.nim.o \
c_code/1_1/guards.nim.o \
c_code/1_1/sighashes.nim.o \
c_code/1_1/sempass2.nim.o \
c_code/1_1/cgmeth.nim.o \
c_code/1_1/aliases.nim.o \
c_code/1_1/patterns.nim.o \
c_code/1_1/dfa.nim.o \
c_code/1_1/injectdestructors.nim.o \
c_code/1_1/liftlocals.nim.o \
c_code/1_1/lambdalifting.nim.o \
c_code/1_1/closureiters.nim.o \
c_code/1_1/transf.nim.o \
c_code/1_1/vmgen.nim.o \
c_code/3_1/vmdeps.nim.o \
c_code/1_1/vmmarshal.nim.o \
c_code/3_1/gorgeimpl.nim.o \
c_code/1_1/macrocacheimpl.nim.o \
c_code/1_1/evaltempl.nim.o \
c_code/8_1/vm.nim.o \
c_code/1_1/semmacrosanity.nim.o \
c_code/1_1/pluginsupport.nim.o \
c_code/1_1/plugins7locals.nim.o \
c_code/1_1/plugins7itersgen.nim.o \
c_code/1_1/plugins7active.nim.o \
c_code/1_1/semparallel.nim.o \
c_code/3_1/sem.nim.o \
c_code/1_1/ccgutils.nim.o \
c_code/1_1/ndi.nim.o \
c_code/1_1/cgendata.nim.o \
c_code/1_1/ccgmerge.nim.o \
c_code/1_1/enumtostr.nim.o \
c_code/2_1/stdlib_dynlib.nim.o \
c_code/1_1/cgen.nim.o \
c_code/1_1/passaux.nim.o \
c_code/1_1/depends.nim.o \
c_code/1_1/modules.nim.o \
c_code/1_1/jsgen.nim.o \
c_code/3_1/docgen2.nim.o \
c_code/1_1/main.nim.o \
c_code/8_1/scriptconfig.nim.o \
c_code/3_1/cmdlinehelper.nim.o \
c_code/3_1/nim.nim.o $LINK_FLAGS
    ;;
  amd64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_assertions.nim.c -o c_code/1_2/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_dollars.nim.c -o c_code/1_2/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_io.nim.c -o c_code/3_2/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_system.nim.c -o c_code/5_2/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.nim.c -o c_code/2_2/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.nim.c -o c_code/2_2/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_algorithm.nim.c -o c_code/1_2/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.nim.c -o c_code/2_2/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.nim.c -o c_code/2_2/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_pathnorm.nim.c -o c_code/2_2/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_posix.nim.c -o c_code/3_2/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_times.nim.c -o c_code/2_2/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_os.nim.c -o c_code/8_2/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_hashes.nim.c -o c_code/1_2/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strtabs.nim.c -o c_code/1_2/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_streams.nim.c -o c_code/3_2/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_cpuinfo.nim.c -o c_code/8_2/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_osproc.nim.c -o c_code/5_2/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sets.nim.c -o c_code/1_2/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/pathutils.nim.c -o c_code/2_2/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ropes.nim.c -o c_code/1_2/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_tables.nim.c -o c_code/1_2/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lineinfos.nim.c -o c_code/1_2/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/platform.nim.c -o c_code/8_2/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/prefixmatches.nim.c -o c_code/1_2/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strformat.nim.c -o c_code/2_2/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.nim.c -o c_code/2_2/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/options.nim.c -o c_code/4_2/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/msgs.nim.c -o c_code/3_2/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/wordrecg.nim.c -o c_code/1_2/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idents.nim.c -o c_code/1_2/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/condsyms.nim.c -o c_code/1_2/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sha1.nim.c -o c_code/1_2/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.nim.c -o c_code/2_2/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parsejson.nim.c -o c_code/1_2/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_json.nim.c -o c_code/3_2/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/extccomp.nim.c -o c_code/4_2/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/nimblecmd.nim.c -o c_code/8_2/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.nim.c -o c_code/2_2/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/commands.nim.c -o c_code/3_2/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/llstream.nim.c -o c_code/1_2/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimlexbase.nim.c -o c_code/1_2/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/lexer.nim.c -o c_code/3_2/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimconf.nim.c -o c_code/2_2/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_intsets.nim.c -o c_code/1_2/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idgen.nim.c -o c_code/1_2/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ast.nim.c -o c_code/1_2/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/rodutils.nim.c -o c_code/1_2/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/astalgo.nim.c -o c_code/2_2/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parser.nim.c -o c_code/1_2/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/renderer.nim.c -o c_code/1_2/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filters.nim.c -o c_code/1_2/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filter__tmpl.nim.c -o c_code/1_2/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/syntaxes.nim.c -o c_code/1_2/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/trees.nim.c -o c_code/1_2/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/types.nim.c -o c_code/3_2/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/treetab.nim.c -o c_code/1_2/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/incremental.nim.c -o c_code/1_2/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/btrees.nim.c -o c_code/1_2/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_md5.nim.c -o c_code/1_2/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulegraphs.nim.c -o c_code/1_2/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/magicsys.nim.c -o c_code/1_2/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/bitsets.nim.c -o c_code/1_2/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimsets.nim.c -o c_code/1_2/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/semfold.nim.c -o c_code/3_2/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/modulepaths.nim.c -o c_code/3_2/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/reorder.nim.c -o c_code/1_2/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passes.nim.c -o c_code/1_2/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdef.nim.c -o c_code/1_2/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semdata.nim.c -o c_code/1_2/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/linter.nim.c -o c_code/1_2/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimfix7prettybase.nim.c -o c_code/1_2/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lookups.nim.c -o c_code/1_2/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semtypinst.nim.c -o c_code/1_2/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parampatterns.nim.c -o c_code/1_2/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lowerings.nim.c -o c_code/1_2/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rstast.nim.c -o c_code/1_2/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rst.nim.c -o c_code/1_2/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7highlite.nim.c -o c_code/1_2/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/_7lib7packages7docutils7rstgen.nim.c -o c_code/8_2/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_xmltree.nim.c -o c_code/1_2/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_uri.nim.c -o c_code/1_2/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cgi.nim.c -o c_code/1_2/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/typesrenderer.nim.c -o c_code/1_2/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docgen.nim.c -o c_code/2_2/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/sigmatch.nim.c -o c_code/3_2/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/importer.nim.c -o c_code/1_2/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/procfind.nim.c -o c_code/1_2/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/pragmas.nim.c -o c_code/3_2/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/saturate.nim.c -o c_code/1_2/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/guards.nim.c -o c_code/1_2/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sighashes.nim.c -o c_code/1_2/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sempass2.nim.c -o c_code/1_2/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgmeth.nim.c -o c_code/1_2/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/aliases.nim.c -o c_code/1_2/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/patterns.nim.c -o c_code/1_2/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/dfa.nim.c -o c_code/1_2/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/injectdestructors.nim.c -o c_code/1_2/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/liftlocals.nim.c -o c_code/1_2/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lambdalifting.nim.c -o c_code/1_2/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/closureiters.nim.c -o c_code/1_2/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/transf.nim.c -o c_code/1_2/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmgen.nim.c -o c_code/1_2/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/vmdeps.nim.c -o c_code/3_2/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmmarshal.nim.c -o c_code/1_2/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/gorgeimpl.nim.c -o c_code/3_2/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/macrocacheimpl.nim.c -o c_code/1_2/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/evaltempl.nim.c -o c_code/1_2/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/vm.nim.c -o c_code/8_2/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semmacrosanity.nim.c -o c_code/1_2/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/pluginsupport.nim.c -o c_code/1_2/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7locals.nim.c -o c_code/1_2/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7itersgen.nim.c -o c_code/1_2/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7active.nim.c -o c_code/1_2/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semparallel.nim.c -o c_code/1_2/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/sem.nim.c -o c_code/3_2/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgutils.nim.c -o c_code/1_2/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ndi.nim.c -o c_code/1_2/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgendata.nim.c -o c_code/1_2/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgmerge.nim.c -o c_code/1_2/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/enumtostr.nim.c -o c_code/1_2/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.nim.c -o c_code/2_2/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgen.nim.c -o c_code/1_2/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passaux.nim.c -o c_code/1_2/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/depends.nim.c -o c_code/1_2/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modules.nim.c -o c_code/1_2/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/jsgen.nim.c -o c_code/1_2/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/docgen2.nim.c -o c_code/3_2/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/main.nim.c -o c_code/1_2/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/scriptconfig.nim.c -o c_code/8_2/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/cmdlinehelper.nim.c -o c_code/3_2/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/nim.nim.c -o c_code/3_2/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_2/stdlib_assertions.nim.o \
c_code/1_2/stdlib_dollars.nim.o \
c_code/3_2/stdlib_io.nim.o \
c_code/5_2/stdlib_system.nim.o \
c_code/2_2/stdlib_parseutils.nim.o \
c_code/2_2/stdlib_math.nim.o \
c_code/1_2/stdlib_algorithm.nim.o \
c_code/2_2/stdlib_unicode.nim.o \
c_code/2_2/stdlib_strutils.nim.o \
c_code/2_2/stdlib_pathnorm.nim.o \
c_code/3_2/stdlib_posix.nim.o \
c_code/2_2/stdlib_times.nim.o \
c_code/8_2/stdlib_os.nim.o \
c_code/1_2/stdlib_hashes.nim.o \
c_code/1_2/stdlib_strtabs.nim.o \
c_code/3_2/stdlib_streams.nim.o \
c_code/8_2/stdlib_cpuinfo.nim.o \
c_code/5_2/stdlib_osproc.nim.o \
c_code/1_2/stdlib_sets.nim.o \
c_code/2_2/pathutils.nim.o \
c_code/1_2/ropes.nim.o \
c_code/1_2/stdlib_tables.nim.o \
c_code/1_2/lineinfos.nim.o \
c_code/8_2/platform.nim.o \
c_code/1_2/prefixmatches.nim.o \
c_code/2_2/stdlib_strformat.nim.o \
c_code/2_2/stdlib_terminal.nim.o \
c_code/4_2/options.nim.o \
c_code/3_2/msgs.nim.o \
c_code/1_2/wordrecg.nim.o \
c_code/1_2/idents.nim.o \
c_code/1_2/condsyms.nim.o \
c_code/1_2/stdlib_sha1.nim.o \
c_code/2_2/stdlib_lexbase.nim.o \
c_code/1_2/stdlib_parsejson.nim.o \
c_code/3_2/stdlib_json.nim.o \
c_code/4_2/extccomp.nim.o \
c_code/8_2/nimblecmd.nim.o \
c_code/2_2/stdlib_parseopt.nim.o \
c_code/3_2/commands.nim.o \
c_code/1_2/llstream.nim.o \
c_code/1_2/nimlexbase.nim.o \
c_code/3_2/lexer.nim.o \
c_code/2_2/nimconf.nim.o \
c_code/1_2/stdlib_intsets.nim.o \
c_code/1_2/idgen.nim.o \
c_code/1_2/ast.nim.o \
c_code/1_2/rodutils.nim.o \
c_code/2_2/astalgo.nim.o \
c_code/1_2/parser.nim.o \
c_code/1_2/renderer.nim.o \
c_code/1_2/filters.nim.o \
c_code/1_2/filter__tmpl.nim.o \
c_code/1_2/syntaxes.nim.o \
c_code/1_2/trees.nim.o \
c_code/3_2/types.nim.o \
c_code/1_2/treetab.nim.o \
c_code/1_2/incremental.nim.o \
c_code/1_2/btrees.nim.o \
c_code/1_2/stdlib_md5.nim.o \
c_code/1_2/modulegraphs.nim.o \
c_code/1_2/magicsys.nim.o \
c_code/1_2/bitsets.nim.o \
c_code/1_2/nimsets.nim.o \
c_code/3_2/semfold.nim.o \
c_code/3_2/modulepaths.nim.o \
c_code/1_2/reorder.nim.o \
c_code/1_2/passes.nim.o \
c_code/1_2/vmdef.nim.o \
c_code/1_2/semdata.nim.o \
c_code/1_2/linter.nim.o \
c_code/1_2/nimfix7prettybase.nim.o \
c_code/1_2/lookups.nim.o \
c_code/1_2/semtypinst.nim.o \
c_code/1_2/parampatterns.nim.o \
c_code/1_2/lowerings.nim.o \
c_code/1_2/_7lib7packages7docutils7rstast.nim.o \
c_code/1_2/_7lib7packages7docutils7rst.nim.o \
c_code/1_2/_7lib7packages7docutils7highlite.nim.o \
c_code/8_2/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_2/stdlib_xmltree.nim.o \
c_code/1_2/stdlib_uri.nim.o \
c_code/1_2/stdlib_cgi.nim.o \
c_code/1_2/typesrenderer.nim.o \
c_code/2_2/docgen.nim.o \
c_code/3_2/sigmatch.nim.o \
c_code/1_2/importer.nim.o \
c_code/1_2/procfind.nim.o \
c_code/3_2/pragmas.nim.o \
c_code/1_2/saturate.nim.o \
c_code/1_2/guards.nim.o \
c_code/1_2/sighashes.nim.o \
c_code/1_2/sempass2.nim.o \
c_code/1_2/cgmeth.nim.o \
c_code/1_2/aliases.nim.o \
c_code/1_2/patterns.nim.o \
c_code/1_2/dfa.nim.o \
c_code/1_2/injectdestructors.nim.o \
c_code/1_2/liftlocals.nim.o \
c_code/1_2/lambdalifting.nim.o \
c_code/1_2/closureiters.nim.o \
c_code/1_2/transf.nim.o \
c_code/1_2/vmgen.nim.o \
c_code/3_2/vmdeps.nim.o \
c_code/1_2/vmmarshal.nim.o \
c_code/3_2/gorgeimpl.nim.o \
c_code/1_2/macrocacheimpl.nim.o \
c_code/1_2/evaltempl.nim.o \
c_code/8_2/vm.nim.o \
c_code/1_2/semmacrosanity.nim.o \
c_code/1_2/pluginsupport.nim.o \
c_code/1_2/plugins7locals.nim.o \
c_code/1_2/plugins7itersgen.nim.o \
c_code/1_2/plugins7active.nim.o \
c_code/1_2/semparallel.nim.o \
c_code/3_2/sem.nim.o \
c_code/1_2/ccgutils.nim.o \
c_code/1_2/ndi.nim.o \
c_code/1_2/cgendata.nim.o \
c_code/1_2/ccgmerge.nim.o \
c_code/1_2/enumtostr.nim.o \
c_code/2_2/stdlib_dynlib.nim.o \
c_code/1_2/cgen.nim.o \
c_code/1_2/passaux.nim.o \
c_code/1_2/depends.nim.o \
c_code/1_2/modules.nim.o \
c_code/1_2/jsgen.nim.o \
c_code/3_2/docgen2.nim.o \
c_code/1_2/main.nim.o \
c_code/8_2/scriptconfig.nim.o \
c_code/3_2/cmdlinehelper.nim.o \
c_code/3_2/nim.nim.o $LINK_FLAGS
    ;;
  alpha)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  arm)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  m68k)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mipsel)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips64el)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc64el)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  arm64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  riscv64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
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
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_assertions.nim.c -o c_code/1_1/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_dollars.nim.c -o c_code/1_1/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_io.nim.c -o c_code/2_1/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/9_1/stdlib_system.nim.c -o c_code/9_1/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.nim.c -o c_code/2_1/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.nim.c -o c_code/2_1/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_algorithm.nim.c -o c_code/1_1/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.nim.c -o c_code/2_1/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.nim.c -o c_code/2_1/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_pathnorm.nim.c -o c_code/2_1/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_posix.nim.c -o c_code/3_1/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_times.nim.c -o c_code/4_1/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/9_1/stdlib_os.nim.c -o c_code/9_1/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_hashes.nim.c -o c_code/1_1/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strtabs.nim.c -o c_code/1_1/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_streams.nim.c -o c_code/2_1/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/9_1/stdlib_cpuinfo.nim.c -o c_code/9_1/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/9_1/stdlib_osproc.nim.c -o c_code/9_1/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sets.nim.c -o c_code/1_1/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pathutils.nim.c -o c_code/2_1/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ropes.nim.c -o c_code/1_1/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_tables.nim.c -o c_code/1_1/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lineinfos.nim.c -o c_code/1_1/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/9_1/platform.nim.c -o c_code/9_1/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/prefixmatches.nim.c -o c_code/1_1/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strformat.nim.c -o c_code/2_1/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.nim.c -o c_code/2_1/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/options.nim.c -o c_code/2_1/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/msgs.nim.c -o c_code/2_1/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/wordrecg.nim.c -o c_code/1_1/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idents.nim.c -o c_code/1_1/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/condsyms.nim.c -o c_code/1_1/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sha1.nim.c -o c_code/1_1/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.nim.c -o c_code/2_1/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parsejson.nim.c -o c_code/1_1/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_json.nim.c -o c_code/1_1/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/extccomp.nim.c -o c_code/2_1/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/9_1/nimblecmd.nim.c -o c_code/9_1/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.nim.c -o c_code/2_1/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/commands.nim.c -o c_code/1_1/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/llstream.nim.c -o c_code/1_1/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimlexbase.nim.c -o c_code/1_1/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lexer.nim.c -o c_code/1_1/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimconf.nim.c -o c_code/2_1/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_intsets.nim.c -o c_code/1_1/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idgen.nim.c -o c_code/1_1/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ast.nim.c -o c_code/1_1/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/rodutils.nim.c -o c_code/1_1/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/astalgo.nim.c -o c_code/2_1/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parser.nim.c -o c_code/1_1/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/renderer.nim.c -o c_code/1_1/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filters.nim.c -o c_code/1_1/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filter__tmpl.nim.c -o c_code/1_1/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/syntaxes.nim.c -o c_code/1_1/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/trees.nim.c -o c_code/1_1/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/types.nim.c -o c_code/1_1/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/treetab.nim.c -o c_code/1_1/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/incremental.nim.c -o c_code/1_1/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/btrees.nim.c -o c_code/1_1/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_md5.nim.c -o c_code/1_1/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulegraphs.nim.c -o c_code/1_1/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/magicsys.nim.c -o c_code/1_1/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/bitsets.nim.c -o c_code/1_1/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimsets.nim.c -o c_code/1_1/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semfold.nim.c -o c_code/1_1/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulepaths.nim.c -o c_code/1_1/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/reorder.nim.c -o c_code/1_1/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passes.nim.c -o c_code/1_1/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdef.nim.c -o c_code/1_1/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semdata.nim.c -o c_code/1_1/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/linter.nim.c -o c_code/1_1/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimfix7prettybase.nim.c -o c_code/1_1/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lookups.nim.c -o c_code/1_1/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semtypinst.nim.c -o c_code/1_1/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parampatterns.nim.c -o c_code/1_1/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lowerings.nim.c -o c_code/1_1/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rstast.nim.c -o c_code/1_1/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rst.nim.c -o c_code/1_1/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7highlite.nim.c -o c_code/1_1/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/9_1/_7lib7packages7docutils7rstgen.nim.c -o c_code/9_1/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_xmltree.nim.c -o c_code/1_1/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_uri.nim.c -o c_code/1_1/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cgi.nim.c -o c_code/1_1/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/typesrenderer.nim.c -o c_code/1_1/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docgen.nim.c -o c_code/2_1/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sigmatch.nim.c -o c_code/1_1/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/importer.nim.c -o c_code/1_1/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/procfind.nim.c -o c_code/1_1/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pragmas.nim.c -o c_code/2_1/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/saturate.nim.c -o c_code/1_1/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/guards.nim.c -o c_code/1_1/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sighashes.nim.c -o c_code/1_1/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sempass2.nim.c -o c_code/1_1/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgmeth.nim.c -o c_code/1_1/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/aliases.nim.c -o c_code/1_1/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/patterns.nim.c -o c_code/1_1/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/dfa.nim.c -o c_code/1_1/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/injectdestructors.nim.c -o c_code/1_1/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/liftlocals.nim.c -o c_code/1_1/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lambdalifting.nim.c -o c_code/1_1/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/closureiters.nim.c -o c_code/1_1/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/transf.nim.c -o c_code/1_1/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmgen.nim.c -o c_code/1_1/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdeps.nim.c -o c_code/1_1/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmmarshal.nim.c -o c_code/1_1/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/gorgeimpl.nim.c -o c_code/2_1/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/macrocacheimpl.nim.c -o c_code/1_1/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/evaltempl.nim.c -o c_code/1_1/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/9_1/vm.nim.c -o c_code/9_1/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semmacrosanity.nim.c -o c_code/1_1/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/pluginsupport.nim.c -o c_code/1_1/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7locals.nim.c -o c_code/1_1/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7itersgen.nim.c -o c_code/1_1/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7active.nim.c -o c_code/1_1/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semparallel.nim.c -o c_code/1_1/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sem.nim.c -o c_code/1_1/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgutils.nim.c -o c_code/1_1/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ndi.nim.c -o c_code/1_1/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgendata.nim.c -o c_code/1_1/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgmerge.nim.c -o c_code/1_1/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/enumtostr.nim.c -o c_code/1_1/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.nim.c -o c_code/2_1/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgen.nim.c -o c_code/1_1/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passaux.nim.c -o c_code/1_1/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/depends.nim.c -o c_code/1_1/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modules.nim.c -o c_code/1_1/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/jsgen.nim.c -o c_code/1_1/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/docgen2.nim.c -o c_code/1_1/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/main.nim.c -o c_code/1_1/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/9_1/scriptconfig.nim.c -o c_code/9_1/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/cmdlinehelper.nim.c -o c_code/2_1/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/nim.nim.c -o c_code/3_1/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_1/stdlib_assertions.nim.o \
c_code/1_1/stdlib_dollars.nim.o \
c_code/2_1/stdlib_io.nim.o \
c_code/9_1/stdlib_system.nim.o \
c_code/2_1/stdlib_parseutils.nim.o \
c_code/2_1/stdlib_math.nim.o \
c_code/1_1/stdlib_algorithm.nim.o \
c_code/2_1/stdlib_unicode.nim.o \
c_code/2_1/stdlib_strutils.nim.o \
c_code/2_1/stdlib_pathnorm.nim.o \
c_code/3_1/stdlib_posix.nim.o \
c_code/4_1/stdlib_times.nim.o \
c_code/9_1/stdlib_os.nim.o \
c_code/1_1/stdlib_hashes.nim.o \
c_code/1_1/stdlib_strtabs.nim.o \
c_code/2_1/stdlib_streams.nim.o \
c_code/9_1/stdlib_cpuinfo.nim.o \
c_code/9_1/stdlib_osproc.nim.o \
c_code/1_1/stdlib_sets.nim.o \
c_code/2_1/pathutils.nim.o \
c_code/1_1/ropes.nim.o \
c_code/1_1/stdlib_tables.nim.o \
c_code/1_1/lineinfos.nim.o \
c_code/9_1/platform.nim.o \
c_code/1_1/prefixmatches.nim.o \
c_code/2_1/stdlib_strformat.nim.o \
c_code/2_1/stdlib_terminal.nim.o \
c_code/2_1/options.nim.o \
c_code/2_1/msgs.nim.o \
c_code/1_1/wordrecg.nim.o \
c_code/1_1/idents.nim.o \
c_code/1_1/condsyms.nim.o \
c_code/1_1/stdlib_sha1.nim.o \
c_code/2_1/stdlib_lexbase.nim.o \
c_code/1_1/stdlib_parsejson.nim.o \
c_code/1_1/stdlib_json.nim.o \
c_code/2_1/extccomp.nim.o \
c_code/9_1/nimblecmd.nim.o \
c_code/2_1/stdlib_parseopt.nim.o \
c_code/1_1/commands.nim.o \
c_code/1_1/llstream.nim.o \
c_code/1_1/nimlexbase.nim.o \
c_code/1_1/lexer.nim.o \
c_code/2_1/nimconf.nim.o \
c_code/1_1/stdlib_intsets.nim.o \
c_code/1_1/idgen.nim.o \
c_code/1_1/ast.nim.o \
c_code/1_1/rodutils.nim.o \
c_code/2_1/astalgo.nim.o \
c_code/1_1/parser.nim.o \
c_code/1_1/renderer.nim.o \
c_code/1_1/filters.nim.o \
c_code/1_1/filter__tmpl.nim.o \
c_code/1_1/syntaxes.nim.o \
c_code/1_1/trees.nim.o \
c_code/1_1/types.nim.o \
c_code/1_1/treetab.nim.o \
c_code/1_1/incremental.nim.o \
c_code/1_1/btrees.nim.o \
c_code/1_1/stdlib_md5.nim.o \
c_code/1_1/modulegraphs.nim.o \
c_code/1_1/magicsys.nim.o \
c_code/1_1/bitsets.nim.o \
c_code/1_1/nimsets.nim.o \
c_code/1_1/semfold.nim.o \
c_code/1_1/modulepaths.nim.o \
c_code/1_1/reorder.nim.o \
c_code/1_1/passes.nim.o \
c_code/1_1/vmdef.nim.o \
c_code/1_1/semdata.nim.o \
c_code/1_1/linter.nim.o \
c_code/1_1/nimfix7prettybase.nim.o \
c_code/1_1/lookups.nim.o \
c_code/1_1/semtypinst.nim.o \
c_code/1_1/parampatterns.nim.o \
c_code/1_1/lowerings.nim.o \
c_code/1_1/_7lib7packages7docutils7rstast.nim.o \
c_code/1_1/_7lib7packages7docutils7rst.nim.o \
c_code/1_1/_7lib7packages7docutils7highlite.nim.o \
c_code/9_1/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_1/stdlib_xmltree.nim.o \
c_code/1_1/stdlib_uri.nim.o \
c_code/1_1/stdlib_cgi.nim.o \
c_code/1_1/typesrenderer.nim.o \
c_code/2_1/docgen.nim.o \
c_code/1_1/sigmatch.nim.o \
c_code/1_1/importer.nim.o \
c_code/1_1/procfind.nim.o \
c_code/2_1/pragmas.nim.o \
c_code/1_1/saturate.nim.o \
c_code/1_1/guards.nim.o \
c_code/1_1/sighashes.nim.o \
c_code/1_1/sempass2.nim.o \
c_code/1_1/cgmeth.nim.o \
c_code/1_1/aliases.nim.o \
c_code/1_1/patterns.nim.o \
c_code/1_1/dfa.nim.o \
c_code/1_1/injectdestructors.nim.o \
c_code/1_1/liftlocals.nim.o \
c_code/1_1/lambdalifting.nim.o \
c_code/1_1/closureiters.nim.o \
c_code/1_1/transf.nim.o \
c_code/1_1/vmgen.nim.o \
c_code/1_1/vmdeps.nim.o \
c_code/1_1/vmmarshal.nim.o \
c_code/2_1/gorgeimpl.nim.o \
c_code/1_1/macrocacheimpl.nim.o \
c_code/1_1/evaltempl.nim.o \
c_code/9_1/vm.nim.o \
c_code/1_1/semmacrosanity.nim.o \
c_code/1_1/pluginsupport.nim.o \
c_code/1_1/plugins7locals.nim.o \
c_code/1_1/plugins7itersgen.nim.o \
c_code/1_1/plugins7active.nim.o \
c_code/1_1/semparallel.nim.o \
c_code/1_1/sem.nim.o \
c_code/1_1/ccgutils.nim.o \
c_code/1_1/ndi.nim.o \
c_code/1_1/cgendata.nim.o \
c_code/1_1/ccgmerge.nim.o \
c_code/1_1/enumtostr.nim.o \
c_code/2_1/stdlib_dynlib.nim.o \
c_code/1_1/cgen.nim.o \
c_code/1_1/passaux.nim.o \
c_code/1_1/depends.nim.o \
c_code/1_1/modules.nim.o \
c_code/1_1/jsgen.nim.o \
c_code/1_1/docgen2.nim.o \
c_code/1_1/main.nim.o \
c_code/9_1/scriptconfig.nim.o \
c_code/2_1/cmdlinehelper.nim.o \
c_code/3_1/nim.nim.o $LINK_FLAGS
    ;;
  amd64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_assertions.nim.c -o c_code/1_2/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_dollars.nim.c -o c_code/1_2/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_io.nim.c -o c_code/2_3/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/9_2/stdlib_system.nim.c -o c_code/9_2/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.nim.c -o c_code/2_2/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.nim.c -o c_code/2_2/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_algorithm.nim.c -o c_code/1_2/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.nim.c -o c_code/2_2/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.nim.c -o c_code/2_2/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_pathnorm.nim.c -o c_code/2_2/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_posix.nim.c -o c_code/3_2/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_times.nim.c -o c_code/4_2/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/9_2/stdlib_os.nim.c -o c_code/9_2/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_hashes.nim.c -o c_code/1_2/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strtabs.nim.c -o c_code/1_2/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_streams.nim.c -o c_code/2_3/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/9_2/stdlib_cpuinfo.nim.c -o c_code/9_2/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/9_2/stdlib_osproc.nim.c -o c_code/9_2/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sets.nim.c -o c_code/1_2/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/pathutils.nim.c -o c_code/2_2/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ropes.nim.c -o c_code/1_2/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_tables.nim.c -o c_code/1_2/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lineinfos.nim.c -o c_code/1_2/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/9_2/platform.nim.c -o c_code/9_2/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/prefixmatches.nim.c -o c_code/1_2/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strformat.nim.c -o c_code/2_2/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.nim.c -o c_code/2_2/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/options.nim.c -o c_code/2_3/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/msgs.nim.c -o c_code/2_3/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/wordrecg.nim.c -o c_code/1_2/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idents.nim.c -o c_code/1_2/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/condsyms.nim.c -o c_code/1_2/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sha1.nim.c -o c_code/1_2/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.nim.c -o c_code/2_2/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parsejson.nim.c -o c_code/1_2/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_json.nim.c -o c_code/1_2/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/extccomp.nim.c -o c_code/2_3/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/9_2/nimblecmd.nim.c -o c_code/9_2/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.nim.c -o c_code/2_2/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/commands.nim.c -o c_code/1_2/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/llstream.nim.c -o c_code/1_2/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimlexbase.nim.c -o c_code/1_2/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lexer.nim.c -o c_code/1_2/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimconf.nim.c -o c_code/2_2/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_intsets.nim.c -o c_code/1_2/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idgen.nim.c -o c_code/1_2/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ast.nim.c -o c_code/1_2/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/rodutils.nim.c -o c_code/1_2/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/astalgo.nim.c -o c_code/2_2/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parser.nim.c -o c_code/1_2/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/renderer.nim.c -o c_code/1_2/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filters.nim.c -o c_code/1_2/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filter__tmpl.nim.c -o c_code/1_2/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/syntaxes.nim.c -o c_code/1_2/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/trees.nim.c -o c_code/1_2/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/types.nim.c -o c_code/1_2/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/treetab.nim.c -o c_code/1_2/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/incremental.nim.c -o c_code/1_2/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/btrees.nim.c -o c_code/1_2/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_md5.nim.c -o c_code/1_2/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulegraphs.nim.c -o c_code/1_2/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/magicsys.nim.c -o c_code/1_2/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/bitsets.nim.c -o c_code/1_2/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimsets.nim.c -o c_code/1_2/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semfold.nim.c -o c_code/1_2/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulepaths.nim.c -o c_code/1_2/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/reorder.nim.c -o c_code/1_2/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passes.nim.c -o c_code/1_2/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdef.nim.c -o c_code/1_2/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semdata.nim.c -o c_code/1_2/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/linter.nim.c -o c_code/1_2/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimfix7prettybase.nim.c -o c_code/1_2/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lookups.nim.c -o c_code/1_2/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semtypinst.nim.c -o c_code/1_2/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parampatterns.nim.c -o c_code/1_2/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lowerings.nim.c -o c_code/1_2/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rstast.nim.c -o c_code/1_2/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rst.nim.c -o c_code/1_2/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7highlite.nim.c -o c_code/1_2/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/9_2/_7lib7packages7docutils7rstgen.nim.c -o c_code/9_2/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_xmltree.nim.c -o c_code/1_2/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_uri.nim.c -o c_code/1_2/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cgi.nim.c -o c_code/1_2/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/typesrenderer.nim.c -o c_code/1_2/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docgen.nim.c -o c_code/2_2/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sigmatch.nim.c -o c_code/1_2/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/importer.nim.c -o c_code/1_2/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/procfind.nim.c -o c_code/1_2/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/pragmas.nim.c -o c_code/2_3/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/saturate.nim.c -o c_code/1_2/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/guards.nim.c -o c_code/1_2/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sighashes.nim.c -o c_code/1_2/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sempass2.nim.c -o c_code/1_2/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgmeth.nim.c -o c_code/1_2/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/aliases.nim.c -o c_code/1_2/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/patterns.nim.c -o c_code/1_2/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/dfa.nim.c -o c_code/1_2/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/injectdestructors.nim.c -o c_code/1_2/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/liftlocals.nim.c -o c_code/1_2/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lambdalifting.nim.c -o c_code/1_2/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/closureiters.nim.c -o c_code/1_2/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/transf.nim.c -o c_code/1_2/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmgen.nim.c -o c_code/1_2/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdeps.nim.c -o c_code/1_2/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmmarshal.nim.c -o c_code/1_2/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/gorgeimpl.nim.c -o c_code/2_3/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/macrocacheimpl.nim.c -o c_code/1_2/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/evaltempl.nim.c -o c_code/1_2/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/9_2/vm.nim.c -o c_code/9_2/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semmacrosanity.nim.c -o c_code/1_2/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/pluginsupport.nim.c -o c_code/1_2/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7locals.nim.c -o c_code/1_2/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7itersgen.nim.c -o c_code/1_2/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7active.nim.c -o c_code/1_2/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semparallel.nim.c -o c_code/1_2/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sem.nim.c -o c_code/1_2/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgutils.nim.c -o c_code/1_2/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ndi.nim.c -o c_code/1_2/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgendata.nim.c -o c_code/1_2/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgmerge.nim.c -o c_code/1_2/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/enumtostr.nim.c -o c_code/1_2/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.nim.c -o c_code/2_2/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgen.nim.c -o c_code/1_2/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passaux.nim.c -o c_code/1_2/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/depends.nim.c -o c_code/1_2/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modules.nim.c -o c_code/1_2/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/jsgen.nim.c -o c_code/1_2/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/docgen2.nim.c -o c_code/1_2/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/main.nim.c -o c_code/1_2/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/9_2/scriptconfig.nim.c -o c_code/9_2/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/cmdlinehelper.nim.c -o c_code/2_3/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/nim.nim.c -o c_code/3_2/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_2/stdlib_assertions.nim.o \
c_code/1_2/stdlib_dollars.nim.o \
c_code/2_3/stdlib_io.nim.o \
c_code/9_2/stdlib_system.nim.o \
c_code/2_2/stdlib_parseutils.nim.o \
c_code/2_2/stdlib_math.nim.o \
c_code/1_2/stdlib_algorithm.nim.o \
c_code/2_2/stdlib_unicode.nim.o \
c_code/2_2/stdlib_strutils.nim.o \
c_code/2_2/stdlib_pathnorm.nim.o \
c_code/3_2/stdlib_posix.nim.o \
c_code/4_2/stdlib_times.nim.o \
c_code/9_2/stdlib_os.nim.o \
c_code/1_2/stdlib_hashes.nim.o \
c_code/1_2/stdlib_strtabs.nim.o \
c_code/2_3/stdlib_streams.nim.o \
c_code/9_2/stdlib_cpuinfo.nim.o \
c_code/9_2/stdlib_osproc.nim.o \
c_code/1_2/stdlib_sets.nim.o \
c_code/2_2/pathutils.nim.o \
c_code/1_2/ropes.nim.o \
c_code/1_2/stdlib_tables.nim.o \
c_code/1_2/lineinfos.nim.o \
c_code/9_2/platform.nim.o \
c_code/1_2/prefixmatches.nim.o \
c_code/2_2/stdlib_strformat.nim.o \
c_code/2_2/stdlib_terminal.nim.o \
c_code/2_3/options.nim.o \
c_code/2_3/msgs.nim.o \
c_code/1_2/wordrecg.nim.o \
c_code/1_2/idents.nim.o \
c_code/1_2/condsyms.nim.o \
c_code/1_2/stdlib_sha1.nim.o \
c_code/2_2/stdlib_lexbase.nim.o \
c_code/1_2/stdlib_parsejson.nim.o \
c_code/1_2/stdlib_json.nim.o \
c_code/2_3/extccomp.nim.o \
c_code/9_2/nimblecmd.nim.o \
c_code/2_2/stdlib_parseopt.nim.o \
c_code/1_2/commands.nim.o \
c_code/1_2/llstream.nim.o \
c_code/1_2/nimlexbase.nim.o \
c_code/1_2/lexer.nim.o \
c_code/2_2/nimconf.nim.o \
c_code/1_2/stdlib_intsets.nim.o \
c_code/1_2/idgen.nim.o \
c_code/1_2/ast.nim.o \
c_code/1_2/rodutils.nim.o \
c_code/2_2/astalgo.nim.o \
c_code/1_2/parser.nim.o \
c_code/1_2/renderer.nim.o \
c_code/1_2/filters.nim.o \
c_code/1_2/filter__tmpl.nim.o \
c_code/1_2/syntaxes.nim.o \
c_code/1_2/trees.nim.o \
c_code/1_2/types.nim.o \
c_code/1_2/treetab.nim.o \
c_code/1_2/incremental.nim.o \
c_code/1_2/btrees.nim.o \
c_code/1_2/stdlib_md5.nim.o \
c_code/1_2/modulegraphs.nim.o \
c_code/1_2/magicsys.nim.o \
c_code/1_2/bitsets.nim.o \
c_code/1_2/nimsets.nim.o \
c_code/1_2/semfold.nim.o \
c_code/1_2/modulepaths.nim.o \
c_code/1_2/reorder.nim.o \
c_code/1_2/passes.nim.o \
c_code/1_2/vmdef.nim.o \
c_code/1_2/semdata.nim.o \
c_code/1_2/linter.nim.o \
c_code/1_2/nimfix7prettybase.nim.o \
c_code/1_2/lookups.nim.o \
c_code/1_2/semtypinst.nim.o \
c_code/1_2/parampatterns.nim.o \
c_code/1_2/lowerings.nim.o \
c_code/1_2/_7lib7packages7docutils7rstast.nim.o \
c_code/1_2/_7lib7packages7docutils7rst.nim.o \
c_code/1_2/_7lib7packages7docutils7highlite.nim.o \
c_code/9_2/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_2/stdlib_xmltree.nim.o \
c_code/1_2/stdlib_uri.nim.o \
c_code/1_2/stdlib_cgi.nim.o \
c_code/1_2/typesrenderer.nim.o \
c_code/2_2/docgen.nim.o \
c_code/1_2/sigmatch.nim.o \
c_code/1_2/importer.nim.o \
c_code/1_2/procfind.nim.o \
c_code/2_3/pragmas.nim.o \
c_code/1_2/saturate.nim.o \
c_code/1_2/guards.nim.o \
c_code/1_2/sighashes.nim.o \
c_code/1_2/sempass2.nim.o \
c_code/1_2/cgmeth.nim.o \
c_code/1_2/aliases.nim.o \
c_code/1_2/patterns.nim.o \
c_code/1_2/dfa.nim.o \
c_code/1_2/injectdestructors.nim.o \
c_code/1_2/liftlocals.nim.o \
c_code/1_2/lambdalifting.nim.o \
c_code/1_2/closureiters.nim.o \
c_code/1_2/transf.nim.o \
c_code/1_2/vmgen.nim.o \
c_code/1_2/vmdeps.nim.o \
c_code/1_2/vmmarshal.nim.o \
c_code/2_3/gorgeimpl.nim.o \
c_code/1_2/macrocacheimpl.nim.o \
c_code/1_2/evaltempl.nim.o \
c_code/9_2/vm.nim.o \
c_code/1_2/semmacrosanity.nim.o \
c_code/1_2/pluginsupport.nim.o \
c_code/1_2/plugins7locals.nim.o \
c_code/1_2/plugins7itersgen.nim.o \
c_code/1_2/plugins7active.nim.o \
c_code/1_2/semparallel.nim.o \
c_code/1_2/sem.nim.o \
c_code/1_2/ccgutils.nim.o \
c_code/1_2/ndi.nim.o \
c_code/1_2/cgendata.nim.o \
c_code/1_2/ccgmerge.nim.o \
c_code/1_2/enumtostr.nim.o \
c_code/2_2/stdlib_dynlib.nim.o \
c_code/1_2/cgen.nim.o \
c_code/1_2/passaux.nim.o \
c_code/1_2/depends.nim.o \
c_code/1_2/modules.nim.o \
c_code/1_2/jsgen.nim.o \
c_code/1_2/docgen2.nim.o \
c_code/1_2/main.nim.o \
c_code/9_2/scriptconfig.nim.o \
c_code/2_3/cmdlinehelper.nim.o \
c_code/3_2/nim.nim.o $LINK_FLAGS
    ;;
  alpha)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  arm)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  m68k)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mipsel)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips64el)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc64el)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  arm64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  riscv64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  *)
    echo 2>&1 "Error: no C code generated for: [$myos: $mycpu]"
    exit 1
    ;;
  esac
  ;;
android)
  case $mycpu in
  i386)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_assertions.nim.c -o c_code/1_1/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_dollars.nim.c -o c_code/1_1/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/10_1/stdlib_io.nim.c -o c_code/10_1/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_system.nim.c -o c_code/2_1/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.nim.c -o c_code/2_1/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.nim.c -o c_code/2_1/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_algorithm.nim.c -o c_code/1_1/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.nim.c -o c_code/2_1/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.nim.c -o c_code/2_1/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_pathnorm.nim.c -o c_code/2_1/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/10_1/stdlib_posix.nim.c -o c_code/10_1/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_times.nim.c -o c_code/2_1/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_os.nim.c -o c_code/2_1/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_hashes.nim.c -o c_code/1_1/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strtabs.nim.c -o c_code/1_1/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_streams.nim.c -o c_code/2_1/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cpuinfo.nim.c -o c_code/2_1/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/10_1/stdlib_osproc.nim.c -o c_code/10_1/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sets.nim.c -o c_code/1_1/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pathutils.nim.c -o c_code/2_1/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ropes.nim.c -o c_code/1_1/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_tables.nim.c -o c_code/1_1/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lineinfos.nim.c -o c_code/1_1/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/10_1/platform.nim.c -o c_code/10_1/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/prefixmatches.nim.c -o c_code/1_1/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strformat.nim.c -o c_code/2_1/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.nim.c -o c_code/2_1/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/options.nim.c -o c_code/2_1/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/msgs.nim.c -o c_code/2_1/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/wordrecg.nim.c -o c_code/1_1/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idents.nim.c -o c_code/1_1/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/condsyms.nim.c -o c_code/1_1/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sha1.nim.c -o c_code/1_1/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.nim.c -o c_code/2_1/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parsejson.nim.c -o c_code/1_1/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_json.nim.c -o c_code/1_1/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/extccomp.nim.c -o c_code/2_1/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimblecmd.nim.c -o c_code/2_1/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.nim.c -o c_code/2_1/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/commands.nim.c -o c_code/1_1/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/llstream.nim.c -o c_code/1_1/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimlexbase.nim.c -o c_code/1_1/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lexer.nim.c -o c_code/1_1/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimconf.nim.c -o c_code/2_1/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_intsets.nim.c -o c_code/1_1/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idgen.nim.c -o c_code/1_1/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ast.nim.c -o c_code/1_1/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/rodutils.nim.c -o c_code/1_1/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/astalgo.nim.c -o c_code/2_1/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parser.nim.c -o c_code/1_1/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/renderer.nim.c -o c_code/1_1/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filters.nim.c -o c_code/1_1/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filter__tmpl.nim.c -o c_code/1_1/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/syntaxes.nim.c -o c_code/1_1/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/trees.nim.c -o c_code/1_1/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/types.nim.c -o c_code/1_1/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/treetab.nim.c -o c_code/1_1/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/incremental.nim.c -o c_code/1_1/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/btrees.nim.c -o c_code/1_1/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_md5.nim.c -o c_code/1_1/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulegraphs.nim.c -o c_code/1_1/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/magicsys.nim.c -o c_code/1_1/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/bitsets.nim.c -o c_code/1_1/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimsets.nim.c -o c_code/1_1/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semfold.nim.c -o c_code/1_1/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulepaths.nim.c -o c_code/1_1/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/reorder.nim.c -o c_code/1_1/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passes.nim.c -o c_code/1_1/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdef.nim.c -o c_code/1_1/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semdata.nim.c -o c_code/1_1/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/linter.nim.c -o c_code/1_1/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimfix7prettybase.nim.c -o c_code/1_1/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lookups.nim.c -o c_code/1_1/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semtypinst.nim.c -o c_code/1_1/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parampatterns.nim.c -o c_code/1_1/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lowerings.nim.c -o c_code/1_1/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rstast.nim.c -o c_code/1_1/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rst.nim.c -o c_code/1_1/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7highlite.nim.c -o c_code/1_1/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/_7lib7packages7docutils7rstgen.nim.c -o c_code/2_1/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_xmltree.nim.c -o c_code/1_1/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_uri.nim.c -o c_code/1_1/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cgi.nim.c -o c_code/1_1/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/typesrenderer.nim.c -o c_code/1_1/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docgen.nim.c -o c_code/2_1/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sigmatch.nim.c -o c_code/1_1/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/importer.nim.c -o c_code/1_1/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/procfind.nim.c -o c_code/1_1/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pragmas.nim.c -o c_code/2_1/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/saturate.nim.c -o c_code/1_1/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/guards.nim.c -o c_code/1_1/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sighashes.nim.c -o c_code/1_1/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sempass2.nim.c -o c_code/1_1/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgmeth.nim.c -o c_code/1_1/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/aliases.nim.c -o c_code/1_1/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/patterns.nim.c -o c_code/1_1/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/dfa.nim.c -o c_code/1_1/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/injectdestructors.nim.c -o c_code/1_1/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/liftlocals.nim.c -o c_code/1_1/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lambdalifting.nim.c -o c_code/1_1/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/closureiters.nim.c -o c_code/1_1/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/transf.nim.c -o c_code/1_1/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmgen.nim.c -o c_code/1_1/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdeps.nim.c -o c_code/1_1/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmmarshal.nim.c -o c_code/1_1/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/gorgeimpl.nim.c -o c_code/2_1/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/macrocacheimpl.nim.c -o c_code/1_1/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/evaltempl.nim.c -o c_code/1_1/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/vm.nim.c -o c_code/2_1/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semmacrosanity.nim.c -o c_code/1_1/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/pluginsupport.nim.c -o c_code/1_1/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7locals.nim.c -o c_code/1_1/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7itersgen.nim.c -o c_code/1_1/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7active.nim.c -o c_code/1_1/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semparallel.nim.c -o c_code/1_1/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sem.nim.c -o c_code/1_1/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgutils.nim.c -o c_code/1_1/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ndi.nim.c -o c_code/1_1/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgendata.nim.c -o c_code/1_1/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgmerge.nim.c -o c_code/1_1/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/enumtostr.nim.c -o c_code/1_1/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.nim.c -o c_code/2_1/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgen.nim.c -o c_code/1_1/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passaux.nim.c -o c_code/1_1/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/depends.nim.c -o c_code/1_1/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modules.nim.c -o c_code/1_1/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/jsgen.nim.c -o c_code/1_1/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/docgen2.nim.c -o c_code/1_1/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/main.nim.c -o c_code/1_1/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/scriptconfig.nim.c -o c_code/2_1/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/cmdlinehelper.nim.c -o c_code/2_1/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nim.nim.c -o c_code/2_1/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_1/stdlib_assertions.nim.o \
c_code/1_1/stdlib_dollars.nim.o \
c_code/10_1/stdlib_io.nim.o \
c_code/2_1/stdlib_system.nim.o \
c_code/2_1/stdlib_parseutils.nim.o \
c_code/2_1/stdlib_math.nim.o \
c_code/1_1/stdlib_algorithm.nim.o \
c_code/2_1/stdlib_unicode.nim.o \
c_code/2_1/stdlib_strutils.nim.o \
c_code/2_1/stdlib_pathnorm.nim.o \
c_code/10_1/stdlib_posix.nim.o \
c_code/2_1/stdlib_times.nim.o \
c_code/2_1/stdlib_os.nim.o \
c_code/1_1/stdlib_hashes.nim.o \
c_code/1_1/stdlib_strtabs.nim.o \
c_code/2_1/stdlib_streams.nim.o \
c_code/2_1/stdlib_cpuinfo.nim.o \
c_code/10_1/stdlib_osproc.nim.o \
c_code/1_1/stdlib_sets.nim.o \
c_code/2_1/pathutils.nim.o \
c_code/1_1/ropes.nim.o \
c_code/1_1/stdlib_tables.nim.o \
c_code/1_1/lineinfos.nim.o \
c_code/10_1/platform.nim.o \
c_code/1_1/prefixmatches.nim.o \
c_code/2_1/stdlib_strformat.nim.o \
c_code/2_1/stdlib_terminal.nim.o \
c_code/2_1/options.nim.o \
c_code/2_1/msgs.nim.o \
c_code/1_1/wordrecg.nim.o \
c_code/1_1/idents.nim.o \
c_code/1_1/condsyms.nim.o \
c_code/1_1/stdlib_sha1.nim.o \
c_code/2_1/stdlib_lexbase.nim.o \
c_code/1_1/stdlib_parsejson.nim.o \
c_code/1_1/stdlib_json.nim.o \
c_code/2_1/extccomp.nim.o \
c_code/2_1/nimblecmd.nim.o \
c_code/2_1/stdlib_parseopt.nim.o \
c_code/1_1/commands.nim.o \
c_code/1_1/llstream.nim.o \
c_code/1_1/nimlexbase.nim.o \
c_code/1_1/lexer.nim.o \
c_code/2_1/nimconf.nim.o \
c_code/1_1/stdlib_intsets.nim.o \
c_code/1_1/idgen.nim.o \
c_code/1_1/ast.nim.o \
c_code/1_1/rodutils.nim.o \
c_code/2_1/astalgo.nim.o \
c_code/1_1/parser.nim.o \
c_code/1_1/renderer.nim.o \
c_code/1_1/filters.nim.o \
c_code/1_1/filter__tmpl.nim.o \
c_code/1_1/syntaxes.nim.o \
c_code/1_1/trees.nim.o \
c_code/1_1/types.nim.o \
c_code/1_1/treetab.nim.o \
c_code/1_1/incremental.nim.o \
c_code/1_1/btrees.nim.o \
c_code/1_1/stdlib_md5.nim.o \
c_code/1_1/modulegraphs.nim.o \
c_code/1_1/magicsys.nim.o \
c_code/1_1/bitsets.nim.o \
c_code/1_1/nimsets.nim.o \
c_code/1_1/semfold.nim.o \
c_code/1_1/modulepaths.nim.o \
c_code/1_1/reorder.nim.o \
c_code/1_1/passes.nim.o \
c_code/1_1/vmdef.nim.o \
c_code/1_1/semdata.nim.o \
c_code/1_1/linter.nim.o \
c_code/1_1/nimfix7prettybase.nim.o \
c_code/1_1/lookups.nim.o \
c_code/1_1/semtypinst.nim.o \
c_code/1_1/parampatterns.nim.o \
c_code/1_1/lowerings.nim.o \
c_code/1_1/_7lib7packages7docutils7rstast.nim.o \
c_code/1_1/_7lib7packages7docutils7rst.nim.o \
c_code/1_1/_7lib7packages7docutils7highlite.nim.o \
c_code/2_1/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_1/stdlib_xmltree.nim.o \
c_code/1_1/stdlib_uri.nim.o \
c_code/1_1/stdlib_cgi.nim.o \
c_code/1_1/typesrenderer.nim.o \
c_code/2_1/docgen.nim.o \
c_code/1_1/sigmatch.nim.o \
c_code/1_1/importer.nim.o \
c_code/1_1/procfind.nim.o \
c_code/2_1/pragmas.nim.o \
c_code/1_1/saturate.nim.o \
c_code/1_1/guards.nim.o \
c_code/1_1/sighashes.nim.o \
c_code/1_1/sempass2.nim.o \
c_code/1_1/cgmeth.nim.o \
c_code/1_1/aliases.nim.o \
c_code/1_1/patterns.nim.o \
c_code/1_1/dfa.nim.o \
c_code/1_1/injectdestructors.nim.o \
c_code/1_1/liftlocals.nim.o \
c_code/1_1/lambdalifting.nim.o \
c_code/1_1/closureiters.nim.o \
c_code/1_1/transf.nim.o \
c_code/1_1/vmgen.nim.o \
c_code/1_1/vmdeps.nim.o \
c_code/1_1/vmmarshal.nim.o \
c_code/2_1/gorgeimpl.nim.o \
c_code/1_1/macrocacheimpl.nim.o \
c_code/1_1/evaltempl.nim.o \
c_code/2_1/vm.nim.o \
c_code/1_1/semmacrosanity.nim.o \
c_code/1_1/pluginsupport.nim.o \
c_code/1_1/plugins7locals.nim.o \
c_code/1_1/plugins7itersgen.nim.o \
c_code/1_1/plugins7active.nim.o \
c_code/1_1/semparallel.nim.o \
c_code/1_1/sem.nim.o \
c_code/1_1/ccgutils.nim.o \
c_code/1_1/ndi.nim.o \
c_code/1_1/cgendata.nim.o \
c_code/1_1/ccgmerge.nim.o \
c_code/1_1/enumtostr.nim.o \
c_code/2_1/stdlib_dynlib.nim.o \
c_code/1_1/cgen.nim.o \
c_code/1_1/passaux.nim.o \
c_code/1_1/depends.nim.o \
c_code/1_1/modules.nim.o \
c_code/1_1/jsgen.nim.o \
c_code/1_1/docgen2.nim.o \
c_code/1_1/main.nim.o \
c_code/2_1/scriptconfig.nim.o \
c_code/2_1/cmdlinehelper.nim.o \
c_code/2_1/nim.nim.o $LINK_FLAGS
    ;;
  amd64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  alpha)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  arm)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_assertions.nim.c -o c_code/1_1/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_dollars.nim.c -o c_code/1_1/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/10_1/stdlib_io.nim.c -o c_code/10_1/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_system.nim.c -o c_code/2_1/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.nim.c -o c_code/2_1/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.nim.c -o c_code/2_1/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_algorithm.nim.c -o c_code/1_1/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_unicode.nim.c -o c_code/2_1/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.nim.c -o c_code/2_1/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_pathnorm.nim.c -o c_code/2_1/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/10_1/stdlib_posix.nim.c -o c_code/10_1/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_times.nim.c -o c_code/2_1/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_os.nim.c -o c_code/2_1/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_hashes.nim.c -o c_code/1_1/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strtabs.nim.c -o c_code/1_1/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_streams.nim.c -o c_code/2_1/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cpuinfo.nim.c -o c_code/2_1/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/10_1/stdlib_osproc.nim.c -o c_code/10_1/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sets.nim.c -o c_code/1_1/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pathutils.nim.c -o c_code/2_1/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ropes.nim.c -o c_code/1_1/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_tables.nim.c -o c_code/1_1/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lineinfos.nim.c -o c_code/1_1/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/10_5/platform.nim.c -o c_code/10_5/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/prefixmatches.nim.c -o c_code/1_1/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strformat.nim.c -o c_code/2_1/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_terminal.nim.c -o c_code/2_1/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/options.nim.c -o c_code/2_1/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/msgs.nim.c -o c_code/2_1/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/wordrecg.nim.c -o c_code/1_1/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idents.nim.c -o c_code/1_1/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/condsyms.nim.c -o c_code/1_1/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sha1.nim.c -o c_code/1_1/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_lexbase.nim.c -o c_code/2_1/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parsejson.nim.c -o c_code/1_1/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_json.nim.c -o c_code/1_1/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/extccomp.nim.c -o c_code/2_1/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimblecmd.nim.c -o c_code/2_1/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseopt.nim.c -o c_code/2_1/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/commands.nim.c -o c_code/1_1/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/llstream.nim.c -o c_code/1_1/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimlexbase.nim.c -o c_code/1_1/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lexer.nim.c -o c_code/1_1/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nimconf.nim.c -o c_code/2_1/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_intsets.nim.c -o c_code/1_1/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/idgen.nim.c -o c_code/1_1/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ast.nim.c -o c_code/1_1/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/rodutils.nim.c -o c_code/1_1/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/astalgo.nim.c -o c_code/2_1/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parser.nim.c -o c_code/1_1/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/renderer.nim.c -o c_code/1_1/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filters.nim.c -o c_code/1_1/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/filter__tmpl.nim.c -o c_code/1_1/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/syntaxes.nim.c -o c_code/1_1/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/trees.nim.c -o c_code/1_1/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/types.nim.c -o c_code/1_1/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/treetab.nim.c -o c_code/1_1/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/incremental.nim.c -o c_code/1_1/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/btrees.nim.c -o c_code/1_1/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_md5.nim.c -o c_code/1_1/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulegraphs.nim.c -o c_code/1_1/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/magicsys.nim.c -o c_code/1_1/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/bitsets.nim.c -o c_code/1_1/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimsets.nim.c -o c_code/1_1/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semfold.nim.c -o c_code/1_1/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modulepaths.nim.c -o c_code/1_1/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/reorder.nim.c -o c_code/1_1/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passes.nim.c -o c_code/1_1/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdef.nim.c -o c_code/1_1/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semdata.nim.c -o c_code/1_1/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/linter.nim.c -o c_code/1_1/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/nimfix7prettybase.nim.c -o c_code/1_1/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lookups.nim.c -o c_code/1_1/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semtypinst.nim.c -o c_code/1_1/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/parampatterns.nim.c -o c_code/1_1/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lowerings.nim.c -o c_code/1_1/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rstast.nim.c -o c_code/1_1/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7rst.nim.c -o c_code/1_1/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/_7lib7packages7docutils7highlite.nim.c -o c_code/1_1/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/_7lib7packages7docutils7rstgen.nim.c -o c_code/2_1/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_xmltree.nim.c -o c_code/1_1/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_uri.nim.c -o c_code/1_1/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cgi.nim.c -o c_code/1_1/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/typesrenderer.nim.c -o c_code/1_1/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/docgen.nim.c -o c_code/2_1/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sigmatch.nim.c -o c_code/1_1/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/importer.nim.c -o c_code/1_1/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/procfind.nim.c -o c_code/1_1/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/pragmas.nim.c -o c_code/2_1/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/saturate.nim.c -o c_code/1_1/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/guards.nim.c -o c_code/1_1/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sighashes.nim.c -o c_code/1_1/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sempass2.nim.c -o c_code/1_1/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgmeth.nim.c -o c_code/1_1/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/aliases.nim.c -o c_code/1_1/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/patterns.nim.c -o c_code/1_1/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/dfa.nim.c -o c_code/1_1/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/injectdestructors.nim.c -o c_code/1_1/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/liftlocals.nim.c -o c_code/1_1/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/lambdalifting.nim.c -o c_code/1_1/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/closureiters.nim.c -o c_code/1_1/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/transf.nim.c -o c_code/1_1/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmgen.nim.c -o c_code/1_1/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmdeps.nim.c -o c_code/1_1/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/vmmarshal.nim.c -o c_code/1_1/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/gorgeimpl.nim.c -o c_code/2_1/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/macrocacheimpl.nim.c -o c_code/1_1/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/evaltempl.nim.c -o c_code/1_1/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/vm.nim.c -o c_code/2_1/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semmacrosanity.nim.c -o c_code/1_1/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/pluginsupport.nim.c -o c_code/1_1/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7locals.nim.c -o c_code/1_1/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7itersgen.nim.c -o c_code/1_1/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/plugins7active.nim.c -o c_code/1_1/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/semparallel.nim.c -o c_code/1_1/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sem.nim.c -o c_code/1_1/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgutils.nim.c -o c_code/1_1/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ndi.nim.c -o c_code/1_1/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgendata.nim.c -o c_code/1_1/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/ccgmerge.nim.c -o c_code/1_1/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/enumtostr.nim.c -o c_code/1_1/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_dynlib.nim.c -o c_code/2_1/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/cgen.nim.c -o c_code/1_1/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/passaux.nim.c -o c_code/1_1/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/depends.nim.c -o c_code/1_1/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/modules.nim.c -o c_code/1_1/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/jsgen.nim.c -o c_code/1_1/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/docgen2.nim.c -o c_code/1_1/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/main.nim.c -o c_code/1_1/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/scriptconfig.nim.c -o c_code/2_1/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/cmdlinehelper.nim.c -o c_code/2_1/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/nim.nim.c -o c_code/2_1/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_1/stdlib_assertions.nim.o \
c_code/1_1/stdlib_dollars.nim.o \
c_code/10_1/stdlib_io.nim.o \
c_code/2_1/stdlib_system.nim.o \
c_code/2_1/stdlib_parseutils.nim.o \
c_code/2_1/stdlib_math.nim.o \
c_code/1_1/stdlib_algorithm.nim.o \
c_code/2_1/stdlib_unicode.nim.o \
c_code/2_1/stdlib_strutils.nim.o \
c_code/2_1/stdlib_pathnorm.nim.o \
c_code/10_1/stdlib_posix.nim.o \
c_code/2_1/stdlib_times.nim.o \
c_code/2_1/stdlib_os.nim.o \
c_code/1_1/stdlib_hashes.nim.o \
c_code/1_1/stdlib_strtabs.nim.o \
c_code/2_1/stdlib_streams.nim.o \
c_code/2_1/stdlib_cpuinfo.nim.o \
c_code/10_1/stdlib_osproc.nim.o \
c_code/1_1/stdlib_sets.nim.o \
c_code/2_1/pathutils.nim.o \
c_code/1_1/ropes.nim.o \
c_code/1_1/stdlib_tables.nim.o \
c_code/1_1/lineinfos.nim.o \
c_code/10_5/platform.nim.o \
c_code/1_1/prefixmatches.nim.o \
c_code/2_1/stdlib_strformat.nim.o \
c_code/2_1/stdlib_terminal.nim.o \
c_code/2_1/options.nim.o \
c_code/2_1/msgs.nim.o \
c_code/1_1/wordrecg.nim.o \
c_code/1_1/idents.nim.o \
c_code/1_1/condsyms.nim.o \
c_code/1_1/stdlib_sha1.nim.o \
c_code/2_1/stdlib_lexbase.nim.o \
c_code/1_1/stdlib_parsejson.nim.o \
c_code/1_1/stdlib_json.nim.o \
c_code/2_1/extccomp.nim.o \
c_code/2_1/nimblecmd.nim.o \
c_code/2_1/stdlib_parseopt.nim.o \
c_code/1_1/commands.nim.o \
c_code/1_1/llstream.nim.o \
c_code/1_1/nimlexbase.nim.o \
c_code/1_1/lexer.nim.o \
c_code/2_1/nimconf.nim.o \
c_code/1_1/stdlib_intsets.nim.o \
c_code/1_1/idgen.nim.o \
c_code/1_1/ast.nim.o \
c_code/1_1/rodutils.nim.o \
c_code/2_1/astalgo.nim.o \
c_code/1_1/parser.nim.o \
c_code/1_1/renderer.nim.o \
c_code/1_1/filters.nim.o \
c_code/1_1/filter__tmpl.nim.o \
c_code/1_1/syntaxes.nim.o \
c_code/1_1/trees.nim.o \
c_code/1_1/types.nim.o \
c_code/1_1/treetab.nim.o \
c_code/1_1/incremental.nim.o \
c_code/1_1/btrees.nim.o \
c_code/1_1/stdlib_md5.nim.o \
c_code/1_1/modulegraphs.nim.o \
c_code/1_1/magicsys.nim.o \
c_code/1_1/bitsets.nim.o \
c_code/1_1/nimsets.nim.o \
c_code/1_1/semfold.nim.o \
c_code/1_1/modulepaths.nim.o \
c_code/1_1/reorder.nim.o \
c_code/1_1/passes.nim.o \
c_code/1_1/vmdef.nim.o \
c_code/1_1/semdata.nim.o \
c_code/1_1/linter.nim.o \
c_code/1_1/nimfix7prettybase.nim.o \
c_code/1_1/lookups.nim.o \
c_code/1_1/semtypinst.nim.o \
c_code/1_1/parampatterns.nim.o \
c_code/1_1/lowerings.nim.o \
c_code/1_1/_7lib7packages7docutils7rstast.nim.o \
c_code/1_1/_7lib7packages7docutils7rst.nim.o \
c_code/1_1/_7lib7packages7docutils7highlite.nim.o \
c_code/2_1/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_1/stdlib_xmltree.nim.o \
c_code/1_1/stdlib_uri.nim.o \
c_code/1_1/stdlib_cgi.nim.o \
c_code/1_1/typesrenderer.nim.o \
c_code/2_1/docgen.nim.o \
c_code/1_1/sigmatch.nim.o \
c_code/1_1/importer.nim.o \
c_code/1_1/procfind.nim.o \
c_code/2_1/pragmas.nim.o \
c_code/1_1/saturate.nim.o \
c_code/1_1/guards.nim.o \
c_code/1_1/sighashes.nim.o \
c_code/1_1/sempass2.nim.o \
c_code/1_1/cgmeth.nim.o \
c_code/1_1/aliases.nim.o \
c_code/1_1/patterns.nim.o \
c_code/1_1/dfa.nim.o \
c_code/1_1/injectdestructors.nim.o \
c_code/1_1/liftlocals.nim.o \
c_code/1_1/lambdalifting.nim.o \
c_code/1_1/closureiters.nim.o \
c_code/1_1/transf.nim.o \
c_code/1_1/vmgen.nim.o \
c_code/1_1/vmdeps.nim.o \
c_code/1_1/vmmarshal.nim.o \
c_code/2_1/gorgeimpl.nim.o \
c_code/1_1/macrocacheimpl.nim.o \
c_code/1_1/evaltempl.nim.o \
c_code/2_1/vm.nim.o \
c_code/1_1/semmacrosanity.nim.o \
c_code/1_1/pluginsupport.nim.o \
c_code/1_1/plugins7locals.nim.o \
c_code/1_1/plugins7itersgen.nim.o \
c_code/1_1/plugins7active.nim.o \
c_code/1_1/semparallel.nim.o \
c_code/1_1/sem.nim.o \
c_code/1_1/ccgutils.nim.o \
c_code/1_1/ndi.nim.o \
c_code/1_1/cgendata.nim.o \
c_code/1_1/ccgmerge.nim.o \
c_code/1_1/enumtostr.nim.o \
c_code/2_1/stdlib_dynlib.nim.o \
c_code/1_1/cgen.nim.o \
c_code/1_1/passaux.nim.o \
c_code/1_1/depends.nim.o \
c_code/1_1/modules.nim.o \
c_code/1_1/jsgen.nim.o \
c_code/1_1/docgen2.nim.o \
c_code/1_1/main.nim.o \
c_code/2_1/scriptconfig.nim.o \
c_code/2_1/cmdlinehelper.nim.o \
c_code/2_1/nim.nim.o $LINK_FLAGS
    ;;
  sparc)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  m68k)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mipsel)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips64el)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc64el)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  arm64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_assertions.nim.c -o c_code/1_2/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_dollars.nim.c -o c_code/1_2/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/10_15/stdlib_io.nim.c -o c_code/10_15/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_system.nim.c -o c_code/2_3/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.nim.c -o c_code/2_2/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.nim.c -o c_code/2_2/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_algorithm.nim.c -o c_code/1_2/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.nim.c -o c_code/2_2/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.nim.c -o c_code/2_2/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_pathnorm.nim.c -o c_code/2_2/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/10_15/stdlib_posix.nim.c -o c_code/10_15/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_times.nim.c -o c_code/2_2/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_os.nim.c -o c_code/2_3/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_hashes.nim.c -o c_code/1_2/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strtabs.nim.c -o c_code/1_2/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_streams.nim.c -o c_code/2_3/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_cpuinfo.nim.c -o c_code/2_3/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/10_15/stdlib_osproc.nim.c -o c_code/10_15/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sets.nim.c -o c_code/1_2/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/pathutils.nim.c -o c_code/2_2/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ropes.nim.c -o c_code/1_2/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_tables.nim.c -o c_code/1_2/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lineinfos.nim.c -o c_code/1_2/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/10_15/platform.nim.c -o c_code/10_15/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/prefixmatches.nim.c -o c_code/1_2/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strformat.nim.c -o c_code/2_2/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.nim.c -o c_code/2_2/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/options.nim.c -o c_code/2_3/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/msgs.nim.c -o c_code/2_3/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/wordrecg.nim.c -o c_code/1_2/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idents.nim.c -o c_code/1_2/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/condsyms.nim.c -o c_code/1_2/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sha1.nim.c -o c_code/1_2/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.nim.c -o c_code/2_2/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parsejson.nim.c -o c_code/1_2/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_json.nim.c -o c_code/1_2/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/extccomp.nim.c -o c_code/2_3/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/nimblecmd.nim.c -o c_code/2_3/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.nim.c -o c_code/2_2/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/commands.nim.c -o c_code/1_2/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/llstream.nim.c -o c_code/1_2/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimlexbase.nim.c -o c_code/1_2/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lexer.nim.c -o c_code/1_2/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimconf.nim.c -o c_code/2_2/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_intsets.nim.c -o c_code/1_2/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idgen.nim.c -o c_code/1_2/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ast.nim.c -o c_code/1_2/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/rodutils.nim.c -o c_code/1_2/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/astalgo.nim.c -o c_code/2_2/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parser.nim.c -o c_code/1_2/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/renderer.nim.c -o c_code/1_2/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filters.nim.c -o c_code/1_2/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filter__tmpl.nim.c -o c_code/1_2/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/syntaxes.nim.c -o c_code/1_2/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/trees.nim.c -o c_code/1_2/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/types.nim.c -o c_code/1_2/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/treetab.nim.c -o c_code/1_2/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/incremental.nim.c -o c_code/1_2/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/btrees.nim.c -o c_code/1_2/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_md5.nim.c -o c_code/1_2/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulegraphs.nim.c -o c_code/1_2/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/magicsys.nim.c -o c_code/1_2/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/bitsets.nim.c -o c_code/1_2/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimsets.nim.c -o c_code/1_2/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semfold.nim.c -o c_code/1_2/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulepaths.nim.c -o c_code/1_2/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/reorder.nim.c -o c_code/1_2/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passes.nim.c -o c_code/1_2/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdef.nim.c -o c_code/1_2/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semdata.nim.c -o c_code/1_2/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/linter.nim.c -o c_code/1_2/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimfix7prettybase.nim.c -o c_code/1_2/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lookups.nim.c -o c_code/1_2/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semtypinst.nim.c -o c_code/1_2/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parampatterns.nim.c -o c_code/1_2/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lowerings.nim.c -o c_code/1_2/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rstast.nim.c -o c_code/1_2/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rst.nim.c -o c_code/1_2/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7highlite.nim.c -o c_code/1_2/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/_7lib7packages7docutils7rstgen.nim.c -o c_code/2_3/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_xmltree.nim.c -o c_code/1_2/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_uri.nim.c -o c_code/1_2/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cgi.nim.c -o c_code/1_2/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/typesrenderer.nim.c -o c_code/1_2/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docgen.nim.c -o c_code/2_2/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sigmatch.nim.c -o c_code/1_2/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/importer.nim.c -o c_code/1_2/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/procfind.nim.c -o c_code/1_2/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/pragmas.nim.c -o c_code/2_3/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/saturate.nim.c -o c_code/1_2/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/guards.nim.c -o c_code/1_2/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sighashes.nim.c -o c_code/1_2/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sempass2.nim.c -o c_code/1_2/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgmeth.nim.c -o c_code/1_2/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/aliases.nim.c -o c_code/1_2/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/patterns.nim.c -o c_code/1_2/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/dfa.nim.c -o c_code/1_2/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/injectdestructors.nim.c -o c_code/1_2/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/liftlocals.nim.c -o c_code/1_2/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lambdalifting.nim.c -o c_code/1_2/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/closureiters.nim.c -o c_code/1_2/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/transf.nim.c -o c_code/1_2/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmgen.nim.c -o c_code/1_2/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdeps.nim.c -o c_code/1_2/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmmarshal.nim.c -o c_code/1_2/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/gorgeimpl.nim.c -o c_code/2_3/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/macrocacheimpl.nim.c -o c_code/1_2/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/evaltempl.nim.c -o c_code/1_2/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/vm.nim.c -o c_code/2_3/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semmacrosanity.nim.c -o c_code/1_2/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/pluginsupport.nim.c -o c_code/1_2/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7locals.nim.c -o c_code/1_2/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7itersgen.nim.c -o c_code/1_2/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7active.nim.c -o c_code/1_2/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semparallel.nim.c -o c_code/1_2/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sem.nim.c -o c_code/1_2/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgutils.nim.c -o c_code/1_2/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ndi.nim.c -o c_code/1_2/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgendata.nim.c -o c_code/1_2/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgmerge.nim.c -o c_code/1_2/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/enumtostr.nim.c -o c_code/1_2/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.nim.c -o c_code/2_2/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgen.nim.c -o c_code/1_2/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passaux.nim.c -o c_code/1_2/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/depends.nim.c -o c_code/1_2/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modules.nim.c -o c_code/1_2/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/jsgen.nim.c -o c_code/1_2/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/docgen2.nim.c -o c_code/1_2/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/main.nim.c -o c_code/1_2/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/scriptconfig.nim.c -o c_code/2_3/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/cmdlinehelper.nim.c -o c_code/2_3/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nim.nim.c -o c_code/2_2/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_2/stdlib_assertions.nim.o \
c_code/1_2/stdlib_dollars.nim.o \
c_code/10_15/stdlib_io.nim.o \
c_code/2_3/stdlib_system.nim.o \
c_code/2_2/stdlib_parseutils.nim.o \
c_code/2_2/stdlib_math.nim.o \
c_code/1_2/stdlib_algorithm.nim.o \
c_code/2_2/stdlib_unicode.nim.o \
c_code/2_2/stdlib_strutils.nim.o \
c_code/2_2/stdlib_pathnorm.nim.o \
c_code/10_15/stdlib_posix.nim.o \
c_code/2_2/stdlib_times.nim.o \
c_code/2_3/stdlib_os.nim.o \
c_code/1_2/stdlib_hashes.nim.o \
c_code/1_2/stdlib_strtabs.nim.o \
c_code/2_3/stdlib_streams.nim.o \
c_code/2_3/stdlib_cpuinfo.nim.o \
c_code/10_15/stdlib_osproc.nim.o \
c_code/1_2/stdlib_sets.nim.o \
c_code/2_2/pathutils.nim.o \
c_code/1_2/ropes.nim.o \
c_code/1_2/stdlib_tables.nim.o \
c_code/1_2/lineinfos.nim.o \
c_code/10_15/platform.nim.o \
c_code/1_2/prefixmatches.nim.o \
c_code/2_2/stdlib_strformat.nim.o \
c_code/2_2/stdlib_terminal.nim.o \
c_code/2_3/options.nim.o \
c_code/2_3/msgs.nim.o \
c_code/1_2/wordrecg.nim.o \
c_code/1_2/idents.nim.o \
c_code/1_2/condsyms.nim.o \
c_code/1_2/stdlib_sha1.nim.o \
c_code/2_2/stdlib_lexbase.nim.o \
c_code/1_2/stdlib_parsejson.nim.o \
c_code/1_2/stdlib_json.nim.o \
c_code/2_3/extccomp.nim.o \
c_code/2_3/nimblecmd.nim.o \
c_code/2_2/stdlib_parseopt.nim.o \
c_code/1_2/commands.nim.o \
c_code/1_2/llstream.nim.o \
c_code/1_2/nimlexbase.nim.o \
c_code/1_2/lexer.nim.o \
c_code/2_2/nimconf.nim.o \
c_code/1_2/stdlib_intsets.nim.o \
c_code/1_2/idgen.nim.o \
c_code/1_2/ast.nim.o \
c_code/1_2/rodutils.nim.o \
c_code/2_2/astalgo.nim.o \
c_code/1_2/parser.nim.o \
c_code/1_2/renderer.nim.o \
c_code/1_2/filters.nim.o \
c_code/1_2/filter__tmpl.nim.o \
c_code/1_2/syntaxes.nim.o \
c_code/1_2/trees.nim.o \
c_code/1_2/types.nim.o \
c_code/1_2/treetab.nim.o \
c_code/1_2/incremental.nim.o \
c_code/1_2/btrees.nim.o \
c_code/1_2/stdlib_md5.nim.o \
c_code/1_2/modulegraphs.nim.o \
c_code/1_2/magicsys.nim.o \
c_code/1_2/bitsets.nim.o \
c_code/1_2/nimsets.nim.o \
c_code/1_2/semfold.nim.o \
c_code/1_2/modulepaths.nim.o \
c_code/1_2/reorder.nim.o \
c_code/1_2/passes.nim.o \
c_code/1_2/vmdef.nim.o \
c_code/1_2/semdata.nim.o \
c_code/1_2/linter.nim.o \
c_code/1_2/nimfix7prettybase.nim.o \
c_code/1_2/lookups.nim.o \
c_code/1_2/semtypinst.nim.o \
c_code/1_2/parampatterns.nim.o \
c_code/1_2/lowerings.nim.o \
c_code/1_2/_7lib7packages7docutils7rstast.nim.o \
c_code/1_2/_7lib7packages7docutils7rst.nim.o \
c_code/1_2/_7lib7packages7docutils7highlite.nim.o \
c_code/2_3/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_2/stdlib_xmltree.nim.o \
c_code/1_2/stdlib_uri.nim.o \
c_code/1_2/stdlib_cgi.nim.o \
c_code/1_2/typesrenderer.nim.o \
c_code/2_2/docgen.nim.o \
c_code/1_2/sigmatch.nim.o \
c_code/1_2/importer.nim.o \
c_code/1_2/procfind.nim.o \
c_code/2_3/pragmas.nim.o \
c_code/1_2/saturate.nim.o \
c_code/1_2/guards.nim.o \
c_code/1_2/sighashes.nim.o \
c_code/1_2/sempass2.nim.o \
c_code/1_2/cgmeth.nim.o \
c_code/1_2/aliases.nim.o \
c_code/1_2/patterns.nim.o \
c_code/1_2/dfa.nim.o \
c_code/1_2/injectdestructors.nim.o \
c_code/1_2/liftlocals.nim.o \
c_code/1_2/lambdalifting.nim.o \
c_code/1_2/closureiters.nim.o \
c_code/1_2/transf.nim.o \
c_code/1_2/vmgen.nim.o \
c_code/1_2/vmdeps.nim.o \
c_code/1_2/vmmarshal.nim.o \
c_code/2_3/gorgeimpl.nim.o \
c_code/1_2/macrocacheimpl.nim.o \
c_code/1_2/evaltempl.nim.o \
c_code/2_3/vm.nim.o \
c_code/1_2/semmacrosanity.nim.o \
c_code/1_2/pluginsupport.nim.o \
c_code/1_2/plugins7locals.nim.o \
c_code/1_2/plugins7itersgen.nim.o \
c_code/1_2/plugins7active.nim.o \
c_code/1_2/semparallel.nim.o \
c_code/1_2/sem.nim.o \
c_code/1_2/ccgutils.nim.o \
c_code/1_2/ndi.nim.o \
c_code/1_2/cgendata.nim.o \
c_code/1_2/ccgmerge.nim.o \
c_code/1_2/enumtostr.nim.o \
c_code/2_2/stdlib_dynlib.nim.o \
c_code/1_2/cgen.nim.o \
c_code/1_2/passaux.nim.o \
c_code/1_2/depends.nim.o \
c_code/1_2/modules.nim.o \
c_code/1_2/jsgen.nim.o \
c_code/1_2/docgen2.nim.o \
c_code/1_2/main.nim.o \
c_code/2_3/scriptconfig.nim.o \
c_code/2_3/cmdlinehelper.nim.o \
c_code/2_2/nim.nim.o $LINK_FLAGS
    ;;
  riscv64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  *)
    echo 2>&1 "Error: no C code generated for: [$myos: $mycpu]"
    exit 1
    ;;
  esac
  ;;
nintendoswitch)
  case $mycpu in
  i386)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  amd64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  alpha)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  arm)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  sparc64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  m68k)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mipsel)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  mips64el)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  powerpc64el)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
    ;;
  arm64)
    set -x
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_assertions.nim.c -o c_code/1_2/stdlib_assertions.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_dollars.nim.c -o c_code/1_2/stdlib_dollars.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/10_15/stdlib_io.nim.c -o c_code/10_15/stdlib_io.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/11_15/stdlib_system.nim.c -o c_code/11_15/stdlib_system.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.nim.c -o c_code/2_2/stdlib_parseutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.nim.c -o c_code/2_2/stdlib_math.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_algorithm.nim.c -o c_code/1_2/stdlib_algorithm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_unicode.nim.c -o c_code/2_2/stdlib_unicode.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.nim.c -o c_code/2_2/stdlib_strutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_pathnorm.nim.c -o c_code/2_2/stdlib_pathnorm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/11_15/stdlib_posix.nim.c -o c_code/11_15/stdlib_posix.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_times.nim.c -o c_code/4_2/stdlib_times.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/11_15/stdlib_os.nim.c -o c_code/11_15/stdlib_os.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_hashes.nim.c -o c_code/1_2/stdlib_hashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strtabs.nim.c -o c_code/1_2/stdlib_strtabs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_streams.nim.c -o c_code/2_3/stdlib_streams.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/11_15/stdlib_cpuinfo.nim.c -o c_code/11_15/stdlib_cpuinfo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/11_15/stdlib_osproc.nim.c -o c_code/11_15/stdlib_osproc.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sets.nim.c -o c_code/1_2/stdlib_sets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/pathutils.nim.c -o c_code/2_2/pathutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ropes.nim.c -o c_code/1_2/ropes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_tables.nim.c -o c_code/1_2/stdlib_tables.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lineinfos.nim.c -o c_code/1_2/lineinfos.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/11_15/platform.nim.c -o c_code/11_15/platform.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/prefixmatches.nim.c -o c_code/1_2/prefixmatches.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strformat.nim.c -o c_code/2_2/stdlib_strformat.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_terminal.nim.c -o c_code/2_2/stdlib_terminal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/11_15/options.nim.c -o c_code/11_15/options.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/msgs.nim.c -o c_code/2_3/msgs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/wordrecg.nim.c -o c_code/1_2/wordrecg.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idents.nim.c -o c_code/1_2/idents.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/condsyms.nim.c -o c_code/1_2/condsyms.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sha1.nim.c -o c_code/1_2/stdlib_sha1.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_lexbase.nim.c -o c_code/2_2/stdlib_lexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parsejson.nim.c -o c_code/1_2/stdlib_parsejson.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_json.nim.c -o c_code/1_2/stdlib_json.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/11_15/extccomp.nim.c -o c_code/11_15/extccomp.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/11_15/nimblecmd.nim.c -o c_code/11_15/nimblecmd.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseopt.nim.c -o c_code/2_2/stdlib_parseopt.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/commands.nim.c -o c_code/1_2/commands.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/llstream.nim.c -o c_code/1_2/llstream.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimlexbase.nim.c -o c_code/1_2/nimlexbase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lexer.nim.c -o c_code/1_2/lexer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nimconf.nim.c -o c_code/2_2/nimconf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_intsets.nim.c -o c_code/1_2/stdlib_intsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/idgen.nim.c -o c_code/1_2/idgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ast.nim.c -o c_code/1_2/ast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/rodutils.nim.c -o c_code/1_2/rodutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/astalgo.nim.c -o c_code/2_2/astalgo.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parser.nim.c -o c_code/1_2/parser.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/renderer.nim.c -o c_code/1_2/renderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filters.nim.c -o c_code/1_2/filters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/filter__tmpl.nim.c -o c_code/1_2/filter__tmpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/syntaxes.nim.c -o c_code/1_2/syntaxes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/trees.nim.c -o c_code/1_2/trees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/types.nim.c -o c_code/1_2/types.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/treetab.nim.c -o c_code/1_2/treetab.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/incremental.nim.c -o c_code/1_2/incremental.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/btrees.nim.c -o c_code/1_2/btrees.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_md5.nim.c -o c_code/1_2/stdlib_md5.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulegraphs.nim.c -o c_code/1_2/modulegraphs.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/magicsys.nim.c -o c_code/1_2/magicsys.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/bitsets.nim.c -o c_code/1_2/bitsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimsets.nim.c -o c_code/1_2/nimsets.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semfold.nim.c -o c_code/1_2/semfold.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modulepaths.nim.c -o c_code/1_2/modulepaths.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/reorder.nim.c -o c_code/1_2/reorder.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passes.nim.c -o c_code/1_2/passes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdef.nim.c -o c_code/1_2/vmdef.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semdata.nim.c -o c_code/1_2/semdata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/linter.nim.c -o c_code/1_2/linter.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/nimfix7prettybase.nim.c -o c_code/1_2/nimfix7prettybase.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lookups.nim.c -o c_code/1_2/lookups.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semtypinst.nim.c -o c_code/1_2/semtypinst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/parampatterns.nim.c -o c_code/1_2/parampatterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lowerings.nim.c -o c_code/1_2/lowerings.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rstast.nim.c -o c_code/1_2/_7lib7packages7docutils7rstast.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7rst.nim.c -o c_code/1_2/_7lib7packages7docutils7rst.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/_7lib7packages7docutils7highlite.nim.c -o c_code/1_2/_7lib7packages7docutils7highlite.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/11_15/_7lib7packages7docutils7rstgen.nim.c -o c_code/11_15/_7lib7packages7docutils7rstgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_xmltree.nim.c -o c_code/1_2/stdlib_xmltree.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_uri.nim.c -o c_code/1_2/stdlib_uri.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cgi.nim.c -o c_code/1_2/stdlib_cgi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/typesrenderer.nim.c -o c_code/1_2/typesrenderer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/docgen.nim.c -o c_code/2_2/docgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sigmatch.nim.c -o c_code/1_2/sigmatch.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/importer.nim.c -o c_code/1_2/importer.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/procfind.nim.c -o c_code/1_2/procfind.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/11_15/pragmas.nim.c -o c_code/11_15/pragmas.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/saturate.nim.c -o c_code/1_2/saturate.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/guards.nim.c -o c_code/1_2/guards.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sighashes.nim.c -o c_code/1_2/sighashes.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sempass2.nim.c -o c_code/1_2/sempass2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgmeth.nim.c -o c_code/1_2/cgmeth.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/aliases.nim.c -o c_code/1_2/aliases.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/patterns.nim.c -o c_code/1_2/patterns.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/dfa.nim.c -o c_code/1_2/dfa.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/injectdestructors.nim.c -o c_code/1_2/injectdestructors.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/liftlocals.nim.c -o c_code/1_2/liftlocals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/lambdalifting.nim.c -o c_code/1_2/lambdalifting.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/closureiters.nim.c -o c_code/1_2/closureiters.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/transf.nim.c -o c_code/1_2/transf.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmgen.nim.c -o c_code/1_2/vmgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmdeps.nim.c -o c_code/1_2/vmdeps.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/vmmarshal.nim.c -o c_code/1_2/vmmarshal.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/gorgeimpl.nim.c -o c_code/2_3/gorgeimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/macrocacheimpl.nim.c -o c_code/1_2/macrocacheimpl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/evaltempl.nim.c -o c_code/1_2/evaltempl.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/11_15/vm.nim.c -o c_code/11_15/vm.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semmacrosanity.nim.c -o c_code/1_2/semmacrosanity.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/pluginsupport.nim.c -o c_code/1_2/pluginsupport.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7locals.nim.c -o c_code/1_2/plugins7locals.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7itersgen.nim.c -o c_code/1_2/plugins7itersgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/plugins7active.nim.c -o c_code/1_2/plugins7active.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/semparallel.nim.c -o c_code/1_2/semparallel.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sem.nim.c -o c_code/1_2/sem.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgutils.nim.c -o c_code/1_2/ccgutils.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ndi.nim.c -o c_code/1_2/ndi.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgendata.nim.c -o c_code/1_2/cgendata.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/ccgmerge.nim.c -o c_code/1_2/ccgmerge.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/enumtostr.nim.c -o c_code/1_2/enumtostr.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_dynlib.nim.c -o c_code/2_2/stdlib_dynlib.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/cgen.nim.c -o c_code/1_2/cgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/passaux.nim.c -o c_code/1_2/passaux.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/depends.nim.c -o c_code/1_2/depends.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/modules.nim.c -o c_code/1_2/modules.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/jsgen.nim.c -o c_code/1_2/jsgen.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/docgen2.nim.c -o c_code/1_2/docgen2.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/main.nim.c -o c_code/1_2/main.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/11_15/scriptconfig.nim.c -o c_code/11_15/scriptconfig.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/cmdlinehelper.nim.c -o c_code/2_3/cmdlinehelper.nim.o
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/nim.nim.c -o c_code/2_2/nim.nim.o
    $CC -o $binDir/nim  \
c_code/1_2/stdlib_assertions.nim.o \
c_code/1_2/stdlib_dollars.nim.o \
c_code/10_15/stdlib_io.nim.o \
c_code/11_15/stdlib_system.nim.o \
c_code/2_2/stdlib_parseutils.nim.o \
c_code/2_2/stdlib_math.nim.o \
c_code/1_2/stdlib_algorithm.nim.o \
c_code/2_2/stdlib_unicode.nim.o \
c_code/2_2/stdlib_strutils.nim.o \
c_code/2_2/stdlib_pathnorm.nim.o \
c_code/11_15/stdlib_posix.nim.o \
c_code/4_2/stdlib_times.nim.o \
c_code/11_15/stdlib_os.nim.o \
c_code/1_2/stdlib_hashes.nim.o \
c_code/1_2/stdlib_strtabs.nim.o \
c_code/2_3/stdlib_streams.nim.o \
c_code/11_15/stdlib_cpuinfo.nim.o \
c_code/11_15/stdlib_osproc.nim.o \
c_code/1_2/stdlib_sets.nim.o \
c_code/2_2/pathutils.nim.o \
c_code/1_2/ropes.nim.o \
c_code/1_2/stdlib_tables.nim.o \
c_code/1_2/lineinfos.nim.o \
c_code/11_15/platform.nim.o \
c_code/1_2/prefixmatches.nim.o \
c_code/2_2/stdlib_strformat.nim.o \
c_code/2_2/stdlib_terminal.nim.o \
c_code/11_15/options.nim.o \
c_code/2_3/msgs.nim.o \
c_code/1_2/wordrecg.nim.o \
c_code/1_2/idents.nim.o \
c_code/1_2/condsyms.nim.o \
c_code/1_2/stdlib_sha1.nim.o \
c_code/2_2/stdlib_lexbase.nim.o \
c_code/1_2/stdlib_parsejson.nim.o \
c_code/1_2/stdlib_json.nim.o \
c_code/11_15/extccomp.nim.o \
c_code/11_15/nimblecmd.nim.o \
c_code/2_2/stdlib_parseopt.nim.o \
c_code/1_2/commands.nim.o \
c_code/1_2/llstream.nim.o \
c_code/1_2/nimlexbase.nim.o \
c_code/1_2/lexer.nim.o \
c_code/2_2/nimconf.nim.o \
c_code/1_2/stdlib_intsets.nim.o \
c_code/1_2/idgen.nim.o \
c_code/1_2/ast.nim.o \
c_code/1_2/rodutils.nim.o \
c_code/2_2/astalgo.nim.o \
c_code/1_2/parser.nim.o \
c_code/1_2/renderer.nim.o \
c_code/1_2/filters.nim.o \
c_code/1_2/filter__tmpl.nim.o \
c_code/1_2/syntaxes.nim.o \
c_code/1_2/trees.nim.o \
c_code/1_2/types.nim.o \
c_code/1_2/treetab.nim.o \
c_code/1_2/incremental.nim.o \
c_code/1_2/btrees.nim.o \
c_code/1_2/stdlib_md5.nim.o \
c_code/1_2/modulegraphs.nim.o \
c_code/1_2/magicsys.nim.o \
c_code/1_2/bitsets.nim.o \
c_code/1_2/nimsets.nim.o \
c_code/1_2/semfold.nim.o \
c_code/1_2/modulepaths.nim.o \
c_code/1_2/reorder.nim.o \
c_code/1_2/passes.nim.o \
c_code/1_2/vmdef.nim.o \
c_code/1_2/semdata.nim.o \
c_code/1_2/linter.nim.o \
c_code/1_2/nimfix7prettybase.nim.o \
c_code/1_2/lookups.nim.o \
c_code/1_2/semtypinst.nim.o \
c_code/1_2/parampatterns.nim.o \
c_code/1_2/lowerings.nim.o \
c_code/1_2/_7lib7packages7docutils7rstast.nim.o \
c_code/1_2/_7lib7packages7docutils7rst.nim.o \
c_code/1_2/_7lib7packages7docutils7highlite.nim.o \
c_code/11_15/_7lib7packages7docutils7rstgen.nim.o \
c_code/1_2/stdlib_xmltree.nim.o \
c_code/1_2/stdlib_uri.nim.o \
c_code/1_2/stdlib_cgi.nim.o \
c_code/1_2/typesrenderer.nim.o \
c_code/2_2/docgen.nim.o \
c_code/1_2/sigmatch.nim.o \
c_code/1_2/importer.nim.o \
c_code/1_2/procfind.nim.o \
c_code/11_15/pragmas.nim.o \
c_code/1_2/saturate.nim.o \
c_code/1_2/guards.nim.o \
c_code/1_2/sighashes.nim.o \
c_code/1_2/sempass2.nim.o \
c_code/1_2/cgmeth.nim.o \
c_code/1_2/aliases.nim.o \
c_code/1_2/patterns.nim.o \
c_code/1_2/dfa.nim.o \
c_code/1_2/injectdestructors.nim.o \
c_code/1_2/liftlocals.nim.o \
c_code/1_2/lambdalifting.nim.o \
c_code/1_2/closureiters.nim.o \
c_code/1_2/transf.nim.o \
c_code/1_2/vmgen.nim.o \
c_code/1_2/vmdeps.nim.o \
c_code/1_2/vmmarshal.nim.o \
c_code/2_3/gorgeimpl.nim.o \
c_code/1_2/macrocacheimpl.nim.o \
c_code/1_2/evaltempl.nim.o \
c_code/11_15/vm.nim.o \
c_code/1_2/semmacrosanity.nim.o \
c_code/1_2/pluginsupport.nim.o \
c_code/1_2/plugins7locals.nim.o \
c_code/1_2/plugins7itersgen.nim.o \
c_code/1_2/plugins7active.nim.o \
c_code/1_2/semparallel.nim.o \
c_code/1_2/sem.nim.o \
c_code/1_2/ccgutils.nim.o \
c_code/1_2/ndi.nim.o \
c_code/1_2/cgendata.nim.o \
c_code/1_2/ccgmerge.nim.o \
c_code/1_2/enumtostr.nim.o \
c_code/2_2/stdlib_dynlib.nim.o \
c_code/1_2/cgen.nim.o \
c_code/1_2/passaux.nim.o \
c_code/1_2/depends.nim.o \
c_code/1_2/modules.nim.o \
c_code/1_2/jsgen.nim.o \
c_code/1_2/docgen2.nim.o \
c_code/1_2/main.nim.o \
c_code/11_15/scriptconfig.nim.o \
c_code/2_3/cmdlinehelper.nim.o \
c_code/2_2/nim.nim.o $LINK_FLAGS
    ;;
  riscv64)
    set -x
    $CC -o $binDir/nim  $LINK_FLAGS
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


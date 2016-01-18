
import strutils, os

proc exec(cmd: string) =
  if os.execShellCmd(cmd) != 0:
    echo "FAILED ", cmd

proc addnewcfiles =
  for kind, path in walkDir("c_code"):
    if kind == pcDir:
      exec("git add " & path / "*.c")

proc removenewcfiles =
  for path in walkDirRec("c_code"):
    if '_' notin path.splitFile.name:
      exec("git rm " & path)

addnewcfiles()
#removenewcfiles()


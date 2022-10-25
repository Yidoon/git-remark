load "test_helper/bats-support/load"
load "test_helper/bats-assert/load"

foldername="sandboxrepo"

setup() {
  create_git_sandbox
  export BROWSER=echo
}

##
## Test environment
##
@test "test environment" {
  cd ..
  assert [ -e "$foldername" ]
  assert [ -e "$foldername/.git" ]
}

##
## Set remark: current
##
@test "set remark: current" {
  testStr='set remark: current'
  run ../git-remark "$testStr"
  result=$(git config branch.master.description)
  assert_equal "$testStr" "$result"
}
@test "set remark for specified branch: test_branch" {
  git branch test
  testStr='set remark: test'
  run ../git-remark -b test "$testStr"
  result=$(git config branch.test.description)
  assert_equal "$testStr" "$result"
}

teardown() {
  cd ..
  rm -rf "$foldername"
}
# helper to create a test git sandbox that won't dirty the real repo
function create_git_sandbox() {
  rm -rf "$foldername"
  mkdir "$foldername"
  cd "$foldername"
  # safety check. Don't muck with the git repo if we're not inside the sandbox.
  assert_equal $(basename $PWD) "$foldername"

  git init -q
  assert [ -e "../$foldername/.git" ]
  git config user.email "test@runner.com" && git config user.name "Test Runner"

  # newer git auto-creates the origin remote
  if ! git remote add origin "github.com:Yidoon/git-remark.git"; then
    git remote set-url origin "github.com:Yidoon/git-remark.git"
  fi

  git checkout -B "master"

  echo "ok" >readme.txt
  git add readme.txt
  git commit -m "add file" -q
}

# git-remark

Adding remark to branches
![Demo of git open in action](https://user-images.githubusercontent.com/32826174/193486546-7a3143ea-b362-4996-87df-53a6d39233c2.png)

## Usage

```bash
# Show remark of current branch
git remark

# List all local branchs and their remark
git remark -a

# List all local branchs with remark
git remark -a -f

# Adding remark for current branch
git remark "adding a remark for current branch"

# Add a remark to the specified branch
git remark -b test "adding remark for test branch"

```

## Installation

### Basic install

Adding the git-remark script into your path (e.g. add the directory to your PATH environment or copy git-open into an existing included path like /usr/local/bin).

### Install via NPM

npm install --global git-remark

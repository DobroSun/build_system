
set remote="https://github.com/DobroSun/%1.git"

copy  build\.gitignore .
mkdir src
mkdir build

git init
git submodule add https://github.com/DobroSun/std.git
git remote add origin %remote%
git add .
git commit -m "Initial commit"
git push --set-upstream origin master

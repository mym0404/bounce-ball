#!/bin/zsh

export repo_name='bounce-ball'

echo $repo_name

cd /Users/mj/Desktop/$repo_name || exit
pwd
flutter config --enable-web
flutter pub get
flutter build web --release --web-renderer canvaskit --base-href=/${repo_name}/

# shellcheck disable=SC2164
cd build/web
git init
# type configurations: your user.email and user.name followed lines
# git config --global user.email your_email
# git config --global user.name your_name

# change this remote url for examle your remote url is https://github.com/onatcipli/flutter_web.git then the following:
git remote add origin "https://github.com/mym0404/${repo_name}.git"
git checkout -b gh-pages
git add .
git commit -m "update" --allow-empty
git push origin gh-pages -f

cd /Users/mj/Desktop/${repo_name} || exit
#!/bin/zsh

cd /Users/mj/Desktop/shdw-character-fight || exit
flutter config --enable-web
flutter pub get
flutter build web --release --web-renderer canvaskit --base-href=/shdw-character-fight/

# shellcheck disable=SC2164
cd build/web
git init
# type configurations: your user.email and user.name followed lines
# git config --global user.email your_email
# git config --global user.name your_name

# change this remote url for examle your remote url is https://github.com/onatcipli/flutter_web.git then the following:
git remote add origin https://github.com/mym0404/shdw-character-fight.git
git checkout -b gh-pages
git add --all
git commit -m "update" --allow-empty
git push origin gh-pages -f

cd /Users/mj/Desktop/shdw-character-fight || exit
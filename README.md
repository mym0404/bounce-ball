```cmd
# get pub dependencies
flutter pub get

# generate ...
dart run build_runner build --delete-conflicting-outputs

# generate launcher icon
dart run flutter_launcher_icons

# generate splash screen
dart run flutter_native_splash:create
```
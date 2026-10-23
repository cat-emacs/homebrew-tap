# Cat Emacs Homebrew tap

Portable JDK 17+ CLIs for macOS and Linux.

```sh
brew install cat-emacs/tap/android-project
brew install cat-emacs/tap/compose-preview
android-project doctor --json
compose-preview doctor --json
```

Homebrew installs OpenJDK 17 as the default; an explicit `JAVA_HOME` is respected
for project-specific toolchains. Runtime dependencies are included in the release
archive; GitHub Packages credentials are not needed.

Emacs Preview integration uses both CLIs. Command-line rendering alone does not
require the project executable. Platform smoke tests cover launchers and doctor,
not full Android rendering on every platform.

Update URLs and SHA-256 values only after both upstream release checks pass.

- [android-project](https://github.com/cat-emacs/android-project)
- [compose-preview](https://github.com/cat-emacs/compose-preview)

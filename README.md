# Cat Emacs Homebrew tap

Portable JVM CLIs for macOS and Linux: Android Project requires JDK 17+;
Compose Preview requires JDK 21+.

```sh
brew install cat-emacs/tap/android-project
brew install cat-emacs/tap/compose-preview
android-project doctor --json
compose-preview doctor --json
```

The formulae depend on unversioned `openjdk`, reusing an existing Homebrew
installation instead of adding `openjdk@17`. An explicit `JAVA_HOME` takes
precedence, including SDKMAN-selected JDKs:

```sh
sdk use java <your-installed-java-21-identifier>
android-project doctor --json
compose-preview doctor --json
```

Preview CLI/renderer use Java 21 or newer. Project Gradle builds may use a
different compatible JDK through existing project JVM policy or Preview's
`--gradle-java-home` option. Latest OpenJDK launcher checks do not imply all project builds
support that JDK. Runtime dependencies are included in the release archive;
GitHub Packages credentials are not needed.

Emacs Preview integration uses both CLIs. Command-line rendering alone does not
require the project executable. Platform smoke tests cover launchers and doctor,
not full Android rendering on every platform.

Update URLs and SHA-256 values only after both upstream release checks pass.

- [android-project](https://github.com/cat-emacs/android-project)
- [compose-preview](https://github.com/cat-emacs/compose-preview)

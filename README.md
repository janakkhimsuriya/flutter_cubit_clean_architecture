# flutter_bloc_architecture

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### 1. Run app in debug or release mode with flavour

1. Run following command to auto generate code with build_runner before run the application in debug or release mode:
   ```shell
   dart run build_runner watch --delete-conflicting-outputs
   ```
2. To run the Android app in debug mode with a specific flavor, use the following command:
   ```shell
   flutter run --debug --flavor <flavor> --dart-define-from-file=.env/<flavor>.json
   ```
3. To run the Android app in release mode with a specific flavor, use the following command:
   ```shell
   flutter run --release --flavor <flavor> --dart-define-from-file=.env/<flavor>.json
   ```

### 2. Build iOS ipa or Android apk or app-bundle in debug or release mode with flavour

1. Navigate to the project directory in your terminal.
2. Run the following command to give execution permissions to the build.sh file:
    ```shell
   chmod +x build.sh
   ```
3. Execute the script by running:
    ```shell
   ./build.sh
   ```

   #### Note: Follow the prompts in the script to complete the build process.

### or

1. Build Android Universal Apk
    ```shell
    flutter build apk --flavor <flavour> --dart-define-from-file=.env/<flavour>.json --release
    ```

2. Build Android Apk using split per abi
    ```shell
    flutter build apk --split-per-abi --flavor <flavour> --dart-define-from-file=.env/<flavour>.json --release
    ```

3. Build Android aab
    ```shell
    flutter build appbundle --flavor <flavour> --dart-define-from-file=.env/<flavour>.json --release
    ```

4. Build iOS ipa
    ```shell
    flutter build ipa --flavor <flavour> --dart-define-from-file=.env/<flavour>.json --release
    ```

5. Build macOS executable
   ```shell
   flutter build macos
   ```
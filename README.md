
# ApexBurn

ApexBurn is a modern, interactive, and professional compiler built using Flutter that allows users to write, save, and open code files, and compile them in various languages like Python, Java, C++, C, and C#. The app offers an intuitive GUI with essential features for compiling and running code in multiple programming languages, making it an ideal tool for developers and programmers.


## Features

- **Multiple Language Support**: Compile and run code in Python, Java, C++, C, and C#.
- **Interactive GUI**: Users can choose the language, write code, open pre-existing files, save new files, and compile them directly from the app.
- **Professional Design**: The user interface is modern and designed for ease of use with clear buttons and code areas for writing and output.

## How ApexBurn is Useful

1. **Multiple Language Compiler**: 
    - ApexBurn supports multiple programming languages, making it convenient for users who work with different technologies.
    - You can easily switch between languages by selecting your desired one before compiling.
    
2. **Efficient Workflow**: 
    - Users can open existing files or start writing code immediately.
    - The app supports saving code to any location, providing flexibility in organizing your projects.

3. **Real-Time Compilation & Output**:
    - The built-in compiler allows users to run code within the app and view the output immediately in the app's output box.
    - No need for external tools; the app handles everything within its environment.

4. **Cross-Platform**:
    - The app can be built for both Windows and macOS, making it accessible to a wide range of users.

## How to Run ApexBurn

### Step 1: Clone the Repository

Clone the repository from GitHub using the following command:

```bash
git clone https://github.com/harsh11x/apexburn.git
```
```bash
cd apexburn
```

### Step 2: Install Flutter

Ensure you have Flutter installed on your system. Follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install) for your platform.

### Step 3: Enable Desktop Support

Enable support for desktop applications in Flutter by running:

```bash
flutter config --enable-windows-desktop
```
```bash
flutter config --enable-macos-desktop
```

### Step 4: Install Dependencies

Install the necessary dependencies by running:

```bash
flutter pub get
```

### Step 5: Running on Windows

To run the app on Windows, use the following command:

```bash
flutter run -d windows
```

### Step 6: Running on macOS

To run the app on macOS, use the following command:

```bash
flutter run -d macos
```

### Step 7: Building for Distribution

#### Building for Windows:

To create a release build for Windows, run:

```bash
flutter build windows
```

This will generate an executable file located at `build/windows/runner/Release`.

#### Building for macOS:

To create a release build for macOS, run:

```bash
flutter build macos
```

This will generate the `.app` file in `build/macos/Build/Products/Release/ApexBurn.app`.

## Conclusion

ApexBurn is a versatile, easy-to-use compiler that offers multi-language support and modern GUI for writing and running code efficiently. Whether you're working on Python, Java, C++, or C#, ApexBurn has you covered with a clean and professional development environment.

# GitGlimpse

The GitGlimpse is a Flutter application that connects to the GitHub API to display a list of public repositories from a specified GitHub account. Additionally, it fetches and displays the latest commit for each repository. The app showcases Flutter's capabilities for making HTTP requests, parsing JSON data, and asynchronously updating the UI.

## Features

- Display a list of public GitHub repositories.
- Fetch and show the latest commit for each repository.
- Utilize a green and red theme for UI elements.

## Getting Started

### Prerequisites

- Flutter installed on your machine (for installation instructions, see the [Flutter official documentation](https://flutter.dev/docs/get-started/install)).
- An IDE (Integrated Development Environment) like Android Studio, VS Code, or IntelliJ.
- A basic understanding of Flutter and Dart.

### Installation

1. Clone the repository to your local machine:

```bash
git clone https://github.com/yourusername/gitglimpse.git
```

2. Navigate to the project directory:
```bash
cd gitglimpse
```
3. Install the required dependencies:
```bash
flutter pub get
```
4. Run the app on your connected device or emulator:
```bash
flutter run
```

### Usage
Upon launching the app, you'll see a list of public repositories fetched from the specified GitHub account. Tap on any repository to view its latest commit message, author, and date.
   

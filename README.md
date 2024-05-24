# scelloo_test

This is a Flutter application that fetches and displays data from the [JSONPlaceholder API](https://jsonplaceholder.typicode.com/posts). It allows users to view a list of posts, view details of a selected post, and create a new post.

## Getting Started

If this is your first time running a Flutter application, you might find these resources helpful:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the [online documentation](https://docs.flutter.dev/), which offers tutorials, samples, guidance on mobile development, and a full API reference.

## How to Run the Project

1. Clone this repository.
2. Navigate to the project directory in your terminal.
3. Run `flutter pub get` to install the necessary dependencies.
4. Start your emulator.
5. Run `flutter run` to start the application.

## Features

- **State Management**: The application uses the BLoC pattern for state management.
- **Post Listing**: Fetches and displays a list of posts from the JSONPlaceholder API.
- **Post Details**: Allows users to view the details of a selected post, including the post title, body, and comments.
- **Create Post**: Users can create a new post by entering a title and body.

## User Interface

- Displays a list of posts with relevant information such as post title and user name.
- Provides a detail view that displays the post title, body, and comments for a selected post.
- Provides a form for creating a new post, allowing the user to enter a title and body.
- Displays appropriate messages for successful or failed operations.

## Error Handling

The application implements proper error handling mechanisms for API failures and other potential errors.

## Code Organization

The code follows best practices for organization, separation of concerns, and maintainability.

## Evaluation Criteria

- Adherence to the BLoC pattern and proper state management implementation
- Functionality and user experience of the application
- Code quality, organization, and maintainability
- Proper error handling and edge case considerations


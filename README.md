# Improper Exception Handling in Asynchronous Dart Code

This repository demonstrates a common error in Dart: improper exception handling in asynchronous operations using `Future`. The `fetchData` function fetches data from an API and includes a `try-catch` block.  However, the error handling within the `catch` block could be more robust.

## Bug
The provided `bug.dart` file contains the flawed code. The `catch` block only prints the exception. In a production environment, more sophisticated error handling is needed, such as logging the error with context, retrying the operation, displaying a user-friendly error message, or implementing fallback mechanisms.

## Solution
The `bugSolution.dart` file provides an improved version with better exception handling. It demonstrates logging the error with more context and handling different types of exceptions differently.  It also shows how to properly handle the exception and gracefully exit if a retry is not possible.
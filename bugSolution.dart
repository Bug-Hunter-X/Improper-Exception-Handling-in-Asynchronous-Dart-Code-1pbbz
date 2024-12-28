```dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer';

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Process the JSON response
      print('Data fetched successfully: $jsonData');
    } else {
      // Handle non-200 status codes
      log('API request failed with status code: ${response.statusCode}. Response body: ${response.body}', level: LogLevel.error);
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } on SocketException catch (e) {
    log('Network error: $e', level: LogLevel.error);
    // Handle network error, such as showing a message or retrying
  } on FormatException catch (e) {
    log('JSON parsing error: $e', level: LogLevel.error);
    // Handle JSON parsing error, perhaps showing a generic error to user
  } catch (e, stacktrace) {
    log('An unexpected error occurred: $e
Stacktrace: $stacktrace', level: LogLevel.severe);
    // Handle other exceptions
  }
}
```
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/question_model.dart';

class ApiService {
  static const String baseUrl = 'https://opentdb.com/';

  static Future<List<Question>> fetchQuestions({
    required int number,
    required int category,
    required String difficulty,
    required String type,
  }) async {
    final response = await http.get(
      Uri.parse(
          '${baseUrl}api.php?amount=$number&category=$category&difficulty=$difficulty&type=$type'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['results'] as List)
          .map((json) => Question.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load questions');
    }
  }
}

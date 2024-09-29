import 'dart:convert';

import 'package:foma/utils/secrets.dart';
import 'package:http/http.dart' as http;
import 'package:google_generative_ai/google_generative_ai.dart';

class OpenAI {
  Future<String> isArtPromptAPI(String prompt) async {
    try {
      final res = await http.post(
          Uri.parse(
              'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=$geminiAPIKey'),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "contents": [
              {
                "parts": [
                  {"text": prompt}
                ]
              }
            ]
          }));

      if (res.statusCode == 200) {
        String content = jsonDecode(res.body);
        print('yay');
        print(content);
      }
      return 'ai';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> chatGPT(String prompt) async {
    return 'Chatgpt';
  }

  Future<String> dallE(String prompt) async {
    return 'Dalle';
  }

  String cleanMarkdown(String text) {
    return text
        .replaceAll(RegExp(r'\*{1,2}\s*'), '')
        .replaceAll(RegExp(r'\n+'), '\n')
        .trim();
  }

  Future<String> gemini(String prompt) async {
    final apiKey = geminiAPIKey;
    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
    );
    final finalPrompt =
        'Basing your answers in Kenyan context only answer the following: $prompt';

    final response = await model.generateContent([Content.text(finalPrompt)]);
    String text = cleanMarkdown(response.text.toString());
    return text;
  }
}

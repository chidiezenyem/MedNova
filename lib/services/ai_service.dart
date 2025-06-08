import 'dart:convert';
import 'package:http/http.dart' as http;

class AIService {
  static const _apiKey = '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';
  static const _url = 'https://openrouter.ai/api/v1/chat/completions';

  Future<String> sendMessage(String prompt) async {
    final response = await http.post(
      Uri.parse(_url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      },
      body: json.encode({
        "model": "mistralai/mistral-7b-instruct:free",  // use a free, fast model
        "messages": [
          {"role": "system", "content": "You are a helpful medical assistant."},
          {"role": "user", "content": prompt}
        ]
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['choices'][0]['message']['content'];
    } else {
      print('❗ AI error: ${response.statusCode}');
      print(response.body);
      return "Sorry, I couldn't respond right now.";
    }
  }
}

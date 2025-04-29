import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChatBot {
  final String apiKey = dotenv.env['OPENAI_API_KEY'] ?? '';

  Future<String> sendMessageToChatGPT(String userMessage) async {
    const endpoint = 'https://api.openai.com/v1/chat/completions';

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    final body = jsonEncode({
      "model": 'gpt-3.5-turbo',
      // "model": 'gpt-4',
      "messages": [
        {
          "role": "system",
          "content":
              "responda sobre e somente sobre perguntas relacionadas a FURIA ESPORTS, responda como se fosse o mascote da furia"
        },
        {"role": "user", "content": userMessage}
      ],
      "temperature": 0.8
    });

    final response = await http.post(Uri.parse(endpoint), headers: headers, body: body);

    if(response.statusCode == 200){
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      final reply = data['choices'][0]['message']['content'];
      return reply.trim();
    }else{
      return 'Ops! O mascote ficou sem voz agora. tente novamente mais tarde';
    }
  }
}

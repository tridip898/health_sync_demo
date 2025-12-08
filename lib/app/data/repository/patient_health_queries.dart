import 'dart:convert';
import 'dart:developer';
import 'package:health_sync_question/app/data/model/complaint_answer_model.dart';
import 'package:http/http.dart' as http;

class PatientHealthQueriesRepository {
  Future<String?> sendComplaintAnswers(
    List<ComplaintAnswerModel> complaintAnswers,
  ) async {
    const apiKey =
        'c2stcHJvai14azY2cXZYY2s3THVyaFZkUE90X0Y2bGdKUXZ5aVFUREdQdThMRFkzTVhocFJKNWF3dm1lUlZEcUdzYTkxM29DSkx5VkJ5OG1fNlQzQmxia0ZKN0syekxWbGZFYVZxdmxQZHV2NFJYdmtiY2VFME4zQXpPNE1UUWE5Q0V2MUM5OExNOGw0WHdWYVFmRjhWYUlaaDdEYnUzVVFVb0E=';

    String decodedString = utf8.decode(base64Decode(apiKey));

    final response = await http.post(
      Uri.parse("https://api.openai.com/v1/chat/completions"),
      headers: {
        "Authorization": "Bearer $decodedString",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "model": "gpt-4o-mini",
        "messages": [
          {
            "role": "system",
            "content":
                "You are a medical adviser AI. Analyze patient complaints and suggest the most suitable doctor. Only choose from the following specialties: [\"Neurologist\",\"Psychiatrist\",\"ENT Specialist\",\"Ophthalmologist\",\"Dentist\",\"Cardiologist\",\"Pulmonologist\",\"Gastroenterologist\",\"Orthopedist\",\"Rheumatologist\",\"Urologist\",\"Gynecologist\",\"Andrologist\",\"Dermatologist\",\"General Physician\",\"Endocrinologist\",\"Allergist\"]. Do not suggest anything outside this list. Convert this ${jsonEncode(complaintAnswers)} into paragraph and return with doctor suggestion",
          },
          {"role": "user", "content": jsonEncode(complaintAnswers)},
        ],
      }),
    );

    log("User Input: ${jsonEncode(complaintAnswers)}");
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      log(result["choices"][0]["message"]["content"]);
      return result["choices"][0]["message"]["content"];
    } else {
      log("Error: ${response.statusCode} - : ${response.body}");
      return null;
    }
  }
}

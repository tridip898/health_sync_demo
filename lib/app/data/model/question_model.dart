class QuestionModel {
  final String question;
  final List<String>? options;

  QuestionModel({required this.question, this.options});

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      question: json['question'],
      options: (json['options'] as List?)?.map((e) => e.toString()).toList(),
    );
  }
}

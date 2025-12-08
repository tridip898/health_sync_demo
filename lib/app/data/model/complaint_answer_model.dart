class ComplaintAnswerModel {
  final String complaint;
  final List<AnswerModel> answers;

  ComplaintAnswerModel({required this.complaint, required this.answers});

  factory ComplaintAnswerModel.fromJson(Map<String, dynamic> json) {
    return ComplaintAnswerModel(
      complaint: json['complaint'] ?? '',
      answers:
          (json['answers'] as List<dynamic>?)
              ?.map((a) => AnswerModel.fromJson(a))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'complaint': complaint,
      'answers': answers.map((e) => e.toJson()).toList(),
    };
  }
}

class AnswerModel {
  final String question;
  final String answer;

  AnswerModel({required this.question, required this.answer});

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      question: json['question'] ?? '',
      answer: json['answer'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'question': question, 'answer': answer};
  }
}

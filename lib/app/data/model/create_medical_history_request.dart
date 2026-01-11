class CreateMedicalHistoryRequest {
  final String title;
  final String description;
  final String date; // dd-MM-yyyy
  final List<String> diseaseCategoryIds;

  CreateMedicalHistoryRequest({
    required this.title,
    required this.description,
    required this.date,
    required this.diseaseCategoryIds,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "date": date,
      "diseaseCategoryIds": diseaseCategoryIds,
    };
  }
}

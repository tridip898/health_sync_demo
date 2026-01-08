class AchievementModel {
  String? achievementId;
  String? title;
  String? provider;
  String? year;
  String? details;
  String? doctorId;

  AchievementModel({
    this.achievementId,
    this.title,
    this.provider,
    this.year,
    this.details,
    this.doctorId,
  });

  AchievementModel.fromJson(Map<String, dynamic> json) {
    achievementId = json['achievementId'];
    title = json['title'];
    provider = json['provider'];
    year = json['year'];
    details = json['details'];
    doctorId = json['doctorId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['achievementId'] = achievementId;
    data['title'] = title;
    data['provider'] = provider;
    data['year'] = year;
    data['details'] = details;
    data['doctorId'] = doctorId;
    return data;
  }
}
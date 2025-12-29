class ProfileModel {
  String? profileId;
  String? fullName;
  String? gender;
  String? dateOfBirth;
  String? address;
  String? image;
  String? publicPhoneNumber;
  String? publicEmail;
  String? createdAt;
  String? updatedAt;

  ProfileModel({
    this.profileId,
    this.fullName,
    this.gender,
    this.dateOfBirth,
    this.address,
    this.image,
    this.publicPhoneNumber,
    this.publicEmail,
    this.createdAt,
    this.updatedAt,
  });

  ProfileModel.fromJson(Map<String, dynamic> json) {
    profileId = json['profileId'];
    fullName = json['fullName'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
    address = json['address'];
    image = json['image'];
    publicPhoneNumber = json['publicPhoneNumber'];
    publicEmail = json['publicEmail'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profileId'] = profileId;
    data['fullName'] = fullName;
    data['gender'] = gender;
    data['dateOfBirth'] = dateOfBirth;
    data['address'] = address;
    data['image'] = image;
    data['publicPhoneNumber'] = publicPhoneNumber;
    data['publicEmail'] = publicEmail;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
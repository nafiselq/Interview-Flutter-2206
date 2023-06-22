class UserModel {
  final String? uid;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final DateTime? createdAt;

  UserModel({
    this.uid,
    this.name,
    this.email,
    this.phoneNumber,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['uuid'],
        name: json['name'],
        email: json['email'],
        phoneNumber: json['phone_number'],
        createdAt: DateTime.parse(json['created']['date']),
      );
}

class UserModel {
  String fullName;
  final String dob;
  final String address;
  final String number;
  String? email;

  UserModel({
    required this.fullName,
    required this.number,
    required this.address,
    required this.dob,

    this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['fullName'],
      number: json['number'],
      address: json['address'],
      dob: json['dob'],
    );
  }
}

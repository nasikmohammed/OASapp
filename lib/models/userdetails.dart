class UserModel {
  final String fullname;
  final String address;
  final String occupation;
  final String phone;
  final String dob;
  final String password;

  UserModel(
      {required this.fullname,
      required this.address,
      required this.occupation,
      required this.phone,
      required this.dob,
      required this.password});
  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "address": address,
        "occupation": occupation,
        "phone": phone,
        "dob": dob,
        "password": password,
      };
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullname: json["fullname"],
      address: json["address"],
      occupation: json["occupation"],
      phone: json["phone"],
      dob: json["dob"],
      password: json["password"],
    );
  }
}

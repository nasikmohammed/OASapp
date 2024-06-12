class UserModel {
  final String fullname;
  final String address;
  final String occupation;
  final String phone;
  final String dob;
  final String password;
  final String email;
    final String? id;
    final String? profile;


  
  

  UserModel({
    required this.fullname,
         this.id,

    required this.address,
    required this.occupation,
    required this.phone,
    required this.dob,
    required this.password,
    required this.email,    required this.profile,

  });
  Map<String, dynamic> toJson(docId) => {
        "fullname": fullname,
         "profile": profile,
        "address": address,
        "occupation": occupation,
        "phone": phone,
        "dob": dob,
        "password": password,
        "email": email,
      };
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullname: json["fullname"],
      email: json["email"],
      address: json["address"],
      occupation: json["occupation"],
      phone: json["phone"],
      dob: json["dob"],
      password: json["password"],profile: json["profile"],
    );
  }
}

class User {
  // String? firstname;
  // String? lastname;
  String? email;
  // String? address;
  String? phone;
  String? username;
  String? password;
  String? gender;
  // String? profileImg;

  User({
    // this.firstname,
    // this.lastname,
    // this.address,
    this.phone,
    this.username,
    this.password,
    this.email,
    // this.profileImg,
  });

  // Converting Json data from server to dart object
  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        // address: json["address"],
        phone: json["phone"],
        username: json["username"],
        password: json["password"],
      );

  // Converting dart object to Json data
  Map<String, dynamic> toJson() => {
        "email": email,
        // "address": address,
        "phone": phone,
        "username": username,
        "password": password,
      };
}

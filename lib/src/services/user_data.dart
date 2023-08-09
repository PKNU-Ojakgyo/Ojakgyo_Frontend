class User {
  final String id;
  final String name;
  final String password;
  final String phone;
  final String profile;

  User({
    required this.id,
    required this.name,
    required this.password,
    required this.phone,
    required this.profile,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      password: json['password'],
      phone: json['phone'],
      profile: json['profile'],
    );
  }
}

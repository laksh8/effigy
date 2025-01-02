class User {
  final String email;
  final String name;
  final String uid;

  User({
    required this.email,
    required this.name,
    required this.uid,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
    };
  }

  factory User.fromJson(Map<String, dynamic> jsonUser) {
    return User(
      email: jsonUser['email'],
      name: jsonUser['name'],
      uid: jsonUser['uid'],
    );
  }
}

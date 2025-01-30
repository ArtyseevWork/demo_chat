//модель користувача
class User {
  final String token;
  final String username;
  final String id;

  User({
    required this.token,
    required this.username,
    required this.id
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      token: json['token'],
      username: json['username'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'username': username,
      'id': id,
    };
  }
}

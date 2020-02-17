class ApiResponse {
  List<User> userList;

  ApiResponse(this.userList);

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    final results = json['results'] as List;
    List<User> userList = results.map((i) => User.fromJson(i)).toList();

    return ApiResponse(userList);
  }
}

class User {
  final String username;
  final String password;
  final String avatarUrl;
  final String email;
  final String gender;
  final String phone;
  final String location;

  User({
    this.username,
    this.password,
    this.avatarUrl,
    this.email,
    this.gender,
    this.phone,
    this.location,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final user = json["user"];
    final _Location location = _Location.fromJson(user["location"]);

    return User(
      username: user["username"],
      password: user["password"],
      avatarUrl: user["picture"],
      email: user["email"],
      gender: user["gender"],
      phone: user["phone"],
      location: location.toString(),
    );
  }

  factory User.fromMap(Map<String, dynamic> query) {
    return User(
      username: query["username"],
      password: query["password"],
      avatarUrl: query["avatarUrl"],
      email: query["email"],
      gender: query["gender"],
      phone: query["phone"],
      location: query["location"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'avatarUrl': avatarUrl,
      'email': email,
      'gender': gender,
      'phone': phone,
      'location': location,
    };
  }
}

class _Location {
  final String street;
  final String city;
  final String state;

  _Location({this.street, this.city, this.state});

  @override
  String toString() {
    return "$street, $city, $state";
  }

  factory _Location.fromJson(Map<String, dynamic> json) {
    return _Location(
      street: json["street"],
      city: json["city"],
      state: json["state"],
    );
  }
}

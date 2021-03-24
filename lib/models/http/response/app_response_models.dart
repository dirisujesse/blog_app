class Blog {
  String id;
  String createdAt;
  String title;
  String imageUrl;

  Blog({
    this.id,
    this.createdAt,
    this.title,
    this.imageUrl,
  });

  Blog.fromJson(Map json)
      : id = json["id"],
        createdAt = json["createdAt"],
        title = json["title"],
        imageUrl = json["imageUrl"];

  toJson() {
    return {
      "id": id,
      "title": title,
      "createdAt": createdAt,
      "imageUrl": imageUrl,
    };
  }
}

class AuthData {
  String token;
  String email;
  String password;

  AuthData({this.token, this.email, this.password});

  AuthData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    email = json['email'];
    password = json['password'];
  }

  bool operator ==(other) {
    return (other is AuthData) && (other.token == token && other.email == email && other.password == password);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }

  @override
  int get hashCode => super.hashCode;

}

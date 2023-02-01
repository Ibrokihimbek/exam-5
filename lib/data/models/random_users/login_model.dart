class Login {
  String uuid;
  String username;
  String password;
  String salt;
  String md5;
  String sha1;
  String sha256;
  Login({
    required this.uuid,
    required this.username,
    required this.password,
    required this.salt,
    required this.md5,
    required this.sha1,
    required this.sha256,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        uuid: json["uuid"] as String? ?? '',
        username: json["username"] as String? ?? '',
        password: json["password"] as String? ?? '',
        salt: json["salt"] as String? ?? '',
        md5: json["md5"] as String? ?? '',
        sha1: json["sha1"] as String? ?? '',
        sha256: json["sha256"] as String? ?? '',
      );
}

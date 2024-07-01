class Login {
  String accessToken;
  int expiresIn;
  String tokenType;

  Login({
    required this.accessToken,
    required this.expiresIn,
    required this.tokenType,
  });

  // Factory constructor to create a Login object from a JSON map
  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      accessToken: json['access_token'],
      expiresIn: json['expires_in'],
      tokenType: json['token_type'],
    );
  }

  // Method to convert a Login object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'expires_in': expiresIn,
      'token_type': tokenType,
    };
  }

  @override
  String toString() {
    return 'Login{accessToken: $accessToken, expiresIn: $expiresIn, tokenType: $tokenType}';
  }
}

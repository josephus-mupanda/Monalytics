class Company {
  String companyName;
  String email;
  String sector;
  String password;

  Company({
    required this.companyName,
    required this.email,
    required this.sector,
    required this.password,
  });

  // Factory method to create a Company instance from a JSON object
  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      companyName: json['company_name'],
      email: json['email'],
      sector: json['sector'],
      password: json['password'],
    );
  }

  // Convert Company instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'company_name': companyName,
      'email': email,
      'sector': sector,
      'password': password,
    };
  }
}

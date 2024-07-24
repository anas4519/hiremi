

class User {
  String fullName;
  String fatherName;
  Gender gender;
  String email;
  String dob;
  String birthPlace;
  String phone;
  String whatsapp;
  String collegeName;
  String collegeState;
  String branch;
  String degree;
  String passingYear;
  String password;

  User({
    required this.fullName,
    required this.fatherName,
    required this.gender,
    required this.email,
    required this.dob,
    required this.birthPlace,
    required this.phone,
    required this.whatsapp,
    required this.collegeName,
    required this.collegeState,
    required this.branch,
    required this.degree,
    required this.passingYear,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullName: json['full_name'] ?? '',
      fatherName: json['father_name'] ?? '',
      gender: Gender.values.firstWhere((e) => e.toString() == 'Gender.${json['gender']}', orElse: () => Gender.Other),
      email: json['email'] ?? '',
      dob: json['date_of_birth'] ?? '',
      birthPlace: json['birth_Place'] ?? '',
      phone: json['phone_number'] ?? '',
      whatsapp: json['whatsapp_number'] ?? '',
      collegeName: json['college_name'] ?? '',
      collegeState: json['college_state'] ?? '',
      branch: json['branch_name'] ?? '',
      degree: json['degree'] ?? '',
      passingYear: json['passing_year'] ?? '',
      password: json['password']?? '',
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'father_name': fatherName,
      'gender': gender.toString().split('.').last,
      'email': email,
      'date_of_birth': dob,
      'birth_Place': birthPlace,
      'phone_number': phone,
      'whatsapp_number': whatsapp,
      'college_name': collegeName,
      'college_state': collegeState,
      'branch_name': branch,
      'degree': degree,
      'passing_year': passingYear,
      'password': password,
    };
  }
}

enum Gender { Male, Female, Other }



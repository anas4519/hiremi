

class UserModel {
  int userId;
  String fullName;
  String fatherName;
  String gender;
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

  UserModel({
    required this.userId,
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
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['id'],
      fullName: json['full_name'] ?? '',
      fatherName: json['father_name'] ?? '',
      gender: json['gender'] ?? '',
      email: json['email'] ?? '',
      dob: json['date_of_birth'] ?? '',
      birthPlace: json['birthPlace'] ?? '',
      phone: json['phone_number'] ?? '',
      whatsapp: json['whatsapp_number'] ?? '',
      collegeName: json['college_name'] ?? '',
      collegeState: json['college_state'] ?? '',
      branch: json['branch_name'] ?? '',
      degree: json['degree'] ?? '',
      passingYear: json['passing_year'] ?? '',
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': userId,
      'full_name': fullName,
      'father_name': fatherName,
      'gender': gender,
      'email': email,
      'date_of_birth': dob,
      'birthPlace': birthPlace,
      'phone_number': phone,
      'whatsapp_number': whatsapp,
      'college_name': collegeName,
      'college_state': collegeState,
      'branch_name': branch,
      'degree': degree,
      'passing_year': passingYear,
    };
  }
}

enum Gender { Male, Female, Other }



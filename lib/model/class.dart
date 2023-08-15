import 'dart:convert';

Cars carsFromJson(String str) => Cars.fromJson(json.decode(str));

class Cars {
  String? status;
  List<Datum>? data;
  String? message;

  Cars({
    this.status,
    this.data,
    this.message,
  });

  factory Cars.fromJson(Map<String, dynamic> json) => Cars(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );
}

class Datum {
  int id;
  String employeeName;
  int employeeSalary;
  int employeeAge;
  String profileImage;

  Datum({
    required this.id,
    required this.employeeName,
    required this.employeeSalary,
    required this.employeeAge,
    required this.profileImage,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        employeeName: json["employee_name"],
        employeeSalary: json["employee_salary"],
        employeeAge: json["employee_age"],
        profileImage: json["profile_image"],
      );
}

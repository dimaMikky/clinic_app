import 'package:clinic_app/feature/domain/entities/employee_entity.dart';

class EmployeeModel extends EmployeeEntity {
  EmployeeModel({
    required firstName,
    required lastName,
    required avatar,
    required link,
    required speciality,
    required workingHours,
    required description,
  }) : super(
          firstName: firstName,
          lastName: lastName,
          avatar: avatar,
          link: link,
          speciality: speciality,
          workingHours: workingHours,
          description: description,
        );

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    List specialityList = [];
    if (json['speciality'].runtimeType == String) {
      specialityList.add(json['speciality']);
    } else {
      specialityList = json['speciality'];
    }
    //print(specialityList);
    return EmployeeModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      avatar: json['avatar'],
      link: json['link'],
      speciality: (specialityList).map((s) => s as String).toList(),
      workingHours: json['workingHours'],
      description: json['description'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'avatar': avatar,
      'link': link,
      'speciality': speciality,
      'workingHours': workingHours,
      'description': description,
    };
  }
}

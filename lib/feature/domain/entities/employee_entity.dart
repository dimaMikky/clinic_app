import 'package:equatable/equatable.dart';

class EmployeeEntity extends Equatable {
  final String firstName;
  final String lastName;
  final String avatar;
  final String link;
  final List<String> speciality;
  final String workingHours;
  final String description;

  EmployeeEntity({
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.link,
    required this.speciality,
    required this.workingHours,
    required this.description,
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        avatar,
        link,
        speciality,
        workingHours,
        description,
      ];
}

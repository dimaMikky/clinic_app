import 'package:clinic_app/feature/domain/entities/employee_entity.dart';
import 'package:equatable/equatable.dart';

abstract class GetEmployeesState extends Equatable {
  const GetEmployeesState();

  @override
  List<Object?> get props => [];
}

class EmployeesEmpty extends GetEmployeesState {}

class EmployeesLoading extends GetEmployeesState {}

class EmployeesLoaded extends GetEmployeesState {
  final List<EmployeeEntity> employeeList;

  EmployeesLoaded({required this.employeeList});

  @override
  List<Object?> get props => [employeeList];
}

class EmployeesLoadingError extends GetEmployeesState {
  final String message;

  EmployeesLoadingError({required this.message});
}

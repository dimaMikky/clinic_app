import 'package:equatable/equatable.dart';

abstract class GetEmployeesEvent extends Equatable {
  const GetEmployeesEvent();

  @override
  List<Object?> get props => [];
}

class GetEmployees extends GetEmployeesEvent {}

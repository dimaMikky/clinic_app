import 'package:clinic_app/core/error/failure.dart';
import 'package:clinic_app/feature/domain/entities/employee_entity.dart';
import 'package:dartz/dartz.dart';

abstract class EmployeeRepository {
  Future<Either<Failure, List<EmployeeEntity>>> getAllEmployees();
}

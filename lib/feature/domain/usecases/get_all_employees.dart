import 'package:clinic_app/core/error/failure.dart';
import 'package:clinic_app/feature/domain/entities/employee_entity.dart';
import 'package:clinic_app/feature/domain/repositories/employee_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllEmployees {
  final EmployeeRepository employeeRepository;

  GetAllEmployees(this.employeeRepository);

  Future<Either<Failure, List<EmployeeEntity>>>
      getAllEmployeesFromRepo() async {
    return await employeeRepository.getAllEmployees();
  }
}

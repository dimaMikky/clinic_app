import 'package:clinic_app/core/error/exception.dart';
import 'package:clinic_app/core/error/failure.dart';
import 'package:clinic_app/feature/data/datasourses/employee_remote_datasource.dart';
import 'package:clinic_app/feature/domain/entities/employee_entity.dart';
import 'package:clinic_app/feature/domain/repositories/employee_repository.dart';
import 'package:dartz/dartz.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final EmployeeRemoteDataSource employeeRemoteDataSource;

  EmployeeRepositoryImpl({required this.employeeRemoteDataSource});
  @override
  Future<Either<Failure, List<EmployeeEntity>>> getAllEmployees() async {
    try {
      final remoteEmployee = await employeeRemoteDataSource.getAllEmployees();
      return Right(remoteEmployee);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

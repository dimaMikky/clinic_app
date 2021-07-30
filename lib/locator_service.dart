import 'package:clinic_app/feature/data/datasourses/employee_remote_datasource.dart';
import 'package:clinic_app/feature/data/repositories/employee_repository_impl.dart';
import 'package:clinic_app/feature/domain/repositories/employee_repository.dart';
import 'package:clinic_app/feature/domain/usecases/get_all_employees.dart';
import 'package:clinic_app/feature/presentation/bloc/employee_list_bloc.dart';
import 'package:clinic_app/mockData/fake_data.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //bloc/cubit
  sl.registerFactory(() => GetEmployeesBloc(getAllEmployees: sl()));

  //useCases
  sl.registerLazySingleton(() => GetAllEmployees(sl()));

  //Repository
  sl.registerLazySingleton<EmployeeRepository>(() => EmployeeRepositoryImpl(
        employeeRemoteDataSource: sl(),
      ));
  sl.registerLazySingleton<EmployeeRemoteDataSource>(
      () => EmployeeRemoteDataSourceImpl(
            client: http.Client(),
            fakeDescription: sl(),
          ));

  // External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => FakeData());
}

import 'package:clinic_app/core/error/failure.dart';
import 'package:clinic_app/feature/domain/usecases/get_all_employees.dart';
import 'package:clinic_app/feature/presentation/bloc/employee_list_event.dart';
import 'package:clinic_app/feature/presentation/bloc/employee_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetEmployeesBloc extends Bloc<GetEmployeesEvent, GetEmployeesState> {
  final GetAllEmployees getAllEmployees;
  GetEmployeesBloc({required this.getAllEmployees}) : super(EmployeesEmpty());

  @override
  Stream<GetEmployeesState> mapEventToState(GetEmployeesEvent event) async* {
    List<String> accesebility = [];
    if (event is GetEmployees) {
      yield EmployeesLoading();
      final failureOrEmployee = await getAllEmployees.getAllEmployeesFromRepo();
      yield failureOrEmployee.fold(
          (failure) =>
              EmployeesLoadingError(message: _mapFailureToMessage(failure)),
          (employee) {
        getAccebilityInfo(employee, accesebility);
        return EmployeesLoaded(
            employeeList: employee, accesebility: accesebility);
      });
    }
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return 'Server Failure';
    default:
      return 'Unexpected Error';
  }
}

void getAccebilityInfo(employee, accesebility) {
  for (var i = 1; i <= employee.length; i++) {
    if (i % 3 == 0) {
      print(1);
      accesebility.add('online');
    } else
      accesebility.add('offline');
  }
}

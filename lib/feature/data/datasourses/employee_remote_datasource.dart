import 'dart:convert';

import 'package:clinic_app/core/error/exception.dart';
import 'package:clinic_app/feature/data/models/employee_model.dart';
import 'package:clinic_app/mockData/fake_data.dart';
import 'package:http/http.dart' as http;

const URL = 'https://5fe21e077a94870017682132.mockapi.io/api/testtask/doctors';

abstract class EmployeeRemoteDataSource {
  /// Calls the 'https://5fe21e077a94870017682132.mockapi.io/api/testtask/doctors' endpoint
  ///
  /// Throws a [ServerException] for all error code
  Future<List<EmployeeModel>> getAllEmployees();
}

class EmployeeRemoteDataSourceImpl implements EmployeeRemoteDataSource {
  final FakeData fakeDescription;
  final http.Client client;

  EmployeeRemoteDataSourceImpl(
      {required this.client, required this.fakeDescription});

  @override
  Future<List<EmployeeModel>> getAllEmployees() async {
    final response = await client
        .get(Uri.parse(URL), headers: {'Content-type': 'application/json'});
    if (response.statusCode == 200) {
      final employees = json.decode(response.body);
      return (employees as List).map((employee) {
        employee['description'] =
            (fakeDescription.descriptions.toList()..shuffle()).first;
        employee['workingHours'] =
            (fakeDescription.workingHours.toList()..shuffle()).first;
        //print(fakeDescription.getDescriptions);
        return EmployeeModel.fromJson(employee);
      }).toList();
    } else {
      throw ServerException();
    }
  }
}

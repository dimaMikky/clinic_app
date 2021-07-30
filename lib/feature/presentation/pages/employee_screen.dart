import 'package:clinic_app/feature/presentation/widgets/employees_list_widget.dart';
import 'package:flutter/material.dart';

class MyhomePage extends StatelessWidget {
  const MyhomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of employees'),
        centerTitle: true,
        actions: [],
      ),
      body: EmployeesList(),
    );
  }
}

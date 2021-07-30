import 'dart:async';

import 'package:clinic_app/feature/domain/entities/employee_entity.dart';
import 'package:clinic_app/feature/presentation/bloc/employee_list_bloc.dart';
import 'package:clinic_app/feature/presentation/bloc/employee_list_event.dart';
import 'package:clinic_app/feature/presentation/bloc/employee_list_state.dart';
import 'package:clinic_app/feature/presentation/widgets/employee_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeesList extends StatefulWidget {
  const EmployeesList({Key? key}) : super(key: key);

  @override
  _EmployeesListState createState() => _EmployeesListState();
}

class _EmployeesListState extends State<EmployeesList> {
  final scrollController = ScrollController();
  List<EmployeeEntity> employees = [];
  List<String> accesebility = [];
  void setupScrollController(BuildContext context) {
    BlocProvider.of<GetEmployeesBloc>(context);
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<GetEmployeesBloc>(context);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetEmployeesBloc, GetEmployeesState>(
        builder: (context, state) {
      bool isLoading = false;
      if (state is EmployeesEmpty) {
        BlocProvider.of<GetEmployeesBloc>(context).add(GetEmployees());
      } else if (state is EmployeesLoading) {
        return _loadingIndicator();
      } else if (state is EmployeesLoaded) {
        employees = state.employeeList;
        accesebility = state.accesebility;
      } else if (state is EmployeesLoadingError) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  state.message,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Center(
                child: FloatingActionButton.extended(
                  onPressed: () {
                    BlocProvider.of<GetEmployeesBloc>(context)
                        .add(GetEmployees());
                  },
                  label: const Text('Try again'),
                  icon: const Icon(Icons.replay),
                  backgroundColor: Colors.green,
                ),
              )
            ],
          ),
        );
      }
      return Column(
        children: [
          Expanded(
            child: SizedBox(
              child: ListView.separated(
                controller: scrollController,
                itemBuilder: (context, index) {
                  if (index < employees.length) {
                    return Dismissible(
                      child: EmployeeCard(
                        employee: employees[index],
                        accesebility: accesebility[index],
                      ),
                      key: ValueKey<EmployeeEntity>(employees[index]),
                      onDismissed: (DismissDirection direction) {
                        setState(() {
                          employees.removeAt(index);
                        });
                      },
                    );
                  } else {
                    Timer(Duration(microseconds: 300), () {
                      scrollController
                          .jumpTo(scrollController.position.maxScrollExtent);
                    });
                    return _loadingIndicator();
                  }
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey[400],
                  );
                },
                itemCount: employees.length + (isLoading ? 1 : 0),
              ),
            ),
          ),
        ],
      );
    });
  }
}

Widget _loadingIndicator() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

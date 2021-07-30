import 'package:clinic_app/common/app_colors.dart';
import 'package:clinic_app/feature/presentation/bloc/employee_list_bloc.dart';
import 'package:clinic_app/feature/presentation/pages/employee_screen.dart';
import 'package:clinic_app/locator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'locator_service.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<GetEmployeesBloc>(),
        child: MaterialApp(
          theme: ThemeData.dark().copyWith(
              backgroundColor: AppColors.mainBackground,
              scaffoldBackgroundColor: AppColors.mainBackground),
          home: MyhomePage(),
        ));
  }
}

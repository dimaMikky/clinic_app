import 'package:clinic_app/common/app_colors.dart';
import 'package:clinic_app/feature/presentation/pages/web_profile_employee.dart';
import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  final firstName;
  final lastName;
  final specialities;
  final description;
  final workingHours;
  final link;

  const SecondRoute(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.specialities,
      required this.description,
      required this.workingHours,
      required this.link})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee Information"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Employee name:',
              style: TextStyle(color: AppColors.greyColor),
            ),
            SizedBox(
              height: 4,
            ),
            Text('$firstName $lastName'),
            SizedBox(height: 12),
            Text(
              'Specialities:',
              style: TextStyle(color: AppColors.greyColor),
            ),
            SizedBox(
              height: 4,
            ),
            empoyeeSpecialities(specialities),
            SizedBox(height: 12),
            Text(
              'Eployee description:',
              style: TextStyle(color: AppColors.greyColor),
            ),
            SizedBox(
              height: 4,
            ),
            Text(description),
            SizedBox(height: 12),
            Center(
              child: Text(
                'Working Hours:',
                style: TextStyle(color: AppColors.greyColor),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(workingHours),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThirdRoute(link: link),
                  ),
                );
              },
              child: Text('Go to employee web profile'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back!'),
            ),
            SizedBox(height: 22),
          ],
        ),
      ),
    );
  }
}

Widget empoyeeSpecialities(data) {
  String text = '';
  data.forEach(
      (element) => text += (data.length != 1) ? '$element, ' : '$element');
  return Text(
    text,
    style: TextStyle(
      color: Colors.white,
    ),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}

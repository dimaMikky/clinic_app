import 'package:cached_network_image/cached_network_image.dart';
import 'package:clinic_app/common/app_colors.dart';
import 'package:clinic_app/feature/domain/entities/employee_entity.dart';
import 'package:clinic_app/feature/presentation/pages/detailed_employee_screen.dart';
import 'package:flutter/material.dart';

class EmployeeCard extends StatelessWidget {
  final EmployeeEntity employee;
  const EmployeeCard({Key? key, required this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondRoute(
                firstName: employee.firstName,
                lastName: employee.lastName,
                specialities: employee.speciality,
                description: employee.description,
                workingHours: employee.workingHours,
                link: employee.link),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.cellBackground,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Container(
              height: 166,
              width: 166,
              child: CachedNetworkImage(
                imageUrl: employee.avatar,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FullName:',
                    style: TextStyle(color: AppColors.greyColor),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '${employee.firstName} ${employee.lastName}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

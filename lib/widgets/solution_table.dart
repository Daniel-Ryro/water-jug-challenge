import 'package:flutter/material.dart';
import 'package:water_jug_challenge/helpers/localization_helper.dart';
import '../../models/jug_state.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart'; 

class SolutionTable extends StatelessWidget {
  final List<ChallengeState> solutionSteps;

  const SolutionTable({Key? key, required this.solutionSteps})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.dividerColor.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            return AppColors.backgroundWhite;
          }),
          columnSpacing: 38.0,
          dataRowMinHeight: 40.0,
          headingRowHeight: 48.0,
          columns:  [
            DataColumn(
              label: Text(
                AppLocalization .get('bucket_x'),
                style: AppTextStyles.tabbleBody,
              ),
            ),
            DataColumn(
              label: Text(
               AppLocalization .get('bucket_y'),
                style: AppTextStyles.tabbleBody,
              ),
            ),
            DataColumn(
              label: Text(
               AppLocalization .get('explanation'),
                style: AppTextStyles.tabbleBody,
              ),
            ),
          ],
          rows: solutionSteps.map(
            (ChallengeState step) {
              return DataRow(
                cells: [
                  DataCell(Text(step.x.toString())),
                  DataCell(Text(step.y.toString())),
                  DataCell(Text(step.action)),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

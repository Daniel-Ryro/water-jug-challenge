import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/app_spacings.dart';
import '../constants/text_styles.dart';
import '../helpers/localization_helper.dart';
import 'solution_display.dart';
import '../controllers/water_jug_solver.dart';
import '../models/jug_state.dart';

class WaterJugForm  extends StatefulWidget {
  const WaterJugForm ({super.key});

  @override
  _WaterJugFormtState createState() => _WaterJugFormtState();
}

class _WaterJugFormtState extends State<WaterJugForm > {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _xController = TextEditingController();
  final TextEditingController _yController = TextEditingController();
  final TextEditingController _zController = TextEditingController();
  List<ChallengeState> _solutionSteps = [];

  void _solveJugProblem() {
    if (_formKey.currentState!.validate()) {
      final int x = int.tryParse(_xController.text) ?? 0;
      final int y = int.tryParse(_yController.text) ?? 0;
      final int z = int.tryParse(_zController.text) ?? 0;

      final WaterJugSolver jugSolver = WaterJugSolver(xCapacity: x, yCapacity: y);

      final steps = jugSolver.solveJugProblem(z);

      setState(() {
        _solutionSteps = steps;
      });
    }
  }

  void _clearForm() {
    _xController.clear();
    _yController.clear();
    _zController.clear();

    _formKey.currentState?.reset();

    setState(() {
      _solutionSteps = [];
    });
  }

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalization .get('enterValue');
    } else if (int.tryParse(value) == null || int.tryParse(value)! <= 0) {
      return AppLocalization .get('enterPositiveValue');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _xController,
                decoration: InputDecoration(
                  labelText: AppLocalization .get('enter_jug_x_capacity'),
                  labelStyle: AppTextStyles.body,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: _validateInput,
              ),
              AppSpacing.medium,
              TextFormField(
                controller: _yController,
                decoration: InputDecoration(
                  labelText: AppLocalization .get('enter_jug_y_capacity'),
                  labelStyle: AppTextStyles.body,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: _validateInput,
              ),
              AppSpacing.large,
              TextFormField(
                controller: _zController,
                decoration: InputDecoration(
                  labelText: AppLocalization .get('enter_goal_amount_z'),
                  labelStyle: AppTextStyles.body,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: _validateInput,
              ),
              AppSpacing.bannerSpace,
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: _solveJugProblem,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    AppLocalization .get('solve_button'),
                    style: AppTextStyles.welcome.copyWith(
                      color: AppColors.backgroundWhite.withOpacity(1),
                    ),
                  ),
                ),
              ),
              AppSpacing.large,             
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: _clearForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonClearColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    AppLocalization .get('Clear'),
                    style: AppTextStyles.welcome.copyWith(
                      color: AppColors.backgroundWhite.withOpacity(1),
                    ),
                  ),
                ),
              ),
              SolutionDisplayWidget(solutionSteps: _solutionSteps),
            ],
          ),
        ),
      ),
    );
  }
}

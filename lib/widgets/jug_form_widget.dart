import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/spacing.dart';
import '../constants/text_styles.dart';
import '../helpers/localization.dart';
import 'solution_display_widget.dart';
import '../controllers/jug_solver.dart';
import '../models/jug_state.dart';

class JugFormWidget extends StatefulWidget {
  const JugFormWidget({super.key});

  @override
  _JugFormWidgetState createState() => _JugFormWidgetState();
}

class _JugFormWidgetState extends State<JugFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _xController = TextEditingController();
  final TextEditingController _yController = TextEditingController();
  final TextEditingController _zController = TextEditingController();
  List<JugState> _solutionSteps = [];

  void _solveJugProblem() {
    if (_formKey.currentState!.validate()) {
      final int x = int.tryParse(_xController.text) ?? 0;
      final int y = int.tryParse(_yController.text) ?? 0;
      final int z = int.tryParse(_zController.text) ?? 0;

      final JugSolver jugSolver = JugSolver(xCapacity: x, yCapacity: y);

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
      return Localization.get('enterValue');
    } else if (int.tryParse(value) == null || int.tryParse(value)! <= 0) {
      return Localization.get('enterPositiveValue');
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
                  labelText: Localization.get('enter_jug_x_capacity'),
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
                  labelText: Localization.get('enter_jug_y_capacity'),
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
                  labelText: Localization.get('enter_goal_amount_z'),
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
                    Localization.get('solve_button'),
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
                    Localization.get('Clear'),
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

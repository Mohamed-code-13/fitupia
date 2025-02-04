import '../size_config/size_config.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_indicator.dart';
import '../widgets/welcome_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/registration_cubit/registration_cubit.dart';
import '../widgets/label_input_field.dart';
import '../widgets/show_snack_bar_context.dart';
import 'signup3_screen.dart';

class SignUp2Screen extends StatefulWidget {
  static const String routeName = '/signup2_screen';

  const SignUp2Screen({super.key});

  @override
  State<SignUp2Screen> createState() => _SignUp1ScreenState();
}

class _SignUp1ScreenState extends State<SignUp2Screen> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _heightController.dispose();
    _weightController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const WelcomeMessage(),
            LabelInputField(
              title: 'Height',
              hintText: 'Enter your height in CM',
              textEditingController: _heightController,
              textInputType: TextInputType.number,
              icon: const Icon(Icons.height),
            ),
            LabelInputField(
              title: 'Weight',
              hintText: 'Enter your Weight in KG',
              textEditingController: _weightController,
              textInputType: TextInputType.number,
              icon: const Icon(Icons.monitor_weight_outlined),
            ),
            _buildSubmitButton(),
            const CustomIndicator(size: 2),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomButton(
        title: 'Next',
        backgroundColor: const Color.fromARGB(255, 2, 106, 154),
        color: Colors.white,
        icon: Icons.arrow_forward_ios_outlined,
        fontSize: SizeConfig.getProportionateScreenWidth(18),
        onPressed: () {
          if (_checkInput()) {
            var regCubit = BlocProvider.of<RegistrationCubit>(context);
            final currentData = regCubit.curUser;
            currentData.copyWith(
              height: double.tryParse(_heightController.text),
              weight: double.tryParse(_weightController.text),
            );

            regCubit.updateUserDate(currentData);

            Navigator.of(context).pushNamed(SignUp3Screen.routeName);
          }
        },
      ),
    );
  }

  bool _checkInput() {
    List<List<String?>?> checks = [_checkHeight(), _checkWeight()];

    for (var check in checks) {
      if (check == null) continue;

      showSnackBarContext(
        context,
        check[0]!,
        const Color.fromARGB(255, 188, 37, 26),
        imgPath: check[1],
      );
      return false;
    }

    return true;
  }

  List<String?>? _checkHeight() {
    if (_heightController.text.isEmpty) {
      return ["Height can't be empty", null];
    }

    double? height = double.tryParse(_heightController.text);
    if (height == null) {
      return ["Invalid Height", null];
    } else if (height < 120 || height > 230) {
      return [
        "Height must be between 120 and 230",
        "assets/images_reg/height.png"
      ];
    }
    return null;
  }

  List<String?>? _checkWeight() {
    if (_weightController.text.isEmpty) {
      return ["Weight can't be empty", null];
    }

    double? weight = double.tryParse(_weightController.text);
    if (weight == null) {
      return ["Invalid Weight", null];
    } else if (weight < 30 || weight > 300) {
      return [
        "Weight must be between 30 and 300",
        "assets/images_reg/weight-scale.png"
      ];
    }
    return null;
  }
}

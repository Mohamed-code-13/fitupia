import '../../logic/read_user_cubit/read_user_cubit.dart';
import '../../logic/registration_cubit/registration_cubit.dart';
import 'home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../size_config/size_config.dart';
import '../widgets/animated_text.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    BlocProvider.of<ReadUserCubit>(context).getUser();

    initializeAnimation();

    navigateToNextScreen();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _getImage(context),
            AnimatedText(title: 'Fitupia', slideAnimation: _slideAnimation),
          ],
        ),
      ),
    );
  }

  Widget _getImage(BuildContext context) {
    return Image.asset(
      'assets/logo2.png',
      height: MediaQuery.of(context).size.width / 2,
    );
  }

  void initializeAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
        .animate(_animationController);

    _animationController.forward();
  }

  void navigateToNextScreen() {
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        var readCubit = BlocProvider.of<ReadUserCubit>(context);
        if (readCubit.state is ReadUserNew) {
          return Navigator.of(context)
              .pushReplacementNamed(WelcomeScreen.routeName);
        }
        var regCubit = BlocProvider.of<RegistrationCubit>(context);
        regCubit.updateUserDate(readCubit.userData!);
        return Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      },
    );
  }
}

import 'package:flutter/material.dart';

import '../size_config/size_config.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'No meals added today!',
            style: TextStyle(
              color: Color.fromARGB(255, 182, 173, 5),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          const Text(
            'Start adding meals.',
            style: TextStyle(
              color: Color.fromARGB(255, 182, 173, 5),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          Image.asset(
            'assets/images/empty_screen.png',
            fit: BoxFit.cover,
            width: SizeConfig.screenWidth,
          ),
        ],
      ),
    );
  }
}

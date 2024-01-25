import 'package:flutter/material.dart';

import '../../models/card_content.dart';
import "../themes/appbar.dart";
import '../widgets/custom_drawer.dart';
import '../widgets/custom_listview.dart';
import 'calendar_screen.dart';
import 'diet_screen.dart';
import 'workout_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home_screen';

  final List<CardContent> homeCards = const [
    CardContent(
      name: 'Today\'s calories',
      imgPath: 'assets/images/Firefly food.jpg',
      routeName: DietScreen.routeName,
    ),
    CardContent(
      name: 'Exercise',
      imgPath: 'assets/images/Firefly exercise.jpg',
      routeName: WorkoutScreen.routeName,
    ),
    CardContent(
      name: 'Track your progress',
      imgPath: 'assets/images/Firefly calendar.jpg',
      routeName: CalendarScreen.routeName,
    ),
  ];

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        'Fitupia',
        Colors.white70,
        const Color.fromARGB(255, 70, 163, 240),
        back: false,
      ),
      drawer: const CustomDrawer(),
      body: CustomListView(cards: homeCards),
    );
  }
}

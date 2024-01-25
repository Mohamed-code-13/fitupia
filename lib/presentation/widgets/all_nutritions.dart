import 'package:flutter/material.dart';

import '../../models/nutrition_model.dart';
import 'nutrition_widget.dart';

class AllNutritions extends StatelessWidget {
  final List<NutritionModel> nutritions;

  const AllNutritions({
    required this.nutritions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: nutritions.map((nutrition) {
        return NutritionWidget(nutritionModel: nutrition);
      }).toList(),
    );
  }
}

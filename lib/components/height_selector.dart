import 'package:flutter/material.dart';
import 'package:imc_calculadora/core/app_colors.dart';
import 'package:imc_calculadora/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  const HeightSelector({super.key});

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  double height = 170; //Altura inicial
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Altura", style: TextStyles.bodyStyle),
        Text("${height.toStringAsFixed(0)} cm", style: TextStyles.bodyStyle),
        Slider(
            value: height,
            onChanged: (newHeight){
              setState(() {
                height = newHeight;
              });
            }, 
            min: 150,
            max: 220,
            divisions: 70,
            label: "${height.toStringAsFixed(0)} cm",
            activeColor: AppColors.primary,

        )
      ],
    );
  }
}
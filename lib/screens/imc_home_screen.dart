import 'package:flutter/material.dart';
import 'package:imc_calculadora/components/gender_selector.dart';
import 'package:imc_calculadora/components/height_selector.dart';
import 'package:imc_calculadora/components/number_selector.dart';
import 'package:imc_calculadora/core/app_colors.dart';
import 'package:imc_calculadora/core/text_styles.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  int selectedAge = 20;
  int selectedWeight = 80;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        HeightSelector(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(child: NumberSelector(title: "PESO", value: selectedWeight , onIncrement: () {
                setState(() {
                  selectedWeight++;
                });
              },
                onDecrement: (){
                  setState(() {
                    selectedWeight--;
                  });
                },
               )),              
              SizedBox(width: 16),
              Expanded(child: NumberSelector(title: "EDAD", value: selectedAge, onIncrement: () {
                setState(() {
                  selectedAge++;
                });
              }, onDecrement: () {
                setState(() {
                  selectedAge--;
                });
              },)),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(onPressed: (){},style: ButtonStyle(
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              )),
              backgroundColor: WidgetStateProperty.all(AppColors.primary)
            ) ,child: Text("Calcular", style: TextStyles.bodyStyle,))),
        )
      ],
    );
  }
}
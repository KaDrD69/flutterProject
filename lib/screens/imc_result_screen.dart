import 'package:flutter/material.dart';
import 'package:imc_calculadora/core/app_colors.dart';
import 'package:imc_calculadora/core/text_styles.dart';

class ImcResultSreen extends StatelessWidget {
  final double height;
  final int weight;
  const ImcResultSreen({super.key, required this.height, required this.weight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: toolbarResult(),
      body: bodyResult(),
    ); 
  }

  Padding bodyResult() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [         
          Text("Tu resultado", style: TextStyle(
            fontSize: 38,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 32, left: 16, right: 16),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Text("awe")
              ),
            ),
          )
        ],
      ),
    );
  }

  AppBar toolbarResult() {
    return AppBar(
      title: Text("Resultado", ),
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    );
  }
}
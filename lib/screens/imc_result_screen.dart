import 'package:flutter/material.dart';
import 'package:imc_calculadora/core/app_colors.dart';
import 'package:imc_calculadora/core/text_styles.dart';

class ImcResultSreen extends StatelessWidget {
  final double height;
  final int weight;
  const ImcResultSreen({super.key, required this.height, required this.weight});

  @override
  Widget build(BuildContext context) {
    double heightMet = height/100;
    double imcResult = weight/((heightMet)*(heightMet));
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: toolbarResult(),
      body: bodyResult(imcResult),
    ); 
  }

  Padding bodyResult(imcResult) {
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
              padding: const EdgeInsets.only(top: 32, bottom: 32),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Sobrepeso", style: TextStyle(color: Colors.red),),
                    Text(imcResult.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 56,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    )),
                    Text("informacion de no se que", style: TextStyles.bodyStyle)
                  ],
                )
              ),
            ),
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){},
              style: ButtonStyle(
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
              ),
              child: Text("Finalizar", style: TextStyles.bodyStyle)
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
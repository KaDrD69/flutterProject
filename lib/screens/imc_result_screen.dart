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
    Map<String, dynamic> valueImc = getColorState(imcResult);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: toolbarResult(),
      body: bodyResult(imcResult, valueImc, context),
    ); 
  }

  Padding bodyResult(imcResult, valueImc, BuildContext context) {
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
                    Text(valueImc["imc"] as String,
                    style: TextStyle(
                      fontSize: 28,
                      color: valueImc["color"] as Color),
                    ),
                    Text(imcResult.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    )),
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Text(valueImc["des"] as String, style: TextStyles.bodyStyle2, textAlign: TextAlign.center,),
                    )
                  ],
                )
              ),
            ),
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
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
  
  getColorState(double resultIMC) {
    return switch (resultIMC) {
      < 18.5 => {"color": Colors.blue, "imc":"Bajo peso", "des":"Tienes que comer mas amiguito"},  
      < 24.9 => {"color": Colors.green, "imc":"Normal", "des":"Estas en perfectas condiciones" },
      < 29.99 =>{"color": Colors.orange, "imc":"Sobrepeso", "des":"Empieza a preocuparte estas algo gordito"},
      _ => {"color": Colors.red, "imc":"Cerdo", "des":"Estas hecho mierda, eres un cerdo asqueroso"}, 
    };
  }
}
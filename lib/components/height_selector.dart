import 'package:flutter/material.dart';
import 'package:imc_calculadora/core/app_colors.dart';
import 'package:imc_calculadora/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  final double valor;
  final Function(double) obtener;
  const HeightSelector({super.key, required this.valor, required this.obtener});

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16)
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text("Altura", style: TextStyles.bodyStyle),
            ),
            Text(
              "${widget.valor.toStringAsFixed(0)} cm",
              style: TextStyle(
                color: Colors.white,
                fontSize: 37,
                fontWeight: FontWeight.bold,
              ),
            ),
            Slider(
                value: widget.valor,
                onChanged: (newHeight){
                  setState(() {
                    widget.obtener(newHeight);
                  });
                }, 
                min: 150,
                max: 220,
                divisions: 70,
                label: "${widget.valor.toStringAsFixed(0)} cm",
                activeColor: AppColors.primary,
        
            )
          ],
        ),
      ),
    );
  }
}
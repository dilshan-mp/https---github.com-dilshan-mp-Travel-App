import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_text.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
    final Color color;
    String? text;
    IconData?icon;
    final Color backgroundColor;
    double size;
    final Color borderColor;
    bool isIcon;

   AppButton({
    this.isIcon=false,
    super.key,
    this.text="hi",
    this.icon,
    required this.color,
    required this.backgroundColor,
    required this.size,
    required this.borderColor,
  });


  @override
  Widget build(BuildContext context) {
  
    
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor
      ),
      child: isIcon==false?Center(child: AppText(text: text!,color: color,)):Center(child: Icon(icon,color: color,)),
    ); 
  }
}
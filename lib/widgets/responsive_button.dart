import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({
    super.key,
    this.width,
    this.isResponsive
  }
  );

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor
      ) ,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
            ),
            SizedBox(width: null,),
          Icon(
           Icons.arrow_forward_ios_rounded,
          color: Colors.white,
          )
        ],
      ),
    );
  }
}
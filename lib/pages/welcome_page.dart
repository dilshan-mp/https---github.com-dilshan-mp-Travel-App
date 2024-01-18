import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class Welcomepage extends StatefulWidget {
  const Welcomepage({super.key});

  @override
  State<Welcomepage> createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  List images = [
    "welcome1.jpg",
    "welcom2.jpg",
    "welcome3.jpg",

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index){
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  // ignore: prefer_interpolation_to_compose_strings
                  "assets/img/"+images[index]
                ),
                fit:BoxFit.cover
              )
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 150,left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: "Trips"),
                      AppText(text: "Mountain",size: 30,),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: 250,
                        child: AppText(
                          text: "Mountain hikes you an incredible sense of freedom along with endurance test ",
                          color: AppColors.textColor2,
                          size: 14,
                        ),
                      ),
                      const SizedBox(height: 40,),
                      GestureDetector(
                        onTap:(){
                          BlocProvider.of<AppCubits>(context).getData();
                        } ,
                        child: Container(
                          width: 200,
                          child: Row(
                            children: [
                              ResponsiveButton(width: 120,),
                            ],
                          )))
                      

                    ],
                  ),
                  Column(
                    children: 
                      List.generate(3, (indeDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indeDots?25:8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indeDots?AppColors.mainColor:AppColors.mainColor.withOpacity(0.3)
                          ),
                        );
                        
                      })
                  )
                ],
              ),
            ),
          );
      }),
    );
  }
}
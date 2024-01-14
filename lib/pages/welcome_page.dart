import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_large_text.dart';

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
                children: [
                  Column(
                    children: [
                      AppLargeText(text: "Trips"),
                    ],
                  )
                ],
              ),
            ),
          );
      }),
    );
  }
}
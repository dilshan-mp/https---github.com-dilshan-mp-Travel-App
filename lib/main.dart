import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubit_logic.dart';
import 'package:travel_app/pages/details_page.dart';
//import 'package:travel_app/pages/navpages/main_page.dart';
//import 'package:travel_app/pages/welcome_page.dart';

import 'package:device_preview/device_preview.dart';
import 'package:travel_app/services/data_services.dart';

void main() => runApp(
  DevicePreview(
    builder: (context) => const MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      
      home:  BlocProvider<AppCubits>(
        create:(BuildContext context)=>AppCubits(
          data: DataServvices(),
        ),
        child:AppCubitLogics(),
      )
    );
  }
}



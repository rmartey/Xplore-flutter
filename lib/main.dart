// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xplore/cubit/app_cubit.dart';
import 'package:xplore/cubit/app_cubit_logic.dart';
import 'package:xplore/pages/details_page.dart';
import 'package:xplore/pages/main_page.dart';
import 'package:xplore/pages/welcome_page.dart';
import 'package:xplore/services/data_services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyAPp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Xplore",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(
          data: DataServices(),
        ),
        child: AppCubitLogics(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trending_app/UI/login.dart';
import 'package:trending_app/app_theme.dart';
import 'package:trending_app/bloc/login/login_bloc.dart';
import 'package:trending_app/extensions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trending app',
      theme: context.isDarkMode?CustomThemeData().getThemeData1():CustomThemeData().getThemeData(),
      home:  BlocProvider(
        create: (context) => LoginBloc(),
        child: Login(),
    )
    );
  }
}

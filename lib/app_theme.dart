import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomThemeData {
  ThemeData getThemeData() {
    return ThemeData(
        primaryColor: Colors.white,
        highlightColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
        splashColor: Colors.transparent,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 18.0, color: Colors.black),
        bodyMedium: TextStyle(fontSize: 30.0, color: Colors.black,fontWeight: FontWeight.bold),
        titleSmall: TextStyle(fontSize: 15.0, color: Colors.black),
      ),
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Colors.black),
        appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                systemStatusBarContrastEnforced: false)),
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(Colors.black.withOpacity(0.24)),
        ),
        inputDecorationTheme: getInputDecorationTheme(),
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
            splashFactory: NoSplash.splashFactory,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            overlayColor: MaterialStatePropertyAll(Colors.transparent),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
          splashFactory: NoSplash.splashFactory,
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
        )),
       );
  }
  ThemeData getThemeData1() {
    return ThemeData(
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 18.0, color: Colors.white),
        bodyMedium: TextStyle(fontSize: 30.0, color: Colors.white,fontWeight: FontWeight.bold),
        titleSmall: TextStyle(fontSize: 15.0, color: Colors.white),
      ),
      textSelectionTheme:
      const TextSelectionThemeData(cursorColor: Colors.black),
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              systemStatusBarContrastEnforced: false)),
      scrollbarTheme: const ScrollbarThemeData().copyWith(
        thumbColor: MaterialStateProperty.all(Colors.black.withOpacity(0.24)),
      ),
      inputDecorationTheme: getInputDecorationTheme(),
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
          splashFactory: NoSplash.splashFactory,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          overlayColor: MaterialStatePropertyAll(Colors.transparent),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            splashFactory: NoSplash.splashFactory,
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
          )),
    );
  }
  InputDecorationTheme getInputDecorationTheme() {
    return InputDecorationTheme(
      errorMaxLines: 2,
      filled: true,
      fillColor: Colors.white,
      disabledBorder: getTextFieldBorder(),
      errorBorder: getTextFieldBorder(),
      enabledBorder: getTextFieldBorder(),
      focusedBorder: getTextFieldBorder(),
      border: getTextFieldBorder(),
      // errorStyle: getErrorStyle(),
      hintStyle: getHintText(5),
       labelStyle:  getHintText(15),
      contentPadding:
          const EdgeInsets.only(left: 30,right: 20,top: 20,bottom: 20),
    );
  }

  OutlineInputBorder getTextFieldBorder() {
    return OutlineInputBorder(
      borderSide:  BorderSide(color: Colors.grey.shade300, width: 1),
      borderRadius: BorderRadius.circular(30),
      gapPadding: 2.5,
    );
  }
  TextStyle getHintText(double size) {
    return TextStyle(
      color: Colors.grey.shade500,
      fontSize: size,
    );
  }
}

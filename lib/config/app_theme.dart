import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mimicon/utils/constants/app_color.dart';

abstract class AppTheme {
  static InputDecoration textFormFieldInputDecoration(
          {required String hintText, required IconData prefixIcon}) =>
      InputDecoration(hintText: hintText, prefixIcon: Icon(prefixIcon));

  static const TextTheme lightTextTheme = TextTheme(
    bodyLarge: TextStyle(color:AppColors.appSecondaryColor),
    bodyMedium: TextStyle(color: AppColors.appSecondaryColor),
  );

  static TextStyle textStyle(Color color, double fontSize) =>
      TextStyle(color: color, fontSize: fontSize, fontWeight: FontWeight.w600);

  static final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
      focusColor: Colors.black,
      fillColor: Colors.white,
      filled: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.sp,
          ),
          borderSide: BorderSide.none));

  static ButtonStyle appPrimaryButtonStyle(
          {double borderRadius = 8, double verticalPadding = 10}) =>
      ElevatedButton.styleFrom(
          backgroundColor: AppColors.appPrimaryColor,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
              horizontal: 40.w, vertical: verticalPadding.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.sp),
          ));

  static ButtonStyle appSecondaryButtonStyle() => ElevatedButton.styleFrom(
      backgroundColor: AppColors.appSecondaryColor,
      foregroundColor: AppColors.appPrimaryColor,
      elevation: 0,
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
      surfaceTintColor: AppColors.appSecondaryColor,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.appPrimaryColor),
        borderRadius: BorderRadius.circular(8.sp),
      ));
  static ThemeData get lightTheme => ThemeData(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      inputDecorationTheme: AppTheme.inputDecorationTheme,
      useMaterial3: true,
      textTheme: lightTextTheme,
      primaryColor: AppColors.appPrimaryColor,
      scaffoldBackgroundColor:AppColors.appPrimaryColor,
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: Colors.white),
      appBarTheme: AppBarTheme(
          elevation: 0,
          color: AppColors.appPrimaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 16.sp)),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        splashFactory: InkSplash.splashFactory,
      )),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.appPrimaryColor,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h))),
      colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.appSecondaryColor,
          primary: AppColors.appPrimaryColor));
}

import 'package:flutter/material.dart';

import 'app_colors.dart';

class ApplicationThemeManager {
  static ThemeData theme = ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: Colors.black,
      useMaterial3: true,
      dividerTheme: const DividerThemeData(
        color: Color(0XFF707070),
        thickness: 1.5,
      ),
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0XFF1D1E1D).withOpacity(0.5),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontSize: 22,
            fontFamily: "Inter"),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.onPrimaryColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.white,
          selectedIconTheme:
              IconThemeData(color: AppColors.primaryColor, size: 40),
          selectedLabelStyle: TextStyle(
              fontSize: 8,
              fontFamily: "Inter",
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w400),
          unselectedIconTheme: IconThemeData(color: Colors.white, size: 36),
          unselectedLabelStyle: TextStyle(
              fontSize: 8,
              fontFamily: "Inter",
              color: AppColors.displayColor,
              fontWeight: FontWeight.w400)),
      textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontSize: 22,
              fontFamily: "Inter"),
          bodyLarge: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontSize: 20,
              fontFamily: "Inter"),
          bodyMedium: TextStyle(
              fontSize: 18,
              fontFamily: "Inter",
              color: Colors.white,
              fontWeight: FontWeight.w400),
          bodySmall: TextStyle(
              fontSize: 15,
              fontFamily: "Inter",
              color: Colors.white,
              fontWeight: FontWeight.w400),
          labelLarge: TextStyle(
              fontSize: 15,
              fontFamily: "Inter",
              color: Colors.white,
              fontWeight: FontWeight.w400),
          labelMedium: TextStyle(
              fontSize: 14,
              fontFamily: "Inter",
              color: Colors.white,
              fontWeight: FontWeight.w600),
          labelSmall: TextStyle(
              fontSize: 13,
              fontFamily: "Inter",
              color: AppColors.headerColor,
              fontWeight: FontWeight.w400),
          displayLarge: TextStyle(
              fontSize: 10,
              fontFamily: "Inter",
              color: Colors.white,
              fontWeight: FontWeight.w400),
          displayMedium: TextStyle(
              fontSize: 8,
              fontFamily: "Inter",
              color: AppColors.displayColor,
              fontWeight: FontWeight.w400)));
}

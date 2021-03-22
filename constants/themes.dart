import 'package:flutter/material.dart';
import 'package:mlkit_demo/constants/global.dart' as globals;

class AllCoustomTheme {
  static ThemeData getThemeData() {
    if (globals.isLight) {
      return buildLightTheme();
    } else {
      return buildDarkTheme();
    }
  }

  static Color getTextThemeColors() {
    if (globals.isLight) {
      return Color(0xFF9E9E9E);
    } else {
      return Color(0xFF636466);
    }
  }

  static Color getBlackAndWhiteThemeColors() {
    if (globals.isLight) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  static Color getReBlackAndWhiteThemeColors() {
    if (globals.isLight) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    final txtName = 'Poppins';
    return base.copyWith(
      body1: base.title.copyWith(
        fontFamily: txtName,
        fontSize: 16,
        color: getBlackAndWhiteThemeColors(),
      ),
      body2: base.title.copyWith(
        fontFamily: txtName,
        fontSize: 14,
        color: getTextThemeColors(),
      ),
      caption: base.title.copyWith(
        fontFamily: txtName,
        fontSize: 12,
        color: getTextThemeColors(),
      ),
      headline: base.title.copyWith(
        fontFamily: txtName,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: getBlackAndWhiteThemeColors(),
      ),
      subhead: base.title.copyWith(
        fontFamily: txtName,
        fontSize: 22,
        color: getTextThemeColors(),
      ),
      title: base.title.copyWith(
        fontFamily: txtName,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: getBlackAndWhiteThemeColors(),
      ),
      subtitle: base.title.copyWith(
        fontFamily: txtName,
        fontSize: 16,
        color: getTextThemeColors(),
      ),
    );
  }

  static ThemeData buildDarkTheme() {
    return buildLightTheme();
  }

  static ThemeData buildLightTheme() {
    Color primaryColor = HexColor(globals.primaryColorString);
    Color secondaryColor = HexColor(globals.secondaryColorString);
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      buttonColor: primaryColor,
      indicatorColor: Colors.white,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      accentColor: secondaryColor,
      canvasColor: Colors.white,
      cursorColor: primaryColor,
      scaffoldBackgroundColor: const Color(0xFFEFF1F4),
      backgroundColor: const Color(0xFFFFFFFF),
      errorColor: const Color(0xFFB00020),
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
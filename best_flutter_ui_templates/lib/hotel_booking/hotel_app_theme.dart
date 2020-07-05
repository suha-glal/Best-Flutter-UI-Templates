import 'package:best_flutter_ui_templates/main.dart';
import 'package:flutter/material.dart';

class HotelAppTheme {
  static TextTheme _buildTextTheme(TextTheme base) {
    const String fontName = 'WorkSans';
  /*  static const TextTheme textTheme = TextTheme(
    //headline4: display1,
    headline: base.headline.copyWith(fontFamily: fontName),
    //headline: title,
    subtitle: subtitle,
    body1: body2,
    body2: body1,
    caption: caption,
  );
*/
    return base.copyWith(
      headline: base.headline.copyWith(fontFamily: fontName),
      title: base.title.copyWith(fontFamily: fontName),
       subhead: base.subhead.copyWith(fontFamily: fontName),
    display1: base.display1.copyWith(fontFamily: fontName),
    display2: base.display2.copyWith(fontFamily: fontName),
    display3: base.display3.copyWith(fontFamily: fontName),
      button: base.button.copyWith(fontFamily: fontName),
      caption: base.caption.copyWith(fontFamily: fontName),
      body2: base.body2.copyWith(fontFamily: fontName),
      body1: base.body1.copyWith(fontFamily: fontName),
      subtitle: base.subtitle.copyWith(fontFamily: fontName),
      //subtitle: base.subtitle.copyWith(fontFamily: fontName),
      overline: base.overline.copyWith(fontFamily: fontName),
    );

  }
  

  static ThemeData buildLightTheme() {
    final Color primaryColor = HexColor('#54D3C2');
    final Color secondaryColor = HexColor('#54D3C2');
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
      backgroundColor: const Color(0xFFFFFFFF),
      scaffoldBackgroundColor: const Color(0xFFF6F6F6),
      errorColor: const Color(0xFFB00020),
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
      platform: TargetPlatform.iOS,
    );
  }
}

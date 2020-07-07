import 'package:best_flutter_ui_templates/design_course/home_design_course.dart';
import 'package:best_flutter_ui_templates/fitness_app/fitness_app_home_screen.dart';
import 'package:best_flutter_ui_templates/hotel_booking/hotel_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../app_theme.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath, // = '',
  });

  Widget navigateScreen;
  Widget imagePath;
  //String imagePath;

  static List<HomeList> homeList = [
     HomeList(
      imagePath: HomeMenuItems('Trips',const Color(0xFF64E8DE),// const Color(0xFFFFCDA5),
  const Color(0xFFFF9482)),  // const Color(0xFFEE4D5F)),
      navigateScreen: FitnessAppHomeScreen(),
    ),
    HomeList(
      imagePath: HomeMenuItems('Services', const Color(0xFF00FFED),
  const Color(0xFFF00B51)), //  const Color(0xFF00B8BA)),
      navigateScreen: HotelHomeScreen(),
    ),
    HomeList(
      imagePath: HomeMenuItems('Friends', const Color(0xFF7BF2E9),
       const Color(0xFF7D77FF)),

      navigateScreen: DesignCourseHomeScreen(),
    ),
   
  ];
}

HomeMenuItems(String itemTitle, Color bgColor1, Color bgColor2) {
  return Container(
    height: 100,
    width: 250,
    
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment
            .bottomRight, //Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
        colors: [bgColor1, bgColor2], // whitish to gray
        tileMode: TileMode.repeated, // repeats the gradient over the canvas
      ),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          bottomLeft: Radius.circular(8.0),//60.0),
          bottomRight: Radius.circular(8.0),
          topRight: Radius.circular(8.0)),//60.0)),
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: AppTheme.grey.withOpacity(0.2),
            offset: Offset(2.1, 2.1),
            spreadRadius: 7,
            blurRadius: 10.0),
      ],
    ),
    child: Center(child: TitleTextFormated(itemTitle,Colors.grey.withOpacity(0.6))),//bgColor2)),
  );
}

TitleTextFormated(String titleText, Color strokColor) {
  return Stack(
    children: <Widget>[
      // Stroked text as border.
     /* Text(
        titleText,
        style: TextStyle(
          fontSize: 30,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 5
            ..color = strokColor,//AppTheme.main_color,.withOpacity(0.5)
        ),
      ),*/
      // Solid text as fill.
      Text(
        titleText,
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontFamily: 'Roboto',
          
          
        ),
      ),
    ],
  );
}

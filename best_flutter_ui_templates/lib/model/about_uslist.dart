import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:avatar_glow/avatar_glow.dart';

import '../app_theme.dart';



class AboutUs {
  AboutUs({
    this.itemDescription,
    this.itemTextInput,
    this.profileItemIcon,
  });

  Widget itemDescription;
  Widget itemTextInput;
  Icon profileItemIcon;

  static List<AboutUs> profileList = [
    AboutUs(itemDescription: coverImage()),
    //AboutUs(itemDescription:SizedBox(height: double.infinity/ 6.4)),
    AboutUs(itemDescription: profileImage()),
    AboutUs(itemDescription: _buildFullName()),

    AboutUs(itemDescription: _buildDetails())
    // AboutUs(itemDescription:
    //AboutUs(itemDescription:
    //AboutUs(itemDescription:
  ];
}

coverImage() {
  return Container(
    height: 125,
    decoration: BoxDecoration(color: Colors.grey[300]),
  );
}

profileImage() {
  return  Align(
    alignment: Alignment.topCenter,
    child: AvatarGlow(

      glowColor: AppTheme.main_color,
      endRadius: 110.0,
      duration: Duration(milliseconds: 5000),
      repeat: false,
      showTwoGlows: true,
      child: CircleAvatar(

        backgroundColor: Colors.grey[100],
        backgroundImage: AssetImage('assets/images/ashraf.png'),
        radius: 50,
        child: Container(
          // width: 140.0,
         //alignment:AlignmentDirectional.center ,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(
              color: Colors.white,
              width: 3.0,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _buildDetails() {
  return Container(
    alignment: Alignment.bottomLeft,
     
    child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 200,
          ),
          Divider(height: 2, color: AppTheme.grey.withOpacity(0.6)),
          /* buildDetailForItem('First Name:', 'Ashraf'),
      buildDetailForItem('Last Name:', 'Khalil'),
      buildDetailForItem('Company:', 'Crooz LLC'),
      buildDetailForItem('Registration Date:', '1/1/2020'),*/
          /*CustomScrollView(
            primary: false,
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverGrid.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[*/
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text("First Name:",style: AppTheme.profileCategory,),
                    //  color: Colors.green[100],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text('Ashraf'),
                     // color: Colors.green[200],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text('Last Name:',style: AppTheme.profileCategory,),
                      //color: Colors.green[300],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text('Khalil'),
                      //color: Colors.green[400],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text('Company:',style: AppTheme.profileCategory,),
                    //  color: Colors.green[500],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text('Crooz .LLC'),
                   //   color: Colors.green[600],
                    ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Registration Date:', style: AppTheme.profileCategory,),
            //  color: Colors.green[500],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('12/06/2010',style: AppTheme.body2),
            //   color: Colors.green[600],
          ),
                 // ],
               // ),
             // ),
            ],
          ),

  );
}

Widget _buildFullName() {
  TextStyle _nameTextStyle = TextStyle(
    fontFamily: 'Roboto',
    color: Colors.black,
    fontSize: 28.0,
    fontWeight: FontWeight.w400,
  );

  return /*Center(
      child: */
      Container(
    // width: 140.0,
    alignment: Alignment.bottomCenter,
    height: 200.0,
    child: Text(
      _fullName,
      style: _nameTextStyle,
    ),
    // ),
  );
}

Widget buildDetailForItem(String title, String detail) {
  return Row(
    children: <Widget>[
      Text(
        title,
        style: TextStyle(
          color: AppTheme.dark_grey.withOpacity(0.7),
          fontSize: 18.0,
          fontWeight: FontWeight.w100,
        ),
      ),
      SizedBox(height: 10, width: 10),
      Text(
        detail,
        style: TextStyle(
          color: AppTheme.lightText.withOpacity(0.8),
          fontSize: 15.0,
        ),
      ),
    ],
  );
}

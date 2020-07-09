import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:avatar_glow/avatar_glow.dart';

import '../app_theme.dart';



class AboutUs {
  AboutUs({
    this.itemDescription,
  });

  Widget itemDescription;
 
  static List<AboutUs> profileList = [
    AboutUs(itemDescription: coverImage()),
    //AboutUs(itemDescription:SizedBox(height: double.infinity/ 6.4)),
    AboutUs(itemDescription: profileImage()),
    AboutUs(itemDescription: _buildFullName()),
    //AboutUs(itemDescription: buildAboutUsDetails() ),
   /*
     AboutUs(itemDescription:),
   AboutUs(itemDescription:  Container(
  padding: const EdgeInsets.all(8),
  child: const Text("Who we are?",style: AppTheme.profileCategory,),
  //  color: Colors.green[100],
  ),),*/
   // AboutUs(itemDescription:
  ];
}
buildDivder() {
  return Positioned(
      top: 0,
      child: Divider(height: 2, color: AppTheme.grey.withOpacity(0.6),
      ),
  );
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

        backgroundColor: Colors.grey[50],
        backgroundImage: AssetImage('assets/images/croozlogo3.png',),
        radius: 50,
        child: Container(
          // width: 140.0,
         //alignment:AlignmentDirectional.center ,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70.0),
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

Widget buildAboutUsDetails() {
  return /*CustomScrollView(
    slivers: [
      SliverFillRemaining(
        hasScrollBody: true,
        child:*/ Positioned(
      top:50.0,

      child:Column(

        children: <Widget>[
         /* SizedBox(
            height: 100,
          ),*/
          Divider(height: 2, color: AppTheme.grey.withOpacity(0.6)),

                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text("Who we are?",style: AppTheme.profileCategory,),
                    //  color: Colors.green[100],
                    ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Telematics APP for Urban Transportation, Insurance, Market research companies, and others'),
            //color: Colors.green[400],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('What we do?',style: AppTheme.profileCategory,),
            //color: Colors.green[300],
          ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text('We provide smartphone telematics solutions which enables you to leverage customer behaviors data in order to engage better motor insurance portfolio, build targeted communications with customers, cross-sell and up-sell based on customer preferences and needs as well as provide customers with a new experience of having smart insurance products like UBI, on-demand, contextual and other advanced insurance products.'),
                     // color: Colors.green[200],
                    ),


                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text('How we do it?',style: AppTheme.profileCategory,),
                    //  color: Colors.green[500],
                    ),
                   // ListView(
                     //fit: FlexFit.tight,
                      //padding: const EdgeInsets.all(8),
                      /*child: Row(children: <Widget>[const */Text('1. We use advanced algorithms to minimal reliance on GPS to extensively reduce battery drain.',style: AppTheme.body2),
                      Text('2. Fully autonomus SDK to collect telematics data. All processes runs in background mode.',style: AppTheme.body2),
                        Text('3. We analyze driving behavior patterns and calculate overall risk level as well as daily performance.',style: AppTheme.body2),
                        Text('4. AI Algorithms that provide drivers with tailored recommendations to give driving style safer.',style: AppTheme.body2),
                        Text('5. Get access to life-style analysis as well as mode of car usage to better understand your customers.',style: AppTheme.body2),
                      ],
                    // )

                  )
  );



 // ),

//],
//  );
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
     'Crooz',
      style: _nameTextStyle,
    ),
    // ),
  );
}


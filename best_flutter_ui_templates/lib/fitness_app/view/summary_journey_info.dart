import 'package:flutter/material.dart';
import '../models/single_journey_detial.dart';
import '../models/journey.dart';
import '../mappage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import '../data/constant_database.dart';
import '../utilities.dart';
import '../descriptive_statistics.dart';
import '../pie_chart_speed.dart';


abstract class SummaryJournyInfoView{
  static double spaceBetweenData=20;
  static double spaceBetweenIconData=5;




  static getSubtitleWidget(element) {
    var smily=chooseSmily((1 - element[columnRisk]));
    return SizedBox(
      // width: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          FaIcon(
            FontAwesomeIcons.stopwatch, color: Colors.grey.withOpacity(0.7),
            size: 10,),
          SizedBox(width: spaceBetweenIconData,),
          Text(getDuration(element[columnStartTime], element[columnEndTime]),
              style: TextStyle(
                  color: Colors.black.withOpacity(0.6), fontSize: 10)),
          SizedBox(width: spaceBetweenData,),
          FaIcon(
            FontAwesomeIcons.shippingFast, color: Colors.grey.withOpacity(0.7),
            size: 10,),
          SizedBox(width: spaceBetweenIconData,),
          Text(element[columnAvgSpeed].toStringAsFixed(2), style: TextStyle(
              color: Colors.black.withOpacity(0.6), fontSize: 10)),
          Text(' km/hr', style: TextStyle(
              color: Colors.black.withOpacity(0.6), fontSize: 7)),
          SizedBox(width: spaceBetweenData,),
          FaIcon(smily['iconsrisk'],color: smily['color'], size: 12,),
          SizedBox(width: spaceBetweenIconData,),
          Text((1 - element[columnRisk]).toStringAsFixed(2), style: TextStyle(
              color: Colors.black.withOpacity(0.6), fontSize: 10)),

        ],
      ),
    );
  }

  static getTrailingWidget(element) {
    return SizedBox(
      width: 20.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            element['dayMonth'],
            style: TextStyle(
                color: Colors.black.withOpacity(0.6), fontSize: 9),
          ),

        ],
      ),
    );
  }

  static getAllViews(TotalForJourneys _totalforJourneys)
   {

     return <Widget>[
       new Divider(
         thickness: 1,

       ),
       SizedBox(height: 10,),
       Text('Summary:',textAlign:TextAlign.start,style: TextStyle(
           color: Colors.black, fontSize: 14,)),
       SizedBox(height: 10,),
       levelZeroView(_totalforJourneys.noTrips, _totalforJourneys.duration,_totalforJourneys.distance,
           _totalforJourneys.avgRisk,_totalforJourneys.maxRisk,_totalforJourneys.minRisk),
       levelTwoView(_totalforJourneys.journeyRepresentation.toMap()),
       levelThreeView(_totalforJourneys.journeyRepresentation.toMap()),

      levelFiveView(_totalforJourneys.journeyRepresentation.toMap())
     ];
   }
   static levelZeroView(int noTrips, int duration,double distance,
       double avgRisk,double maxRisk,double minRisk){
     var smilyAvg=chooseSmily((1 - avgRisk));//??chooseSmily(0);
     var smilyMax=chooseSmily((1 - maxRisk));//??chooseSmily(0);
     var smilyMin=chooseSmily((1 - minRisk));//??chooseSmily(0);
     return  SizedBox(
       height: 40.0,

       child:Column(children:<Widget>[ Row(

         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[

           FaIcon(
             FontAwesomeIcons.route, color: Colors.grey.withOpacity(0.7),
             size: 10,),
           SizedBox(width: spaceBetweenIconData,),

           SizedBox(width: spaceBetweenIconData,),
           Text(noTrips.toString(),style: TextStyle(
               color: Colors.black.withOpacity(0.6), fontSize: 10)),
           Text(' Trips',style: TextStyle(
               color: Colors.black.withOpacity(0.6), fontSize: 10)),
           SizedBox(width: spaceBetweenData,),
           FaIcon(
             FontAwesomeIcons.stopwatch, color: Colors.grey.withOpacity(0.7),
             size: 10,),
           SizedBox(width: spaceBetweenIconData,),
           Text('Duration:',style: TextStyle(
               color: Colors.black.withOpacity(0.6), fontSize: 10)),
           SizedBox(width: spaceBetweenIconData,),
           Text(getDurationStringFromSec(duration), style: TextStyle(
               color: Colors.black.withOpacity(0.6), fontSize: 10)),
           SizedBox(width: spaceBetweenData,),
           FaIcon(
             FontAwesomeIcons.ruler, color: Colors.grey.withOpacity(0.7),
             size: 10,),
           SizedBox(width: spaceBetweenIconData,),
           Text('Distance:',style: TextStyle(
               color: Colors.black.withOpacity(0.6), fontSize: 10)),
           SizedBox(width: spaceBetweenIconData,),
           Text(distance.toStringAsFixed(2) + ' km', style: TextStyle(
               color: Colors.black.withOpacity(0.6), fontSize: 10)),

         ],
       ),
         SizedBox(height: 10,),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[


               FaIcon(smilyAvg['iconsrisk'],color: smilyAvg['color'], size: 12,),

             SizedBox(width: spaceBetweenIconData,),
             Text('Avg.:',style: TextStyle(
                 color: Colors.black.withOpacity(0.6), fontSize: 10)),
             SizedBox(width: spaceBetweenIconData,),
             Text((1 - (avgRisk>=0?avgRisk:0)).toStringAsFixed(2),style: TextStyle(
                 color: Colors.black.withOpacity(0.6), fontSize: 10)),

             SizedBox(width: spaceBetweenData,),
               FaIcon(smilyMax['iconsrisk'],color: smilyMax['color'], size: 12,),
             SizedBox(width: spaceBetweenIconData,),
             Text('Min:',style: TextStyle(
                 color: Colors.black.withOpacity(0.6), fontSize: 10)),
             SizedBox(width: spaceBetweenIconData,),
             Text((1-maxRisk).toStringAsFixed(2), style: TextStyle(
                 color: Colors.black.withOpacity(0.6), fontSize: 10)),

             SizedBox(width: spaceBetweenData,),
               FaIcon(smilyMin['iconsrisk'],color: smilyMin['color'], size: 12,),

             SizedBox(width: spaceBetweenIconData,),
             Text('Max:',style: TextStyle(
                 color: Colors.black.withOpacity(0.6), fontSize: 10)),
             SizedBox(width: spaceBetweenIconData,),
             Text((1-minRisk).toStringAsFixed(2), style: TextStyle(
                 color: Colors.black.withOpacity(0.6), fontSize: 10)),

           ],
         ),
       ],
       ),
     );
   }
  static levelOneView(element,  {bool getTrailing=true})
  {


    return  SizedBox(
        //height: 40.0,

        child:Container(
      child:ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
        leading: Icon(Icons.directions_car,),
        //title: Text(element['IdJourney'].toString()),
        title: Text(element[columnTotalDistance].toStringAsFixed(2) + ' km',
            style: TextStyle(color: Colors.black, fontSize: 14)),
        subtitle: getSubtitleWidget(element),

        trailing: getTrailing==true?getTrailingWidget(element):null,
      ),
        ),
    );
  }
  static levelTwoView(element){
    return  SizedBox(
      height: 20.0,
//width: 400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          FaIcon(
            FontAwesomeIcons.phone, color: Colors.grey.withOpacity(0.7),
            size: 10,),
          SizedBox(width: spaceBetweenIconData,),
          Text('No of phone calls:',style: TextStyle(
              color: Colors.black.withOpacity(0.6), fontSize: 10)),
          SizedBox(width: spaceBetweenIconData,),
          Text(element[columnNoCalls].toString(),style: TextStyle(
              color: Colors.black.withOpacity(0.6), fontSize: 10)),
          SizedBox(width: spaceBetweenData,),
          FaIcon(
            FontAwesomeIcons.clock, color: Colors.grey.withOpacity(0.7),
            size: 10,),
          SizedBox(width: spaceBetweenIconData,),
          Text('Calls Duration:',style: TextStyle(
              color: Colors.black.withOpacity(0.6), fontSize: 10)),
          SizedBox(width: spaceBetweenIconData,),
          Text(element[columnDurationCalls].toStringAsFixed(2)+' min', style: TextStyle(
              color: Colors.black.withOpacity(0.6), fontSize: 10)),

        ],
      ),
    );
  }
  static levelThreeView(element){
    return  SizedBox(
      //width: 100.0,
      height: 20.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          FaIcon(
            FontAwesomeIcons.shippingFast, color: Colors.grey.withOpacity(0.7),
            size: 10,),
          SizedBox(width: spaceBetweenIconData,),
          Text('Avg. Speed:',style: TextStyle(
              color: Colors.black.withOpacity(0.6), fontSize: 10)),
          SizedBox(width: spaceBetweenIconData,),
          Text((element[columnAvgSpeed]>=0?element[columnAvgSpeed]:0).toStringAsFixed(2), style: TextStyle(
              color: Colors.black.withOpacity(0.6), fontSize: 10)),
          Text(' km/hr', style: TextStyle(
              color: Colors.black.withOpacity(0.6), fontSize: 7)),
          SizedBox(width: spaceBetweenData,),

          FaIcon(
            FontAwesomeIcons.carCrash, color: Colors.grey.withOpacity(0.7),
            size: 10,),
          SizedBox(width: spaceBetweenIconData,),
          Text('Max Speed:',style: TextStyle(
              color: Colors.black.withOpacity(0.6), fontSize: 10)),
          SizedBox(width: spaceBetweenIconData,),
          Text(element[columnMaxSpeed].toStringAsFixed(2), style: TextStyle(
              color: Colors.black.withOpacity(0.6), fontSize: 10)),
          Text(' km/hr', style: TextStyle(
              color: Colors.black.withOpacity(0.6), fontSize: 7)),

        ],
      ),
    );
  }

  static levelFourView(element)
  {
    return SizedBox(
        //width: 100.0,
        height: 200.0,
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[DonutAutoLabelChart.withData(element[columnSpeedBelow60],element[columnSpeedAbove60Below100],
        element[columnSpeedAbove100Below120], element[columnSpeedAbove120Below150],
        element[columnSpeedAbove150])
    ]
    ),
    );
  }
  static levelFiveView(element)
  {
    return DonutAutoLabelChart.withData(element[columnSpeedBelow60],element[columnSpeedAbove60Below100],
        element[columnSpeedAbove100Below120], element[columnSpeedAbove120Below150],
        element[columnSpeedAbove150]);
  }
static levelSixView(element,LatLanForJourney lanForJourney)
{
    
  return PolylinePage(lanForJourney.points);
}

}
/*=<LatLng>[
      LatLng(24.089896, 55.872570),
      LatLng(24.088091, 55.872855),
      LatLng(24.088411, 55.872864),
      
    ];*/

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './view/CustomExpansionTileList.dart';
//import 'package:sdrive/models/call.dart';
import './models/journey.dart';
/*import 'package:sdrive/machain_learning/obj_gps_acc_gyr.dart';
import 'package:sdrive/models/violation_point.dart';
import 'package:sdrive/view/CustomExpansionTileList.dart';

class IdViolationArray{
  int idOfJourny;
  int idOfViolation;
  ObjGpsAccGyr obj;
  IdViolationArray(int j,int x, ObjGpsAccGyr y){
    this.idOfJourny=j;
    this.idOfViolation=x;
    this.obj=y;
  }
}
List<ViolationPoint> convertToViolationPoint(IdViolationArray mymap) {

  ObjGpsAccGyr vPGAG=mymap.obj;
  int violationId=mymap.idOfViolation;
  int journyId=mymap.idOfJourny;
     print('VioliationID for:$violationId');
  List<ViolationPoint> vPArray = new List<ViolationPoint>();
  for (int i = 0; i < vPGAG.latitude.length; i++) {

    vPArray.add(new ViolationPoint(journyId,i+1,violationId,vPGAG.time.elementAt(i), vPGAG.x.elementAt(i),vPGAG.y.elementAt(i),vPGAG.z.elementAt(i),
        vPGAG.xUAcc.elementAt(i),vPGAG.yUAcc.elementAt(i),vPGAG.zUAcc.elementAt(i),
        vPGAG.xGyr.elementAt(i),vPGAG.yGyr.elementAt(i),vPGAG.zGyr.elementAt(i),
        vPGAG.latitude.elementAt(i),vPGAG.longitude.elementAt(i),vPGAG.altitude.elementAt(i),
        vPGAG.accuracy.elementAt(i),vPGAG.speed.elementAt(i),vPGAG.heading.elementAt(i)));
  }
  return vPArray;
}*/
chooseSmily(score)
{
  IconData x;
  MaterialColor c;
  if(score<=0.2){
    x=Icons.sentiment_very_dissatisfied ;
    c=Colors.red;}
  else if (score<=0.4){
    x=Icons.sentiment_dissatisfied ;
    c=Colors.yellow;}
  else if (score<=0.6){
    x=Icons.sentiment_neutral ;
    c=Colors.grey;}
  else if (score<=0.8){
    x=Icons.sentiment_satisfied ;
    c=Colors.blue;}
  else if (score<=1){
    x=Icons.sentiment_very_satisfied;
  c=Colors.green;}


  // return new Icon(x,color: Colors.white, size: 25.0,) ;//as IconData;
  x=x??Icons.sentiment_neutral ;
  c=c??Colors.grey;
  return {'iconsrisk':x,'color':c};
}
//enum MonthsOfYear { None,January, February, March, April, May, June, July, August, September, October,November,December}
List<String> MonthsGorgania= [ 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September','October','November','December'];

String getDayMonth(int date)
{
  if(date!=null) {
    DateTime dtObj = DateTime.fromMillisecondsSinceEpoch(date);
    return '${dtObj.day}/${dtObj.month}';
    //return '${dtObj.day} ${MonthsGorgania[dtObj.month-1].toUpperCase()} ${dtObj.year}';
  }
  return '--';
}
String getDayMonthYear(int date)
{
  if(date!=null) {
    DateTime dtObj = DateTime.fromMillisecondsSinceEpoch(date);
    //return '${dtObj.day}/${dtObj.month}';
    return '${dtObj.day} ${MonthsGorgania[dtObj.month-1].toUpperCase()} ${dtObj.year}';
  }
  return '--';
}
int getDay(int date)
{
  if(date!=null) {
    DateTime dtObj = DateTime.fromMillisecondsSinceEpoch(date);
    return dtObj.day;
  }
  return 0;
}
/*getDistancInKM(double d)
{
  return (d/1000).toStringAsFixed(2);
}*/
getDuration(int start, int end)
{
  DateTime startDate = DateTime.fromMillisecondsSinceEpoch(start);
  DateTime endDate = DateTime.fromMillisecondsSinceEpoch(end);
  String duration=endDate.difference(startDate).toString();
  return duration.substring(0,duration.indexOf('.'));

}
getDurationInSeconds(int start, int end)
{
  DateTime startDate = DateTime.fromMillisecondsSinceEpoch(start);
  DateTime endDate = DateTime.fromMillisecondsSinceEpoch(end);
   return endDate.difference(startDate).inSeconds;


}
getDurationStringFromSec(Sec)
{
  String du=Duration(seconds: Sec).toString();
  return du.substring(0,du.indexOf('.'));
}
getSpeedInKmHr(double speed)
{
  return(speed*3.6);//.toStringAsFixed(2);
}

/*
MonthsOfYear getMonth(int date)
{
  if(date!=null) {
    DateTime dtObj = DateTime.fromMillisecondsSinceEpoch(date);
    return MonthsOfYear.values[dtObj.month];
  }
  return MonthsOfYear.None;
}
*/

String getMonth(int date)
{
  if(date!=null) {
    DateTime dtObj = DateTime.fromMillisecondsSinceEpoch(date);
    //return '${dtObj.month}';
    return'${MonthsGorgania[dtObj.month-1].toUpperCase()}';
  }
  return '--';
}
 getYear(int date)
{
  if(date!=null) {
    DateTime dtObj = DateTime.fromMillisecondsSinceEpoch(date);
    return '${dtObj.year}';
  }
  return '--';
}

convertMonthToLetter(String x)
{
  int index=x.indexOf('/');
  return( MonthsGorgania[int.parse(x.substring(0,index))-1]+' '+x.substring(index+1)).toUpperCase();
}
/*
class JourneyCall{
  List<Journey> journeys;
  List<Call> calls;
  JourneyCall(this.journeys,this.calls);
}
*/
getGroupListMapBG(List<Journey> journeys) async {
return  compute(getGroupListMap, journeys);
}
getGroupListMap(List<Journey> journeys)
{
  return journeys.map((e) => convertToMap(e)).toList();

}
convertGroupMapTolist(journeys) async {
  return  compute(getGroupMaptoList, journeys);
}

getGroupMaptoList(journeys)
{
  List<GroupedJourneys> groupedJouerneys = List();
  return journeys.forEach((k,v) => groupedJouerneys.add(GroupedJourneys(k,v)));
//return groupedJouerneys;
}
getDateComplete(int date)
{
  if(date!=null) {
    DateTime dtObj = DateTime.fromMillisecondsSinceEpoch(date);
    return dtObj.toIso8601String();
  }
  return '--';
}
convertToMap(Journey j)
{
  Map m=j.toMap();
  m['year']=getYear(j.startTime);
  m['month']=getMonth(j.startTime);
  m['monthYear']=getMonth(j.startTime)+' '+getYear(j.startTime);
  m['day']=getDay(j.startTime);
  m['dayMonthYear']=getDayMonthYear(j.startTime);
  m['dayMonth']=getDayMonth(j.startTime);
 // m['hour']=
  m['type']=tripType(j.totalDistance);
  m['startDate']=getDateComplete(j.startTime);
  m['endDate']=getDateComplete(j.endTime);

  return m;
}
tripType(double distance)
{/* //REAL
  if(distance <= 30000)
    return 'short';
  else if(distance<90000)
      return 'medium';
  else if(distance>=90000)
        return 'long';
*/
  //FAKE
  if(distance <= 100)
    return 'short';
  else if(distance<150)
    return 'medium';
  else if(distance>=150)
    return 'long';
}


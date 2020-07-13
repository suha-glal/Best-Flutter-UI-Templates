//import '../data/moor_database.dart';
//library latlong;

//import '../models/journey.dart';
import 'package:latlong/latlong.dart';
class SingleJourney{
  int jID;
  int startTime;
  int endTime;
  double risk=0;
  int noCalls=0;
  double durationCalls=0;//in minutes
  double totalDistance=0;// in meters
  double avgSpeed=0;//in km/hr
  double maxSpeed=0;//in km/hr
  double speedBelow60=0;//in km/hr
  double speedAbove60Below100=0;//in km/hr
  double speedAbove100Below120=0;//in km/hr
  double speedAbove120Below150=0;//in km/hr
  double speedAbove150=0;//in km/hr

 SingleJourney({String jId,int stime,int etime,double risk,int noCalls, double durationCalls,double totalDistance,double avgSpeed,
    double maxSpeed, int speedBelow60,  int speedAbove60Below100,  int speedAbove100Below120,  int speedAbove120Below150,  int speedAbove150})
  { try{
    int sumOfSpeedInstance=(speedBelow60+speedAbove60Below100+speedAbove100Below120+speedAbove120Below150+speedAbove150);
    //print('speed:$sumOfSpeedInstance');
    this.jID=int.parse(jId);
    this.startTime=stime;
    this.endTime=etime;
    this.risk=risk??0;
    this.noCalls=noCalls??0;
    this.durationCalls=durationCalls??0;
    this.totalDistance=totalDistance;
    this.avgSpeed=avgSpeed;
    this.maxSpeed=maxSpeed;
    this.speedBelow60=speedBelow60/sumOfSpeedInstance;
    this.speedAbove60Below100=speedAbove60Below100/sumOfSpeedInstance;
    this.speedAbove100Below120=speedAbove100Below120/sumOfSpeedInstance;
    this.speedAbove120Below150=speedAbove120Below150/sumOfSpeedInstance;
    this.speedAbove150=speedAbove150/sumOfSpeedInstance;
  }catch(e)
  {
    print('e22:$e');
  }

  }
 
  @override
  String toString() {
   return '${this.jID}\n${this.startTime} \n${this.endTime}\n ${this.risk}\n $noCalls\n$durationCalls\n ${this.totalDistance}\n ${this.avgSpeed}\n ${this.maxSpeed}\n ${this.speedBelow60}\n ${this.speedAbove60Below100}\n ${this.speedAbove100Below120}\n ${this.speedAbove120Below150}\n ${this.speedAbove150}';
   // return super.toString();
  }
}
class JourneySummaryWithLatLng{
  List<SingleJourney> oneJourney;
  List <LatLanForJourney> oneJourneyLatLng;
  JourneySummaryWithLatLng(this.oneJourney,this.oneJourneyLatLng);
}
class LatLanForJourney{
  String jID;
  List<LatLng>points;
  LatLanForJourney({this.jID,this.points});

}


import 'single_journey_detial.dart';

//Journey
final String tableJourney = 'Journey';
final String columnIdJourney = 'IdJourney';
final String columnStartTime = 'StartTime';
final String columnEndTime = 'EndTime';

final String columnNoCalls='NoCalls';
final String columnDurationCalls='DuationCalls';
final String columnRisk ='Risk';
final String columnMaxSpeed='MaxSpeed';
final String columnSpeedBelow60='SpeedBelow60';
final String columnSpeedAbove60Below100='SpeedAbove60Below100';
final String columnSpeedAbove100Below120='SpeedAbove100Below120';
final String columnSpeedAbove120Below150='SpeedAbove120Below150';
final String columnSpeedAbove150='SpeedAbove150';


//overall
final String tableOverall = 'Overall';
final String columnIdOverall ='IdOverall';
final String columnSafety = 'AvgSafety';
final String columnTrips ='Trips';
final String columnTotalDistance ='TotalDistance';
final String columnAvgSpeed = 'AvgSpeed';

class Journey{
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
Journey(SingleJourney singleJourney){ 
    this.jID=singleJourney.jID;
    this.startTime=singleJourney.startTime;
    this.endTime=singleJourney.endTime;
    this.risk=singleJourney.risk;
    this.noCalls=singleJourney.noCalls;
    this.durationCalls=singleJourney.durationCalls;
    this.totalDistance=singleJourney.totalDistance;
    this.avgSpeed=singleJourney.avgSpeed;
    this.maxSpeed=singleJourney.maxSpeed;
    this.speedBelow60=singleJourney.speedBelow60;
    this.speedAbove60Below100=singleJourney.speedAbove60Below100;
    this.speedAbove100Below120=singleJourney.speedAbove100Below120;
    this.speedAbove120Below150=singleJourney.speedAbove120Below150;
    this.speedAbove150=singleJourney.speedAbove150;
  

  }

  Journey.fromAggregate({double risk,int noCalls, double durationCalls,double totalDistance,double avgSpeed,
  double maxSpeed, double speedBelow60,  double speedAbove60Below100,  double speedAbove100Below120,  double speedAbove120Below150,  double speedAbove150})
  {

  this.risk=risk;
  this.noCalls=noCalls;
  this.durationCalls=durationCalls;
  this.totalDistance=totalDistance;
  this.avgSpeed=avgSpeed;
  this.maxSpeed=maxSpeed;
  this.speedBelow60=speedBelow60;
  this.speedAbove60Below100=speedAbove60Below100;
  this.speedAbove100Below120=speedAbove100Below120;
  this.speedAbove120Below150=speedAbove120Below150;
  this.speedAbove150=speedAbove150;

  }

  Journey.fromMap(Map<String, dynamic> map) {

    jID=map[columnIdJourney];
    startTime = map[columnStartTime];
    endTime= map[columnEndTime];
    risk=map[columnRisk];
    noCalls=map[columnNoCalls];
    durationCalls=map[columnDurationCalls];
    totalDistance=map[columnTotalDistance];
    avgSpeed=map[columnAvgSpeed];
    maxSpeed=map[columnMaxSpeed];
    speedBelow60=map[columnSpeedBelow60];
   speedAbove60Below100=map[columnSpeedAbove60Below100];
   speedAbove100Below120=map[columnSpeedAbove100Below120];
   speedAbove120Below150=map[columnSpeedAbove120Below150];
   speedAbove150=map[columnSpeedAbove150];

  }

  // convenience method to create a Map from this Word object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{

      columnStartTime:startTime,
      columnEndTime:endTime,
      columnRisk:risk,
      columnNoCalls:noCalls,
      columnDurationCalls:durationCalls,
      columnTotalDistance:totalDistance,
      columnAvgSpeed:avgSpeed,
      columnMaxSpeed: maxSpeed,
      columnSpeedBelow60:speedBelow60,
      columnSpeedAbove60Below100:speedAbove60Below100,
      columnSpeedAbove100Below120:speedAbove100Below120,
      columnSpeedAbove120Below150:speedAbove120Below150,
      columnSpeedAbove150:speedAbove150,

    };
    if (jID != null) {
      map[columnIdJourney] = jID;
    }
    return map;
  }
}//class


import 'package:flutter/material.dart';


import './models/journey.dart';
//import '../models/summary_data.dart';
import 'utilities.dart';
import './view/summary_journey_info.dart';

class DescriptiveStatView extends StatelessWidget {


  final List trips;
  final int aggregateBy;
  TotalForJourneys summaryForTrips;
  // final DateTime dateStart;
//  final DateTime dateEnd;


  DescriptiveStatView(this.trips, this.aggregateBy) //, this.dateStart,this.dateEnd)
      : assert(trips != null),
        assert(aggregateBy != null){

  }

  //  assert(dateEnd != null),
  //  assert(dateStart != null);


  @override
  Widget build(BuildContext context) {
    summaryForTrips=getAggrigatedDataForTrips();
return SizedBox(
        height: 300.0,
        width:400,
       child:  new Column(
        children:SummaryJournyInfoView.getAllViews(summaryForTrips),
       ),
);
        }

getAggrigatedDataForTrips() {
  int totalNoCall=0;
  double totalCallDuration=0;
  
  double totalDistance=0;
  int totalDuration=0;
  
  double totalMaxSpeed=0;
  double totalMaxRisk = 0;
  double totalMinRisk=0;
  
  double totalAverageSpeed=0;
  double totalAverageRisk=0;
  
  double totalAvgSpeedBelow60=0;
  double totalAvgSpeedAbove60Below100=0;
  double totalAvgSpeedAbove100Below120=0;
  double totalAvgSpeedAbove120Below150=0;
  double totalAvgSpeedAbove150=0;

  for(var j=0;j<trips.length;j++) {

   Journey item=Journey.fromMap( trips[j]);
  // print('#####${item.maxSpeed}');
    totalNoCall+=item.noCalls;
    totalCallDuration+=item.durationCalls;
    totalDistance+=item.totalDistance;
    totalDuration+=getDurationInSeconds(item.startTime,item.endTime);
    
    totalAverageSpeed+=item.avgSpeed;
    totalAverageRisk+=item.risk;
    
    totalAvgSpeedBelow60+=item.speedBelow60;
    totalAvgSpeedAbove60Below100+=item.speedAbove60Below100;
    totalAvgSpeedAbove100Below120+=item.speedAbove100Below120;
    totalAvgSpeedAbove120Below150+=item.speedAbove120Below150;
    totalAvgSpeedAbove150+=item.speedAbove150;
   
    if(totalMaxSpeed<item.maxSpeed)
      totalMaxSpeed=item.maxSpeed;
    
    if(totalMaxRisk<item.risk)
      totalMaxRisk=item.risk;
    
    if (totalMinRisk>item.risk)
      totalMinRisk=item.risk;
  }

int noTrips=trips.length;
  return new TotalForJourneys(
    noTrips,
    totalDuration,
    totalMaxRisk,
    totalMinRisk,
    totalDistance,
    totalNoCall,
    totalCallDuration,
    totalMaxSpeed,
    totalAverageSpeed/(trips.length??1),
    totalAverageRisk/(trips.length??1),
    totalAvgSpeedBelow60/trips.length,
    totalAvgSpeedAbove60Below100/(trips.length??1),
    totalAvgSpeedAbove100Below120/(trips.length??1),
    totalAvgSpeedAbove120Below150/(trips.length??1),
    totalAvgSpeedAbove150/(trips.length??1),
  );

}
}

class TotalForJourneys{
  int noTrips=0;
  double distance=0;
  int duration=0;//in seconds
  int noCall=0;
  double callDuration=0;
  double maxSpeed=0;
  double maxRisk = 0;
  double minRisk=0;
  double avgSpeed=0;
  double avgRisk=0;
  double avgSpeedBelow60=0;
  double avgSpeedAbove60Below100=0;
  double avgSpeedAbove100Below120=0;
  double avgSpeedAbove120Below150=0;
  double avgSpeedAbove150=0;
  Journey journeyRepresentation;
  
  TotalForJourneys(
      this.noTrips,//To beShown
      this.duration,//To beShown
      this.maxRisk,//To beShown
      this.minRisk,//To beShown
      this.distance,
      this.noCall,
      this.callDuration,
      this.maxSpeed,
      this.avgSpeed,
      this.avgRisk,
      this.avgSpeedBelow60,
      this.avgSpeedAbove60Below100,
      this.avgSpeedAbove100Below120,
      this.avgSpeedAbove120Below150,
      this.avgSpeedAbove150,
      ){

    journeyRepresentation= new Journey.fromAggregate(
        risk:this.avgRisk,
        noCalls:this.noCall,
        durationCalls:this.callDuration,
        totalDistance:this.distance,
        avgSpeed:avgSpeed,
        maxSpeed:maxSpeed,
        speedBelow60:avgSpeedBelow60,
        speedAbove60Below100:avgSpeedAbove60Below100,
        speedAbove100Below120:avgSpeedAbove100Below120,
        speedAbove120Below150:avgSpeedAbove120Below150,
        speedAbove150:avgSpeedAbove150);
  }
}

 
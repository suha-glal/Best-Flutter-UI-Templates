/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../main.dart';

class CustomRoundedBars extends StatelessWidget {
  List<charts.Series> seriesList;
  final bool animate=true;
  final List trips;
  final int aggregateBy;
  final DateTime dateStart;
  final DateTime dateEnd;



  CustomRoundedBars(this.trips, this.aggregateBy, this.dateStart,this.dateEnd){
    seriesList=getSeriesFromTrip();
    print('aggregateBy $aggregateBy');
  }



  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding:  EdgeInsets.fromLTRB(30, 0, 30, 3),
    child: new SizedBox(
    height: 130.0,
    child: new charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      domainAxis: getDomainAxisFormate(),

      defaultRenderer: new charts.BarRendererConfig(
        // By default, bar renderer will draw rounded bars with a constant
        // radius of 100.
        // To not have any rounded corners, use [NoCornerStrategy]
        // To change the radius of the bars, use [ConstCornerStrategy]
          cornerStrategy: const charts.ConstCornerStrategy(30)),

    ),
    ),
    );
  }
  getDomainAxisFormate()
  {
  return new charts.DateTimeAxisSpec(
  tickProviderSpec: getTickProviderSpecification(),
  tickFormatterSpec: new charts.AutoDateTimeTickFormatterSpec(
  day:  (aggregateBy==1?new charts.TimeFormatterSpec(format: 'Md', transitionFormat: 'Md', noonFormat: 'Md')
          : new charts.TimeFormatterSpec(format: 'EEE', transitionFormat: 'EEE', noonFormat: 'EEE')),

    month: new charts.TimeFormatterSpec(format: 'M', transitionFormat: 'M', noonFormat: 'M'),
    year: new charts.TimeFormatterSpec(format: 'y',transitionFormat: 'y', noonFormat: 'y')
  ),
  showAxisLine: false,
  );
  }

  getTickProviderSpecification()
  {
    if(aggregateBy==0)
    return charts.DayTickProviderSpec(increments: [1]);
    else if(aggregateBy==1)
      return charts.DayTickProviderSpec(increments: [7]);
    else if(aggregateBy==2)
      return charts.DayTickProviderSpec(increments: [30]);
    else if(aggregateBy==3)
      return charts.DayTickProviderSpec(increments: [364]);

  }

   List<charts.Series<OrdinalTrip, DateTime>> getSeriesFromTrip(){
    List<OrdinalTrip>data= getDateBasedOnAggregate();

    return [
      new charts.Series<OrdinalTrip,DateTime>(
        id: 'Distance',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(HexColor('#F1B440')),
        domainFn: (OrdinalTrip trip, _) =>trip.date,
        measureFn: (OrdinalTrip trip, _) => trip.totalDistance,
        data: data,
      )
    ];
   }
  //String hm=DateFormat.Hm().format());
  //data.add(new OrdinalTrip(hm, trips[i]['TotalDistance']));
  getDateBasedOnAggregate()
  {
    List<OrdinalTrip>data=new List <OrdinalTrip>();
    var filterBy=[7,31, 13,6];

var durationsByFilter= [ Duration(days:1), Duration(days:1), Duration(days:30), Duration(days:364)];

    DateTime graphDate=dateStart;

      for (var i = 0; i < filterBy[aggregateBy]; i++) {
        var aggregatedDistance=0.0;

        for(var j=0;j<trips.length;j++) {
          DateTime currentTripDate=DateTime.parse(trips[j]['startDate']);

          if(compareDatesByAggregate(currentTripDate,graphDate)) {
            aggregatedDistance=aggregatedDistance+trips[j]['TotalDistance'];
          }//if



        }//j

        data.add(new OrdinalTrip(graphDate,aggregatedDistance));

      graphDate=graphDate.add(durationsByFilter[aggregateBy]);

      }//i
    return data;
    }
  compareDatesByAggregate(DateTime TripDate,DateTime graphDate)
  {
    if(aggregateBy==0 && TripDate.year==graphDate.year&& TripDate.month==graphDate.month&& TripDate.day==graphDate.day)//week
      return true;
    else if( aggregateBy==1 && TripDate.year==graphDate.year&& TripDate.month==graphDate.month&& TripDate.day==graphDate.day)//month
      return true;
    else if(aggregateBy==2 && TripDate.year==graphDate.year&& TripDate.month==graphDate.month)
      return true;
    else if(aggregateBy==3 && TripDate.year==graphDate.year)
      return true;
    else
      return false;


  }
  formateBasedOnFilter(DateTime gdateTime)
  {
    if(aggregateBy==0)//week
      return DateFormat.E().format(gdateTime);
    else if(aggregateBy==1)
        return DateFormat.Md().format(gdateTime);
    else if(aggregateBy==2)
      return DateFormat.M().format(gdateTime);
    else if(aggregateBy==3)
      return DateFormat.y().format(gdateTime);



  }



  }//CustomRoundedBars


/// Sample ordinal data type.
class OrdinalTrip{
  final DateTime date;

  //final double risk;
  final double totalDistance;
 // final double avgSpeed;


  OrdinalTrip(this.date, this.totalDistance,);
}

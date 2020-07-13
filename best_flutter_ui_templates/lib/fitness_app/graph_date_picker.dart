

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'descriptive_statistics.dart';
import 'rounded_bars_graph.dart';

class GraphDatePickerView extends StatefulWidget {
  final DateTime currentDateTime;
  final int tabIndex;
  final List items;

  const GraphDatePickerView({ Key key ,@required this.currentDateTime,@required this.tabIndex,@required this.items}) :
        assert(currentDateTime != null),
        assert(tabIndex != null),
        assert(items != null),
        super(key: key);

  @override
  _GraphDatePickerViewState createState() => _GraphDatePickerViewState();
}

class _GraphDatePickerViewState extends State<GraphDatePickerView>  with TickerProviderStateMixin {
  DateTime get currentDateTime => widget.currentDateTime;
  int get tabIndex => widget.tabIndex;
  List get items =>widget.items;
  
  DateTime selecteDateTime,startDateFilter,endDateFilter;
  String firstDate,secondDate;
   
  static int noYears=4;
 Widget displayedWidget, bargraphWidget,descriptiveStatWidget;
  @override
  void initState() {
    selecteDateTime=currentDateTime;

    bargraphWidget=Text('');
    descriptiveStatWidget=Text('');
    displayedWidget=getWidget(tabIndex,currentDateTime);
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return displayedWidget;
  }
  dateBasedOnTab(int tab, DateTime choosenDate)
  {

    String limitDateTime1,limitDateTime2;
    DateTime baseDate;

  /*  if(tab==0) {//day
      firstDate = DateFormat.yMMMd().format(choosenDate);
      baseDate=choosenDate.subtract(Duration(hours: 1));
      limitDateTime1 = DateFormat.Hm().format(baseDate);
      limitDateTime2 = DateFormat.Hm().format(choosenDate);
      secondDate= limitDateTime1+' - '+limitDateTime2;

      startDateFilter= new DateTime(choosenDate.year, choosenDate.month, choosenDate.day, 0, 0, 0);
      endDateFilter=new DateTime(choosenDate.year, choosenDate.month, choosenDate.day, 23, 59, 59);


    }
    else */if(tab==0) {//week was 1
      baseDate=choosenDate.subtract(Duration(days: 6));
      
      limitDateTime1 = DateFormat.MMMMd().format(baseDate);
      limitDateTime2 = DateFormat.yMMMd().format(choosenDate);
      firstDate = limitDateTime1 +' - '+ limitDateTime2;
      secondDate= DateFormat.MMMMd().format(choosenDate.subtract(Duration(days: 3)));

      startDateFilter= new DateTime(baseDate.year, baseDate.month, baseDate.day, 0, 0, 0);
      endDateFilter=new DateTime(choosenDate.year, choosenDate.month, choosenDate.day, 23, 59, 59);

    }
    else if(tab==1) {//month was 2
      baseDate=choosenDate.subtract(Duration(days: 30));
      limitDateTime1 = DateFormat.MMMMd().format(baseDate);
      limitDateTime2 = DateFormat.yMMMd().format(choosenDate);
      firstDate = limitDateTime1 +' - '+ limitDateTime2;
      secondDate= DateFormat.MMMMd().format(choosenDate.subtract(Duration(days: 15)));

      startDateFilter= new DateTime(baseDate.year, baseDate.month, baseDate.day, 0, 0, 0);
      endDateFilter=new DateTime(choosenDate.year, choosenDate.month, choosenDate.day, 23, 59, 59);

    }
    else if(tab==2)//year
        {
      baseDate=DateTime.utc(choosenDate.year, DateTime.january, 1);

      limitDateTime1= DateFormat.yM().format(baseDate);
      limitDateTime2= DateFormat.yM().format(DateTime.utc(choosenDate.year, DateTime.december, 31));

      firstDate = limitDateTime1 +' - '+ limitDateTime2;
      secondDate= DateFormat.MMMM().format(choosenDate);

      startDateFilter= new DateTime(baseDate.year, baseDate.month, baseDate.day, 0, 0, 0);
      endDateFilter=new DateTime(choosenDate.year, choosenDate.month, choosenDate.day, 23, 59, 59);


    }
    else if(tab==3)
      {

        baseDate=DateTime.utc(choosenDate.year, DateTime.january, 1);
        baseDate=baseDate.subtract(Duration(days: noYears*365));
        limitDateTime1= DateFormat.yM().format(baseDate);
        limitDateTime2= DateFormat.yM().format(DateTime.utc(choosenDate.year, DateTime.december, 31));

        firstDate = limitDateTime1 +' - '+ limitDateTime2;
        secondDate= DateFormat.y().format(choosenDate);

        startDateFilter= new DateTime(baseDate.year, baseDate.month, baseDate.day, 0, 0, 0);
        endDateFilter=new DateTime(choosenDate.year, choosenDate.month, choosenDate.day, 23, 59, 59);


      }


    //  return {'1':firstDate,'2':SecondDate,'baseDate':baseDate.toIso8601String()};
  }

  Widget getWidget(int widgetNumber, DateTime dateTime) {
    // var dates=
    dateBasedOnTab(widgetNumber, dateTime);
    //activeTab=widgetNumber;
    //displayItemifMatch();
    getTripsForSpecifiedDate();
    return   Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(width: 10.0, height: 1.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[

             getMoveDateBackwards(),


            SizedBox(width: 15.0, height: 1.0,),
            Text( firstDate, style: TextStyle(fontSize: 12, color: Colors.black54),),
            SizedBox(width: 15.0, height: 1.0,),

            (selecteDateTime.isBefore(currentDateTime)? getMoveDateForwards():SizedBox(width: 24, height: 1.0,)),
          ],
        ),
        SizedBox(width: 10.0, height: 1.0,),
        //Text('${dates['2']}',style: TextStyle(fontSize: 12, color: Colors.black54))],
        Text(secondDate,style: TextStyle(fontSize: 12, color: Colors.black54)),

        bargraphWidget,
        descriptiveStatWidget
      ],


    );
  }
  getTripsForSpecifiedDate()
  {
    List trips= List.from(items);
    
   // trips.addAll(items);

     trips.retainWhere((item) => isTripWithinDateRange(item));
     print('trips len:${trips.length}');
     bargraphWidget=CustomRoundedBars(trips, tabIndex,startDateFilter,endDateFilter);
     
     descriptiveStatWidget=DescriptiveStatView(trips, tabIndex);
  }
  isTripWithinDateRange(item){
    DateTime itemTime=DateTime.parse(item['startDate']);

    if((startDateFilter.isBefore(itemTime)||startDateFilter.isAtSameMomentAs(itemTime))&&(
        endDateFilter.isAfter(itemTime)|| endDateFilter.isAtSameMomentAs(itemTime)))
      return true;

    else
    return false;
  }
displayItemifMatch()
{


print(startDateFilter.toIso8601String());
print(endDateFilter.toIso8601String());
  DateTime itemTime=DateTime.parse(items[0]['startDate']);

  if((startDateFilter.isBefore(itemTime)||startDateFilter.isAtSameMomentAs(itemTime))&&(
     endDateFilter.isAfter(itemTime)|| endDateFilter.isAtSameMomentAs(itemTime))) {


      bargraphWidget=Text(items[0]['startDate']);


     return true;


  }

  bargraphWidget=Text('');

  return false;
}
  getMoveDateForwards()
  {
    return  IconButton(
        splashColor:Colors.orangeAccent,

        icon: Icon(Icons.arrow_forward_ios, size: 12,color:Colors.black54),
        // tooltip: 'Increase volume by 10',
        onPressed: () {
          DateTime increasedDate;

        /*  if(tabIndex==0)
            increasedDate=selecteDateTime.add(Duration(hours: 1));
          else */if(tabIndex==0)
            increasedDate=selecteDateTime.add(Duration(days: 6));
          else if(tabIndex==1)
            increasedDate=selecteDateTime.add(Duration(days: 30));
                   else if(tabIndex==2)
            increasedDate=selecteDateTime.add(Duration(days: 365));
          else if(tabIndex==3)
            increasedDate=selecteDateTime.add(Duration(days: noYears*365));


          setState(() {
            selecteDateTime=increasedDate;

           displayedWidget=getWidget(tabIndex, increasedDate) ;
          });

        });

  }
  getMoveDateBackwards()
  {
    return  IconButton(
        splashColor:Colors.orangeAccent,
        icon:  Icon(Icons.arrow_back_ios, size: 12, color: Colors.black54),
        onPressed: () {
          DateTime decreasedDate;


         /* if(tabIndex==0)
            decreasedDate=selecteDateTime.subtract(Duration(hours: 1));
          else */if(tabIndex==0)
            decreasedDate=selecteDateTime.subtract(Duration(days: 6));
          else if(tabIndex==1)
            decreasedDate=selecteDateTime.subtract(Duration(days: 30));
          else if(tabIndex==2)
            decreasedDate=selecteDateTime.subtract(Duration(days: 365));
          else if(tabIndex==3)
            decreasedDate=selecteDateTime.subtract(Duration(days: noYears*365));


          setState(() {
            selecteDateTime=decreasedDate;
            displayedWidget=getWidget(tabIndex, decreasedDate) ;
          });
        });
  }
}

 
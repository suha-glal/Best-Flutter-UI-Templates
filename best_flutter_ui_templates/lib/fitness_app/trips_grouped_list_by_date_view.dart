
/*
import 'package:flutter/material.dart';
import './models/journey.dart';
import './models/single_journey_detial.dart';





import 'utilities.dart';

import '../../all_view_journey.dart';
import '../../drop_down_group_list.dart';
import '../../group_by_daymonthyear_view_journey.dart';

class TripsGroupedListByDateView extends StatefulWidget {


  TripsGroupedListByDateView();
  @override
  _TripsGroupedListByDateViewState createState() => _TripsGroupedListByDateViewState();
}

class _TripsGroupedListByDateViewState extends State<TripsGroupedListByDateView> {

  String dropDownMenuOption='Day';

handleDropDownMenu(String menuOption)
{
  setState(() {
    dropDownMenuOption=menuOption;
  });

}
  
  @override
  Widget build(BuildContext context) {
     BlocProvider.of<DatabaseBloc>(context).add(GetJourneyWithRoutes());
    return Scaffold(
      backgroundColor: Colors.white, //Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100], elevation: 0.0,
        title:DropDownGroupListWidget(onItemSelected:handleDropDownMenu)),
      
      body: //listView()
     
      BlocBuilder<DatabaseBloc, DatabaseState>(
  builder: (context, state) {
    if(state is DatabaseLoading)
    return Center(child:new CircularProgressIndicator(backgroundColor: Colors.red,));
    else if(state is DatabaseReady){
    return StreamBuilder(
      stream: state.weelDBJourneyDao.watchJourneySummaryWithLatLngList(),
      builder: (context, AsyncSnapshot<JourneySummaryWithLatLng> snapshot) {
       // print('fgh: ${snapshot.hasData}');
       if(snapshot.hasData){
        final journeysList = snapshot.data.oneJourney ?? List();
        final routeLatLng= snapshot.data.oneJourneyLatLng ?? List();

       List journeyItems= journeysList.map((f)=>Journey(f)).toList();
        return FutureBuilder<dynamic>(
      future: getGroupListMapBG(journeyItems),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? mainTripsView(snapshot.data,routeLatLng)
            : Center(child: CircularProgressIndicator());
      },
    );
       }
       else
       return Container(width: 0,height: 0,);
      },
    );
    
    
  }// if data is ready
    else
    return Container(width: 0,height: 0,);
  }//builder
     ),
       //else
   
    );
  }
 
mainTripsView(journeyList,routeLanLngList)
{
  
    //journeyList=data;

      if (dropDownMenuOption== 'All')
        return AllView(items: journeyList);
      else if (dropDownMenuOption == 'Year')
        return GroupByDayMonthYearView(items: journeyList,datePart: 'year',LatLngList:routeLanLngList);
      else if (dropDownMenuOption == 'Month')
        return GroupByDayMonthYearView(items: journeyList,datePart: 'monthYear',LatLngList:routeLanLngList);
      else if (dropDownMenuOption == 'Day')
        return GroupByDayMonthYearView(items: journeyList,datePart: 'dayMonthYear',LatLngList:routeLanLngList);

}

}
*/
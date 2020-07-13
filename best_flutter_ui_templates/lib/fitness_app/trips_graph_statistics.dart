
import 'package:flutter/material.dart';
import 'fintness_app_theme.dart';
import 'graph_date_picker.dart';

class TripGraphStatisticsView extends StatelessWidget {
  final List items;
  List<Tab> _tabs = List<Tab>();
   TripGraphStatisticsView({ Key key, @required this.items})
      : assert(items != null),
        super(key: key) {
    _tabs=getTabs();
  }

  /* new Tab(text:'Day'),
  new Tab(text:'Week'),
  new Tab(text:'Month'),
  new Tab(text:'Year'),
  new Tab(text:'Total'),
  ];*/
  List<Tab> getTabs() {
    List<String> tabsNames=[/*'Day',*/'Week','Month', 'Year','Total'];
   // _tabs.clear();

    for (var element in tabsNames) {
      _tabs.add( new Tab(text:element));
    }

    return _tabs;
  }
  Widget build(BuildContext context) {
    return Scaffold(
appBar: //AppBar(title:Center (child:Text('Summary',style: TextStyle(color: Colors.black))),backgroundColor: Colors.white,),
AppBar(title:Center (child:Text(
  'Statistics',
  textAlign: TextAlign.center,
  style: TextStyle(
    fontFamily: FintnessAppTheme.fontName,
    fontWeight: FontWeight.w700,
    fontSize: 22, //+ 6 - 6 * topBarOpacity,
    letterSpacing: 1.2,
    color: FintnessAppTheme.darkerText,
  ),
),),backgroundColor: Colors.white,)  ,
body: DefaultTabController(
        length: _tabs.length,//number of tabs
        child:Container(child:Column(

        children: <Widget>[
          SizedBox(
            width: 200.0,
            //height:400.0,
            child:  TabBar(
              tabs: _tabs,
              unselectedLabelColor:Colors.black54,
              labelColor: Theme.of(context).primaryColor,
              labelPadding: EdgeInsets.zero,
            ),
          ),
          Expanded(

            child: TabBarView(

              physics: NeverScrollableScrollPhysics(),

              children: [
              //  GraphDatePickerView(currentDateTime:DateTime.now(),tabIndex: 0,items:items),//day
                GraphDatePickerView(currentDateTime:DateTime.now(),tabIndex:0,items:items),//tabIndex: 1//week
                GraphDatePickerView(currentDateTime:DateTime.now(),tabIndex:1,items:items),//tabIndex: 2//month
                GraphDatePickerView(currentDateTime:DateTime.now(),tabIndex:2,items:items),//tabIndex: 3//year
                GraphDatePickerView(currentDateTime:DateTime.now(),tabIndex:3,items:items),//Total
              ],

            ),
          ),

        ],
      ),
      ),

   ),);
  }
}

 
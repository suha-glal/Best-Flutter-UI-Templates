import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/journey.dart';

//import '../data/constant_database.dart';
//import '../models/journey.dart';
//import 'package:sdrive/service/utilities.dart';
//import '../ui/pie_chart_speed.dart';
import 'summary_journey_info.dart';

class CustomExpansionTileListView extends StatelessWidget {
  final Map elements;
  List<GroupedJourneys> groupedJouerneys = List();
  final List latLngList;

  CustomExpansionTileListView({ Key key, @required this.elements,@required this.latLngList})
      : assert(elements != null),
        super(key: key) {
    elements.forEach((k, v) => groupedJouerneys.add(GroupedJourneys(k, v)));
  }

  Widget build(BuildContext context) {
    return groupedJouerneys.isNotEmpty ? ExpansionTileForGroupOfJourneys(
        groupedJouerneys)
        : Center(child: CircularProgressIndicator());
  }

 

  ExpansionTileForGroupOfJourneys(groupedJouerneys) {
    return ListView.builder(
      itemCount: groupedJouerneys.length,
      itemBuilder: (context, i) {
        return new ExpansionTile(
          title: new Text(
            groupedJouerneys[i].title, style: new TextStyle(fontSize: 14.0,
            fontWeight: FontWeight.bold,),),
          children: <Widget>[
            new Column(
              children: _buildExpandableContent(groupedJouerneys[i]),
            ),
          ],
        );
      },

    );
  }
 _buildExpandableContent(GroupedJourneys mygroupedJourneys) {
    List<Widget> columnContent = [];

    for (var content in mygroupedJourneys.contents)
      columnContent.add(
          ExpantionTileForSingleJourney(content)

      );


    return columnContent;
  }
  ExpantionTileForSingleJourney(element) {
    int index=(element[columnIdJourney]as int)-1;
    print(index);
    return
       ExpansionTile(
      title: SummaryJournyInfoView.levelOneView(element),
      children: <Widget>[
       new Column(
       children:<Widget>[
        SummaryJournyInfoView.levelTwoView(element),
        SummaryJournyInfoView.levelThreeView(element),
        SummaryJournyInfoView.levelFourView(element),
        SummaryJournyInfoView.levelSixView(element,latLngList[index])
       
      ],
        ),
    ]
       );

  }

}


class GroupedJourneys
{
  final String title;
  List contents=[];
  GroupedJourneys(this.title,this.contents);

}

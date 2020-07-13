import 'package:flutter/material.dart';
import './models/journey.dart';
import 'fintness_app_theme.dart';
import 'models/journeys_list_data.dart';
import 'utilities.dart';
import './models/single_journey_detial.dart';

import 'trips_graph_statistics.dart';



class TripsSummaryView extends StatelessWidget {



  @override
  Widget build(BuildContext context) {


        final journeysList = journeyListFilled;

       List journeyItems= journeysList.map((f)=>Journey(f)).toList();
        return FutureBuilder<dynamic>(
      future: getGroupListMapBG(journeyItems),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ?  TripGraphStatisticsView(items:snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );


  }//TripViw
  Widget getStatisticsWithAppbarView(statisticView){
    return Container(
      color: FintnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
         mainAxisSize:MainAxisSize.max ,
          children: <Widget>[

           // getAppBarUI()
            //statisticView,
           /* SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            ),*/

          ],
        ),
      ),
    );
  }
  /*
Widget getAppBarUI() {
  return Container(
                decoration: BoxDecoration(
                  color: FintnessAppTheme.white.withOpacity(topBarOpacity),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(32.0),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: FintnessAppTheme.grey
                            .withOpacity(0.4 * topBarOpacity),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                   /* SizedBox(
                      height: MediaQuery.of(context).padding.top,
                    ),*/
                    Padding(
                      padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 16 - 8.0 * topBarOpacity,
                          bottom: 12 - 8.0 * topBarOpacity),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                         Expanded(
                            child:Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Statistics',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: FintnessAppTheme.fontName,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22, //+ 6 - 6 * topBarOpacity,
                                  letterSpacing: 1.2,
                                  color: FintnessAppTheme.darkerText,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              );

}

   */
}

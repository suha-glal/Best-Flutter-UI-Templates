import 'package:best_flutter_ui_templates/main.dart';
/// Donut chart with labels example. This is a simple pie chart with a hole in
/// the middle.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class DonutAutoLabelChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;
 static List <String> distributionString=['S<60','60<=S<100', '100<=S<120','120<=S<150','S>=150'];
  DonutAutoLabelChart(this.seriesList, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory DonutAutoLabelChart.withData(double sless60,double s60s100,double s100s120, double s120s150,double s150) {
    return new DonutAutoLabelChart(
      _createSampleData(sless60,s60s100,s100s120,  s120s150, s150),
      // Disable animations for image tests.
      animate: true,
    );
  }


  @override
  Widget build(BuildContext context) {
    return  Expanded(


    child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Flexible(flex: 3,child: new charts.PieChart(seriesList,
        animate: animate,

        // Configure the width of the pie slices to 60px. The remaining space in
        // the chart will be left as a hole in the center.
        //
        // [ArcLabelDecorator] will automatically position the label inside the
        // arc if the label will fit. If the label will not fit, it will draw
        // outside of the arc with a leader line. Labels can always display
        // inside or outside using [LabelPosition].
        //
        // Text style for inside / outside can be controlled independently by
        // setting [insideLabelStyleSpec] and [outsideLabelStyleSpec].
        //
        // Example configuring different styles for inside/outside:

        defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 30,
            arcRendererDecorators: [new charts.ArcLabelDecorator(
        //labelPosition: charts.ArcLabelPosition.inside,
            insideLabelStyleSpec: new charts.TextStyleSpec(fontSize: 7, color:
            charts.Color.fromHex(code: "#FFFFFF"))
            )])

    ),),
        Flexible(flex: 1,child:Wrap(
              spacing: 2.0, // gap between adjacent chips
              runSpacing: 4.0, // gap
              alignment: WrapAlignment.center,
              direction: Axis.horizontal,
              children: <Widget>[
                getColoredBoxwithLabel( 'speed <60',HexColor('#F1B440')),//Colors.green.shade300),
                getColoredBoxwithLabel('60<=Speed<100',HexColor('#00b8ba')),//Colors.blue.shade300),
                getColoredBoxwithLabel('100<=Speed<120',Colors.grey),
                getColoredBoxwithLabel('120<=Speed<150',HexColor('#802c92')),
                getColoredBoxwithLabel('Speed>=150',HexColor('#d62246')),


              ]
      ),
    ),

   ],


),


    );
  }
getColoredBoxwithLabel(labeltext,labelcolor)
{
  return Row(

      children: <Widget>[
        Container(height: 7,width: 7, color: labelcolor),
         Text(' $labeltext', style:TextStyle(color: Colors.grey, fontSize:8),),

      ]);
}
  /// Create one series with sample hard coded data.
  static List<charts.Series<SpeedDist, int>> _createSampleData(double sless60,double s60s100,double s100s120, double s120s150,double s150) {
    final data = [
      new SpeedDist(0, sless60,charts.ColorUtil.fromDartColor(HexColor('#F1B440')),),//Colors.green.shade300)),
      new SpeedDist(1, s60s100,charts.ColorUtil.fromDartColor(HexColor('#00b8ba')),),
      new SpeedDist(2,s100s120,charts.ColorUtil.fromDartColor(Colors.grey)),
      new SpeedDist(3, s120s150,charts.ColorUtil.fromDartColor(HexColor('#802c92'))),
      new SpeedDist(4, s150,charts.ColorUtil.fromDartColor(HexColor('#d62246')),),
    ];

    return [
      new charts.Series<SpeedDist, int>(
        displayName: 'Speed Distribution',
        id: 'Speed',
        domainFn: (SpeedDist speed, _) => speed.speedRange,
        measureFn: (SpeedDist speed, _) => speed.distribution,
        colorFn:(SpeedDist speed, _) => speed._color ,
        data: data,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (SpeedDist row, _) => '${(row.distribution*100).toStringAsFixed(2)}%',
      )
    ];
  }
}

/// Sample linear data type.
class SpeedDist {
  final int speedRange;
  final double distribution;
  final charts.Color _color;
  SpeedDist(this.speedRange, this.distribution, this._color);
}

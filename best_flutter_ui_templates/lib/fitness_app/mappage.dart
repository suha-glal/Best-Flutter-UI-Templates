import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class PolylinePage extends StatelessWidget {
  static const String route = 'polyline';
final String MAP_TOKEN = 'pk.eyJ1IjoiY2hyaXN0b2NyYWN5IiwiYSI6ImVmM2Y2MDA1NzIyMjg1NTdhZGFlYmZiY2QyODVjNzI2In0.htaacx3ZhE5uAWN86-YNAQ';
List<LatLng> points ;
PolylinePage(this.points);
  @override
  Widget build(BuildContext context) {
    
    

    return SizedBox(
        //width: 100.0,
        height: 200.0,
        child: Container(
          margin: const EdgeInsets.all(5.0),
  decoration: BoxDecoration( border: Border.all(color: Theme.of(context).accentColor,width: 2.0), ),
  child: FlutterMap(
                options: MapOptions(
                  center: points[points.length~/2 ], //LatLng(51.5, -0.09),
                  zoom: 14.0,
                   minZoom: 10,
                   maxZoom: 18,
   
   // swPanBoundary: points[0],
    nePanBoundary: points[0],
                ),
                layers: [
                  TileLayerOptions(
            urlTemplate: "https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
            additionalOptions: {
              'accessToken': MAP_TOKEN,
              'id': 'mapbox.streets',
            },),
                  PolylineLayerOptions(
                    polylines: [
                      Polyline(
                          points: points,
                          strokeWidth: 4.0,
                          color: Colors.blueAccent.withOpacity(.7)),
                    ],
                  ),
                  
                ],
             ),
     ),
      );
            
  }
}
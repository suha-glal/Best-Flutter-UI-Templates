class MealsListData {
  MealsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    this.kacl = 0,
    this.unit='',
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String unit;
  String endColor;
  List<String> meals;
  int kacl;

  static List<MealsListData> tabIconsList = <MealsListData>[
    MealsListData(
      imagePath: 'assets/fitness_app/speed.png',
      titleTxt: 'Speed',
      kacl: 160,
      unit:'km/hr',
      meals: <String>['Max. 160 km/hr','Avg. 45 km/hr' ],
      startColor:'#d62246',// '#FA7D82',
      endColor: '#EE94A6',//'#FFB295',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/brake.png',
      titleTxt: 'Acc.',
      kacl: 80,
      unit:'km/hr2',
      meals: <String>['Max: 80 km/h2', 'Avg. 60 km/hr2'],
      startColor: '#802c92',//'#738AE6',
      endColor: '#D3A4DD',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/smartphone.png',
      titleTxt: 'Distraction',
      kacl: 20,
      unit: 'mins',
      meals: <String>['Call: 5', 'Duration: 20 min'],
      startColor: '#00b8ba',//'#FE95B6',
      endColor: '#78BABB',//'#FF5287',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/corner.png',
      titleTxt: 'Cornering',
      kacl: 100,
      unit: 'N',
      meals: <String>['Max: 100 N', 'Avg: 80 N', ],
      startColor:'#F1B440' ,//'#6F72CA',
      endColor: '#CCAA6A',
    ),
  ];
}

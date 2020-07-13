class ServiceListData {
  ServiceListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.dist = 1.8,
    this.reviews = 80,
    this.rating = 4.5,
    this.price = 180,
  });

  String imagePath;
  String titleTxt;
  String subTxt;
  double dist;
  double rating;
  int reviews;
  int price;

  static List<ServiceListData> serviceList = <ServiceListData>[
    ServiceListData(
      imagePath: 'assets/service/service1.jpg',
      titleTxt: 'Dubai Car Care',
      subTxt: 'Dubai',
      dist: 2.0,
      reviews: 80,
      rating: 4.4,
      price: 180,
    ),
    ServiceListData(
      imagePath: 'assets/service/service2.jpeg',
      titleTxt: 'Banorama Car Care',
      subTxt: 'Dubai',
      dist: 4.0,
      reviews: 74,
      rating: 4.5,
      price: 200,
    ),
    ServiceListData(
      imagePath: 'assets/service/service3.jpeg',
      titleTxt: 'Epic Repair',
      subTxt: 'Abu Dhabi',
      dist: 3.0,
      reviews: 62,
      rating: 4.0,
      price: 160,
    ),
    ServiceListData(
      imagePath: 'assets/service/service4.jpeg',
      titleTxt: ' AARYA AUTO',
      subTxt: 'Al Sharjah',
      dist: 7.0,
      reviews: 90,
      rating: 4.4,
      price: 400,
    ),
    ServiceListData(
      imagePath: 'assets/service/service5.jpg',
      titleTxt: 'ABCT RoadSide Assistance',
      subTxt: 'Ajman',
      dist: 2.0,
      reviews: 240,
      rating: 4.5,
      price: 150,
    ),
  ];
}

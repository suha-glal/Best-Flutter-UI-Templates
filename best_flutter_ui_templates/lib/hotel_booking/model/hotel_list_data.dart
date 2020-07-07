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
      imagePath: 'assets/service/service_1.png',
      titleTxt: 'Oman Insurance Company',
      subTxt: 'Abu Dhabi',
      dist: 2.0,
      reviews: 80,
      rating: 4.4,
      price: 180,
    ),
    ServiceListData(
      imagePath: 'assets/service/service_2.png',
      titleTxt: 'Emirates Insurance',
      subTxt: 'Dubai',
      dist: 4.0,
      reviews: 74,
      rating: 4.5,
      price: 200,
    ),
    ServiceListData(
      imagePath: 'assets/service/service_3.gif',
      titleTxt: 'Union Insurance',
      subTxt: 'Al Ain',
      dist: 3.0,
      reviews: 62,
      rating: 4.0,
      price: 60,
    ),
    ServiceListData(
      imagePath: 'assets/service/service_4.jpg',
      titleTxt: 'Orient Insurance',
      subTxt: 'Al Sharjah',
      dist: 7.0,
      reviews: 90,
      rating: 4.4,
      price: 170,
    ),
    ServiceListData(
      imagePath: 'assets/service/service_5.png',
      titleTxt: 'AD National Insurance co.',
      subTxt: 'Ajman',
      dist: 2.0,
      reviews: 240,
      rating: 4.5,
      price: 200,
    ),
  ];
}

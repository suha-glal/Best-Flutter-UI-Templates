class PopularFilterListData {
  PopularFilterListData({
    this.titleTxt = '',
    this.isSelected = false,
  });

  String titleTxt;
  bool isSelected;

  static List<PopularFilterListData> popularFList = <PopularFilterListData>[
    PopularFilterListData(
      titleTxt: 'Simple claims',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Digital Support',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'Roadside Help',
      isSelected: false,
    ),

    PopularFilterListData(
      titleTxt: 'Agency Repair',
      isSelected: false,
    ),

    PopularFilterListData(
      titleTxt: 'Quick Quotations',
      isSelected: false,
    ),
  ];

  static List<PopularFilterListData> accomodationList = [
    PopularFilterListData(
      titleTxt: 'All',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Comprehensive',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Third Party Only',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'High Net Worth Cover',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Custom',
      isSelected: false,
    ),
   /* PopularFilterListData(
      titleTxt: 'Resort',
      isSelected: false,
    ),*/
  ];
}

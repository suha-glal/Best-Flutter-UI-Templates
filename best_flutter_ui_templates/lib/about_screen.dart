import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:flutter/material.dart';

import 'model/about_uslist.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key key}) : super(key: key);

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage>
    with TickerProviderStateMixin {
  List<AboutUs> profileList = AboutUs.profileList;

  AnimationController animationController;
  bool multiple = false;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('About Us',
              style: TextStyle(
                fontSize: 22,
                color: AppTheme.darkText,
                fontWeight: FontWeight.w700,
              )),
          backgroundColor: Colors.grey[300]),
      backgroundColor: AppTheme.white,
      body: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //appBar(),
                  Container(
                    child: FutureBuilder<bool>(
                      future: getData(),
                      builder:
                          (BuildContext context, AsyncSnapshot<bool> snapshot) {
                        if (!snapshot.hasData) {
                          return const SizedBox();
                        } else {
                          return Stack(
                            children: List<Widget>.generate(
                              profileList.length,
                              (int index) {
                                final int count = profileList.length;
                                final Animation<double> animation =
                                    Tween<double>(begin: 0.0, end: 1.0).animate(
                                  CurvedAnimation(
                                    parent: animationController,
                                    curve: Interval((1 / count) * index, 1.0,
                                        curve: Curves.fastOutSlowIn),
                                  ),
                                );
                                animationController.forward();
                                return AboutUsView(
                                  animation: animation,
                                  animationController: animationController,
                                  listData: profileList[index],
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ),

                  Divider(height: 2, color: AppTheme.grey.withOpacity(0.6)),

                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text(
                      "Who we are?",
                      style: AppTheme.profileCategory,
                    ),
                    //  color: Colors.green[100],
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                        'Telematics APP for Urban Transportation, Insurance, Market research companies, and others'),
                    //color: Colors.green[400],
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'What we do?',
                      style: AppTheme.profileCategory,
                    ),
                    //color: Colors.green[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                        'We provide smartphone telematics solutions which enables you to leverage customer behaviors data in order to engage better motor insurance portfolio, build targeted communications with customers, cross-sell and up-sell based on customer preferences and needs as well as provide customers with a new experience of having smart insurance products like UBI, on-demand, contextual and other advanced insurance products.'),
                    // color: Colors.green[200],
                  ),

                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'How we do it?',
                      style: AppTheme.profileCategory,
                    ),
                    //  color: Colors.green[500],
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                        '1. We use advanced algorithms to minimal reliance on GPS to extensively reduce battery drain.',
                        style: AppTheme.body2),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                        '2. Fully autonomus SDK to collect telematics data. All processes runs in background mode.',
                        style: AppTheme.body2),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                        '3. We analyze driving behavior patterns and calculate overall risk level as well as daily performance.',
                        style: AppTheme.body2),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                        '4. AI Algorithms that provide drivers with tailored recommendations to give driving style safer.',
                        style: AppTheme.body2),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                        '5. Get access to life-style analysis as well as mode of car usage to better understand your customers.',
                        style: AppTheme.body2),
                  ),
//],
                  // ),
                  //  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class AboutUsView extends StatelessWidget {
  const AboutUsView(
      {Key key,
      this.listData,
      this.callBack,
      this.animationController,
      this.animation})
      : super(key: key);

  final AboutUs listData;
  final VoidCallback callBack;
  final AnimationController animationController;
  final Animation<dynamic> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: Column(
              children: <Widget>[
                Stack(
                  // alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    listData.itemDescription,
                  ],
                ),
                //
                //  buildAboutUsDetails()
              ],
            ),
          ),
        );
      },
    );
  }
}

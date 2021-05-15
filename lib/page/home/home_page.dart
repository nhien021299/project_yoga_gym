import 'package:fitness_app_ii_example/page/home/widgets/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      background: Image.asset(
        'assets/images/home_bg.png',
        height: Get.height,
        width: Get.width,
        fit: BoxFit.fill,
      ),
      body: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: Get.width,
          height: Get.height,
          padding: EdgeInsets.all(16 * 1.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Hello,",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Nguyen Minh Tam",
                    style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0 * 2),
                  Text(
                    "How are you doing?",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Daily Activity",
                        style: Theme.of(context).textTheme.headline6.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 12),
                      ActivityCard(
                        value: "35",
                        unit: "exercises",
                        chartImage: 'assets/icons/line_chart.png',
                        unitIcon: 'assets/icons/exercise.png',
                      ),
                      SizedBox(height: 12),
                      ActivityCard(
                        value: "90",
                        unit: "bpm",
                        chartImage: 'assets/icons/line_chart.png',
                        unitIcon: 'assets/icons/heart_beat.png',
                      ),
                      SizedBox(height: 12),
                      ActivityCard(
                        value: "960",
                        unit: "calories",
                        chartImage: 'assets/icons/line_chart.png',
                        unitIcon: 'assets/icons/fire.png',
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16 * 1.5),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "GOOD",
                                    style: Theme.of(context).textTheme.headline3.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Performance",
                                    style: TextStyle(height: 1),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 16),
                            Container(
                              height: 65,
                              width: 1,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.star_rounded, color: Theme.of(context).primaryColor),
                                  Icon(Icons.star_rounded, color: Theme.of(context).primaryColor),
                                  Icon(Icons.star_rounded, color: Theme.of(context).primaryColor),
                                  Icon(Icons.star_rounded, color: Theme.of(context).primaryColor),
                                  Icon(Icons.star_half_rounded, color: Theme.of(context).primaryColor),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: Colors.transparent,
          unselectedItemColor: Theme.of(context).iconTheme.color,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: "Person",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timer_rounded),
              label: "Timer",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_rounded),
              label: "Notifications",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    Key key,
    @required this.value,
    @required this.unit,
    @required this.chartImage,
    @required this.unitIcon,
  }) : super(key: key);

  final String value;
  final String unit;
  final String chartImage;
  final String unitIcon;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      child: Container(
        height: 115,
        padding: EdgeInsets.all(16 * 1.5),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    value,
                    style: Theme.of(context).textTheme.headline3.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  ),
                  Text(
                    unit,
                    style: TextStyle(height: 1),
                  )
                ],
              ),
            ),
            SizedBox(width: 32),
            Expanded(
              flex: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      chartImage,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: 32),
                  Column(
                    children: [
                      Image.asset(
                        unitIcon,
                        height: 24,
                        width: 24,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

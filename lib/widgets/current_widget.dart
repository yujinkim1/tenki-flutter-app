import 'package:flutter/material.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:tenki/main.dart';
import 'package:tenki/providers/current_weather.dart';
import 'package:tenki/widgets/daily_widget.dart';

class CurrentContainer extends StatelessWidget {
  final AsyncSnapshot<CurrentWeather> snapshot;
  final String src = "http://openweathermap.org/img/wn/";

  const CurrentContainer({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = snapshot.data;
    var weatherList = data!.weather!;
    var desc = weatherList[0].description;
    var mainList = data.main;
    var temp = mainList!.temp!;
    var maxTemp = mainList.temp_max;
    var minTemp = mainList.temp_min;
    var name = data.name;
    var windSpeed = data.wind!.speed;
    var humidity = mainList.humidity;
    var pressure = mainList.pressure;
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        height: 1000,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            BlurryContainer(
              color: MyApp.themeNotifier.value == ThemeMode.light
                  ? Colors.grey.withOpacity(0.25)
                  : Color(0xff21262d),
              elevation: 0,
              borderRadius: BorderRadius.circular(0),
              child: Column(children: [
                Column(children: [
                  BlurryContainer.square(
                      color: MyApp.themeNotifier.value == ThemeMode.light
                          ? Color(0xff21262d).withOpacity(0.65)
                          : Colors.white.withOpacity(0.15),
                      blur: 8,
                      elevation: 6,
                      child: Column(
                        children: [
                          Row(children: [
                            Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Align(
                                      child: Text("$name",
                                          style: TextStyle(
                                              fontSize: 33,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  MyApp.themeNotifier.value ==
                                                          ThemeMode.light
                                                      ? Colors.white
                                                      : Colors.white)),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Image.network(
                                      src + weatherList[0].icon! + "@2x.png",
                                      scale: 0.7,
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Align(
                                      child: Text("$desc",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  MyApp.themeNotifier.value ==
                                                          ThemeMode.light
                                                      ? Colors.white
                                                      : Colors.white)),
                                    )),
                              ],
                            ),
                            Column(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Align(
                                          child: Text(
                                            "$temp˚",
                                            style: TextStyle(
                                                fontSize: 60,
                                                fontWeight: FontWeight.normal,
                                                color:
                                                    MyApp.themeNotifier.value ==
                                                            ThemeMode.light
                                                        ? Colors.white
                                                        : Colors.white),
                                          ),
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(top: 30),
                                        child: Align(
                                          child: Text(
                                            "최고 $maxTemp˚ / 최저 $minTemp˚",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal,
                                                color:
                                                    MyApp.themeNotifier.value ==
                                                            ThemeMode.light
                                                        ? Colors.white
                                                        : Colors.white),
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ]),
                        ],
                      )),
                  Divider(
                      color: MyApp.themeNotifier.value == ThemeMode.light
                          ? Colors.grey.shade600
                          : Colors.white),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.water_drop_outlined,
                                color:
                                    MyApp.themeNotifier.value == ThemeMode.light
                                        ? Color(0xff21262d)
                                        : Colors.white),
                            Icon(Icons.air,
                                color:
                                    MyApp.themeNotifier.value == ThemeMode.light
                                        ? Color(0xff21262d)
                                        : Colors.white),
                            Icon(Icons.compress,
                                color:
                                    MyApp.themeNotifier.value == ThemeMode.light
                                        ? Color(0xff21262d)
                                        : Colors.white)
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("습도 $humidity %",
                                style: TextStyle(
                                    color: MyApp.themeNotifier.value ==
                                            ThemeMode.light
                                        ? Color(0xff21262d)
                                        : Colors.white)),
                            Text("풍속 $windSpeed km/h",
                                style: TextStyle(
                                    color: MyApp.themeNotifier.value ==
                                            ThemeMode.light
                                        ? Color(0xff21262d)
                                        : Colors.white)),
                            Text("기압 $pressure hPa",
                                style: TextStyle(
                                    color: MyApp.themeNotifier.value ==
                                            ThemeMode.light
                                        ? Color(0xff21262d)
                                        : Colors.white)),
                          ],
                        ),
                      ),
                      BlurryContainer(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(children: [
                            DailyForecast(
                                "오늘 ", "-11.3", "-11.3", "-1.0", "02d"),
                            DailyForecast(
                                "월요일", "-10.2", "-11.3", "-3.0", "03d"),
                            DailyForecast("화요일", "-8.9", "-8.9", "-1.0", "02d"),
                            DailyForecast(
                                "수요일", "-10.0", "-10.0", "-2.0", "01d"),
                            DailyForecast(
                                "목요일", "-12.3", "-12.3", "-6.0", "01d"),
                            DailyForecast("금요일", "-9.2", "-9.2", "-5.0", "13d"),
                            DailyForecast("토요일", "-8.8", "-8.8", "-4.0", "13d"),
                          ]),
                        ),
                      )
                    ],
                  ),
                ]),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

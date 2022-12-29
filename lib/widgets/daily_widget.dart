import 'package:flutter/material.dart';
import 'package:tenki/main.dart';

Widget DailyForecast(
  String days,
  String temp,
  String min_temp,
  String max_temp,
  String icon,
) {
  return Padding(
    padding: EdgeInsets.all(5.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: Text(
                days,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Image.network(
                  "http://openweathermap.org/img/wn/" +
                      icon.toString() +
                      "@2x.png",
                  scale: 2.0,
                )),
            Align(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 5,
                ),
                child: Text(
                  '$temp˚',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: Text(
                  '$max_temp˚ / $min_temp˚',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: MyApp.themeNotifier.value == ThemeMode.light
                          ? Colors.grey.shade600
                          : Colors.grey.shade400),
                ),
              ),
            ),
          ],
        ),
        Divider(),
      ],
    ),
  );
}

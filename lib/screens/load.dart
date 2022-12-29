import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tenki/utilities/api.dart';
import 'package:tenki/screens/home.dart';

class LoadScreen extends StatefulWidget {
  const LoadScreen({Key? key}) : super(key: key);

  @override
  State<LoadScreen> createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  void getLocationData() async {
    try {
      var weatherInfo = await OpenWeatherApi().fetchCurrentWeather();
      await Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomeScreen(currentWeather: weatherInfo);
      }));
    } catch (error) {
      print("getLocationData: $error");
    }
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LoadingAnimationWidget.beat(color: Colors.grey, size: 40),
            SizedBox(height: 15),
            Text(
              "필요한 정보를 불러오는 중이에요..",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
            )
          ],
        )));
  }
}

import 'package:flutter/material.dart';
import 'package:tenki/styles/palette.dart';
import 'package:tenki/providers/current_weather.dart';
import 'package:tenki/main.dart';
import 'package:tenki/utilities/api.dart';
import 'package:tenki/widgets/current_widget.dart';

class HomeScreen extends StatefulWidget {
  final CurrentWeather? currentWeather;
  const HomeScreen({Key? key, required this.currentWeather}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<CurrentWeather> objects;
  @override
  void initState() {
    super.initState();
    if (widget.currentWeather != null) {
      objects = Future.value(widget.currentWeather);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: MyApp.themeNotifier.value == ThemeMode.light
            ? Palette.lightScaffold
            : Palette.darkScaffold,
        appBar: AppBar(
          backgroundColor: MyApp.themeNotifier.value == ThemeMode.light
              ? Palette.lightAppBar
              : Palette.darkAppbar,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            //MARK: Sorted appBar items
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //MARK: isOnTap ? refresh call api
              GestureDetector(
                onTap: () {
                  setState(() {
                    /*
                    Navigator.pop(context,
                        MaterialPageRoute(builder: (context) {
                      return LoadScreen();
                    }));*/
                    objects = OpenWeatherApi().fetchCurrentWeather();
                  });
                },
                child: Icon(
                  Icons.refresh_outlined,
                  color: MyApp.themeNotifier.value == ThemeMode.light
                      ? IconPainter.refreshWhite
                      : IconPainter.refreshWhite,
                ),
              ),
              const SizedBox(),
              GestureDetector(
                onTap: () {
                  MyApp.themeNotifier.value =
                      MyApp.themeNotifier.value == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light;
                },
                child: Icon(MyApp.themeNotifier.value == ThemeMode.light
                    ? Icons.dark_mode
                    : Icons.light_mode),
              )
            ],
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height * 1,
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: FutureBuilder<CurrentWeather>(
                future: objects,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Stack(children: [CurrentContainer(snapshot: snapshot)])
                      ],
                    );
                  } else {
                    return const Center(child: Text("해당하는 정보를 불러올 수 없어요"));
                  }
                },
              )),
        ));
  }
}

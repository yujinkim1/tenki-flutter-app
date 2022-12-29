import 'package:tenki/providers/coord.dart';
import 'package:tenki/providers/weather.dart';
import 'package:tenki/providers/maintain.dart';
import 'package:tenki/providers/clouds.dart';
import 'package:tenki/providers/sys.dart';
import 'package:tenki/providers/wind.dart';

/*MARK: CURRENTWEATHER DATAS
  1. (Coord)"coord"
  2. (Weather)"weather"
  3. (Maintain)"main"
  4. (String)"base"
  5. (int)"visibility": Not used
  6. (Wind)"wind": Not used
*/
class CurrentWeather {
  Coord? coord;
  List<Weather>? weather;
  Maintain? main;
  String? base;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  CurrentWeather(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  CurrentWeather.fromJson(Map<String, dynamic> json) {
    coord = json['coord'] != null ? new Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(new Weather.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null ? new Maintain.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? new Wind.fromJson(json['wind']) : null;
    clouds =
        json['clouds'] != null ? new Clouds.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? new Sys.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.coord != null) {
      data['coord'] = this.coord;
    }
    if (this.weather != null) {
      data['weather'] = this.weather!.map((v) => v.toJson()).toList();
    }
    data['base'] = this.base;
    if (this.main != null) {
      data['main'] = this.main;
    }
    data['visibility'] = this.visibility;
    if (this.wind != null) {
      data['wind'] = this.wind;
    }
    if (this.clouds != null) {
      data['clouds'] = this.clouds;
    }
    data['dt'] = this.dt;
    if (this.sys != null) {
      data['sys'] = this.sys;
    }
    data['timezone'] = this.timezone;
    data['id'] = this.id;
    data['name'] = this.name;
    data['cod'] = this.cod;
    return data;
  }
}

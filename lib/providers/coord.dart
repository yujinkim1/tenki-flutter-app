/*MARK: WHERE I AM
  1. (double)"latitude"
  2. (double)"longitude"
*/
class Coord {
  double? lat;
  double? lon;

  Coord({this.lat, this.lon});

  Coord.fromJson(Map<String, dynamic> json) {
    lat = json["lat"];
    lon = json["lon"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["lat"] = lat;
    data["lon"] = lon;
    return data;
  }
}

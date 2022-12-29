/*MARK: THE MAIN CONTENTS
    1. (double)"temp"
    2. (double)"feels_like"
    3. (double)"temp_min"
    4. (double)"temp_max"
    5. (int)"pressure"
    6. (int)"humidity"
*/
class Maintain {
  double? temp;
  double? feels_like;
  double? temp_min;
  double? temp_max;
  int? pressure;
  int? humidity;

  Maintain(
      {this.temp,
      this.feels_like,
      this.temp_min,
      this.temp_max,
      this.pressure,
      this.humidity});

  Maintain.fromJson(Map<String, dynamic> json) {
    temp = json["temp"];
    feels_like = json["feels_like"];
    temp_min = json["temp_min"];
    temp_max = json["temp_max"];
    pressure = json["pressure"];
    humidity = json["humidity"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["temp"] = temp;
    data["feels_like"] = feels_like;
    data["temp_min"] = temp_min;
    data["temp_max"] = temp_max;
    data["pressure"] = pressure;
    data["humidity"] = humidity;
    return data;
  }
}

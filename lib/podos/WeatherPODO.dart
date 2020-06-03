class Weather {
  Main main;
  Clouds clouds;
  String name;
  Sys sys;

  Weather({
    this.main,
    this.clouds,
    this.name,
    this.sys,
  });

  factory Weather.fromJson(dynamic json) {
    return Weather(
        main: Main.fromJson(json["main"]),
        clouds: Clouds.fromJson(json["clouds"]),
        name: json["name"],
        sys: Sys.fromJson(json["sys"]));
  }
}

class Main {
  double temp;
  double feelsLike;

  Main({this.temp, this.feelsLike});

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json["temp"],
      feelsLike: json["feelsLike"],
    );
  }
}

class Clouds {
  int all;

  Clouds({
    this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(all: json["all"]);
  }
}

class Sys {
  String country;

  Sys({this.country});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(country: json["country"]);
  }
}

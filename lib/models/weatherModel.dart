class WeatherModel {
  var city;
  var country = '';
  var date = '';
  var temperature = '';

  WeatherModel(String city, String country, String date, String temperature) {
    this.city = city;
    this.country = country;
    this.date = date;
    this.temperature = temperature;
  }
}

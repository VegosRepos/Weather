class HistoryModel {
  var dateOfSearch;
  var location;
  var temperature;

  HistoryModel(String dateOfSearch, String location, String temperature) {
    this.dateOfSearch = dateOfSearch;
    this.location = location;
    this.temperature = temperature;
  }
}

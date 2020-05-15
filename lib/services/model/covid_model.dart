class CovidModel {
  int cases;
  int deaths;
  int recovered;

  CovidModel({this.cases, this.deaths, this.recovered});

  CovidModel.fromJson(Map<String, dynamic> json) {
    cases = json['cases'];
    deaths = json['deaths'];
    recovered = json['recovered'];
  }
}
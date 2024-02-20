class StateModel {
  final String IDnation;
  final String nation;
  final String year;
  final int population;

  StateModel({
    required this.IDnation,
    required this.nation,
    required this.population,
    required this.year,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      IDnation: json["ID Nation"] as String? ?? "",
      nation: json["Nation"] as String? ?? "",
      year: json["Year"] as String? ?? "",
      population: json["Population"] as int? ?? 0,
    );
  }
}

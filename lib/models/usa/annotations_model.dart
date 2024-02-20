class AnnotationsModel {
  final String sourceName;
  final String sourceDescription;
  final String datasetName;
  final String datasetLink;
  final String tableId;
  final String topic;
  final String subtopic;

  AnnotationsModel({
    required this.datasetLink,
    required this.datasetName,
    required this.sourceDescription,
    required this.sourceName,
    required this.subtopic,
    required this.tableId,
    required this.topic,
  });

  factory AnnotationsModel.fromJson(Map<String, dynamic> json) {
    return AnnotationsModel(
      sourceName: json["source_name"] as String? ?? "",
      sourceDescription: json["source_description"] as String? ?? "",
      datasetName: json["dataset_name"] as String? ?? "",
      datasetLink: json["dataset_link"] as String? ?? "",
      tableId: json["table_id"] as String? ?? "",
      topic: json["topic"] as String? ?? "",
      subtopic: json["subtopic"] as String? ?? "",
    );
  }
}

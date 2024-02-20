import 'package:flutter_nt_ten/models/usa/annotations_model.dart';

class SourceModel {
  final List<String> measures;
  final AnnotationsModel annotationsModel;
  final String name;

  SourceModel({
    required this.annotationsModel,
    required this.name,
    required this.measures,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      measures:
          (json["measures"] as List?)?.map((e) => e.toString()).toList() ?? [],
      annotationsModel: AnnotationsModel.fromJson(
          json["annotations"] as Map<String, dynamic>),
      name: json["name"] as String? ?? "",
    );
  }
}

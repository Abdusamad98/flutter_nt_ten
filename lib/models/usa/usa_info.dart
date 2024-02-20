import 'package:flutter_nt_ten/models/usa/source_model.dart';
import 'package:flutter_nt_ten/models/usa/state_model.dart';

class USAInfo {
  final List<StateModel> data;
  final List<SourceModel> sources;

  USAInfo({
    required this.sources,
    required this.data,
  });

  factory USAInfo.fromJson(Map<String, dynamic> json) {
    return USAInfo(
      data: (json["data"] as List?)
              ?.map((e) => StateModel.fromJson(e))
              .toList() ??
          [],
      sources: (json["source"] as List?)
              ?.map((e) => SourceModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}

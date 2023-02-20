class Measure {
  Measure({
    required this.uri,
    required this.label,
    required this.weight,
  });

  String uri;
  String label;
  num weight;

  factory Measure.fromJson(Map<String, dynamic> json) => Measure(
        uri: json["uri"] ?? '',
        label: json["label"] ?? '',
        weight: json["weight"]?.toDouble(),
      );
}

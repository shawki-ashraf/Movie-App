class MoviesModel {
  final String name;
  final double rate;
  final String imageUrl;
  final String dec;
  final String url;
  final String type;
  final String year;

  MoviesModel({
    required this.name,
    required this.rate,
    required this.imageUrl,
    required this.dec,
    required this.url,
    required this.type,
    required this.year,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      name: json['name'],
      rate: (json['rate'] as num).toDouble(), // أمان أكتر
      url: json['URL'],
      imageUrl: json['imageURL'],
      dec: json['dec'],
      type: json['type'],
      year: json['year'],
    );
  }

  /// Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'rate': rate,
      'URL': url,
      'imageURL': imageUrl,
      'dec': dec,
      'type': type,
      'year': year,
    };
  }
}

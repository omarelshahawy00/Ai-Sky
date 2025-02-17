class Location {
  final String name;
  final String region;
  final String country;
  

  Location({
    required this.name,
    required this.region,
    required this.country,
    
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json['name'],
        region: json['region'],
        country: json['country'],
        
      );
}

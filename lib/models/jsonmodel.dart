class Medicine {
  final String name;
  final String dose;
  final String strength;
  Medicine({required this.name, required this.dose, required this.strength});
  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      name: json['name'],
      dose: json['dose'],
      strength: json['strength'],
    );
  }
}

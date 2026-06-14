class VacancyState {
  final String name;
  final String pay;
  final String city;

  VacancyState({
    required this.name,
    required this.pay,
    required this.city,
  });

  VacancyState copyWith({
    String? name,
    String? pay,
    String? city,
  }) {
    return VacancyState(
      name: name ?? this.name,
      pay: pay ?? this.pay,
      city: city ?? this.city,
    );
  }
}

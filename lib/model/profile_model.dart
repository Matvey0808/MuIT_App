class Profile {
  final String name;
  final double appBarOpacity;

  Profile({required this.name, required this.appBarOpacity});

  Profile copyWith({
    String? name,
    double? appBarOpacity
  }) {
    return Profile(
      name: name ?? this.name,
      appBarOpacity: appBarOpacity ?? this.appBarOpacity
    );
  }
}
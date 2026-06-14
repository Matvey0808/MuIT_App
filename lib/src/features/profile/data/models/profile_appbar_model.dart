class ProfileAppBar {
  final String name;
  final double appBarOpacity;

  ProfileAppBar({required this.name, required this.appBarOpacity});

  ProfileAppBar copyWith({String? name, double? appBarOpacity}) {
    return ProfileAppBar(
      name: name ?? this.name,
      appBarOpacity: appBarOpacity ?? this.appBarOpacity,
    );
  }
}

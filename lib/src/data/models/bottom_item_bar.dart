class BottomBarItem {
  final String icon, label;
  final int badgeCount;
  BottomBarItem({
    required this.icon,
    required this.label,
    this.badgeCount = 0,
  });

  BottomBarItem copyWith({String? icon, String? label, int? badgeCount}) {
    return BottomBarItem(
      icon: icon ?? this.icon,
      label: label ?? this.label,
      badgeCount: badgeCount ?? this.badgeCount,
    );
  }
}

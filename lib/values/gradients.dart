part of 'values.dart';

class AppGradients {
  static const LinearGradient primary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFF5C242), Color(0xFFE6A711)],
  );

  static const LinearGradient heroText = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFFFFE08A), Color(0xFFF5C242), Color(0xFFE6A711)],
  );

  static const LinearGradient heroAvatar = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFF5C242), Color(0xFFE6A711)],
  );

  static const LinearGradient avatarRing = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.accentTea, AppColors.accentRose],
  );

  static const LinearGradient glassLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xCCFFFFFF), Color(0x99FFFFFF)],
  );

  static const LinearGradient glassDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF141419), Color(0xFF0F0F12)],
  );

  static const LinearGradient statsCard = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1B160E), Color(0xFF09090B)],
  );

  static const LinearGradient subtleGlow = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0x22F5C242), Color(0x0009090B)],
  );

  static const LinearGradient projectPlaceholder = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF2A2112), Color(0xFF17120A)],
  );
}

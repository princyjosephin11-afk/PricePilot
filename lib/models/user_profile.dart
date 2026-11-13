class UserProfile {
  final String id;
  final String fullName;
  final String email;
  final String? avatarUrl;
  final String preferredCurrency;
  final bool enableNotifications;
  final bool enablePriceDropAlerts;
  final bool enableDarkMode;

  const UserProfile({
    required this.id,
    required this.fullName,
    required this.email,
    this.avatarUrl,
    this.preferredCurrency = '₹',
    this.enableNotifications = true,
    this.enablePriceDropAlerts = true,
    this.enableDarkMode = false,
  });

  UserProfile copyWith({
    String? fullName,
    String? email,
    String? avatarUrl,
    String? preferredCurrency,
    bool? enableNotifications,
    bool? enablePriceDropAlerts,
    bool? enableDarkMode,
  }) {
    return UserProfile(
      id: id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      preferredCurrency: preferredCurrency ?? this.preferredCurrency,
      enableNotifications:
          enableNotifications ?? this.enableNotifications,
      enablePriceDropAlerts:
          enablePriceDropAlerts ?? this.enablePriceDropAlerts,
      enableDarkMode: enableDarkMode ?? this.enableDarkMode,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'fullName': fullName,
    'email': email,
    'avatarUrl': avatarUrl,
    'preferredCurrency': preferredCurrency,
    'enableNotifications': enableNotifications,
    'enablePriceDropAlerts': enablePriceDropAlerts,
    'enableDarkMode': enableDarkMode,
  };

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    id: json['id'] as String,
    fullName: json['fullName'] as String,
    email: json['email'] as String,
    avatarUrl: json['avatarUrl'] as String?,
    preferredCurrency: json['preferredCurrency'] as String? ?? '₹',
    enableNotifications: json['enableNotifications'] as bool? ?? true,
    enablePriceDropAlerts: json['enablePriceDropAlerts'] as bool? ?? true,
    enableDarkMode: json['enableDarkMode'] as bool? ?? false,
  );
}

enum Flavor { dev, prod }

class AppConfig {
  final Flavor flavor;
  final String title;
  final String apiUrl;
  final bool enableLogs;
  final bool showDevBanner;

  const AppConfig({
    required this.flavor,
    required this.title,
    required this.apiUrl,
    required this.enableLogs,
    required this.showDevBanner,
  });

  static late AppConfig instance;

  static bool get isDev => instance.flavor == Flavor.dev;
  static bool get isProd => instance.flavor == Flavor.prod;
}

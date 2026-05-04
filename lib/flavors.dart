enum Flavor { dev, prod }

class F {
  final Flavor flavor;
  final String appName;

  F({required this.flavor, required this.appName});

  static late F instance;

  static bool get isDev => instance.flavor == Flavor.dev;
  static bool get isProd => instance.flavor == Flavor.prod;
}

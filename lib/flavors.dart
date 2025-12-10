enum Flavor {
  prod,
  preprod,
  stage,
  dev,
}

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.prod:
        return 'Health Sync';
      case Flavor.preprod:
        return 'Health Sync Preprod';
      case Flavor.stage:
        return 'Health Sync Stage';
      case Flavor.dev:
        return 'Health Sync Dev';
    }
  }

}

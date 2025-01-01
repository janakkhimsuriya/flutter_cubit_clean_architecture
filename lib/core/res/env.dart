import 'package:package_info_plus/package_info_plus.dart';

enum Flavour {
  dev('dev'),
  uat('uat'),
  prod('prod');

  const Flavour(this.value);

  final String value;
}

// env keys
const ekEnv = 'env';
const ekBaseUrl = 'base_url';

// env variables
const String env = String.fromEnvironment(ekEnv);

bool get dev => env == Flavour.dev.value;

bool get uat => env == Flavour.uat.value;

bool get prod => env == Flavour.prod.value;

Flavour get flavour {
  return Flavour.values.firstWhere((e) => e.value == env);
}

Future<String> get buildNumber async {
  final packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.buildNumber;
}

Future<String> get version async {
  final packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;
}

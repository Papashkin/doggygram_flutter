import 'package:package_info_plus/package_info_plus.dart';

class AppVersionService {
  Future<String?> getAppVersion() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      return "v${packageInfo.version} (${packageInfo.buildNumber})";
    } catch (e) {
      return null;
    }
  }
}

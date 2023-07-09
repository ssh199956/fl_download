
import 'fl_download_platform_interface.dart';

class FlDownload {
  Future<String?> getPlatformVersion() {
    return FlDownloadPlatform.instance.getPlatformVersion();
  }
}

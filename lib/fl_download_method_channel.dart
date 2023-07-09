import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'fl_download_platform_interface.dart';

/// An implementation of [FlDownloadPlatform] that uses method channels.
class MethodChannelFlDownload extends FlDownloadPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('fl_download');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

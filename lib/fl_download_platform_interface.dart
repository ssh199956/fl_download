import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'fl_download_method_channel.dart';

abstract class FlDownloadPlatform extends PlatformInterface {
  /// Constructs a FlDownloadPlatform.
  FlDownloadPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlDownloadPlatform _instance = MethodChannelFlDownload();

  /// The default instance of [FlDownloadPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlDownload].
  static FlDownloadPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlDownloadPlatform] when
  /// they register themselves.
  static set instance(FlDownloadPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

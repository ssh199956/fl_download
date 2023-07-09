import 'package:flutter_test/flutter_test.dart';
import 'package:fl_download/fl_download.dart';
import 'package:fl_download/fl_download_platform_interface.dart';
import 'package:fl_download/fl_download_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlDownloadPlatform
    with MockPlatformInterfaceMixin
    implements FlDownloadPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlDownloadPlatform initialPlatform = FlDownloadPlatform.instance;

  test('$MethodChannelFlDownload is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlDownload>());
  });

  test('getPlatformVersion', () async {
    FlDownload flDownloadPlugin = FlDownload();
    MockFlDownloadPlatform fakePlatform = MockFlDownloadPlatform();
    FlDownloadPlatform.instance = fakePlatform;

    expect(await flDownloadPlugin.getPlatformVersion(), '42');
  });
}

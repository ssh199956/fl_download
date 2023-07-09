import 'dart:io';

import 'package:fl_download/download/down_file.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:fl_download/fl_download.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _flDownloadPlugin = FlDownload();

// 获取app临时文件路径
  Future getFilePath(type) async {
    var filepath =
        await getApplicationDocumentsDirectory(); // App内部file:data.com.nufang.zao/file/
    var file = Directory('${filepath.path}/$type');
    try {
      bool exists = await file.exists();
      if (!exists) {
        await file.create();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return file.path;
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
    downloadDemo();
  }

  downloadDemo() async {
    String filePath = await getFilePath('download');
    String tempFilePath = '$filePath/${12345678}.mp3';
    DownFile().dowmInfo(
        'https://downsc.chinaz.net/files/download/sound1/201305/3055.mp3',
        tempFilePath, () async {
      if (kDebugMode) {
        print(("ok"));
      }
    });
    DownFile().dowmInfo("", filePath, () {
      if (kDebugMode) {
        print("download success");
      }
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _flDownloadPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}

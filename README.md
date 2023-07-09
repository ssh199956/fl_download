<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# fl_kdxf_sst_rt

As shown in the figure below:

Welcome to my personal website：<https://www.sshlearning.cn>

Welcome to my github and invite you to build more：<https://github.com/ssh199956>

Welcome to my personal blog：<https://blog.sshlearning.cn>

Welcome to follow my document content：<https://data.sshlearning.cn>

Welcome to the static e-commerce website made during my study：<https://shenfeng.sshlearning.cn>

## Getting started

A Flutter plugin that implemented a file download library based on Dio download, simple, convenient,
and fast, ready to use out of the box, suitable for Android, iOS and other platforms.

## Usage

```dart
//how to use
void download() {
  DownFile().dowmInfo(
      'https://downsc.chinaz.net/files/download/sound1/201305/3055.mp3',
      tempFilePath, () async {
    if (kDebugMode) {
      print(("ok"));
    }
  });
}
```

```dart
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


```
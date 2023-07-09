import 'dart:convert';
import 'dart:io';
import 'package:fl_download/download/progress/implementations/progress_implement.dart';
import 'package:flutter/cupertino.dart';
import 'down_util.dart';
import 'dart:async';

import 'downloadFlow.dart';

class DownFile {
  Future<void> dowmInfo(String url, String filePath, VoidCallback onDone,
      {VoidCallback? error}) async {
    try {
      DownloadFlow.download(
          url,
          DownloaderUtils(
            progressCallback: (current, url) {
              print("------------下载完成---${url}--------------");
            },
            file: File(filePath),
            progress: ProgressImplementation(),
            onDone: () {
              onDone();
            },
            error: () {
              error?.call();
            },
            deleteOnCancel: true,
          ));
    } catch (msg) {
      error?.call();
      print(msg);
    }
  }
}

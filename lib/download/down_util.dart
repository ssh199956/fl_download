import 'dart:io';

import 'package:dio/dio.dart' hide ProgressCallback;
import 'package:fl_download/download/progress/interfaces/progress_interface.dart';
import 'package:flutter/material.dart';

import 'downloadFlow.dart';

/// Required for the initialization of [downloadFlow]
class DownloaderUtils {
  /// Notification Progress Channel Inteface
  /// Please use [ProgressImplementation] when called
  final ProgressInterface progress;

  /// Dio Client for HTTP Request
  Dio? client;

  /// Setup a location to store the downloaded file
  File file;

  /// should delete when cancel?
  bool deleteOnCancel;

  /// Function to be called when the download has finished.
  final VoidCallback onDone;

  final VoidCallback error;

  /// Function with the current values of the download
  /// ```dart
  /// Function(int bytes, int total) => print('current byte: $bytes and total of bytes: $total');
  /// ```
  final ProgressCallback progressCallback;

  DownloaderUtils({
    required this.progress,
    this.client,
    required this.file,
    this.deleteOnCancel = false,
    required this.onDone,
    required this.progressCallback,
    required this.error,
  });
}

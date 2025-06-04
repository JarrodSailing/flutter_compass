import 'dart:async';
import 'package:flutter/services.dart';

class FlutterCompass {
  static const EventChannel _compassChannel = EventChannel('flutter_compass/events');

  static Stream<double>? _headingStream;

  static Stream<double> get events {
    _headingStream ??= _compassChannel.receiveBroadcastStream().map(
      (dynamic event) => (event as double),
    );
    return _headingStream!;
  }
}
import 'dart:async';
import 'package:flutter/services.dart';

class SocialShare {
  static const MethodChannel _channel = MethodChannel('social_share');

  static Future<String?> shareInstagramStory(
    String imagePath, {
    String? backgroundTopColor,
    String? backgroundBottomColor,
    String? attributionURL,
  }) async {
    final Map<String, dynamic> args = {
      'imagePath': imagePath,
      'backgroundTopColor': backgroundTopColor,
      'backgroundBottomColor': backgroundBottomColor,
      'attributionURL': attributionURL,
    };

    return _channel.invokeMethod('shareInstagramStory', args);
  }
}
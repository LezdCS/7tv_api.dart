library api_7tv;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class SeventvApi {
  static Future<List?> getGlobalEmotes() async {
    Response response;
    var dio = Dio();
    try {
      response = await dio.get(
        'https://7tv.io/v3/emote-sets/global',
      );

      if (response.data['emotes'] != null) {
        return response.data['emotes'];
      } else {
        return null;
      }
    } on DioException catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<List?> getChannelEmotes(String broadcasterId) async {
    Response response;
    var dio = Dio();
    try {
      response = await dio.get(
        'https://7tv.io/v3/users/twitch/$broadcasterId',
      );
      dynamic emoteSet = response.data['emote_set'];
      if (emoteSet != null && emoteSet['emotes'] != null) {
        return emoteSet['emotes'];
      } else {
        return null;
      }
    } on DioException catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<List?> getKickChannelEmotes(String broadcasterId) async {
    Response response;
    var dio = Dio();
    try {
      response = await dio.get(
        'https://7tv.io/v3/users/kick/$broadcasterId',
      );
      dynamic emoteSet = response.data['emote_set'];
      if (emoteSet != null && emoteSet['emotes'] != null) {
        return emoteSet['emotes'];
      } else {
        return null;
      }
    } on DioException catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}

import 'package:api_7tv/api_7tv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  test('Get global emotes', () async {
    List? globalEmotes = await SeventvApi.getGlobalEmotes();
    debugPrint(globalEmotes.toString());
  });

  test('Get Twitch emotes', () async {
    List? twitchEmotes = await SeventvApi.getChannelEmotes('');
    debugPrint(twitchEmotes.toString());
  });

  test('Get Kick emotes', () async {
    List? kickEmotes = await SeventvApi.getKickChannelEmotes('');
    debugPrint(kickEmotes.toString());
  });
}

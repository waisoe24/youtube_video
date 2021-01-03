import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:youtube_app/models/channel_info.dart';
import 'package:youtube_app/utils/constants.dart';

class Services{

  static const CHANNEL_ID = 'UC5lbdURzjB0irr-FTbjWN1A';
  static const _baseUrl = 'youtube.googleapis.com';


static Future<ChannelInfo> getChannelInfo() async {
  Map<String, String> parameters = {
    'part': 'snippet,contentDetails,statistics',
    'id': CHANNEL_ID,
    'key': Constants.API_KEY,
  };

  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  Uri uri = Uri.http(
      _baseUrl,
    'youtube/v3/channels',
    parameters
  );

  Response response = await http.get(uri, headers: headers);
  print(response.body);
  ChannelInfo channelInfo = channelInfoFromJson(response.body);
  return channelInfo;
}
}


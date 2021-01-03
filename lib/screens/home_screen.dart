import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_app/models/channel_info.dart';
import 'package:youtube_app/utils/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ChannelInfo _channelInfo;
  Item _item;
  bool _loading;


  @override
  void initState() {
    super.initState();
    _loading = true;
    _getChannelInfo();
  }

  _getChannelInfo() async {
    _channelInfo = await Services.getChannelInfo();
    _item = _channelInfo.items[0];
    setState(() {
      _loading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('You Tube',),
      ),
      body: Container(
          color: Colors.white,
          child: Column(
            children: [
              _buildInfoView()
            ],
          )

      ),
    );
  }

  _buildInfoView() {
    return _loading
        ? CircularProgressIndicator()
        : Container(
      child: Card(
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  _item.snippet.thumbnails.medium.url
              ),
            ),
            SizedBox(width: 20,),
            Expanded(child:
            Text(
              _item.snippet.title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400
              ),
            ),
            ),
            Text(_item.statistics.videoCount,),
            SizedBox(width: 20,),
          ],
        ),
      ),
    );
  }
}
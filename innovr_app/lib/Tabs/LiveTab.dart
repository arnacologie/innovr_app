import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LiveTab extends StatefulWidget {
  const LiveTab(this._controller);

  final VideoPlayerController _controller;

  @override
  _LiveTabState createState() => _LiveTabState();
}

class _LiveTabState extends State<LiveTab> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RotatedBox(
        quarterTurns: 1,
        child: widget._controller.value.initialized
            ? AspectRatio(
          aspectRatio: widget._controller.value.aspectRatio,
          child: VideoPlayer(widget._controller),
        )
            : Container(),
      ),
    );

  }
}

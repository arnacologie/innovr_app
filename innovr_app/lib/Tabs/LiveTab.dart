import 'package:flutter/material.dart';
import 'package:innovr_app/Pages/MainPage.dart';
import 'package:custom_chewie/custom_chewie.dart';
import 'package:video_player/video_player.dart';

class LiveTab extends StatefulWidget {
  @override
  _LiveTabState createState() => _LiveTabState();
}

class _LiveTabState extends State<LiveTab> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network("https://r4---sn-25ge7nsd.googlevideo.com/videoplayback?sparams=dur,ei,expire,id,ip,ipbits,ipbypass,itag,lmt,mime,mip,mm,mn,ms,mv,pl,ratebypass,requiressl,source&requiressl=yes&mime=video%2Fmp4&itag=22&lmt=1545030648975252&key=cms1&dur=812.257&txp=5432432&id=o-AG8Kig9NpgnPhmCn117-Oo2T9CLa1CkjKDKy_jTZUemY&ei=MWFYXNCDL4GMgwOD5IbABw&pl=17&fvip=4&signature=5028D7BAB5015E9F0F5D3B6C3669B9A5BA174250.15CD6918EBDCCFEBE4B6FD93DEB6F5B8F75E0B06&expire=1549317522&ipbits=0&ratebypass=yes&ip=54.156.93.104&source=youtube&redirect_counter=1&rm=sn-vgqe7d7d&req_id=73278bb13d22a3ee&cms_redirect=yes&ipbypass=yes&mip=90.22.192.56&mm=31&mn=sn-25ge7nsd&ms=au&mt=1549295780&mv=m")
      ..initialize().then((_){
        setState(() {});
      });
    print('ACTIVATED : ${MainPageState.isVRActivated}');
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: _controller.value.initialized
        ? Chewie(
          _controller,
          aspectRatio: 3/2,
        )
      : Center(child: CircularProgressIndicator()),);

  }
}

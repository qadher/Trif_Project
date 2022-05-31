import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_parser/youtube_parser.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:developer';

class PLayerScreen extends StatelessWidget {
  final String url;
  PLayerScreen({Key? key, required this.url}) : super(key: key);
String prefix = 'https://www.youtube.com/watch?v=/';

  @override
  Widget build(BuildContext context) {
    String link = url.split('/').toList().last;
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: link,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        enableCaption: true,

        // mute: true,
      ),
    );
    // MetaDataModel metaData =  YoutubeMetaData.getData('https://www.youtube.com/watch?v=CBWlfU_na-2');
    return Scaffold(
      backgroundColor: Colors.black,
//       body: YoutubePlayer(
//     controller: _controller,
//     showVideoProgressIndicator: true,
//     // videoProgressIndicatorColor: Colors.amber,
//     // progressColors: ProgressColors(
//     //     playedColor: Colors.amber,
//     //     handleColor: Colors.amberAccent,
//     // ),
//     // onReady () {
//     //     _controller.addListener(listener);
//     // },
// ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          controlsTimeOut: const Duration(seconds: 10),
        ),
        builder: (context, player) {
          // print('object+++++++++======${videoData.title}');
          print('++++++++++=========${_controller.metadata.title}');
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   'videoData.title.toString()',
              //   style: TextStyle(color: Colors.white),
              // ),
              // some widgets
              player,
              //some other widgets
            ],
          );
        },
      ),
    );
  }
}

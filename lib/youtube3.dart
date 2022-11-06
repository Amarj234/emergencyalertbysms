import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class youtube3 extends StatelessWidget {
  youtube3({Key? key}) : super(key: key);


  YoutubePlayerController _controller= YoutubePlayerController(
    initialVideoId: "pjmDY3tR6ak",

  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: YoutubePlayer(
        controller: _controller,
        liveUIColor: Colors.amber,
      ),
    );
  }
}

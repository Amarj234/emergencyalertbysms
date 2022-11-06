import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class youtube1 extends StatelessWidget {
  youtube1({Key? key}) : super(key: key);


  YoutubePlayerController _controller= YoutubePlayerController(
    initialVideoId: "ivunTTyNjXc",

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

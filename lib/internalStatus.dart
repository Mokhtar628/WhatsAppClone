

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';


List<StoryItem> stories = [
  StoryItem.text(
      "Welcome to WhatsApp clone❤",
      Colors.pinkAccent,
      fontSize: 25
  ),
  StoryItem.pageImage(
    CachedNetworkImageProvider(
        "https://scontent-hbe1-1.xx.fbcdn.net/v/t1.6435-9/163010754_3606141019508337_7974185491782472289_n.jpg?_nc_cat=106&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=NYyK6I12cakAX9EDw8b&_nc_ht=scontent-hbe1-1.xx&oh=50519b117f6b16ecec2c64a6508038ca&oe=60952916"),
    caption: "“Be yourself, everyone else is already taken.” Oscar Wilde",
  )

];

class internalStatus extends StatefulWidget {
  @override
  _internalStatusState createState() => _internalStatusState();
}

class _internalStatusState extends State<internalStatus> {

  @override
  void initState() {
    super.initState();
      setState(() {
      });
  }

  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: StoryView(
        [

          for (StoryItem i in stories)
            i



        ],
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          print("Completed a cycle");
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: storyController,

      ),
    );
  }
}

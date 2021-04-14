

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';


List<StoryItem> Allstories = [
  StoryItem.text(
      "“If you set your goals ridiculously high and it's a failure, you will fail above everyone else's success.” -James Cameron",
      Colors.deepOrange,
      fontSize: 25,
  ),
  StoryItem.pageImage(
    CachedNetworkImageProvider(
      "https://cf.bstatic.com/images/hotel/max1024x768/241/241074099.jpg"
    ),
  caption: "Awsowme view❤👌",
  )

];

class internalAllStatus extends StatefulWidget {
  @override
  _internalAllStatusState createState() => _internalAllStatusState();
}

class _internalAllStatusState extends State<internalAllStatus> {

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

          for (StoryItem i in Allstories)
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

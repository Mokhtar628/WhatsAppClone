import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'internalStatus.dart';
import 'package:story_view/story_view.dart';
var storyText =  TextEditingController();
class addStory extends StatefulWidget {
  @override
  _addStoryState createState() => _addStoryState();
}


class _addStoryState extends State<addStory> {
  var storyColor = [Colors.red, Colors.green, Colors.yellow,Colors.purple,Colors.orange,Colors.brown,Colors.cyan,Colors.teal,Colors.blue,Colors.lime];
  Random random = new Random();


  int index = 0;

  void changeIndex() {
    setState(() => index = random.nextInt(10));
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        // extendBodyBehindAppBar: true,
        //resizeToAvoidBottomPadding: false,
        extendBody: true,
        body: Container(
            color: storyColor[index],
          height: double.infinity,
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    // height: 50,
                    // margin: const EdgeInsets.only(left: 5,right: 5),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLengthEnforced: false,
                      maxLines: null,
                      controller: storyText,
                      onChanged: (value){
                        setState(() {
                          if(storyText.text == ""){
                          }
                          else{

                          }
                        });
                      },
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.all(15.0),
                          hintStyle: TextStyle(
                              color: Color(0x30000000),
                              fontSize: 55,
                          ),
                          hintText: 'Type a status'
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        bottomNavigationBar: Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: BottomAppBar(
            color: Color(0x00000000),
            child: Container(
              margin: const EdgeInsets.fromLTRB(5, 0, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(icon: Icon(Icons.emoji_emotions,color: Colors.white,size: 27,), onPressed: (){}),
                      IconButton(icon: Icon(Icons.text_fields,color: Colors.white,size: 27,), onPressed: (){}),
                      IconButton(icon: Icon(Icons.color_lens,color: Colors.white,size: 27,), onPressed: (){
                        changeIndex();
                      }),
                    ],
                  ),

                  sendStatus(storyText.text,storyColor[index]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget sendStatus(String text, MaterialColor storyColor) {
    if(text==""){
      return Row();
    }
    else{
      return Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
        child: RaisedButton(
          onPressed: () {
            stories.add(
              StoryItem.text(
                  text,
                  storyColor,
                  fontSize: 25
              ),
            );
            storyText.text="";
          },
          elevation: 2.0,
          color: Color.fromRGBO(0, 176, 157, 1),
          child: Icon(
            Icons.send,
            size: 20,
            color: Colors.white,
          ),
          padding: EdgeInsets.only(right:0),
          shape: CircleBorder(),
        ),
      );
    }
  }
}

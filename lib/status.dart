import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/addStory.dart';
import 'package:whatsapp/colors.dart';
import 'camera.dart';
import 'internalStatus.dart';
import 'internalAllStatus.dart';
class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  Query _ref;
  @override
  void initState() {
    //retrieve();
    super.initState();
    _ref=FirebaseDatabase.instance.reference().child("chats");//.orderByChild("time")

  }
  Widget allStatusContainer({Map story}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => internalAllStatus()));
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(17, 10, 10,0),
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: floatingColor,width: 1.5),
              ),
              child: CircleAvatar(
                radius: 28.0,
                backgroundImage: AssetImage(story['image']),
                backgroundColor: Colors.transparent,
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: descriptionColor,width: 0.18)
                  ),
                ),
                //width:MediaQuery.of(context).size.width*0.7,
                height: 60,
                margin: const EdgeInsets.only(left: 15, top: 6),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              //margin: const EdgeInsets.fromLTRB(0,0, 0, 0),
                              child: Text(
                                story['name'],
                                style: TextStyle(
                                    color: white, fontSize: 20),
                              ),
                            )
                          ],
                        ),

                        Row(
                          children: [
                            Container(
                              child: Text(
                                "today, "+story['time'],
                                style: TextStyle(
                                    color: descriptionColor, fontSize: 15),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget myStatusContainer(){
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => internalStatus()));
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(17, 10, 10,20),
        width: double.infinity,
        height: 90,
        decoration: BoxDecoration(
            color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: floatingColor,width: 1.5),
              ),
              child: CircleAvatar(
                radius: 28.0,
                  backgroundImage: AssetImage("img/4.jpg"),
                  backgroundColor: Colors.transparent,
                ),
            ),
            Expanded(
              child: Container(
                //width:MediaQuery.of(context).size.width*0.7,
                height: 60,
                margin: const EdgeInsets.only(left: 15, top: 6),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0,0, 40, 0),
                              child: Text(
                                "My status ",
                                style: TextStyle(
                                    color: white, fontSize: 20),
                              ),
                            )
                          ],
                        ),

                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0,5, 0, 0),
                              child: Text(
                                "Tap to view your status   ",
                                style: TextStyle(
                                    color: descriptionColor, fontSize: 12),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              color: backColor,
              child: Column(
                children: [
                  myStatusContainer(),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Viewed updates",
                      style: TextStyle(
                          color: descriptionColor,
                        fontSize: 15
                      ),
                    ),
                  ),
                  Expanded(
                    child: FirebaseAnimatedList(query: _ref,itemBuilder: (BuildContext context ,DataSnapshot snapshot,Animation<double>animation,int index){
                      Map story = snapshot.value;
                      return allStatusContainer(story: story);
                    }),
                  ),
                ],
              ),
            ),
            floatingActionButton: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 45.0,
                    width: 45.0,
                    margin: const EdgeInsets.fromLTRB(0,0,5,10),
                    child: FittedBox(
                      child: FloatingActionButton(
                        backgroundColor: secandFloat,
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => addStory()));
                        },
                        child: Image.asset('img/pencil.png',width: 30,height: 30,color: secondFloatIcon,),
                      ),
                    ),
                  ),
                  Container(
                    height: 55.0,
                    width: 55.0,
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: FittedBox(
                      child: FloatingActionButton(
                        backgroundColor: floatingColor,
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CameraPage()));
                        },
                        child: Icon(Icons.camera_alt,color: Colors.white,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        )
    );
  }
}

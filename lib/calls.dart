import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';

import 'internalContactsCall.dart';

class Calls extends StatefulWidget {
  @override
  _CallsState createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  Query _ref;
  @override
  void initState() {
    //retrieve();
    super.initState();
    _ref=FirebaseDatabase.instance.reference().child("calls").orderByChild("desc");//.orderByChild("time")

  }
  Widget allCallsContainer({Map call}) {
    return InkWell(
      onTap: () {
        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => internalAllStatus()));
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
              ),
              child: CircleAvatar(
                radius: 28.0,
                backgroundImage: AssetImage(call['image']),
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
                                call['name'],
                                style: TextStyle(
                                    color: white, fontSize: 20),
                              ),
                            )
                          ],
                        ),

                        Row(
                          children: [
                            Container(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Container(
                                        //margin: const EdgeInsets.symmetric(horizontal: 0),
                                        child: Transform.rotate(angle: -0.90,child: Icon(Icons.arrow_forward,color: floatingColor,size: 20,)),
                                      ),
                                    ),
                                    TextSpan(text: " today, "+call['time'],style: TextStyle(color: descriptionColor, fontSize: 15)),
                                  ],
                                ),
                              ),
                              
                              /*Text(
                                "today, "+call['time'],
                                style: TextStyle(
                                    color: descriptionColor, fontSize: 15),
                              ),*/
                            )
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Align(
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: callType(call['type']),
                          ),
                        )
                      ],
                    )
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
              child: FirebaseAnimatedList(query: _ref,itemBuilder: (BuildContext context ,DataSnapshot snapshot,Animation<double>animation,int index){
              Map call = snapshot.value;
              return allCallsContainer(call: call);
            }),
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

                        showDialog(context: context, builder: (_) =>  AlertDialog(
                          backgroundColor: messageHimColor,
                          content: Text('Continue in messenger to create a room.',style: TextStyle(color: inputColor),),
                          actions: [
                            FlatButton(
                              onPressed: () {Navigator.of(context, rootNavigator: true).pop(AlertDialog);},
                              child: Text('CANCEL',style: TextStyle(color: floatingColor,fontSize: 13)),
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text('CONTINUE IN MESSENGER',style: TextStyle(color: floatingColor,fontSize: 13)),
                            ),
                          ],
                        ));
                      },
                      child: Icon(Icons.video_call,color: Colors.white,),
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => internalContactsCall()));
                      },
                      child: Icon(Icons.add_call,color: Colors.white,),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  callType(String call) {
    if(call == "call") {
        return Icon(Icons.call,color: floatingColor,size: 25,);
      }
    else{
      return Icon(Icons.videocam,color: floatingColor,size: 25,);
    }
  }
}

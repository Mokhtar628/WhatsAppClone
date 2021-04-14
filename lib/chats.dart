

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/Contacts.dart';
import 'package:whatsapp/camera.dart';

import 'package:whatsapp/colors.dart';
import 'internalCall.dart';
import 'internalChat.dart';



class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {

  Future<void> _showMyDialog(String name , String img, int chatnum) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 300),
          child: AlertDialog(
            backgroundColor: Colors.transparent,
            content: Container(
              width: 200,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.fromLTRB(10, 8, 0, 0),
                          color: Color(0x50000000),
                          height: 35,
                          width: 232,
                          child: Text(name,style: TextStyle(color: Colors.white,fontSize: 18),)),
                    ],
                  ),
                  Container(
                    color: backColor,
                    margin: const EdgeInsets.only(top: 167),
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(icon: Icon(Icons.chat,color: floatingColor,), onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => internalChat(name,img,chatnum)));
                        }),
                        IconButton(icon: Icon(Icons.call,color: floatingColor,), onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context) => internalCall(name,img,chatnum)));addCall(name,img,"call");}),
                        IconButton(icon: Icon(Icons.videocam,color: floatingColor,), onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context) => internalCall(name,img,chatnum)));addCall(name,img,"video");}),
                        IconButton(icon: Icon(Icons.info_outline,color: floatingColor,), onPressed: () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
            ],
          ),
        );
      },
    );
  }

  Query _ref;
  @override
  void initState() {
    //retrieve();
    super.initState();
    _ref=FirebaseDatabase.instance.reference().child("chats").orderByChild("desc");//.orderByChild("time")

  }
  Widget chatsContainer({Map chats})
  {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => internalChat(chats['name'],chats['image'],chats['chatNumber'])));
        //messagesChecked(chats['chatNumber']);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(10,20, 10, 0),
        width: double.infinity,
        height: 90,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           /* Container(
              //width:MediaQuery.of(context).size.width*0.2,
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(chats['image']),
                    fit: BoxFit.fill
                )
              ),
            ),*/
            InkWell(
              onTap: (){
                _showMyDialog(chats['name'],chats['image'],chats['chatNumber']);
              },
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage(chats['image']),
                backgroundColor: Colors.transparent,
              ),
            ),
           Expanded(
             child: Container(
               //width:MediaQuery.of(context).size.width*0.7,
               height: 60,
               decoration: BoxDecoration(
                 border: Border(bottom: BorderSide(color: descriptionColor,width: 0.2))
               ),
               margin: const EdgeInsets.only(left: 15,top: 8),
               child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(alignment: Alignment.centerLeft,child: Text(chats['name'],style: TextStyle(color: nameColor,fontSize: 18),)),
                          Align(alignment: Alignment.centerRight,child: Text(chats['time'],style: TextStyle(color: descriptionColor,fontSize: 12))),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            checkedWidget(chats['chatNumber'],chats['type'],chats['checked']),
                            Flexible(
                              child: Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  alignment: Alignment.centerLeft,
                                  child: Text(chats['lastMessage'],style: TextStyle(color: descriptionColor),overflow: TextOverflow.ellipsis,)
                              ),
                            ),
                          ],
                        ),
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

  Widget checkedWidget(int chatNumber,String type,int checked){

    if(type=="m"){
      if(checked == 1){/*checked or not*/
        return Image.asset('img/checked.png',width: 17,height: 17,color: checkedColor,);
      }else{
        return Icon(Icons.check,color: descriptionColor,size: 18,);
      }
    }else{
      return Container();
    }

  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Listener(
              onPointerMove: (value){
                if (value.delta.dx > 11) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CameraPage()));

                }
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: backColor,
                child: FirebaseAnimatedList(query: _ref,itemBuilder: (BuildContext context ,DataSnapshot snapshot,Animation<double>animation,int index){
                  Map chats = snapshot.value;
                  return chatsContainer(chats: chats);
                }),
              ),
            ),

          floatingActionButton: Container(
            height: 65.0,
            width: 65.0,
            margin: const EdgeInsets.only(bottom: 10.0),
            child: FittedBox(
              child: FloatingActionButton(
                backgroundColor: floatingColor,
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Contacts()));
                },
                child: Icon(Icons.chat,color: Colors.white,),
              ),
            ),
          ),
        )
    );
  }

  void messagesChecked(int chat) {
    DatabaseReference _ref;
    _ref=FirebaseDatabase.instance.reference().child("internalChat").child("$chat");
    _ref.update({'checked':1});
  }
}

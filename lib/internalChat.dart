import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
//import 'package:keyboard_visibility/keyboard_visibility.dart';
// import 'package:path/path.dart';
import 'package:whatsapp/colors.dart';
import 'package:intl/intl.dart';
import 'package:bubble/bubble.dart';

import 'internalCall.dart';
// import 'package:http/http.dart' as http;
//
// import 'dart:convert';


void addCall(String name, String img, String type) {
  DatabaseReference _ref;
  _ref=FirebaseDatabase.instance.reference().child("calls");
  _ref.push().set({'name':name,'image':img,'type':type,'time':"${DateFormat.jm().format(DateTime.now())}",'desc': 1/double.parse("${DateTime.now().microsecondsSinceEpoch.toStringAsFixed(7)}")});
}

class internalChat extends StatefulWidget {
  final String name;
  final String img;
  final int chatNumber;

  internalChat(this.name,this.img,this.chatNumber);
  
  @override
  _internalChatState createState() => _internalChatState(name,img,chatNumber);
}

class _internalChatState extends State<internalChat> {
  Query _refOfMes;
  var _chatCont;
  @override
  void initState() {
    //retrieve();
    super.initState();
    _refOfMes=FirebaseDatabase.instance.reference().child("internalChat").child("$chatNumber");
    _chatCont=ScrollController();
  }
  Widget mContainer({Map messages})
  {
    if(messages['type']=="h"){//toggle h m
      return Bubble(
        margin: BubbleEdges.only(top: 10,right: 10),
        alignment: Alignment.topRight,
        nip: BubbleNip.rightTop,
        color: messageColorMe,
        child: RichText(
          text: new TextSpan(
            text: messages['message']+"  ",style: new TextStyle(color: nameColor,fontSize: 15),
            // Note: Styles for TextSpans must be explicitly defined.
            // Child text spans will inherit styles from parent

            children: [
              //new TextSpan(text: messages['message'],style: new TextStyle(color: nameColor,fontSize: 15)),
              new TextSpan(text: "${messages['time']}  ", style: new TextStyle(color: descriptionColor,fontSize: 10,)),
              WidgetSpan(
                  child: checkedOrNot(messages['checked']),
              ),
            ],
          ),
        ),
        //Text(messages['time'],style: TextStyle(color: navItemsColor,fontSize: 10),)messages['message'], textAlign: TextAlign.right,style: TextStyle(color: nameColor,fontSize: 15),
      );
    }else{
      return Bubble(
        margin: BubbleEdges.only(top: 10,left: 10),
        alignment: Alignment.topLeft,
        nip: BubbleNip.leftTop,
        color: messageHimColor,
        child: RichText(
          text: new TextSpan(
            text: messages['message']+"  ",style: new TextStyle(color: nameColor,fontSize: 15),
            // Note: Styles for TextSpans must be explicitly defined.
            // Child text spans will inherit styles from parent

            children: [
              //new TextSpan(text: messages['message'],style: new TextStyle(color: nameColor,fontSize: 15)),
              new TextSpan(text: "${messages['time']} ", style: new TextStyle(color: descriptionColor,fontSize: 10,)),

            ],
          ),
        ),
        //Text(messages['time'],style: TextStyle(color: navItemsColor,fontSize: 10),)messages['message'], textAlign: TextAlign.right,style: TextStyle(color: nameColor,fontSize: 15),
      );
    }
  }

  /*
  *
  *  return Bubble(
        margin: BubbleEdges.only(top: 10,left: 10),
        alignment: Alignment.topLeft,
        nip: BubbleNip.leftTop,
        color: navColor,
        child: Text(messages['message'], textAlign: TextAlign.left,style: TextStyle(color: nameColor,fontSize: 15),),
      );*/


  final String name;
  final String img;
  final int chatNumber;
  _internalChatState(this.name,this.img,this.chatNumber);
  var bottomButton =Icons.mic;
  var messageCont = TextEditingController();
  var keyMargin = 70.0;
  Widget suffIcon = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween, // added line
    mainAxisSize: MainAxisSize.min,
    children:[
      Transform.rotate(angle: -0.60,child: IconButton(icon: Icon(Icons.attach_file,color: Color.fromRGBO(168, 173, 167,1),), onPressed: null)),
      IconButton(icon: Icon(Icons.camera_alt,color: Color.fromRGBO(168, 173, 167,1),), onPressed: null),
    ],
  );
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 1),
          () => _chatCont.jumpTo(_chatCont.position.maxScrollExtent),
    );

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          // extendBodyBehindAppBar: true,
          //resizeToAvoidBottomPadding: false,
          extendBody: true,
          appBar: AppBar(
            brightness: Brightness.dark,
            leading: IconButton(icon: Icon(Icons.arrow_back,color: navItemsColor), onPressed: (){ Navigator.of(context).pop();}),
            backgroundColor: navColor,
            centerTitle: false,
            titleSpacing: 0.0,
            title: Transform(
              transform:  Matrix4.translationValues(-15.0, 0.0, 0.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      radius: 18.0,
                      backgroundImage: AssetImage(img),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  //Text(name,style: TextStyle(color: nameColor,fontSize: 20)),
                  Flexible(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        child :Text(name,style: TextStyle(color: navItemsColor,fontSize: 20),overflow: TextOverflow.ellipsis,),
                        //child: Text(chats['lastMessage'],style: TextStyle(color: navItemsColor),overflow: TextOverflow.ellipsis,)
                    ),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.videocam,color: navItemsColor),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => internalCall(name,img,chatNumber)));
                  addCall(name,img,"video");
                },
              ),
              IconButton(
                icon: Icon(Icons.phone,color: navItemsColor,),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => internalCall(name,img,chatNumber)));
                  addCall(name,img,"call");
                },
              ),
              PopupMenuButton<String>(
                color: menuColor,
                icon: Icon(Icons.more_vert,color: navItemsColor,),
                onSelected: (value){
                },
                itemBuilder: (BuildContext context) {
                  return {'View Contact', 'Media, links, and docs', 'Search','Mute notification','Wallpaper','More'}.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice,style: TextStyle(color: nameColor),),
                    );
                  }).toList();
                },
              ),
            ],
          ),
          body: Container(
            width: double.infinity,
            //height: MediaQuery.of(context).size.width*1.5,
            decoration: BoxDecoration(
              color: backColor,
              image: DecorationImage(
                image: chatBack,
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)/100,
              margin:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom+70.0),
              child: FirebaseAnimatedList(controller: _chatCont,query: _refOfMes,itemBuilder: (BuildContext context ,DataSnapshot snapshot,Animation<double>animation,int index){
                Map messages = snapshot.value;
                return mContainer(messages: messages);
              }),
            ),
          ),

          bottomNavigationBar: Container(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            margin: const EdgeInsets.only(bottom: 8),
            child: BottomAppBar(
              color: Colors.transparent,
              child: Container(
                child: Row(
                  children: [
                Expanded(
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.only(left: 5,right: 5),
                    decoration: BoxDecoration(
                      color: fieldColor,
                      borderRadius: new BorderRadius.circular(35.0),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLengthEnforced: false,
                      maxLines: null,
                      controller: messageCont,
                      onChanged: (value){
                        setState(() {
                            if(messageCont.text == ""){
                              bottomButton=Icons.mic;
                              suffIcon=Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween, // added line
                                mainAxisSize: MainAxisSize.min,
                                children:[
                                  Transform.rotate(angle: -0.60,child: IconButton(icon: Icon(Icons.attach_file,color: Color.fromRGBO(168, 173, 167,1),), onPressed: null)),
                                  IconButton(icon: Icon(Icons.camera_alt,color: Color.fromRGBO(168, 173, 167,1),), onPressed: null),
                                ],
                              );
                            }
                            else{
                              bottomButton=Icons.send;
                              suffIcon=Transform.rotate(angle: -0.60,child: IconButton(icon: Icon(Icons.attach_file,color: Color.fromRGBO(168, 173, 167,1),), onPressed: null));
                            }

                        });
                      },
                      style: TextStyle(
                            color: inputColor,
                      ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.insert_emoticon,color: descriptionColor,),
                          suffixIcon: Container(
                            //width: 100,
                            child: suffIcon,
                          ),
                            contentPadding: EdgeInsets.all(15.0),
                          border: OutlineInputBorder(
                            //borderRadius: new BorderRadius.circular(25.0),
                            borderSide: BorderSide.none,
                          ),
                          hintStyle: TextStyle(
                            color: descriptionColor,
                            fontSize: 16
                          ),
                            hintText: 'Type a message'
                         ),
                      ),
                  ),
                ),
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      height: 50,
                      width: 50,
                      child: RaisedButton(
                          onPressed: () {
                            if(messageCont.text != ""){
                              addMessage(messageCont.text,chatNumber);
                              updateLastMessage(messageCont.text,chatNumber,name);
                            }
                            setState(() {
                              messageCont.text="";
                            });
                          },
                          elevation: 2.0,
                          color: sendColor,
                          child: Icon(
                            bottomButton,

                            color: Colors.white,
                          ),
                          padding: EdgeInsets.only(right:0),
                          shape: CircleBorder(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

        )
    );
  }

  checkedOrNot(int checkNum) {
    if(checkNum==1){
      return Image.asset('img/checked.png',width: 15,height: 15,color: checkedColor,);
    }else{
      return Icon(Icons.check,color: descriptionColor,size: 18,);
    }
  }

  void addMessage(String text,int chatNum) {
    DatabaseReference _ref;
    _ref=FirebaseDatabase.instance.reference().child("internalChat").child("$chatNum");
    _ref.push().set({'checked':0,'message':text,'time':"${DateFormat.jm().format(DateTime.now())}",'type':"h"});//toggle h m
  }

  void updateLastMessage(String text, int chatNumber, String name){
    DatabaseReference ref;
    ref = FirebaseDatabase.instance.reference().child("chats").child("$chatNumber");
    ref.update({'lastMessage':text,'time':"${DateFormat.jm().format(DateTime.now())}",'desc': 1/double.parse("${DateTime.now().microsecondsSinceEpoch.toStringAsFixed(7)}"),'type':"h"});//toggle h m maybe
  }



  // Future<void> updateLastMessage(String text, int chatNumber, String name) async{
  //   var id;
  //   var ref = FirebaseDatabase.instance.reference().child("chats");
  //   print(";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;");
  //   ref.once().then((DataSnapshot snapshot){
  //     snapshot.value.forEach((key,values) async {
  //       if(values['name']==name && values['chatNumber']==chatNumber){
  //         id= key;
  //         print(";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ID = $id");
  //         final String url = "https://whatsapp-6f26b-default-rtdb.firebaseio.com/chats/$id.json";
  //         var res = await http.patch(url,body: json.encode({
  //           'lastMessage':text
  //         }));
  //       }
  //     });
  //   });
  // }
}

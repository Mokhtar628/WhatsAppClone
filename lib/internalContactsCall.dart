import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';
import 'internalChat.dart';
import 'internalCall.dart';

class internalContactsCall extends StatefulWidget {
  @override
  _internalContactsCallState createState() => _internalContactsCallState();
}

class _internalContactsCallState extends State<internalContactsCall> {
  Query _refContact;
  @override
  void initState() {
    //retrieve();
    super.initState();
    _refContact=FirebaseDatabase.instance.reference().child("chats");//.orderByChild("time")
  }

  Widget contactsCallContainer({Map chatsContactsCall}){

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => internalChat(chatsContactsCall['name'],chatsContactsCall['image'],chatsContactsCall['chatNumber'])));
        },
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
        margin: const EdgeInsets.only(top: 15),
        width: double.infinity,
        height: 50,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage(chatsContactsCall['image']),
              backgroundColor: Colors.transparent,
            ),
            Expanded(
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    border: Border()
                ),
                margin: const EdgeInsets.only(left: 15, top: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              chatsContactsCall['name'],
                              style: TextStyle(
                                  color: nameColor, fontSize: 18),
                            )),

                        Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => internalCall(chatsContactsCall['name'],chatsContactsCall['image'],chatsContactsCall['chatNumber'])));
                                    addCall(chatsContactsCall['name'],chatsContactsCall['image'],"call");
                                    },
                                  child: Container(
                                      margin: const EdgeInsets.fromLTRB(0,0,20,0),
                                      child: Icon(Icons.call,color: floatingColor,size: 25,)),
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => internalCall(chatsContactsCall['name'],chatsContactsCall['image'],chatsContactsCall['chatNumber'])));
                                    addCall(chatsContactsCall['name'],chatsContactsCall['image'],"video");
                                    },
                                    child: Icon(Icons.videocam,color: floatingColor,size: 25,))
                              ],
                            )
                        ),
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
        resizeToAvoidBottomInset: false,
        extendBody: true,
        appBar: AppBar(
          brightness: Brightness.dark,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          backgroundColor: navColor,
          centerTitle: false,
          titleSpacing: 0.0,
          title: Transform(
            transform: Matrix4.translationValues(-15.0, 0.0, 0.0),
            child: Row(
              children: [
                //Text(name,style: TextStyle(color: nameColor,fontSize: 20)),
                Flexible(
                  child: Container(
                      margin: const EdgeInsets.only(left: 30),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Select contacts",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20)),
                          Text("9 contact",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15)),
                        ],
                      )
                    //child: Text(chats['lastMessage'],style: TextStyle(color: navItemsColor),overflow: TextOverflow.ellipsis,)
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search,color: Colors.white,),
              onPressed: () {
              },
            ),
            PopupMenuButton<String>(
              color: menuColor,
              icon: Icon(Icons.more_vert,color: Colors.white,),
              onSelected: (value){
              },
              itemBuilder: (BuildContext context) {
                return {'Invite a friend', 'Contacts', 'Refresh','Help'}.map((String choice) {
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
          height: double.infinity,
          color: backColor,
          padding: EdgeInsets.fromLTRB(10, 10, 10,10),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  width: double.infinity,
                  height: 50,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40.0,
                        width: 40.0,
                        margin: const EdgeInsets.only(bottom: 0),
                        child: FittedBox(
                          child: FloatingActionButton(
                            backgroundColor: floatingColor,
                            child: Icon(Icons.people,color: Colors.white,),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border()
                          ),
                          margin: const EdgeInsets.only(left: 15, top: 8),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "New group call",
                                        style: TextStyle(
                                            color: nameColor, fontSize: 18),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                  margin: const EdgeInsets.only(top: 15),
                  width: double.infinity,
                  height: 50,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40.0,
                        width: 40.0,
                        margin: const EdgeInsets.only(bottom: 0),
                        child: FittedBox(
                          child: FloatingActionButton(
                            backgroundColor: floatingColor,
                            child: Icon(Icons.person_add,color: Colors.white,),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border()
                          ),
                          margin: const EdgeInsets.only(left: 15, top: 8),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "New Contact",
                                        style: TextStyle(
                                            color: nameColor, fontSize: 18),
                                      )),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child:Icon(Icons.qr_code,color: settingIconColor,)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child:  FirebaseAnimatedList(query: _refContact,itemBuilder: (BuildContext context ,DataSnapshot snapshot,Animation<double>animation,int index){
                  Map chatsContactsCall = snapshot.value;
                  return contactsCallContainer(chatsContactsCall: chatsContactsCall);
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

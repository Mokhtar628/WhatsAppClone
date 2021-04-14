

import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/status.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'calls.dart';
import 'camera.dart';
import 'chats.dart';
import 'splash.dart';
import 'internalChat.dart';
class settings extends StatefulWidget {
  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {
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
              icon: Icon(Icons.arrow_back, color: navItemsColor),
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
                    child: Text("Settings",
                        style: TextStyle(color: navItemsColor, fontSize: 22)),
                    //child: Text(chats['lastMessage'],style: TextStyle(color: navItemsColor),overflow: TextOverflow.ellipsis,)
                  ),
                )
              ],
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: backColor,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20,20),
                  width: double.infinity,
                  height: 105,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                          bottom: BorderSide(
                              color: descriptionColor, width: 0.2))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      CircleAvatar(
                        radius: 35.0,
                        backgroundImage: AssetImage("img/4.jpg"),
                        backgroundColor: Colors.transparent,
                      ),
                      Expanded(
                        child: Container(
                          //width:MediaQuery.of(context).size.width*0.7,
                          height: 60,
                          margin: const EdgeInsets.only(left: 15, top: 10),

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
                                          "Mokhtar✌",
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
                                          "FCAI Helwan univercity❤",
                                          style: TextStyle(
                                              color: descriptionColor, fontSize: 12),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Align(
                                    child: Container(
                                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      child: Icon(Icons.qr_code,color: settingIconColor,size: 30,),
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
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(30, 30, 20,20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Icon(Icons.vpn_key_sharp,color: settingIconColor,),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Account",style: TextStyle(color: white,fontSize: 18),),
                              Text("Privacy, security, change number",style: TextStyle(color: descriptionColor,fontSize: 15),),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Column(
                          children: [
                            Icon(Icons.chat,color: settingIconColor,),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Chats",style: TextStyle(color: white,fontSize: 18),),
                              Text("Numbers, wallpapers, chat history",style: TextStyle(color: descriptionColor,fontSize: 15),),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Column(
                          children: [
                            Icon(Icons.notifications,color: settingIconColor,),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Notifications",style: TextStyle(color: white,fontSize: 18),),
                              Text("Message, group & call tones",style: TextStyle(color: descriptionColor,fontSize: 15),),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Column(
                          children: [
                            Icon(Icons.color_lens,color: settingIconColor,),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text("Theme",style: TextStyle(color: white,fontSize: 18),),
                              Container(
                                height: 30,
                                child: ToggleSwitch(
                                  minWidth: 90.0,
                                    initialLabelIndex: 1,
                                    cornerRadius: 20.0,
                                  activeFgColor: Colors.grey,
                                  inactiveBgColor:Colors.white,
                                  inactiveFgColor: Color.fromRGBO(37, 211, 102,1),
                                    labels: ['Light', 'Dark'],
                                    icons: [Icons.wb_sunny, Icons.star],
                                    activeBgColors: [Color.fromRGBO(16, 29, 37,1),Color.fromRGBO(16, 29, 37,1)],
                                    onToggle: (index) {
                                      setState(() {
                                        if(index==0){
                                          chatBack = AssetImage("img/chatBack.png");
                                          backColor = Colors.white;
                                          navColor = Color.fromRGBO(7, 94, 85,1);
                                          nameColor= Colors.black;
                                          white=Colors.black;
                                          navItemsColor= Colors.white;
                                          whatsAppColor=Color.fromRGBO(37, 211, 102,1);
                                          indicatorColor = Color.fromRGBO(212, 215, 217,1);
                                          messageColorMe = Color.fromRGBO(226, 255, 199, 1);
                                          checkedColor = Color.fromRGBO(61, 180, 226, 1);
                                          menuColor = Colors.white;
                                          settingIconColor = Color.fromRGBO(107, 179, 167, 1);
                                          messageHimColor = Colors.white;
                                          sendColor =Color.fromRGBO(7, 94, 85,1);
                                          fieldColor = Colors.white;
                                          descriptionColor = Color.fromRGBO(168, 173, 167,1);
                                          floatingColor = Color.fromRGBO(37, 211, 102,1);
                                          inputColor = Colors.black;
                                        }else{
                                          inputColor = Colors.white;
                                          chatBack = AssetImage("img/darkChatBack.png");
                                           backColor = Color.fromRGBO(16, 29, 37,1);
                                           navColor = Color.fromRGBO(35, 45, 54,1);
                                           nameColor= Color.fromRGBO(212, 215, 217,1);
                                           white=Color.fromRGBO(213, 214, 216, 1);
                                           navItemsColor= Color.fromRGBO(212, 215, 217,1);
                                           whatsAppColor=Color.fromRGBO(37, 211, 102,1);
                                           indicatorColor = Color.fromRGBO(0, 176, 157, 1);
                                           messageColorMe = Color.fromRGBO(5, 70, 64, 1);
                                           checkedColor = Color.fromRGBO(61, 180, 226, 1);
                                           menuColor = Color.fromRGBO(49, 60, 66, 1);
                                          messageHimColor = Color.fromRGBO(35, 45, 54,1);
                                          settingIconColor = Color.fromRGBO(213, 214, 216, 1);
                                          sendColor =Color.fromRGBO(0, 176, 157, 1);
                                          fieldColor = Color.fromRGBO(35, 45, 54,1);
                                          descriptionColor = Color.fromRGBO(168, 173, 167,1);
                                          floatingColor = Color.fromRGBO(0, 176, 157, 1);
                                        }
                                      });
                                    },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Column(
                          children: [
                              Image.asset('img/questionMark.png',width:22,height:22,color: settingIconColor,),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Help",style: TextStyle(color: white,fontSize: 18),),
                              Text("Help center, contact us, privacy policy",style: TextStyle(color: descriptionColor,fontSize: 15),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                alignment: Alignment.centerRight,
                width: 250,
                child: Divider(color: descriptionColor,thickness: 0.2,),
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(30, 0, 20,0),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Column(
                          children: [
                            Icon(Icons.people,color: settingIconColor,),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Invite a friend",style: TextStyle(color: white,fontSize: 18),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    Text("from",style: TextStyle(color: descriptionColor,fontSize: 15),),
                    Text("MOKHTAR",style: TextStyle(color: white,fontSize: 16),),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

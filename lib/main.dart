import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/status.dart';
import 'Settings.dart';
import 'calls.dart';
import 'camera.dart';
import 'chats.dart';
import 'splash.dart';
import 'package:flutter/services.dart';

//started in 4 4 2021
//End in 9 4 2021
// the project take about 30 hour of working


void main() {
  //WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: splash() ,
  ),
  );
}

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home>  with TickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync:this,length: 3);
    _tabController.addListener(_handleTabSelection);

  }

  void _handleTabSelection() {
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: navColor,
      statusBarIconBrightness: Brightness.light,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            brightness: Brightness.dark,
            backgroundColor: navColor,
            title: Text('WhatsApp',style: TextStyle(color: navItemsColor,),),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search,color: navItemsColor),
                onPressed: () {
                },
              ),
              PopupMenuButton<String>(
                color: menuColor,
                icon: Icon(Icons.more_vert,color: navItemsColor,),
                onSelected: (value){
                  if (value=="Settings"){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => settings()));
                  }
                },
                itemBuilder: (BuildContext context) {
                  return {'New group', 'New broadcast', 'WhatsApp web','Starred messages','Settings'}.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice,style: TextStyle(color: nameColor),),
                    );
                  }).toList();
                },
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.square(40.0),
              child: Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CameraPage()));
                      },
                      child: Container(width: 50,child: Icon(Icons.camera_alt,color: navItemsColor,size: 25))),
                  Expanded(
                    child: TabBar(
                      indicatorColor: indicatorColor,
                      labelColor: whatsAppColor,
                      unselectedLabelColor: navItemsColor,
                      indicatorWeight: 3,

                      tabs: [
                        //Tab(child: Container(child: Icon(Icons.camera_alt,color: navItemsColor)),),
                        Tab(child: Text("CHATS",style: TextStyle(color: navItemsColor),),),
                        Tab(child: Text("STATUS",style: TextStyle(color: navItemsColor),),),
                        Tab(child: Text("CALLS",style: TextStyle(color: navItemsColor),),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: backColor,
            child: TabBarView(
              children: [
                //Camera(),
                Chats(),
                Status(),
                Calls()
              ],
            ),
          ),
        ),
      ),
    );
  }


}

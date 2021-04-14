import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';




class internalCall extends StatefulWidget {
  final String name;
  final String img;
  final int chatNumber;

  internalCall(this.name,this.img,this.chatNumber);

  @override
  _internalCallState createState() => _internalCallState(name,img,chatNumber);
}

class _internalCallState extends State<internalCall> {
  var mic = Icons.mic;
  var speaker = Icons.volume_up;
  final String name;
  final String img;
  final int chatNumber;
  _internalCallState(this.name,this.img,this.chatNumber);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white), onPressed: (){ }),
          brightness: Brightness.dark,
          backgroundColor: Color.fromRGBO(5, 70, 64, 1),
          //Text('End-to-end encrypted',style: TextStyle(color: Color.fromRGBO(168, 173, 167,1),fontSize: 15),),
          title: RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Icon(Icons.enhanced_encryption,color: Color.fromRGBO(168, 173, 167,1),size: 15,),
                  ),
                ),
                TextSpan(text: ' End-to-end encrypted',style: TextStyle(color: Color.fromRGBO(168, 173, 167,1),fontSize: 15)),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.square(90.0),
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(name,style: TextStyle(color: Colors.white,fontSize: 24),),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Calling",style: TextStyle(color: Colors.white,fontSize: 15),),
                    ],
                  )
                ],
              ),
            )
          ),
        ),

        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(img),
              fit: BoxFit.cover,
            )
          ),
        ),

        bottomNavigationBar: Container(
          height: 70,
          child: BottomAppBar(
            color: Color.fromRGBO(5, 70, 64, 1),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(icon: Icon(speaker,color: Color.fromRGBO(168, 173, 167,1),size: 25,), onPressed: (){
                  setState(() {
                    if(speaker==Icons.volume_up)
                      speaker=Icons.volume_off;
                    else
                      speaker=Icons.volume_up;
                  });
                }),
                IconButton(icon: Icon(Icons.videocam,color: Color.fromRGBO(168, 173, 167,0.5),size: 25,),),
                IconButton(icon: Icon(mic,color: Color.fromRGBO(168, 173, 167,1),size: 25,), onPressed: (){
                  setState(() {
                    if(mic==Icons.mic)
                      mic=Icons.mic_off;
                    else
                      mic=Icons.mic;
                  });
                }),
              ],
            ),
          ),
        ),

        floatingActionButton: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 135, 20),
          width: 60,
          height: 60,
          child: InkWell(
            onTap: ()=> Navigator.of(context).pop(),
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              child: Container(
                child: Icon(Icons.call_end,color: Colors.white,size: 30,),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

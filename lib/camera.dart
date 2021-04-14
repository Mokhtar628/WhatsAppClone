//import 'package:camera/camera.dart';
import 'package:flutter/material.dart';


class CameraPage extends StatefulWidget {
  final double iconHeight = 30;
  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned.fill(
          child: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return null;
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
        Positioned.fill(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: null,
            body: Container(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    bottom: 50,
                    right: 40,
                    left: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: widget.iconHeight,
                          child: Icon(
                            Icons.flash_off,
                            color: Colors.white,
                          ),
                        ),

                        Container(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                          ),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                            border: Border.all(
                              width: 1,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          height: widget.iconHeight,
                          child: Icon(
                            Icons.flip_camera_ios,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: 10,
                    height: 20,
                    child: PageView.builder(
                      //controller: widget.bottomPageController,
                      itemBuilder: (context, index) {
                        return Text(
                          "Hold for video, tap for photo",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        );
                      },
                      itemCount: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
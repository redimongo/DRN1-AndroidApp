import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audio_stream_player/audio_stream_player.dart';
import './screens/trackswidget.dart';
import 'about_widget.dart';


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  bool check = false;
  int _currentIndex = 0;

  String url = "http://139.59.108.222:8003/stream";
  AudioStreamPlayer player = AudioStreamPlayer();
  @override
  void initState() {
    super.initState();
    player.play(url);

  }

  Future<void> audioStart() async {
    // await FlutterRadio.audioStart();
    print('Audio Start OK');
  }


  final List<Widget> _children = [TracksWidget(),
    AboutWidget()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('DRN',style: TextStyle(color: Colors.white, fontSize: 40.0),),
              const Text('1', style: TextStyle(color: Colors.red, fontSize: 40.0),)
            ],
        ),
      ),
      body: _children[_currentIndex],



      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 80.0,
        width: 80.0,
        child: FittedBox(
          child:FloatingActionButton(
                  onPressed: () => {
                    setState((){
                      if(check)
                      {
                        check = false;
                        player.play(url);
                        print("false");
                      }
                      else
                      {
                        check = true;
                        player.stop();
                        print("true");
                      }

                    }),
                    },
         child: Icon(check ? Icons.play_arrow: Icons.pause),
                backgroundColor: Colors.black,
                mini: true,
              ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          decoration:
          new BoxDecoration(color: new Color(0xFFFF0000)),
          height: 75,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: Icon(Icons.home),
                onPressed: () {
                  setState(() {

                    onTabTapped(0);
                  });
                },
              ),
          /*    IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    onTabTapped(1);
                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: Icon(Icons.notifications),
                onPressed: () {
                  setState(() {
                    onTabTapped(2);
                  });
                },
              ),*/
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(Icons.info_outline),
                onPressed: () {
                  setState(() {
                    onTabTapped(1);
                  });
                },
              )
            ],
          ),
        ),
      ),// new

    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
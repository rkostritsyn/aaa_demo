import 'package:aaa_demo/res/style.dart';
import 'package:aaa_demo/ui/screen/call_detail_screen.dart';
import 'package:aaa_demo/ui/time_line/timeline.dart';
import 'package:aaa_demo/ui/time_line/timeline_model.dart';
import 'package:flutter/material.dart';

class CallItem extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => CallItemState();
}

class CallItemState extends State<CallItem> {
  double _animatedHeight = 100.0;
  Widget _expandIcon = Icon(Icons.keyboard_arrow_down);

  final List<TimelineModel> list = [
    TimelineModel(
        id: "1",
        description: "Test 1",
        title: "Test 1"),
    TimelineModel(
        id: "2",
        description: "Test 2",
        title: "Test 2"),
    TimelineModel(
        id: "3",
        description: "Test 3",
        title: "Test 3")
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          buildStatus('AS'),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0),
                            child: Text('12234', style: largeFontSizeCall),
                          ),
                          Text('(2019-01-25)', style: midFontSizeCall),
                          Expanded(
                            child: Container(
                              child: IconButton(icon: _expandIcon, iconSize: 25, onPressed: _expand,),
                              alignment: Alignment.centerRight,
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      height: 350,
                      child: TimelineComponent(
                        timelineList: list,
                      ),
                    ),

                    AnimatedContainer(duration: const Duration(milliseconds: 120),
                      child: Container(
                        height: 100,
                        child:Text('Text')
                      ),
                      height: _animatedHeight,
                      width: double.infinity,
                      color: Colors.tealAccent,
                    )
                  ],
                ),
              )
          ),

          getDivider(true)
        ]
    );
  }

  void _expand() {
    setState((){
      _animatedHeight!=0.0?_animatedHeight=0.0:_animatedHeight=100.0;
      _animatedHeight == 0.0? _expandIcon = Icon(Icons.keyboard_arrow_right) : _expandIcon = Icon(Icons.keyboard_arrow_down);
    });
  }

  void goToDetail(BuildContext context) {
    if (true) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CallDetailScreen()
        ),
      );
    }
  }

  Widget getDivider(bool hasDivider) {
    if(hasDivider) {
      return Divider(height: 1, color: Colors.black54);
    } else {
      // SPIKE SPIKE SPIKE
      return Divider(height: 1, color: Colors.transparent); ;
    }
  }

  Widget buildStatus(String text) {
    return CircleAvatar(
      backgroundColor: Colors.amber,
      child: new Text(text, style: statusStyleCall),
      foregroundColor: Colors.white,
    );
  }

}
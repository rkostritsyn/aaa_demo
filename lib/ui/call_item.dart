import 'package:aaa_demo/res/style.dart';
import 'package:aaa_demo/ui/screen/call_detail_screen.dart';
import 'package:aaa_demo/ui/time_line/custom_time_line.dart';
import 'package:flutter/material.dart';

class CallItem extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => CallItemState();
}

class CallItemState extends State<CallItem> {
  double _animatedHeight = 0.0;
  Widget _expandIcon = Icon(Icons.keyboard_arrow_up);

  List<TimeLineModel> my_steps = [
    new TimeLineModel(
      // Title of the Step
        title: new Text("Step 1"),
        subtitle: Text('SubTitle'),
        isActive: true),
    new TimeLineModel(
        title: new Text("Step 2"),
        subtitle: Text('SubTitle'),
        // You can change the style of the step icon i.e number, editing, etc.
        isActive: true),
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

                    //SPIKE FAKE-TIMELINE
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 150,
                                child: Text('7627 NW 127TH MANOR'),
                              ),
                              Container(
                                  width: 100,
                                  child: Text('NW 76TH ST TAMARAC, FL')),
                            ],
                          ),
                          CustomStepper(
                            steps: my_steps,
                            type: TimeLineType.horizontal,
                            tlColor: Colors.black12,
                          ),
                        ],
                      ),
                    ),

                    Center(
                      child: Text(
                        'T 180 Tire Issue Request Tow To Shop',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)), ),

                    AnimatedContainer(duration: const Duration(milliseconds: 120),
                      child: Container(
                        height: 130,
                        child: getExpandedWidget()
                      ),
                      height: _animatedHeight,
                      width: double.infinity,
                    )
                  ],
                ),
              )
          ),

//          getDivider(true)
        ]
    );
  }

  List<TimeLineModel> my_steps_full = [
    new TimeLineModel(
      // Title of the Step
        title: new Text("Step 1"),
        subtitle: Text('SubTitle'),
        isActive: true),

    new TimeLineModel(
        title: new Text("Step 2"),
        subtitle: Text('SubTitle'),
        // You can change the style of the step icon i.e number, editing, etc.
        isActive: true),

    new TimeLineModel(
        title: new Text("Step 2"),
        subtitle: Text('SubTitle'),
        // You can change the style of the step icon i.e number, editing, etc.
        isActive: true),
  ];

  Widget getExpandedWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Re 11:15'),
              Text('Re 12:27'),
              Text('Re 16:56'),
            ],
          ),

          CustomStepper(
            steps: my_steps_full,
            type: TimeLineType.horizontal,
          ),

          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.all(5),
                  child: Text('T6 Tow'),
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder( side: BorderSide(color: Colors.blueAccent, width: 2
                ) , borderRadius: BorderRadius.circular(15))),
              ),

              Container(
                  child: Text('Passanger Car/Truck'),
                padding: EdgeInsets.all(5),
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder( side: BorderSide(color: Colors.blueAccent, width: 2
                    ) , borderRadius: BorderRadius.circular(15))),
              ),


            ],
          )
        ],
      ),
    );
  }

  void _expand() {
    setState((){
      _animatedHeight!=0.0?_animatedHeight=0.0:_animatedHeight=100.0;
      _animatedHeight == 0.0? _expandIcon = Icon(Icons.keyboard_arrow_up) : _expandIcon = Icon(Icons.keyboard_arrow_down);
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

//  Widget getDivider(bool hasDivider) {
//    if(hasDivider) {
//      return Divider(height: 1, color: Colors.black54);
//    } else {
//      // SPIKE SPIKE SPIKE
//      return Divider(height: 1, color: Colors.transparent); ;
//    }
//  }

  Widget buildStatus(String text) {
    return CircleAvatar(
      backgroundColor: Colors.amber,
      child: new Text(text, style: statusStyleCall),
      foregroundColor: Colors.white,
    );
  }

}
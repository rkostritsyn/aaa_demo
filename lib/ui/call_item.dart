import 'package:aaa_demo/res/dimen.dart';
import 'package:aaa_demo/res/style.dart';
import 'package:aaa_demo/ui/custom_time_line.dart';
import 'package:aaa_demo/ui/screen/call_detail_screen.dart';
import 'package:flutter/material.dart';

class CallItem extends StatelessWidget {
  final bool hasDivider;

  CallItem({this.hasDivider = true});

  List<TimeLineModel> steps = [
    TimeLineModel(
        state: TimeLineM.complete,
        title: Text("Re"),
        subtitle: Text("11:15"),
        isActive: true),
    TimeLineModel(
        title: Text("PTA"),
        subtitle: Text("12:15"),
        state: TimeLineM.editing,
        isActive: true),
    TimeLineModel(
        title: Text("ETA"),
        state: TimeLineM.disabled,
        isActive: false),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => goToDetail(context),

      child: Column(
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
                          children: <Widget>[
                            buildStatus('AS'),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0),
                              child: Text('12234', style: largeFontSizeCall),
                            ),
                            Text('(2019-01-25)', style: midFontSizeCall)
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: space),
                        child: Text('7627 NW 127TH MANOR / NW 76TH ST'),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: space),
                        child: Text('TAMARAC, FL'),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: space),
                        child: Text('T 180 Tire Issue Requires Tow To Shop',
                            style: linkFontStyleCall),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: space),
                        child: Text('T6 Tow', style: linkFontStyleCall),
                      ),

                      Container(
                        height: 55,
                          child: CustomStepper(steps: steps, type: TimeLineType.horizontal,)),

                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text('Passanger Car/Truck',
                            style: truckPassengerFontStyleCall),
                      )

                    ],
                  ),
                )
            ),

            getDivider(hasDivider)
          ]
      ),
    );
  }

  void goToDetail(BuildContext context) {
    if (hasDivider) {
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
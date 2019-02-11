import 'package:aaa_demo/ui/screen/call_screen.dart';
import 'package:flutter/material.dart';

class CallHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Text('Calls: ${CallScreen.count - 1}', style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.black54)),
              ],
            ),
          ),
        ),
        Divider(height: 1, color: Colors.black54,)
      ],
    );
  }
}

import 'package:aaa_demo/res/dimen.dart';
import 'package:aaa_demo/ui/call_item.dart';
import 'package:flutter/material.dart';

class CallDetailScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CallItem(hasDivider: false,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                getItem('SHOW ON MAP',  AssetImage('assets/map-marker.png')),
                getItem('NAVIGATION TO DESTINATION', AssetImage('assets/road.png')),
                getItem('CALL DETAILS', AssetImage('assets/phone-log.png')),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                getItem('COMENTS', AssetImage('assets/comment.png')),
                getItem('ADD COMMENTS', AssetImage('assets/comment-plus.png')),
                getItem('CALL IMAGE', AssetImage('assets/image-area.png')),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                getItem('SERVICES (APD)', AssetImage('assets/van-utility.png')),
                getItem('SEND TEXT (SMS)', AssetImage('assets/send.png')),
                getItem('CALL IMAGE', AssetImage('assets/account-multiple.png')),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                getItem('SWIPE CARD', AssetImage('assets/credit-card.png')),
                getItem('NEW STATAUS', AssetImage('assets/playlist-check.png')),
                getItem('BATTARY SERVICE', AssetImage('assets/battery-charging-70.png')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getItem(String text, AssetImage icon) {
    return Expanded(
      flex: 1,
      child: Card(
        elevation: 3,
          margin: EdgeInsets.all(8),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              height: 140,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image(image: icon, width: 50, height: 50, color: Colors.blueAccent,),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(text,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, color: Colors.black54),),
                  ),
                ],
              ),
            )
      ),
    );
  }

}

import 'package:aaa_demo/ui/call_header.dart';
import 'package:aaa_demo/ui/call_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class CallScreen extends StatelessWidget {
  static int count = 5;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
      body: getBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.call),
          onPressed: () =>  _showNewCall(context))//_showSnack('Request to talk sent successfully')),
    );
  }

  Widget getBody() {
    return AnimatedList(
      key: _listKey,
        itemBuilder: buildSlideBurs,
        initialItemCount: count
    );
  }

  Widget buildSlideBurs(BuildContext context, int index, Animation animation) {
    if (index == 0) {
      return FadeTransition(
          opacity: animation,
          child: CallHeader());
    } else
    return FadeTransition(
      opacity: animation,
      child: Slidable(
        delegate: SlidableDrawerDelegate(),
        actionExtentRatio: 0.25,
        child: CallItem(),
        secondaryActions: <Widget>[
          new IconSlideAction(
            caption: 'Accespt',
            color: Colors.green,
            icon: Icons.check,
            onTap: () => _showSnack('Call was accepted')
          ),
          new IconSlideAction(
            caption: 'Delcline',
            color: Colors.red,
            icon: Icons.close,
            onTap: () => deleteUser(index),
          ),
        ],
      ),
    );
  }

  void _showSnack(String message) {
    final snackBar = SnackBar(content: Text(message), duration: Duration(seconds: 2),);
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void addUser() {
    count++;
    _listKey.currentState
        .insertItem(1, duration: Duration(milliseconds: 600));
  }

  void deleteUser(int index) {
    _showSnack('Call was declined');
    count--;

    // SPIKE SPIKE SPIKE SPIKE SPIKE SPIKE SPIKE SPIKE
    Future.delayed(Duration(milliseconds: 265), () {
      _listKey.currentState.removeItem(
        index,
            (BuildContext context, Animation<double> animation) {
          return FadeTransition(
            opacity:
            CurvedAnimation(parent: animation, curve: Interval(0.5, 1.0)),
            child: SizeTransition(
              sizeFactor:
              CurvedAnimation(parent: animation, curve: Interval(0.0, 1.0)),
              axisAlignment: 0.0,
              child: CallItem(),
            ),
          );
        },
        duration: Duration(milliseconds: 250),
      );
    });
  }

  void _showNewCall(BuildContext context) {
    _showSnack('Request to talk sent successfully');
    Future.delayed(Duration(seconds: 3), () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("New Bid Call"),
            content: new Text("New Bid Call #20157 is available"),
            actions: <Widget>[

              new FlatButton(
                child: new Text("GO TO CALL"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),

              new FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  addUser();
                  Navigator.of(context).pop();
                },
              ),

            ],
          );
        },
      );
    });
  }

}
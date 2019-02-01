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
    return NestedScrollView(
      body: _body(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          CallItem(hasDivider: false)
        ];
      },
    );
  }

  Widget _body() {
    return ListView.builder(itemBuilder: getItem);
  }

  Widget getItem(BuildContext context, int i) {
    return Card(
      margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Text('LOL'),
          ],
        )

    );
  }

}

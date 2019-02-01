import 'package:aaa_demo/ui/screen/call_screen.dart';
import 'package:aaa_demo/ui/screen/user_screen.dart';
import 'package:aaa_demo/ui/screen/utils_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  var pageIndex = 0;
  var title = 'Calls';

  static List<Widget> _navigationItemList = [
      CallScreen(),
      UtilityScreen(),
      UserScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[

          IconButton(
              iconSize: 38,
              icon: Image(image: AssetImage('assets/barcode.png')),
              onPressed: () {}
          ),

          IconButton(
            iconSize: 30,
             icon: Image(image: AssetImage('assets/email_outline.png')),
//            icon: Icon(Icons.email),
            onPressed: () {},
          )

        ],
      ),
      body: IndexedStack(
          index: pageIndex,
          children: _navigationItemList
      ),
      bottomNavigationBar: BottomNav(pageIndex, onPgeChanged),
    );
  }

  void onPgeChanged(int index) {
    setState(() {
      this.pageIndex = index;
      this.title = getTitle(index);
    });
  }

  String getTitle(int index) {
    switch (index) {
      case 0:
        return 'Calls';

      case 1:
        return 'Utility';

      case 2:
        return 'User';

      default:
        return 'None';
    }
  }
}

class BottomNav extends StatelessWidget {
  final startIndex;
  final navigate;

  BottomNav(this.startIndex, this.navigate);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: startIndex,
        onTap: navigate,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.smartphone),
              title: Text('Calls')
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.details),
              title: Text('Utility')
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('User')
          ),
        ]);
  }

}
import 'package:aaa_demo/ui/screen/call_screen.dart';
import 'package:flutter/material.dart';

class CallFetalScreenNavigator extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey();

  @override
  State<StatefulWidget> createState() => new CallFetalScreenNavigatorState();
}

class CallFetalScreenNavigatorState extends State<CallFetalScreenNavigator> {

  Future<bool> didPopRoute() async {
    final NavigatorState navigator = widget.navigatorKey.currentState;
    assert(navigator != null);
    return await navigator.maybePop();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return !await didPopRoute();
        },
        child: _buildNavigator()
    );
  }

  Navigator _buildNavigator() {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder = (BuildContext _) => CallScreen();
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }

}
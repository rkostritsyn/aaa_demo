import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class EmailWidget extends StatefulWidget {
  /// The function to call when the icon button is pressed.
  final VoidCallback onPressed;

  /// Number of items in the basket. When this is `0`, no badge will be shown.
  final int itemCount;

  final Color badgeColor;

  final Color badgeTextColor;

  EmailWidget({
    Key key,
    @required this.itemCount,
    this.onPressed,
    this.badgeColor: Colors.red,
    this.badgeTextColor: Colors.white,
  })  : assert(itemCount >= 0),
        assert(badgeColor != null),
        assert(badgeTextColor != null),
        super(key: key);

  @override
  EmailWidgetState createState() {
    return EmailWidgetState();
  }
}

class EmailWidgetState extends State<EmailWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  final Tween<Offset> _badgePositionTween = Tween(
    begin: const Offset(-0.5, 0.9),
    end: const Offset(0.0, 0.0),
  );

  @override
  Widget build(BuildContext context) {

    return
      IconButton(
        icon: Stack(
          overflow: Overflow.visible,
          children: [
            Icon(Icons.email),
            Positioned(
              top: -8.0,
              right: -3.0,
              child: SlideTransition(
                position: _badgePositionTween.animate(_animation),
                child: Material(
                    type: MaterialType.circle,
                    elevation: 2.0,
                    color: Colors.red,
                  ),
              ),
            ),
          ],
        ),
        onPressed: widget.onPressed);
  }

  @override
  void didUpdateWidget(EmailWidget oldWidget) {
    if (widget.itemCount != oldWidget.itemCount) {
      _animationController.reset();
      _animationController.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.elasticOut);
    _animationController.forward();
  }
}

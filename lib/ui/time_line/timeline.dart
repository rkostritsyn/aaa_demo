import 'package:aaa_demo/ui/time_line/timeline_element.dart';
import 'package:aaa_demo/ui/time_line/timeline_model.dart';
import 'package:flutter/material.dart';

class TimelineComponent extends StatefulWidget {

  final List<TimelineModel> timelineList;

  final Color lineColor;

  final Color backgroundColor;

  final Color headingColor;

  final Color descriptionColor;

  const TimelineComponent({Key key, this.timelineList, this.lineColor, this.backgroundColor, this.headingColor, this.descriptionColor}) : super(key: key);

  @override
  TimelineComponentState createState() {
    return new TimelineComponentState();
  }

}

class TimelineComponentState extends State<TimelineComponent> with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;
  double fraction = 0.0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000),
        vsync: this);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.timelineList.length,
        itemBuilder: (_, index) {
          return new TimelineElement(
            lineColor: widget.lineColor==null?Theme.of(context).accentColor:widget.lineColor,
            backgroundColor: widget.backgroundColor==null?Colors.white:widget.backgroundColor,
            model: widget.timelineList[index],
            firstElement: index==0,
            lastElement: widget.timelineList.length==index+1,
            controller: controller,
            headingColor: widget.headingColor,
            descriptionColor: widget.descriptionColor,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

}

import 'package:flutter/material.dart';
import 'package:flutter_module8_assignment/constants.dart';
import 'package:flutter_module8_assignment/resources/colors.dart';
import 'package:flutter_module8_assignment/resources/dimens.dart';
import 'package:flutter_module8_assignment/widgets/dashed_divider_view.dart';

class TimeAndEventListCustomLayout extends StatelessWidget {

  List<Events> listOfEvents;

  final Function onTapEvent;


  TimeAndEventListCustomLayout({
   required this.listOfEvents,
    required this.onTapEvent
  });

  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: EdgeInsets.only(bottom: 30),
        height: MediaQuery.of(context).size.height,
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: listOfEvents.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: (){
                      onTapEvent();
                    },
                    child: TimeAndEventListEachItem(eventsItem: listOfEvents[index],));
              }),
        ),
      );

  }
}

class TimeAndEventListEachItem extends StatelessWidget {
  Events eventsItem;

  TimeAndEventListEachItem({
    required this.eventsItem
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          child: Row(
            //crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TimeView(eventsItem: eventsItem,),
              SizedBox(width: MARGIN_MEDIUM,),
              TimeLineView(activeTimeLineFlag: eventsItem.currentTimeFlag,),
              SizedBox(width: MARGIN_MEDIUM,),
              EventItemView(eventsItem: eventsItem,)
            ],
          ),
        ),


      ],
    );
  }
}

class EventItemView extends StatelessWidget {
  Events eventsItem;

  EventItemView({
    required this.eventsItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: 300,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: MARGIN_MEDIUM,
           ),
            child: Container(
              margin: EdgeInsets.only(left: MARGIN_MEDIUM),
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: eventsItem.currentTimeFlag == true ? Color.fromRGBO(248, 251, 255, 1): Color.fromRGBO(233, 235, 249, 1),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(Icons.ac_unit_outlined,color: SEARCH_BOX_COLOR,size: 20,),
            ),
          ),
          SizedBox(width: MARGIN_MEDIUM_2,),
          Padding(
            padding: const EdgeInsets.only(
              left: MARGIN_MEDIUM,
             // top: MARGIN_MEDIUM
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eventsItem.eventName,
                  style: TextStyle(
                      color: eventsItem.currentTimeFlag == true ? Colors.black26 : Colors.black87,
                      fontSize: TEXT_REGULAR_2X,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 5,),
                Row(
                  children: [

                    Icon(
                      Icons.access_time,
                      color:  eventsItem.currentTimeFlag == true ? Colors.black26 : Colors.black54,
                      size: 18,
                    )

                    ,
                    const SizedBox(
                      width: MARGIN_MEDIUM,
                    ),
                    Text(
                      "${eventsItem.startTime} - ${eventsItem.endTime}",
                      style: TextStyle(
                          color: eventsItem.currentTimeFlag == true ? Colors.black26 : Colors.black54,
                          fontSize: TEXT_REGULAR,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TimeLineView extends StatelessWidget {

  bool activeTimeLineFlag;

  TimeLineView({
    required this.activeTimeLineFlag
  });

  @override
  Widget build(BuildContext context) {

    return  activeTimeLineFlag == false ?
        Container(
        width: 0.3,
        // margin: EdgeInsets.only(right: 50),
        //  child:Image.asset("assets/images/dotted_line.png"),
        child:
      /*  CustomPaint(
          painter: DottedLinePainter2(),
          size: Size(50, 200),
        )*/
          DottedLine(height: 100, color: Colors.black26, strokeWidth: 1,dashLineFlag: false,),
      ) :
       Container(
        width: 0.3,
        // margin: EdgeInsets.only(right: 50),
        //  child:Image.asset("assets/images/dotted_line.png"),
        child: Stack(
          children: [
            DottedLine(height: 100, color: Colors.blue, strokeWidth: 1,dashLineFlag: true,),
            // Align(
            //   alignment: Alignment.bottomLeft,
            //     child: Icon(Icons.circle,color: Colors.blue,size: 10,))
          ],
        ),
      );
  }
}

class TimeView extends StatelessWidget {

  Events eventsItem;

  TimeView({
    required this.eventsItem
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children:[

          Text(
            eventsItem.startTime,
            style: TextStyle(
                color: Colors.grey,
                fontSize: TEXT_REGULAR,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 35,),
          Text(
           eventsItem.endTime,
            style: TextStyle(
                color: Colors.grey,
                fontSize: TEXT_REGULAR,
                fontWeight: FontWeight.w400),
          )
          ]
      ),
    );
  }
}

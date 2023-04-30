
import 'package:flutter/material.dart';
import 'package:flutter_module8_assignment/constants.dart';
import 'package:flutter_module8_assignment/resources/colors.dart';
import 'package:flutter_module8_assignment/resources/dimens.dart';
import 'package:flutter_module8_assignment/widgets/dashed_divider_view.dart';

class TimeAndEventListCustomLayout extends StatefulWidget {

  List<Events> listOfEvents;
  final Function onTapEvent;
  final Function onLoadMoreEvent;
  final Function onRefreshEvent;
  final Function onEmptyView;


  TimeAndEventListCustomLayout({
   required this.listOfEvents,
    required this.onTapEvent,
    required this.onLoadMoreEvent,
    required this.onRefreshEvent,
    required this.onEmptyView
  });

  @override
  State<TimeAndEventListCustomLayout> createState() => _TimeAndEventListCustomLayoutState();
}

class _TimeAndEventListCustomLayoutState extends State<TimeAndEventListCustomLayout> {
  var _scrollController = ScrollController();
  Future<void> _pullRefresh() async {
   // List<String> freshNumbers = await NumberGenerator().slowNumbers();
    setState(() {
     // numbersList = freshNumbers;
      widget.onRefreshEvent();
    });
    // why use freshNumbers var? https://stackoverflow.com/a/52992836/2301224
  }



  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if(_scrollController.position.atEdge){
        if(_scrollController.position.pixels == 0)
        {
          print("Start of the list reached");
        }else{
          print("End of the list reached");
          widget.onLoadMoreEvent();
        }
      }
    });



  }

  @override
  Widget build(BuildContext context) {

    if(widget.listOfEvents.length == 0)
      {
        widget.onEmptyView();
        return Container();
      }else{
      return
        RefreshIndicator(
          onRefresh: _pullRefresh,
          child:
          Container(
            margin: EdgeInsets.only(bottom: 30),
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                itemCount: widget.listOfEvents.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: (){
                        widget.onTapEvent();
                      },
                      child: TimeAndEventListEachItem(eventsItem: widget.listOfEvents[index],));
                }),
          ),
        );
    }
  }
}

class TimeAndEventListEachItem extends StatelessWidget {
  Events eventsItem;

  TimeAndEventListEachItem({
    required this.eventsItem
  });

  @override
  Widget build(BuildContext context) {

   /* bool currentCircleState = false;
    DateTime now = DateTime.now();
    int hour = now.hour;

    List<String> startTimeSplitData =  eventsItem.startTime.split(":");
    String startTimeHourData = startTimeSplitData.first;


    List<String> endTimeSplitData =  eventsItem.endTime.split(":");
    String endTimeHourData = endTimeSplitData.first;



    bool isInRange = (int.parse(startTimeHourData) >= hour && int.parse(endTimeHourData) <= hour);
    print("check time range 1 = ${int.parse(startTimeHourData)} ----- ${hour}");
    print("check time range 2= ${int.parse(endTimeHourData)} ----- ${hour}");
    print("check time range = $isInRange");

    if(isInRange)
      {
        currentCircleState = true;
      }else{
      currentCircleState = false;
    }*/



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
              TimeLineView(activeTimeLineFlag: eventsItem.currentTimeFlag,isBreakPoint: eventsItem.isBreakPoint),
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
  bool isBreakPoint;

  TimeLineView({
    required this.activeTimeLineFlag,
    required this.isBreakPoint
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
          DottedLine(height: 100, color: Colors.black26, strokeWidth: 1,dashLineFlag: false,isBreakPoint: isBreakPoint,),
      ) :
       Container(
        width: 0.3,
        // margin: EdgeInsets.only(right: 50),
        //  child:Image.asset("assets/images/dotted_line.png"),
        child: Stack(
          children: [
            DottedLine(height: 100, color: Colors.blue, strokeWidth: 1,dashLineFlag: true,isBreakPoint: isBreakPoint,),
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

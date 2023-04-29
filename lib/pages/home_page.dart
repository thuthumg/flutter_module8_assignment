import 'package:flutter/material.dart';
import 'package:flutter_module8_assignment/constants.dart';
import 'package:flutter_module8_assignment/pages/event_detail_page.dart';
import 'package:flutter_module8_assignment/resources/colors.dart';
import 'package:flutter_module8_assignment/resources/dimens.dart';
import 'package:flutter_module8_assignment/widgets/delay_circular_progress_indicator.dart';
import 'package:flutter_module8_assignment/widgets/time_and_event_list_custom_layout.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/my_patients_horizontal_list_view.dart';

class HomePage extends StatefulWidget {
  List<Events> listOfEvents = [
    Events(startTime: "08:00",endTime: "08:30", eventName: "Event 1", currentTimeFlag: true),
    Events(startTime: "09:00",endTime: "09:30", eventName: "Event 2", currentTimeFlag: false),
    Events(startTime: "10:00",endTime: "10:30", eventName: "Event 3", currentTimeFlag: false),
    Events(startTime: "11:00",endTime: "11:30", eventName: "Event 4", currentTimeFlag: false),
    Events(startTime: "12:00",endTime: "12:30", eventName: "Event 5", currentTimeFlag: false),
    Events(startTime: "13:00",endTime: "13:30", eventName: "Event 6", currentTimeFlag: false),
    Events(startTime: "14:00",endTime: "14:30", eventName: "Event 7", currentTimeFlag: false),
    Events(startTime: "15:00",endTime: "15:30", eventName: "Event 8", currentTimeFlag: false),
    Events(startTime: "16:00",endTime: "16:30", eventName: "Event 9", currentTimeFlag: false),
    Events(startTime: "17:00",endTime: "17:30", eventName: "Event 10", currentTimeFlag: false),
    Events(startTime: "18:00",endTime: "18:30", eventName: "Event 11", currentTimeFlag: false),
    Events(startTime: "19:00",endTime: "19:30", eventName: "Event 12", currentTimeFlag: false),
    Events(startTime: "20:00",endTime: "20:30", eventName: "Event 13", currentTimeFlag: false)
  ];

  List<Events> listOfEventsNew = [];
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  @override
  void initState() {


    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    DateTime now = DateTime.now();
    int hour = now.hour;
    int minutes = now.minute;


    for(int i = 0; i< widget.listOfEvents.length;i++)

    {
      List<String> startTimeSplitData =  widget.listOfEvents[i].startTime.split(":");
      String startTimeHourData = startTimeSplitData.first;
      String startTimeMinuteData = startTimeSplitData.last;

      List<String> endTimeSplitData =  widget.listOfEvents[i].endTime.split(":");
      String endTimeHourData = endTimeSplitData.first;
      String endTimeMinuteData = endTimeSplitData.last;


// Define the time range from 10:30 AM to 11:00 AM
      TimeOfDay rangeStart = TimeOfDay(hour: int.parse(startTimeHourData), minute: int.parse(startTimeMinuteData));
      TimeOfDay rangeEnd = TimeOfDay(hour: int.parse(endTimeHourData), minute: int.parse(endTimeMinuteData));

// Convert current time to TimeOfDay object
      TimeOfDay currentTime = TimeOfDay.fromDateTime(now);

// Check if current time is within the specified range
      //  bool isInRange = ((currentTime >= rangeStart) && (currentTime <= rangeEnd));
      // bool isInRange = (int.parse(startTimeHourData) >= hour && int.parse(endTimeHourData) <= hour);
      bool isInRange = (hour > int.parse(startTimeHourData));
// Output the result
      if (isInRange) {
        print('The current time is within the specified range.');
        widget.listOfEventsNew.add(Events(startTime: widget.listOfEvents[i].startTime,
            endTime: widget.listOfEvents[i].endTime, eventName: widget.listOfEvents[i].eventName, currentTimeFlag: true));
        //  widget.listOfEvents[i].currentTimeFlag = true;
        // break;

      } else {
        print('The current time is not within the specified range.');
        widget.listOfEventsNew.add(Events(startTime: widget.listOfEvents[i].startTime,
            endTime: widget.listOfEvents[i].endTime, eventName: widget.listOfEvents[i].eventName, currentTimeFlag: false));
        // widget.listOfEvents[i].currentTimeFlag = false;
      }

    }
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Positioned(
          left: 0.0,
          top: 0.0,
          right: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                  Color.fromRGBO(25, 91, 183, 1),
                  Color.fromRGBO(18, 17, 151, 1)
                ])),
            // color: BACKGROUND_COLOR,
          ),
        ),
        Positioned(
          left: 0.0,
          top: 250.0,
          right: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color.fromRGBO(223, 235, 249, 1),
            // color: BACKGROUND_COLOR,
          ),
        ),
        Container(
          // color: Colors.lightBlue,
          margin: EdgeInsets.only(left: MARGIN_MEDIUM),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SearchView(),
              MyPatientsView(),
              Container(
                height: 150,
                width: double.infinity,
                margin: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                // color: Colors.blue,
                child: MyPatientsHorizontalListView(
                  backgroundColor: Color.fromRGBO(26, 105, 198, 1),
                  isDetailFlag: false,
                  listOfMyPatient: listOfPatients
                ),
              ),
              Row(

                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Time",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: TEXT_REGULAR_2X,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(width: 30,),
                  Text(
                    "Event",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: TEXT_REGULAR_2X,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Expanded(child: TimeAndEventListCustomLayout(listOfEvents: widget.listOfEventsNew,
              onTapEvent: (){
                navigateToEventDetailScreen(context);
              },
                onLoadMoreEvent: (){
                return Fluttertoast.showToast(
                  msg: 'Load More Event Trigger',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.SNACKBAR,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
                },
                onRefreshEvent: (){
                  print("onRefresh");
                 return DelayedCircularProgressIndicator(delay: 3000,);
                },
                onEmptyView: (){
                  return Fluttertoast.showToast(
                    msg: 'Empty Event',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.SNACKBAR,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                },

              ))
            ],
          ),
        )
      ],
    ));
  }

  Future<dynamic> navigateToEventDetailScreen(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EventDetailPage()),
    );
  }
}

class MyPatientsView extends StatelessWidget {
  const MyPatientsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MARGIN_MEDIUM),
      height: 70,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "My Patients",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "12 Totals",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                margin: EdgeInsets.all(8.0),
                height: 40,
                width: MediaQuery.of(context).size.width * 0.25,
                // color: Colors.white10,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(65, 135, 248, 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: MARGIN_MEDIUM_3, right: MARGIN_MEDIUM_3),
                  child: Stack(
                    children: const [
                      Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            "Today",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          )),
                      Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40.0),
      height: 70,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(8.0),
            height: 40,
            width: MediaQuery.of(context).size.width * 0.80,
            // color: Colors.white10,
            decoration: BoxDecoration(
              color: SEARCH_BOX_COLOR,
              borderRadius: BorderRadius.circular(60),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: MARGIN_MEDIUM_3, right: MARGIN_MEDIUM_3),
              child: Stack(
                children: [
                  Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "Search",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      )),
                  Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          ),
          Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/profile_sample.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}

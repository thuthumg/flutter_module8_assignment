
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_module8_assignment/constants.dart';
import 'package:flutter_module8_assignment/resources/dimens.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyPatientsHorizontalListView extends StatelessWidget {
  final Color backgroundColor;
  final bool isDetailFlag;
  List<MyPatient> listOfMyPatient;

  MyPatientsHorizontalListView(
      {required this.backgroundColor,
        required this.isDetailFlag,
        required this.listOfMyPatient});

  @override
  Widget build(BuildContext context) {

    if(listOfMyPatient != null && listOfMyPatient.length != 0)
      {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: listOfMyPatient.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
              // onTapMovie(listOfMyPatient?[index].id)
              },
              child: HorizontalListEachItemView(
                backgroundColor: backgroundColor,
                myPatient: listOfMyPatient[index],
                isDetailFlag: isDetailFlag,
              ),
            );
          },
        );
      }else{
      return
        Center(child: CircularProgressIndicator());
    }


  }
}

class NumberGenerator {
  Future<List<String>> slowNumbers() async {
    return Future.delayed(const Duration(milliseconds: 1000), () => numbers,);
  }

  List<String> get numbers => List.generate(5, (index) => number);


  String get number => Random().nextInt(99999).toString();
}
class HorizontalListEachItemView extends StatelessWidget {
  final Color backgroundColor;
  final MyPatient myPatient;
  final bool isDetailFlag;

  HorizontalListEachItemView(
      {required this.backgroundColor,
        required this.myPatient,
        required this.isDetailFlag});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: 300,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Visibility(
            visible: !isDetailFlag,
            child: Container(
              width: 10,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(99, 168, 252, 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(MARGIN_MEDIUM_3), //MARGIN_MEDIUM_3
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: !isDetailFlag,
                  child: TitleView(myPatient: myPatient),
                ),
                Visibility(
                  visible: !isDetailFlag,
                  child: const SizedBox(
                    height: MARGIN_MEDIUM,
                  ),
                ),
                Container(
                    width: 250,
                    child: TimeView(
                        isDetailFlag: isDetailFlag, myPatient: myPatient)),
                SizedBox(
                  height: MARGIN_MEDIUM,
                ),
                Visibility(
                  visible: !isDetailFlag,
                  child: PatientProfileImgeListViewAndMarkView(),
                ),
                Visibility(
                  visible: isDetailFlag,
                  child: EventTitleView(myPatient: myPatient),
                ),
                Visibility(
                  visible: isDetailFlag,
                  child: SizedBox(
                    height: 5,
                  ),
                ),
                Visibility(
                  visible: isDetailFlag,
                  child: EventDescriptionView(myPatient: myPatient),
                ),
                Visibility(
                  visible: isDetailFlag,
                  child: PatientProfileImageViewAndPatientNameView(myPatient: myPatient),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}

class EventTitleView extends StatelessWidget {
  const EventTitleView({
    super.key,
    required this.myPatient,
  });

  final MyPatient myPatient;

  @override
  Widget build(BuildContext context) {
    return Text(
      myPatient.eventTitle,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.black87,
        fontSize: TEXT_REGULAR_2X,
      ),
    );
  }
}

class EventDescriptionView extends StatelessWidget {
  const EventDescriptionView({
    super.key,
    required this.myPatient,
  });

  final MyPatient myPatient;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 250,
        child: Text(
          maxLines: 3,
          myPatient.eventDescription,
          overflow: TextOverflow.ellipsis,
         // textDirection: TextDirection.rtl,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black38,
            fontSize: TEXT_SMALL,
          ),
        ),
      ),
    );
  }
}

class PatientProfileImageViewAndPatientNameView extends StatelessWidget {
  const PatientProfileImageViewAndPatientNameView({
    super.key,
    required this.myPatient,
  });

  final MyPatient myPatient;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          children: [
            Container(
              height: 30.0,
              width: 30.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/profile_sample.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10,),
            Text(
              myPatient.patientName,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black26,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleView extends StatelessWidget {
  const TitleView({
    super.key,
    required this.myPatient,
  });

  final MyPatient myPatient;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: myPatient.title,
        style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.w500),
        children: <TextSpan>[
          TextSpan(
            text: " /3 patients",
            style: TextStyle(
                color: Colors.white70,
                fontSize: TEXT_REGULAR,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

class TimeView extends StatelessWidget {
  const TimeView({
    super.key,
    required this.isDetailFlag,
    required this.myPatient,
  });

  final bool isDetailFlag;
  final MyPatient myPatient;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  color: isDetailFlag ? Colors.grey : Colors.white70,
                  size: 15,
                ),
                SizedBox(
                  width: MARGIN_MEDIUM,
                ),
                Text(
                  myPatient.timeRange,
                  style: TextStyle(
                      color: isDetailFlag ? Colors.grey : Colors.white70,
                      fontSize: TEXT_SMALL,
                      fontWeight: FontWeight.w400),
                ),
                Visibility(
                    visible: isDetailFlag,
                    child: SizedBox(
                      width: MARGIN_MEDIUM_3,
                    )),
              ],
            )
          ],
        ),
        Column(
          children: [
            Visibility(
              visible: isDetailFlag,
              child: ConfirmStatusView(),
            )
          ],
        )
      ],
    );
  }
}

class ConfirmStatusView extends StatelessWidget {
  const ConfirmStatusView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      height: 30,
      //width: MediaQuery.of(context).size.width * 0.25,
      // color: Colors.white10,
      decoration: BoxDecoration(
        color: Color.fromRGBO(214, 246, 230, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            "Confirmed",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(181, 219, 202, 1),
              fontSize: TEXT_SMALL,
            ),
          ),
        ),
      ),
    );
  }
}

class PatientProfileImgeListViewAndMarkView extends StatelessWidget {
  const PatientProfileImgeListViewAndMarkView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.50,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/profile_sample.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }),
        ),
        Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(99, 168, 252, 1),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Icon(
            Icons.check,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

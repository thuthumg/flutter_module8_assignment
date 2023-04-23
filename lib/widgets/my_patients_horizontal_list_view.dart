
import 'package:flutter/material.dart';
import 'package:flutter_module8_assignment/constants.dart';
import 'package:flutter_module8_assignment/resources/dimens.dart';

class MyPatientsHorizontalListView extends StatelessWidget {


  final Color backgroundColor;
  final bool isDetailFlag;
   List<MyPatient> listOfMyPatient;

  MyPatientsHorizontalListView({
   required this.backgroundColor,
    required this.isDetailFlag,
    required this.listOfMyPatient
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            // widget.onTapCity(widget.citiesList.elementAt(index));
          },
          child: HorizontalListEachItemView(
            backgroundColor: backgroundColor,
            myPatient: listOfMyPatient[index],
          isDetailFlag: isDetailFlag,),
        );
      },
    );
  }
}

class HorizontalListEachItemView extends StatelessWidget {
  final Color backgroundColor;
  final MyPatient myPatient;
  final bool isDetailFlag;

  HorizontalListEachItemView({
    required this.backgroundColor,
    required this.myPatient,
    required this.isDetailFlag
  });

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
                    topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(MARGIN_MEDIUM_3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                    visible: !isDetailFlag,
                    child: RichText(
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
                ))

                ,
                const SizedBox(
                  height: MARGIN_MEDIUM,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Colors.white70,
                      size: 18,
                    ),
                    SizedBox(
                      width: MARGIN_MEDIUM,
                    ),
                    Text(
                      myPatient.timeRange,
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: TEXT_REGULAR,
                          fontWeight: FontWeight.w400),
                    ),
                    Visibility(
                        visible: isDetailFlag,
                        child:SizedBox(
                      width: MARGIN_MEDIUM_3,
                    )
                    ),
                    Visibility(
                      visible: isDetailFlag,
                      child: Container(
                        margin: EdgeInsets.all(8.0),
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.25,
                        // color: Colors.white10,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(214, 246, 230, 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          "Confirmed",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(181, 219, 202, 1),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: MARGIN_MEDIUM,
                ),
                Visibility(
                  visible: !isDetailFlag,
                  child: Row(
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
                        child: Icon(Icons.check,color: Colors.white,),
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: isDetailFlag,
                  child: Column(
                    children: [
                      Text(
                        myPatient.eventTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black26,
                          fontSize: MARGIN_MEDIUM_3,
                        ),
                      ),
                      Text(
                       myPatient.eventDescription,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40,
                           // width: MediaQuery.of(context).size.width * 0.50,
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
                           // width: 30,
                           // height: 30,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(99, 168, 252, 1),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Text(
                              myPatient.patientName,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black26,
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

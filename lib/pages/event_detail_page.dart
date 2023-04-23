import 'package:flutter/material.dart';
import 'package:flutter_module8_assignment/constants.dart';
import 'package:flutter_module8_assignment/resources/colors.dart';
import 'package:flutter_module8_assignment/resources/dimens.dart';
import 'package:flutter_module8_assignment/widgets/custom_time_circle_painter.dart';
import 'package:flutter_module8_assignment/widgets/my_patients_horizontal_list_view.dart';

class EventDetailPage extends StatelessWidget{

  List<MyPatient> listOfPatients1 = [
    MyPatient(title: "Office No.248", timeRange: "8:30AM - 02:00PM", eventTitle: "Teeth Drilling", eventDescription: "A dental drill or handpiece is a hand-held, mechanical instrument used to perform a variety of common dental procedures, including removing decay, polishing fillings, performing cosmetic dentistry, and altering prostheses. The handpiece itself consists of internal mechanical components which initiate a rotational force and provide power to the cutting instrument, usually a dental burr. ", patientProfile: 'assets/profile_sample.jpg', patientName: "Alex"),
    MyPatient(title: "Office No.248", timeRange: "9:30AM - 03:00PM", eventTitle: "Teeth Drilling", eventDescription: "A dental drill or handpiece is a hand-held, mechanical instrument used to perform a variety of common dental procedures, including removing decay, polishing fillings, performing cosmetic dentistry, and altering prostheses. The handpiece itself consists of internal mechanical components which initiate a rotational force and provide power to the cutting instrument, usually a dental burr. ", patientProfile: 'assets/profile_sample.jpg', patientName: "Alexander"),
    MyPatient(title: "Office No.248", timeRange: "10:30AM - 04:00PM", eventTitle: "Teeth Drilling", eventDescription: "A dental drill or handpiece is a hand-held, mechanical instrument used to perform a variety of common dental procedures, including removing decay, polishing fillings, performing cosmetic dentistry, and altering prostheses. The handpiece itself consists of internal mechanical components which initiate a rotational force and provide power to the cutting instrument, usually a dental burr. ", patientProfile: 'assets/profile_sample.jpg', patientName: "Vera"),
    MyPatient(title: "Office No.248", timeRange: "11:30AM - 05:00PM", eventTitle: "Teeth Drilling", eventDescription: "A dental drill or handpiece is a hand-held, mechanical instrument used to perform a variety of common dental procedures, including removing decay, polishing fillings, performing cosmetic dentistry, and altering prostheses. The handpiece itself consists of internal mechanical components which initiate a rotational force and provide power to the cutting instrument, usually a dental burr. ", patientProfile: 'assets/profile_sample.jpg', patientName: "Alex"),
    MyPatient(title: "Office No.248", timeRange: "12:30AM - 06:00PM", eventTitle: "Teeth Drilling", eventDescription: "A dental drill or handpiece is a hand-held, mechanical instrument used to perform a variety of common dental procedures, including removing decay, polishing fillings, performing cosmetic dentistry, and altering prostheses. The handpiece itself consists of internal mechanical components which initiate a rotational force and provide power to the cutting instrument, usually a dental burr. ", patientProfile: 'assets/profile_sample.jpg', patientName: "Alex"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:  Color.fromRGBO(18, 17, 151, 1),
        centerTitle: true,
        title: Text(
          "Today",
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        leading: Icon(Icons.arrow_back,color: Colors.white,),
        actions: [
          Icon(Icons.search,color: Colors.white,),
          SizedBox(width: 10,),
          Icon(Icons.menu_rounded,color: Colors.white,)

        ],
      ),
        body: Stack(
          children: <Widget>[
            const Positioned(
              left: 0.0,
              top: 0.0,
              right: 0,
              child: PartOneBackground(),
            ),
            const Positioned(
              left: 0.0,
              top: 240.0,
              right: 0,
              child: PartTwoBackground(),
            ),
            Container(
              // color: Colors.lightBlue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 70,
                    child: const Padding(
                      padding: EdgeInsets.only(top: MARGIN_MEDIUM_2,left: MARGIN_MEDIUM_2),
                      child: EventInformationView(),
                    ),
                  ),
                  /*Container(
                    height: 70,
                    child: Row(
                      children: [Text("Filter....")],
                    ),
                  ),*/
                  SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.all(MARGIN_LARGE),
                    child: Container(
                      height: 130,
                      width: double.infinity,
                      margin: EdgeInsets.all(MARGIN_LARGE),
                      child:  CustomPaintCircleView()
                    ),
                  ),

                  Container(
                    height: 200,
                    child: MyPatientsHorizontalListView(
                      backgroundColor: Color.fromRGBO(26, 105, 198, 1),
                      isDetailFlag: true,
                      listOfMyPatient: listOfPatients1,
                    ),
                  )
                  // listOfPatients.length != null ?
                  // Expanded(
                  //     child: Container(
                  //       margin: EdgeInsets.only(top: 50),
                  //         height: 200,
                  //        child:
                  //         MyPatientsHorizontalListView(
                  //           backgroundColor: Color.fromRGBO(26, 105, 198, 1),
                  //           isDetailFlag: true,
                  //           listOfMyPatient: listOfPatients1,
                  //         ),
                  //     ))
                  //     :
                  //     Container(
                  //       height: 200,
                  //     )
                ],
              ),
            ),
        Positioned(
              left: 70.0,
              top: 300.0,
              //right: 230,
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 4,
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/profile_sample.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
        Positioned(
             // left: 0.0,
              top: 350.0,
              right: 170,
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 4,
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/profile_sample.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
        Positioned(
         // left: 0.0,
          top: 150.0,
          right: 30,
          child: Container(
            height: 50.0,
            width: 50.0,
            decoration:  BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 4,
              ),
              image: DecorationImage(
                image: AssetImage('assets/profile_sample.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
               left: 180.0,
              top: 200.0,
            //  right: 0.0,
              child: Container(
                 child: Column(
                   children: const [
                     Text(
                       "2:45",
                       style: TextStyle(
                           color: Colors.white,
                           fontSize: TEXT_HEADING_2X,
                           fontWeight: FontWeight.bold),
                     ),
                     Text(
                       "PM",
                       style: TextStyle(
                           color: Colors.white70,
                           fontSize: TEXT_REGULAR,
                           fontWeight: FontWeight.w400),
                     )
                   ],
                 )
              ),
            )
          ],
        ));
  }

}

class CustomPaintCircleView extends StatelessWidget {
  const CustomPaintCircleView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(100,100),
      painter: CustomTimeCirclePainter(),
    );
  }
}

class EventInformationView extends StatelessWidget {
  const EventInformationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Office No.248",
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
          "3 Patients",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontSize: 10,
          ),
        )
      ],
    );
  }
}

class PartTwoBackground extends StatelessWidget {
  const PartTwoBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Color.fromRGBO(12, 68, 145, 1),
    );
  }
}

class PartOneBackground extends StatelessWidget {
  const PartOneBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height * 0.5,
      height: 240,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(18, 17, 151, 1),
                  Color.fromRGBO(25, 91, 183, 1),

                ]))

    );
  }
}
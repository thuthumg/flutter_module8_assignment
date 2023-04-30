import 'package:flutter/material.dart';

class Events {
   String startTime;
   String endTime;
   String eventName;
   bool currentTimeFlag;
   bool isBreakPoint;

  Events({required this.startTime,required this.endTime,
    required this.eventName, required this.currentTimeFlag,
  required this.isBreakPoint});

   @override
  String toString() {
    return 'Events{startTime: $startTime, endTime: $endTime, eventName: $eventName, currentTimeFlag: $currentTimeFlag, isBreakPoint: $isBreakPoint}';
  }
}

class MyPatient {
  final String title;
  final String timeRange;
  final String eventTitle;
  final String eventDescription;
  final String patientProfile;
  final String patientName;

  MyPatient({
    required this.title,
    required this.timeRange,
    required this.eventTitle,
    required this.eventDescription,
    required this.patientProfile,
    required this.patientName,});

}

/*
final List<Events> listOfEvents = [
  Events(startTime: "8:00pm",endTime: "8:30pm", eventName: "Event 1", currentTimeFlag: true),
  Events(startTime: "9:00pm",endTime: "9:30pm", eventName: "Event 2", currentTimeFlag: false),
  Events(startTime: "10:00pm",endTime: "10:30pm", eventName: "Event 3", currentTimeFlag: false),
  Events(startTime: "11:00pm",endTime: "11:30pm", eventName: "Event 4", currentTimeFlag: false),
  Events(startTime: "11:00pm",endTime: "11:30pm", eventName: "Event 4", currentTimeFlag: false),

];
*/
final List<MyPatient> listOfPatients = [
  MyPatient(title: "Office No.248", timeRange: "8:30AM - 02:00PM", eventTitle: "Teeth Drilling", eventDescription: "A dental drill or handpiece is a hand-held, mechanical instrument used to perform a variety of common dental procedures, including removing decay, polishing fillings, performing cosmetic dentistry, and altering prostheses. The handpiece itself consists of internal mechanical components which initiate a rotational force and provide power to the cutting instrument, usually a dental burr. ", patientProfile: 'assets/profile_sample.jpg', patientName: "Alex"),
  MyPatient(title: "Office No.248", timeRange: "9:30AM - 03:00PM", eventTitle: "Teeth Drilling", eventDescription: "A dental drill or handpiece is a hand-held, mechanical instrument used to perform a variety of common dental procedures, including removing decay, polishing fillings, performing cosmetic dentistry, and altering prostheses. The handpiece itself consists of internal mechanical components which initiate a rotational force and provide power to the cutting instrument, usually a dental burr. ", patientProfile: 'assets/profile_sample.jpg', patientName: "Alexander"),
  MyPatient(title: "Office No.248", timeRange: "10:30AM - 04:00PM", eventTitle: "Teeth Drilling", eventDescription: "A dental drill or handpiece is a hand-held, mechanical instrument used to perform a variety of common dental procedures, including removing decay, polishing fillings, performing cosmetic dentistry, and altering prostheses. The handpiece itself consists of internal mechanical components which initiate a rotational force and provide power to the cutting instrument, usually a dental burr. ", patientProfile: 'assets/profile_sample.jpg', patientName: "Vera"),
  MyPatient(title: "Office No.248", timeRange: "11:30AM - 05:00PM", eventTitle: "Teeth Drilling", eventDescription: "A dental drill or handpiece is a hand-held, mechanical instrument used to perform a variety of common dental procedures, including removing decay, polishing fillings, performing cosmetic dentistry, and altering prostheses. The handpiece itself consists of internal mechanical components which initiate a rotational force and provide power to the cutting instrument, usually a dental burr. ", patientProfile: 'assets/profile_sample.jpg', patientName: "Alex"),
  MyPatient(title: "Office No.248", timeRange: "12:30AM - 06:00PM", eventTitle: "Teeth Drilling", eventDescription: "A dental drill or handpiece is a hand-held, mechanical instrument used to perform a variety of common dental procedures, including removing decay, polishing fillings, performing cosmetic dentistry, and altering prostheses. The handpiece itself consists of internal mechanical components which initiate a rotational force and provide power to the cutting instrument, usually a dental burr. ", patientProfile: 'assets/profile_sample.jpg', patientName: "Alex"),
];



List<String>  testFunction() {
  List<String> timesInterval = [];
  final interval = const Duration(minutes: 30);
  final startTime = TimeOfDay(hour: 8, minute: 0);
  final endTime = TimeOfDay(hour: 16, minute: 0);

  var time = startTime;
  while (time.hour < endTime.hour ||
      (time.hour == endTime.hour && time.minute <= endTime.minute)) {
    // Do something with `time`
    time = time.replacing(
      hour: (time.hour + (time.minute + interval.inMinutes) ~/ 60) % 24,
      minute: (time.minute + interval.inMinutes) % 60,
    );
    // Output: "10:30 AM"
    // print("time = "+ time.format(context));
    final timeString =
        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    print("time = " + timeString);
    timesInterval.add(timeString);
  }

 // final List<String> times = ['10:00', '11:00', '10:30', '11:30', '12:00', '11:00', '12:30'];
  final Map<String, List<String>> timeIntervals1 = {};

  for (final time in timesInterval) {
    final hourMinute = time.split(':');
    final hour = hourMinute[0];
    final minute = hourMinute[1];
    final formattedTime = '$hour:$minute';

    if (!timeIntervals1.containsKey(formattedTime)) {
      timeIntervals1[formattedTime] = [];
    }

    timeIntervals1[formattedTime]!.add(time);
  }

  print(timeIntervals1);

  return timesInterval;
}

// void setUpData(){
//   List<String> timesIntervalList = testFunction();
//   List<Events> listOfEvents = [];
//   for (int i = 0; i < timesIntervalList.length; i++) {
//        listOfEvents.add(
//            Events(startTime: "8:00pm",endTime: "8:30pm", eventName: "Event 1", description: "")
//     );
//   }
//
//
// }
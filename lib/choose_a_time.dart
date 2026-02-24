import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_6/no_trips_available.dart';
import 'package:intl/intl.dart'; // for time formatting

class ChooseATime extends StatefulWidget {
  const ChooseATime({super.key});

  @override
  State<ChooseATime> createState() => _ChooseATimeState();
}

class _ChooseATimeState extends State<ChooseATime> {
  final Duration tripDuration = const Duration(hours: 1, minutes: 10);

  bool isPickupSelected = true;
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
DateTime now = DateTime.now();
DateTime displayTime;

// PICK-UP selected → show drop-off in text (now + 1h10m)
// DROP-OFF selected → show pick-up in text (now)
displayTime = isPickupSelected ? now.add(tripDuration) : now;

String formattedTime = DateFormat('h:mm a').format(displayTime);

    String label = isPickupSelected ? "pick-up time" : "drop-off time";

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
   elevation: 0,
surfaceTintColor: Colors.transparent,

        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
              const Text(
                "Choose a time",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
              ),
        
              const SizedBox(height: 25),
        
              // -------------------------
              // PICKUP/DROPOFF SWITCH
              // -------------------------
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                       onTap: () {
          setState(() {
            isPickupSelected = true;
            dateTime = DateTime.now(); // <-- forces picker to show current time
          });
        },
        
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: 45,
                          margin: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: isPickupSelected
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            border: isPickupSelected
                                ? Border.all(color: Colors.black, width: 1)
                                : null,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Pick-up at",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: isPickupSelected
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
        
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
          setState(() {
            isPickupSelected = false;
            dateTime = DateTime.now().add(tripDuration); // <-- forces picker to show +1h10m
          });
        },
        
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: 45,
                          margin: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: !isPickupSelected
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            border: !isPickupSelected
                                ? Border.all(color: Colors.black, width: 1)
                                : null,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Drop-off by",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: !isPickupSelected
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        
              const SizedBox(height: 30),
        
              // -------------------------
              // TIME PICKER
              // -------------------------
              SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  key: ValueKey(isPickupSelected),  
                  initialDateTime: isPickupSelected ? now : now.add(tripDuration),
        
                  mode: CupertinoDatePickerMode.dateAndTime,
                  use24hFormat: false,
                  onDateTimeChanged: (DateTime newDateTime) {
                    setState(() {
                      dateTime = newDateTime;
                    });
                  },
                ),
              ),
        
              // ⭐ MOVED UP — NOW DIRECTLY UNDER PICKER
              const SizedBox(height: 10),
        
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "$formattedTime IST $label",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "About 1 hr 10 min trip",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
        
              const Spacer(),
        
              // ⭐ MOVED DOWN — NOW ABOVE THE NEXT BUTTON
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                  children: [
                    TextSpan(
                      text:
                          "Times are estimated based on predicted traffic. Actual traffic may impact your drop-off time. No cancellation fee up to an hour before pick-up or at any time before your driver is assigned. ",
                    ),
                    TextSpan(
                      text: "See Terms",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
        
              const SizedBox(height: 15),
        
              // -------------------------
              // NEXT BUTTON
              // -------------------------
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const NoTripsAvailable(), // your page
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0); // bottom
          const end = Offset.zero;        // top
          final tween = Tween(begin: begin, end: end)
              .chain(CurveTween(curve: Curves.easeOut));
        
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 20),
            ),
          );
        },
        
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

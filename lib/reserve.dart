import 'package:flutter/material.dart';
import 'package:flutter_6/reserve_a_trip.dart';


class Reserve extends StatefulWidget {
  const Reserve({super.key});

  @override
  State<Reserve> createState() => _ReserveState();
}

class _ReserveState extends State<Reserve> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Stack(
          children: [
            Container(
        height: 300,
        width: double.infinity,
        child: Image.asset(
          "assets/images/reserve.png",
          fit: BoxFit.fill,
        ),
            ),
        
            // ← BACK BUTTON
            Positioned(
        top: 40,
        left: 16,
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white
            ),
            child: Icon(Icons.arrow_back, color: Colors.black, size: 20),
          ),
        ),
            ),
          ],
        ),
        
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Reserve",style: TextStyle(fontSize: 38,fontWeight: FontWeight.bold,color: Colors.black),),
              ),
            
              SizedBox(height: 10,),
              ListTile(
                leading: Icon(Icons.calendar_today_outlined),
                title: Text("Choose your exact pick-up time to 90",style: TextStyle(fontSize: 14),),
                subtitle:Text("days in advance",style: TextStyle(fontSize: 14),) ,
              ),
              Divider(indent: 55,),
           
              ListTile(
                leading: Icon(Icons.hourglass_top_outlined
                ),
                title: Text("Extra wait time included to meet your trip",style: TextStyle(fontSize: 14),),
              ),
               
              Spacer(),
          
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(6),
                    ),
                  ),
        
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReserveATrip()),
                    );
                  },
                  child: Center(
                    child: Text("Reserve a trip", style: TextStyle(fontSize: 18)),
                  ),
                ),
              ),
            )
        
          ],
        ),
      ),
    );
  }
}
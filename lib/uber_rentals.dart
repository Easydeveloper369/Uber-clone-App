import 'package:flutter/material.dart';
import 'package:flutter_6/how_much_time.dart';


class UberRentals extends StatefulWidget {
  const UberRentals({super.key});

  @override
  State<UberRentals> createState() => _UberRentalsState();
}

class _UberRentalsState extends State<UberRentals> {
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
                    "assets/images/uber_rentals.png",
                    fit: BoxFit.fill,
                  ),
                ),
        
                // BACK BUTTON
                Positioned(
                  top: 50, // adjust for notch
                  left: 15,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 22,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Uber Rentals",style: TextStyle(fontSize: 38,fontWeight: FontWeight.bold,color: Colors.black),),
              ),
               SizedBox(height: 10,),
              ListTile(
                leading: Icon(Icons.hourglass_top_outlined),
                title: Text("Keep a car and driver for up to 12 hours",style: TextStyle(fontSize: 14),),
                
              ),
            
              SizedBox(height: 10,),
              ListTile(
                leading: Icon(Icons.card_travel_outlined),
                title: Text("Ideal for business meetings, tourist travel and",style: TextStyle(fontSize: 14),),
                subtitle:Text("multiple stop trips",style: TextStyle(fontSize: 14),) ,
              ),
              Divider(indent: 55,),
           
              ListTile(
                leading: Icon(Icons.back_hand_outlined
                ),
                title: Text("As many stops as you need",style: TextStyle(fontSize: 14),),
              ),
               
              Spacer(),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(height: 55,
                  child: ElevatedButton(
                  
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(6)
                      )
                    ),
                    
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HowMuchTime()));
                    }, child: Row(
                    children: [
                      
                      SizedBox(width: 20,),
                      Spacer(),
                      Text("Get started", style: TextStyle(
                        fontSize:18
                      ),), 
                      Spacer(),
                      Icon(Icons.arrow_forward)
                    ],
                  )),
                ),
              ),
        
          ],
        ),
      ),

    );
  }
}
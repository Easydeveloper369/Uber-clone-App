import 'package:flutter/material.dart';
import 'package:flutter_6/sign_in1.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:country_picker/country_picker.dart';

class Continue extends StatefulWidget {
  const Continue({super.key});

  @override
  State<Continue> createState() => _ContinueState();
}

class _ContinueState extends State<Continue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(                     // <-- Added
        child: SingleChildScrollView(     // <-- Added
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                height: 580,
                width: double.infinity,
                child: Image.asset("assets/images/traffic.png", fit: BoxFit.cover,)
              ),

              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Get started with Uber",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black
                  ),
                ),
              ),

              SizedBox(height: 11,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)   // <-- fixed syntax also
                      )
                    ),
                    onPressed: () {
                      Get.to(() => SignIn1(),
                        transition: Transition.downToUp,
                        duration: Duration(seconds: 1)
                      );
                    },
                    child: Row(
                      children: [
                        SizedBox(width: 20,),
                        Spacer(),
                        Text("Continue", style: TextStyle(fontSize:18)),
                        SizedBox(width: 60,),
                        Spacer(),
                        Icon(Icons.arrow_forward)
                      ],
                    )
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

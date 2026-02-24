import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_6/continue.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
 
 @override
  void initState() {
    // TODO: implement initState
    navigate();
    super.initState();
  }
 void navigate(){
  Future.delayed(Duration(seconds: 5)).then((_){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Continue()));
  });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 backgroundColor: Colors.black,
 body:   Center(
   child: FadeOut(
            animate: true,
            delay: Duration(seconds: 3),
            duration: Duration(seconds: 1),
   
            child:Image.network("https://image-cdn.hypb.st/https://hypebeast.com/image/2018/09/uber-new-2018-logo-first-look-01.jpg?cbr=1&q=90", height: 180,width: 200,)
            //  Text("Uber",style: GoogleFonts.poppins(
            //   color: Colors.white,
            //   fontSize: 60,
            //   fontWeight: FontWeight.bold
            // ),),
          ),
 ),
 
    );
  }
}
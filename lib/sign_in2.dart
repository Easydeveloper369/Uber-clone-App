import 'package:flutter/material.dart';
import 'package:flutter_6/privacy_review.dart';

class SignIn2 extends StatefulWidget {
  const SignIn2({super.key});

  @override
  State<SignIn2> createState() => _SignIn2State();
}

class _SignIn2State extends State<SignIn2> {
  
  

  IconAlignment _iconAlignment = IconAlignment.end;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 20),
                child: Text("What's your name?", style: TextStyle(fontSize: 22,color: Colors.black, fontWeight: FontWeight.bold,),),
              )
            ,
          
            SizedBox(height: 8,),
          
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text("Let us know how to properly address you", style: TextStyle(
                fontSize: 13,color: const Color.fromARGB(255, 63, 60, 60)
              ),),
            ),
            SizedBox(height: 18,),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 15),
              child: Text("First name"),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: TextFormField(
                
               decoration: InputDecoration(
                
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: "Enter first name",
                hintStyle: TextStyle(color: Colors.grey,
                fontSize: 14
                )
               ),
               
              
              ),
            ),
             SizedBox(height: 10,),
             Padding(
               padding: const EdgeInsets.only(left: 15),
               child: Text("Last name"),
             ),
            SizedBox(height: 7,),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: TextFormField(
              
               decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none, ),
               
                
                hintText: "Enter last name",
                hintStyle: TextStyle(color: Colors.grey,
                 fontSize: 14)
               ),
               
              
              ),
            ),
           
          
              SizedBox(height:360),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: IconButton( 
                      
                      onPressed: (){}
                      ,icon :Icon(Icons.arrow_back,size:28,weight: 100,color: Colors.black,)),
                  ),
                  Spacer(),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: FilledButton.icon(
                          onPressed: () {
                            Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PrivacyReview()),
                      );
                          },
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size.fromHeight(45)),
                            backgroundColor: MaterialStateProperty.all(Colors.black),
                            alignment: Alignment.center,
          
                          
                          ),
                          icon: const Icon(Icons.arrow_forward,size: 18,),
                          
                          label: const Text('Next',style: TextStyle(fontSize: 14,),),
                          iconAlignment: _iconAlignment,
                          
                        ),
                     ),
                ],
              ),
          
          
            ],
          ),
        ),
      ),
    );
  }
}
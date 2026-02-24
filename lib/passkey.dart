import 'package:flutter/material.dart';

class Passkey extends StatefulWidget {
  const Passkey({super.key});

  @override
  State<Passkey> createState() => _PasskeyState();
}

class _PasskeyState extends State<Passkey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("Keep your account secure",style: TextStyle(
                  fontSize: 28, 
                  fontWeight: FontWeight.bold
                ),),
              ),
          
              SizedBox(height: 18,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("To prevent unauthorised access to your account,",style: TextStyle(
                  fontSize: 14, 
                   
                ),),
              ),
           
               Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("choose an authentication method to protect your",style: TextStyle(
                  fontSize: 14, 
                
                ),),
              ),
              
               Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("account",style: TextStyle(
                  fontSize: 14, 
                 fontWeight: FontWeight.w400
                ),),
              ),
              
              SizedBox(height: 18,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
               
                  height: 150,
                  width: 400,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black
                  ),
                  borderRadius: BorderRadius.circular(10),
               
             
                ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
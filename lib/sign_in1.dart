import 'package:flutter/material.dart';
import 'package:flutter_6/sign_in2.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:country_picker/country_picker.dart';

class SignIn1 extends StatefulWidget {
  const SignIn1({super.key});

  @override
  State<SignIn1> createState() => _SignIn1State();
}

class _SignIn1State extends State<SignIn1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 6),
                  child: Text(
                    "Enter your mobile number",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IntlPhoneField(
                    flagsButtonPadding: const EdgeInsets.all(15),
                    dropdownIconPosition: IconPosition.trailing,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.person),
                      hintText: "(201) 555-0123",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                    initialCountryCode: 'IN',
                    showCountryFlag: true,
                    showDropdownIcon: true,
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                ),
            
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
                          MaterialPageRoute(builder: (context) => SignIn2()),
                        );
                      },
                      child: Center(
                        child: Text("Continue", style: TextStyle(fontSize: 18)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
            
                  child: Container(
                    height: 15,
                    width: 15,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Divider(indent: 15)),
                        SizedBox(width: 8),
                        Text("or", style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 8),
                        Expanded(child: Divider(thickness: 1.26, endIndent: 15)),
                      ],
                    ),
                  ),
                ),
            
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.apple, size: 25),
                    SizedBox(width: 3),
                    Text(
                      "Continue with Apple",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 18,
                      width: 18,
            
                      child: Image.asset(
                        "assets/images/facebook1.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Continue with Facebook",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 18,
                      width: 18,
            
                      child: Image.asset(
                        "assets/images/google.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 3),
                    Text(
                      "Continue with Google",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.mail, size: 20),
                    SizedBox(width: 3),
                    Text(
                      "Continue with Email",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
            
                SizedBox(height: 26),
                SizedBox(
                  width: double.infinity,
            
                  child: Container(
                    height: 15,
                    width: 15,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Divider(indent: 15)),
                        SizedBox(width: 8),
                        Text("or", style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 8),
                        Expanded(child: Divider(thickness: 1.26, endIndent: 15)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 26),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search, size: 20),
                    SizedBox(width: 5),
                    Text(
                      "Find my account",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 26),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "By proceeding, you consent to get calls, WhatsApp or"
                     " SMS messages, including by automated dialer, from Uber "
                     "and affiliates to the number provided. Text "'"STOP"'" to"
                     "89203 to opt out.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 13
                  ),),
                ),
                SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: IconButton( 
                    
                    onPressed: (){}
                    ,icon :Icon(Icons.arrow_back,size:28,weight: 100,color: Colors.black,)),
                ),
                SizedBox(height: 18,),
                 Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "This site is protected by reCAPTCHA and the Google "
                     ""
                     ""
                     "",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 13
                  ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

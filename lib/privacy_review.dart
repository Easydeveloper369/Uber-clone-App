import 'package:flutter/material.dart';
import 'package:flutter_6/page_before_welcome.dart';

class PrivacyReview extends StatefulWidget {
  const PrivacyReview({super.key});

  @override
  State<PrivacyReview> createState() => _PrivacyReviewState();
}

class _PrivacyReviewState extends State<PrivacyReview> {
  IconAlignment _iconAlignment = IconAlignment.end;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ✅ PREVENT OVERFLOW
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
          Container(
  height: 200,
  width: double.maxFinite,
  child: Row(
    children: [
      // IMAGE FLEXIBLE
      Flexible(
        flex: 1,
        child: Container(
          height: 170,
          width: 170,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/cardboard and pencil2.png"),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),

      SizedBox(width: 10),

      // TEXT FLEXIBLE WITH AUTO-SCALING
      Flexible(
        flex: 2,
        child: FittedBox(
          alignment: Alignment.centerLeft,
          fit: BoxFit.scaleDown,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Accept Uber's Terms",
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              Text(
                "& Review Privacy",
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              Text(
                "Notice",
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
),

              // ✅ FIXED WRAPPING RICHTEXT
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    children: [
                      TextSpan(
                          text:
                              "By selecting 'I Agree' below, I have reviewed and agree to the "),
                      TextSpan(
                        text: "Terms of Use",
                        style: TextStyle(color: Colors.blue),
                      ),
                      TextSpan(text: " and acknowledge the "),
                      TextSpan(
                        text: "Privacy Notice",
                        style: TextStyle(color: Colors.blue),
                      ),
                      TextSpan(text: ". I am at least 18 years of age."),
                    ],
                  ),
                ),
              ),

              // CHECKBOX
              Padding(
                padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "I agree",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() => isChecked = !isChecked);
                      },
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.black, width: 2),
                        ),
                        child: isChecked
                            ? Icon(Icons.check,
                                size: 20, color: Colors.black)
                            : null,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 250),

              // BUTTONS
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back,
                          size: 28, weight: 100, color: Colors.black),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FilledButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PageBeforeWelcome()),
                        );
                      },
                      style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(Size.fromHeight(45)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        alignment: Alignment.center,
                      ),
                      icon: const Icon(
                        Icons.arrow_forward,
                        size: 18,
                      ),
                      label: const Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
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

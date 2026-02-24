import 'package:flutter/material.dart';
import 'package:flutter_6/welcome_to_uber.dart';

class PageBeforeWelcome extends StatefulWidget {
  const PageBeforeWelcome({super.key});

  @override
  State<PageBeforeWelcome> createState() => _PageBeforeWelcomeState();
}

class _PageBeforeWelcomeState extends State<PageBeforeWelcome> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      _showNotificationDialog();
    });
  }

  // -----------------------------------------------------------
  //      REAL iOS STYLE POPUP (Same as your screenshot)
  // -----------------------------------------------------------
  void _showNotificationDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                color: Color(0xFF2C2C2E),
                borderRadius: BorderRadius.circular(14),
              ),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '"Uber" Would Like to Send You Notifications',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 12),

                  Text(
                    'Notifications may include alerts, sounds and icon badges. '
                    'These can be configured in Settings.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),

                  SizedBox(height: 20),

                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.white24, width: 0.8),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 14),
                              alignment: Alignment.center,
                              child: Text(
                                "Don't Allow",
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Container(
                          width: 0.8,
                          height: 44,
                          color: Colors.white24,
                        ),

                        Expanded(
                          child: InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 14),
                              alignment: Alignment.center,
                              child: Text(
                                "Allow",
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  // -----------------------------------------------------------


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // OVERFLOW FIX IMPLEMENTED HERE
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/images/phone_icon.png",
                          height: 200,
                          width: 200,
                        ),
                      ),
                      SizedBox(height: 80),
        
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Ride easy with real-time trip",
                            style: TextStyle(fontSize: 20)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("updates", style: TextStyle(fontSize: 20)),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Allow Uber push notifications to recieve trip status"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("driver updates, and promotional offers. You can"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("change this in Settings at any time"),
                      ),
                      SizedBox(height: 100),
        
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => WelcomeToUber()),
                              );
                            },
                            child:LayoutBuilder(
          builder: (context, constraints) {
            return Row(
        children: [
          SizedBox(width: constraints.maxWidth * 0.40), // replaces your 200
          Text(
            "Next",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(width: constraints.maxWidth * 0.10), // replaces your 50
          Spacer(),
          Icon(
            Icons.arrow_forward,
            size: 30,
          ),
        ],
            );
          },
        )
        
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

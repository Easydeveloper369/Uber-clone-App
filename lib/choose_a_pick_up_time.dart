import 'package:flutter/material.dart';
import 'package:flutter_6/no_trips_available.dart';
import 'package:flutter_6/sign_in1.dart';

class ChooseAPickUpTimePage extends StatefulWidget {
  const ChooseAPickUpTimePage({Key? key}) : super(key: key);

  @override
  State<ChooseAPickUpTimePage> createState() => _ChooseAPickUpTimePageState();
}

class _ChooseAPickUpTimePageState extends State<ChooseAPickUpTimePage> {
  String _selectedOption = "leave_now";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title below AppBar
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                "Choose a pick-up time",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
        
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 8),
        
                  // Leave Now option
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedOption = "leave_now";
                      });
                    },
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      leading: const Icon(Icons.access_time, size: 20, color: Colors.black),
                      title: const Text(
                        "Leave now",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        "Request a trip, hop in and go",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                      ),
                      trailing: Radio<String>(
                        value: "leave_now",
                        groupValue: _selectedOption,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value!;
                          });
                        },
                        activeColor: Colors.black,
                      ),
                    ),
                  ),
        
                  const Divider(height: 1),
        
                  // Reserve for later option (disabled)
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: Icon(Icons.calendar_today, size: 20, color: theme.disabledColor),
                    title: Text(
                      "Reserve for later",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: theme.disabledColor,
                      ),
                    ),
                    subtitle: Text(
                      "Not available for this pick-up location",
                      style: TextStyle(
                        fontSize: 13,
                        color: theme.disabledColor,
                      ),
                    ),
                    trailing: Radio<String>(
                      value: "reserve_later",
                      groupValue: _selectedOption,
                      onChanged: null, // disabled
                    ),
                  ),
        
                  const SizedBox(height: 16),
                ],
              ),
            ),
        
            // Button at bottom
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 55,
                width: double.infinity,
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
                      MaterialPageRoute(builder: (context) => const NoTripsAvailable()),
                    );
                  },
                  child: const Text("Done", style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

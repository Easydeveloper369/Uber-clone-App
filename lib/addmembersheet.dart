import 'package:flutter/material.dart';

class AddMemberSheet extends StatefulWidget {
  const AddMemberSheet({super.key});

  @override
  State<AddMemberSheet> createState() => _AddMemberSheetState();
}

class _AddMemberSheetState extends State<AddMemberSheet> {
  String selected = "teen";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "Add new member",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
      
            RadioListTile(
              activeColor: Colors.black,
              value: "teen",
              groupValue: selected,
              onChanged: (v) => setState(() => selected = v!),
              title: const Text("Teenager (aged 13–17)"),
              subtitle: const Text("Enhanced safety features"),
            ),
      
            RadioListTile(
                 activeColor: Colors.black,
              value: "adult",
              groupValue: selected,
              onChanged: (v) => setState(() => selected = v!),
              title: const Text("Adult"),
              subtitle: const Text("Adults are 18 and older"),
            ),
      
            RadioListTile(
                 activeColor: Colors.black,
              value: "senior",
              groupValue: selected,
              onChanged: (v) => setState(() => selected = v!),
              title: const Text("Senior"),
              subtitle: const Text("Simplified app for older adults"),
            ),
      
            const SizedBox(height: 15),
      
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: const Text("Continue",
                  style: TextStyle(color: Colors.white)),
            ),
      
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

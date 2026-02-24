import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchDestinationPage extends StatefulWidget {
  @override
  _SearchDestinationPageState createState() => _SearchDestinationPageState();
}

class _SearchDestinationPageState extends State<SearchDestinationPage> {
  TextEditingController searchController = TextEditingController();
  List suggestions = [];

  final String apiKey = "v7sZAOQIvj8JRXvA3syq";

  // Format place names to remove ", India"
  String formatPlaceName(Map item) {
    String full = item["place_name"] ?? "";

    if (!full.contains("India")) return ""; // only India places

    full = full.replaceAll(", India", "");

    return full.trim();
  }

  Future<void> fetchSuggestions(String text) async {
    if (text.isEmpty) {
      setState(() => suggestions = []);
      return;
    }

    final url =
        "https://api.maptiler.com/geocoding/$text.json?key=$apiKey";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List raw = data["features"];

      // Filter only India places
      final filtered = raw.where((item) {
        final p = item["place_name"] ?? "";
        return p.contains("India");
      }).toList();

      setState(() {
        suggestions = filtered;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Destination"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: searchController,
                autofocus: true,
                onChanged: fetchSuggestions,
                onSubmitted: (value) {
                  Navigator.pop(context, value);
                },
                decoration: InputDecoration(
                  hintText: "Search destination",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
        
            Expanded(
              child: ListView.builder(
                itemCount: suggestions.length,
                itemBuilder: (context, index) {
                  final formattedName = formatPlaceName(suggestions[index]);
        
                  if (formattedName.isEmpty)
                    return SizedBox.shrink(); // skip non-India or invalid
        
                  return ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text(formattedName),
                    onTap: () {
                      Navigator.pop(context, formattedName);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

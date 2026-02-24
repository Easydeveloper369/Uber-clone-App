import 'package:flutter/material.dart';

class GetStartedGroupTripSearch extends StatefulWidget {
  const GetStartedGroupTripSearch({super.key});

  @override
  State<GetStartedGroupTripSearch> createState() =>
      _GetStartedGroupTripSearchState();
}

class _GetStartedGroupTripSearchState extends State<GetStartedGroupTripSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔍 Search bar
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Where is your final drop-off?",
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.black54),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
              ),
            ),

            // 📍 Saved places title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text(
                "Saved places",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),

            // 📍 List of saved locations
            Expanded(
              child: ListView(
                children: const [
                  _LocationTile(
                    title: "Kottayam",
                    subtitle: "Kerala",
                    distance: "42 km",
                  ),
                  _LocationTile(
                    title: "LuLu International Shopping Mall",
                    subtitle:
                        "34/1000, Old NH 47, Edappally Junction, Nethaji Nagar, Kochi, Kerala",
                    distance: "86 km",
                  ),
                  _LocationTile(
                    title: "ERNAKULAM SOUTH RAILWAY STATION",
                    subtitle: "Ernakulam South, Kochi, Kerala",
                    distance: "81 km",
                  ),
                  _LocationTile(
                    title: "Aster Medcity",
                    subtitle:
                        "Kuttisahib Road Cheranelloor, South Chittoor, Kochi, Kerala",
                    distance: "89 km",
                  ),
                  _LocationTile(
                    title: "Amrita Hospital, Kochi",
                    subtitle: "Ponekkara Rd, P.O, Edappally, Kochi, Kerala",
                    distance: "87 km",
                  ),
                  Divider(),
                  _SetLocationTile(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 📍 Individual saved place tile
class _LocationTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String distance;

  const _LocationTile({
    required this.title,
    required this.subtitle,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.location_on_outlined, color: Colors.black54),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 13, color: Colors.black54),
      ),
      trailing: Text(
        distance,
        style: const TextStyle(fontSize: 13, color: Colors.black87),
      ),
    );
  }
}

// 🌍 "Set location on map" tile
class _SetLocationTile extends StatelessWidget {
  const _SetLocationTile();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.my_location_outlined, color: Colors.black54),
      title: const Text(
        "Set location on map",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
      onTap: () {},
    );
  }
}

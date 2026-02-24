import 'package:flutter/material.dart';

class ReserveATrip extends StatefulWidget {
  const ReserveATrip({super.key});

  @override
  State<ReserveATrip> createState() => _ReserveATripState();
}

class _ReserveATripState extends State<ReserveATrip> {
  final TextEditingController _fromController =
      TextEditingController(text: "Unnamed Road");
  final TextEditingController _toController = TextEditingController();

  String selectedRider = "me"; // ✅ current rider selection

  final savedPlaces = [
    {'title': 'Kottayam', 'subtitle': 'Kerala', 'distance': '42 km'},
    {
      'title': 'LuLu International Shopping Mall',
      'subtitle':
          '34/100, Old NH 47, Edappally Junction, Nethaji Nagar, Kochi, Kerala',
      'distance': '86 km'
    },
    {
      'title': 'ERNAKULAM SOUTH RAILWAY STATION',
      'subtitle': 'Ernakulam South, Chittoor, Kochi, Kerala',
      'distance': '89 km'
    },
    {
      'title': 'Aster Medcity',
      'subtitle': 'Kuttisahib Road Cheranelloor, South Chittoor, Kochi, Kerala',
      'distance': '86 km'
    },
    {
      'title': 'Amrita Hospital, Kochi',
      'subtitle': 'Ponekkara Rd, P O, Edappally, Kochi, Kerala',
      'distance': '87 km'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 6,
                          offset: const Offset(1, 3),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    "Reserve a trip",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),

            // Sticky section
            Material(
              elevation: 4,
              shadowColor: Colors.black.withOpacity(0.15),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Rider selector capsule
                    GestureDetector(
                      onTap: _showRiderSheet,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade200,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.person,
                                size: 16, color: Colors.black87),
                            const SizedBox(width: 6),
                          Text(
  selectedRider == "me" ? "For me" : "For group trip",
  style: const TextStyle(
    fontSize: 14,
    color: Colors.black87,
    fontWeight: FontWeight.w500,
  ),
),

                            const Icon(Icons.keyboard_arrow_down_rounded,
                                color: Colors.black54, size: 18),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // From / To fields
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              width: 2,
                              height: 40,
                              color: Colors.grey.shade400,
                            ),
                            Container(
                              width: 6,
                              height: 6,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 40,
                                    margin: const EdgeInsets.only(right: 40),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: TextField(
                                      controller: _fromController,
                                      textInputAction: TextInputAction.next,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black87),
                                      decoration: const InputDecoration(
                                        isDense: true,
                                        border: InputBorder.none,
                                        hintText: "Unnamed Road",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    height: 40,
                                    margin: const EdgeInsets.only(right: 40),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: TextField(
                                      controller: _toController,
                                      textInputAction: TextInputAction.done,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black87),
                                      decoration: const InputDecoration(
                                        isDense: true,
                                        border: InputBorder.none,
                                        hintText: "Where to?",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                right: 0,
                                top: 26,
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 4,
                                        offset: const Offset(1, 2),
                                      ),
                                    ],
                                  ),
                                  child: const Icon(Icons.add,
                                      size: 20, color: Colors.black87),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Saved places
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                itemCount: savedPlaces.length,
                itemBuilder: (context, index) {
                  final place = savedPlaces[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            const Icon(Icons.location_on_outlined,
                                color: Colors.black87, size: 26),
                            Text(
                              place['distance']!,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                place['title']!,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                place['subtitle']!,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Divider(height: 20, thickness: 0.5),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ BottomSheet for choosing rider
 
void _showRiderSheet() {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      String tempSelection = selectedRider; // temporary variable for bottom sheet
      return StatefulBuilder(
        builder: (context, setModalState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  alignment: Alignment.center,
                  child: const Text(
                    "Switch rider",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Divider(thickness: 1, height: 1),

                // "Me"
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: const Text("Me",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  trailing: Radio<String>(
                    activeColor: Colors.black,
                    value: "me",
                    groupValue: tempSelection,
                    onChanged: (value) {
                      setModalState(() => tempSelection = value!);
                    },
                  ),
                  onTap: () => setModalState(() => tempSelection = "me"),
                ),
                const Divider(height: 1),

                // "Group Trip"
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.groups_outlined,
                      size: 30, color: Colors.black),
                  title: const Text(
                    "Create a group trip",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  subtitle: const Text(
                    "Share trip info with others coming along for a smoother trip",
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  trailing: Radio<String>(
                     activeColor: Colors.black,
                    value: "group",
                    groupValue: tempSelection,
                    onChanged: (value) {
                      setModalState(() => tempSelection = value!);
                    },
                  ),
                  onTap: () => setModalState(() => tempSelection = "group"),
                ),
                const Divider(height: 1),

                // "Add contact"
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    _showAddContactSheet();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: const [
                        Icon(Icons.person_add_alt_outlined,
                            size: 26, color: Colors.black),
                        SizedBox(width: 12),
                        Text("Add new contact",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // "Done" button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // ✅ Update main state after closing bottom sheet
                      setState(() {
                        selectedRider = tempSelection;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Done",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          );
        },
      );
    },
  );
}

  // ✅ Add Contact BottomSheet
  void _showAddContactSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.black87),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Text(
                      "Choose a rider",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Icon(Icons.person_add_alt_outlined,
                        color: Colors.black87),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.black87.withOpacity(0.8),
                                width: 2),
                          ),
                          child: const Center(
                            child: Text(
                              "!",
                              style: TextStyle(
                                fontSize: 28,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          "To use your device’s contacts, turn on contacts access.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Turn on contact access to set an emergency contact and enhance other features.",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 13, color: Colors.black54),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade200,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            "Device’s access settings",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

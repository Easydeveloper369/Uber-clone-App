import 'package:flutter/material.dart';

class Co2SavedPage extends StatelessWidget {
  const Co2SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ----- FIXED HEADER -----
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Close Button
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),

            const Text(
              "",
              style: TextStyle(color: Colors.white),
            ),

            // Info Button
            IconButton(
              icon: const Icon(Icons.info_outline, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),

      // ----- BODY BELOW HEADER -----
      body: SafeArea(
        child: Column(
          children: [
            // Fixed Green CO₂ Summary Box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: const BoxDecoration(color: Colors.green),
              child: Column(
                children: [
                  // Black pill similar to screenshot
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.eco, color: Colors.white, size: 20),
                        SizedBox(width: 8),
                        Text(
                          "0 g",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
        
                  const SizedBox(height: 10),
                  const Text(
                    "Estimated CO₂ saved",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
        
            // Expanded scrollable area
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
        
                    const// Section title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
        Text(
          "Your eco-friendly rides",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        SizedBox(height: 4),
        
        Text(
          "Rides in low and zero-emission cars contribute to your total CO₂ savings.",
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
            height: 1.3,
          ),
        ),
            ],
          ),
        ),
        
        
                   Container(
          height: 90, // Increase this to make the whole tile taller
          child: ListTile(
            leading: Image.asset(
        'assets/images/co2.png',
        height: 90,     // <-- Increase image height
        fit: BoxFit.cover,
            ),
            title: const Text("Uber Green"),
            subtitle: const Text(
        "Electric vehicles",
        style: TextStyle(fontSize: 12),
            ),
            trailing: const Text("0 g"),
          ),
        )
        ,
        
                    const Divider(thickness: 8,color: Color.fromARGB(255, 241, 241, 241),),
        
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                      child: Text(
                        "10 kg CO₂ is equal to...",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
        
                    buildFact(
                      "assets/images/gas.png",
                      "1.1 gal",
                      "of gas consumed",
                    ),
                    buildFact(
                      "assets/images/driving.png",
                      "28.4 mi",
                      "driven in a gas-powered car",
                    ),
                    buildFact(
                      "assets/images/waste.png",
                      "7.7 lb",
                      "of waste recycled instead of landfilled",
                    ),
                    buildFact(
                      "assets/images/f.png",
                      "518.6 ft²",
                      "of forest removing CO₂ for one year",
                    ),
        
                    const SizedBox(height: 20),
        
                    // Bottom scenery image
                    Image.asset(
                      'assets/images/co2_scene.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fact Item Builder
  Widget buildFact(String img, String title, String subtitle) {
    return ListTile(
      leading: Image.asset(img, height: 42),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 15)),
      subtitle: Text(subtitle,style: TextStyle(fontSize: 12),),
    );
  }
}

import 'package:flutter/material.dart';

class PaymentOptionsPage extends StatelessWidget {
  const PaymentOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1.0,
      minChildSize: 0.5,
      maxChildSize: 1.0,
      expand: true,
      builder: (_, controller) {
        return SafeArea(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: ListView(
              controller: controller,
              children: [
                // Close Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
          
                SizedBox(height: 10),
          
                Text(
                  "Payment options",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          
                SizedBox(height: 20),
          
                // Personal | Business Toggle
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text("Personal",
                          style:
                              TextStyle(color: Colors.white, fontSize: 15)),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text("Business",
                          style: TextStyle(
                              color: Colors.black, fontSize: 15)),
                    ),
                  ],
                ),
          
                SizedBox(height: 25),
          
                // Uber balance switch
                Text("Uber balances",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
          
                SizedBox(height: 10),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.directions_car,
                              color: Colors.white),
                        ),
                        SizedBox(width: 10),
                        Text("Uber Cash: ₹0.00",
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    Switch(
                      value: false,
                      onChanged: (v) {},
                    ),
                  ],
                ),
          
                SizedBox(height: 25),
          
                Text(
                  "Payment methods",
                  style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
          
                SizedBox(height: 15),
          
                // Cash
                ListTile(
                  leading: Icon(Icons.payments, color: Colors.green),
                  title: Text("Cash"),
                  trailing: Icon(Icons.check),
                ),
          
                Divider(),
          
                // UPI
                ListTile(
                  leading: Icon(Icons.qr_code_2),
                  title: Text("UPI Scan and Pay"),
                ),
          
                Divider(),
          
                // Add Payment
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text("Add payment method"),
                ),
          
                SizedBox(height: 25),
          
                Text(
                  "Vouchers",
                  style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
          
                SizedBox(height: 10),
          
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text("Add voucher code"),
                  trailing: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade200,
                    ),
                    child: Text("See details"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

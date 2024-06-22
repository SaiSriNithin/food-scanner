// import 'package:flutter/material.dart';
// import 'package:food_scanner/add_new_item.dart';
// import 'package:food_scanner/homescreen.dart';
// import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
// import 'package:food_scanner/recent_screen.dart';
// import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

// class Navbar extends StatefulWidget {
//   const Navbar({super.key});

//   @override
//   State<Navbar> createState() => _NavbarState();
// }

// final List<Widget> _screens = [
//   RecentScreen(),
//   Homescreen(),
//   AddNewItem(),
// ];

// class _NavbarState extends State<Navbar> {
//   int _selectedIndex = 1;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: _screens[_selectedIndex],
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           border: Border(
//             top: BorderSide(
//               color: Colors.grey, // Change the color to your preference
//               width: 1.0, // Change the width to your preference
//             ),
//           ),
//         ),
//         child: MoltenBottomNavigationBar(
//           barColor: Colors.white,
//           selectedIndex: _selectedIndex,
//           domeHeight: 25,
//           // specify what will happen when a tab is clicked
//           onTabChange: (clickedIndex) {
//             setState(() {
//               _selectedIndex = clickedIndex;
//             });
//           },
//           tabs: [
//             MoltenTab(
//               icon: Icon(Icons.history),
//               title: Text('Recent'),

//               // selectedColor: Colors.yellow,
//             ),
//             MoltenTab(
//               icon: Icon(Icons.qr_code_scanner_rounded),
//               title: Text('Scan'),
//               // selectedColor: Colors.yellow,
//             ),
//             MoltenTab(
//               icon: Icon(Icons.add_circle_outline),
//               title: Text('Add image'),
//               // selectedColor: Colors.yellow,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:food_scanner/add_new_item.dart';
import 'package:food_scanner/recent_screen.dart';
import 'package:food_scanner/scanned_result_screen.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 1;
  String _scannedResult = '';

  final List<Widget> _screens = [
    RecentScreen(),
    Center(
      child: Text(
        "Scan Something To Know Interesting things",
        style: TextStyle(fontSize: 18),
      ),
    ),
    AddNewItem(),
  ];

  Future<void> _startScanner() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SimpleBarcodeScannerPage(),
      ),
    );

    if (result != null && result is String) {
      setState(() {
        _scannedResult = result;
        if (_scannedResult != '-1') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScannedResultScreen(),
            ),
          );
        } else {
          _selectedIndex = 1; // Switch to the scan tab to show the result
        } // Switch to the scan tab to show the result
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //  body: _selectedIndex == 1 && _scannedResult.isNotEmpty
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey, // Change the color to your preference
              width: 1.0, // Change the width to your preference
            ),
          ),
        ),
        child: MoltenBottomNavigationBar(
          barColor: Colors.white,
          selectedIndex: _selectedIndex,
          domeHeight: 25,
          onTabChange: (clickedIndex) async {
            if (clickedIndex == 1) {
              await _startScanner();
            } else {
              setState(() {
                _selectedIndex = clickedIndex;
                if (clickedIndex != 1) {
                  _scannedResult = '';
                }
              });
            }
          },
          tabs: [
            MoltenTab(
              icon: Icon(Icons.history),
              title: Text('Recent'),
            ),
            MoltenTab(
              icon: Icon(Icons.qr_code_scanner_rounded),
              title: Text('Scan'),
            ),
            MoltenTab(
              icon: Icon(Icons.add_circle_outline),
              title: Text('Add image'),
            ),
          ],
        ),
      ),
    );
  }
}

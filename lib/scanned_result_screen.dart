import 'package:flutter/material.dart';
import 'package:food_scanner/empty_screen.dart';

class ScannedResultScreen extends StatefulWidget {
  const ScannedResultScreen({super.key});

  @override
  State<ScannedResultScreen> createState() => _ScannedResultScreenState();
}

class _ScannedResultScreenState extends State<ScannedResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.grey,
        elevation: 2.0,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: Text('Product Details Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.0,
            ),
            Stack(
              children: [
                Image.asset(
                  'assets/fileadd.jpg',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 6,
                ), // replace with your image
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Oreo',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('43.75g', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 8),
                  Text('Cadbury', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),
                  Card(
                    shadowColor: Colors.grey,
                    elevation: 2.0,
                    surfaceTintColor: Colors.white,
                    child: ListTile(
                      leading: Icon(Icons.info, color: Colors.grey),
                      title: Text('Missing data to compute the Nutri-Score'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EmptyScreen(),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shadowColor: Colors.grey,
                    elevation: 2.0,
                    surfaceTintColor: Colors.white,
                    child: ListTile(
                      leading: Icon(Icons.eco, color: Colors.orange),
                      title: Text('High environmental impact'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EmptyScreen(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.circle, color: Colors.red, size: 12),
                      SizedBox(width: 8),
                      Text('Ultra processed foods'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Divider(),
                  ListTile(
                    title: Text('Health'),
                    subtitle: Text('Nutrition'),
                  ),
                  Card(
                    shadowColor: Colors.grey,
                    elevation: 2.0,
                    surfaceTintColor: Colors.white,
                    child: ListTile(
                      leading: Icon(Icons.warning, color: Colors.grey),
                      title: Text('Nutri-Score UNKNOWN'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EmptyScreen(),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text('Additivies'),
                  ),
                  Card(
                    shadowColor: Colors.grey,
                    elevation: 2.0,
                    surfaceTintColor: Colors.white,
                    child: ListTile(
                      leading: Icon(Icons.warning, color: Colors.grey),
                      title: Text('E322-lecithins'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EmptyScreen(),
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
    );
  }
}

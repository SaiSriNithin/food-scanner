import 'package:flutter/material.dart';
import 'package:food_scanner/models/recent.dart';
import 'package:food_scanner/models/recentcard.dart';
import 'package:food_scanner/scanned_result_screen.dart';

class RecentScreen extends StatefulWidget {
  const RecentScreen({super.key});

  @override
  State<RecentScreen> createState() => _RecentScreenState();
}

class _RecentScreenState extends State<RecentScreen> {
  final List<Recent> recentlist = [
    Recent(companyname: 'cadbury', productname: 'oreo', imgurl: ''),
    Recent(companyname: "pepsico", productname: 'pepsi', imgurl: ''),
  ];
  void _removeRecent(Recent recent) {
    final Index = recentlist.indexOf(recent);
    setState(() {
      recentlist.remove(recent);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Removed from recents.'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                recentlist.insert(Index, recent);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 3.0,
        surfaceTintColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        shadowColor: Colors.black,
        title: Text('Recent'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          recentlist.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: recentlist.length,
                    itemBuilder: (ctx, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ScannedResultScreen(),
                          ),
                        );
                      },
                      child: Dismissible(
                        key: ValueKey(
                          recentlist[index],
                        ),
                        background: Container(
                          color: Theme.of(context)
                              .colorScheme
                              .error
                              .withOpacity(0.7),
                          // margin: EdgeInsets.symmetric(
                          //     horizontal:
                          //         Theme.of(context).cardTheme.margin!.horizontal),
                          margin: EdgeInsets.symmetric(
                            horizontal: Theme.of(context)
                                    .cardTheme
                                    .margin
                                    ?.horizontal ??
                                4.0,
                          ),
                        ),
                        onDismissed: (direction) {
                          _removeRecent(recentlist[index]);
                        },
                        child: RecentCard(detailslist: recentlist[index]),
                      ),
                    ),
                  ),
                )
              : Expanded(
                  child: Text('Scan Something to get in Recent'),
                ),
        ],
      ),
    );
  }
}

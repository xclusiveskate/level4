import 'package:flutter/material.dart';
import 'package:level4/http/http_ui.dart';

class ResponsivenessWithNediaQuery extends StatefulWidget {
  const new({super.key});

  @override
  State<ResponsivenessWithNediaQuery> createState() =>
      _ResponsivenessWithNediaQueryState();
}

class _ResponsivenessWithNediaQueryState
    extends State<ResponsivenessWithNediaQuery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Responsiveness with MediaQuery")),
      body: Builder(
        builder: (context) {
          final mediaQuery = MediaQuery.of(context).size.width;
          if (mediaQuery < 600) {
            return ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 100,
                  child: Card(
                    child: Column(
                      children: [
                        Text("User ${index + 1}"),
                        Text("Username: Number ${index + 1}"),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (mediaQuery < 900) {
            return Row(
              children: [
                Expanded(
                  flex: 1,
                  child: NavigationRail(
                    labelType: NavigationRailLabelType.selected,
                    leading: Icon(Icons.abc),
                    trailing: Text("Person"),
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text("Home"),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.person),
                        label: Text("profile"),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.settings),
                        label: Text("Settings"),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.railway_alert),
                        label: Text("Users"),
                      ),
                    ],
                    selectedIndex: 1,
                  ),
                ),

                Expanded(flex: 4, child: Container(color: Colors.blue)),
              ],
            );
            // return GridView.builder(
            //   itemCount: 10,
            //   shrinkWrap: true,
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //   ),
            //   itemBuilder: (context, index) {
            //     return SizedBox(
            //       height: 100,
            //       child: Card(
            //         child: Column(
            //           children: [
            //             Text("User ${index + 1}"),
            //             Text("Username: Number ${index + 1}"),
            //           ],
            //         ),
            //       ),
            //     );
            //   },
            // );
          }
          return GridView.builder(
            itemCount: 10,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
              return SizedBox(
                height: 100,
                child: Card(
                  child: Column(
                    children: [
                      Text("User ${index + 1}"),
                      Text("Username: Number ${index + 1}"),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

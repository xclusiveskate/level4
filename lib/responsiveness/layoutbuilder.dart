import 'package:flutter/material.dart';

class ResponsivenessWithLayoutBuilder extends StatefulWidget {
  const new({super.key});

  @override
  State<ResponsivenessWithLayoutBuilder> createState() =>
      _ResponsivenessWithLayoutBuilderState();
}

class _ResponsivenessWithLayoutBuilderState
    extends State<ResponsivenessWithLayoutBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Responsiveness with Layout Builder")),

      body: LayoutBuilder(
        builder: (context, constraint) {
          final width = constraint.maxWidth;

        

          if (width < 600) {
            return ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.blue,
                    height: 200,

                    child: Text("Card ${index + 1}"),
                  ),
                );
              },
            );
          } else if (width < 1000) {
            return GridView.builder(
              shrinkWrap: true,
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return Card(child: Text("Card ${index + 1}"));
              },
            );
          }
          return GridView.builder(
            shrinkWrap: true,
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
              return Card(child: Text("Card ${index + 1}"));
            },
          );
        },
      ),
    );
  }
}

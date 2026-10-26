// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:level4/http/request.dart';
import 'package:level4/http/umodel.dart';

class HttpUi extends StatefulWidget {
  const new({super.key});

  @override
  State<HttpUi> createState() => _HttpUiState();
}

class _HttpUiState extends State<HttpUi> {
  getData() async {}

  @override
  void initState() {
    APIRequest.fetchListofUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<UserInfo>?>(
        future: APIRequest.fetchListofUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Could not load user'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            shrinkWrap: true,

            itemBuilder: (context, index) {
              final user = snapshot.data![index];
              return ListTile(
                leading: Text(user.id.toString()),
                title: Text(user.name),
                subtitle: Text(user.username),
                onTap: () async {
                  await showDialog(
                    context: context,
                    // fullscreenDialog: true,
                    barrierDismissible: true,
                    barrierColor: Colors.lightBlue,
                    builder: (context) {
                      return Dialog(
                        elevation: 1,

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Center(
                                child: MyTextStyle(
                                  data: "Name: ${user.name}",
                                  size: 20,
                                  weight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  MyTextStyle(
                                    data: "Username: ${user.username}",
                                    size: 12,
                                    weight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                  MyTextStyle(
                                    data: "Number: ${user.phone}",
                                    size: 12,
                                    weight: FontWeight.w500,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),

                              SizedBox(height: 20),

                              MyTextStyle(
                                data: "Email: ${user.email}",
                                size: 12,
                                weight: FontWeight.w500,
                                color: Colors.blue,
                              ),
                              SizedBox(height: 20),
                              MyTextStyle(
                                data: "website: ${user.website}",
                                size: 12,
                                weight: FontWeight.w500,
                                color: Colors.blue,
                              ),
                              SizedBox(height: 20),

                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.lightGreen,
                                  borderRadius: BorderRadius.circular(12),
                                  backgroundBlendMode: BlendMode.color,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: [
                                      MyTextStyle(
                                        data:
                                            "Company name: ${user.company.name}",
                                        size: 12,
                                        weight: FontWeight.w500,
                                        color: Colors.blue,
                                      ),
                                      MyTextStyle(
                                        data: "Company bs: ${user.company.bs}",
                                        size: 12,
                                        weight: FontWeight.w500,
                                        color: Colors.blue,
                                      ),
                                      MyTextStyle(
                                        data:
                                            "Company catch: ${user.company.catchPhrase}",
                                        size: 12,
                                        weight: FontWeight.w500,
                                        color: Colors.blue,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.lightGreen,
                                  borderRadius: BorderRadius.circular(12),
                                  backgroundBlendMode: BlendMode.color,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: [
                                      MyTextStyle(
                                        data:
                                            "Suite number : ${user.address.suite}",
                                        size: 12,
                                        weight: FontWeight.w500,
                                        color: Colors.blue,
                                      ),
                                      MyTextStyle(
                                        data:
                                            "Stree Address: ${user.address.street}",
                                        size: 12,
                                        weight: FontWeight.w500,
                                        color: Colors.blue,
                                      ),
                                      MyTextStyle(
                                        data:
                                            "Zipcode: ${user.address.zipcode}",
                                        size: 12,
                                        weight: FontWeight.w500,
                                        color: Colors.blue,
                                      ),
                                      MyTextStyle(
                                        data: "Address: ${user.address.city}",
                                        size: 12,
                                        weight: FontWeight.w500,
                                        color: Colors.blue,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          MyTextStyle(
                                            data:
                                                "Latitude: ${user.address.geo.lat}",
                                            size: 12,
                                            weight: FontWeight.w500,
                                            color: Colors.blue,
                                          ),
                                          MyTextStyle(
                                            data:
                                                "Longitude: ${user.address.geo.lng}",
                                            size: 12,
                                            weight: FontWeight.w500,
                                            color: Colors.blue,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class MyTextStyle extends StatelessWidget {
  final String data;
  final double size;
  final FontWeight weight;
  Color? color = Colors.blue;
  MyTextStyle({
    Key? key,
    required this.data,
    required this.size,
    required this.weight,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(fontSize: size, fontWeight: weight, color: color),
    );
  }
}

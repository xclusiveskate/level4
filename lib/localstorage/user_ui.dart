import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:level4/localstorage/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInformation extends StatefulWidget {
  const new({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  TextEditingController nameControl = TextEditingController();
  TextEditingController schoolControl = TextEditingController();
  TextEditingController addressControl = TextEditingController();
  List<UserModel> users = [];

  List<UserModel> newData = [];

  saveUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String details = jsonEncode(users.map((user) => user.toMap()).toList());
    await prefs.setString('user', details);

    print("User saved successfully");
  }

  addUser(UserModel user) {
    setState(() {
      users.add(user);
      saveUser();
      getUser();
    });
  }

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? details = prefs.getString("user");
    if (details != null) {
      List decodedData = jsonDecode(details);
      List<UserModel> mapData = decodedData
          .map((data) => UserModel.fromMap(data))
          .toList();

      setState(() {
        newData = mapData;
        print(newData);
      });
    }
  }

  deleteData(int id) {
    users.removeWhere((user) => user.id == id);
    saveUser();
    getUser();
    setState(() {});
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Information"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameControl,
                decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.lightGreen,
                      width: 0.5,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: schoolControl,
                decoration: InputDecoration(
                  hintText: "School",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.lightGreen,
                      width: 0.5,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: addressControl,
                decoration: InputDecoration(
                  hintText: "Address",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.lightGreen,
                      width: 0.5,
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                UserModel model = UserModel(
                  id: users.length + 1,
                  name: nameControl.text,
                  school: schoolControl.text,
                  address: addressControl.text,
                );

                addUser(model);
                setState(() {
                  nameControl.clear();
                  schoolControl.clear();
                  addressControl.clear();
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreenAccent.shade400,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text("Save User"),
            ),

            SizedBox(height: 20),
            ListView.builder(
              itemCount: newData.length,
              shrinkWrap: true,
              // shrinkWrap: true,
              itemBuilder: (context, index) {
                UserModel newUser = newData[index];

                return ListTile(
                  leading: Text(newUser.id.toString()),
                  title: Text(newUser.name),
                  subtitle: Text(newUser.address),
                  // trailing: Text(newUser.school),
                  trailing: IconButton(
                    onPressed: () {
                      deleteData(newUser.id);
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

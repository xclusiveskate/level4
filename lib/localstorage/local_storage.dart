import 'package:flutter/material.dart';
// import 'package:level4/localstorage/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage extends StatefulWidget {
  const new({super.key});

  @override
  State<LocalStorage> createState() => _LocalStorageState();
}

class _LocalStorageState extends State<LocalStorage> {
  bool isUserLoggedIn = false;
  saveUserAge(int userAge) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt("age", userAge);
  }

  getUserAge() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int? userAge = preferences.getInt("age");
    print("My age is $userAge");
  }

  saveUserName(String userName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("username", userName);
  }

  getUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? myUserName = preferences.getString("username");
    print(myUserName);
  }

  saveUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool('isLoggedIn', true);
  }

  getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    isUserLoggedIn = preferences.getBool('isLoggedIn') ?? false;
  }

  savetListOfString() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList('list', ["Ade", "Kola", "Tunde"]);
  }

  getList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String>? myList = preferences.getStringList("list");
    print(myList);
  }
  

  updateUser(int id){
    
  }
  @override
  void initState() {
    // TODO: implement initState
    getUser();
    getUserAge();
    getUserName();
    getList();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  TextEditingController ageControl = TextEditingController();
  TextEditingController userNameControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Storage"),
        centerTitle: true,
        backgroundColor: Colors.teal.shade500,
      ),
      body: isUserLoggedIn
          ? Column(
              children: [
                TextField(
                  controller: userNameControl,
                  decoration: InputDecoration(hint: Text("Username")),
                ),
                TextField(
                  controller: ageControl,
                  decoration: InputDecoration(hint: Text("User age")),
                ),
                ElevatedButton(
                  onPressed: () {
                    saveUserAge(int.parse(ageControl.text));
                    saveUserName(userNameControl.text);
                    saveUser();
                    savetListOfString();
                  },
                  child: Text("Save to local storage"),
                ),
              ],
            )
          : Column(children: [Text("Welcome to my Application")]),
    );
  }
}

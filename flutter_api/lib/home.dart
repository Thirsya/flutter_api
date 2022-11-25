import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'models/category_models.dart';
import 'network/api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List listCategory = [];
  String name = '';

  getKategori() async {
    final response = await HttpHelper().getKategori();
    var dataResponse = jsonDecode(response.body);
    setState(() {
      var listRespon = dataResponse['data'];
      for (var i = 0; i < listRespon.length; i++) {
        listCategory.add(Category.fromJson(listRespon[i]));
      }
    });
  }

  logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    const key = 'token';
    final value = preferences.get(key);
    final token = '$value';
    setState(() {
      preferences.remove("token");
      preferences.clear();
    });

    final response = await HttpHelper().logout(token);
    print(response.body);
  }

  @override
  void initState() {
    super.initState();
    getKategori();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              'HOME',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 5,
              ),
            ),
          ),
          backgroundColor: const Color(0xFF0E5E6F),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          decoration: const BoxDecoration(color: Color(0xFFFFEFD6)),
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'LIST',
                  style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0E5E6F),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyApp()),
                        );
                        logOut();
                      },
                      child: const Text('Logout')),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: listCategory.length,
                        itemBuilder: (context, index) {
                          var kategori = listCategory[index];
                          return ListTile(
                              title: Text(
                            kategori.name,
                            style: const TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ));
                        }))
              ],
            ),
          ),
        ));
  }
}

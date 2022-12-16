import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api/pages/home/edit.dart';
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
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 17),
                          filled: true,
                          fillColor: Color(0xFFF2DEBA),
                          labelText: 'Masukkan Task Baru',
                          labelStyle: const TextStyle(
                            color: Color(0xFF3A8891),
                            fontWeight: FontWeight.bold,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3, color: Color(0xFF3A8891)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3, color: Color(0xFF3A8891)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF0E5E6F),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {},
                          child: const Text('Tambah')),
                    ),
                  ],
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
                          return Dismissible(
                              key: UniqueKey(),
                              background: Container(
                                color: Colors.blue,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    children: const <Widget>[
                                      Icon(Icons.favorite, color: Colors.white),
                                      Text('Edit',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ),
                              secondaryBackground: Container(
                                color: Colors.red,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const <Widget>[
                                      Icon(Icons.delete, color: Colors.white),
                                      Text('Hapus',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ),
                              onDismissed: (DismissDirection direction) {
                                if (direction == DismissDirection.startToEnd) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Edit()),
                                  );
                                } else {}
                              },
                              child: ListTile(
                                  title: Text(
                                kategori.name,
                                style: const TextStyle(
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )));
                        }))
              ],
            ),
          ),
        ));
  }
}

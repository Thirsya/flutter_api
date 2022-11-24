import 'package:flutter/material.dart';
import 'package:flutter_api/register.dart';
import 'main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: Alignment.centerLeft,
            child: Text(
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
          decoration: BoxDecoration(color: Color(0xFFFFEFD6)),
          width: double.infinity,
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'LIST',
                  style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0E5E6F),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyApp()),
                        );
                      },
                      child: Text('Logout')),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                    child: ListView(children: [
                  Container(
                    height: 50,
                    color: Color(0xFF3A8891),
                    child: const Center(
                        child: Text(
                      'Pengaruh Interior Display Terhadap Konsumen',
                      style: TextStyle(color: Color(0xFFFFEFD6)),
                    )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    color: Color(0xFF3A8891),
                    child: const Center(
                        child: Text(
                      'Pengaruh Rotasi Jabatan Karyawan di PT. Anugrah',
                      style: TextStyle(color: Color(0xFFFFEFD6)),
                    )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    color: Color(0xFF3A8891),
                    child: const Center(
                        child: Text(
                      'Pengaruh Atribut Produk Terhadap Keputusan Pembelian',
                      style: TextStyle(color: Color(0xFFFFEFD6)),
                    )),
                  ),
                ]))
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController? controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              'EDIT',
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
                  TextFormField(
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
                        onPressed: () {},
                        child: const Text('Tambah')),
                  ),
                ],
              )),
        ));
  }
}

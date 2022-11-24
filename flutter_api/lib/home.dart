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
        body: Container(
      decoration: BoxDecoration(color: Color(0xFFFFEFD6)),
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'LIST',
              style: TextStyle(fontSize: 30, letterSpacing: 20),
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
                      MaterialPageRoute(builder: (context) => const MyApp()),
                    );
                  },
                  child: Text('Logout')),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView(children: [
              Container(
                height: 50,
                color: Colors.amber[600],
                child: const Center(child: Text('Entry A')),
              ),
              Container(
                height: 50,
                color: Colors.amber[500],
                child: const Center(child: Text('Entry B')),
              ),
              Container(
                height: 50,
                color: Colors.amber[100],
                child: const Center(child: Text('Entry C')),
              ),
            ]))
          ],
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:resume_builder/Screens/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text('CV Builder'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.asset('assets/images/resume_splash_final.png'),
            ),
            const SizedBox(
              height: 250,
            ),
            const Text(
              'Create Resume',
              style: TextStyle(fontFamily: 'Create'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const profile()));
                },
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.purpleAccent,
                            Colors.lightBlueAccent
                          ]),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/create resume.png',
                          height: 60,
                        ),
                      ),
                      const Text('Create')
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:task_manager/Tasks.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    delay();
    super.initState();
  }

 Future<void> delay()async{
    await Future.delayed(const Duration(seconds: 2));
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const taskListing()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         alignment: Alignment.center,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 135, 201, 255),
                Color.fromARGB(255, 203, 232, 255),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        child: Container(
          height: 200,width: 300,
          decoration: BoxDecoration(
            color: Colors.amberAccent
          ),
        )
      ),
    );
  }
}
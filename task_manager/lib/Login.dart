import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration:BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/background.jpg"),fit: BoxFit.cover)
        ) ,
        child: Container(
          height: 400,width: 300,decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6),
            image: DecorationImage(image: AssetImage("assets/images/noise.jpg"),fit: BoxFit.cover,opacity: 0.1),
            borderRadius: BorderRadius.circular(10.0)
          ),
        ),
      ),
    );
  }
}
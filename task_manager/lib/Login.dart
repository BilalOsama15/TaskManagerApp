import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 255, 255, 255),Color.fromARGB(255, 135, 201, 255),Color.fromARGB(255, 203, 232, 255),],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
            )
          // image: DecorationImage(image: AssetImage("assets/images/background.jpg"),fit: BoxFit.cover)
        ) ,
        child: Container(
          alignment: Alignment.center,
          height: 400,width: 300,decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color.fromARGB(75, 0, 0, 0),Color.fromARGB(99, 165, 165, 165)],),
            color: Colors.white.withOpacity(0.6),
            image:const DecorationImage(image: AssetImage("assets/images/noise.jpg"),fit: BoxFit.cover,opacity: 0.03),
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20.0,),
                const Text("Login", style: TextStyle(color: Colors.white, fontSize: 18.0,fontWeight: FontWeight.bold),),
                // const SizedBox(height: 10.0,),
                // const Text("Wellcome Back!", style: TextStyle(color: Colors.white, fontSize: 12.0,fontWeight: FontWeight.bold),),
                const SizedBox(height: 50.0,),
                userNameInput(),
                const SizedBox(height: 10.0,),
                passwordInput(),
                const SizedBox(height: 10.0,),
                const Align(alignment: Alignment.centerRight, child: Text("Forget Password",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w500),)),
                const SizedBox(height: 20.0,),
                loginButton(),
                const SizedBox(height: 20.0,),
                
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 25,width: 25, decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                        image: const DecorationImage(image: AssetImage("assets/images/google.png"),fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(width: 20.0,), 
                    Container(
                      height: 25,width: 25, decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                        image: DecorationImage(image: AssetImage("assets/images/FB.png"),fit: BoxFit.cover),
                      ),
                    ),
                    
                  ],
                )
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container loginButton() {
    return Container(
                alignment: Alignment.center,
                height: 40,width: double.infinity,decoration: BoxDecoration(
                  color: Colors.black,borderRadius: BorderRadius.circular(10.0)
                ),
                child: const Text("Login",style: TextStyle(color: Colors.white),),
              );
  }

  SizedBox userNameInput() {
    return SizedBox(
                height: 45,
                child: TextFormField(
                  controller: userName,
                  style: const TextStyle(color: Colors.black, fontSize: 12.0,fontWeight: FontWeight.w400),
                  decoration: const InputDecoration(
                  hintText: "Enter Username",
                  hintStyle: TextStyle(color: Colors.black, fontSize: 12.0,fontWeight: FontWeight.w400),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                  ),
                  prefixIcon: Icon(Icons.email, size: 16,),
                  hoverColor: Color.fromARGB(255, 247, 247, 247),
                  focusColor: Color.fromARGB(255, 247, 247, 247),
                  ),
                ),
              );
  }

   SizedBox passwordInput() {
    return SizedBox(
                height: 45,
                child: TextFormField(
                  obscureText: true,
                  obscuringCharacter: '.',
                  controller: password,
                  style: const TextStyle(color: Colors.black, fontSize: 12.0,fontWeight: FontWeight.w400),
                  decoration: const InputDecoration(
                  hintText: "Enter Password",
                  hintStyle: TextStyle(color: Colors.black, fontSize: 12.0,fontWeight: FontWeight.w400),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                  ),
                  prefixIcon: Icon(Icons.password, size: 16.0,),
                  hoverColor: Color.fromARGB(255, 247, 247, 247),
                  focusColor: Color.fromARGB(255, 247, 247, 247),
                  suffixIcon: Icon(Icons.remove_red_eye,size: 16.0,)
                  ),
                ),
              );
  }
}
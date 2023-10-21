

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:task_manager/Tasks.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isVisible = false;
  bool showSignup = false;
  var _formkey=GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 135, 201, 255),
                Color.fromARGB(255, 203, 232, 255),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: showSignup ? signupContainer() : loginContainer(),
          ),
        ),
      ),
    );
  }

  
  Widget loginContainer() {
    return Container(
        // duration: const Duration(milliseconds: 2000), 
        alignment: Alignment.center,
        height: 400,width: 300,decoration: BoxDecoration(
          gradient:const LinearGradient(colors: [Color.fromARGB(75, 0, 0, 0),Color.fromARGB(99, 165, 165, 165)],),
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
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(50.0),
                      image: DecorationImage(image: AssetImage("assets/images/FB.png"),fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("If you don't have an account", style: TextStyle(color: Colors.white, fontSize: 10.0,fontWeight: FontWeight.normal),),
                  const SizedBox(width: 5,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        clearInputs();
                        isVisible = false;
                        showSignup = true;
                        // container1OffsetX = -300.0; // Slide out the first container to the left
                        // container2OffsetX = 300.0;  // Slide out the second container to the right
                      });
                    },
                    child: const Text("Sign up", style: TextStyle(color: Colors.black, fontSize: 10.0,fontWeight: FontWeight.bold),)),
                  
                ],
              ),              
              
            ],
          ),
        ),
      );
  }
  Widget signupContainer() {
    return Container(
        // duration: const Duration(milliseconds: 500), 
        alignment: Alignment.center,
        height: 400,width: 300,decoration: BoxDecoration(
          gradient:const LinearGradient(colors: [Color.fromARGB(75, 0, 0, 0),Color.fromARGB(99, 165, 165, 165)],),
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
              const Text("Sign up", style: TextStyle(color: Colors.white, fontSize: 18.0,fontWeight: FontWeight.bold),),
              // const SizedBox(height: 10.0,),
              // const Text("Wellcome Back!", style: TextStyle(color: Colors.white, fontSize: 12.0,fontWeight: FontWeight.bold),),
              const SizedBox(height: 50.0,),
              userNameInput(),
              const SizedBox(height: 10.0,),
              passwordInput(),
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
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(50.0),
                      image: DecorationImage(image: AssetImage("assets/images/FB.png"),fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("If you don't have an account", style: TextStyle(color: Colors.white, fontSize: 10.0,fontWeight: FontWeight.normal),),
                  const SizedBox(width: 5,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        clearInputs();
                        isVisible = false;
                        showSignup = false;
                        // container1OffsetX = -300.0; // Slide out the first container to the left
                        // container2OffsetX = 300.0;  // Slide out the second container to the right
                      });
                    },
                    child: const Text("Login", style: TextStyle(color: Colors.black, fontSize: 10.0,fontWeight: FontWeight.bold),)),
                  
                ],
              ),              
              
            ],
          ),
        ),
      );
  }
  Widget loginButton() {
    return InkWell(
      onTap: (){
        
            if(showSignup)
            {
              print("Signup");
            }
            else{
              print("Login");
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const taskListing()));
            }
      },
      child: Container(
                  alignment: Alignment.center,
                  height: 40,width: double.infinity,decoration: BoxDecoration(
                    color: Colors.black,borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Text(showSignup?"Signup":"Login",style: TextStyle(color: Colors.white),),
                ),
    );
  }

  SizedBox userNameInput() {
    return SizedBox(
                height: 45,
                child: TextFormField(
                  // validator: (value) {
                  //    if(value==null || value.isEmpty) {
                  //      return "Field Cannot be empty";
                  //     }
                  //     return null;
                  // },
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
                  // validator: (value) {
                  //    if(value==null || value.isEmpty) {
                  //      return "Field Cannot be empty";
                  //     }
                  //     else if(value.length<=7)
                  //     {
                  //     return "Password Must be at 8 Character Long";
                  //     }
                  //     return null;
                  // },
                  obscureText: !isVisible,
                  obscuringCharacter: '.',
                  controller: password,
                  style: const TextStyle(color: Colors.black, fontSize: 12.0,fontWeight: FontWeight.w400),
                  decoration:  InputDecoration(
                  hintText: "Enter Password",
                  hintStyle:const TextStyle(color: Colors.black, fontSize: 12.0,fontWeight: FontWeight.w400),
                  fillColor: Colors.white,
                  filled: true,
                  border:const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                  ),
                  prefixIcon: const Icon(Icons.password, size: 16.0,),
                  hoverColor: const Color.fromARGB(255, 247, 247, 247),
                  focusColor:const Color.fromARGB(255, 247, 247, 247),
                  suffixIcon: IconButton(
                        icon: isVisible? const Icon(Icons.visibility,size: 16,):
                       const Icon(Icons.visibility_off, size: 16,),
                        onPressed: (){
                          setState(() {
                            isVisible = !isVisible;
                          });
                         },)
                  ),
                ),
              );
  }

  clearInputs(){
    password.text = "";
    userName.text = "";
  }
}

class AnimatedContainerTickerProvider extends TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}
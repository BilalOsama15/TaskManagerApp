// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class addTask extends StatefulWidget {
  const addTask({super.key});

  @override
  State<addTask> createState() => _addTaskState();
}

class _addTaskState extends State<addTask> {
  TextEditingController dateInput = TextEditingController();
   TextEditingController taskName = TextEditingController();
    TextEditingController description= TextEditingController();
     TextEditingController priority= TextEditingController();
    List<String> Data = [
    "High",
    "Medium",
    "Low"
  ];
   var _formkey=GlobalKey<FormState>();
  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
       Container(
         alignment: Alignment.center,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
               
                Color.fromARGB(255, 203, 232, 255),
                 Color.fromARGB(255, 135, 201, 255),
                Color.fromARGB(255, 255, 255, 255),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
         child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: const Icon(Icons.arrow_back_sharp,size: 18,)),
                    const SizedBox(width: 90,),
                    const Text("Add Task", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 16.0,fontWeight: FontWeight.bold),),
                  ],
                ),
                const SizedBox(height: 70,),
                Container(
                  height: 100,width: 150,decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/addTask.png"),)
                  ),
                ),
                const SizedBox(height: 30,),
                 SizedBox(
                  height: 45,
                   child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Text Feild Cannot Empty";
                        }
                        return null;
                     },
                     controller: taskName,
                    style: const TextStyle(color: Colors.black, fontSize: 12.0,fontWeight: FontWeight.w400),
                    decoration: const InputDecoration(
                    hintText: "Enter Title",
                    hintStyle: TextStyle(color: Colors.black, fontSize: 12.0,fontWeight: FontWeight.w400),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                    ),
                    prefixIcon: Icon(Icons.title, size: 16,),
                    hoverColor: Color.fromARGB(255, 247, 247, 247),
                    focusColor: Color.fromARGB(255, 247, 247, 247),
                    ),
                                 ),
                 ),
              const  SizedBox(height: 15,),
                  SizedBox(
                    height: 45,
                    child: TextFormField(
                  
                     controller: description,
                    style: const TextStyle(color: Colors.black, fontSize: 12.0,fontWeight: FontWeight.w400),
                    decoration: const InputDecoration(
                    hintText: "Enter Description",
                    hintStyle: TextStyle(color: Colors.black, fontSize: 12.0,fontWeight: FontWeight.w400),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                    ),
                    prefixIcon: Icon(Icons.description, size: 16,),
                    hoverColor: Color.fromARGB(255, 247, 247, 247),
                    focusColor: Color.fromARGB(255, 247, 247, 247),
                    ),
                                  ),
                  ),
              const  SizedBox(height: 15,),
                SizedBox(
                  height: 45,
                  child: TextFormField(
                   validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Date Must be Select";
                      }
                      return null;
                   },
                    controller: dateInput,
                    //editing controller of this TextField
                   style: const TextStyle(color: Colors.black, fontSize: 12.0,fontWeight: FontWeight.w400),
                      decoration: const InputDecoration(
                      hintText: "Select Due Date",
                      hintStyle: TextStyle(color: Colors.black, fontSize: 12.0,fontWeight: FontWeight.w400),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))
                      ),
                      prefixIcon: Icon(Icons.date_range, size: 16,),
                      hoverColor: Color.fromARGB(255, 247, 247, 247),
                      focusColor: Color.fromARGB(255, 247, 247, 247),
                      ),
                    readOnly: true,
                    //set it true, so that user will not able to edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2100));
                          
                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        setState(() {
                          dateInput.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {}
                    },
                  ),
                ),
               const SizedBox(height: 15,),
                SizedBox(
                  height: 45,
                  child: DropdownButtonFormField(
                  
                  items: Data.map((String category) {
                           
                  return DropdownMenuItem(
                  value: category,
                  child: Row(
                    children: <Widget>[
                      Text(category),
                    ],
                  ));
                  }).toList(),
                  onChanged: (newvalue) {
                            setState(() => priority.text = newvalue.toString());
                  },
                      style: const TextStyle(color: Colors.black, fontSize: 12.0,fontWeight: FontWeight.w400),
                      decoration: const InputDecoration(
                      hintText: "Select Priority",
                      hintStyle: TextStyle(color: Colors.black, fontSize: 12.0,fontWeight: FontWeight.w400),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))
                      ),
                      prefixIcon: Icon(Icons.priority_high, size: 16,),
                      hoverColor: Color.fromARGB(255, 247, 247, 247),
                      focusColor: Color.fromARGB(255, 247, 247, 247),
                      ),
                      focusColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20,),
                addButton(),
                const SizedBox(height: 30,),
              ],
            ),
          ),
             ),
       ),
      
    );
  }
   Widget addButton() {
    return InkWell(
      onTap: (){
        print("Add Task");
      },
      child: Container(
                  alignment: Alignment.center,
                  height: 40,width: double.infinity,decoration: BoxDecoration(
                    color: Colors.black,borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: const Text("Add",style: TextStyle(color: Colors.white),),
                ),
    );
  }
}
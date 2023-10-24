// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/Constants/loader.dart';
import 'package:task_manager/Models/DBHelper.dart';
import 'package:task_manager/Models/Task_model.dart';

// ignore: must_be_immutable
class addTask extends StatefulWidget {
  task? t;
   addTask({super.key, required this.t});

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
      DBHelper? db = DBHelper();
   final _formkey=GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    setDefaultValue();
  }

  setDefaultValue(){
    if(widget.t != null)
    {
      taskName.text = widget.t!.title.toString();
      description.text =  widget.t!.description.toString();
      dateInput.text =  widget.t!.dueDate.toString();
      priority.text =  widget.t!.priority.toString();
    }
    else
    {
      dateInput.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    priority.text = "Low";
    }
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
          child: SingleChildScrollView(
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
                        child: const Icon(Icons.arrow_back_sharp,size: 20,)),
                      const SizedBox(width: 120,),
                       Text(widget.t != null?"Update Task":"Add Task", style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 16.0,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  const SizedBox(height: 150,),
                  Container(
                    height: 100,width: 150,decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/addTask.png"),)
                    ),
                  ),
                  const SizedBox(height: 30,),
                   SizedBox(
                    height: 50,
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
                      height: 50,
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
                    height: 50,
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
                    height: 60,
                    child: DropdownButtonFormField(
                    value: widget.t!=null?widget.t!.priority:"Low",
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
       ),
      
    );
  }
   Widget addButton() {
    return InkWell(
      onTap: (){
        if(taskName.text=="")
        {
          showSnackBar(context, "Please Enter Title", Colors.red);
        }
        else
        {
          showLoader(context);
        task t = task(taskName.text, description.text!=""?description.text:"", dateInput.text, priority.text, "pending");
        if(widget.t!=null)
        {
          print("update");
          db!.updateTask(t,widget.t!.id!.toInt());
           hideLoader(context);
        showSnackBar(context, "Successfully Update", Colors.green);
        }
        else
        {
          db!.insert(t);
           hideLoader(context);
        showSnackBar(context, "Successfully Add", Colors.green);
        }
        
       
        print("Add Task");
        Navigator.of(context).pop("Data added successfully");

        }
        
      },
      child: Container(
                  alignment: Alignment.center,
                  height: 40,width: double.infinity,decoration: BoxDecoration(
                    color: Colors.black,borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Text(widget.t!=null?"Update":"Add",style: const TextStyle(color: Colors.white),),
                ),
    );
  }
}
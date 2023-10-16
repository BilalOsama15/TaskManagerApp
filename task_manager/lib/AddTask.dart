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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Add Task"),
        centerTitle: true,
      ),
      body: 
       Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
               TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Text Feild Cannot Empty";
                    }
                    return null;
                 },
                 controller: taskName,
                decoration: const InputDecoration(
                   alignLabelWithHint: true,
                  labelText: "Enter Task Name",
                  border:OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepPurple
                    )  
                  )
                  
                ),
              ),
            const  SizedBox(height: 20,),
                TextFormField(
                 validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Text Feild Cannot Empty";
                    }
                  return null;
                 },
                 controller: description,
                textAlign: TextAlign.start,
                maxLines: 3,
                decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  labelText: "Description",
                  border:OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepPurple
                    )  
                  )
                  
                ),
              ),
            const  SizedBox(height: 20,),
              TextFormField(
               validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Date Must be Select";
                  }
                  return null;
               },
                controller: dateInput,
                //editing controller of this TextField
                decoration: const InputDecoration(
                   alignLabelWithHint: true,
                  labelText: "Select Due Date",
                  border:OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepPurple
                    )  
                  )
                  
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
             const SizedBox(height: 20,),
              DropdownButtonFormField(
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
              decoration: InputDecoration(
            label: Text("Select Priority"),
          
            border: OutlineInputBorder(
              gapPadding: 10.0),
            focusColor: Colors.white),
              focusColor: Colors.white,
            )
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: (){
          if(_formkey.currentState!.validate())
          {
            print("add");
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(left:30.0),
          child: Container(
            height: 40,width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Text("Add",style: TextStyle(color: Colors.white),),
          ),
        ),
      )
    );
  }
}
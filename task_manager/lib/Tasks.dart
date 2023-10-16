// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:task_manager/AddTask.dart';

class taskListing extends StatefulWidget {
  const taskListing({super.key});

  @override
  State<taskListing> createState() => _taskListingState();
}

class _taskListingState extends State<taskListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 219, 254),
      appBar: AppBar(title: const Text("Tasks",style: TextStyle(color: Colors.white),),centerTitle: true,backgroundColor: Colors.deepPurple,),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          20.height,
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                      color: Color.fromARGB(255, 0, 0, 0),
                      offset: Offset(4,4),
                      )
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 255, 255, 255)
                  ),
                  child: ListTile(
                    title: Text("Task ${index+1}",),
                    subtitle: Text("Due Date: 09/12/2023"),
                    trailing: Icon(Icons.access_time_filled),
                  ),
                ),
              );
            
              
            },))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Task',
        onPressed: () { 
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const addTask()));
         },
        child: const Icon(Icons.add),
      ),
    );
  }
}
extension emptySpace on num
{

SizedBox get height => SizedBox(height:toDouble());

SizedBox get width => SizedBox(width:toDouble());

}
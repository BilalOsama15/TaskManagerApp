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
      // appBar: AppBar(automaticallyImplyLeading:false,title: const Text("Tasks",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
      //   backgroundColor: Color.fromARGB(255, 135, 201, 255),),
      body:  Container(
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              10.height,
              Container(
                height: 50,width: double.infinity, alignment: Alignment.center, decoration: BoxDecoration(
          gradient:const LinearGradient(colors: [Color.fromARGB(255, 135, 201, 255),Color.fromARGB(255, 255, 255, 255)],),
          color: Colors.white.withOpacity(0.6),
          image:const DecorationImage(image: AssetImage("assets/images/noise.jpg"),fit: BoxFit.cover,opacity: 0.03),
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Tasks",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
              Icon(Icons.arrow_drop_down)
            ],
          ),
        ),
              ),
              20.height,
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        // boxShadow: const [
                        //   BoxShadow(
                        //   color: Color.fromARGB(255, 0, 0, 0),
                        //   offset: Offset(4,4),
                        //   )
                        // ],
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 255, 255, 255)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Task ${index+1}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                Text("Due Date: 09/12/2023",style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal)),
                              ],
                            ),
                           Container(
                            alignment: Alignment.center,
                            height: 15,width: 50,decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(25.0)
                            ),
                            child: Text("High",style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold,color: Colors.white),),
                           )
                          ],
                        ),
                      ),
                      // child: ListTile(
                      //   title: Text("Task ${index+1}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                      //   subtitle: Text("Due Date: 09/12/2023",style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal)),
                      //   trailing: Icon(Icons.access_time_filled,size: 16,),
                      // ),
                    ),
                  );
                
                  
                },))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 135, 201, 255),
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
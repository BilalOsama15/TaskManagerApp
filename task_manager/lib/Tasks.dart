// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:task_manager/AddTask.dart';
import 'package:task_manager/Models/DBHelper.dart';
import 'package:task_manager/Models/Task_model.dart';
import 'package:task_manager/Models/localNotifications.dart';

class taskListing extends StatefulWidget {
  const taskListing({super.key});

  @override
  State<taskListing> createState() => _taskListingState();
}

class _taskListingState extends State<taskListing> {
late final LocalNotificationServices services;
  final TextEditingController _search = TextEditingController();
    String _searchText="";
    DBHelper? db = DBHelper();
 Future<List<task>?>? tasks;

void asd(String status)async{
    tasks = getList(status);
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
    });
}
 Future<List<task>?> getList(String status) async {
    if(status=="all")
    {
      return await db!.getAllTask();
    }
    else
    {
      return await db!.getTaskByStatus(status);
    }
   
  }
  @override
  void initState() {
    services = LocalNotificationServices();
    services.intialize();
    super.initState();
    asd(status);
  }
 var data = [
      "pending",
      "completed",  
    ];
    String status = 'pending';
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
              40.height,
              Container(
                height: 60,width: double.infinity, alignment: Alignment.center, decoration: BoxDecoration(
          // gradient:const LinearGradient(colors: [Color.fromARGB(255, 135, 201, 255),Color.fromARGB(255, 0, 0, 0)],),
          // color: Colors.white.withOpacity(0.6),
          // image:const DecorationImage(image: AssetImage("assets/images/noise.jpg"),fit: BoxFit.cover,opacity: 0.03),
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Tasks",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
              const SizedBox(width: 20,),
              SizedBox(
                height: 40,width: 200 ,
                child: TextFormField(
                   controller: _search,
                      onChanged: (value) async {
                      setState(() {
                        _searchText = value;
                      });
                  },
                  style: const TextStyle(color: Colors.black, fontSize: 12.0,fontWeight: FontWeight.w400),
                  decoration: const InputDecoration(
                  hintText: "Search by title",
                  hintStyle: TextStyle(height:1,color: Colors.black, fontSize: 12.0,fontWeight: FontWeight.w400),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(25.0))
                  ),
                  suffixIcon: Icon(Icons.search, size: 16,),
                  hoverColor: Color.fromARGB(255, 247, 247, 247),
                  focusColor: Color.fromARGB(255, 247, 247, 247),
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              PopupMenuButton(
                iconSize: 22.0,
          onSelected: (value) {
            
           
             if(value==data[0])
            {
              status = data[0];
              setState(() {
                asd(status);
              });
            }
            else if(value==data[1])
            {
              status = data[1];
              setState(() {
                asd(status);
              });
            }
          },
          itemBuilder: (context)=>[
          PopupMenuItem(value: data[0],child: const Text("Pending")),
          PopupMenuItem(value: data[1],child: const Text("Completed")),
          
        ]),

              // const Icon(Icons.arrow_drop_down,size: 22,)
            ],
          ),
        ),
              ),
              Expanded(
                child: FutureBuilder(
                   future: tasks,
                    builder: ((context,AsyncSnapshot<List<task>?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.data!.isEmpty) {
                        return const Center(child: Text("No Task Found",style: TextStyle(color: Color.fromARGB(132, 0, 0, 0)),));
                      }
                      
                      else
                      {
                        if(_searchText=="")
                        {
                          final filteredList = snapshot.data;
                        }
                        final filteredList = snapshot.data!.where((task) =>
                          task.title!.toLowerCase().contains(_searchText.toLowerCase())
                        ).toList();
                        return ListView.builder(
                        itemCount: filteredList.length,
                        itemBuilder: (context, index) {
                           task t =filteredList[index];
                          DateTime date = DateTime.parse(t.dueDate.toString());
                          
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: ()async{
                              String? result =await  Navigator.push(context, MaterialPageRoute(builder: (context)=> addTask(t: t,)));
                                if(result !=null)
                                {
                                  setState(() {
                                    asd(status);
                                  });
                                }
                            },
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
                              padding: const EdgeInsets.only(top:8.0,left: 16.0,right:8.0,bottom: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Checkbox(value: t.status=="pending"?false:true, onChanged: (value) async {
                                    print(value);
                                    setState(() {
                                      db!.updateStatus(value!, t.id!);
                                      asd(status);
                                    });
                                   await services.showNotification(id: t.id!.toInt(),title: "Task Status Updated", body: value!?"Task Is Completed":"Task Is Pending");
                                  },),
                                  10.width,
                                  SizedBox(
                                    width: 180,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("${t.title}",style:const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                        Text("${t.dueDate}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: date.isBefore(DateTime.now())?Colors.red:Colors.black)),
                                      ],
                                    ),
                                  ),
                                  10.width,
                                Container(
                                  alignment: Alignment.center,
                                  height: 20,width: 50,decoration: BoxDecoration(
                                    color: t.priority=="High"?Colors.red:t.priority=="Medium"?Colors.amber: Color.fromARGB(255, 254, 223, 128),
                                    borderRadius: BorderRadius.circular(25.0)
                                  ),
                                  child: Text("${t.priority}",style: const TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white),),
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
                          ),
                      );
                    
                      
                    },);
                              
  }})))
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: ()async{
          task? t= null;
        String? result =await  Navigator.push(context, MaterialPageRoute(builder: (context)=> addTask(t: t,)));
        if(result !=null)
        {
          setState(() {
            asd(status);
          });
        }
        
        },
        child: Container(
          height: 40,width: 80,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 0, 0, 0),
            borderRadius: BorderRadius.all(Radius.circular(8.0))
      
          ),
          
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset("assets/images/addPen.png",height: 25,),10.width,
                const Text("Add", style: TextStyle(color: Colors.white, fontSize: 12.0,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
extension emptySpace on num
{

SizedBox get height => SizedBox(height:toDouble());

SizedBox get width => SizedBox(width:toDouble());

}
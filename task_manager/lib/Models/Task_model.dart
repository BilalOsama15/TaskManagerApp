class task{
  int? id=0;
  String? title,description,dueDate,priority,status;
  task(this.title,this.description,this.dueDate,this.priority,this.status);
  
Map<String,dynamic> toMap()
{
  Map<String,dynamic> m = Map<String,dynamic>();
  m["title"]=title;
  m["description"]=description;
  m["dueDate"]=dueDate;
  m["priority"]=priority;
  m["status"]=status;
  return m;
}
task.fromMap(Map<dynamic,dynamic> m)
{
  id=m["id"];
  title=m["title"];
  description=m["description"];
  dueDate=m["dueDate"];
  priority=m["priority"];
  status=m["status"];
}
}
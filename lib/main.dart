import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: todoApp(),
      );
  }
}

class todoApp extends StatefulWidget {
  const todoApp({ Key? key }) : super(key: key);

  @override
  _todoAppState createState() => _todoAppState();
}

class _todoAppState extends State<todoApp> {
  List <dynamic> lst = ['Create a flutter app'];
  var output = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App",style: TextStyle(fontSize: 30),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
          body: ListView.builder(
        itemCount: lst.length,
        itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.only(top:15,left: 10,right: 10),
            // height: 50,
            decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(10)
              // borderRadius: 20,
            ),
            child: ListTile(
          title: Flexible(child: Text(lst[index].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),)),
          trailing: Container(
            width: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              GestureDetector(onTap: (){
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text("Edit Item"),
                    content: TextField(
                      onChanged: (value){
                      output = value;
                    },),
                    actions: [
                      ElevatedButton(onPressed: (){
                        setState(() {
                          lst.replaceRange(index, index+1, {output});
                        });
                        Navigator.pop(context);
                      }, child: Text("Update"))
                    ],
                    
                  );
                });
              },child: Icon(Icons.edit,color: Colors.white,)),
              GestureDetector(onTap: (){
                setState(() {
                  lst.removeAt(index);
                });
              },child: Icon(Icons.delete,color: Colors.white)),
            ],),
          ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(context: context, builder: (context){
          return AlertDialog(
            title: Text("Add Item"),
            content: TextField(onChanged: (value){
              output = value;
            },),
            actions: [
              ElevatedButton(onPressed: (){
                setState(() {
                  lst.add(output);
                });
                Navigator.pop(context);
              }, child: Text("Save"))
            ],

          );
        });
      },
      backgroundColor: Colors.white,
       child: Icon(Icons.add,size: 30,color: Colors.black,)),
    );
  }
}
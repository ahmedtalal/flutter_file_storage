import 'package:files_storege/DataBases/fileStorage.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const String ID = "/home" ;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var counter = 0 ;
  
  @override
  void initState() {
    super.initState();
    FileStorage.getInstance().readData().then((value){
      setState(() {
        counter = value ;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "File Storage"
        ),
      ),
      body: Center(
        child: Text("the counter is $counter"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          setState(() {
            counter++ ;
          });
          FileStorage.getInstance().writeData(counter) ;
        },
      ),
    );
  }
}
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileStorage {
  static FileStorage _fileStorage ;

  // this method is used to create only one instance from this class 
  static FileStorage getInstance(){
    if (_fileStorage == null) {
      return _fileStorage = FileStorage() ;
    }
    return _fileStorage ;
  }


  // this method is used to specify the folder location
  Future<String> _getLocation() async{
   var location = await getApplicationDocumentsDirectory();
   return location.path;
  }


  //this method is used to save file 
  Future<File> _createFileLocation() async{
    String filePath =await _getLocation() ;
    return File('$filePath/counter.txt') ; 
  }


  // this method is used to write data in the file 
  Future<File> writeData(int counter) async{
    File file = await _createFileLocation() ;
    return file.writeAsString("$counter") ;
  }

  // this method is used to get data from the file 
  Future<int> readData() async{
    try {
      File file  = await _createFileLocation() ;
      return int.parse( await file.readAsString()) ;
    } catch (e) {
      return 0 ;
    }
  }
  
}
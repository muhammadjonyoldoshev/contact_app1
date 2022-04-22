import 'dart:convert';
import 'dart:io';
import 'package:contact_app1/models/contact_model.dart';
import 'package:contact_app1/services/io_services.dart';
import 'package:contact_app1/services/ext_services.dart';
import 'package:contact_app1/services/lang_service.dart';

class FileService{
  Directory directory = Directory(Directory.current.path + "\\assets\\files");

  /// Initialization of the file json
  Future<void> init () async {
    /// change the language
    LangService.language = Language.en;
    bool isDirectoryCreated = await directory.exists();
    if(!isDirectoryCreated){
      await directory.create();
    }
  }

  ///This method to use for creat file
  Future<String> createFile(String title) async{
    File file = File(directory.path + "\\$title.contact");
    bool isFileCreated = await file.exists();
    if(isFileCreated){
      throw Exception("ContactIsCreated: ".tr);
    }
    await file.create();
    return file.path;
  }

  ///This method to use for write file
  Future<String> writeFile(Contact contact, String path) async {
    File file = File(path);
    await file.writeAsString(jsonEncode(contact.toJson()));
    await file.setLastModified(DateTime.parse(contact.time));
    return file.path;
  }

  ///This method to use for read file
  Future<Contact> readFile(String title) async {
    File file = File(directory.path + "\\$title.contact");
    bool isFileCreated = await file.exists();
    if(!isFileCreated){
      throw Exception("NoContact: ".tr);
    }
    String result = await file.readAsString();
    Contact contact = Contact.fromJson(jsonDecode(result));
    return contact;
  }

  ///This method to use for update file
  Future<String> updateFile(String title) async {
    String path = directory.path + "\\$title.contact";
    Contact contact = await readFile(title);
    
    writeln("NewContactNumber: ".tr);
    write(contact);
    writeln("NewContactNumber1: ".tr);
    String content = "";
    String exit = "";
    while(exit != 'save'){
      exit = read();
      if(exit == 'save'){
        break;
      }
      content += (exit + '\n');
    }
    contact.number = content;
    contact.time = DateTime.now().toString();
    return await writeFile(contact, path);
  }

  ///This method to use for delete file
  Future<String> deleteFile(String title) async{
    File file = File(directory.path + "\\$title.contact");
    bool isFileCreated = await file.exists();
    if(isFileCreated){
      await file.delete();
    }else{
      return 'Bunday kontakt mavjud emas';
    }
    return 'Deleted';
  }
}
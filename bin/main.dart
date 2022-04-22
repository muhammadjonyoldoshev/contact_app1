import 'package:contact_app1/models/contact_model.dart';
import 'package:contact_app1/services/file_services.dart';
import 'package:contact_app1/services/io_services.dart';
import 'package:contact_app1/services/ext_services.dart';
import 'package:contact_app1/services/lang_service.dart';
void main() async {
  /// Initialization of the file json
  FileService fileService = FileService();
  await fileService.init();
  /// change the language
  LangService.language = Language.en;

  /// atribute
  String name = "";
  String number = "";
  String exit = "";

  print("ContactName: ".tr);
  name = read();

 //await fileService.updateFile(number);

  await fileService.deleteFile(name);

  // Contact contact = await fileService.readFile(name);
  // print(contact);

  // String path = await fileService.createFile(name);
  // writeln("ContactSave: ".tr);
  // while(exit != 'save') {
  //   exit = read();
  //   if (exit == 'save') {
  //     break;
  //   }
  //   number += (exit + '');
  // }
  // Contact contact = Contact(name: name, number: number);
  // await fileService.writeFile(contact, path).then((value) => print("ContactSuccesfully: ".tr));
 }
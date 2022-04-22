import 'dart:io';

void write<G>(G object){
  stdout.write(object);
}

void writeln<G>(G object){
  stdout.write(object);
}

String read(){
  String result = stdin.readLineSync() ?? '';
  return result;
}
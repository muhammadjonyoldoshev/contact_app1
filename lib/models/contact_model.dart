class Contact{
  // fields
  late String name;
  late String number;
  late String time;

  // constructor
  Contact({required this.name, required this.number}){
    time = DateTime.now().toString();
  }

  // fromjson => object
  Contact.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    number = json['number'];
    time = json['time'];
  }

  // toJson => object => string
  Map<String, dynamic> toJson() => {
    'name': name,
    'number': number,
    'time': time,
  };

  @override
  String toString() {
    // TODO: implement toString
    return "Name: $name\nPhoneNumber: $number";
  }
}
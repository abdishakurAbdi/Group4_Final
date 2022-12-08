class Employee {
  final String id;
  final String employeeID;
  final String password;
  final String fname;
  final String lname;
  Employee._(this.id, this.employeeID, this.password, this.fname, this.lname);
  factory Employee.fromJson(Map json) {
    final id = json[''].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
    final employeeID = json['employeeID'];
    final password = json['password'];
    final fname = json['fname'];
    final lname = json['lname'];
    return Employee._(id, employeeID, password, fname, lname);
  }
}

class Customer {
  final String id;
  final String fname;
  final String lname;
  final String email;
  final String phonenumber;
  Customer._(this.id, this.fname, this.lname, this.email, this.phonenumber);
  factory Customer.fromJson(Map json) {
    final id = json[''].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
    final fname = json['fname'];
    final lname = json['lname'];
    final email = json['email'];
    final phonenumber = json['phonenumber'];
    return Customer._(id, fname, lname, email, phonenumber);
  }
}
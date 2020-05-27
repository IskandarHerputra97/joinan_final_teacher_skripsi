class User {
  var id;
  String nama;
  String email;
  String password;


  User(
      {this.id,this.nama,this.email,this.password});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    email = json['email'];
    password = json['password'];
  }
}
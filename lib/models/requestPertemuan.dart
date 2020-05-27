class RequestPertemuan {
  var pertemuanID;
  String emailStudent;
  String namaStudent;
  String emailTeacher;
  String namaTeacher;
  String namaCourse;
  String tanggal;
  String jam;
  String lokasi;
  String status;

  RequestPertemuan(
      {this.pertemuanID,this.emailStudent,this.namaStudent,this.emailTeacher,this.namaTeacher,this.namaCourse,this.tanggal,this.jam,this.lokasi,this.status});

  RequestPertemuan.fromJson(Map<String, dynamic> json) {
    pertemuanID = json['pertemuanID'];
    emailStudent = json['emailStudent'];
    namaStudent = json['namaStudent'];
    emailTeacher = json['emailTeacher'];
    namaTeacher = json['namaTeacher'];
    namaCourse = json['namaCourse'];
    tanggal = json['tanggal'];
    jam = json['jam'];
    lokasi = json['lokasi'];
    status = json['status'];
  }
}
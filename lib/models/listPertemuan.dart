class ListPertemuan {
  int requestID;
  int courseID;
  String tanggal;
  String jam;
  String lokasi;


  ListPertemuan(
      {this.requestID,this.courseID,this.tanggal,this.jam,this.lokasi});

  ListPertemuan.fromJson(Map<String, dynamic> json) {
    requestID = json['requestID'];
    courseID = json['courseID'];
    tanggal = json['tanggal'];
    jam = json['jam'];
    lokasi = json['lokasi'];
  }
}
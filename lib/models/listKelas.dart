class ListKelas {
  //int courseID;
  var courseID;
  String courseName;
  String courseDescription;
  String courseImage;

  ListKelas(
      {this.courseID,this.courseName,this.courseDescription,this.courseImage});

  ListKelas.fromJson(Map<String, dynamic> json) {
    courseID = json['courseID'];
    courseName = json['courseName'];
    courseDescription = json['courseDescription'];
    courseImage = json['courseImage'];
  }
}
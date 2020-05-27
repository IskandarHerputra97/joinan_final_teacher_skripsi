class KelasTeacher {
  //int courseID;
  var courseID;
  String courseName;
  String courseDescription;
  String courseImage;

  KelasTeacher(
      {this.courseID, this.courseName, this.courseDescription, this.courseImage});

  KelasTeacher.fromJson(Map<dynamic, dynamic> json) {
    courseID = json['courseID'];
    courseName = json['courseName'];
    courseDescription = json['courseDescription'];
    courseImage = json['courseImage'];
  }
}

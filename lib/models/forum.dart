class Forum {
  var postID;
  var courseID;
  String userEmail;
  String postContent;
  String timePosted;

  Forum(
      {this.postID,this.courseID,this.userEmail,this.postContent,this.timePosted});

  Forum.fromJson(Map<String, dynamic> json) {
    postID = json['postID'];
    courseID = json['courseID'];
    userEmail = json['userEmail'];
    postContent = json['postContent'];
    timePosted = json['timePosted'];
  }
}
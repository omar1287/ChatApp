class PostModel{
  String ?name;
  String ?UId;
  String ?image;
  String ?PostImage;
  String ?Text;
  String ?Date;
  PostModel({

    this.Text,
    this.name,
    this.PostImage,
    this.image,
    this.UId,
    this.Date

  });
  PostModel.fromJson(Map<String,dynamic>?json){
    Text=json?['Text'];
    PostImage=json?['PostImage'];
    name=json?['name'];
    UId=json?['UId'];
    image=json?['image'];
    Date=json?['Date'];
  }
  Map<String,dynamic> ToMap(){
    return {
      'PostImage':PostImage,
      'Text':Text,
      'name':name,
      'UId':UId,
      'image':image,
      'Date':Date

    };
  }
}
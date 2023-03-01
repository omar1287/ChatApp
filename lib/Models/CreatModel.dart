class CreatModel{
  String ?name;
  String ?phone;
  String ?email;
  String ?UId;
  String ?image;
  String?cover;
  bool ?isViridied;
  String ?bio;
  CreatModel({
    this.bio,
    this.email,
    this.name,
    this.phone,
    this.image,
    this.cover,
    this.UId,
     this.isViridied
});
  CreatModel.fromJson(Map<String,dynamic>?json){
    bio=json?['bio'];
    email=json?['email'];
    name=json?['name'];
    phone=json?['phone'];
    UId=json?['UId'];
isViridied=json?['isViridied'];
image=json?['image'];
cover= json?['cover'];
  }
  Map<String,dynamic> ToMap(){
    return {
      'bio':bio,
      'email':email,
      'name':name,
      'phone':phone,
      'UId':UId,
      'isViridied':isViridied,
      'image':image,
      'cover':cover

    };
  }
}
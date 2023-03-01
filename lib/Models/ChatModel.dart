class ChatModel{
  String ?Date;
  String ?ReciverId;
  String ?SendId;
  String ?Text;

  ChatModel({
    this.Date,
    this.ReciverId,
    this.SendId,

    this.Text,
  });
  ChatModel.fromJson(Map<String,dynamic>?json){
    Date=json?['Date'];
    ReciverId=json?['ReciverId'];
    SendId=json?['SendId'];
    Text=json?['Text'];


  }
  Map<String,dynamic> ToMap(){
    return {
      'Date':Date,
      'ReciverId':ReciverId,
      'SendId':SendId,
      'Text':Text,


    };
  }
}
class UserModel {
String? uid;
String? email;
String? name;
int? phoneNumber;

UserModel({this.uid,this.email,this.name,this.phoneNumber});
//recive data from sever
factory UserModel.fromMap(map){
  return UserModel(
    uid: map['uid'],
    email: map['email'],
    name: map['name'],
    phoneNumber: map['phoneNumber'],
  );
}
//send data to server
Map<String,dynamic> toMap(){
  return {
    'uid':uid,
    'email':email,
    'name':name,
    'phoneNumber':phoneNumber,
  };
}
}
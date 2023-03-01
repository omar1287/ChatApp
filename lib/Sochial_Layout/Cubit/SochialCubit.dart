import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chat_app/Models/ChatModel.dart';
import 'package:chat_app/Models/CreatModel.dart';
import 'package:chat_app/Modules/Chat/Chat_Screen.dart';
import 'package:chat_app/Modules/Home/Home_Screen.dart';
import 'package:chat_app/Modules/Post/Bloc/PostModel/PostModel.dart';
import 'package:chat_app/Modules/Post/Post_Screen.dart';
import 'package:chat_app/Modules/Setting/Settings.dart';
import 'package:chat_app/Modules/Users/Users.dart';
import 'package:chat_app/Saved/Saved.dart';
import 'package:chat_app/Sochial_Layout/Cubit/SochialState.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as p;

class SochialCubit extends Cubit<SochialState> {
  SochialCubit() : super(SochialIntialState());

  static SochialCubit get(context) => BlocProvider.of(context);
  CreatModel? creatModel;

  void GetData() {
    emit(SochialLoadingState());
    FirebaseFirestore.instance.collection('Users').doc(UId).get().then((value) {
      creatModel = CreatModel.fromJson(value.data());
      emit(SochialSucssesState());
    }).catchError((e) {
      print(e.toString());
      emit(SochialErorrState());
    });
  }

  List<Widget> Screens = [Home(), Chat(), Post(), User(), Setting()];
  List<Widget> AppTitle = [
    Text('Home',
        style: TextStyle(
            color: Colors.black87,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700)),
    Text('Chat',
        style: TextStyle(
            color: Colors.black87,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700)),
    Text('Post',
        style: TextStyle(
            color: Colors.black87,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700)),
    Text('User',
        style: TextStyle(
            color: Colors.black87,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700)),
    Text('Settings',
        style: TextStyle(
            color: Colors.black87,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700)),
  ];
  int CurrentIndex = 0;

  void ChangeScreen(index) {
    if (index == 1)
      Chats1();
    if (index == 2)
      emit(SochialChangePostState());
    else {
      CurrentIndex = index;
      emit(SochialChangeState());
    }
  }

  File? image;
  File? Cover;

  Future<void> Getimage() async {
    final pickedimage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedimage != null) {
      image = File(pickedimage.path);
      emit(SochialImageSucssesState());
    }
  }

  Future<void> GetCover() async {
    final pickedCover =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedCover != null) {
      Cover = File(pickedCover.path);
      emit(SochialCoverSucssesState());
    }
  }

  String? imagpro;

  String? Coverpro;

  void UpDate(
      {required String name, required String bio, required String phone}) {
    emit(SochialLoadingImageState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('Users/${Uri
        .file(image!.path)
        .pathSegments
        .last}')
        .putFile(image!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        imagpro = value;
        emit(SochialUpDateimageSucssesState());
        CreatModel creatModel = new CreatModel(
          bio: bio,
          name: name,
          phone: phone,
          cover:
          'https://img.freepik.com/free-photo/breathtaking-shot-beautiful-stones-turquoise-water-lake-hills-background_181624-12847.jpg?w=1380&t=st=1676403738~exp=1676404338~hmac=e72eb169f3b4531d8902ec1fcc43715085f2afeb2626feff11f6203daf9e4961',
          image: value,
          UId: UId,
          isViridied: false,
        );
      }).catchError((e) {
        emit(SochialUpDateimageErorrState());
      });
    }).catchError((e) {
      emit(SochialUpDateimageErorrState());
    });
  }

  void UpDateCover(
      {required String name, required String bio, required String phone}) {
    emit(SochialLoadingCoverState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('Users/${Uri
        .file(Cover!.path)
        .pathSegments
        .last}')
        .putFile(Cover!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        CreatModel creatModel = new CreatModel(
          bio: bio,
          name: name,
          phone: phone,
          cover: value,
          image:
          'https://img.freepik.com/free-photo/bohemian-man-with-his-arms-crossed_1368-3542.jpg?w=826&t=st=1676403689~exp=1676404289~hmac=41024929688860ca1c1a0c1e19e032a0f327a8629f6d57985da64f85e4cf6d1d',
          UId: UId,
          isViridied: false,
        );
        emit(SochialUpDateCoverSucssesState());
        print(value);
      }).catchError((e) {
        emit(SochialUpDateCoverErorrState());
      });
    }).catchError((e) {
      emit(SochialUpDateCoverErorrState());
    });
  }

  void UpDtaeAll({required String name,
    required String bio,
    required String phone,
    required String? image,
    required String? cover}) {
    emit(SochialUpDateAllLoadingState());
    CreatModel creatModel = new CreatModel(
      bio: bio,
      name: name,
      phone: phone,
      cover: cover ??
          'https://img.freepik.com/free-photo/breathtaking-shot-beautiful-stones-turquoise-water-lake-hills-background_181624-12847.jpg?w=1380&t=st=1676403738~exp=1676404338~hmac=e72eb169f3b4531d8902ec1fcc43715085f2afeb2626feff11f6203daf9e4961',
      image: image ??
          'https://img.freepik.com/free-photo/bohemian-man-with-his-arms-crossed_1368-3542.jpg?w=826&t=st=1676403689~exp=1676404289~hmac=41024929688860ca1c1a0c1e19e032a0f327a8629f6d57985da64f85e4cf6d1d',
      UId: UId,
      isViridied: false,
    );
    FirebaseFirestore.instance
        .collection('Users')
        .doc(UId)
        .update(creatModel.ToMap())
        .then((value) {
      GetData();
      emit(SochialUpDateAllSucssesState());
    }).catchError((e) {
      emit(SochialUpDateAllErorrState());
    });
  }

  void GetData1() {
    emit(SochialLoading1State());
    FirebaseFirestore.instance.collection('Users').doc(UId).get().then((value) {
      creatModel = CreatModel.fromJson(value.data());
      emit(SochialSucssesS1tate());
    }).catchError((e) {
      print(e.toString());
      emit(SochialErorr1State());
    });
  }

  File? PostImage;

  Future<void> GetPostImage() async {
    XFile? PickedPost =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (PickedPost != null) {
      PostImage = File(PickedPost.path);
      emit(SochialPostSucssesState());
    }
  }

  void PostData({
    required String Text,
    required String Date,
  }) {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('images')
        .child(DateTime
        .now()
        .millisecondsSinceEpoch
        .toString())
        .putFile(PostImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        PostWithoutImage(
          Text: Text,
          Date: Date,
          PostImage: value,
        );
      }).catchError((e) {});
    }).catchError((e) {});
  }

  void PostWithoutImage(
      {required String Text, required String Date, String? PostImage}) {
    emit(SochialPostLoadingImageState());
    PostModel postModel = PostModel(
        name: creatModel?.name,
        UId: creatModel?.UId,
        image: creatModel?.image,
        Text: Text,
        Date: Date,
        PostImage: PostImage ?? '');
    FirebaseFirestore.instance
        .collection('Posts')
        .add(postModel.ToMap())
        .then((value) {
      emit(SochialPostSucssesState1());
    }).catchError((e) {
      emit(SochialPostErorrState());
    });
  }

  void removePostImage() {
    PostImage = null;
    emit(SochialRemovePostImageState());
  }

  List<PostModel> posts = [];
  List<String> UID = [];
  List<int> Likes = [];

  void getDataPost() {
    emit(SochialGetPostErorr1State());
    FirebaseFirestore.instance.collection('Posts').get().then((value) {
      value.docs.forEach((element) {
        element.reference.collection('Likes').get().then((value) {
          Likes.add(value.docs.length);
          emit(SochialintLikePostSucssesState());
          UID.add(element.id);

          posts.add(PostModel.fromJson(element.data()));
        }).catchError((e) {
          emit(SochialintLikePostErorr1State());
        });
      });

      emit(SochialGetPostSucssesState());
    }).catchError((e) {
      emit(SochialGetPostErorr1State());
    });
  }

  void PostLike(String postid) {
    FirebaseFirestore.instance
        .collection('Posts')
        .doc(postid)
        .collection('Likes')
        .doc(creatModel!.UId)
        .set({"value": true}).then((value) {
      emit(SochialLikePostSucssesState());
    }).catchError((e) {
      emit(SochialLikePostErorr1State());
    });
  }

  List<CreatModel>Chats = [];

  void Chats1() {
    if (Chats.length == 0)
      FirebaseFirestore.instance
          .collection('Users')
          .get()
          .then((value) {
        value.docs.forEach((element) {
          if (element.data()["UId"] != creatModel?.UId) {
            Chats.add(CreatModel.fromJson(element.data()));
          }
        });

        emit(SochiaChatSucssesState());
      })
          .catchError((e) {
        print(e.toString());
        emit(SochialChatErorr1State());
      });
  }

  void GetMassage(
      {required String ReciverId, required String Date, required String Text}) {
    ChatModel chatModel = ChatModel(
        ReciverId: ReciverId,
        Date: Date,
        Text: Text
    );
    FirebaseFirestore.instance.collection("Users").doc(creatModel?.UId)
        .collection("Chats").doc(ReciverId).collection("Massages").add(
        chatModel.ToMap()).then((value) {
          print("جامد");
          emit(SochialGetMassageSucssesState());
    })
        .catchError((e) {
          emit(SochialGetMassageErorr1State());
    })
    ;
  }
}

import 'package:chat_app/Models/CreatModel.dart';
import 'package:chat_app/Regester/Cubit/RegState.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterIntialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void Register(
      {required String email,
      required String pass,
      required String name,
      required String phone}) {
    emit(RegisterLoadingState());
    print('hello');

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((value) {

     UserCreat(email: email, UId: value.user!.uid, name: name, phone: phone,);
    }).catchError((erorr) {
      emit(RegisterErorrState());
      print(erorr.toString());
    });
  }

  void UserCreat(
      {required String email,
      required String UId,
      required String name,
      required String phone}) {
    CreatModel creatModel = new CreatModel(
      bio: 'Write Your Bio',
      email: email,
      name: name,
      phone: phone,
      cover: 'https://img.freepik.com/free-photo/breathtaking-shot-beautiful-stones-turquoise-water-lake-hills-background_181624-12847.jpg?w=1380&t=st=1676403738~exp=1676404338~hmac=e72eb169f3b4531d8902ec1fcc43715085f2afeb2626feff11f6203daf9e4961',
      image: 'https://img.freepik.com/free-photo/bohemian-man-with-his-arms-crossed_1368-3542.jpg?w=826&t=st=1676403689~exp=1676404289~hmac=41024929688860ca1c1a0c1e19e032a0f327a8629f6d57985da64f85e4cf6d1d',
      UId: UId,
      isViridied: false,
    );
    FirebaseFirestore.instance.collection('Users')
        .doc(UId)
        .set(creatModel.ToMap())
        .then((value) {
          print('suc');
          emit(CreatingSuccesState());

    })
        .catchError((e) {
          print(e.toString());
          emit(CreatingErorrState());
    });
  }
}

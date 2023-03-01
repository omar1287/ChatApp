import 'package:chat_app/Models/CreatModel.dart';
import 'package:chat_app/Modules/UpLoad/cubit/UpLoadState.dart';
import 'package:chat_app/Saved/Saved.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpLoadCubit extends Cubit<UpLoadState> {
  UpLoadCubit() : super(UpLoadIntialState());

  static UpLoadCubit get(context) => BlocProvider.of(context);
  CreatModel? creatModel;

  void GetData() {
    emit(UpLoadLoadingState());
    FirebaseFirestore.instance.collection('Users').doc(UId).get().then((value) {
      creatModel = CreatModel.fromJson(value.data());
      emit(UpLoadSucssesState());
    }).catchError((e) {
      print(e.toString());
      emit(UpLoadErorrState());
    });
  }





}

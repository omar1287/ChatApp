
import 'package:chat_app/Login/Cubit/LoginState.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(LoginInatialState());
  static LoginCubit get(context)=>BlocProvider.of(context);

  void Login({required String email,required String pass}){
    emit(LoginLoadingState());
FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password:pass).then((value) {
  emit(LoginSucssesState(UId: value.user!.uid));
  print(value.user!.email);

}).catchError((erorr){
  emit(LoginErorrState());
  print(erorr.toString());
});
  }

}
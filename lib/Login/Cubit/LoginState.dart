abstract class LoginState{}
class LoginInatialState extends LoginState{}
class LoginLoadingState extends LoginState{}
class LoginSucssesState extends LoginState{
 final String UId;
  LoginSucssesState({required this.UId});
}
class LoginErorrState extends LoginState{}
class LoginScureState extends LoginState{}
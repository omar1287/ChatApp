import 'package:chat_app/Login/Cubit/LoginCubit.dart';
import 'package:chat_app/Login/Cubit/LoginState.dart';
import 'package:chat_app/NetWork/CachHelper.dart';
import 'package:chat_app/Regester/Register.dart';
import 'package:chat_app/Sochial_Layout/Sochial_Layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var Emailcon = TextEditingController();
    var Passcon = TextEditingController();
    var ForKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image(
                    image: AssetImage('images/back.jpg'),
                    fit: BoxFit.cover,
                  )),
              Form(
                key: ForKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 150, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          controller: Emailcon,
                          validator: (e) {
                            if (e!.isEmpty) {
                              return 'Email is empty';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              labelText: 'E-Mail',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                              suffixIcon: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              suffixStyle: TextStyle(color: Colors.white),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2))),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: Passcon,
                          validator: (e) {
                            if (e!.isEmpty) {
                              return 'Password is Empty';
                            } else {
                              return null;
                            }
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                              suffixIcon: Icon(
                                Icons.remove_red_eye,
                                color: Colors.white,
                              ),
                              suffixStyle: TextStyle(color: Colors.white),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2))),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 300,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (ForKey.currentState!.validate()) {
                                      LoginCubit.get(context).Login(
                                          email: Emailcon.text,
                                          pass: Passcon.text);
                                    }
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.black),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Text(
                          'If you dont have account ?',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()),
                                  (route) => false);
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }, listener: (context, state) {
        if (state is LoginSucssesState) {
          CachHelper.SetData(key: 'UId', value: state.UId)
              .then((value) {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SochialLayOut()), (route) => false);
          })
              .catchError((e) {
            print(e.toString());
          });
        }
      }),
    );
  }
}

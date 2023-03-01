import 'package:chat_app/Login/Login_Screen.dart';
import 'package:chat_app/Regester/Cubit/RegCubit.dart';
import 'package:chat_app/Regester/Cubit/RegState.dart';
import 'package:chat_app/Sochial_Layout/Sochial_Layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var forkey = GlobalKey<FormState>();
    var EmailCon = TextEditingController();
    var PersonCon = TextEditingController();
    var PassCon = TextEditingController();
    var PhoneCon = TextEditingController();

    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
          builder: (context, state) {
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
                    key: forkey,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 150, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Register',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            TextFormField(
                              controller: PersonCon,
                              validator: (index) {
                                if (index!.isEmpty) {
                                  return 'You must put your User name';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: 'User_Name',
                                  labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                  suffixIcon: Icon(
                                    Icons.person,
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
                              controller: EmailCon,
                              validator: (index) {
                                if (index!.isEmpty) {
                                  return 'You must put your E-Mail';
                                }
                                return null;
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
                              controller: PassCon,
                              obscureText: true,
                              validator: (index) {
                                if (index!.isEmpty) {
                                  return 'You must put your Password';
                                }
                                return null;
                              },
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
                              height: 15,
                            ),
                            TextFormField(
                              controller: PhoneCon,
                              validator: (index) {
                                if (index!.isEmpty) {
                                  return 'You must put your User Phone';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: 'Phone',
                                  labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                  suffixIcon: Icon(
                                    Icons.phone_android,
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
                                        if (forkey.currentState!.validate()) {
                                          RegisterCubit.get(context).Register(
                                              email: EmailCon.text,
                                              pass: PassCon.text,
                                              name: PersonCon.text,
                                              phone: PhoneCon.text);
                                        }
                                      },
                                      child: Text(
                                        'Register',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.black),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()),
                                      (route) => false);
                                },
                                child: Text(
                                  'Back To Login Screen',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                ))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          listener: (context, state) {
            if(state is CreatingSuccesState){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SochialLayOut()), (route) => false);
            }
          }),
    );
  }
}

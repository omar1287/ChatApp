import 'package:chat_app/Login/Login_Screen.dart';
import 'package:chat_app/NetWork/CachHelper.dart';
import 'package:chat_app/Saved/Saved.dart';
import 'package:chat_app/Sochial_Layout/Cubit/SochialCubit.dart';
import 'package:chat_app/Sochial_Layout/Cubit/SochialState.dart';
import 'package:chat_app/Sochial_Layout/Sochial_Layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 await CachHelper.init();
   UId=CachHelper.getData(key: 'UId');
  Widget Change1;
  if(UId !=null){
    Change1=SochialLayOut();

  }else{
    Change1=Login();
  }
  runApp( MyApp(Change: Change1,));
}

class MyApp extends StatelessWidget {
  Widget Change;
  MyApp({required this.Change});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>SochialCubit(),
    child: BlocConsumer<SochialCubit,SochialState>(
        builder: (context,state){
          return MaterialApp(

          darkTheme: ThemeData(
          scaffoldBackgroundColor: Colors.black54,

          textTheme: TextTheme(
          bodyText1: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20
          )
          ),

          ),
          theme: ThemeData(
          buttonColor: Colors.black87,
          iconTheme: IconThemeData(
          color: Colors.black87
          ),
          textTheme: TextTheme(

          bodyText1: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 20
          )
          ),
          appBarTheme: AppBarTheme(
          color: Colors.white,

          systemOverlayStyle: SystemUiOverlayStyle(

      statusBarIconBrightness: Brightness.light


      )
      ),

      primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.light,

      home:Change,
      debugShowCheckedModeBanner: false,

      );
      },
      listener: (context,state){

      },
    )
    );
  }
}


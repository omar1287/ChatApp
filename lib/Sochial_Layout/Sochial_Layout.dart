import 'package:chat_app/Modules/Post/Post_Screen.dart';
import 'package:chat_app/Shared/Style/icon_broken.dart';
import 'package:chat_app/Sochial_Layout/Cubit/SochialCubit.dart';
import 'package:chat_app/Sochial_Layout/Cubit/SochialState.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class SochialLayOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => SochialCubit()..GetData()..GetData1()..getDataPost(),
      child: BlocConsumer<SochialCubit, SochialState>(
        listener: (context, state) {
          if(state is SochialChangePostState){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Post()));
            SochialCubit.get(context).CurrentIndex=0;
          }

        },
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: CurvedNavigationBar(
              color:HexColor('#862d59'),

                backgroundColor: Colors.white,

                height: 50,
                animationDuration:Duration(
                  microseconds: 200
                ),
             items: [
               Icon(IconBroken.Home,color: Colors.white,),
               Icon(IconBroken.Chat,color: Colors.white),
               Icon(IconBroken.Send,color: Colors.white),
               Icon(IconBroken.Profile,color: Colors.white),
               Icon(IconBroken.Setting,color: Colors.white),


             ],

              index: SochialCubit.get(context).CurrentIndex,
              onTap: (index) {
                SochialCubit.get(context).ChangeScreen(index);
              },
            ),
            backgroundColor: Colors.white,
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: (){},
                  icon: Icon(IconBroken.Notification,color: Colors.purple,),

                ),
                IconButton(
                  onPressed: (){},
                  icon: Icon(IconBroken.Search,color: Colors.purple,),

                )
              ],
              title:
               Row(
                 children: [
                   CircleAvatar(
                     radius: 26,
                     backgroundColor: Colors.purple,
                     child: CircleAvatar(
                       radius: 25,
                        backgroundImage: NetworkImage('https://img.freepik.com/premium-psd/logo-mockup-front-3d-gold-marble_145275-411.jpg?w=1380'),
                      ),
                   ),
                   SizedBox(
                     width: 5,
                   ),
                   Text('ChatApp',style: TextStyle(
                     color: Colors.purple,
                     fontWeight: FontWeight.w800,
                     fontStyle: FontStyle.italic

                   ),)
                 ],
               ),

              elevation: 0.0,
              backgroundColor: Colors.white,
            ),
            body: ConditionalBuilder(
              condition: SochialCubit.get(context).creatModel != null,
              builder: (context) => SochialCubit.get(context).Screens[SochialCubit.get(context).CurrentIndex],
              fallback: (context) => Center(
                child: CircularProgressIndicator(
                  color: Colors.deepPurple,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

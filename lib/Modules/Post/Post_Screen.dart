import 'package:chat_app/Shared/Style/icon_broken.dart';
import 'package:chat_app/Sochial_Layout/Cubit/SochialCubit.dart';
import 'package:chat_app/Sochial_Layout/Cubit/SochialState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var con=TextEditingController();

    final now = DateTime.now();
    return BlocProvider(
      
      create: (context)=>SochialCubit()..GetData(),
      child: BlocConsumer<SochialCubit, SochialState>(
          builder: (context,state){

            return Scaffold(
              appBar: AppBar(
                title: Text('Post',
                  style: TextStyle(
                      color: Colors.purple
                  ),),
                leading: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(IconBroken.Arrow___Left_2,color: Colors.purple,),
                ),
                actions: [
                  TextButton(onPressed: (){
                    if(SochialCubit.get(context).PostImage !=null){
                      SochialCubit.get(context).PostData(Text: con.text, Date: now.toString());
                    }else{
                      SochialCubit.get(context).PostWithoutImage(Text: con.text, Date: now.toString());
                    }
                  }, child: Text('Post',style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20
                  ),))
                ],
              ),
              body:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: con,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'write any thing you want ....'
                        ),
                      ),

                    ),
                    if(state is SochialPostSucssesState)
                    Stack(alignment: Alignment.topRight, children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                              image: DecorationImage(
                                  image:FileImage( SochialCubit.get(context).PostImage!),
                                  fit: BoxFit.cover)
                                 ),
                        ),
                      ),
                      CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.purple,
                          child: IconButton(
                              onPressed: () {
                               SochialCubit.get(context).removePostImage();
                              },
                              icon: Icon(
                                IconBroken.Delete,
                                color: Colors.white,
                              )))
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      elevation: 5,
                      child: Row(
                        children: [
                          Expanded(
                            child: MaterialButton(onPressed: (){
                              SochialCubit.get(context).GetPostImage();
                              print(SochialCubit.get(context).PostImage.toString());
                            },child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(IconBroken.Image,color: Colors.purple,),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Add Photo',
                                  style: TextStyle(
                                      color: Colors.purple
                                  ),)
                              ],
                            ),),
                          ),
                          Expanded(
                            child: MaterialButton(onPressed: (){},child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text('# Tags',
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 20
                                  ),)
                              ],
                            ),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }, listener:(context,state){}),
    );
  }
}

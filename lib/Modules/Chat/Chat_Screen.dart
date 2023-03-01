import 'package:chat_app/Models/CreatModel.dart';
import 'package:chat_app/Modules/Chat/MassageChat/Massage.dart';
import 'package:chat_app/Sochial_Layout/Cubit/SochialCubit.dart';
import 'package:chat_app/Sochial_Layout/Cubit/SochialState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
     BlocConsumer<SochialCubit,SochialState>(

      builder: (context,state){
    var creat=  SochialCubit.get(context).creatModel;
        return ListView.separated(itemBuilder: (context,index)=>List1(SochialCubit.get(context).Chats[index],context),
            separatorBuilder:(context,index)=>SizedBox(
              height: 10,
            ),
            itemCount: SochialCubit.get(context).Chats.length);
      },
      listener: (context,state){},
    );

  }

  Widget List1(CreatModel creatModel,context) =>
      InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Massage(creatModel)));
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    '${creatModel.image}'),
              ),
              SizedBox(
                width: 15
                ,
              ),
              Text(
                '${creatModel.name}',
                style: TextStyle(fontSize: 14),
              ),

            ],
          ),
        )
      );
}

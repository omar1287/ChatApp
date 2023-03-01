import 'package:chat_app/Models/CreatModel.dart';
import 'package:chat_app/Shared/Style/icon_broken.dart';
import 'package:chat_app/Sochial_Layout/Cubit/SochialCubit.dart';
import 'package:chat_app/Sochial_Layout/Cubit/SochialState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Massage extends StatelessWidget {
  CreatModel creatModel;

  Massage(this.creatModel);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SochialCubit, SochialState>(

        builder:(context,state){
          var Con=TextEditingController();
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage('${creatModel.image}'),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    '${creatModel.name}',
                    style: TextStyle(fontSize: 20, color: Colors.purple),
                  ),
                ],
              ),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    IconBroken.Arrow___Left_2,
                    color: Colors.purple,
                  )),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.only(
                          topEnd: Radius.circular(10),
                          topStart: Radius.circular(10),
                          bottomStart: Radius.circular(10),
                        ),
                        color: Colors.grey[350],
                      ),
                      child: Text(
                        "Hello Omar",
                        style: TextStyle(color: Colors.black87, fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.only(
                          topEnd: Radius.circular(10),
                          topStart: Radius.circular(10),
                          bottomEnd: Radius.circular(10),
                        ),
                        color: Colors.purple[300],
                      ),
                      child: Text(
                        "Hello sama",
                        style: TextStyle(color: Colors.black87, fontSize: 16),
                      ),
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(10)

                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(

                                width:300,
                                child: TextFormField(
                                  controller: Con,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Write Comment....."
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(onPressed: (){
                              SochialCubit.get(context).GetMassage(ReciverId: '${creatModel.UId}', Date: '${DateTime.now()}', Text: '${Con.text}');
                            }, child: Icon(IconBroken.Send),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.purple
                              ),)
                          ],
                        ),
                      )
                    ],
                  )

                ],
              ),
            ),
          );
        }, listener: (context,state){});
  }
}

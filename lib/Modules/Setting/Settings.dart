import 'package:chat_app/Sochial_Layout/UpLoad/UpLoad_Screen.dart';
import 'package:chat_app/Shared/Style/icon_broken.dart';
import 'package:chat_app/Sochial_Layout/Cubit/SochialCubit.dart';
import 'package:chat_app/Sochial_Layout/Cubit/SochialState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<SochialCubit,SochialState>(
      builder: (context,state){
        var cubit= SochialCubit.get(context).creatModel;
        return Column(

          children: [
            Container(
              height: 245,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    '${cubit!.cover}',
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 65,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                            '${cubit.image}'),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Text(
              '${cubit.name}',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${cubit.bio}",
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('100', style: Theme.of(context).textTheme.bodyText1),
                          Text(
                            'Posts',
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('100', style: Theme.of(context).textTheme.bodyText1),
                          Text(
                            'Posts',
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('100', style: Theme.of(context).textTheme.bodyText1),
                          Text(
                            'Posts',
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('100', style: Theme.of(context).textTheme.bodyText1),
                          Text(
                            'Posts',
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                          width: double.infinity,
                          child: OutlinedButton(
                              onPressed: () {},
                              child: Text(
                                'Add Photos',
                                style: TextStyle(color: HexColor('#862d59')),
                              ))),
                    ),
                  ),
                  OutlinedButton(
                      onPressed: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>UpLoad()));




                      },
                      child: Icon(
                        IconBroken.Edit,
                        color: HexColor('#862d59'),
                      ))
                ],
              ),
            ),
          ],
        );
      },
      listener: (context,state){},
    )
    ;
  }
}

import 'package:chat_app/Shared/Style/icon_broken.dart';
import 'package:chat_app/Sochial_Layout/Cubit/SochialCubit.dart';
import 'package:chat_app/Sochial_Layout/Cubit/SochialState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpLoad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SochialCubit()..GetData1(),
      child: BlocConsumer<SochialCubit, SochialState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SochialCubit.get(context).creatModel;
          var UserCon = TextEditingController();
          var BioCon = TextEditingController();
          var PassCon = TextEditingController();
          var image = SochialCubit.get(context).image;
          var Cover = SochialCubit.get(context).Cover;
          UserCon.text='${cubit!.name}';
          BioCon.text='${cubit.bio}';
          PassCon.text='${cubit.phone}';

          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Edit Profile',
                style: TextStyle(
                    color: Colors.purple,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              actions: [
                Container(
                  height: 400,
                  width: 100,
                  child: MaterialButton(
                    onPressed: () {

                      SochialCubit.get(context).UpDtaeAll(
                          name: UserCon.text,
                          bio: BioCon.text,
                          phone: PassCon.text,
                      image: SochialCubit.get(context).imagpro,
                        cover:SochialCubit.get(context).Coverpro
                      );
                      print(SochialCubit.get(context).imagpro);
                    },
                    child: Text(
                      'UpDate',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                )
              ],
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  IconBroken.Arrow___Left_2,
                  color: Colors.purple,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  if (state is SochialUpDateAllLoadingState)
                    LinearProgressIndicator(
                      color: Colors.purple,
                    ),
                  Container(
                    height: 245,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child:
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
                                      image: Cover == null
                                          ? DecorationImage(
                                              image: NetworkImage(
                                                '${cubit.cover}',
                                              ),
                                              fit: BoxFit.cover)
                                          : DecorationImage(
                                              image: FileImage(Cover),
                                              fit: BoxFit.cover)),
                                ),
                              ),
                              CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.purple,
                                  child: IconButton(
                                      onPressed: () {
                                        SochialCubit.get(context).GetCover();
                                      },
                                      icon: Icon(
                                        IconBroken.Camera,
                                        color: Colors.white,
                                      )))
                            ]),
                          ),
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 65,
                                backgroundColor: Colors.white,
                                child: image == null
                                    ? CircleAvatar(
                                        radius: 60,
                                        backgroundImage:
                                            NetworkImage('${cubit.image}'),
                                      )
                                    : CircleAvatar(
                                        radius: 60,
                                        backgroundImage: FileImage(image),
                                      ),
                              ),
                              CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.purple,
                                  child: IconButton(
                                      onPressed: () {
                                        SochialCubit.get(context).Getimage();
                                      },
                                      icon: Icon(
                                        IconBroken.Camera,
                                        color: Colors.white,
                                      )))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  if(state is SochialCoverSucssesState||state is SochialImageSucssesState)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    if(state is SochialImageSucssesState)
                    Expanded(child: ElevatedButton(onPressed: (){
                      SochialCubit.get(context).UpDate(name: UserCon.text, bio: BioCon.text, phone: PassCon.text);
                    }, child: Text('UpDate Photo'),style: ElevatedButton.styleFrom(
                        primary: Colors.purple
                    ),)),
                    SizedBox(
                      width: 5,
                    ),
                    if(state is SochialCoverSucssesState)
                    Expanded(child: ElevatedButton(onPressed: (){
                      SochialCubit.get(context).UpDate(name: UserCon.text, bio: BioCon.text, phone: PassCon.text);
                    }, child: Text('UpDate Cover'),style: ElevatedButton.styleFrom(
                        primary: Colors.purple
                    ),)),
                  ],
                ),
              ),
                  //,
                 //if(state is SochialUpDateimageSucssesState||state is SochialUpDateCoverSucssesState)
                 //  SizedBox(
                 //    height: 15,
                 //  )

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        TextFormField(
                            onTap: () {
                                UserCon.text = '${cubit.name}';

                            },
                            controller: UserCon,
                            decoration: InputDecoration(
                                label: Text('User'),
                                suffixIcon: Icon(
                                  IconBroken.User,
                                  color: Colors.purple,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.purple, width: 2),
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.purple, width: 2)))),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            controller: BioCon,

                            decoration: InputDecoration(
                                label: Text('Bio'),
                                suffixIcon: Icon(
                                  IconBroken.More_Circle,
                                  color: Colors.purple,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.purple, width: 2),
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.purple, width: 2)))),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            controller: PassCon,


                            decoration: InputDecoration(
                                labelText: 'Phone',
                                suffixIcon: Icon(
                                  IconBroken.Call,
                                  color: Colors.purple,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.purple, width: 2),
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.purple, width: 2),
                                ))),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

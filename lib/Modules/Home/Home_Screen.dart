import 'package:chat_app/Modules/Post/Bloc/PostModel/PostModel.dart';
import 'package:chat_app/Sochial_Layout/Cubit/SochialCubit.dart';
import 'package:chat_app/Sochial_Layout/Cubit/SochialState.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      SochialCubit()
        ..getDataPost()..GetData()..GetData1(),
      child: BlocConsumer<SochialCubit, SochialState>(
          builder: (context, state) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Card(

                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 10.0,
                      child: Image(
                        image: NetworkImage(
                            'https://img.freepik.com/free-photo/no-problem-concept-bearded-man-makes-okay-gesture-has-everything-control-all-fine-gesture-wears-spectacles-jumper-poses-against-pink-wall-says-i-got-this-guarantees-something_273609-42817.jpg?w=1380&t=st=1676319589~exp=1676320189~hmac=33f53819962c3d7495891c4a7c3ae3e7645186697c43738f2067d418f2a59787'),
                        width: double.infinity,
                        height: 220,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ConditionalBuilder(condition:SochialCubit.get(context).posts.length>0&&SochialCubit.get(context).creatModel !=null  ,
                      builder:(context)=>ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),

                          itemBuilder: (context,index)=>MoreCard(context,SochialCubit.get(context).posts[index],index), separatorBuilder: (context,index)=>SizedBox(
                        height: 5,
                      ), itemCount:SochialCubit.get(context).posts.length),
                      fallback:(context)=> Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.purple,
                          color: Colors.white,
                        ),
                      )),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            );
          }, listener: (context, state) {}),
    );
  }

  Widget MoreCard(context, PostModel postModel, index) =>
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 10.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          '${postModel.image}'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${postModel.name}',
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Icon(
                                Icons.check_circle,
                                color: Colors.blue,
                                size: 15,
                              ),
                            ],
                          ),
                          Text(
                            '${postModel.Date}',
                            style: Theme
                                .of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(fontSize: 10, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_horiz,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: Colors.grey[300],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${postModel.Text}',
                  style: TextStyle(height: 1.4, fontWeight: FontWeight.w800),
                ),
                Wrap(
                  children: [
                    Container(
                      width: 60,
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      child: MaterialButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          child: Text(
                            '#Flutter',
                            style: TextStyle(color: Colors.lightBlue),
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      child: MaterialButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          child: Text(
                            '#Sowftware',
                            style: TextStyle(color: Colors.lightBlue),
                          )),
                    )
                  ],
                ),
                if(postModel.PostImage != "")
                  Container(
                    width: double.infinity,
                    height: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(
                            '${postModel.PostImage}',
                          ),
                          fit: BoxFit.cover,
                        )),
                  ),
                if(postModel.PostImage != null)
                  SizedBox(
                    height: 5,
                  ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.red,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${SochialCubit.get(context).Likes[index]}',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w800),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.comment_outlined,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '120 Comment',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w800),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: Colors.grey[300],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 17,
                          backgroundImage: NetworkImage(
                              '${postModel.image}'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Write a Comment ...',
                          style: Theme
                              .of(context)
                              .textTheme
                              .caption!
                              .copyWith(
                              color: Colors.grey, fontWeight: FontWeight.w800),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            SochialCubit.get(context).PostLike(SochialCubit.get(context).UID[index]);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.red,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Like',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w800),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      );
}

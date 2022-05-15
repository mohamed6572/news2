import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_udemy/Shared/Cubit/cubit.dart';
import 'package:news_udemy/Shared/Cubit/states.dart';
import 'package:news_udemy/Shared/components/components.dart';
import 'package:news_udemy/modules/Search/search.dart';

class News_Layout extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var cubit = NewsCubit.get(context);

  return Scaffold(
    appBar: AppBar(
      title: Text('News'),
      actions: [
        IconButton(onPressed: (){
          navigateTo(context, Search());
        }, icon: Icon(Icons.search)),
        IconButton(onPressed: (){
          cubit.ChangeMode();
        }, icon: Icon(Icons.brightness_4_outlined)),
      ],
    ),
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: cubit.CurrentIndex,
      onTap: (index){
        cubit.ChangeBottomItem(index);
      },
      items: cubit.BottomItems,
    ),
    body: cubit.business.length >=0 ? cubit.Screans[cubit.CurrentIndex] :Center(child: CircularProgressIndicator(),) ,
  );
  }
}

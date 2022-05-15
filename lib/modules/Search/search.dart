import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_udemy/Shared/Cubit/cubit.dart';
import 'package:news_udemy/Shared/Cubit/states.dart';
import 'package:news_udemy/Shared/components/components.dart';

class Search extends StatelessWidget{
var SerachController = TextEditingController();
var fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var cubit= NewsCubit.get(context).search;
    return SafeArea(
        child: Scaffold(
          body: Form(
            key: fromKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: defultTextFeild(
                    label: 'Search',
                    controller: SerachController,
                    type: TextInputType.text,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'search Must Not Be Impety';
                      }
                      else
                        return null;
                    },
                     icon: Icons.search ,
                    onChanged: (String value){
                      NewsCubit.get(context).getSearch(q: value);
                    },



                  ),

                ),
                Expanded(child: ArticlaeBuilder(cubit, context))

              ],
            ),
          ),
        ));
  }
}

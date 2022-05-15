import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_udemy/Shared/Cubit/cubit.dart';
import 'package:news_udemy/Shared/Cubit/states.dart';
import 'package:news_udemy/Shared/components/components.dart';

class Sports extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var list = NewsCubit.get(context).sports;
    return BlocConsumer<NewsCubit,NewsStates>(
        builder: (context, state) => ArticlaeBuilder(list,context),
        listener: (context, state) {},
    );
  }
}

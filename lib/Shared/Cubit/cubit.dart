import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_udemy/Shared/Cubit/states.dart';
import 'package:news_udemy/Shared/network/local/cashe_helper.dart';
import 'package:news_udemy/Shared/network/remote/dio_helper.dart';
import 'package:news_udemy/modules/Buissnes/buissnes.dart';
import 'package:news_udemy/modules/Science/science.dart';
import 'package:news_udemy/modules/Sports/sports.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsIntialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int CurrentIndex = 0;
  List<Widget> Screans = [
     Buissnes(),
    Sports(),
    Science()
  ];

  List<BottomNavigationBarItem> BottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science'),
  ];
  void ChangeBottomItem(index) {
    CurrentIndex = index ;
    emit(NewsChangeBottomNavState());
  }

  List<dynamic> business = [];
  void getBuisness(){
    emit(NewsGetBusinessLoadingState());
    Dio_Helper.GetData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': '1beaef5108684a84ad7e3b73dbd2860c',
        }).then((value) {
          business = value?.data['articles'];
          print(business.length);
          emit(NewsGetBusinessSucsesState());
    }).catchError((e){
      print('the Error ${e.toString()}');
      emit(NewsGetBusinessErrorState(e));
    });


  }

  List<dynamic> sports = [];
  void getSports(){
    emit(NewsGetSportsLoadingState());

    if (sports.length==0){
      Dio_Helper.GetData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'sports',
            'apiKey': '1beaef5108684a84ad7e3b73dbd2860c',
          }).then((value) {
        sports = value?.data['articles'];
        print(sports.length);
        emit(NewsGetSportsSucsesState());
      }).catchError((e){
        print('the Error ${e.toString()}');
        emit(NewsGetSportsErrorState(e));
      });
    }else {
      emit(NewsGetSportsSucsesState());
    }



  }

  List<dynamic> science = [];
  void getScience(){
    emit(NewsGetScienceLoadingState());
    Dio_Helper.GetData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'Science',
          'apiKey': '1beaef5108684a84ad7e3b73dbd2860c',
        }).then((value) {
      science = value?.data['articles'];
      print(science.length);
      emit(NewsGetScienceSucsesState());
    }).catchError((e){
      print('the Error ${e.toString()}');
      emit(NewsGetScienceErrorState(e));
    });


  }


  List<dynamic> search = [];

  void getSearch({ required String q}){
    emit(NewsSearchLoadingState());
    Dio_Helper.GetData(
        url: 'v2/everything',
        query: {
          'q': '$q',
          'apiKey': '1beaef5108684a84ad7e3b73dbd2860c',
        }).then((value) {
      search = value?.data['articles'];
      emit(NewsSearchSucsesState());
    }).catchError((e){
      print('the Error ${e.toString()}');
      emit(NewsSearchErrorState(e));
    });


  }



  bool isDark = false;
  void ChangeMode({bool? fromSared}){
   if(fromSared != null){
     isDark= fromSared;
     emit(NewsChangeAppMode());

   }
   else{
     isDark = !isDark;
     Cashe_Helper.PutBoolen(key: 'isDark', value: isDark).then((value) =>  emit(NewsChangeAppMode()));

   }
    }

}
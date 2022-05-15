import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_udemy/Shared/Cubit/cubit.dart';
import 'package:news_udemy/Shared/Cubit/states.dart';
import 'package:news_udemy/Shared/network/local/cashe_helper.dart';
import 'package:news_udemy/layout/news_Layout.dart';

import 'Shared/Bloc_Observer.dart';
import 'Shared/network/remote/dio_helper.dart';

void main(){
 BlocOverrides.runZoned(
         () async{
           WidgetsFlutterBinding.ensureInitialized();
           Dio_Helper.Init();
           await Cashe_Helper.Init();
           bool? isDark = Cashe_Helper.getBoolen(key: 'isDark');
           runApp(MyApp(isDark));
         },blocObserver:MyBlocObserver() );



}

class MyApp extends StatelessWidget{
  final bool? isDark;
  MyApp(this.isDark);


  @override
  Widget build(BuildContext context) {


    return BlocProvider(
        create: (context) => NewsCubit()..getBuisness()..getSports()..getScience()..ChangeMode(
          fromSared: isDark
        ),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                    )
                ),
                appBarTheme: AppBarTheme(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  titleSpacing: 20,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark
                  ),
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                  ),
                  iconTheme: IconThemeData(
                      color: Colors.black
                  ),

                ),
                scaffoldBackgroundColor: Colors.white,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  elevation: 20,
                  backgroundColor: Colors.white,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  type: BottomNavigationBarType.fixed,
                )
            ),
            darkTheme: ThemeData(
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    )
                ),

                appBarTheme: AppBarTheme(
                  backgroundColor: HexColor('333637'),
                  elevation: 0,
                  titleSpacing: 20,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('333637'),
                      statusBarIconBrightness: Brightness.light
                  ),
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                  ),
                  iconTheme: IconThemeData(
                      color: Colors.white
                  ),

                ),
                scaffoldBackgroundColor: HexColor('333637'),
                primarySwatch: Colors.deepOrange,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  elevation: 20,
                  backgroundColor: HexColor('333637'),
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  type: BottomNavigationBarType.fixed,
                )
            ),
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,

            home: News_Layout(),
          );
        },
      ),
    );
  }
}

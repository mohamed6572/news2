 abstract class NewsStates{}

class NewsIntialState extends NewsStates {}
class NewsChangeBottomNavState extends NewsStates {}
 //business
class NewsGetBusinessLoadingState extends NewsStates {}
class NewsGetBusinessSucsesState extends NewsStates {}
class NewsGetBusinessErrorState extends NewsStates {
  final String error;
  NewsGetBusinessErrorState(this.error);
}

 //Sports
 class NewsGetSportsLoadingState extends NewsStates {}
 class NewsGetSportsSucsesState extends NewsStates {}
 class NewsGetSportsErrorState extends NewsStates {
   final String error;
   NewsGetSportsErrorState(this.error);
 }

 //Science
 class NewsGetScienceLoadingState extends NewsStates {}
 class NewsGetScienceSucsesState extends NewsStates {}
 class NewsGetScienceErrorState extends NewsStates {
   final String error;
   NewsGetScienceErrorState(this.error);
 }

 //Search
 class NewsSearchLoadingState extends NewsStates {}
 class NewsSearchSucsesState extends NewsStates {}
 class NewsSearchErrorState extends NewsStates {
   final String error;
   NewsSearchErrorState(this.error);
 }

 //appMode
 class NewsChangeAppMode extends NewsStates {}
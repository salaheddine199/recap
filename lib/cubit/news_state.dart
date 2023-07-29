part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}
class NewsBottomNav extends NewsState{}
class NewsDarkMode extends NewsState{}

class NewsGetSportsLoading extends NewsState{}
class NewsGetSportsDone extends NewsState{}
class NewsGetSportsFailed extends NewsState{}

class NewsGetHealthLoading extends NewsState{}
class NewsGetHealthDone extends NewsState{}
class NewsGetHealthFailed extends NewsState{}

class NewsGetTechnologyLoading extends NewsState{}
class NewsGetTechnologyDone extends NewsState{}
class NewsGetTechnologyFailed extends NewsState{}

class NewsGetSearchingLoading extends NewsState{}
class NewsGetSearchingDone extends NewsState{}
class NewsGetSearchingFailed extends NewsState{}
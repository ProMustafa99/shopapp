abstract class NewsStates{}

class NewInitialState extends NewsStates{}

class NewBottomNavState extends NewsStates{}

class NewsGetBusinessSuccessState extends NewsStates{}

class NewsGetBusinessSuccessErrorState extends NewsStates
{
  late final String error;
  NewsGetBusinessSuccessErrorState(this.error);
}

class NewsLoadingState extends NewsStates{}

//for sports
class NewsGetsportSuccessState extends NewsStates{}

class NewsGetsportSuccessErrorState extends NewsStates
{
  late final String error;
  NewsGetsportSuccessErrorState(this.error);
}

class NewsLoadingsportState extends NewsStates{}
// end


// for science

class NewsGetscienceSuccessState extends NewsStates{}

class NewsGetscienceSuccessErrorState extends NewsStates
{
  late final String error;
  NewsGetscienceSuccessErrorState(this.error);
}

class NewsLoadingscienceState extends NewsStates{}

//end


//for wether

class NewsGetwetherSuccessState extends NewsStates{}

class NewsGetwetherSuccessErrorState extends NewsStates
{
  late final String error;
  NewsGetwetherSuccessErrorState(this.error);
}

class NewsLoadingwetherState extends NewsStates{}

//end wether


//for search

class NewsSeaechSuccessState extends NewsStates{}

class NewsSeacrhSuccessErrorState extends NewsStates
{
  late final String error;
  NewsSeacrhSuccessErrorState(this.error);
}

class NewsLoadingSeacrhState extends NewsStates{}

//end serach

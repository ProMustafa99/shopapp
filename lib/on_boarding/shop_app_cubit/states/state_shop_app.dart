abstract class ShopStates{}

class shopInitialState extends ShopStates{}

class shopChangeBottomNavState extends ShopStates{}

class shopLoadingHomeState extends ShopStates{}
class shopSeuccessHomeState extends ShopStates{}
class shopErrorHomeState extends ShopStates{

  final error;
  shopErrorHomeState(this.error);
}


class shopLoading_categories_State extends ShopStates{}
class shopSeucces_scategories_State extends ShopStates{}
class shopError_categories_State extends ShopStates{

  final error;
  shopError_categories_State(this.error);
}


class shopSeucces_favorates_State extends ShopStates{}
class shopError_favorates_State extends ShopStates{

  final error;
  shopError_favorates_State(this.error);
}

class shopLoading_Getfavorates_State extends ShopStates{}
class shopSeucces_Getfavorates_State extends ShopStates{}
class shopError_Getfavorates_State extends ShopStates{

  final error;
  shopError_Getfavorates_State(this.error);
}


class shopLoading_GetUserInfo_State extends ShopStates{}
class shopSeucces_GetUserInfo_State extends ShopStates{}
class shopError_GetUserInfo_State extends ShopStates{

  final error;
  shopError_GetUserInfo_State(this.error);
}

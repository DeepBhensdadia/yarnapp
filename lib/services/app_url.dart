class URLs {

  static String Base_url = "http://192.168.29.248:8001/api/";                   //Link

  static String yarnCategory = Base_url + "yarnCategory?user_id=1";             //Done

  static String fabricCategory = Base_url + "fabricCategory?user_id=0";         //Done

  static String yarnIndex = Base_url + "yarmsrc?user_id=1";                     //Done

  static String createYarnCategory = Base_url + "yarnCreateCategory";           //Done

  static String createFabricCategory = Base_url + "fabricCreateCategory";       //Done

  static String createYarnIndex = Base_url + "yarnCreate";                      //Done

  static String updateYarnCategory = Base_url + "yarnUpdateCategory/\$categoryId";      //Done

  static String updateFabricCategory = Base_url + "fabricUpdateCategory/\$categoryId";  //Done

  static String updateYarnIndex = Base_url + "yarnUpdate/\$categoryId";                 //Done

  static String deleteYarnCategory = Base_url + "yarnDestroyCategory/\$categoryId";     //Done

  static String deleteFabricCategory = Base_url + "fabricDestroyCategory/\$categoryId"; //Done

  static String deleteYarnIndex = Base_url + "yarnDestroy/\$categoryId";                //Done
}
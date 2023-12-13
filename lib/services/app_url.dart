import 'package:yarn_modified/services/all_api_services.dart';

class URLs {
  // static String Base_url = "http://192.168.29.248:8001/api/";
  // static String image_url = "http://192.168.29.248:8001/";
  static String image_url = "https://textilediary.in/textiles/public/";
  static String Base_url = "https://textilediary.in/textiles/public/api/";

  static String yarnCategory =
      Base_url + "yarnCategory?user_id=${saveUser()?.id}";

  static String fabricCategory =
      Base_url + "fabricCategory?user_id=${saveUser()?.id}";

  static String yarnIndex = Base_url + "yarmsrc?user_id=${saveUser()?.id}";

  static String createYarnCategory = Base_url + "yarnCreateCategory";

  static String createFabricCategory = Base_url + "fabricCreateCategory";

  static String createYarnIndex = Base_url + "yarnCreate"; //Done

  static String updateYarnCategory =
      Base_url + "yarnUpdateCategory/\$categoryId"; //Done

  static String updateFabricCategory =
      Base_url + "fabricUpdateCategory/\$categoryId"; //Done

  static String updateYarnIndex = Base_url + "yarnUpdate/\$categoryId"; //Done

  static String deleteYarnCategory =
      Base_url + "yarnDestroyCategory/\$categoryId"; //Done

  static String deleteFabricCategory =
      Base_url + "fabricDestroyCategory/\$categoryId"; //Done

  static String deleteYarnIndex = Base_url + "yarnDestroy/\$categoryId"; //Done
}

/* 
Note:
1. Create an abstract class "API". It will contain all API wuery strings.
2. Create static constant variables.
3. Follow naming conventions. (Uppercase for static variables)
*/

abstract class API {
  static const BASE_URL = "https://reqres.in/api/";
  static const REGISTER_URL = "${BASE_URL}register";
}

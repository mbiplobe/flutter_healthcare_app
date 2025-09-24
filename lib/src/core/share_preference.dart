import 'package:smarthealthcare/src/model/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceManager {
  static saveDataIntoSharedPref(LoginResponse loginResponse) async {
    SharedPreferences customerInfo = await SharedPreferences.getInstance();
    customerInfo.setInt('id', loginResponse.id);
    customerInfo.setString('firstName', loginResponse.firstName??'');
    customerInfo.setString('lastName', loginResponse.lastName??'');
    customerInfo.setString('userType', loginResponse.usertype);
    customerInfo.setString('email', loginResponse.email??'');
    customerInfo.setString('userPhone', loginResponse.userphone??'');
    customerInfo.setString('gender', loginResponse.gender??'');
    customerInfo.setString('address', loginResponse.address??'');
  }
}

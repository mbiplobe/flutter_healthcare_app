import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/config/route.dart';
import 'package:flutter_healthcare_app/src/core/constants.dart';
import 'package:flutter_healthcare_app/src/core/height_constants.dart';
import 'package:flutter_healthcare_app/src/model/login_response.dart';
import 'package:flutter_healthcare_app/src/pages/bottomNavigation/dashboard_screen.dart';
import 'package:flutter_healthcare_app/src/pages/bottomNavigation/doctor_dashboard_screen.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';
import 'package:flutter_healthcare_app/src/theme/extention.dart';
import 'package:flutter_healthcare_app/src/viewModel/auth_view_model.dart';
import 'package:flutter_healthcare_app/src/widgets/elevation_button.dart';
import 'package:flutter_healthcare_app/src/widgets/flat_button_widget.dart';
import 'package:flutter_healthcare_app/src/widgets/text_input_form.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late AuthViewModel authViewModel;
  var isLoading = false;
  static GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  final userValueHolder = TextEditingController();
  final passValueHolder = TextEditingController();

  String user = "";
  String password = "";

  checkUserField() {
    if (userValueHolder.text.isEmpty) {
      showSnackbar(context, AppLoginConstants.inputEmail);
    } else if (!RegExp(
      RegexPatterns.emailPattern,
    ).hasMatch(userValueHolder.text)) {
      showSnackbar(context, ValidationConstants.invalidEmail);
    } else if (passValueHolder.text.isEmpty) {
      showSnackbar(context, AppLoginConstants.inputPassword);
    } else {
      getTextInputData();
    }
  }

  getTextInputData() {
    setState(() {
      user = userValueHolder.text;
      password = passValueHolder.text;

      checkUser(user, password);

      if (userValueHolder.text == TypeofUserConstants.doctor &&
          passValueHolder.text == TypeofUserConstants.doctor) {
        context.go(AppRoutes.doctorDashboardRoute);
      }
      if (userValueHolder.text == TypeofUserConstants.patient &&
          passValueHolder.text == TypeofUserConstants.patient) {
        context.go(AppRoutes.dashboardRoute);
      }
      if (userValueHolder.text == TypeofUserConstants.deliveryman &&
          passValueHolder.text == TypeofUserConstants.deliveryman) {
        context.go(AppRoutes.deliveryHomePage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    authViewModel = Provider.of<AuthViewModel>(context);

    Widget _head() {
      return Container(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(AppLoginConstants.welcomeBack, style: TextStyles.h1Style),
            Text(AppLoginConstants.signInToContinue, style: TextStyles.body),
          ],
        ).p16,
      );
    }

    Widget _LoginInputs() {
      return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextInputWidger(
              mController: userValueHolder,
              hintText: AppLoginConstants.userName,
              isPassword: false,
              prefixIcon: Icons.person,
            ),
            TextInputWidger(
              mController: passValueHolder,
              hintText: AppLoginConstants.userName,
              isPassword: true,
              prefixIcon: Icons.password,
            ),
            SizedBox(height: AppHeightConstants.height10),
            ElevationbuttonWidget(
              title: AppLoginConstants.clickHere,
              onPress: checkUserField,
              color: ColorResources.themeRed,
              textColor: Colors.white,
              borderRadius: AppHeightConstants.height10,
              elevation: 0,
              icon: Icons.login,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width:  MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _head(),
                  _LoginInputs(),
                  FlatButtonWidget(
                    title: AppLoginConstants.dontHaveAccount,
                    btnTitle: AppLoginConstants.clickForRegister,
                    onPress: () {
                      context.push(AppRoutes.registerPage);
                    },
                    textColor: ColorResources.themeRed,
                  ),
                ],
              ),
            ),
          ),
          loading(context),
        ],
      ),
    );
  }

  Widget loading(BuildContext context) {
    return isLoading
        ? Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(
              color: ColorResources.white.withValues(alpha: .3),
              child: Center(
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorResources.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: ColorResources.lightBlue.withValues(
                            alpha: 0.2,
                          ),
                          spreadRadius: 1,
                          blurRadius: 15,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(
                          AssetConstants.loadingGif,
                          height: 300,
                          width: 300,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : Text('');
  }

  void checkUser(String user, String password) async {
    setState(() {
      isLoading = true;
    });

    List<LoginResponse> loginResponse = await authViewModel.getlogin(
      user,
      password,
    );
    if (loginResponse.isNotEmpty) {
      setState(() {
        isLoading = false;
      });

      if (loginResponse[0].id.isNotEmpty) {
        saveDataIntoSharedPref(loginResponse[0]);

        if (loginResponse[0].usertype == 'Patient') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => DashboardScreen()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => DoctorDashboardScreen()),
          );
        }
      } else {
        showSnackbar(context, AppLoginConstants.invalidUserName);
      }
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackbar(context, AppLoginConstants.invalidUserName);
    }
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: ColorResources.themeRed,
        content: Text(message, style: TextStyle(color: ColorResources.white)),
      ),
    );
  }

  void saveDataIntoSharedPref(LoginResponse loginResponse) async {
    SharedPreferences customerInfo = await SharedPreferences.getInstance();
    customerInfo.setString('id', loginResponse.id);
    customerInfo.setString('firstName', loginResponse.firstName);
    customerInfo.setString('lastName', loginResponse.lastName);
    customerInfo.setString('userType', loginResponse.usertype);
    customerInfo.setString('email', loginResponse.email);
    customerInfo.setString('userPhone', loginResponse.userphone!);
    customerInfo.setString('gender', loginResponse.gender!);
    customerInfo.setString('address', loginResponse.address!);
  }
}

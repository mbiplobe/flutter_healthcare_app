import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/config/route.dart';
import 'package:flutter_healthcare_app/src/core/constants.dart';
import 'package:flutter_healthcare_app/src/core/height_constants.dart';
import 'package:flutter_healthcare_app/src/core/share_preference.dart';
import 'package:flutter_healthcare_app/src/core/snack_bar.dart';
import 'package:flutter_healthcare_app/src/model/login_response.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';
import 'package:flutter_healthcare_app/src/theme/extention.dart';
import 'package:flutter_healthcare_app/src/view_model/auth_view_model.dart';
import 'package:flutter_healthcare_app/src/widgets/elevation_button.dart';
import 'package:flutter_healthcare_app/src/widgets/flat_button_widget.dart';
import 'package:flutter_healthcare_app/src/widgets/text_input_form.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
      AppSnackBar.showSnackbar(context, AppLoginConstants.inputEmail);
    } else if (!RegExp(
      RegexPatterns.emailPattern,
    ).hasMatch(userValueHolder.text)) {
      AppSnackBar.showSnackbar(context, ValidationConstants.invalidEmail);
    } else if (passValueHolder.text.isEmpty) {
      AppSnackBar.showSnackbar(context, AppLoginConstants.inputPassword);
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _head(),
                  _LoginInputs(),
                  Container(
                    child: Center(
                      child: FlatButtonWidget(
                        title: AppLoginConstants.dontHaveAccount,
                        btnTitle: AppLoginConstants.clickForRegister,
                        onPress: () {
                          context.push(AppRoutes.registerPage);
                        },
                        textColor: ColorResources.themeRed,
                      ),
                    ),
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

    LoginResponse loginResponse = await authViewModel.getlogin(
      user,
      password,
    );
    if (loginResponse.success==true) {
      setState(() {
        isLoading = false;
      });

      if (loginResponse.id != 0) {
        SharePreferenceManager.saveDataIntoSharedPref(loginResponse);
        if (loginResponse.usertype == TypeofUserConstants.patient) {
          context.go(AppRoutes.dashboardRoute);
        } else if (loginResponse.usertype == TypeofUserConstants.deliveryman) {
          context.go(AppRoutes.deliveryHomePage);
        } else
        {
          context.go(AppRoutes.doctorDashboardRoute);
        }
      } else {
        AppSnackBar.showSnackbar(context, AppLoginConstants.invalidUserName);
      }
    } else {
      setState(() {
        isLoading = false;
      });
      AppSnackBar.showSnackbar(context, AppLoginConstants.invalidUserName);
    }
  }
}

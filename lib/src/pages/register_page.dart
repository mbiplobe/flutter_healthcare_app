import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/config/route.dart';
import 'package:flutter_healthcare_app/src/controllers/selector_controller.dart';
import 'package:flutter_healthcare_app/src/core/constants.dart';
import 'package:flutter_healthcare_app/src/core/height_constants.dart';
import 'package:flutter_healthcare_app/src/core/snack_bar.dart';
import 'package:flutter_healthcare_app/src/model/registration.dart';
import 'package:flutter_healthcare_app/src/model/registration_response.dart';
import 'package:flutter_healthcare_app/src/model/selection_model.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';
import 'package:flutter_healthcare_app/src/theme/extention.dart';
import 'package:flutter_healthcare_app/src/view_model/auth_view_model.dart';
import 'package:flutter_healthcare_app/src/view_model/location_viewmodel.dart';
import 'package:flutter_healthcare_app/src/widgets/elevation_button.dart';
import 'package:flutter_healthcare_app/src/widgets/flat_button_widget.dart';
import 'package:flutter_healthcare_app/src/widgets/selection_widget.dart';
import 'package:flutter_healthcare_app/src/widgets/text_input_form.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  static GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  late AuthViewModel authViewModel;

  @override
  void initState() {
    super.initState();
    // locationViewModel.initLocationTracking();
  }

  final firstNameValueHolder = TextEditingController();
  final lastNameValueHolder = TextEditingController();
  final passValueHolder = TextEditingController();
  final confirmPassValueHolder = TextEditingController();
  final phoneValueHolder = TextEditingController();
  final emailValueHolder = TextEditingController();
  final locationValueHolder = TextEditingController();
  final ageValueHolder = TextEditingController();
  final genderValueHolder = SelectorController(PersonCatergoryConstant.male);
    final userTypeValueHolder = SelectorController(TypeofUserConstants.patient);

  String firstName = "";
  String lastName = "";
  String password = "";
  String phone = "";
  String email = "";
  String location = "";
  String age = "";
  String gender = PersonCatergoryConstant.male;
  String usertype = TypeofUserConstants.patient;
  var isLoading = false;

  void getTextInputData() {
    setState(() {
      firstName = firstNameValueHolder.text;
      lastName = lastNameValueHolder.text;
      password = passValueHolder.text;
      phone = phoneValueHolder.text;
      email = emailValueHolder.text;
      location = locationValueHolder.text;
      age = ageValueHolder.text;
      gender= genderValueHolder.selected;
      usertype = userTypeValueHolder.selected;
    });

    checkValue(context);
  }

  Widget _head() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Register", style: TextStyles.h1Style),
        Text("Please fill out the form", style: TextStyles.body),
      ],
    ).p16;
  }

  Widget _LoginInputs() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          SelectorWidget(
            controller: userTypeValueHolder, options: [
             new SelectionModel(title: TypeofUserConstants.patient, icon: Icons.person_2),
             new SelectionModel(title: TypeofUserConstants.doctor, icon: Icons.person_3),
             new SelectionModel(title: TypeofUserConstants.deliveryman, icon: Icons.person),
            ],
            
          ),
          //user name
          TextInputWidger(
              mController: firstNameValueHolder,
              hintText: AppRegistrationConstants.firstName,
              inputType: TextInputType.text,
              isPassword: false,
              prefixIcon: Icons.person,
            ),
          TextInputWidger(
              mController: lastNameValueHolder,
              hintText: AppRegistrationConstants.lastName,
              inputType: TextInputType.text,
              isPassword: false,
              prefixIcon: Icons.person,
            ),
          
            TextInputWidger(
              mController: phoneValueHolder,
              hintText: AppRegistrationConstants.phoneNumber,
              inputType: TextInputType.text,
              isPassword: false,
              prefixIcon: Icons.phone,
            ),
            TextInputWidger(
              mController: emailValueHolder,
              hintText: AppRegistrationConstants.email,
              inputType: TextInputType.text,
              isPassword: false,
              prefixIcon: Icons.email,
            ),

             TextInputWidger(
              mController: passValueHolder,
              hintText: AppRegistrationConstants.password,
              inputType: TextInputType.text,
              isPassword: true,
              prefixIcon: Icons.password,
            ),
            TextInputWidger(
              mController: confirmPassValueHolder,
              hintText: AppRegistrationConstants.confirmPassword,
              inputType: TextInputType.text,
              isPassword: true,
              prefixIcon: Icons.password,
            ),
            TextInputWidger(
              mController: locationValueHolder,
              hintText: AppRegistrationConstants.location,
              inputType: TextInputType.text,
              isPassword: true,
              prefixIcon: Icons.location_on,
            ),

            TextInputWidger(
              mController: ageValueHolder,
              hintText: AppRegistrationConstants.age,
              inputType: TextInputType.text,
              isPassword: true,
              prefixIcon: Icons.location_on,
            ),
          //Gender
          SelectorWidget(
            controller: genderValueHolder, options: [
             new SelectionModel(title: PersonCatergoryConstant.male, icon: Icons.male),
             new SelectionModel(title: PersonCatergoryConstant.female, icon: Icons.female),
            ],
            
          ),
      SizedBox(height: AppHeightConstants.height20),
          
      ElevationbuttonWidget(
              title: AppLoginConstants.clickForRegister,
              onPress: getTextInputData,
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


  @override
  void dispose() {
    firstNameValueHolder.dispose();
    lastNameValueHolder.dispose();
    passValueHolder.dispose();
    phoneValueHolder.dispose();
    emailValueHolder.dispose();
    locationValueHolder.dispose();
    ageValueHolder.dispose();
    genderValueHolder.dispose();
    userTypeValueHolder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthViewModel, LocationViewModel>(
      builder: (context, authViewModel, locationViewModel, child) {
        this.authViewModel = authViewModel;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(AppHeightConstants.height15),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      // height: MediaQuery.of(context).size.height,
                      // width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [_head(), _LoginInputs(), SizedBox(height: AppHeightConstants.height10,), Container(
                    child: Center(
                      child: FlatButtonWidget(
                        title: AppRegisterConstants.alreadyHaveAccount,
                        btnTitle: AppLoginConstants.clickHere,
                        onPress: () {
                          context.pop();
                        },
                        textColor: ColorResources.themeRed,
                      ),
                    ),
                  ),],
                      ),
                    ),
                  ),
                  loading(context, authViewModel.isLoading),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void checkValue(BuildContext context) {
    final trimmedFirstName = firstName.trim();
    final trimmedEmail = email.trim();
    final trimmedPhone = phone.trim();
    final trimmedPassword = password.trim();
    final trimmedLocation = location.trim();
    final ageString = age.toString().trim();
    final genderValue = gender.toString().trim();
    final userType = usertype.toString().trim();


    if (trimmedFirstName.isEmpty) {
      AppSnackBar.showSnackbar(context, ValidationConstants.emptyfirstName);
      return;
    }

    if (trimmedEmail.isEmpty) {
       AppSnackBar.showSnackbar(context, ValidationConstants.emptyemail);
      return;
    }

    if (!RegExp(
     RegexPatterns.emailPattern
    ).hasMatch(trimmedEmail)) {
       AppSnackBar.showSnackbar(context, ValidationConstants.invalidEmail);
      return;
    }

    if (trimmedPhone.isEmpty) {
       AppSnackBar.showSnackbar(context, ValidationConstants.emptyphoneNumber);
      return;
    }

    if (!RegExp(RegexPatterns.phonePattern).hasMatch(trimmedPhone)) {
       AppSnackBar.showSnackbar(context, ValidationConstants.eemptyvalidPhoneNumber);
      return;
    }

    if (trimmedPassword.isEmpty) {
       AppSnackBar.showSnackbar(context, ValidationConstants.emptypassword);
      return;
    }

    if (trimmedPassword.length < 6) {
       AppSnackBar.showSnackbar(context, ValidationConstants.minPasswordLength);
      return;
    }

    if (trimmedLocation.isEmpty) {
       AppSnackBar.showSnackbar(context, ValidationConstants.emptyLocation);
      return;
    }

    if (ageString.isEmpty) {
       AppSnackBar.showSnackbar(context, ValidationConstants.emptyage);
      return;
    }

     if (genderValue.isEmpty) {
       AppSnackBar.showSnackbar(context, ValidationConstants.emptyGender);
      return;
    }

     if (userType.isEmpty) {
       AppSnackBar.showSnackbar(context, ValidationConstants.emptyUserType);
      return;
    }
    final ageValue = int.tryParse(ageString);
    if (ageValue == null || ageValue < 1 || ageValue > 120) {
       AppSnackBar.showSnackbar(context, ValidationConstants.emptyvalidAge);
      return;
    }

    sendDatatoDb();
  }


  void sendDatatoDb() async {
    RegistrationResponse response = await authViewModel.saveRegistration(
      Registration(
        username: '$firstName $lastName',
        firstName: firstName,
        lastName: lastName,
        userEmail: email,
        userPhone: phone,
        userPass: password,
        address: location,
        gender: gender,
        dob: age, userType: '', 
      ),
    );

    AppSnackBar.showSnackbar(context, '${response.message}');
    if (response.success) {
      context.go(AppRoutes.loginRoute);
    }
  }

  Widget loading(BuildContext context, bool isLoading) {
    if (isLoading) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          color: Colors.white.withValues(alpha:0.3),
          child: Center(
            child: SizedBox(
              width: 120,
              height: 120,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.lightBlue.withValues(alpha: 0.2),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: Offset(0, 1),
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
      );
    } else {
      return SizedBox.shrink();
    }
  }
}

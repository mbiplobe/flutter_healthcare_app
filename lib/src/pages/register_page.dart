import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/config/route.dart';
import 'package:flutter_healthcare_app/src/core/constants.dart';
import 'package:flutter_healthcare_app/src/model/registration.dart';
import 'package:flutter_healthcare_app/src/model/registration_response.dart';
import 'package:flutter_healthcare_app/src/pages/register_page.dart'
    as firstNameValueHolder;
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';
import 'package:flutter_healthcare_app/src/theme/extention.dart';
import 'package:flutter_healthcare_app/src/viewModel/auth_view_model.dart';
import 'package:flutter_healthcare_app/src/viewModel/location_viewmodel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../theme/light_color.dart';
import 'login_page.dart';

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
  final phoneValueHolder = TextEditingController();
  final emailValueHolder = TextEditingController();
  final locationValueHolder = TextEditingController();
  final ageValueHolder = TextEditingController();

  String firstName = "";
  String lastName = "";
  String password = "";
  String phone = "";
  String email = "";
  String location = "";
  String age = "";
  String gender = 'Male';
  String usertype = "General user";
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
    });

    checkValue(context);
  }

  Widget _Bgap() {
    return Container(height: 120.0, color: Colors.white);
  }

  Widget _Sgap() {
    return Container(height: 50.0, color: Colors.white);
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
          //user name
          Container(
            height: 55,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(13)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: ColorResources.grey.withOpacity(.3),
                  blurRadius: 15,
                  offset: Offset(3, 3),
                ),
              ],
            ),
            child: TextField(
              controller: firstNameValueHolder,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                border: InputBorder.none,
                hintText: "First name",
                hintStyle: TextStyles.body.subTitleColor,
                suffixIcon: SizedBox(
                  width: 55,
                  child:
                      Icon(
                        Icons.account_circle,
                        color: ColorResources.themeRed,
                      ).alignCenter.ripple(
                        () {},
                        borderRadius: BorderRadius.circular(13),
                      ),
                ),
              ),
            ),
          ),
          Container(
            height: 55,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(13)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: ColorResources.grey.withOpacity(.3),
                  blurRadius: 15,
                  offset: Offset(3, 3),
                ),
              ],
            ),
            child: TextField(
              controller: lastNameValueHolder,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                border: InputBorder.none,
                hintText: "Last name",
                hintStyle: TextStyles.body.subTitleColor,
                suffixIcon: SizedBox(
                  width: 55,
                  child:
                      Icon(
                        Icons.account_circle,
                        color: ColorResources.themeRed,
                      ).alignCenter.ripple(
                        () {},
                        borderRadius: BorderRadius.circular(13),
                      ),
                ),
              ),
            ),
          ),
          //User phone
          Container(
            height: 55,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(13)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: ColorResources.grey.withOpacity(.3),
                  blurRadius: 15,
                  offset: Offset(3, 3),
                ),
              ],
            ),
            child: TextField(
              controller: phoneValueHolder,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                border: InputBorder.none,
                hintText: "phone",
                hintStyle: TextStyles.body.subTitleColor,
                suffixIcon: SizedBox(
                  width: 55,
                  child: Icon(Icons.phone, color: ColorResources.themeRed)
                      .alignCenter
                      .ripple(() {}, borderRadius: BorderRadius.circular(13)),
                ),
              ),
            ),
          ),
          //email
          Container(
            height: 55,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(13)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: ColorResources.grey.withOpacity(.3),
                  blurRadius: 15,
                  offset: Offset(3, 3),
                ),
              ],
            ),
            child: TextField(
              controller: emailValueHolder,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                border: InputBorder.none,
                hintText: "Email",
                hintStyle: TextStyles.body.subTitleColor,
                suffixIcon: SizedBox(
                  width: 55,
                  child: Icon(Icons.email, color: ColorResources.themeRed)
                      .alignCenter
                      .ripple(() {}, borderRadius: BorderRadius.circular(13)),
                ),
              ),
            ),
          ),
          //password
          Container(
            height: 55,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(13)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: ColorResources.grey.withOpacity(.3),
                  blurRadius: 15,
                  offset: Offset(3, 3),
                ),
              ],
            ),
            child: TextField(
              controller: passValueHolder,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                border: InputBorder.none,
                hintText: "Password",
                hintStyle: TextStyles.body.subTitleColor,
                suffixIcon: SizedBox(
                  width: 55,
                  child: Icon(Icons.lock, color: ColorResources.themeRed)
                      .alignCenter
                      .ripple(() {}, borderRadius: BorderRadius.circular(13)),
                ),
              ),
            ),
          ),

          //Location
          Container(
            height: 55,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(13)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: ColorResources.grey.withOpacity(.3),
                  blurRadius: 15,
                  offset: Offset(3, 3),
                ),
              ],
            ),
            child: TextField(
              controller: locationValueHolder,
              readOnly: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                border: InputBorder.none,

                hintText: "Location",
                hintStyle: TextStyles.body.subTitleColor,
                suffixIcon: SizedBox(
                  width: 55,
                  child: Icon(Icons.my_location, color: ColorResources.themeRed)
                      .alignCenter
                      .ripple(() async {
                        // Request location permission and get current location
                        try {
                          LocationPermission permission =
                              await Geolocator.requestPermission();
                          if (permission == LocationPermission.denied) {
                            showSnackbar(context, 'Location permission denied');
                            return;
                          }

                          Position position =
                              await Geolocator.getCurrentPosition(
                                desiredAccuracy: LocationAccuracy.high,
                              );

                          setState(() {
                            locationValueHolder.text =
                                '${position.latitude.toStringAsFixed(4)}, ${position.longitude.toStringAsFixed(4)}';
                          });
                        } catch (e) {
                          showSnackbar(context, 'Error getting location: $e');
                        }
                      }, borderRadius: BorderRadius.circular(13)),
                ),
              ),
            ),
          ),
          //Age
          Container(
            height: 55,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(13)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: ColorResources.grey.withOpacity(.3),
                  blurRadius: 15,
                  offset: Offset(3, 3),
                ),
              ],
            ),
            child: TextField(
              controller: ageValueHolder,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                border: InputBorder.none,
                hintText: "Age",
                hintStyle: TextStyles.body.subTitleColor,
                suffixIcon: SizedBox(
                  width: 55,
                  child:
                      Icon(
                        Icons.filter_vintage,
                        color: ColorResources.themeRed,
                      ).alignCenter.ripple(
                        () {},
                        borderRadius: BorderRadius.circular(13),
                      ),
                ),
              ),
            ),
          ),
          //Gender
          Container(
            height: 55,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(13)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: ColorResources.grey.withOpacity(.3),
                  blurRadius: 15,
                  offset: Offset(3, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = 'Male';
                      });
                    },
                    child: Container(
                      height: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(13),
                          bottomLeft: Radius.circular(13),
                        ),
                        color: gender == 'Male'
                            ? ColorResources.themeRed
                            : Colors.white,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.male,
                            size: 24,
                            color: gender == 'Male'
                                ? Colors.white
                                : Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Male',
                              style: TextStyle(
                                color: gender == 'Male'
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = 'Female';
                      });
                    },
                    child: Container(
                      height: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(13),
                          bottomRight: Radius.circular(13),
                        ),
                        color: gender == 'Female'
                            ? ColorResources.themeRed
                            : Colors.white,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.female,
                            size: 24,
                            color: gender == 'Female'
                                ? Colors.white
                                : Colors.black,
                          ),
                          Text(
                            'Female',
                            style: TextStyle(
                              color: gender == 'Female'
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _Sgap(),
          Container(
            child: SizedBox(
              width: 200.00,
              height: 55,
              child: ElevatedButton(
                onPressed: () => getTextInputData(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorResources.themeRed,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                    side: BorderSide(color: ColorResources.themeRed),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: Text(
                  "REGISTER",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _helpText() {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      spacing: 10.0,
      children: <Widget>[
        Text("Already have account?").vP8,
        GestureDetector(
          onTap: () {
            // do what you need to do when "Click here" gets clicked
            setState(() {
              print("Login clicked");
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginPage()),
              );
            });
          },
          child: Text(
            "Login",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: ColorResources.themeRed,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ).vP8,
      ],
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
            child: Stack(
              children: [
                Container(
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverList(
                        delegate: SliverChildListDelegate([
                          _Sgap(),
                          _head(),
                          _LoginInputs(),
                          _Sgap(),
                          _helpText(),
                        ]),
                      ),
                    ],
                  ),
                ),
                loading(context, authViewModel.isLoading),
              ],
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

    if (trimmedFirstName.isEmpty) {
      showSnackbar(context, 'Enter first name');
      return;
    }

    if (trimmedEmail.isEmpty) {
      showSnackbar(context, 'Enter your email');
      return;
    }

    if (!RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
    ).hasMatch(trimmedEmail)) {
      showSnackbar(context, 'Enter valid email');
      return;
    }

    if (trimmedPhone.isEmpty) {
      showSnackbar(context, 'Enter your phone');
      return;
    }

    if (!RegExp(r'^(?:[+0]9)?[0-9]{10,12}$').hasMatch(trimmedPhone)) {
      showSnackbar(context, 'Enter valid phone number');
      return;
    }

    if (trimmedPassword.isEmpty) {
      showSnackbar(context, 'Enter your password');
      return;
    }

    if (trimmedPassword.length < 6) {
      showSnackbar(context, 'Enter at least 6 digit password');
      return;
    }

    if (trimmedLocation.isEmpty) {
      showSnackbar(context, 'Enter location');
      return;
    }

    if (ageString.isEmpty) {
      showSnackbar(context, 'Enter your age');
      return;
    }

    // Convert age to number and validate range
    final ageValue = int.tryParse(ageString);
    if (ageValue == null || ageValue < 1 || ageValue > 120) {
      showSnackbar(context, 'Enter a valid age (1-120)');
      return;
    }

    sendDatatoDb();
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: ColorResources.themeRed,
        content: Text(message, style: TextStyle(color: Colors.white)),
      ),
    );
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
        dob: age,
      ),
    );

    showSnackbar(context, '${response.message}');
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
          color: Colors.white.withOpacity(0.3),
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
                      color: Colors.lightBlue.withOpacity(0.2),
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

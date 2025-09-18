import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/config/route.dart';
import 'package:flutter_healthcare_app/src/core/constants.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';
import 'package:flutter_healthcare_app/src/theme/extention.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var id;
  var userType;

  @override
  void initState() {
    getCustomerInfo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetConstants.doctorFace),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned.fill(
            child: Opacity(
              opacity: .6,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        ColorResources.themeRed,
                        ColorResources.themeRed.withOpacity(0.5)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.mirror,
                      stops: [.5, 6]),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              Image.asset(
                AssetConstants.heartBeat,
                color: Colors.white,
                height: 100,
              ),
              Text(
                SplashConstants.yourHealth,
                style: TextStyles.h1Style.white,
              ),
              Text(
                SplashConstants.byHssTechnovation,
                style: TextStyles.bodySm.white.bold,
              ),
              Expanded(
                flex: 7,
                child: SizedBox(),
              ),
            ],
          ).alignTopCenter,
        ],
      ),
    );
  }

  void getCustomerInfo() async {
    SharedPreferences customerInfo = await SharedPreferences.getInstance();
    setState(() {
      id = customerInfo.getInt('id');
      userType = customerInfo.getString('userType');
    });
    Future.delayed(Duration(seconds: 2)).then((_) {
      if (id != null) {
        if(userType == 'Patient'){
          context.go(AppRoutes.dashboardRoute);
        } else if(userType == 'Doctor'){
          context.go(AppRoutes.doctorDashboardRoute);
        }
      } else 
      {
        context.go(AppRoutes.loginRoute);
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:smarthealthcare/src/model/cart.dart';
import 'package:smarthealthcare/src/model/view_appointment.dart';
import 'package:smarthealthcare/src/pages/all_service.dart';
import 'package:smarthealthcare/src/pages/doctor_consultant_page.dart';
import 'package:smarthealthcare/src/pages/eshop/eshop_home_page.dart';
import 'package:smarthealthcare/src/pages/user/lab_test_page.dart';
import 'package:smarthealthcare/src/theme/light_color.dart';
import 'package:smarthealthcare/src/view_model/appointment_view_model.dart';
import 'package:smarthealthcare/src/view_model/eshop_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


late  AppointmentViewModel appointmentViewModel;
late  EShopViewModel eShopViewModel;

  var firstName = '';
  var lastName = '';
  var userId;
  var usertype;
  var appointmentCount = 0;
  List<ViewAppointment> viewAppointment = [];
  List<Cart> cartList = [];



  @override
  void initState() {
    super.initState();
    getCustomerInfo(context);
  }
  @override
  Widget build(BuildContext context) {
    appointmentViewModel = Provider.of<AppointmentViewModel>(context);
    eShopViewModel = Provider.of<EShopViewModel>(context);

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              color: ColorResources.themeRed,
              child: Center(
                child: Text(
                  'Welcome, $firstName $lastName',
                  style: TextStyle(color: ColorResources.white, fontSize: 18),
                ),
              ),
            ),
            Positioned(
              top: 150,
              child: body(context),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: 115,
              child: summary(context),
            )
          ],
        ),
      ),
    );
  }

  Widget summary(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: ColorResources.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: ColorResources.lightBlack.withOpacity(.3),
              blurRadius: 15,
              offset: Offset(5, 5),
            )
          ]),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorResources.lightBlack.withOpacity(0.2),
                            width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(130))),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.shopping_cart,
                          color: ColorResources.themeRed,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Cart',
                          style: TextStyle(
                              color: ColorResources.lightBlack, fontSize: 14),
                        ),
                        Text(
                          'Item: ${cartList != null ? cartList.length : 0}',
                          style: TextStyle(
                              color: ColorResources.lightBlack, fontSize: 14),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorResources.lightBlack.withOpacity(0.2),
                            width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(130))),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.date_range,
                          color: ColorResources.themeRed,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Appointments',
                          style: TextStyle(
                              color: ColorResources.lightBlack, fontSize: 14),
                        ),
                        Text(
                          '$appointmentCount',
                          style: TextStyle(
                              color: ColorResources.lightBlack, fontSize: 14),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget body(BuildContext context) {
    return Container(
      
          height: MediaQuery.of(context).size.height-200 ,


          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Column(

                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => DoctorConsultantPage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 30,
                            decoration: BoxDecoration(
                                color: ColorResources.white,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: ColorResources.lightBlack.withOpacity(.3),
                                    blurRadius: 15,
                                    offset: Offset(5, 5),
                                  )
                                ]),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                                  child: Image.asset(
                                    'assets/ic_doctor.png',
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Text(
                                  'DOCTOR CONSULTAION',
                                  style:
                                      TextStyle(color: ColorResources.themeRed, fontSize: 18),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 5, right: 10, bottom: 10),
                                  child: Text(
                                    'Find  a doctor and get appoinment for health care professional for your condition',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: ColorResources.lightBlack.withOpacity(0.6),
                                        fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => EshopHomePage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, top: 15, bottom: 15),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 30,
                            decoration: BoxDecoration(
                                color: ColorResources.white,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: ColorResources.lightBlack.withOpacity(.3),
                                    blurRadius: 15,
                                    offset: Offset(5, 5),
                                  )
                                ]),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                                  child: Image.asset(
                                    'assets/ic_marketplace.png',
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Text(
                                  'MARKETPLACE',
                                  style:
                                      TextStyle(color: ColorResources.themeRed, fontSize: 18),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 5, right: 10, bottom: 10),
                                  child: Text(
                                    'Browse through our wide range of health products and services',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: ColorResources.lightBlack.withOpacity(0.6),
                                        fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => LabTestPage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 30,
                            decoration: BoxDecoration(
                                color: ColorResources.white,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: ColorResources.lightBlack.withOpacity(.3),
                                    blurRadius: 15,
                                    offset: Offset(5, 5),
                                  )
                                ]),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                                  child: Image.asset(
                                    'assets/ic_labtest.png',
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Text(
                                  'LAB TEST',
                                  style:
                                  TextStyle(color: ColorResources.themeRed, fontSize: 18),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 5, right: 10, bottom: 10),
                                  child: Text(
                                    'Browse through our wide range of lab test for checkup your healt condition',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: ColorResources.lightBlack.withOpacity(0.6),
                                        fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => ServicePage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15, bottom: 15),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 30,
                            decoration: BoxDecoration(
                                color: ColorResources.white,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: ColorResources.lightBlack.withOpacity(.3),
                                    blurRadius: 15,
                                    offset: Offset(5, 5),
                                  )
                                ]),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                                  child: Image.asset(
                                    'assets/ic_service.png',
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Text(
                                  'SERVICES',
                                  style:
                                  TextStyle(color: ColorResources.themeRed, fontSize: 18),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 5, right: 10, bottom: 10),
                                  child: Text(
                                    'Browse through our wide range of services for quick response by the provider',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: ColorResources.lightBlack.withOpacity(0.6),
                                        fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
       

    );
  }

  void getCustomerInfo(BuildContext context) async{
    SharedPreferences customerInfo = await SharedPreferences.getInstance();
    setState(() {
      userId = customerInfo.getInt('id');
      firstName = customerInfo.getString('firstName').toString();
      lastName = customerInfo.getString('lastName').toString();
      usertype = customerInfo.getString('userType');
      if(userId != null){
        getAllAppointment(context);
        getCartProduct(context);
      }
    });
  }

  void getAllAppointment(BuildContext context) async {

    List<ViewAppointment> viewAppointment =
    await appointmentViewModel.getAllAppointment(userId, usertype);

    if (viewAppointment != null) {
      print(viewAppointment.length);
      setState(() {
        appointmentCount = viewAppointment.length;
      });
    }
  }

  void getCartProduct(BuildContext context) async{
    List<Cart> carts = await eShopViewModel.getCart(userId);

    if(carts != null){
      cartList.clear();
      carts.forEach((cart) {
        setState(() {
          cartList.add(cart);
        });
      });
    }

  }
}

import 'package:flutter/material.dart';
import 'package:smart_health_care/src/model/lab_test_by_user.dart';
import 'package:smart_health_care/src/model/registration_response.dart';
import 'package:smart_health_care/src/pages/user/lab_test_page.dart';
import 'package:smart_health_care/src/theme/light_color.dart';
import 'package:smart_health_care/src/view_model/lab_test_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LabTestViewPage extends StatefulWidget {
  @override
  _LabTestViewPageState createState() => _LabTestViewPageState();
}

class _LabTestViewPageState extends State<LabTestViewPage> {

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  late LabTestViewModel labTestViewModel;
  var isFirst = true;
  var userId;
  var isLoading = true;
  var isNotFound = false;
  List<LabTestByUser> labTestByUserList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCustomerInfo(context);
  }
  @override
  Widget build(BuildContext context) {
    labTestViewModel = Provider.of<LabTestViewModel>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: ColorResources.themeRed,
        leading: Text(''),
        title: Text('Lab Test',
        style: TextStyle(
          color: ColorResources.white,
          fontSize: 18
        ),),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height-55,
        child: Stack(
          children: [
            body(context),
            loading(context),
            notFound(context)

          ],
        ),
      ),
    );
  }

  Widget body(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height-55,
      child: Padding(
        padding: const EdgeInsets.only(top:15.0),
        child: ListView.builder(
            itemCount: labTestByUserList != null ? labTestByUserList.length:0,
            itemBuilder: (context,index){
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
            decoration: BoxDecoration(
              color: ColorResources.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: ColorResources.lightBlue.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 15,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ]
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:10.0,top: 10,bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${labTestByUserList[index].sampleCollectDate != null ? labTestByUserList[index].sampleCollectDate:'Not found'}',
                            style: TextStyle(
                              color: ColorResources.lightBlack,
                              fontSize: 14
                            ),),
                            Padding(
                              padding: const EdgeInsets.only(top:2.0),
                              child: Text('${labTestByUserList[index].testName != null ? labTestByUserList[index].testName:'Not found'}',
                                style: TextStyle(
                                    color: ColorResources.black,
                                    fontSize: 16
                                ),),
                            ),
                            Text('${labTestByUserList[index].catTestName != null ? labTestByUserList[index].catTestName:'Not found'}',
                              style: TextStyle(
                                  color: ColorResources.black,
                                  fontSize: 12
                              ),),
                            Padding(
                              padding: const EdgeInsets.only(top:4.0),
                              child: Text('${labTestByUserList[index].paymentType != null ? labTestByUserList[index].paymentType:'Not found'}',
                                style: TextStyle(
                                    color: ColorResources.lightBlack,
                                    fontSize: 14
                                ),),
                            ),


                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.alarm,
                            color: ColorResources.themeRed,),
                            Text('${labTestByUserList[index].sampleCollectDate != null ? labTestByUserList[index].sampleCollectDate:'Not found'}',
                            style: TextStyle(
                              color: ColorResources.themeRed,
                              fontSize: 14
                            ),),
                            Text('${labTestByUserList[index].sampleCollectTime != null ? labTestByUserList[index].sampleCollectTime:'Not found'}',
                              style: TextStyle(
                                  color: ColorResources.themeRed,
                                  fontSize: 14
                              ),),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 8,
                    left: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: definceColor('${labTestByUserList[index].status != null ? labTestByUserList[index].status:'Not found'}'),
                        borderRadius: BorderRadius.only( topRight:Radius.circular(10),bottomLeft: Radius.circular(10))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Center(
                          child: Text('${labTestByUserList[index].status != null ? labTestByUserList[index].status:'Not found'}',
                          style: TextStyle(
                            color: ColorResources.white,
                            fontSize: 16
                          ),),
                        ),
                      ),
                    )),
                Positioned(
                    top: 8,
                    right: 8,
                    child:  labTestByUserList[index].status != null && labTestByUserList[index].status == 'Pending' ?
                    Row(
                      children: [
                        GestureDetector(
                          onTap:()=> openModificationDialog(context,labTestByUserList[index].id,labTestByUserList[index].testId,labTestByUserList[index].testCatId,
                              labTestByUserList[index].testAmount,labTestByUserList[index].sampleCollectDate,labTestByUserList[index].sampleCollectDate,labTestByUserList[index].paymentType),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                border: Border.all(
                                    color: ColorResources.grey
                                )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Center(
                                child: Icon(Icons.edit,
                                  size: 20,
                                  color: ColorResources.grey,),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:10.0),
                          child: GestureDetector(
                            onTap:()=> openConfirmationDialog(context,labTestByUserList[index].id,labTestByUserList[index].testId,labTestByUserList[index].testCatId),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  border: Border.all(
                                    color: ColorResources.grey
                                  )
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Center(
                                  child: Icon(Icons.clear,
                                  size: 20,
                                  color: ColorResources.grey,),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ):Text(''))
              ],
            ),
          );
        }),
      )
    );
  }
  void getCustomerInfo(BuildContext context) async{
    SharedPreferences customerInfo = await SharedPreferences.getInstance();
    userId = customerInfo.getString('id');
    if(userId != null){
      getAllLabTest(context);
    }
  }

  void getAllLabTest(BuildContext context) async{
    print(userId);
    List<LabTestByUser> labTestByUser = await labTestViewModel.getAllLabTestByUser(userId);

    if(labTestByUser != null){
      labTestByUserList.clear();
      if(labTestByUser.length > 0) {
        setState(() {
          labTestByUser.forEach((element) {
            labTestByUserList.add(element);

          });
          isLoading = false;
        });
      }else{
        setState(() {
          isLoading = false;
          isNotFound = true;
        });

      }
    }

  }

  Widget loading(BuildContext context) {
    return isLoading
        ? Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Container(
        color: ColorResources.white.withOpacity(0.3),
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
                      color: ColorResources.lightBlue.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ]),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    'assets/loading.gif',
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

  Widget notFound(BuildContext context) {
    return isNotFound
        ? Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Container(
        color: ColorResources.white.withOpacity(0.3),
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
                      color: ColorResources.lightBlue.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ]),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    'assets/no_item.png',
                    height: 80,
                    width: 80,
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

  Color definceColor(String status) {
    Color color;
    if(status == 'Pending'){
      color = ColorResources.skyBlue;
    }else if(status == 'Cancel'){
      color = ColorResources.lightOrange;
    }else if(status == 'Completed'){
      color = ColorResources.themeRed;
    }else {
      color = ColorResources.white;
    }
    return color;
  }

  void openConfirmationDialog(BuildContext context, String id, String testid, String testcatid,) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 16,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: ColorResources.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Do you want to cancel the labtest?',
                          style: TextStyle(
                            color: ColorResources.lightBlack,
                          ),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          color: ColorResources.themeRed,
                          thickness: 0.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: ()=>Navigator.pop(context),
                                child: Container(
                                  child: Center(
                                    child: Text('No',
                                    style: TextStyle(
                                      color: ColorResources.lightOrange
                                    ),),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: ()=>cancelAppointment(context,id,testid,testcatid),
                                child: Container(
                                  child: Center(
                                    child: Text('Yes',
                                      style: TextStyle(
                                          color: ColorResources.themeRed
                                      ),),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  void openModificationDialog(BuildContext context, String id, String testid, String testcatid, String testamount, String samplecollectdate, String samplecollecttime, String paymenttype,) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 16,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: ColorResources.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Do you want to edit the labtest?',
                            style: TextStyle(
                              color: ColorResources.lightBlack,
                            ),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          color: ColorResources.themeRed,
                          thickness: 0.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: ()=>Navigator.pop(context),
                                child: Container(
                                  child: Center(
                                    child: Text('No',
                                      style: TextStyle(
                                          color: ColorResources.lightOrange
                                      ),),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: ()=>modfifyAppointment(context,id,testid,testcatid,testamount,samplecollectdate,samplecollecttime,paymenttype),
                                child: Container(
                                  child: Center(
                                    child: Text('Yes',
                                      style: TextStyle(
                                          color: ColorResources.themeRed
                                      ),),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  void cancelAppointment(BuildContext context, String id, String testid, String testcatid,) async{
    Navigator.pop(context);
    setState(() {
      isLoading = true;
    });

    RegistrationResponse response = await labTestViewModel.cancelLabtest(id,userId,'Cancel',testid,testcatid);

    if(response != null){
      getAllLabTest(context);
    }
  }
  void modfifyAppointment(BuildContext context, String id, String testid, String testcatid, String testamount, String samplecollectdate, String samplecollecttime, String paymenttype,) async{
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => LabTestPage(
      labTestId: id,
      testId: testid,
      testCatId: testcatid,
      testAmount: testamount,
      sampleCollectDate: samplecollectdate,
      sampleCollectTime: samplecollecttime,
      paymentType: paymenttype,)));
  }


}

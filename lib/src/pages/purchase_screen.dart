import 'package:flutter/material.dart';
import 'package:smarthealthcare/src/model/order.dart';
import 'package:smarthealthcare/src/pages/purchase_detail_screen.dart';
import 'package:smarthealthcare/src/theme/light_color.dart';
import 'package:smarthealthcare/src/view_model/eshop_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PurchaseScreen extends StatefulWidget {
  @override
  _PurchaseScreenState createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  List<Order> orderList = [];
  var isLoading = true;
  var isFirst = true;
  var notFound = false;
  var userId;
  late EShopViewModel eShopViewModel;

  @override
  void initState() {
    super.initState();
    getCustomerInfo(context);
  }
  @override
  Widget build(BuildContext context) {
    eShopViewModel = Provider.of<EShopViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.themeRed,
        centerTitle: true,
        title: Text('Purchase list',
        style: TextStyle(
          color: ColorResources.white,
          fontSize: 18
        ),),
        leading: GestureDetector(
          onTap:()=>Navigator.pop(context),
          child: Icon(Icons.arrow_back_outlined,
          color: ColorResources.white,),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: orderList != null ? orderList.length:0,
                itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.only(bottom:5.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => PurchaseDetailScreen(userId, orderList[index].orderId)));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: ColorResources.white,
                      boxShadow: [
                        BoxShadow(
                          color: ColorResources.lightBlack.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Order ${orderList[index].orderId != null ? orderList[index].orderId:'' }',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: ColorResources.lightBlack
                                ),),
                                Padding(
                                  padding: const EdgeInsets.only(top:4.0),
                                  child: Text('${orderList[index].orderDate != null ? orderList[index].orderDate:'' }',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: ColorResources.lightBlack
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:4.0),
                                  child: Text('${orderList[index].orderStatus != null ? orderList[index].orderStatus:'' }',
                                    style: TextStyle(
                                        fontSize: 12,
                                      color: orderList[index].orderStatus == 'Pending' ? ColorResources.lightOrange:ColorResources.themeRed
                                    ),),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('View details >>',
                            style: TextStyle(
                              color: ColorResources.themeRed,
                              fontSize: 12
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
          loading(context),
          notFoundWidget(context)
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
  Widget notFoundWidget(BuildContext context) {
    return notFound
        ? Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Container(
        child: Center(
          child: SizedBox(
            width: 120,
            height: 120,
            child: Container(
              child: Center(
                child: Image.asset(
                  'assets/not_found.png',
                  height: 300,
                  width: 300,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ),
    )
        : Text('');
  }

  void getAllOrder(BuildContext context) async{
    List<Order> orders = await eShopViewModel.getAllOrder(userId);
    if(orders != null){

      if(orders.length >0) {
        orders.forEach((element) {
          setState(() {
            orderList.add(element);
            isLoading = false;
            notFound = false;
          });
        });
        setState(() {
          orderList.toSet();
        });
      }else{
        setState(() {
          notFound = true;
          isLoading = false;
        });
      }
    }
  }
  void getCustomerInfo(BuildContext context) async {
    SharedPreferences customerInfo = await SharedPreferences.getInstance();
    userId = customerInfo.getString('id');
    if(userId != null){
      setState(() {
        getAllOrder(context);
      });

    }

  }
}

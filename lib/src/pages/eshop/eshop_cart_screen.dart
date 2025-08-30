import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/config/route.dart';
import 'package:flutter_healthcare_app/src/model/cart.dart';
import 'package:flutter_healthcare_app/src/model/place_order.dart';
import 'package:flutter_healthcare_app/src/model/registration_response.dart';
import 'package:flutter_healthcare_app/src/pages/checkout_page.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/viewModel/eshop_view_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EshopCartScreen extends StatefulWidget {
  @override
  _EshopCartScreenState createState() => _EshopCartScreenState();
}

class _EshopCartScreenState extends State<EshopCartScreen> {
  var isFirst = true;
  var isLoading = true;
  var userId;
  var totalPrice = 0.0;
  List<Cart> cartList = [];
  List<int> qunatityList = [];
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
        title: Text(
          'My Cart',
          style: TextStyle(fontSize: 18, color: ColorResources.white),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: cartListItem(context)),
                chargeBox(context)
              ],
            ),
          ),
          loading(context)
        ],
      ),
    );
  }

  Widget chargeBox(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0, left: 10, right: 10),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(color: ColorResources.themeRed, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '\$ ${totalPrice}',
                    style: TextStyle(
                        color: ColorResources.themeRed,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: ColorResources.themeRed,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: GestureDetector(
                    onTap: () {
                      sendToCheckout(context);
                    },
                    child: Center(
                      child: Text(
                        'Checkout',
                        style: TextStyle(
                          color: ColorResources.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
Widget cartListItem(BuildContext context) {
  return ListView.builder(
    itemCount: cartList.length,
    itemBuilder: (context, index) {
      // Make sure quantity list is in sync
      if (qunatityList.length != cartList.length) {
        qunatityList = cartList.map((c) => c.productQty).toList();
      }

      return Slidable(
        key: ValueKey(cartList[index].id),
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.25,
          children: [
            SlidableAction(
              onPressed: (_) {
                openConfirmationDialog(context, cartList[index]);
              },
              backgroundColor: ColorResources.themeRed,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Container(
            decoration: BoxDecoration(
              color: ColorResources.white,
              boxShadow: [
                BoxShadow(
                  color: ColorResources.lightBlack.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              children: [
                // Product image
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorResources.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: CachedNetworkImage(
                      imageUrl:
                          "http://172.16.61.221:8059${cartList[index].productImageUrl}",
                      height: 80,
                      width: 80,
                      fit: BoxFit.fill,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),

                // Product details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartList[index].productName,
                        style: TextStyle(
                            color: ColorResources.lightBlack, fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          cartList[index].productCategoryName,
                          style: TextStyle(
                            color: ColorResources.lightBlack.withOpacity(0.5),
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        '${cartList[index].productPrice} \$',
                        style: TextStyle(
                          color: ColorResources.themeRed,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // Quantity decrease
                GestureDetector(
                  onTap: () {
                    if (qunatityList[index] > 1) {
                      setState(() {
                        qunatityList[index]--;
                        updateCart(
                          context,
                          cartList[index].id,
                          cartList[index].productId,
                          cartList[index].productName,
                          cartList[index].productCategoryId,
                          cartList[index].productCategoryName,
                          cartList[index].productPrice.toString(),
                          qunatityList[index].toString(),
                          userId,
                        );
                      });
                      getTotalPrice();
                    }
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      border: Border.all(color: ColorResources.themeRed, width: 2),
                    ),
                    child: Center(
                      child: Icon(Icons.remove, color: ColorResources.themeRed),
                    ),
                  ),
                ),

                // Quantity value
                SizedBox(
                  width: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${qunatityList[index]}',
                      style: TextStyle(
                        fontSize: 18,
                        color: ColorResources.lightBlack,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Quantity increase
                GestureDetector(
                  onTap: () {
                    setState(() {
                      qunatityList[index]++;
                      updateCart(
                        context,
                        cartList[index].id,
                        cartList[index].productId,
                        cartList[index].productName,
                        cartList[index].productCategoryId,
                        cartList[index].productCategoryName,
                        cartList[index].productPrice.toString(),
                        qunatityList[index].toString(),
                        userId,
                      );
                    });
                    getTotalPrice();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        border: Border.all(color: ColorResources.themeRed, width: 2),
                      ),
                      child: Center(
                        child: Icon(Icons.add, color: ColorResources.themeRed),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

  
  void getCustomerInfo(BuildContext context) async {
    SharedPreferences customerInfo = await SharedPreferences.getInstance();
    userId = customerInfo.getString('id');
    if (userId != null) {
      getCartProduct(context);
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

  void getCartProduct(BuildContext context) async {
    List<Cart> carts = await eShopViewModel.getCart(userId);

    if (carts != null) {



      setState(() {
        isLoading = false;
      });
      cartList.clear();
      carts.forEach((cart) {
        setState(() {
          cartList.add(cart);
        });
      });
      var total = 0.0;
      if (cartList != null) {
        for (int i = 0; i < cartList.length; i++) {
          total += cartList[i].productPrice * cartList[i].productQty;
        }
        setState(() {
          totalPrice = total;
        });
      }

      if(cartList.length ==0){
        context.push(AppRoutes.eshopHomePage);
      }

    }
  }

  void getTotalPrice() {
    var total = 0.0;
    if (cartList != null) {
      for (int i = 0; i < cartList.length; i++) {
        total += cartList[i].productPrice * qunatityList[i];
      }
      setState(() {
        totalPrice = total;
      });
    }
  }

  void updateCart(
      BuildContext context,
      String cartid,
      String productId,
      String productName,
      String productCategoryId,
      String productCategoryName,
      String productPrice,
      String productQnty,
      String createdBy) async {
    setState(() {
      isLoading = false;
    });
    RegistrationResponse response = await eShopViewModel.updateCart(
        cartid,
        productId,
        productName,
        productCategoryId,
        productCategoryName,
        productPrice,
        productQnty,
        userId);

    if (response != null) {
      setState(() {
        isLoading = false;
      });
    }
  }

  void sendToCheckout(BuildContext context) async {
    List<Cart> carts = await eShopViewModel.getCart(userId);

    if (carts != null) {
      PlaceOrder placeOrder =
          new PlaceOrder(userId: userId, productList: carts);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => CheckoutPage(placeOrder, totalPrice)));
    }
  }

  void openConfirmationDialog(BuildContext context, Cart cartitem) {
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
                          child: Text('Do you want to delete this item?',
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
                                onTap: ()=>removeItem(context,cartitem),
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

  void removeItem(BuildContext context, Cart cartitem) async {
    setState(() {
      isLoading = true;
    });
    RegistrationResponse response =
        await eShopViewModel.removeCartItem(cartitem.id.toString());

    if (response != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => EshopCartScreen()));
    }
  }
}

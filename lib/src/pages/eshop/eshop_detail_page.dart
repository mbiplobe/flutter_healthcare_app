import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/config/route.dart';
import 'package:flutter_healthcare_app/src/model/cart.dart';
import 'package:flutter_healthcare_app/src/model/medicine.dart';
import 'package:flutter_healthcare_app/src/model/registration_response.dart';
import 'package:flutter_healthcare_app/src/pages/eshop/eshop_cart_screen.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';
import 'package:flutter_healthcare_app/src/theme/theme.dart';
import 'package:flutter_healthcare_app/src/view_model/eshop_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EshopDetailPage extends StatefulWidget {
  final Medicine medicineListdata;

  EshopDetailPage(this.medicineListdata);

  @override
  _EshopDetailPageState createState() => _EshopDetailPageState();
}

class _EshopDetailPageState extends State<EshopDetailPage> {
  var isLoading = false;
  var userId;
  var isFound = false;
  List<Cart> cartList = [];
  late EShopViewModel eShopViewModel;

  @override
  void initState() {
    super.initState();
    getCustomerInfo();
  }

  @override
  Widget build(BuildContext context) {
    eShopViewModel = Provider.of<EShopViewModel>(context);

    TextStyle titleStyle = TextStyles.title.copyWith(fontSize: 25);
    if (AppTheme.fullWidth(context) < 393) {
      titleStyle = TextStyles.title.copyWith(fontSize: 23);
    }

    return Scaffold(
      backgroundColor: ColorResources.white,
      body: Stack(
        children: [
          WillPopScope(
            onWillPop: () async {
              context.go(AppRoutes.eshopHomePage);
              return false;
            },
            child: SafeArea(
              bottom: false,
              child: Stack(
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl:
                        "http://172.16.61.221:8059${widget.medicineListdata.imageUrl}",
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  DraggableScrollableSheet(
                    maxChildSize: .8,
                    initialChildSize: .6,
                    minChildSize: .6,
                    builder: (context, scrollController) {
                      return Container(
                        height: AppTheme.fullHeight(context) * .5,
                        padding: EdgeInsets.only(left: 19, right: 19, top: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          color: Colors.white,
                        ),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          controller: scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              priceText(),
                              productDetails(),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  _appbar(),
                ],
              ),
            ),
          ),
          loading(), // overlay loading
        ],
      ),
    );
  }

  Widget _appbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        BackButton(color: ColorResources.lightBlack),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: ColorResources.white,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      color: ColorResources.lightBlack.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.favorite_border,
                    color: ColorResources.themeRed,
                    size: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => EshopCartScreen()));
                },
                child: SizedBox(
                  width: 40,
                  child: Stack(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: ColorResources.white,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          boxShadow: [
                            BoxShadow(
                              color: ColorResources.lightBlack.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 15,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add_shopping_cart,
                            color: ColorResources.themeRed,
                            size: 20,
                          ),
                        ),
                      ),
                      if (cartList.isNotEmpty)
                        Positioned(
                          right: 0,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: ColorResources.themeRed,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Center(
                              child: Text(
                                '${cartList.length}',
                                style:
                                    TextStyle(color: ColorResources.white),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget priceText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Text(
            '${widget.medicineListdata.medicinePrice} \$',
            style: TextStyle(
                fontSize: 20,
                color: ColorResources.lightBlack.withOpacity(0.7),
                fontWeight: FontWeight.bold),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Text(
            '${widget.medicineListdata.uom}',
            style: TextStyle(
              fontSize: 16,
              color: ColorResources.lightBlack.withOpacity(0.7),
            ),
          ),
        )
      ],
    );
  }

  Widget productDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${widget.medicineListdata.medicineName}',
          style: TextStyle(
              color: ColorResources.lightBlack,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
          child: Text(
            '${widget.medicineListdata.productCategoryName}',
            style: TextStyle(
              color: ColorResources.lightBlack,
              fontSize: 18,
            ),
          ),
        ),
        Text(
          '${widget.medicineListdata.medicineTypeName}',
          style: TextStyle(
            color: ColorResources.lightBlack,
            fontSize: 18,
          ),
        ),
        Divider(
          thickness: 0.5,
          color: ColorResources.lightBlack.withOpacity(0.7),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            'Description',
            style: TextStyle(
              color: ColorResources.lightBlack,
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            '${widget.medicineListdata.medicineDesc}',
            style: TextStyle(
              color: ColorResources.lightBlack.withOpacity(0.5),
              fontSize: 14,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: GestureDetector(
            onTap: isFound ? null : () => saveToDb(),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: isFound ? ColorResources.grey : ColorResources.themeRed,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                child: Text(
                  'Add to cart',
                  style: TextStyle(
                      color: ColorResources.white, fontSize: 16),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget loading() {
    return isLoading
        ? Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
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
                          offset: Offset(0, 1),
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
          )
        : SizedBox.shrink();
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: ColorResources.themeRed,
        content: Text(
          message,
          style: TextStyle(color: ColorResources.white),
        ),
      ),
    );
  }

  void saveToDb() async {
    setState(() {
      isLoading = true;
    });

    RegistrationResponse response = await eShopViewModel.saveCart(
      widget.medicineListdata.id,
      widget.medicineListdata.medicineName,
      widget.medicineListdata.productCategory,
      widget.medicineListdata.productCategoryName,
      widget.medicineListdata.medicinePrice,
      '1',
      userId,
    );

    if (response != null) {
      await getCartProduct();
      showSnackbar(context, response.message);
      setState(() {
        isLoading = false;
      });
    }
  }

  void getCustomerInfo() async {
    SharedPreferences customerInfo = await SharedPreferences.getInstance();
    userId = customerInfo.getString('id');
    if (userId != null) {
      getCartProduct();
    }
  }

  Future<void> getCartProduct() async {
    List<Cart> carts = await eShopViewModel.getCart(userId);
    if (carts.isNotEmpty) {
      setState(() {
        cartList = carts;
        isFound = carts.any((cart) =>
            cart.productId == widget.medicineListdata.id);
      });
    }
  }
}

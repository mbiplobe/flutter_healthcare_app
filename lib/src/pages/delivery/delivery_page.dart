import 'package:flutter/material.dart';
import 'package:smart_health_care/src/theme/light_color.dart';

class DeliveryHomePage extends StatefulWidget {
  @override
  _DeliveryHomePageState createState() => _DeliveryHomePageState();
}

class _DeliveryHomePageState extends State<DeliveryHomePage> {
  // Constants for reusable values
  static const double _iconSize = 24.0;
  static const double _smallIconSize = 20.0;
  static const double _cardBorderRadius = 10.0;
  static const double _containerHeight = 30.0;
  static const double _containerWidth = 30.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: Icon(
          Icons.menu,
          color: ColorResources.lightBlack.withOpacity(0.7),
          size: _iconSize,
        ),
        centerTitle: true,
        title: Text(
          'Home',
          style: TextStyle(
            color: ColorResources.lightBlack.withOpacity(0.7),
            fontSize: 18,
          ),
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWelcomeSection(),
          _buildDeliveryRequestSection(context),
        ],
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 15),
          child: Text(
            'Hello',
            style: TextStyle(
              color: ColorResources.grey,
              fontSize: 14,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 5),
          child: Text(
            'Mr. Peter',
            style: TextStyle(
              color: ColorResources.lightBlack,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDeliveryRequestSection(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 15, bottom: 10),
            child: Text(
              'Delivery request',
              style: TextStyle(
                color: ColorResources.themeRed,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildDeliveryList(context),
        ],
      ),
    );
  }

  Widget _buildDeliveryList(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildDeliveryItem(context, index);
        },
      ),
    );
  }

  Widget _buildDeliveryItem(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: ColorResources.white,
          borderRadius: BorderRadius.all(Radius.circular(_cardBorderRadius)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: ColorResources.lightBlack.withOpacity(.3),
              blurRadius: 15,
              offset: Offset(5, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            _buildItemHeader(),
            _buildPickupDeliveryInfo(),
            _buildAddressInfo(),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildItemHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Medicine item',
            style: TextStyle(
              color: ColorResources.lightBlack,
              fontSize: 18,
            ),
          ),
          _buildViewButton(),
          Text(
            '#12367894',
            style: TextStyle(
              color: ColorResources.lightBlack,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewButton() {
    return Container(
      height: _containerHeight,
      width: _containerWidth,
      decoration: BoxDecoration(
        color: ColorResources.white,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        border: Border.all(color: ColorResources.themeRed),
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
          Icons.visibility,
          color: ColorResources.themeRed,
          size: _smallIconSize,
        ),
      ),
    );
  }

  Widget _buildPickupDeliveryInfo() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 15, bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Image.asset(
                  'assets/icon-truck.png',
                  height: 15,
                  width: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    'Pickup',
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorResources.lightBlack,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              'Delivery',
              style: TextStyle(
                fontSize: 16,
                color: ColorResources.lightBlack,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressInfo() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 15, bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "43, Jhonson height New Orlinse, USA",
              style: TextStyle(
                fontSize: 14,
                color: ColorResources.lightBlack.withOpacity(0.6),
              ),
            ),
          ),
          Expanded(
            child: Text(
              "43, Loram Ipsum NY, USA",
              style: TextStyle(
                fontSize: 14,
                color: ColorResources.lightBlack.withOpacity(0.6),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(_cardBorderRadius),
          bottomRight: Radius.circular(_cardBorderRadius),
        ),
        color: ColorResources.themeRed,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              // Handle decline action
            },
            child: Text(
              'Decline',
              style: TextStyle(
                color: ColorResources.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 30),
          TextButton(
            onPressed: () {
              // Handle accept action
            },
            child: Text(
              'Accept',
              style: TextStyle(
                color: ColorResources.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}

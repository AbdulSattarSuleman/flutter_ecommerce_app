import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icebox_cafe/model/product_category_model.dart';

import 'package:icebox_cafe/resources/color_manager.dart';
import 'package:icebox_cafe/resources/style_manager.dart';
import 'package:icebox_cafe/services/api_service.dart';
import 'package:icebox_cafe/utils/functionality/api_function.dart';

// ignore: must_be_immutable
class MenuScreen extends StatefulWidget {
  MenuScreen({Key? key, required List<ProductsModel>? productModel})
      : super(key: key);
  List<ProductsModel>? productModel;
  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // APIFunction().getProductsByCategories();
    // ApiService().getProductByCategoryAPI(1);
    ApiService().fetchProducts(6);
  }

  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: ColorManager.appBarColor,
      key: _scaffoldKey,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(),
        title: Text(
          "Menu",
          style: StyleManager().railwayFont(24, Colors.white, FontWeight.w700),
        ),
        backgroundColor: ColorManager.appBarColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(children: [
          Container(
            margin: EdgeInsets.zero,
            height: 70.0,
            color: ColorManager.appBarColor,
            child: Stack(
              children: [
                Positioned(
                  top: 5.0,
                  left: 0.0,
                  right: 0.0,
                  // bottom: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color(0xffF2F2F2),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Color(0xff49454F),
                            ),
                            onPressed: () {
                              print("your menu action here");
                              // _scaffoldKey.currentState.openDrawer();
                            },
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                labelText: "Search Items",
                                hintText: "Input",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          FutureBuilder<List<ProductsModel>?>(
              future: ApiService().fetchProducts(6),
              builder: (BuildContext context, AsyncSnapshot snaphot) {
                if (snaphot.hasData) {
                  return Text(widget.productModel!.length.toString());
                } else {
                  return ListView.builder(
                      itemCount: widget.productModel!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Text(
                              "${widget.productModel![index].itemsbyCategory}"),
                        );
                      });
                }
              })
        ]),
      ),
    );
  }
}

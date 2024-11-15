// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'package:weekend_cafeshop/bloc/product/bloc/product_bloc.dart';
import 'package:weekend_cafeshop/bloc/product/bloc/product_event.dart';
import 'package:weekend_cafeshop/bloc/product/bloc/product_state.dart';
import 'package:weekend_cafeshop/constans/my_color.dart';
import 'package:weekend_cafeshop/constans/my_text_style.dart';
import 'package:weekend_cafeshop/data/model/category.dart';
import 'package:weekend_cafeshop/data/model/product.dart';
import 'package:weekend_cafeshop/widgets/cached_image.dart';

class ProductScreen extends StatefulWidget {
  final String categoryId;
  Category category;
   ProductScreen({
    Key? key,
    required this.categoryId,
    required this.category,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    // فراخوانی داده‌های اولیه برای بارگذاری دسته‌ها
    BlocProvider.of<ProductBloc>(context)
        .add(ProductRequestList(categoryId: widget.categoryId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backGroundColor,
      body: SafeArea(
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return ListView.builder(itemBuilder: (context, index) => Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 145,
                            margin:
                              EdgeInsets.only(left: 27, right: 27, bottom: 11),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(23),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 11),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    color: Colors.grey[300],
                                  ),
                                  Container(
                                    height: 20,
                                    width: 50,
                                    color: Colors.grey[300],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        itemCount: 10);
            } else if (state is ProductResponseState) {
              return Column(
              children: [
                SizedBox(
                  width: double.infinity,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(top: 29,),
                  height: 53,
                  width: 357,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    color: MyColors.appBarColor,
                    boxShadow: [
                      BoxShadow(
                        color: MyColors.categoryContainerShadowColor,
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      
                      Container(
                        alignment: Alignment.center,
                        width: 270,
                        child: Text(widget.category.name, style: MyTextStyle.hotDrink)),
                      
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Image.asset(
                          'assets/images/remove.png',
                          height: 25,
                        ),
                      ),
                      SizedBox(width: 15,),
                    ],
                  ),
                ),
                SizedBox(height: 13,),
                Flexible(
                  child: ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      var product = state.products[index];
                      return Container(
                          margin:
                              EdgeInsets.only(left: 27, right: 27, bottom: 11),
                          height: 154,
                          decoration: BoxDecoration(
                            color: MyColors.productBackGroundColor,
                            borderRadius: BorderRadius.circular(23),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    product.name ?? 'محصول نامشخص',
                                    style: MyTextStyle.productName,
                                  ),
                                  SizedBox(height: 10),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(
                                      product.getFormattedPrice() + ' تومان',
                                      style: MyTextStyle.productPrice,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  SizedBox(
                                    width: 175,
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Text(
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        product.information ?? '',
                                        style: MyTextStyle.productInfo,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(23),
                                  child: SizedBox(
                                    height: 121,
                                    child: CachedImage(
                                      imageUrl: product.image,
                                    ),
                                  )),
                              SizedBox()
                            ],
                          ),
                        );
                    },
                  ),
                )
              ],
            );
            } else if(state is ProductErrorState){
              return Center(
                child: Text(state.message),
              );

            }else{
              return Text('errrrorrr');
            }
            
          },
        ),
        
      ),
    );
  }
}

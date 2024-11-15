import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weekend_cafeshop/bloc/product/bloc/product_bloc.dart';
import 'package:weekend_cafeshop/bloc/product/bloc/product_event.dart';
import 'package:weekend_cafeshop/bloc/product/bloc/product_state.dart';
import 'package:weekend_cafeshop/constans/my_color.dart';
import 'package:weekend_cafeshop/constans/my_text_style.dart';
import 'package:weekend_cafeshop/data/model/product.dart';
import 'package:weekend_cafeshop/widgets/cached_image.dart';

class ProductScreen extends StatefulWidget {
  final String categoryId;

  const ProductScreen({
    super.key,
    required this.categoryId,
  });

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
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 29, left: 27, right: 27),
                height: 53,
                width: 336,
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
                    Text('نوشیدنی گرم', style: MyTextStyle.hotDrink),
                    SizedBox(width: 78),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(
                        'assets/images/remove.png',
                        height: 25,
                      ),
                    ),
                    SizedBox(width: 13),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 11),
            ),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoadingState) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } 
//!-------------------------------------------------------------------------------
                
                else if (state is ProductResponseState) {
                  return SliverFillRemaining(
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
                                      product.price.toString() + ' تومان',
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
                  );
                } else if (state is ProductErrorState) {
                  return SliverToBoxAdapter(
                      child: Center(child: Text(state.message)));
                } else {
                  return SliverToBoxAdapter(
                      child: Center(child: Text('خطا در بارگذاری')));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

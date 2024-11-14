import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weekend_cafeshop/bloc/category_bloc.dart';
import 'package:weekend_cafeshop/bloc/category_event.dart';
import 'package:weekend_cafeshop/bloc/category_state.dart';
import 'package:weekend_cafeshop/constans/my_color.dart';
import 'package:weekend_cafeshop/constans/my_text_style.dart';
import 'package:weekend_cafeshop/data/model/category.dart';
import 'package:weekend_cafeshop/widgets/cached_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryBloc()..add(CategoryRequestList()), // فراخوانی لیست دسته‌ها,
      child: Scaffold(
        backgroundColor: MyColors.backGroundColor,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 30,
                backgroundColor: MyColors.backGroundColor,
                pinned: true,
                floating: true,
                expandedHeight: 210,
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final scrolled =
                        constraints.biggest.height <= kToolbarHeight;
                    return FlexibleSpaceBar(
                      centerTitle: true,
                      title: scrolled
                          ? Text(
                              'Weekend',
                              style: MyTextStyle.title2,
                            )
                          : null,
                      background: Container(
                        decoration: BoxDecoration(
                          color: MyColors.appBarColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: Stack(
                          alignment: FractionalOffset.centerLeft,
                          children: [
                            Positioned(
                              left: 30,
                              top: 45,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Weekend',
                                    style: MyTextStyle.title,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      'Cafe & Resturant',
                                      style: MyTextStyle.cafeAndRestaurant,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      'Fall in Love with\nCoffee in Weekend\nCoffeShop!',
                                      style: MyTextStyle.fallInLoveWithCoffe,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 20,
                              top: 37,
                              child: Image.asset(
                                'assets/images/WeekendLogo.png',
                                height: 180,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 25,
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 33),
                sliver: BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoadingState) {
                      return SliverToBoxAdapter(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else if (state is CategoryResponseState) {
                      // بررسی موفقیت آمیز بودن واکنش
                      return state.response.fold(
                        (error) => SliverToBoxAdapter(
                          child: Center(
                            child: Text(error,
                                style: TextStyle(color: Colors.red)),
                          ),
                        ),
                        (categories) => SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 15,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              Category category = categories[index];
                              return Container(
                                width: 98,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          MyColors.categoryContainerShadowColor,
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                  color: MyColors.categoryContainerColor,
                                  borderRadius: BorderRadius.circular(23),
                                  border: Border.all(
                                    color:
                                        MyColors.categoryContainerBorderColor,
                                  ),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 11),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        child: CachedImage(
                                          imageUrl: category.image,
                                        )
                                      ),
                                      Text(
                                        category.name,
                                        style: MyTextStyle.categoryName,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            childCount: categories.length,
                          ),
                        ),
                      );
                    } else {
                      return SliverToBoxAdapter(
                        child: Center(child: Text('هیچ داده‌ای موجود نیست')),
                      );
                    }
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 16),
              ),
              SliverToBoxAdapter(
                child: Stack(
                  alignment: FractionalOffset.center,
                  children: [
                    Image.asset('assets/images/weekend.png'),
                    Positioned(
                      right: 48,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '+98 903 511 6886',
                                style: MyTextStyle.textInsideImage,
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              Image.asset(
                                'assets/images/phone.png',
                                height: 22,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                'اهواز٬کیانپارس٬خیابان\nایدون٬بین میهن و یک',
                                style: MyTextStyle.textInsideImage,
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              Image.asset(
                                'assets/images/location.png',
                                height: 22,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 19),
                            child: Row(
                              children: [
                                Text(
                                  'weekend_caferesturant',
                                  style: MyTextStyle.textInsideImageInstagram,
                                ),
                                SizedBox(
                                  width: 9,
                                ),
                                Image.asset(
                                  'assets/images/instagram.png',
                                  height: 22,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'تمامی حقوق این سایت متعلق\nبه کافی شاپ ویکند میباشد',
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

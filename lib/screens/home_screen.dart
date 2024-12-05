import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weekend_cafeshop/bloc/category/category_bloc.dart';
import 'package:weekend_cafeshop/bloc/category/category_event.dart';
import 'package:weekend_cafeshop/bloc/category/category_state.dart';
import 'package:weekend_cafeshop/bloc/product/bloc/product_bloc.dart';
import 'package:weekend_cafeshop/constans/my_color.dart';
import 'package:weekend_cafeshop/constans/my_text_style.dart';
import 'package:weekend_cafeshop/data/model/category.dart';
import 'package:weekend_cafeshop/screens/product_screen.dart';
import 'package:weekend_cafeshop/widgets/cached_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // فراخوانی داده‌های اولیه برای بارگذاری دسته‌ها
    BlocProvider.of<CategoryBloc>(context).add(CategoryRequestList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backGroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 10, // حذف سایه پیش‌فرض
              scrolledUnderElevation: 10,
              shadowColor: Colors.black, // سایه در حالت اسکرول

              backgroundColor: MyColors.backGroundColor,
              pinned: true,
              floating: true,
              expandedHeight: 210,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final scrolled = constraints.biggest.height <= kToolbarHeight;
                  return PhysicalModel(

                    color: Colors.white,
                    elevation: !scrolled
                        ? 10
                        : 10, // نمایش سایه زمانی که اپ‌بار باز است
                    shadowColor: Colors.black.withOpacity(0.9), // رنگ سایه
                    child: Container(
                      decoration: const BoxDecoration(
                        color: MyColors.appBarColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: FlexibleSpaceBar(
                        centerTitle: true,
                        title: scrolled
                            ? const Text(
                                'Weekend',
                                style: MyTextStyle.title2,
                              )
                            : null,
                        background: Container(
                          decoration: const BoxDecoration(
                            color: MyColors.appBarColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
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
                                    const Text(
                                      'Weekend',
                                      style: MyTextStyle.title,
                                    ),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        'Cafe & Resturant',
                                        style: MyTextStyle.cafeAndRestaurant,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        'The House\nOf Mood!',
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
                              ),
                            ],
                          ),
                        ),
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
              padding: const EdgeInsets.symmetric(horizontal: 33),
              sliver: BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoadingState) {
                    return SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 15,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
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
                        childCount: 12, // تعداد نمونه‌های شیمر (برای 9 کارت)
                      ),
                    );
                  } else if (state is CategoryResponseState) {
                    // بررسی موفقیت آمیز بودن واکنش
                    return state.response.fold(
                      (error) => SliverToBoxAdapter(
                        child: Center(
                          child:
                              Text(error, style: const TextStyle(color: Colors.red)),
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
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                      create: (context) => ProductBloc(),
                                      child: ProductScreen(
                                        category: category,
                                        categoryId: category.id,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 98,
                                decoration: BoxDecoration(
                                  boxShadow: const [
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
                                    width: 1.5,
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
                                          )),
                                      Text(
                                        category.name,
                                        style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          childCount: categories.length,
                        ),
                      ),
                    );
                  } else {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: Text('هیچ داده‌ای موجود نیست'),
                      ),
                    );
                  }
                },
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 16),
            ),
            SliverToBoxAdapter(
              child: Stack(
                alignment: FractionalOffset.center,
                children: [
                  Image.asset('assets/images/weekend.png'),
                  Positioned(
                    right: 50,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Row(
                            children: [
                              Text(
                                '+98 903 511 6886',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const SizedBox(
                                width: 9,
                              ),
                              Image.asset(
                                'assets/images/phone.png',
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Row(
                            children: [
                              const Text(
                                'اهواز٬کیانپارس٬خیابان\nایدون٬بین میهن و یک',
                                style: MyTextStyle.textInsideImage,
                                textAlign: TextAlign.end,
                              ),
                              const SizedBox(
                                width: 9,
                              ),
                              Image.asset(
                                'assets/images/location.png',
                                height: 22,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 19),
                          child: GestureDetector(
                             onTap: () async {
                        final Uri url = Uri.parse(
                            'https://www.instagram.com/weekend_caferesturant?igsh=OGQ5ZDc2ODk2ZA==');
                        if (!await launchUrl(url)) {
                          throw Exception('Could not launch');
                        }
                      }, // وقتی کاربر روی متن کلیک کند، اینستاگرام باز می‌شود
                            child: Row(
                              children: [
                                const Text(
                                  'weekend_caferesturant',
                                  style: MyTextStyle.textInsideImageInstagram,
                                ),
                                const SizedBox(
                                  width: 9,
                                ),
                                Image.asset(
                                  'assets/images/instagram.png',
                                  height: 22,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    child: GestureDetector(
                      onTap: () async {
                        final Uri url = Uri.parse(
                            'https://www.instagram.com/aradazr.dev/profilecard/?igsh=dGhtMm92MXFna2Qx');
                        if (!await launchUrl(url)) {
                          throw Exception('Could not launch');
                        }
                      }, // وقتی کاربر روی متن کلیک کند، اینستاگرام باز می‌شود
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/link.png',
                            height: 15,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'ساخته شده توسط آراد آذرپناه',
                            style: MyTextStyle.aradazr,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'تمامی حقوق این سایت متعلق\n.به کافی شاپ ویکند میباشد',
                  style: MyTextStyle.weekendRights,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

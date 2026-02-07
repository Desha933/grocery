import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/common/function/show_snake_bar.dart';
import 'package:grocery/core/common/shared_widget.dart/custom_shared_button.dart';
import 'package:grocery/core/common/shared_widget.dart/loader.dart';
import 'package:grocery/core/common/shared_widget.dart/spacing.dart';
import 'package:grocery/core/utils/app_colors.dart';
import 'package:grocery/core/utils/app_routes.dart';
import 'package:grocery/core/utils/styles.dart';
import 'package:grocery/features/auth/domain/entities/user_entity.dart';
import 'package:grocery/features/home/domain/entities/product_entity.dart';
import 'package:grocery/features/home/presentation/bloc/product_bloc.dart';
import 'package:grocery/features/home/presentation/widgets/category_list_view.dart';
import 'package:grocery/features/home/presentation/widgets/custom_sliver_grid_category_product.dart';
import 'package:grocery/features/home/presentation/widgets/home_screen_header.dart';
import 'package:grocery/features/home/presentation/widgets/horizontal_card_list_view.dart';
import 'package:grocery/features/home/presentation/widgets/row_text_with_icon.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key, required this.user});
  final UserEntity user;

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  List<ProductEntity> products = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is GetAllProductsSuccess) {
          products = state.products;
        }
        if (state is GetAllProductsFailure) {
          showSnackBar(context, state.errMessage);
        }
        if (state is PostProductsuccess) {
          products = state.products;
        }
      },
      builder: (context, state) {
        return state is GetAllProductsLoading
            ? const Loader() // add Chamer Package this is best package for loading
            : CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: HomeScreenHeader(user: widget.user),
                  ),
                  SliverToBoxAdapter(child: verticalSpacing(23)),
                  SliverToBoxAdapter(child: HorizontalCardListView()),
                  SliverToBoxAdapter(child: verticalSpacing(30)),
                  SliverToBoxAdapter(
                    child: RowTextWithIcon(
                      text: "Categories",
                      icon: Icons.arrow_forward,
                      onPressed: () {
                        products.isNotEmpty
                            ? AppRoutes.router.push(
                                AppRoutes.categoryScreen,
                                extra: products,
                              )
                            : showSnackBar(
                                context,
                                "Products is Empty please add product",
                              );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(child: CategoryListView()),
                  SliverToBoxAdapter(child: verticalSpacing(30)),

                  SliverToBoxAdapter(
                    child: RowTextWithIcon(
                      text: "Trending Deals",
                      icon: Icons.arrow_forward,
                    ),
                  ),
                  SliverToBoxAdapter(child: verticalSpacing(13)),
                  state is GetAllProductsFailure
                      ? SliverToBoxAdapter(
                          child: Center(child: Text("${state.errMessage}")),
                        )
                      : products.isNotEmpty
                      ? CustomSliverGridCategroyProduct(products: products)
                      : SliverToBoxAdapter(
                          child: Center(child: Text("No Products")),
                        ),
                  SliverToBoxAdapter(child: verticalSpacing(40)),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    sliver: SliverToBoxAdapter(
                      child: CustomSharedButton(
                        text: "More",
                        onPressed: () {},
                        textStyle: Styles.bold14WhitePoppins,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: verticalSpacing(40)),
                ],
              );
      },
    );
  }
}

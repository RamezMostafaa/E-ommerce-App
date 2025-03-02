import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/di.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/home/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/home/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/my_assets.dart';
import '../../../utils/my_colors.dart';
import 'widgets/annountcements_section.dart';
import 'widgets/categories_or_brands_section.dart';
import 'widgets/custom_search_with_shopping_cart.dart';
import 'widgets/row_section_widgets.dart';

class HomeTab extends StatelessWidget {
  HomeTabViewModel viewModel = HomeTabViewModel(
      categoriesUseCase: injectGetAllCategoriesUseCase(),
      brandsUseCase: injectGetAllBrandsUseCase());

  @override
  Widget build(BuildContext context) {
    AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
        bloc: viewModel
          ..getAllCategories()
          ..getAllBrands(),
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Image.asset(
                      MyAssets.logo,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    CustomSearchWithShoppingCart(),
                    SizedBox(
                      height: 16.h,
                    ),
                    AnnouncementsSection(),
                    SizedBox(
                      height: 16.h,
                    ),
                    RowSectionWidget(name: appLocalizations!.categories),
                    SizedBox(
                      height: 24.h,
                    ),
                    state is CategoryLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          )
                        : CategoriesOrBrandsSection(
                            list: viewModel.categoriesList),
                    SizedBox(
                      height: 24.h,
                    ),
                    RowSectionWidget(name: appLocalizations.brands),
                    SizedBox(
                      height: 24.h,
                    ),
                    state is BrandLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          )
                        : CategoriesOrBrandsSection(list: viewModel.brandsList),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

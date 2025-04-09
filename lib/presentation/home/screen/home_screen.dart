import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:inf_fl/core/presentation/components/dish_card.dart';
import 'package:inf_fl/core/presentation/components/recipe_category_selector.dart';
import 'package:inf_fl/core/presentation/components/search_input_field.dart';
import 'package:inf_fl/domain/model/recipe.dart';
import 'package:inf_fl/presentation/home/home_state.dart';
import 'package:inf_fl/ui/color_st.dart';
import 'package:inf_fl/ui/text_st.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  final void Function() onTapSearchField;
  final HomeState state;
  final void Function(String category) onSelectCategory;
  const HomeScreen({
    super.key,
    required this.name,
    required this.onTapSearchField,
    required this.state,
    required this.onSelectCategory,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello $name', style: TST.largeTextBold),
                        const SizedBox(height: 5),
                        Text(
                          'What are you cooking today?',
                          style: TST.smallerTextRegular.copyWith(
                            color: CST.gray3,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: CST.secondary40,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset('assets/image/face.png'),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: onTapSearchField,
                        child: IgnorePointer(
                          child: SearchInputField(
                            placeHolder: 'Search Recipe',
                            isReadOnly: true,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: CST.primary100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.tune, color: CST.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 10, bottom: 10),
            child: RecipeCategorySelector(
              categories: state.categories,
              onSelectCategory: onSelectCategory,
              selectedCategory: state.selectedCategory,
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    state.dishes
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: DishCard(
                              recipe: e,
                              onTapFavorite: (Recipe recipe) {},
                              isFavorite: false,
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

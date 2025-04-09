import 'package:flutter/material.dart';
import 'package:inf_fl/core/presentation/components/recipe_grid_item.dart';
import 'package:inf_fl/core/presentation/components/search_input_field.dart';
import 'package:inf_fl/presentation/search/search_state.dart';
import 'package:inf_fl/ui/color_st.dart';
import 'package:inf_fl/ui/text_st.dart';

class SearchScreen extends StatelessWidget {
  final SearchState state;
  final void Function(String query)? onChanged;
  final void Function()? onTapFilter;

  const SearchScreen({
    super.key,
    required this.state,
    this.onChanged,
    this.onTapFilter,
  });

  get onTapSearchField => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search recipes', style: TST.mediumTextBold),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 17),
            Row(
              children: [
                Expanded(
                  child: SearchInputField(
                    placeHolder: 'Search Recipe',
                    onChanged: onChanged,
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: onTapFilter,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: CST.primary100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.tune, color: CST.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(state.searchTitle, style: TST.normalTextBold),
                Spacer(),

                Text(
                  state.resultsCount,
                  style: TST.smallerTextRegular.copyWith(color: CST.gray3),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child:
                  state.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                        ),
                        itemCount: state.recipes.length,
                        itemBuilder: (context, index) {
                          return RecipeGridItem(recipe: state.recipes[index]);
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}

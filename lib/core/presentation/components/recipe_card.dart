import 'package:flutter/material.dart';
import 'package:inf_fl/domain/model/recipe.dart';
import 'package:inf_fl/ui/color_st.dart';
import 'package:inf_fl/ui/text_st.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 315 / 150,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(recipe.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    recipe.name,
                    maxLines: 2,
                    style: TST.smallTextBold.copyWith(color: Colors.white),
                  ),
                ),
                Text(
                  'By ${recipe.chef}',
                  style: TST.smallerTextRegular.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Row(
              children: [
                const Icon(Icons.alarm, color: Colors.white, size: 17),
                const SizedBox(width: 5),
                Text(
                  recipe.time,
                  style: TST.smallerTextRegular.copyWith(color: Colors.white),
                ),
                const SizedBox(width: 10),
                ClipOval(
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(3),
                    child: const Icon(
                      Icons.bookmark_border_outlined,
                      color: CST.primary80,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              width: 37,
              height: 16,
              decoration: BoxDecoration(
                color: CST.secondary20,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star, size: 12, color: CST.rating),
                  Text(recipe.rating.toString(), style: TST.smallerTextRegular),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

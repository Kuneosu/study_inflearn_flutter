import 'package:flutter/material.dart';
import 'package:inf_fl/domain/model/recipe.dart';
import 'package:inf_fl/ui/color_st.dart';
import 'package:inf_fl/ui/text_st.dart';

class DishCard extends StatelessWidget {
  final Recipe recipe;
  final void Function(Recipe recipe) onTapFavorite;
  final bool isFavorite;

  const DishCard({
    super.key,
    required this.recipe,
    required this.onTapFavorite,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 230,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: 150,
              height: 176,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: CST.gray4,
              ),
              child: Center(
                child: SizedBox(
                  width: 130,
                  height: 42,
                  child: Text(
                    recipe.name,
                    style: TST.smallTextBold,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Time',
                  style: TST.smallerTextRegular.copyWith(color: CST.gray3),
                ),
                const SizedBox(height: 5),
                Text(
                  recipe.time,
                  style: TST.smallerTextBold.copyWith(color: CST.gray1),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: GestureDetector(
              onTap: () => onTapFavorite(recipe),
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.bookmark_outline,
                  color: isFavorite ? CST.primary80 : CST.gray3,
                  size: 16,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: SizedBox(
              width: 110,
              height: 110,
              child: CircleAvatar(backgroundImage: NetworkImage(recipe.image)),
            ),
          ),
          Positioned(
            top: 30,
            right: 0,
            child: Container(
              width: 45,
              height: 23,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: CST.secondary20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star, color: CST.rating, size: 10),
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

import 'package:bokly_app/core/utils/assets.dart';
import 'package:bokly_app/features/home/presentaion/views/widgets/custom_appBar.dart';
import 'package:bokly_app/features/home/presentaion/views/widgets/custom_hor_list_view.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 13, top: 10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.27,
                child: Skeletonizer(enabled: false, child: CustomHorListView()),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 13, top: 25, bottom: 5),
              child: Text(
                "Best Seller",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) =>
                  Skeletonizer(enabled: false, child: VerticalCard()),
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class VerticalCard extends StatelessWidget {
  const VerticalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.29,
            height: MediaQuery.of(context).size.height * 0.19,

            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AssetsData.testImage),
              ),

              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Harry Potter and the Sorcerer's Stone",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: AssetsData.gtFont,
                  ),
                  maxLines: 2,
                ),
                SizedBox(height: 10),
                Text(
                  "A young boy discovers he is a wizard and attends a magical school, uncovering secrets about his past.",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),

                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "19.99 €",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.star, color: Colors.amber, size: 18),
                    SizedBox(width: 3),
                    Text(
                      "4.5",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "(1523)",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

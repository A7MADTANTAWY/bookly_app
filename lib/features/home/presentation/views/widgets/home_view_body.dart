import 'package:bokly_app/features/home/presentation/views/widgets/custom_home_view_appBar.dart';
import 'package:bokly_app/features/home/presentation/views/widgets/custom_hor_list_view.dart';
import 'package:bokly_app/features/home/presentation/views/widgets/custom_ver_list_view.dart';
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
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.27,
                child: CustomHorListView(widthOfSizedBbox: 13),
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
          CustomVerListView(),
        ],
      ),
    );
  }
}

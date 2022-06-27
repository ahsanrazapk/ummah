import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ummah/constant/Images/svgs.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/gallery_screen/component/gallery_item.dart';
import 'package:ummah/presentation/gallery_screen/mixin/gallery_mixin.dart';
import 'package:ummah/presentation/widgets/main_body.dart';

class GalleryScreen extends BaseStateFullWidget {
  GalleryScreen({Key? key}) : super(key: key);

  @override
  GalleryState createState() => GalleryState();
}

class GalleryState extends State<GalleryScreen> with GalleryMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(150),
      child: Stack(
        alignment: const Alignment(0.0, 4.3),
        children: [
          Center(child: appBar(widget.dimens, widget.navigator)),
          Material(
            elevation: 4.0,
            borderRadius: BorderRadius.circular(100),
            child: CircleAvatar(radius: 70,backgroundColor: Colors.white,child:
            CircleAvatar(
                radius: 60,
                backgroundColor: Style.card1,
                child: SvgAssets.appLogoBlueSmall,
            ),),
          ),
        ],
      )),
      body: MainBody(
        extendedTop: false,
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: List.generate(100, (index) {
            bool mod = index % 3 == 1;
         return  mod ? StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 2.8,
              child: GalleryItem(index: index,),): StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 3.5,
              child: GalleryItem(index: index,),);
          }),
        ),
      ),
    );
  }
}


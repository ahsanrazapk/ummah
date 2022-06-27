import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ummah/application/core/routes/routes.dart';
import 'package:ummah/application/main_config/routes/route_path.dart';
import 'package:ummah/constant/Images/svgs.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/data/local_data_source/preference/i_pref_helper.dart';
import 'package:ummah/di/di.dart';
import 'package:ummah/presentation/about_screen/about_screen.dart';
import 'package:ummah/presentation/activity/activity_screen.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/gallery_screen/gallery_screen.dart';
import 'package:ummah/presentation/home/enums/page_index.dart';
import 'package:ummah/presentation/home/mixin/home_mixin.dart';
import 'package:ummah/presentation/home/home_view_model.dart';
import 'package:ummah/presentation/home/pages/dashboard.dart';

class HomeScreen extends BaseStateFullWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with HomeMixin {

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: PageView(
        controller: pageController,
        onPageChanged: (index) =>viewModel.onPageChange(PageIndex.values[index]),
        children: [
          GalleryScreen(),
          ActivityScreen(),
          Dashboard(viewModel: viewModel,),
          AboutScreen(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.onPageChange(PageIndex.home);
          pageController.animateToPage(PageIndex.home.index, duration: const Duration(milliseconds: 100), curve: Curves.linear);
        },
        backgroundColor: Style.accent1,
        child: SvgAssets.navHome(validPageIndex(viewModel.pageIndex, PageIndex.home)),
      ),
      bottomNavigationBar: bottomAppBar(viewModel.pageIndex, (PageIndex page)
      async { if(page == PageIndex.shutdown){
        bool? logout = await widget.navigator.showNAVDialog('Are you sure?', 'You want to go back');
        if(logout!=null && logout){
         inject<IPrefHelper>().removeToken();
          widget.navigator.pushNamedAndRemoveUntil(RoutePath.login);
        }
        return;
      }
        pageController.animateToPage(page.index, duration: const Duration(milliseconds: 100), curve: Curves.linear);}
      ),
    );
  }
}

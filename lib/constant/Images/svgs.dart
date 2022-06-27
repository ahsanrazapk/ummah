import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ummah/constant/style/Style.dart';

class SvgAssets {
  static final appLogo = SvgPicture.asset('assets/app_logo.svg');
  static final appLogoBlue = SvgPicture.asset('assets/app_logo_blue.svg');
  static final appLogoBlueSmall = SvgPicture.asset('assets/app_logo_blue.svg', width: 80,height: 80);
  static final design = SvgPicture.asset('assets/design.svg');
  static final gallery = SvgPicture.asset('assets/gallery.svg',width: 35,height: 35,);
  static final aboutLogo = SvgPicture.asset('assets/about_logo.svg',width: 45,height: 45,);
  static final forward = SvgPicture.asset('assets/forward.svg',width: 12,height: 12,);

  static  navAbout(color) => SvgPicture.asset('assets/about_nav.svg', color: color,width: 18,height: 22,);
  static  navGallery(color) => SvgPicture.asset('assets/gallery_nav.svg',color: color,);
  static  navNotify(color) => SvgPicture.asset('assets/notify_nav.svg',color: color);
  static  navHome(color) => SvgPicture.asset('assets/home.svg',color: color,);
  static  navOff(color) => SvgPicture.asset('assets/off.svg',color: color,);

  static final or = SvgPicture.asset('assets/or.svg');
  static final swr = SvgPicture.asset('assets/swr.svg');
  static final twr = SvgPicture.asset('assets/twr.svg');
  static final clock = SvgPicture.asset('assets/clock.svg', color: Style.fontGrey,width: 15,height: 15,);
  static final cal = SvgPicture.asset('assets/att_cal.svg', color: Style.fontGrey,width: 15,height: 15,);
  static final forwardWhite = SvgPicture.asset('assets/forward.svg',width: 12,height: 12,color: Style.white,);

  static final fb = SvgPicture.asset('assets/fb.svg');
  static final insta = SvgPicture.asset('assets/insta.svg');
  static final tw = SvgPicture.asset('assets/tw.svg');

}
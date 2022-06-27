import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/widgets/section_box.dart';

class ExpandList extends BaseStateFullWidget {
  final Widget content;
  final String title;
  final double? closedHeight;
  final double? openedHeight;
  final Duration? duration;
  final double? onTapPadding;
  final double? borderRadius;

  ExpandList({
    Key? key,
    required this.content,
    required this.title,
    this.closedHeight,
    this.openedHeight,
    this.duration,
    this.onTapPadding,
    this.borderRadius,
  }) : super(key: key);

  @override
  _ExpandListState createState() => _ExpandListState();
}

class _ExpandListState extends State<ExpandList> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpandedListViewModel(),
      child: Consumer<ExpandedListViewModel>(
       
        builder: (context,  state,  child) {
          return SectionBox(
            color: state.expand ? Style.bgLight : Colors.transparent,

            child: AnimatedContainer(
              margin: EdgeInsets.symmetric(
                  horizontal: state.expand ? widget.dimens.k5 : widget.onTapPadding ?? widget.dimens.k10,
                  vertical: widget.dimens.k5
              ),
              padding: EdgeInsets.symmetric(horizontal: widget.dimens.k5, vertical: widget.dimens.k5),
              height: state.expand ? widget.closedHeight : widget.openedHeight,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: widget.duration ?? const Duration(milliseconds: 400),
              decoration:  BoxDecoration(
                color: state.expand? Style.white: Style.primary,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: widget.duration ?? const Duration(milliseconds: 400),
                    padding: state.expand ? EdgeInsets.all(widget.dimens.k5) : EdgeInsets.all(
                        widget.dimens.k10),
                    decoration: BoxDecoration(
                      color: !state.expand ? Style.card1.withOpacity(0.3) : Colors.transparent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(widget.dimens.k10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.title,
                          style: context.textTheme.headline6?.copyWith(color: state.expand?Style.primary :Style.card1,fontWeight: FontWeight.normal),
                        ),
                        CircleAvatar(
                          radius: widget.dimens.k12,
                          backgroundColor: Colors.black26,
                          child: Icon(
                            state.expand
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_up,
                            color: state.expand ? Style.white : Style.accent1,
                            size: widget.dimens.k20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: AnimatedCrossFade(
                      firstChild: const SizedBox.shrink(),
                      secondChild: AnimatedPadding(duration: widget.duration ?? const Duration(milliseconds: 400),
                          padding: state.expand ? EdgeInsets.zero : EdgeInsets.all(widget.dimens.k7),
                          child: widget.content),
                      crossFadeState: state.expand
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,

                      duration:
                      widget.duration ?? const Duration(milliseconds: 400),
                      reverseDuration: Duration.zero,
                      sizeCurve: Curves.fastLinearToSlowEaseIn,
                    ),
                  ),
                ],
              ),
            ),
          ).onTap(() {
            state.expand = !state.expand;
          });
        },
      ),
    );
  }
}

class ExpandedListViewModel extends ChangeNotifier {
  ExpandedListViewModel() {
    //ignore
  }

  bool _expand = true;

  bool get expand => _expand;

  set expand(bool value) {
    _expand = value;
    notifyListeners();
  }

}
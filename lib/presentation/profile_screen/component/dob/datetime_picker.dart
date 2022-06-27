import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/profile_screen/component/dob/date_model.dart';

typedef DateChangedCallback = Function(DateTime time);
typedef DateCancelledCallback = Function();
typedef StringAtIndexCallBack = String? Function(int index);

class DatePicker {
  static Future<DateTime> showPicker(
    BuildContext context, {
    required DateChangedCallback onChanged,
    required DateChangedCallback onConfirm,
    required DateCancelledCallback onCancel,
    required BasePickerModel pickerModel,
  }) async {
    return await showDialog(
        context: context,
        builder: (context) {
          Widget bottomSheet = DateOfBirthDialog(
            onChanged: onChanged,
            onCancel: onCancel,
            onConfirm: onConfirm,
            pickerModel: pickerModel,
          );
          return bottomSheet;
        });
  }
}

class DateOfBirthDialog extends BaseStateFullWidget {
   DateOfBirthDialog({Key? key, required this.pickerModel, required this.onChanged, required this.onConfirm, required this.onCancel})
      : super(key: key);

  final DateChangedCallback onChanged;
  final DateChangedCallback onConfirm;
  final DateCancelledCallback onCancel;
  final BasePickerModel pickerModel;

  @override
  State<StatefulWidget> createState() {
    return DatePickerState();
  }
}

class DatePickerState extends State<DateOfBirthDialog> {
  late FixedExtentScrollController leftScrollCtrl, middleScrollCtrl, rightScrollCtrl;

  @override
  void initState() {
    super.initState();
    refreshScrollOffset();
  }

  void refreshScrollOffset() {
    leftScrollCtrl = FixedExtentScrollController(initialItem: widget.pickerModel.currentLeftIndex());
    middleScrollCtrl = FixedExtentScrollController(initialItem: widget.pickerModel.currentMiddleIndex());
    rightScrollCtrl = FixedExtentScrollController(initialItem: widget.pickerModel.currentRightIndex());
  }

  @override
  Widget build(BuildContext context) {
    return _renderItemView();
  }

  void _notifyDateChanged() {
    widget.onChanged(widget.pickerModel.finalTime()!);
  }

  void _notifyDateConfirm() {
    widget.onConfirm(widget.pickerModel.finalTime()!);
  }

  Widget _renderItemView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Material(
          elevation:  4.0,
          color:  Style.white,
          borderRadius: BorderRadius.circular(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: widget.pickerModel.layoutProportions()[0] > 0
                        ? _renderColumnView(
                            ValueKey(widget.pickerModel.currentLeftIndex()),
                            true,
                            widget.pickerModel.leftStringAtIndex,
                            leftScrollCtrl,
                            widget.pickerModel.layoutProportions()[0], (index) {
                            widget.pickerModel.setLeftIndex(index);
                          }, (index) {
                            setState(() {
                              refreshScrollOffset();
                              _notifyDateChanged();
                            });
                          })
                        : null,
                  ),
                  Text(
                    widget.pickerModel.leftDivider(),
                    style: context.textTheme.titleMedium?.copyWith(color: Style.primary),
                  ),
                  Container(
                    child: widget.pickerModel.layoutProportions()[1] > 0
                        ? _renderColumnView(
                            ValueKey(widget.pickerModel.currentLeftIndex()),
                            false,
                            widget.pickerModel.middleStringAtIndex,
                            middleScrollCtrl,
                            widget.pickerModel.layoutProportions()[1], (index) {
                            widget.pickerModel.setMiddleIndex(index);
                          }, (index) {
                            setState(() {
                              refreshScrollOffset();
                              _notifyDateChanged();
                            });
                          })
                        : null,
                  ),
                  Text(
                    widget.pickerModel.rightDivider(),
                    style: context.textTheme.titleMedium?.copyWith(color: Style.primary),
                  ),
                  Container(
                    child: widget.pickerModel.layoutProportions()[2] > 0
                        ? _renderColumnView(
                            ValueKey(
                                widget.pickerModel.currentMiddleIndex() * 100 + widget.pickerModel.currentLeftIndex()),
                            false,
                            widget.pickerModel.rightStringAtIndex,
                            rightScrollCtrl,
                            widget.pickerModel.layoutProportions()[2], (index) {
                            widget.pickerModel.setRightIndex(index);
                          }, (index) {
                            setState(() {
                              refreshScrollOffset();
                              _notifyDateChanged();
                            });
                          })
                        : null,
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end,children: [SizedBox(
                width: context.width *0.2,
                child: TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    widget.onCancel();
                  },
                  child: const Text('CANCEL'),
                ),
              ), SizedBox(
                  width: context.width *0.3,
                  child: TextButton(
                    onPressed: () async {
                      widget.navigator.pop(widget.pickerModel.finalTime());
                      _notifyDateConfirm();
                    },
                    child: const Text('CONFIRM'),
                  ),
                )],)
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderColumnView(
    ValueKey key,
    bool isLeft,
    StringAtIndexCallBack stringAtIndexCB,
    ScrollController scrollController,
    int layoutProportion,
    ValueChanged<int> selectedChangedWhenScrolling,
    ValueChanged<int> selectedChangedWhenScrollEnd,
  ) {
    return Expanded(
      flex: layoutProportion,
      child: Container(
        padding:  EdgeInsets.all(widget.dimens.k8),
        height: widget.dimens.k300 + widget.dimens.k10,
        child: NotificationListener(
          onNotification: (ScrollNotification notification) {
            if (notification.depth == 0 &&
                notification is ScrollEndNotification &&
                notification.metrics is FixedExtentMetrics) {
              final FixedExtentMetrics metrics = notification.metrics as FixedExtentMetrics;
              final int currentItemIndex = metrics.itemIndex;
              selectedChangedWhenScrollEnd(currentItemIndex);
            }
            return false;
          },
          child: CupertinoPicker.builder(
            key: key,
            scrollController: scrollController as FixedExtentScrollController,
            itemExtent: widget.dimens.k36,
            onSelectedItemChanged: (int index) {
              selectedChangedWhenScrolling(index);
            },
            useMagnifier: true,
            itemBuilder: (BuildContext context, int index) {
              final content = stringAtIndexCB(index);
              if (content == null) {
                return null;
              }
              return Container(
                height: widget.dimens.k36,
                alignment: Alignment.center,
                child: Text(
                  content,
                  style: context.textTheme.titleMedium?.copyWith(color: Style.primary),
                  textAlign: TextAlign.start,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

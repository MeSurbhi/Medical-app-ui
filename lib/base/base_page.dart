import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical_app/base/base_page_view_model.dart';
import 'package:medical_app/base/base_widget.dart';
import 'package:medical_app/utils/color_utils.dart';

/// Every Page/View should be inherited from this
abstract class BasePage<VM extends BasePageViewModel> extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);
}

abstract class BasePageState<VM extends BasePageViewModel,
    T extends BasePage<VM>> extends State<T> {}

abstract class BaseStatefulPage<VM extends BasePageViewModel,
    B extends BasePage<VM>> extends BasePageState<VM, B> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool subscribeVisibilityEvents = false;

  BaseStatefulPage({
    this.subscribeVisibilityEvents: false,
  });

  VM? _viewModel;

  bool get attached => _viewModel != null;

  @override
  Widget build(BuildContext context) {
    return _getLayout();
  }

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  /// Actual Screen which load scaffold and load UI
  Widget _getLayout() {
    return BaseWidget<VM>(
        providerBase: provideBase(),
        onModelReady: _onBaseModelReady,
        builder: (BuildContext context, VM? model, Widget? child) {
          return WillPopScope(
            onWillPop: onBackPressed,
            child: SelectionArea(
              focusNode: FocusNode(),
              selectionControls: materialTextSelectionControls,
              child: Scaffold(
                key: _scaffoldKey,
                appBar: buildAppbar(),
                extendBodyBehindAppBar: extendBodyBehindAppBar(),
                body: _buildScaffoldBody(context, model!),
                drawerEnableOpenDragGesture: drawerEnableOpenDragGesture(),
                bottomSheet: buildBottomSheet(),
                floatingActionButton: floatingActionButton(),
                resizeToAvoidBottomInset: true,
              ),
            ),
          );
        });
  }

  /// Building a floatingActionButton of screen
  Widget? floatingActionButton() {
    return null;
  }

  /// Building a appbar of screen
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  /// Building a bottom-sheet
  Widget? buildBottomSheet() {
    return null;
  }



  bool extendBodyBehindAppBar() {
    return false;
  }

  bool drawerEnableOpenDragGesture() {
    return false;
  }

  Widget _buildScaffoldBody(BuildContext context, VM model) {
    return buildView(context, model);
  }

  @mustCallSuper
  Widget buildView(BuildContext context, VM model);

  void _onBaseModelReady(VM model) {
    _viewModel = model;

    onModelReady(model);
  }

  Future<bool> onBackPressed({dynamic param}) {
    return _onWillPop(param);
  }

  Future<bool> _onWillPop(dynamic param) {
    if (Navigator.canPop(context)) {
      if (param != null) {
        Navigator.pop(context, param);
        return Future.value(false);
      } else {
        Navigator.pop(
          context,
        );
        return Future.value(false);
      }
    }
    return Future.value(true);
  }

  /*Mandatory*/

  /// You can setup load something when model is ready, Ex: Load or fetch some data from remote layer
  void onModelReady(VM model) {}

  /// Declare and initialization of viewModel for the page
  ProviderBase provideBase();
}

abstract class BasePageViewWidget<T extends BasePageViewModel> extends Widget {
  final ProviderBase providerBase;

  const BasePageViewWidget(this.providerBase, {Key? key}) : super(key: key);

  @protected
  Widget build(BuildContext context, T model);

  @override
  DataProviderElement<T> createElement() =>
      DataProviderElement<T>(this, this.providerBase);
}

class DataProviderElement<T extends BasePageViewModel>
    extends ComponentElement {
  final ProviderBase providerBase;

  DataProviderElement(BasePageViewWidget widget, this.providerBase)
      : super(widget);

  @override
  BasePageViewWidget get widget => super.widget as BasePageViewWidget;

  @override
  Widget build() {
    return BaseWidget<T>(
      providerBase: providerBase,
      builder: (context, model, child) {
        return widget.build(this, model!);
      },
    );
  }
}

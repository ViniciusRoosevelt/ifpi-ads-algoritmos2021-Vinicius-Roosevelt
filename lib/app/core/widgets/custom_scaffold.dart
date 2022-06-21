import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/typography.dart';

class CustomScaffold extends StatefulWidget {
  String title;
  Widget body;
  double? width;
  double? height;
  ScrollController? scrollController;

  CustomScaffold(
      {Key? key,
      required this.title,
      required this.body,
      double? height = 0,
      double? width = 0,
      ScrollController? scrollController})
      : super(key: key) {
    this.title = title;
    this.body = body;
    this.width = width;
    this.height = height;
    this.scrollController = scrollController;
  }

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    double height = widget.height == 0
        ? MediaQuery.of(context).size.height
        : (widget.height ?? 100.0);
    double width = widget.width == 0
        ? MediaQuery.of(context).size.width
        : (widget.width ?? 100.0);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.quarternary,
              )),
          elevation: 1.0,
          title: Text(
            widget.title,
            style: AppTypography.h1.copyWith(color: AppColors.primary),
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget.body,
          ),
        )
            // child: CustomScrollView(
            //     shrinkWrap: true,
            //     controller: widget.scrollController ??
            //         ScrollController(
            //             initialScrollOffset: 0.0, keepScrollOffset: true),
            //     slivers: [
            //   SliverAppBar(
            // leading: IconButton(
            //     onPressed: () => Navigator.pop(context),
            //     icon: Icon(
            //       Icons.arrow_back_ios,
            //       color: AppColors.quarternary,
            //     )),
            //     floating: false,
            //     pinned: true,
            //     expandedHeight: height * .15,
            //     collapsedHeight: 50,
            //     toolbarHeight: 50,
            //     flexibleSpace: FlexibleSpaceBar(
            //       title: Container(
            //         width: width * .9,
            //         child: Text(
            // widget.title,
            // style: AppTypography.h1.copyWith(color: AppColors.primary),
            // textAlign: TextAlign.center,
            // overflow: TextOverflow.clip,
            //         ),
            //       ),
            //     ),
            //   ),
            //   SliverToBoxAdapter(
            //     child: Container(
            //       height: height,
            //       width: width,
            //       child: widget.body,
            //     ),
            //   ),
            // ])),
            ));
  }
}

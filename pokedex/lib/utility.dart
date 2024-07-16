import 'package:flutter/widgets.dart';

class ScrollManager {
  ScrollController? _scrollController;

  void setScrollController(ScrollController controller) {
    _scrollController = controller;
  }

  void scrollToIndex(int index, double itemHeight) {
    if (_scrollController != null) {
      _scrollController!.animateTo(
        index * itemHeight,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }
}

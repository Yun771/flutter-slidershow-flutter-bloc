import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'slideshow_state.dart';

class SlideshowCubit extends Cubit<SlideshowState> {
  SlideshowCubit() : super(const SlideshowState());

  void onBulletSelected(double index) {
    emit(state.copyWith(
      currentPage: index,
    ));
  }

  void onPrimaryColorSelected(Color color) {
    emit(state.copyWith(primaryColor: color));
  }

  void onSecondaryColorSelected(Color color) {
    emit(state.copyWith(secondaryColor: color));
  }

  void onPrimaryBulletSelected(double size) {
    emit(state.copyWith(primaryBullet: size));
  }

  void onSecondaryBulletSelected(double size) {
    emit(state.copyWith(secondaryBullet: size));
  }

  void onReset() {
    emit(const SlideshowState());
  }

  void currentPage(double currentPage) {
    emit(
      state.copyWith(
        currentPage: currentPage,
        event: SlideshowEvent.noUpdatedPage,
        pageStatus: state.pageStatus == SlideshowPageStatus.finished
            ? null
            : SlideshowPageStatus.inProgress,
      ),
    );
  }

  void pageViewIndex(int pageViewIndex) {
    emit(state.copyWith(
      pageViewIndex: pageViewIndex,
      currentPage: pageViewIndex.toDouble(),
      event: SlideshowEvent.updatedPage,
      pageStatus: state.pageStatus == SlideshowPageStatus.finished
          ? null
          : SlideshowPageStatus.inProgress,
    ));
  }

  void setState({
    double? currentPage,
    Color? primaryColor,
    Color? secondaryColor,
    double? primaryBullet,
    double? secondaryBullet,
  }) {
    emit(state.copyWith(
      currentPage: currentPage,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      primaryBullet: primaryBullet,
      secondaryBullet: secondaryBullet,
    ));
  }

  void lastPage() {
    if (state.pageStatus == SlideshowPageStatus.finished) return;
    emit(state.copyWith(pageStatus: SlideshowPageStatus.finished));
  }
}

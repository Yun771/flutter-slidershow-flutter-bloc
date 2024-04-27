part of 'slideshow_cubit.dart';

enum SlideshowEvent {
  updatedPage,
  noUpdatedPage,
}

enum SlideshowPageStatus {
  initial,
  inProgress,
  finished,
}

class SlideshowState extends Equatable {
  final double currentPage;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;
  final int pageViewIndex;
  final SlideshowEvent event;
  final SlideshowPageStatus pageStatus;

  const SlideshowState({
    this.currentPage = 0,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.primaryBullet = 0,
    this.secondaryBullet = 0,
    this.pageViewIndex = 0,
    this.event = SlideshowEvent.noUpdatedPage,
    this.pageStatus = SlideshowPageStatus.initial,
  });

  SlideshowState copyWith({
    double? currentPage,
    Color? primaryColor,
    Color? secondaryColor,
    double? primaryBullet,
    double? secondaryBullet,
    int? pageViewIndex,
    SlideshowEvent? event,
    SlideshowPageStatus? pageStatus,
  }) =>
      SlideshowState(
        currentPage: currentPage ?? this.currentPage,
        primaryColor: primaryColor ?? this.primaryColor,
        secondaryColor: secondaryColor ?? this.secondaryColor,
        primaryBullet: primaryBullet ?? this.primaryBullet,
        secondaryBullet: secondaryBullet ?? this.secondaryBullet,
        pageViewIndex: pageViewIndex ?? this.pageViewIndex,
        event: event ?? this.event,
        pageStatus: pageStatus ?? this.pageStatus,
      );

  @override
  List<Object> get props => [
        currentPage,
        primaryColor,
        secondaryColor,
        primaryBullet,
        secondaryBullet,
        pageViewIndex,
        event,
        pageStatus,
      ];
}

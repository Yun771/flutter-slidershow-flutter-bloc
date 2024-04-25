part of 'slideshow_cubit.dart';

class SlideshowState extends Equatable {
  final double currentPage;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;

  const SlideshowState({
    this.currentPage = 0,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.primaryBullet = 0,
    this.secondaryBullet = 0,
  });

  SlideshowState copyWith({
    double? currentPage,
    Color? primaryColor,
    Color? secondaryColor,
    double? primaryBullet,
    double? secondaryBullet,
  }) =>
      SlideshowState(
        currentPage: currentPage ?? this.currentPage,
        primaryColor: primaryColor ?? this.primaryColor,
        secondaryColor: secondaryColor ?? this.secondaryColor,
        primaryBullet: primaryBullet ?? this.primaryBullet,
        secondaryBullet: secondaryBullet ?? this.secondaryBullet,
      );

  @override
  List<Object> get props => [
        currentPage,
        primaryColor,
        secondaryColor,
        primaryBullet,
        secondaryBullet,
      ];
}

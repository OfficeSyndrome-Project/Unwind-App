class ScreeningQPage {
  int questionPage;
  String? assetPath;
  ScreeningQPage({
    required this.questionPage,
    required this.assetPath,
  });
  static List<ScreeningQPage> getScreeningQPage() => [
        ScreeningQPage(
          questionPage: 1,
          assetPath: "lib/assets/images/screeningPart/scr_part_one_2.png",
        ),
        ScreeningQPage(
          questionPage: 2,
          assetPath: null,
        ),
        ScreeningQPage(
          questionPage: 3,
          assetPath: null,
        ),
      ];
}

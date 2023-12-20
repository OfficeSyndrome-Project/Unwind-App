class NrsScoreLabel {
  String label;
  String assetPath;

  NrsScoreLabel({
    required this.label,
    required this.assetPath,
  });
  static List<NrsScoreLabel> getScore() => [
        NrsScoreLabel(
          label: 'ไม่ปวด',
          assetPath: "lib/assets/images/screeningPart/emo_1.png",
        ),
        NrsScoreLabel(
          label: 'เล็กน้อย',
          assetPath: "lib/assets/images/screeningPart/emo_2.png",
        ),
        NrsScoreLabel(
          label: 'ปานกลาง',
          assetPath: "lib/assets/images/screeningPart/emo_3.png",
        ),
        NrsScoreLabel(
          label: 'ค่อนข้างมาก',
          assetPath: "lib/assets/images/screeningPart/emo_4.png",
        ),
        NrsScoreLabel(
          label: 'มาก',
          assetPath: "lib/assets/images/screeningPart/emo_5.png",
        ),
        NrsScoreLabel(
          label: 'ที่สุด',
          assetPath: "lib/assets/images/screeningPart/emo_6.png",
        ),
      ];
}

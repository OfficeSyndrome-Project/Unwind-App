class IntroScreeningData {
  final String assetPath;
  final String titleLabel;
  final String descriptionLabel;

  IntroScreeningData(
      {required this.assetPath,
      required this.titleLabel,
      required this.descriptionLabel});

  static List<IntroScreeningData> getData() {
    List<IntroScreeningData> introdatalists = [];

    introdatalists.add(IntroScreeningData(
        assetPath: 'lib/assets/images/screeningPart/scr_part_one_1.png',
        titleLabel: 'แบบประเมินส่วนที่ 1',
        descriptionLabel:
            'คำถามชุดนี้จะเป็นการประเมินเพื่อคัดแยกโรคที่ไม่ใช่อาการของออฟฟิศซินโดรม'));
    introdatalists.add(IntroScreeningData(
        assetPath: 'lib/assets/images/screeningPart/scr_part_one_1.png',
        titleLabel: 'แบบประเมินส่วนที่ 2',
        descriptionLabel:
            'คำถามชุดนี้จะเป็นการประเมินอาการความเจ็บปวด ทางระบบกระดูกและกล้ามเนื้อตามบริเวณที่ได้เลือก'));
    introdatalists.add(IntroScreeningData(
        assetPath: 'lib/assets/images/screeningPart/scr_part_one_1.png',
        titleLabel: 'แบบประเมินส่วนที่ 3',
        descriptionLabel:
            'คำถามชุดนี้จะมีท่าบริหารประกอบเพื่อให้ผู้ใช้งานทดลองทำและให้คะแนนอาการความเจ็บปวดของตัวเอง'));

    return introdatalists;
  }
}

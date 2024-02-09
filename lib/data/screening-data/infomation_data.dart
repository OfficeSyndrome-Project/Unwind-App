class InformationData {
  final String assetPath;
  final String titleLabel;
  final String descriptionLabel;

  InformationData(
      {required this.assetPath,
      required this.titleLabel,
      required this.descriptionLabel});

  static List<InformationData> getData() {
    List<InformationData> informationmockup = [];

    informationmockup.add(InformationData(
        assetPath: 'lib/assets/images/screeningPart/information_1.png',
        titleLabel: 'อาการชาเป็นอย่างไร ?',
        descriptionLabel:
            'รู้สึกผิวหนังหนาๆ เป็นปื้นๆ ยิบๆ ซ่าๆ  เหมือนเข็มทิ่ม ปวดแสบร้อน เสียวคล้ายไฟช็อต หรือแม้แต่การสูญเสียความรู้สึก'));
    informationmockup.add(InformationData(
        assetPath: 'lib/assets/images/screeningPart/information_2.png',
        titleLabel: 'อาการตึงเป็นอย่างไร ?',
        descriptionLabel:
            'เป็นอาการปวดที่พบได้ในชีวิตประจำวันในการทำงานทำกิจกรรมต่าง ๆ อาจเกิดบางครั้งบางคราว เป็น ๆ หาย ๆ ปวดเวลาใดก็ได้ เช่นเช้าตื่นขึ้นรู้สึกตึงขยับลำบาก หรือเมื่อยล้ามากในช่วงเย็น'));
    informationmockup.add(InformationData(
        assetPath: 'lib/assets/images/screeningPart/information_3.png',
        titleLabel: 'อาการร้าวไปยังส่วนอื่นเป็นอย่างไร ?',
        descriptionLabel:
            'เช่น มีอาการปวดคอร้าวลงไปถึงแขน ปวดหลังส่วนล่างร้าวไปถึงขา ลักษณะนี้เป็นอาการแสดงที่เกิดจากเส้นประสาทสันหลังส่วนคอถูกรบกวน'));

    return informationmockup;
  }
}

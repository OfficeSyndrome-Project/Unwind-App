class ExceptionData {
  final String titleLabel;
  final String descriptionLabel;

  ExceptionData({required this.titleLabel, required this.descriptionLabel});

  static List<ExceptionData> getData() {
    List<ExceptionData> exceptionmockup = [];

    exceptionmockup.add(ExceptionData(
        titleLabel: 'ดูเหมือนว่าคุณจะไม่ได้เป็นออฟฟิศซินโดรม',
        descriptionLabel:
            'ควรพบแพทย์เพื่อตรวจสอบสาเหตุของอาการเนื่องจากอาการดังกล่าวไม่ได้เกิดจากการทำงาน'));
    exceptionmockup.add(ExceptionData(
        titleLabel: 'ดูเหมือนว่าคุณจะต้องรับการรักษา',
        descriptionLabel:
            'ควรพบแพทย์เพื่อตรวจสอบสาเหตุของอาการเนื่องจากอาการดังกล่าวไม่ได้เกิดจากการทำงาน'));
    exceptionmockup.add(ExceptionData(
        titleLabel: 'ดูเหมือนว่าคุณจะต้องรับการรักษา',
        descriptionLabel:
            'อาการปวดของคุณมีค่าความเจ็บปวดเกินเกณฑ์ที่จะรักษาด้วยตนเองควรพบแพทย์เพื่อได้รับการรักษาที่ถูกต้อง'));

    return exceptionmockup;
  }
}

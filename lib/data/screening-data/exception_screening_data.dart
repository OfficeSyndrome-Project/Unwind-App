class ExceptionData {
  final String titleLabel;
  final String descriptionLabel;

  ExceptionData({required this.titleLabel, required this.descriptionLabel});

  static List<ExceptionData> getData() {
    List<ExceptionData> exceptionmockup = [];
    //0 ไม่ใช่ office syndrome
    exceptionmockup.add(ExceptionData(
        titleLabel: 'ดูเหมือนว่าคุณจะไม่ได้เป็นออฟฟิศซินโดรม',
        descriptionLabel:
            'หากท่านมีอาการปวดที่ไม่ได้มาจากการทำงานควรพบแพทย์เพื่อตรวจสอบสาเหตุของอาการ แต่หากไม่มีอาการปวดท่านสามารถเข้าใช้แอปพลิเคชันได้ตามปกติ'));
    //1
    exceptionmockup.add(ExceptionData(
        titleLabel: 'ดูเหมือนว่าคุณจะต้องรับการรักษา',
        descriptionLabel:
            'ควรพบแพทย์เพื่อตรวจสอบสาเหตุของอาการเนื่องจากอาการดังกล่าวไม่ได้เกิดจากการทำงาน'));
    //2
    exceptionmockup.add(ExceptionData(
        titleLabel: 'ดูเหมือนว่าคุณจะต้องรับการรักษา',
        descriptionLabel:
            'อาการปวดของคุณมีค่าความเจ็บปวดเกินเกณฑ์ที่จะรักษาด้วยตนเองควรพบแพทย์เพื่อได้รับการรักษาที่ถูกต้อง'));
    //3
    exceptionmockup.add(ExceptionData(
        titleLabel: '',
        descriptionLabel:
            'หากท่านไม่มีอาการปวด ท่านสามารถตรวจใหม่อีกครั้งได้ แต่หากท่านมีอาการปวดที่ไม่ได้มาจากการทำงานควรพบแพทย์เพื่อตรวจสอบสาเหตุของอาการ'));

    return exceptionmockup;
  }
}

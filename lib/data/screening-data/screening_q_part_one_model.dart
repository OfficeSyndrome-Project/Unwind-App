class ScreeningPartOneModel {
  int questionId;
  int questionPage;
  String question;
  String questionType;

  ScreeningPartOneModel(
      {required this.questionId,
      required this.questionPage,
      required this.question,
      required this.questionType});
  @override
  String toString() {
    return 'ScreeningPartOneModel{questionId: $questionId, questionPage: $questionPage, question: $question, questionType: $questionType}';
  }

  static List<ScreeningPartOneModel> getScreeningPartOneModel() => [
        ScreeningPartOneModel(
            questionId: 1,
            questionPage: 1,
            question:
                "1. ท่านแน่ใจหรือไม่ว่า อาการเจ็บปวดของท่าน\nมีสาเหตุจากการทำงาน",
            questionType: "คัดแยกโรค"),
        ScreeningPartOneModel(
            questionId: 2,
            questionPage: 2,
            question:
                "2. ขณะเดินขึ้นบันไดหรือออกกำลังกาย\nท่านมีอาการเจ็บปวดบริเวณคอหรือแขน\nร่วมกับอาการแน่นหน้าอก หอบเหนื่อยหรือไม่ ?",
            questionType: "คัดแยกโรค"),
        ScreeningPartOneModel(
            questionId: 3,
            questionPage: 2,
            question:
                "3. ท่านเคยมีอาการชาใบหน้า พูดลำบาก ลื้นแข็ง ลิ้นคับปากหรือไม่?",
            questionType: "คัดแยกโรค"),
        ScreeningPartOneModel(
            questionId: 4,
            questionPage: 3,
            question:
                "5. ในการทำงานของท่าน มีการใช้งานคอมพิวเตอร์ หรืออุปกรณ์อิเล็กทรอนิกส์อื่น ๆ หรือไม่ ?",
            questionType: "คัดแยกโรค"),
      ];
}

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
                "2. ในการกระทำที่ออกแรงไม่มาก ท่านมีอาการแน่นหน้าอก/เจ็บหน้าอก หายใจไม่อิ่ม ร่วมกับปวดร้าวที่บริเวณกราม/แขนหรือไม่?",
            questionType: "คัดแยกโรค"),
        ScreeningPartOneModel(
            questionId: 3,
            questionPage: 2,
            question:
                "3. ท่านเคยมีอาการชาใบหน้า พูดลำบาก ลื้นแข็ง ลิ้นคับปากหรือไม่?",
            questionType: "คัดแยกโรค"),
        ScreeningPartOneModel(
            questionId: 4,
            questionPage: 2,
            question:
                "4. ท่านมีตุ่มพอง ผื่นแดง และปวดแสบปวดร้อนบริเวณหลังหรือทรวงอกโดยไม่ทราบสาเหตุหรือไม่ ? ",
            questionType: "คัดแยกโรค"),
        ScreeningPartOneModel(
            questionId: 5,
            questionPage: 3,
            question:
                "5. ในการทำงานของท่าน มีการใช้งานคอมพิวเตอร์ หรืออุปกรณ์อิเล็กทรอนิกส์อื่น ๆ หรือไม่ ?",
            questionType: "คัดแยกโรค"),
        ScreeningPartOneModel(
            questionId: 6,
            questionPage: 3,
            question:
                "6. ในทำงานของท่าน มีการเคลื่อนไหวร่างกายซ้ำ ๆ หรือมีการทำงานท่าเดิมเป็นระยะเวลานานหรือไม่ ?",
            questionType: "คัดแยกโรค"),
        ScreeningPartOneModel(
            questionId: 7,
            questionPage: 3,
            question: "7. ท่านมีความเครียดระหว่างการทำงานหรือไม่ ?",
            questionType: "คัดแยกโรค"),
        ScreeningPartOneModel(
            questionId: 8,
            questionPage: 3,
            question: "8. ท่านรู้สึกกล้ามเนื้อตึงในขณะทำงานหรือไม่ ?",
            questionType: "คัดแยกโรค"),
      ];
}

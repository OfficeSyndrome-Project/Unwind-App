class ScreeningPartThreePostureModel {
  String title;
  String PostureName;
  String question;
  String assetPath;
  int questionId;
  int questionPage;

  ScreeningPartThreePostureModel({
    required this.title,
    required this.PostureName,
    required this.question,
    required this.assetPath,
    required this.questionId,
    required this.questionPage,
  });
  static List<ScreeningPartThreePostureModel>
      getScreeningPartThreePostureModel() => [
            ScreeningPartThreePostureModel(
                title: "คอ",
                PostureName: "ท่าก้ม-เงยคอ",
                assetPath: "lib/assets/images/screeningPart/neck_bend_tilt.png",
                question: "ท่านมีอาการเจ็บ ปวด ชา ร้าว ระหว่างทำหรือไม่ ?",
                questionId: 7,
                questionPage: 0),
            ScreeningPartThreePostureModel(
                title: "คอ",
                PostureName: "ท่าหันซ้าย-ขวา",
                assetPath: "lib/assets/images/screeningPart/neck_turn_lr.png",
                question: "ท่านมีอาการเจ็บ ปวด ชา ร้าว ระหว่างทำหรือไม่ ?",
                questionId: 8,
                questionPage: 1),
            ScreeningPartThreePostureModel(
                title: "บ่า",
                PostureName: "ท่าเอนคอ",
                assetPath: "lib/assets/images/screeningPart/neck_lean.png",
                question: "ท่านมีอาการเจ็บ ปวด ชา ร้าว ระหว่างทำหรือไม่ ?",
                questionId: 5,
                questionPage: 2),
            ScreeningPartThreePostureModel(
                title: "หลังส่วนล่าง",
                PostureName: "ท่าเหยียดลำตัวไปด้านหลัง",
                assetPath: "lib/assets/images/screeningPart/back_plank.png",
                question: "ท่านมีอาการเจ็บ ปวด ชา ร้าว ระหว่างทำหรือไม่ ?",
                questionId: 4,
                questionPage: 3),
            ScreeningPartThreePostureModel(
                title: "หลังส่วนล่าง",
                PostureName: "ท่างอลำตัวมาด้านหน้า",
                assetPath: "lib/assets/images/screeningPart/back_turtle.png",
                question: "ท่านมีอาการเจ็บ ปวด ชา ร้าว ระหว่างทำหรือไม่ ?",
                questionId: 4,
                questionPage: 3),
          ];
  @override
  String toString() {
    return 'ScreeningPartThreePostureModel{title: $title, PostureName: $PostureName, question: $question, assetPath: $assetPath, questionId: $questionId, questionPage: $questionPage}';
  }
}

class ScreeningPartThreeQuestionModel {
  String question;
  int questionId;
  int questionPage;

  ScreeningPartThreeQuestionModel({
    required this.question,
    required this.questionId,
    required this.questionPage,
  });
  static List<ScreeningPartThreeQuestionModel>
      getScreeningPartThreeQuestionModel() => [
            ScreeningPartThreeQuestionModel(
                question: "คุณมีอาการปวดบริเวณนี้มาก่อนหรือไม่ ?",
                questionId: 10,
                questionPage: 1),
            ScreeningPartThreeQuestionModel(
                question:
                    "หลังจากทำท่าทางดังกล่าว\nท่านมีอาการเจ็บปวดคงอยู่จนถึงตอนนี้หรือไม่ ?",
                questionId: 11,
                questionPage: 1),
            ScreeningPartThreeQuestionModel(
                question:
                    "ท่านมีอาการชา และ/หรือ\nอาการปวดร้าวไปยังบริเวณอื่น\nอาทิเช่น ปวดร้าวลงแขนหรือไม่ ?",
                questionId: 12,
                questionPage: 1),
            ScreeningPartThreeQuestionModel(
                question:
                    "หลังจากทำท่าทางดังกล่าว\nท่านมีอาการปวด/ตึงเกิดขึ้น แต่อาการลดลงหรือ\nหายไปเมื่อหยุดพักใช่หรือไม่?",
                questionId: 13,
                questionPage: 1),
            ScreeningPartThreeQuestionModel(
                question:
                    "หลังจากทำท่าทางดังกล่าว\nท่านมีอาการเวียนหัว\nเวียนหน้าใช่หรือไม่ ?",
                questionId: 14,
                questionPage: 1),
          ];
  @override
  String toString() {
    return 'ScreeningPartThreeQuestionModel{question: $question, questionId: $questionId, questionPage: $questionPage}';
  }
}

//composite class
class ScreeningPartThreeModel{
  List<ScreeningPartThreeQuestionModel> questions;
  List<ScreeningPartThreePostureModel> postures;

  ScreeningPartThreeModel({
    required this.questions,
    required this.postures,
  });
}
class ScreeningPartThreePostureModel {
  String title;
  String postureName;
  String question;
  String assetPath;
  int questionId;
  int questionPage;
  String questionType;

  ScreeningPartThreePostureModel({
    required this.title,
    required this.postureName,
    required this.question,
    required this.assetPath,
    required this.questionId,
    required this.questionPage,
    required this.questionType,
  });
  static List<ScreeningPartThreePostureModel>
      getScreeningPartThreePostureModel() => [
            ScreeningPartThreePostureModel(
                title: "คอ",
                postureName: "ท่าก้ม-เงยคอ",
                assetPath: "lib/assets/images/screeningPart/neck_bend_tilt.png",
                question: "ท่านมีอาการเจ็บ ปวด ชา ร้าว ระหว่างทำหรือไม่ ?",
                questionId: 7,
                questionPage: 0,
                questionType: "a"),
            ScreeningPartThreePostureModel(
                title: "คอ",
                postureName: "ท่าหันซ้าย-ขวา",
                assetPath: "lib/assets/images/screeningPart/neck_turn_lr.png",
                question: "ท่านมีอาการเจ็บ ปวด ชา ร้าว ระหว่างทำหรือไม่ ?",
                questionId: 8,
                questionPage: 1,
                questionType: "a"),
            ScreeningPartThreePostureModel(
                title: "บ่า",
                postureName: "ท่าเอนคอ",
                assetPath: "lib/assets/images/screeningPart/neck_lean.png",
                question: "ท่านมีอาการเจ็บ ปวด ชา ร้าว ระหว่างทำหรือไม่ ?",
                questionId: 5,
                questionPage: 2,
                questionType: "a"),
            ScreeningPartThreePostureModel(
                title: "หลังส่วนล่าง",
                postureName: "ท่าเหยียดลำตัวไปด้านหลัง",
                assetPath: "lib/assets/images/screeningPart/back_plank.png",
                question: "ท่านมีอาการเจ็บ ปวด ชา ร้าว ระหว่างทำหรือไม่ ?",
                questionId: 4,
                questionPage: 3,
                questionType: "a"),
            ScreeningPartThreePostureModel(
                title: "หลังส่วนล่าง",
                postureName: "ท่างอลำตัวมาด้านหน้า",
                assetPath: "lib/assets/images/screeningPart/back_turtle.png",
                question: "ท่านมีอาการเจ็บ ปวด ชา ร้าว ระหว่างทำหรือไม่ ?",
                questionId: 4,
                questionPage: 4,
                questionType: "a"),
          ];
  @override
  String toString() {
    return 'ScreeningPartThreePostureModel{title: $title, PostureName: $postureName, question: $question, assetPath: $assetPath, questionId: $questionId, questionPage: $questionPage}';
  }
}

class ScreeningPartThreeQuestionModel {
  List<String> title;
  String question;
  int questionId;
  int questionPage;
  String questionType;

  ScreeningPartThreeQuestionModel({
    required this.title,
    required this.question,
    required this.questionId,
    required this.questionPage,
    required this.questionType,
  });
  static List<ScreeningPartThreeQuestionModel>
      getScreeningPartThreeQuestionModel() => [
            ScreeningPartThreeQuestionModel(
                title: ["คอ", "บ่า", "หลังส่วนล่าง"],
                question: "คุณมีอาการปวดบริเวณนี้มาก่อนหรือไม่ ?",
                questionId: 1,
                questionPage: 1,
                questionType: "a"),
            ScreeningPartThreeQuestionModel(
                title: ["คอ", "บ่า", "หลังส่วนล่าง"],
                question:
                    "หลังจากทำท่าทางดังกล่าว ท่านมีอาการเจ็บปวดคงอยู่จนถึงตอนนี้หรือไม่ ?",
                questionId: 2,
                questionPage: 1,
                questionType: "a"),
            ScreeningPartThreeQuestionModel(
                title: ["คอ", "บ่า", "หลังส่วนล่าง"],
                question:
                    "ท่านมีอาการชา และ/หรืออาการปวดร้าวไปยังบริเวณอื่น อาทิเช่น ปวดร้าวลงแขนหรือไม่ ?",
                questionId: 3,
                questionPage: 1,
                questionType: "a"),
            ScreeningPartThreeQuestionModel(
                title: ["คอ", "บ่า", "หลังส่วนล่าง"],
                question:
                    "หลังจากทำท่าทางดังกล่าว ท่านมีอาการปวด/ตึงเกิดขึ้น แต่อาการลดลงหรือหายไปเมื่อหยุดพักใช่หรือไม่?",
                questionId: 4,
                questionPage: 1,
                questionType: "a"),
            ScreeningPartThreeQuestionModel(
                title: ["คอ", "บ่า", "หลังส่วนล่าง"],
                question:
                    "หลังจากทำท่าทางดังกล่าว ท่านมีอาการเวียนหัวเวียนหน้าใช่หรือไม่ ?",
                questionId: 5,
                questionPage: 1,
                questionType: "a"),
          ];
  @override
  String toString() {
    return 'ScreeningPartThreeQuestionModel{question: $question, questionId: $questionId, questionPage: $questionPage}';
  }
}

//composite class
class ScreeningPartThreeModel {
  List<ScreeningPartThreeQuestionModel> questions;
  List<ScreeningPartThreePostureModel> postures;

  ScreeningPartThreeModel({
    required this.questions,
    required this.postures,
  });

  @override
  String toString() {
    return ", $questions, $postures";
  }
}

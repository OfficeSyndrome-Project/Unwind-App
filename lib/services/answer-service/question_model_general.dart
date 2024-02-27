class QuestionModelGeneral {
  final String question;
  final int questionId;
  final int questionPage;
  final String? area;
  final String? areaThai;
  final String? questionType;
  final int? questionPart;
  final String? painTypeAssetPath;
  final String? questionSpecificAssetPath;
  final String? questionSpecificAssetName;

  QuestionModelGeneral({
    required this.question,
    required this.questionId,
    required this.questionPage,
    this.area,
    this.areaThai,
    this.questionType,
    this.questionPart,
    this.painTypeAssetPath,
    this.questionSpecificAssetPath,
    this.questionSpecificAssetName,
  });

  @override
  String toString() =>
      'QuestionModelGeneral{question: $question, questionId: $questionId, questionPage: $questionPage, questionType: $questionType, questionPart: $questionPart, assetPath: $painTypeAssetPath}';
}

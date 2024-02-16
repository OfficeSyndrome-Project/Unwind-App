class BreakPostModel {
  List<String> listPath;
  int idPosture;

  BreakPostModel({
    required this.listPath,
    required this.idPosture,
  });

  static List<BreakPostModel> getPosture() {
    List<BreakPostModel> postures = [];

    postures.add(BreakPostModel(
      listPath: [
        "lib/assets/images/break-post/arm-posture/TP-left/TP-1.png",
        "lib/assets/images/break-post/arm-posture/TP-left/TP-2.png",
        "lib/assets/images/break-post/arm-posture/TP-left/TP-3.png",
        "lib/assets/images/break-post/arm-posture/TP-left/TP-4.png",
        "lib/assets/images/break-post/arm-posture/TP-left/TP-5.png",
      ],
      idPosture: 1,
    ));
    postures.add(BreakPostModel(
      listPath: [
        "lib/assets/images/break-post/arm-posture/TP-right/TP-1.png",
        "lib/assets/images/break-post/arm-posture/TP-right/TP-2.png",
        "lib/assets/images/break-post/arm-posture/TP-right/TP-3.png",
        "lib/assets/images/break-post/arm-posture/TP-right/TP-4.png",
        "lib/assets/images/break-post/arm-posture/TP-right/TP-5.png",
      ],
      idPosture: 2,
    ));
    postures.add(BreakPostModel(
      listPath: [
        "lib/assets/images/break-post/leg-posture/1.png",
        "lib/assets/images/break-post/leg-posture/2.png",
        "lib/assets/images/break-post/leg-posture/3.png",
        "lib/assets/images/break-post/leg-posture/4.png",
        "lib/assets/images/break-post/leg-posture/5.png",
      ],
      idPosture: 3,
    ));
    postures.add(BreakPostModel(
      listPath: [
        "lib/assets/images/break-post/neck-posture/TP-left/TP-1.png",
        "lib/assets/images/break-post/neck-posture/TP-left/TP-2.png",
        "lib/assets/images/break-post/neck-posture/TP-left/TP-3.png",
        "lib/assets/images/break-post/neck-posture/TP-left/TP-4.png",
        "lib/assets/images/break-post/neck-posture/TP-left/TP-5.png",
        "lib/assets/images/break-post/neck-posture/TP-left/TP-6.png",
        "lib/assets/images/break-post/neck-posture/TP-left/TP-7.png",
        "lib/assets/images/break-post/neck-posture/TP-left/TP-8.png",
        "lib/assets/images/break-post/neck-posture/TP-left/TP-9.png",
      ],
      idPosture: 4,
    ));
    postures.add(BreakPostModel(
      listPath: [
        "lib/assets/images/break-post/neck-posture/TP-right/TP-1.png",
        "lib/assets/images/break-post/neck-posture/TP-right/TP-2.png",
        "lib/assets/images/break-post/neck-posture/TP-right/TP-3.png",
        "lib/assets/images/break-post/neck-posture/TP-right/TP-4.png",
        "lib/assets/images/break-post/neck-posture/TP-right/TP-5.png",
        "lib/assets/images/break-post/neck-posture/TP-right/TP-6.png",
        "lib/assets/images/break-post/neck-posture/TP-right/TP-7.png",
        "lib/assets/images/break-post/neck-posture/TP-right/TP-8.png",
        "lib/assets/images/break-post/neck-posture/TP-right/TP-9.png",
      ],
      idPosture: 5,
    ));
    postures.add(BreakPostModel(
      listPath: [
        "lib/assets/images/break-post/shoulder-posture/TP-1.png",
        "lib/assets/images/break-post/shoulder-posture/TP-2.png",
        "lib/assets/images/break-post/shoulder-posture/TP-3.png",
      ],
      idPosture: 6,
    ));

    return postures;
  }
}

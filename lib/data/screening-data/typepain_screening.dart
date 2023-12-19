class TypePainScreening {
  final String assetPath;
  final String type;
  final int idType;

  TypePainScreening({
    required this.assetPath,
    required this.type,
    required this.idType,
  });

  static List<TypePainScreening> getData() {
    List<TypePainScreening> typelist = [];

    typelist.add(TypePainScreening(
      idType: 1,
      assetPath: 'lib/assets/images/screeningPart/select_pain_1.png',
      type: 'คอ',
    ));
    typelist.add(TypePainScreening(
      idType: 2,
      assetPath: 'lib/assets/images/screeningPart/select_pain_2.png',
      type: 'บ่า',
    ));

    typelist.add(TypePainScreening(
      idType: 3,
      assetPath: 'lib/assets/images/screeningPart/select_pain_3.png',
      type: 'ไหล่',
    ));

    typelist.add(TypePainScreening(
      idType: 4,
      assetPath: 'lib/assets/images/screeningPart/select_pain_4.png',
      type: 'หลังส่วนบน',
    ));

    typelist.add(TypePainScreening(
      idType: 5,
      assetPath: 'lib/assets/images/screeningPart/select_pain_5.png',
      type: 'หลังส่วนล่าง',
    ));

    return typelist;
  }
}

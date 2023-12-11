//time data model state

class BreakStates {
  String? breaktimes;

  BreakStates({
    this.breaktimes,
  });

  void setBreakTimes(String getBreakTime) {
    breaktimes = getBreakTime;
  }

  String getBreakTime() {
    return breaktimes!;
  }
}

List<BreakStates> allBreakStates() {
  List<BreakStates> breakstates = [];
  BreakStates breakstatesModel = BreakStates();

  //1
  breakstatesModel.setBreakTimes("15");
  breakstates.add(breakstatesModel);
  breakstatesModel = BreakStates();

  //2
  breakstatesModel.setBreakTimes("20");
  breakstates.add(breakstatesModel);
  breakstatesModel = BreakStates();

  //3
  breakstatesModel.setBreakTimes("25");
  breakstates.add(breakstatesModel);
  breakstatesModel = BreakStates();

  //4
  breakstatesModel.setBreakTimes("30");
  breakstates.add(breakstatesModel);
  breakstatesModel = BreakStates();

  //5
  breakstatesModel.setBreakTimes("35");
  breakstates.add(breakstatesModel);
  breakstatesModel = BreakStates();

  //6
  breakstatesModel.setBreakTimes("40");
  breakstates.add(breakstatesModel);
  breakstatesModel = BreakStates();

  //7
  breakstatesModel.setBreakTimes("45");
  breakstates.add(breakstatesModel);
  breakstatesModel = BreakStates();

  //8
  breakstatesModel.setBreakTimes("50");
  breakstates.add(breakstatesModel);
  breakstatesModel = BreakStates();

  //9
  breakstatesModel.setBreakTimes("55");
  breakstates.add(breakstatesModel);
  breakstatesModel = BreakStates();

  //10
  breakstatesModel.setBreakTimes("60");
  breakstates.add(breakstatesModel);
  breakstatesModel = BreakStates();

  return breakstates;
}

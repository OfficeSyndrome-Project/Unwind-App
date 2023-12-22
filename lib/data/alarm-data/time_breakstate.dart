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
  breakstatesModel.setBreakTimes("5");
  breakstates.add(breakstatesModel);
  breakstatesModel = BreakStates();

  //2
  breakstatesModel.setBreakTimes("10");
  breakstates.add(breakstatesModel);
  breakstatesModel = BreakStates();

  //3
  breakstatesModel.setBreakTimes("15");
  breakstates.add(breakstatesModel);
  breakstatesModel = BreakStates();

  //4
  breakstatesModel.setBreakTimes("20");
  breakstates.add(breakstatesModel);
  breakstatesModel = BreakStates();

  //5
  breakstatesModel.setBreakTimes("25");
  breakstates.add(breakstatesModel);
  breakstatesModel = BreakStates();

  //6
  breakstatesModel.setBreakTimes("30");
  breakstates.add(breakstatesModel);
  breakstatesModel = BreakStates();

  return breakstates;
}

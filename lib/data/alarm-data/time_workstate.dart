//time data model state

class WorkStates {
  String? worktimes;

  WorkStates({
    this.worktimes,
  });

  void setWorkTimes(String getWorkTime) {
    worktimes = getWorkTime;
  }

  String getWorkTime() {
    return worktimes!;
  }
}

List<WorkStates> allWorkStates() {
  List<WorkStates> workstates = [];
  WorkStates workstatesModel = WorkStates();

  //1
  workstatesModel.setWorkTimes("15");
  workstates.add(workstatesModel);
  workstatesModel = WorkStates();

  //2
  workstatesModel.setWorkTimes("20");
  workstates.add(workstatesModel);
  workstatesModel = WorkStates();

  //3
  workstatesModel.setWorkTimes("25");
  workstates.add(workstatesModel);
  workstatesModel = WorkStates();

  //4
  workstatesModel.setWorkTimes("30");
  workstates.add(workstatesModel);
  workstatesModel = WorkStates();

  //5
  workstatesModel.setWorkTimes("35");
  workstates.add(workstatesModel);
  workstatesModel = WorkStates();

  //6
  workstatesModel.setWorkTimes("40");
  workstates.add(workstatesModel);
  workstatesModel = WorkStates();

  //7
  workstatesModel.setWorkTimes("45");
  workstates.add(workstatesModel);
  workstatesModel = WorkStates();

  //8
  workstatesModel.setWorkTimes("50");
  workstates.add(workstatesModel);
  workstatesModel = WorkStates();

  //9
  workstatesModel.setWorkTimes("55");
  workstates.add(workstatesModel);
  workstatesModel = WorkStates();

  //10
  workstatesModel.setWorkTimes("60");
  workstates.add(workstatesModel);
  workstatesModel = WorkStates();

  return workstates;
}

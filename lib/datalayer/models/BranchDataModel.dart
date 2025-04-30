class BranchDataModel {
  BranchDataModel({this.branchId, this.branchName, this.routingNo});

  BranchDataModel.fromJson(dynamic json) {
    branchId = json['branch_id'];
    branchName = json['branch_name'];
    routingNo = json['routing_no'];
  }
  String? branchId;
  String? branchName;
  dynamic routingNo;
}

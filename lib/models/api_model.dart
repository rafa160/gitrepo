class ApiModel {
  Map<String, dynamic> data;
  List<dynamic> dataList;
  bool success;
  List<String> errors;

  ApiModel({this.success, this.errors});

  ApiModel.fromJson(Map<String, dynamic> json) {
    _filterType(json);
    success = json['success'];
    errors = json['errors'];
  }
  ApiModel.fromJsonDynamic(List<dynamic> json) {
    dataList = json;
  }

  _filterType(Map<String, dynamic> json) {
    if (json['data'] is List<dynamic>) {
      dataList = json['data'];
    } else {
      data = json;
    }
  }

  Future<ApiModel> fromJsonAsync(Map<String, dynamic> json) async {
    _filterType(json);
    var lst = await _returnErrorsListAsync(json);
    return ApiModel(success: json['success'], errors: lst);
  }

  Future<List<String>> _returnErrorsListAsync(Map<String, dynamic> json) async {
    var externalList = json['errors'] as List;
    var currentErrors = <String>[];

    await Future.forEach(externalList, (item) async {
      currentErrors.add(item);
    });

    return currentErrors;
  }
}
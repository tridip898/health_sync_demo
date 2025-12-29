class MetaModel {
  int? total;
  int? count;
  int? page;
  int? limit;
  int? totalPages;

  MetaModel({this.total, this.count, this.page, this.limit, this.totalPages});

  MetaModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    page = json['page'];
    limit = json['limit'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['count'] = count;
    data['page'] = page;
    data['limit'] = limit;
    data['totalPages'] = totalPages;
    return data;
  }
}

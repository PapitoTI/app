class TimelineModel {
  String local;
  String img;
  String time;

  TimelineModel(this.local, this.img, this.time);
}

List<TimelineModel> timeline = timelineDB
    .map((item) => TimelineModel(item['local'], item['img'], item['time']))
    .toList();

var timelineDB = [
  {
    "local": "São Paulo",
    "img":
        "http://naturam.com.br/wp-content/uploads/2019/10/bertioga-destacada.jpg",
    "time": "1:30"
  },
  {
    "local": "Rio de Janeiro, RJ",
    "img":
        "https://images.unsplash.com/photo-1483729558449-99ef09a8c325?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
    "time": "1:30"
  },
  {
    "local": "Salvador, BH",
    "img":
        "https://images.unsplash.com/photo-1574003976847-b25af2a95833?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80",
    "time": "1:30"
  },
];

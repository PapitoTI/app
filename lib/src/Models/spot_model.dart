class SpotModel {
  String name;
  String address;
  String category;
  String description;
  List<String> spotImagesList;
  SpotModel(this.name, this.address, this.category, this.description,
      this.spotImagesList);

  SpotModel clone() => SpotModel(this.name, this.address, this.category,
      this.description, this.spotImagesList.toList());
}

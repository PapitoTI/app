class Destiny {
  final String name;
  final String image;
  final String description;

  const Destiny(this.name, this.image, this.description);

  Destiny.from(Destiny d)
      : name = d.name,
        image = d.image,
        description = d.description;
}

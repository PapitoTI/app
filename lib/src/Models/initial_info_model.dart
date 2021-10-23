class InitialPageInfo {
  final String imageAsset;
  final String title;
  final String descri;

  InitialPageInfo(this.imageAsset, this.title, this.descri);

  InitialPageInfo.from(InitialPageInfo i)
      : imageAsset = i.imageAsset,
        title = i.title,
        descri = i.descri;
}

class SubwayArrival {
  final int _rowNum;
  final String _subwayId;
  final String _trainLineNm;
  final String _subwayHeading;
  final String _arvlMsg2;

  SubwayArrival(
      this._rowNum,
      this._subwayId,
      this._trainLineNm,
      this._subwayHeading,
      this._arvlMsg2
  );

  String get arvlMsg2 => _arvlMsg2;
  String get subwayHeading => _subwayHeading;
  String get trainLineNm => _trainLineNm;
  String get subwayId => _subwayId;
  int get rowNum => _rowNum;
}
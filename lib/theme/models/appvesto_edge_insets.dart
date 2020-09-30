import 'package:flutter/painting.dart';
import 'package:my_catalog/theme/interfaces/i_appvesto_edge_insets.dart';

class AVEdgeInsets implements IAVEdgeInsets {
  @override
  EdgeInsets primaryEdgeInsets;

  AVEdgeInsets({
    this.primaryEdgeInsets,
  });
}
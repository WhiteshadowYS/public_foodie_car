import 'package:base_project_template/data/theme/interfaces/i_appvesto_edge_insets.dart';
import 'package:flutter/painting.dart';

class AVEdgeInsets implements IAVEdgeInsets {
  @override
  EdgeInsets primaryEdgeInsets;

  AVEdgeInsets({
    this.primaryEdgeInsets,
  });
}

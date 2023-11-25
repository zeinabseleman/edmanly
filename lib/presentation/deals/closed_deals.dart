import 'package:edmanly/core/extensions/string_ext.dart';
import 'package:edmanly/presentation/deals/selected_deal.dart';
import 'package:edmanly/presentation/deals/widgets/deals_item.dart';
import 'package:flutter/material.dart';

import '../shared_widgets/screen_main_widget.dart';

class ClosedDeals extends StatelessWidget {
  const ClosedDeals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenMainWidget(
        title: 'closed_deals'.tr,
        child:  Column(
          children: List.generate(
              5,
                  (index) =>  DealsItem(name: 'السباكة',
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const SelectedDeal(
                        title: 'السباكة',
                        isClosed: true,
                      )
                  ));
                },
              )
          ),
        )

    );
  }
}

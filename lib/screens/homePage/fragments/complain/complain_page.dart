import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_wigets/form_header.dart';
import '../../../../common_wigets/list_header.dart';
import '../../../../common_wigets/list_item.dart';
import '../../../../common_wigets/my_text_field.dart';
import '../../../../datalayer/dataProviders/dio_interceptor.dart';
import '../../../../datalayer/dataProviders/dio_service.dart';
import '../../../../utils/Utils.dart';
import '../../../../utils/app_constent.dart';
import 'complain_controller.dart';

class ComplainScreen extends StatelessWidget {
  static const routeName = '/complain_screen';

  ComplainController _controller = Get.put(
    ComplainController(DioService(dioInterceptor: DioInterceptor())),
  );
  @override
  Widget build(BuildContext context) {
    _controller.getRecentData();
    return Container(
      // alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      // decoration: BoxDecoration(F
      //     color: AppConstant.textColorMain(),
      //     borderRadius: const BorderRadius.all(Radius.circular(10))),
      width: MediaQuery.of(context).size.width,

      height: Get.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              width: Get.size.width,
              child: Form(
                key: _controller.ipoKey,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 10),
                    AppConstant.timerMarketPlace(context),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      alignment: Alignment.center,
                      height: 60,
                      // color: Colors.yellow,
                      child: Text(
                        "COMPLAIN/FEEDBACK REQUEST FORM".toUpperCase(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(height: 1, color: Colors.grey.withOpacity(0.2)),

                    FormHeader(title: "Complain"),
                    MyTextField(
                      isRequired: false,
                      editingController: _controller.complainTextController,
                      enableOrDisable: true,
                      hints: "Complain",
                      errorMessage: 'Complain required',
                      inputType: TextInputType.text,
                      onChangedCallback: (v) {},
                    ),

                    SizedBox(height: 10),

                    FormHeader(title: 'Select a file', required: false),
                    InkWell(
                      onTap: () {
                        _controller.openFilePicker();
                      },
                      child: MyTextField(
                        isRequired: false,
                        editingController: _controller.fileTextField,
                        enableOrDisable: false,
                        hints: 'Choose file',
                        errorMessage: 'Please select a file.',
                        inputType: TextInputType.text,
                      ),
                    ),

                    SizedBox(height: 10),

                    Utils.globalButton(
                      context,
                      "Submit",
                      () {
                        if (_controller.ipoKey.currentState!.validate()) {
                          _controller.submit();
                        }
                      },
                      MediaQuery.of(context).size.width / 2,
                      40,
                    ),

                    // Container(
                    //   margin: const EdgeInsets.only(left: 10),
                    //   alignment: Alignment.center,
                    //   height: 20,
                    // ),
                    SizedBox(height: 20),

                    //  Container(height: 3,color: Colors.grey.withOpacity(0.1),),
                    // _tableData(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            _tableData(context),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _tableData(BuildContext context) {
    var itemName = [
      '#',
      'Description',
      'Type',
      'Submission Date',
      'Status',
      // 'Total Amount',
      // 'Business Date',
      // 'Trade DateTime',
    ];

    var itemCount = 5.0;
    var itemSize = 120.0;
    var dividerSize = 7.0;
    var extraSize = 20.0;
    var listLength = 20;

    // container-> SingleChildScrollView -> Container -> Column -> IntrinsicHeight -> Container -> ListView

    return Container(
      // margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      padding: const EdgeInsets.only(left: 10, top: 3),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        // boxShadow: [AppConstant.myBoxShadow2()],
      ),
      // height: 35.0*listLength+80.0,
      // height: Get.size.height,
      // height: 500,
      // width: 500,
      width: itemSize * itemCount + dividerSize + extraSize,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 30,
            width: double.infinity,
            child: Text(
              'recent complain'.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SingleChildScrollView(
            controller: _controller.scrollController,
            scrollDirection: Axis.horizontal,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).hintColor,
                  width: 0.2,
                ),
              ),
              padding: EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text('Helldfsdfs dfsd'),
                  // String corner;
                  // String align;
                  // String title;
                  //   double size;
                  //   Callback callback;
                  Container(
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ListHeader(
                            height: 40,
                            corner: 'left',
                            color: Colors.black.withOpacity(0.2),
                            align: 'left',
                            title: itemName[0],
                            size: 60,
                            callback: () {
                              debugPrint('P: 1');
                            },
                            position: 1,
                          ),
                          // const VerticalDivider(
                          //   width: 1,
                          // ),
                          ListHeader(
                            height: 40,
                            corner: 'center',
                            color: Colors.black.withOpacity(0.2),
                            align: 'left',
                            title: itemName[1],
                            size: 200,
                            callback: () {
                              debugPrint('P: 1');
                            },
                            position: 1,
                          ),
                          // const VerticalDivider(
                          //   width: 1,
                          // ),
                          ListHeader(
                            height: 40,
                            corner: 'center',
                            color: Colors.black.withOpacity(0.2),
                            align: 'left',
                            title: itemName[2],
                            size: 120,
                            callback: () {
                              debugPrint('P: 1');
                            },
                            position: 2,
                          ),
                          // const VerticalDivider(
                          //   width: 1,
                          // ),
                          ListHeader(
                            height: 40,
                            corner: 'center',
                            color: Colors.black.withOpacity(0.2),
                            align: 'left',
                            title: itemName[3],
                            size: 120,
                            callback: () {
                              debugPrint('P: 1');
                            },
                            position: 3,
                          ),
                          // const VerticalDivider(
                          //   width: 1,
                          // ),
                          ListHeader(
                            height: 40,
                            corner: 'center',
                            color: Colors.black.withOpacity(0.2),
                            align: 'left',
                            title: itemName[4],
                            size: 120,
                            callback: () {
                              debugPrint('P: 1');
                            },
                            position: 4,
                          ),
                          // const VerticalDivider(
                          //   width: 1,
                          // ),
                          // ListHeader(
                          //   height: 40,
                          //   corner: 'center',
                          //   color: Colors.black.withOpacity(0.2),
                          //   align: 'center',
                          //   title: itemName[5],
                          //   size: 120,
                          //   callback: () {
                          //     debugPrint('P: 1');
                          //   },
                          //   position: 5,
                          // ),
                          // const VerticalDivider(
                          //   width: 1,
                          // ),
                          // ListHeader(
                          //   height: 40,
                          //   corner: 'center',
                          //   color: Colors.black.withOpacity(0.2),
                          //   align: 'center',
                          //   title: itemName[6],
                          //   size: 120,
                          //   callback: () {
                          //     debugPrint('P: 1');
                          //   },
                          //   position: 6,
                          // ),
                          // const VerticalDivider(
                          //   width: 1,
                          // ),
                          // ListHeader(
                          //   height: 40,
                          //   corner: 'center',
                          //   color: Colors.black.withOpacity(0.2),
                          //   align: 'center',
                          //   title: itemName[7],
                          //   size: 120,
                          //   callback: () {
                          //     debugPrint('P: 1');
                          //   },
                          //   position: 6,
                          // ),
                          // const VerticalDivider(
                          //   width: 1,
                          // ),
                          // ListHeader(
                          //   height: 40,
                          //   corner: 'center',
                          //   color: Colors.black.withOpacity(0.2),
                          //   align: 'center',
                          //   title: itemName[8],
                          //   size: 120,
                          //   callback: () {
                          //     debugPrint('P: 1');
                          //   },
                          //   position: 6,
                          // ),
                        ],
                      ),
                    ),
                  ),
                  // const Divider(
                  //   height: 1,
                  // ),
                  IntrinsicHeight(
                    child: Obx(
                      () => Container(
                        height: 310,
                        width: itemSize * itemCount + dividerSize + extraSize,
                        child: ListView.separated(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _controller.recentIPo.length,
                          itemBuilder: (context, index) {
                            var dd = _controller.recentIPo[index];
                            return IntrinsicHeight(
                              child: Row(
                                children: [
                                  ListItem(
                                    corner: 'center',
                                    align: 'left',
                                    title: '${index + 1}',
                                    size: 60,
                                    callback: () {
                                      debugPrint('P: 1');
                                    },
                                    position: 1,
                                  ),
                                  // Container(
                                  //   width: 1,
                                  //   color: Colors.white,
                                  // ),
                                  ListItem(
                                    corner: 'center',
                                    align: 'left',
                                    title: dd.requestMessage ?? '',
                                    size: 200,
                                    callback: () {
                                      debugPrint('P: 1');
                                    },
                                    position: 1,
                                  ),
                                  // Container(
                                  //   width: 1,
                                  //   color: Colors.white,
                                  // ),
                                  ListItem(
                                    corner: 'center',
                                    align: 'left',
                                    title: dd.requestType ?? '',
                                    size: 120,
                                    callback: () {
                                      debugPrint('P: 1');
                                    },
                                    position: 1,
                                  ),
                                  // ListItem(
                                  //   corner: 'center',
                                  //   align: 'center',
                                  //   title: dd.status??'',
                                  //   size: 120,
                                  //   callback: () {
                                  //     debugPrint('P: 1');
                                  //   },
                                  //   position: 1,
                                  // ),
                                  //
                                  // // ListItem(corner: 'center', align: 'center', title: AppConstant.singleValueFormat('0'), size: 120, callback: (){debugPrint('P: 1');}, position: 3,),
                                  // Container(
                                  //   width: 1,
                                  //   color: Colors.white,
                                  // ),

                                  // <td class="text-right d-block">{{ ( '' == $account->portfolioStatement ) ? '0' : number_format( floor( (float) $account->portfolioStatement->AVERAGE_BUY_PRICE * $account->unit ), 0, '', ',') }}</td>

                                  //_controller.getInvestmentCost(_controller.investmentSummaryData.value.accountSummary![index].portfolioStatement!=null?'0':'0')),
                                  ListItem(
                                    corner: 'center',
                                    align: 'left',
                                    title: dd.businessDate ?? '',
                                    size: 120,
                                    callback: () {
                                      debugPrint('P: 1');
                                    },
                                    position: 1,
                                  ),

                                  // ListItem(corner: 'center', align: 'center', title: AppConstant.singleValueFormat(_controller.investmentSummaryData.value.data?.portfolioStatement?[index].totalInvestmentAtCost??'0'), size: 120, callback: (){debugPrint('P: 1');}, position: 3,),

                                  // ListItem(corner: 'center', align: 'center', title: AppConstant.singleValueFormat(_controller.investmentSummaryData.value.data?.portfolioStatement?[index].totalInvestmentAtCost==null?'0':_controller.getInvestmentCost(_controller.investmentSummaryData.value.accountSummary![index].portfolioStatement?.averagebuyprice??'0', _controller.investmentSummaryData.value.accountSummary![index].unit??'0')), size: 120, callback: (){debugPrint('P: 1');}, position: 4,),
                                  // Container(
                                  //   width: 1,
                                  //   color: Colors.white,
                                  // ),
                                  ListItem(
                                    corner: 'center',
                                    align: 'left',
                                    title: dd.status ?? '',
                                    size: 120,
                                    callback: () {
                                      debugPrint('P: 1');
                                    },
                                    position: 1,
                                  ),

                                  // ListItem(corner: 'center', align: 'center', title: AppConstant.singleValueFormat(_controller.investmentSummaryData.value.data?.portfolioStatement?[index].unrealizeGain??'0'), size: 120, callback: (){debugPrint('P: 1');}, position: 3,),

                                  // <td class="text-right d-block">{{ ( '' == $account->portfolioStatement ) ? '0' : number_format( floor($account->portfolioStatement->CURRENT_MARKET_VALUE), 0, '', ',') }}</td>
                                  //_controller.getInvestmentCost(_controller.investmentSummaryData.value.accountSummary![index].portfolioStatement?.averagebuyprice??'0', _controller.investmentSummaryData.value.accountSummary![index].unit??'0')
                                  // Container(
                                  //   width: 1,
                                  //   color: Colors.white,
                                  // ),
                                  // ListItem(
                                  //   corner: 'center',
                                  //   align: 'center',
                                  //   title: dd.requestDate??'',
                                  //   size: 120,
                                  //   callback: () {
                                  //     debugPrint('P: 1');
                                  //   },
                                  //   position: 1,
                                  // ),
                                  // Container(
                                  //   width: 1,
                                  //   color: Colors.white,
                                  // ),
                                  // ListItem(
                                  //   corner: 'center',
                                  //   align: 'center',
                                  //   title: dd.businessDate??'',
                                  //   size: 120,
                                  //   callback: () {
                                  //     debugPrint('P: 1');
                                  //   },
                                  //   position: 1,
                                  // ),
                                  // Container(
                                  //   width: 1,
                                  //   color: Colors.white,
                                  // ),
                                  // ListItem(
                                  //   corner: 'center',
                                  //   align: 'center',
                                  //   title: dd.requestDate??'',
                                  //   size: 120,
                                  //   callback: () {
                                  //     debugPrint('P: 1');
                                  //   },
                                  //   position: 1,
                                  // ),

                                  // ListItem(corner: 'center', align: 'center', title: AppConstant.singleValueFormat(_controller.investmentSummaryData.value.data?.portfolioStatement?[index].unrealizeGainPercentage??'0'), size: 120, callback: (){debugPrint('P: 1');}, position: 3,),

                                  // <td class="text-right d-block">{{ ( '' == $account->portfolioStatement ) ? '' : ( $account->dividendIncome < 0 ) ? '(' . number_format( $account->dividendIncome, 0, '', ',' ) . ')' : number_format( $account->dividendIncome, 0, '', ',' ) }}</td>
                                ],
                              ),
                            );
                          },
                          separatorBuilder:
                              (BuildContext context, int index) => Container(
                                height: 0.2,
                                color: Theme.of(context).hintColor,
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

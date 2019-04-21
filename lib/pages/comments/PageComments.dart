import 'package:flutter/material.dart';
import 'package:flutter_travel/common/CommonNavigator.dart';
import 'package:flutter_travel/pages/comments/PageCommentsVO.dart';

/// 留言区
class PageComments extends StatefulWidget {
  @override
  _PageCommentsState createState() => _PageCommentsState();
}

class _PageCommentsState extends State<PageComments> with CommonNavigator {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: this.getAppBar(context, 'Messages'),
        body: ListView(
          children: <Widget>[
            // 蓝色图片区
            this.buildBlueImageArea(),
            // 留言列表
            this.buildCommentListArear()
          ],
        ));
  }

  /// 蓝色图片区
  Widget buildBlueImageArea() {
    return Container(
      width: MediaQuery.of(this.context).size.width,
      height: 180.0,
      decoration:
          BoxDecoration(color: Color(0xFF108aee), shape: BoxShape.rectangle),
      child: Padding(
        padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 0.0),
        child: Column(
		  crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
			  Text('CUSTOMER', style: TextStyle(color: Color(0xFFa2d1f8), fontSize: 10.0)),
			  SizedBox(height: 10.0),
			  Text('Eric Hoffman', style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold)),
			  SizedBox(height: 10.0),
			  Row(
				  children: <Widget>[
					  CircleAvatar(
						  backgroundImage: AssetImage('assets/chris.jpg'),
						  radius: 16.0,
					  ),
					  SizedBox(width: 12.0),
			  		  Text('Sure thing!', style: TextStyle(color: Color(0xFFc5e2fa), fontSize: 13.0)),
					  Icon(Icons.favorite_border, color: Color(0xFFa2d1f8), size: 15.0,)
				  ],
			  ),
			  SizedBox(height: 27.0),
			  Row(
				  children: <Widget>[
					  Text('Henry, Bryce, Eric, Berin, +3', style: TextStyle(color: Color(0xFF90c8f7), fontSize: 12.0)),
				  	  Spacer(),
					  Text('7:32 am', style: TextStyle(color: Color(0xFF90c8f7), fontSize: 12.0)),
				  ],
			  ),
			],
        ),
      ),
    );
  }

  /// 留言列表`
  Widget buildCommentListArear() {
	// 使用测试数据
	List<PageCommentsVO> commentsListData = new PageCommentsVO().getTestData();
	List<Widget> commentList = [];

	for (PageCommentsVO item in commentsListData) {
		commentList.add(
			Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					// 副标题
					this.getSubTitle(item),

					// 标题
					this.getTitle(item),

					// 描述文本
					this.getDescriptionArea(item),

					// 图片区
					this.getThumbilsArea(item),

					// 留言数量区
					this.getCommentsNumArea(item),
				],
			)
		);
	}

    return Column(
		children: commentList,
	);
  }

  /// 标题
  Widget getTitle(PageCommentsVO item) {
	  return Padding(
		  padding: EdgeInsets.fromLTRB(26.0, 5.0, 26.0, 0.0),
		  child: Container(
			  width: MediaQuery.of(this.context).size.width - 80.0,
			  child: Text(item.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
		  )
	  );
  }

  /// 副标题
  Widget getSubTitle(PageCommentsVO item) {
	  return Padding(
		  padding: EdgeInsets.fromLTRB(26.0, 20.0, 26.0, 0.0),
		  child: Row(
			  children: <Widget>[
				  Text(item.postTitle, style: TextStyle(color: Color(0xFFaeb2bc), fontSize: 10)),
				  Spacer(),
				  this.getSubTitleNum(item.postTitleNum)
			  ],
		  ),
	  );
  }

  /// 子标题数量
  ///  * [int postTitleNum] 显示数字
  Widget getSubTitleNum(int postTitleNum) {
	  Color backgroundColor;
	  Color fontColor;

	  if (postTitleNum > 0) {
		backgroundColor = Color(0xFFffe0b9);
		fontColor = Color(0xFFe99934);
	  }

	  if (postTitleNum > 5) {
		backgroundColor = Color(0xFFffea59);
		fontColor = Color(0xFFd3b733);
	  }

	  return postTitleNum > 0 ? Container(
		width: 22.0,
		height: 22.0,
		decoration: BoxDecoration(
			color: backgroundColor,
			shape: BoxShape.rectangle,
			borderRadius: BorderRadius.circular(3.0)
		),
		child: Center(
			child: Text(
				postTitleNum.toString(),
				style: TextStyle(
					color: fontColor,
					fontSize: 12,
					fontWeight: FontWeight.bold
				)
			)
		),
	 ) : Container();
  }

  /// 描述文本
  Widget getDescriptionArea(PageCommentsVO item) {
	  return Padding(
		  padding: EdgeInsets.fromLTRB(26.0, 5.0, 26.0, 0.0),
		  child: Container(
			  width: MediaQuery.of(this.context).size.width - 50.0,
			  child: Text(
				  item.description,
				  maxLines: 8,
				  overflow: TextOverflow.ellipsis,
				  style: TextStyle(
					  color: Color(0xFF808d9a),
					  fontSize: 12,
					  fontWeight: FontWeight.normal
					)
				),
		  )
	  );
  }

  /// 图片区
  Widget getThumbilsArea(PageCommentsVO item) {
	  List<Widget> thumbilsList = [];
	  for (String itemUrl in item.commentsImageList) {
		thumbilsList.add(
			Container(
				width: 120.0,
				height: 80.0,
				margin: EdgeInsets.only(right: 5.0),
				decoration: BoxDecoration(
					image: DecorationImage(
						image: AssetImage(itemUrl),
						fit: BoxFit.cover
					),
					borderRadius: BorderRadius.circular(5.0)
				),
			)
		);
	  }

	  return item.commentsImageList.length > 0 ?
		Container(
			margin: EdgeInsets.fromLTRB(26.0, 10.0, 0.0, 0.0),
			width: MediaQuery.of(this.context).size.width,
			height: 80,
			child: ListView(
				padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
				scrollDirection: Axis.horizontal,
				children: thumbilsList,
			),
		) :
		Container();
  }

  /// 留言数量区
  Widget getCommentsNumArea(PageCommentsVO item) {
	  return Container();
  }
}

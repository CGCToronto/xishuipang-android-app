import 'package:flutter/material.dart';
import 'package:xishuipang_android/Modal_Service/Article.dart';
import 'package:share/share.dart';
import 'package:flutter/foundation.dart';

class shareButton extends StatelessWidget {
  final Article as;

  shareButton(this.as);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.share),
      tooltip: '分享',
      onPressed: () {
        /* ... */
        final RenderBox box = context.findRenderObject();
        Share.share(
            '我在阅读溪水旁第' +
                as.volume_number +
                '期\n'
                '主题:' +
                as.category +
                '\n文章：《' +
                as.title +
                '》\n作者:' +
                as.author +
                '\n'
                '你可以登入AppStore或者PlayStore搜索\"溪水旁\"下载手机客户端\n'
                '或者登入网页：\nhttp://www.xishuipang.com/article?volume=' +
                as.volume_number +
                '&articleId=' +
                as.article_id +
                '进行阅读，\n'
                '溪水旁开发小组：谢谢您的支持，\n'
                    '耶和华你的神必与你同在。',
            sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
      },
    );
  }
}

# 笔记

### 启动

```bash
flutter run -d chrome //谷歌浏览器
hover run //window
hover run build
```

## 加载图片

1、在pubspec.yaml中的flutter部分添加如下内容

```yaml
assets:    - images/avatar.png
```

2、flutter 加载本地资源

```dart
new Image.asset("assets/images/wechat.png")
// or
new Image(
  image: new AssetImage("assets/images/wechat.png"),
),
```

3、加载网络图片

```dart
new Image.network(
    model.coverImgUrl,
    fit: BoxFit.cover,
)
```

4、fit设置模式

```
fill：会拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形。

cover：会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁。

contain：这是图片的默认适应规则，图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形。

fitWidth：图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。

fitHeight：图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。

none：图片没有适应策略，会在显示空间内显示图片，如果图片比显示空间大，则显示空间只会显示图片中间部分。
```

5、如何将加载的过得图片缓存到内存和本地（cached_network_image 缓存网络图片框架）

```yaml
dependencies:
  cached_network_image: ^1.1.3
```

封装的图片工具类

```dart
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class ImageUils {
  //获取图片AssetImage
  static ImageProvider getAssetImage(String name, {String format: 'png'}) {
    return AssetImage(getImgPath(name, format: format));
  }

  //获取本地图片路径
  static String getImgPath(String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
  }

  //缓存图片，利用CachedNetworkImageProvider，这个框架在加载图片的时候
  //会把图片缓存到本地，如果imageUrl是空的，那么就加载默认占位图
  static ImageProvider getImageProvider(String imageUrl,
      {String holderImg: "none"}) {
    if (TextUtil.isEmpty(imageUrl)) {
      return AssetImage(getImgPath(holderImg));
    }
    return CachedNetworkImageProvider(imageUrl);
  }
  
}
```

## 文本输入

1、使用TextField，类似web 上的Input

```dart
new TextField(
    decoration: const InputDecoration(
        hintText: '用户名/密码',
        contentPadding: const EdgeInsets.all(10.0),
    ),
    // 当 value 改变的时候，触发
    onChanged: (val) {
        print(val);
    }
),
```

2、TextField 有以下常用属性

```
autocorrect: bool - 是否启用自动更正。
autofocus: bool - 是否是自动获取焦点。
controller: TextEditingController - 控制正在编辑的文本。
decoration: InputDecoration - TextField 的外形描述。
enabled: bool - 是否禁用。
focusNode: FocusNode - 是否具有键盘焦点。
inputFormatters: List<textinputformatter style="-webkit-font-smoothing: antialiased; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-size-adjust: none; box-sizing: border-box;"></textinputformatter> - 可选的，输入验证和格式化。
keyboardType: TextInputType - 用于编辑文本的键盘类型。
maxLength: int - 文本最大的字符串长度。
maxLengthEnforced: bool - 如果为true，则防止字段允许超过 maxLength 字符。
maxLines: int - 文本最大行数，默认为 1。多行时应该设置为 > 1。
obscureText: bool - 是否是隐藏文本（密码形式）。
onChanged: ValueChanged - 当 value 改变时触发。
onSubmitted: ValueChanged - 当用户点击键盘的提交时触发。
style: TextStyle - 文本样式，颜色，字体等。
textAlign: TextAlign - 设置文本对齐方式。
```

3、实现双线绑定（使用 controller）

```dart
new TextField(
    controller: new TextEditingController(text: this.id),
    decoration: const InputDecoration(
        hintText: '用户名/密码',
        contentPadding: const EdgeInsets.all(10.0),
    ),
    onChanged: (val) {
        this.setState(() {
            this.id = val;
        });
    },
)
```

## 路由和导航

1、通过Navigator和Route来实现的

```dart
onPressed: () {
  Navigator.push(
    context,
    new MaterialPageRoute(builder: (context) => new SecondScreen()),
  );
},
```

2、返回上一页（`Scaffold` 控件会自动在 `AppBar` 上添加一个返回按钮，点击该按钮会调用 `Navigator.pop`，现在希望点击第二个页面中间的按钮也能回到第一个页面，添加回调函数，调用 `Navigator.pop`）

```dart
onPressed: () {
  Navigator.pop(context);
}
```

3、页面跳转传值

```dart
return new ListTile(
  title: new Text(articles[index].title),
  onTap: () {
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new ContentScreen(articles[index]),
      ),
    );
  },
);
```

4、
# 用户头像文件夹

这个文件夹用于存放用户头像图片。

## 使用说明

1. 将用户头像图片放在此文件夹中
2. 推荐使用PNG或JPG格式的图片
3. 建议图片尺寸为200x200像素或更大，保持正方形比例
4. 文件名建议使用有意义的名称，例如：`user_avatar_1.png`、`default_avatar.jpg`等

## 在代码中使用

在Flutter代码中，可以通过以下方式引用头像：

```dart
Image.asset('assets/images/avatars/your_avatar_file.png')
```

或者作为背景图片：

```dart
Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/avatars/your_avatar_file.png'),
      fit: BoxFit.cover,
    ),
  ),
)
``` 
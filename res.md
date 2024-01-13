# Sources

## Menu

- [复制文本](#复制文本)
- [复制文本-升级版](#复制文本-升级版)
- [图片加速](#图片加速加载)

## 复制文本

> [Back](#sources)

> 已在 `index.html` 中添加了相关 js 代码, 可直接在本站中使用

<!-- tabs:start -->

##### **加载**

在页面中 `<head>` `</head>` 中或其他地方增加如下引用:
```
<script src="https://ghsrc.wyf9.top/js/copy.js"></script>
```

?> 也可以直接插入:

```html
<script>
function copy(text) {
  var input = document.createElement('input');
  input.setAttribute('value', text);
  document.body.appendChild(input);
  input.select();
  document.execCommand('copy');
  document.body.removeChild(input);
}
</script>
```

##### **使用**

- html:

```html
<a href="javascript:copy('[文本]')">[提示]</a>
```

- markdown:

```md
[[提示]](javascript:copy('[文本]'))
```

!> Markdown 方法可能在某些地方无法正确使用 (包括本站使用的 Docsify)

效果: 

Markdown: [点击复制](javascript:copy('复制的测试文本'))

HTML: <a href="javascript:copy('复制的测试文本')">点击复制</a>

<!-- tabs:end -->


## 复制文本-升级版

> [Back](#sources)

能在点击后显示提示信息, 并在指定时间后自动恢复

> 已在 `index.html` 中添加了相关 js 代码, 可直接在本站中使用

<!-- tabs:start -->

##### **加载**

在页面中 `<head>` `</head>` 中或其他地方增加如下引用:
```
<script src="https://ghsrc.wyf9.top/js/copyn.js"></script>
```

?> 也可以直接插入:

```html
<script>
function copyn(text, targetId, successMessage, timeout) {
  var target = document.getElementById(targetId);
  var originalText = target.innerHTML;

  var input = document.createElement('input');
  input.setAttribute('value', text);
  document.body.appendChild(input);
  input.select();
  document.execCommand('copy');
  document.body.removeChild(input);

  target.innerHTML = successMessage;

  setTimeout(function() {
    target.innerHTML = originalText;
  }, timeout);
}
</script>
```

##### **使用**

- html:

```html
<div id="[div id]"><a href="javascript:copyn('[文本]', '[div id]', '[复制后提示]', [提示持续时间])">原本提示</a></div>
```

> div id: 要绑定的id, 前后需相同

> 文本: 要复制的文本

> 复制后提示: 复制后显示的成功提示

> 提示持续时间: 上面成功提示的持续时间(毫秒),结束后恢复原本提示

> `1000ms`(毫秒) = `1s`(秒)

- markdown:

没有, 可参照上面 HTML 的方法调用

效果: 

```html
<div id="copy1"><a href="javascript:copyn('要复制的文本', 'copy1', '复制成功!', 800)">点击复制</a></div>
```

<div id="copy1"><a href="javascript:copyn('要复制的文本', 'copy1', '复制成功!', 800)">点击复制</a></div>

<!-- tabs:end -->

## 图片加速加载

> [Back](#sources)

?> `GitHub Raw` 文件路径格式: https://raw.githubusercontent.com/(user)/(repo)/(branch)/(path of file)

<!-- tabs:start -->

##### **→**

##### **站点**

?> 直接从本站 (Cloudflare Pages) 获取

(path of file)

##### **0.原始路径(最慢)**

?> GitHub Raw

https://raw.githubusercontent.com/wyf01239/doc/main/(path of file)

##### **0.5.本站(稍快?)**

https://doc.wyf9.top/(path of file)

##### **1.ghproxy.org**

https://ghproxy.org/https://raw.githubusercontent.com/wyf01239/doc/main/(path of file)

##### **2.ghproxy.net**

https://ghproxy.net/https://raw.githubusercontent.com/wyf01239/doc/main/(path of file)

##### **3.ghproxy.com**

https://mirror.ghproxy.com/https://raw.githubusercontent.com/wyf01239/doc/main/(path of file)

<!-- tabs:end -->

Example:

```md
<!-- tabs:start -->

##### **org**

![img](https://ghproxy.org/https://raw.githubusercontent.com/wyf01239/doc/main/_media/)

##### **net**

![img](https://ghproxy.net/https://raw.githubusercontent.com/wyf01239/doc/main/_media/)

##### **com**

![img](https://mirror.ghproxy.com/https://raw.githubusercontent.com/wyf01239/doc/main/_media/)

##### **Raw**

![img](https://raw.githubusercontent.com/wyf01239/doc/main/_media/)

##### **Site**

![img](https://doc.wyf9.top/_media/)

<!-- tabs:end -->
```
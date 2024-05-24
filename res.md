# Sources

一些在搭建本站时使用到的资源/脚本等

## Menu

- [复制文本](#复制文本)
- [复制文本-升级版](#复制文本-升级版)
- [版权信息](#版权信息)
- [页脚](#页脚)
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

> 添加了多行文本的复制

<!-- tabs:start -->

##### **加载**

在页面中 `<head>` `</head>` 中或其他地方增加如下引用:
```html
<script src="https://ghsrc.wyf9.top/js/copyn.js"></script> <!-- 单行复制 -->
<script src="https://ghsrc.wyf9.top/js/copym.js"></script> <!-- 多行复制 -->
```

?> 也可以直接插入:

```html
<script>
// 单行复制
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
};

// 多行复制
function copym(text, targetId, successMessage, timeout) {
  var target = document.getElementById(targetId);
  var originalText = target.innerHTML;

  var textarea = document.createElement('textarea');
  textarea.value = text;
  textarea.setAttribute('readonly', '');
  textarea.style.position = 'absolute';
  textarea.style.left = '-9999px';
  document.body.appendChild(textarea);
  textarea.select();
  document.execCommand('copy');
  document.body.removeChild(textarea);

  target.innerHTML = successMessage;

  setTimeout(function() {
    target.innerHTML = originalText;
  }, timeout);
}
</script>
```

##### **使用**

html:

1. 单行文本

```html
<div id="[div id]"><a href="javascript:copyn('[文本]', '[div id]', '[复制后提示]', [提示持续时间])">原本提示</a></div>
```

2. 多行文本

```html
<div id="[div id]"><a href="javascript:copym(`Line 1
Line 2
Line 3`, '[div id]', '[复制后提示]', [提示持续时间])">原本提示</a></div>
```

> div id: 要绑定的id, 前后需相同

> 文本: 要复制的文本

> 复制后提示: 复制后显示的成功提示

> 提示持续时间: 上面成功提示的持续时间(毫秒),结束后恢复原本提示

> `1000ms`(毫秒) = `1s`(秒)

!> 可能需要在每一行后添加 `\n` 才能正确复制多行文本!

markdown:

没有, 可参照上面 HTML 的方法调用

效果: 

```html
<div id="copy1"><a href="javascript:copyn('要复制的文本', 'copy1', '复制成功!', 800)">点击复制单行</a></div>
```

<div id="copy1"><a href="javascript:copyn('要复制的文本', 'copy1', '复制成功!', 800)">点击复制单行</a></div>

```html
<div id="copy1"><a href="javascript:copym(`Line1
Line2
Line3`, 'copy1', '复制成功!', 800)">点击复制多行</a></div>
```

<div id="copy1"><a href="javascript:copym(`Line1
Line2
Line3`, 'copy1', '复制成功!', 800)">点击复制多行</a></div>

<!-- tabs:end -->

## 版权信息

> [Back](#sources)

一个js脚本，用于动态加载版权信息中的年份

### 加载

使用下面的脚本:

```html
<script src="https://ghsrc.wyf9.top/js/copyright.js"></script>
```

> 也可自行下载使用

### 使用

创建一个div，里面写上需要格式化的内容，如:

```html
<div id=wyear>Copyright ©(year) wyf9. All Rights Reserved.</div>
```

需要替换的年份内容用 `(year)` 表示

接着调用脚本，只需要传递div的id作为参数即可，示例:

```html
<script>
copyright("wyear");
</script>
```

效果:

<div id=wyear>Copyright ©(year) wyf9. All Rights Reserved.</div>

<script>
copyright("wyear");
</script>

> ~~本人的[个人主页](https://wyf9.top/#/?id=about)末尾使用了此脚本，可参考~~

## 页脚

> [Back](#sources)

在页面下方插入 `在 GitHub 上编辑` 和版权信息

> 从官方文档中的示例修改而来

直接在 `window.$docsify` 的 `plugins` 中插入即可

在下面复制↓

```js
function(hook, vm) {
    hook.beforeEach(function(html) {
        var url = 'https://github.com/wyf01239/doc/blob/main/' + vm.route.file;
        var editHtml = '[📝 在 GitHub 上编辑](' + url + ')\n\n';
        const ctext = "Copyright ©(year) wyf9. All Rights Reserved.";
        const currentYear = new Date().getFullYear();
        const rtxt = ctext.replace('(year)', currentYear);
        return (
            html +
            '\n\n----\n\n' +
            editHtml +
            rtxt
        );
    });
}
```

> 使用示例:

```html
    <script>
        window.$docsify = {
            //其他配置
            plugins: [
                function(hook, vm) {
                    hook.beforeEach(function(html) {
                        var url = 'https://github.com/wyf01239/doc/blob/main/' + vm.route.file;
                        var editHtml = '[📝 在 GitHub 上编辑](' + url + ')\n\n';
                        
                        const ctext = "Copyright ©(year) wyf9. All Rights Reserved.";
                        const currentYear = new Date().getFullYear();
                        const rtxt = ctext.replace('(year)', currentYear);
                        
                        return (
                            html +
                            '\n\n----\n\n' +
                            editHtml +
                            rtxt
                        );
                    });
                }
            ]
        };
    </script>
    <!-- 其他内容 -->
```

## 图片加速加载

> [Back](#sources)

!> 因太麻烦，目前已弃用此方法，仅供留档参考

现在的链接: `https://ghimg.wyf9.top/doc/`...

?> `GitHub Raw` 文件路径格式: https://raw.githubusercontent.com/(user)/(repo)/(branch)/(path of file)

<!-- tabs:start -->

##### **→**

##### **-2.本站(稍快?)**

?> 直接从本站 (Cloudflare Pages) 获取

https://doc.wyf9.top/(path of file)

##### **-1.原始路径(最慢)**

?> GitHub Raw

https://raw.githubusercontent.com/wyf01239/doc/main/(path of file)

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
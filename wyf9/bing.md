# BingAI

!> 本页内容可能会随时变动，不保证稳定性

基于 `go-proxy-bingai` 搭建的 BingAI 代理站

## Usage

> 可在 右上角齿轮图标 -> `高级设置` 中设置聊天次数

<!-- tabs:start -->

##### **→**

##### **Main**

> 站点: <https://bing.wyf9.top>

如需使用，需额外进行设置:

1. 点击右上角的齿轮图标 -> `服务选择`
2. 在下面自定义地址中填入地址: `https://wyf9-bingpx.hf.space`, 并选择即可聊天

##### **1**

> 站点: <https://bing1.wyf9.top>

Cloudflare Workers 的代理地址

如需使用, 须进行额外设置:

1. 根据上面 **`Main`** 的方法选择服务
2. 额外在 `高级设置` 中设置 `人机验证服务器` 也为 `https://wyf9-bingpx.hf.space`

##### **2**

> 站点: <bing2.wyf9.top>

使用 Workers 尝试反代 `https://wyf9-bingpx.hf.space`, 可能不可用

##### **HuggingFace**

> 站点: <wyf9-bingpx.hf.space>

貌似可正常使用, 但**国内直连困难**

<!-- tabs:end -->

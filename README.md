# WKWebViewRequestHook
拦截WKWebView的请求，将静态资源缓存本地，加快加载速度

WKWebView是基于webkit内核来做的，在使用时相较于UIWebView占用内存更少，加载速度更快。
但为了性能极致优化，我们还可以进一步优化某些流程。

WKWebView加载的一些静态资源，比如css/js/img等等，APP拦截到这些请求后，让拦截到的此次request走本地请求

比如将网易的图片全换成百度的logo
<img src="https://github.com/sunzhongliangde/WKWebViewRequestHook/blob/master/WX20191126-164229.png">



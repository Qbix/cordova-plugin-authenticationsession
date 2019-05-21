# Cordova AuthenticationSession Plugin

Simple plugin that use SFAuthenticationSession and ASWebAuthenticationSession API's to do authentication using Safari storage.
This plugin use SFAuthenticationSession for iOS [11, 12) and ASWebAuthenticationSession for [12, +]

!!! Support iOS SDK version 11+. The build will fail on SDK version 10 and below. !!!


## Installation

Install the plugin

    $ cordova plugin add https://github.com/Qbix/cordova-plugin-authenticationsession.git
    

## Usage

```js
AuthenticationSession.start(customUrlScheme:String,url:String,successCallback,errorCallBack)
```

#### example

```js
AuthenticationSession.start("customScheme://","https://your-url",function(data){alert(data)},function(error){alert(error)})
```

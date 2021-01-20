<!DOCTYPE html>
<%@page language="java" contentType="text/html; UTF-8" pageEncoding="utf-8" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>videojs</title>
    <link rel="stylesheet" href="/video-js.min.css">
    <script src="/jquery-3.5.1.min.js"></script>
    <script src="/video.min.js"></script>
</head>
<style type="text/css">
    .ant-btn {
        line-height: 1.499;
        position: relative;
        display: inline-block;
        font-weight: 400;
        white-space: nowrap;
        text-align: center;
        background-image: none;
        border: 1px solid transparent;
        -webkit-box-shadow: 0 2px 0 rgba(0, 0, 0, 0.015);
        box-shadow: 0 2px 0 rgba(0, 0, 0, 0.015);
        cursor: pointer;
        -webkit-transition: all .3s cubic-bezier(.645, .045, .355, 1);
        transition: all .3s cubic-bezier(.645, .045, .355, 1);
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
        -ms-touch-action: manipulation;
        touch-action: manipulation;
        height: 32px;
        padding: 0 15px;
        font-size: 28px;
        border-radius: 4px;
        color: rgba(0, 0, 0, 0.65);
        background-color: #fff;
        border-color: #d9d9d9;
    }

    .ant-btn-red {
        color: #fff;
        background-color: #FF5A44;
        border-color: #FF5A44;
        text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.12);
        -webkit-box-shadow: 0 2px 0 rgba(0, 0, 0, 0.045);
        box-shadow: 0 2px 0 rgba(0, 0, 0, 0.045);
        width: 225px;
        height: 100px;
    }
</style>
<body>

<div align="center">
    <video id="example_video_1" class="video-js vjs-big-play-centered" controls playsinline preload="auto" width="850" height="1480"
           poster="http://vjs.zencdn.net/v/oceans.png">
        <source src="${indexUrl}">
    </video>
</div>


<div align="center" style="margin-top: 36px">
    <button id="change" class="ant-btn ant-btn-red">切换</button>
</div>

<script>

    var options = {};

    var player = videojs('example_video_1', options, function onPlayerReady() {

        videojs.log('播放器已经准备好了!');

        // In this context, `this` is the player that was created by Video.js.<br>  // 注意，这个地方的上下文， `this` 指向的是Video.js的实例对像player
        this.play();

        // How about an event listener?<br>  // 如何使用事件监听？
        this.on('ended', function () {
            videojs.log('播放结束了!');
        });

    });

    $(document).ready(function () {
        $("#change").click(function () {
            $.get("<%=basePath%>/video/change", function (data, status) {
                player.src(data);
                player.load(data);
                player.play();
            });

        });
    });


</script>
</body>
</html>
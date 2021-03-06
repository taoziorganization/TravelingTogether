<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登陆页面</title>
    <script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/index.css">
    <style>
        .logo {
            width: 170px;
            height: 80px;
            background-size: cover;
        }

        .login-content {
            position: absolute;
            left: 50%;
            top: 21%;
            width: 478px;
            margin-left: -239px;
            padding-top: 36px;
            padding-bottom: 46px;
            background-color: #fff;
            border-radius: 5px;
        }

        .login {
            width: 280px;
            margin: 0 auto;
        }

        .login > img {
            display: block;
            margin: 0 auto;
        }

        .login > .go-welcome {
            display: block;
            width: 63px;
            margin: 0 auto;
            background-color: #fff;
        }

        .login > h2 {
            margin-top: 40px;
            margin-bottom: 20px;
            font-size: 30px;
            font-weight: normal;
            color: #666;
            text-align: center;
        }

        .login > input {
            width: 280px;
            height: 48px;
            line-height: normal;
            margin-bottom: 18px;
            padding-left: 20px;
            border: 1px solid #dcdcdc;
            border-radius: 5px;
        }

        .login > a {
            display: block;
            width: 280px;
            height: 40px;
            line-height: 40px;
            margin-bottom: 12px;
            background-color: #ff7200;
            color: #fff;
            text-align: center;
        }

        .login > .disabled, .msg > .disabled {
            background: #ddd;
        }

        .login > p {
            margin-top: 13px;
            color: #666;
            text-align: center;
        }

        .login > p a {
            color: #ff7200;
        }

        .msg-login {
            text-align: right;
            margin-bottom: 12px;
            color: #333;
            font-size: 12px;
            cursor: pointer;
        }

        .msg-login img {
            margin-right: 7px;
            vertical-align: bottom;
        }

        .automatic-forget {
            position: relative;
            width: 280px;
            margin-bottom: 30px;
        }

        .automatic-forget a {
            position: absolute;
            right: 0;
            top: 0;
            color: #ff7200;
        }

        .else-login {
            margin-top: 12px;
            text-align: center;
        }

        .qq-login {
            margin-right: 17px;
        }
    </style>

    <script>
        $("body").keydown(function () {
            if (event.keyCode == "13") {//keyCode=13是回车键
                $("#login").click();
            }
        });

        function loginSubmit() {
            //获取login.jsp页面的数据登录者姓名和密码
            var username = $("#login_account").val();
            var password = $("#login_password").val();
            if (username == '') {
//                layer.tips('用户名不能为空', "#username", {
//                    tips: [2, '#ff0000']
//                });
                alert('用户名不能为空');
                $("#login_account").focus();
                return;
            }
            if (password == "") {
//                layer.tips('密码不能为空', '#password', {
//                    tips: [2, '#ff0000']
//                });
                alert('密码不能为空');
                $("input#login_password").focus();
                return;
            }
            document.getElementById("loginForm").submit();
        }
            //当密码和用户名不为空的时候使用Ajax进行用户信息登录验证
//        var strJSON = {"username": username, "password": password};
//        jQuery.ajax({
//            url: "./user/login",
//            type: "POST",
//            data: strJSON,
//            success: function (obj) {
//                if (obj.status == 0) {
//                    //将登录者信息保存在cookie中以便添加信息时添加经济人
//                    setCookie("loginname", obj.user.username);
//                    //跳转到首页
//                    window.location.replace("index.jsp");//登录成功
//                } else {
//                    layer.alert('用户名或密码不正确', {
//                        skin: 'layui-layer-molv' //样式类名
//                        , closeBtn: 0
//                        , shift: 4 //动画类型
//                    });
//                }
//            },
//            error: function () {
//                layer.alert('系统错误', {
//                    skin: 'layui-layer-molv'
//                    , closeBatn: 0
//                });
//            },
//            complete: function (obj) {
//                if (obj.status == 200);
//            }
//        });
    </script>
</head>
<body>
<%--注册信息--%>
<%
    String resgiterMsg = (String) request.getAttribute("resgiterMsg");
    if(resgiterMsg != null && !resgiterMsg.equals("")){
        out.print("<script>");
        out.print("alert('" + resgiterMsg + "');");
        out.print("</script>");
    }
%>

<%--登陆信息--%>
<%
    String loginMsg = (String) request.getAttribute("loginMsg");
    if(loginMsg != null && !loginMsg.equals("")){
        out.print("<script>");
        out.print("alert('" + loginMsg + "');");
        out.print("</script>");
    }
%>


<header>
    <a href="#" class="logo"></a>
    <div class="desc">欢迎登陆</div>
</header>
<form id="loginForm" action="/user/doLogin" method="post">
    <div id="content">
        <div class="login-content">
            <div class="login">
                <input id="login_account" type="text" name="username" placeholder="用户名/手机/邮箱">
                <input id="login_password" type="password" name="password" placeholder="请输入你的登录密码">
                <a class="login_btn" onclick="loginSubmit()" id="login">登录</a>
                <div class="automatic-forget">
                    <input type="checkbox"/>自动登陆
                    <a href="/home/index.php?s=/home/user/forgotpassword">忘记密码？</a>
                </div>
                <img src="/images/another.png" alt="">
                <div class="else-login">
                    <a class="qq-login" href="/home/index.php?s=/home/third_login/login/type/qq/">
                        <img src="/images/QQ.png" alt="">
                    </a>
                    <a class="wx-login" href="/home/index.php?s=/home/third_login/login/type/weixin/">
                        <img src="/images/weixin.png" alt="">
                    </a>
                </div>
                <p>还没有账号？<a class="to-register" href="/user/register">点击注册»</a></p>
            </div>
        </div>
    </div>
</form>
</body>
</html>
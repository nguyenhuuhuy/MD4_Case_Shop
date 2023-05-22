<%--
  Created by IntelliJ IDEA.
  User: huycb
  Date: 5/22/2023
  Time: 11:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <style>

        .customDiv {
            display: block;
            position: relative;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box
        }

        .bbb_viewed {
            padding-top: 51px;
            padding-bottom: 60px;
            background: #eff6fa
        }

        .bbb_main_container {
            background-color: #fff;
            padding: 11px;
        }

        .bbb_viewed_title_container {
            border-bottom: solid 1px #dadada
        }

        .bbb_viewed_title {
            margin-bottom: 16px;
            margin-top: 8px;

        }

        .bbb_viewed_nav_container {
            position: absolute;
            right: -5px;
            bottom: 14px
        }

        .bbb_viewed_nav {
            display: inline-block;
            cursor: pointer
        }

        .bbb_viewed_nav i {
            color: #dadada;
            font-size: 18px;
            padding: 5px;
            -webkit-transition: all 50ms ease;
            -moz-transition: all 50ms ease;
            -ms-transition: all 50ms ease;
            -o-transition: all 50ms ease;
            transition: all 50ms ease
        }

        .bbb_viewed_nav:hover i {
            color: #606264
        }

        .bbb_viewed_prev {
            margin-right: 15px
        }

        .bbb_viewed_slider_container {
            padding-top: 13px;
        }

        .bbb_viewed_item {
            width: 100%;
            background: #FFFFFF;
            border-radius: 2px;
            padding-top: 25px;
            padding-bottom: 25px;
            padding-left: 30px;
            padding-right: 30px
        }

        .bbb_viewed_image {
            width: 150px;
            height: 150px;
        }

        .bbb_viewed_image img {
            display: block;
            max-width: 100%
        }

        .bbb_viewed_content {
            width: 100%;
            margin-top: 25px
        }

        .bbb_viewed_price {
            font-size: 16px;
            color: #000000;
            font-weight: 500
        }

        .bbb_viewed_item.discount .bbb_viewed_price {
            color: #df3b3b
        }

        .bbb_viewed_price span {
            position: relative;
            font-size: 12px;
            font-weight: 400;
            color: rgba(0, 0, 0, 0.6);
            margin-left: 8px
        }

        .bbb_viewed_price span::after {
            display: block;
            position: absolute;
            top: 6px;
            left: -2px;
            width: calc(100% + 4px);
            height: 1px;
            background: #8d8d8d;
            content: ''
        }

        .bbb_viewed_name {
            margin-top: 3px
        }

        .bbb_viewed_name a {
            font-size: 14px;
            color: #000000;
            -webkit-transition: all 50ms ease;
            -moz-transition: all 50ms ease;
            -ms-transition: all 50ms ease;
            -o-transition: all 50ms ease;
            transition: all 50ms ease
        }

        .bbb_viewed_name a:hover {
            color: #0e8ce4
        }

        .item_marks {
            position: absolute;
            top: 18px;
            left: 18px
        }

        .item_mark {
            display: none;
            width: 36px;
            height: 36px;
            border-radius: 50%;
            color: #FFFFFF;
            font-size: 10px;
            font-weight: 500;
            line-height: 36px;
            text-align: center
        }

        .item_discount {
            background: #df3b3b;
            margin-right: 5px
        }

        .item_new {
            background: #0e8ce4
        }

        .bbb_viewed_item.discount .item_discount {
            display: inline-block
        }

        .bbb_viewed_item.is_new .item_new {
            display: inline-block
        }
    </style>

</head>
<body>
<div class="bbb_viewed customDiv">
    <div class="container  customDiv">
        <div class="row  customDiv">
            <div class="col customDiv">
                <div class="bbb_main_container  customDiv">
                    <div class="bbb_viewed_title_container  customDiv">
                        <h4 style="font-weight: 600; color: black" class="bbb_viewed_title">Top 10 best selling
                            products </h4>
                        <div class="bbb_viewed_nav_container  customDiv">
                            <div style="color: black" class="bbb_viewed_nav bbb_viewed_prev">
                                <p> << </p>
                            </div>
                            <div style="color: black" class="bbb_viewed_nav bbb_viewed_next">
                                <p> >> </p>

                            </div>
                        </div>
                    </div>
                    <div class="bbb_viewed_slider_container  customDiv">
                        <div class="owl-carousel owl-theme bbb_viewed_slider  customDiv">
                            <c:forEach items='${requestScope["top"]}' var="t">
                                <div class="owl-item">
                                    <div class="bbb_viewed_item discount d-flex flex-column align-items-center justify-content-center text-center">
                                        <div class="bbb_viewed_image"><img src="${t.image}" alt=""></div>
                                        <div class="bbb_viewed_content text-center">
                                            <div class="bbb_viewed_price">Order: ${t.quantity}</div>
                                            <div class="bbb_viewed_name"><a href="#">${t.name}</a></div>
                                        </div>
                                        <ul class="item_marks">
                                            <li class="item_mark item_discount">-25%</li>
                                            <li class="item_mark item_new">new</li>
                                        </ul>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    $(document).ready(function () {


        if ($('.bbb_viewed_slider').length) {
            var viewedSlider = $('.bbb_viewed_slider');

            viewedSlider.owlCarousel(
                {
                    loop: true,
                    margin: 30,
                    autoplay: true,
                    autoplayTimeout: 2000,
                    nav: false,
                    dots: false,
                    responsive:
                        {
                            0: {items: 1},
                            575: {items: 2},
                            768: {items: 3},
                            991: {items: 4},
                            1199: {items: 6}
                        }
                });

            if ($('.bbb_viewed_prev').length) {
                var prev = $('.bbb_viewed_prev');
                prev.on('click', function () {
                    viewedSlider.trigger('prev.owl.carousel');
                });
            }

            if ($('.bbb_viewed_next').length) {
                var next = $('.bbb_viewed_next');
                next.on('click', function () {
                    viewedSlider.trigger('next.owl.carousel');
                });
            }
        }


    });
</script>

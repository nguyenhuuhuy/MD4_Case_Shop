<%--
  Created by IntelliJ IDEA.
  User: huycb
  Date: 5/19/2023
  Time: 8:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<title>Detail Product</title>
<link rel="shortcut icon" type="image/icon" href="../../assets/logo/favicon.png"/>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" type="text/css"
      href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet" type="text/css"
      href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
<head>

    <jsp:include page='../assets/css/homeDetail.css.jsp'>
        <jsp:param name="articleId" value=""/>
    </jsp:include>

</head>


<jsp:include page='/layout/header.jsp'>
    <jsp:param name="articleId" value=""/>
</jsp:include>
<body>

<div class="pd-wrap" style="margin-top: 120px">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div id="slider" class="owl-carousel product-slider">
                    <div class="item">
                        <img src="${requestScope["detail"].image}"/>
                    </div>
                    <div class="item">
                        <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"/>
                    </div>
                    <div class="item">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQI6nUmObt62eDkqNSmIvCN_KkQExtbpJmUbVx_eTh_Y3v3r-Jw"/>
                    </div>
                    <div class="item">
                        <img src="https://i.ytimg.com/vi/PJ_zomNMK_s/maxresdefault.jpg"/>
                    </div>
                    <div class="item">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQI6nUmObt62eDkqNSmIvCN_KkQExtbpJmUbVx_eTh_Y3v3r-Jw"/>
                    </div>
                    <div class="item">
                        <img src="https://i.ytimg.com/vi/PJ_zomNMK_s/maxresdefault.jpg"/>
                    </div>
                    <div class="item">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQI6nUmObt62eDkqNSmIvCN_KkQExtbpJmUbVx_eTh_Y3v3r-Jw"/>
                    </div>
                </div>
                <div id="thumb" class="owl-carousel product-thumb">
                    <div class="item">
                        <img src="${requestScope["detail"].image}"/>
                    </div>
                    <div class="item">
                        <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"/>

                    </div>
                    <div class="item">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQI6nUmObt62eDkqNSmIvCN_KkQExtbpJmUbVx_eTh_Y3v3r-Jw"/>
                    </div>
                    <div class="item">
                        <img src="https://i.ytimg.com/vi/PJ_zomNMK_s/maxresdefault.jpg"/>
                    </div>
                    <div class="item">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQI6nUmObt62eDkqNSmIvCN_KkQExtbpJmUbVx_eTh_Y3v3r-Jw"/>
                    </div>
                    <div class="item">
                        <img src="https://i.ytimg.com/vi/PJ_zomNMK_s/maxresdefault.jpg"/>
                    </div>
                    <div class="item">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQI6nUmObt62eDkqNSmIvCN_KkQExtbpJmUbVx_eTh_Y3v3r-Jw"/>
                    </div>
                </div>
            </div>

            <c:if test='${requestScope["detail"] != null}' var="detail">
                <div class="col-md-6">
                    <div class="product-dtl">
                        <div class="product-info">
                            <div class="product-name" style="color: black">${requestScope["detail"].name}</div>
                            <p>Product ID: ${requestScope["detail"].id}</p>
                            <p>Category: ${requestScope["detail"].category.cName}</p>
                            <div>
                                <div class="rate">
                                    <label style="color: #ffc700" title="text">5 star</label>
                                    <label style="color: #ffc700" title="text">5 star</label>
                                    <label style="color: #ffc700" title="text">5 star</label>
                                    <label style="color: #ffc700" title="text">5 star</label>
                                    <label style="color: #ffc700" title="text">5 star</label>

                                </div>
                                <c:if test='${requestScope["like"]!=null}'>
                                <span>${requestScope["like"]}</span>
                                </c:if>
                            </div>
                            <div class="product-price-discount">
                                <span style="color: black">$ ${requestScope["detail"].price}</span>
                                <span class="line-through">$29.00</span>
                            </div>
                        </div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                            labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                            laboris nisi ut aliquip ex ea commodo consequat.</p>
                        <div class="row">
                            <div class="col-md-6">
                                <label for="size">Size</label>
                                <select id="size" name="size" class="form-control">
                                    <option>S</option>
                                    <option>M</option>
                                    <option>L</option>
                                    <option>XL</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="color">Color</label>
                                <select id="color" name="color" class="form-control">
                                    <option>Blue</option>
                                    <option>Green</option>
                                    <option>Red</option>
                                </select>
                            </div>
                        </div>
                        <div class="product-count">
                            <label for="size">Quantity</label>
                            <form action="#" class="display-flex">
                                <div class="qtyminus">-</div>
                                <input type="text" name="quantity" value="1" class="qty">
                                <div class="qtyplus">+</div>
                            </form>
                            <a href="#" class="round-black-btn">Add to Cart</a>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>

        <div class="heading-section">
            <h2 style="margin-top: 20px">Product Details</h2>
        </div>

        <h2>Tabs</h2>
        <p>Click on the x button in the top right corner to close the current tab:</p>

        <div class="tab">
            <button style="color: black; font-weight: bolder" class="tablinks" onclick="openCity(event, 'London')"
                    id="defaultOpen">Reviews
            </button>
            <button style="color: black; font-weight: bolder" class="tablinks" onclick="openCity(event, 'Paris')">
                Description
            </button>
            <%--            <button class="tablinks" onclick="openCity(event, 'Tokyo')">Tokyo</button>--%>
        </div>
        <div id="London" class="tabcontent">
            <span onclick="this.parentElement.style.display='none'" class="topright">&times</span>
            <div class="">
                <label>REVIEWS</label>
                <c:forEach items='${requestScope["comment"]}' var="cm">
                    <div style="display: flex">
                        <img src="${cm.getAvatar()}" alt=""
                             style="width: 50px;height: 50px; border-radius: 50px; margin: 2px">
                        <h1 style="margin:5px">${cm.getUsername()} </h1>
                        <p>: ${cm.getComment()}</p>
                        <hr style="color: black">
                    </div>
                </c:forEach>

                <c:if test='${requestScope["detail"] != null}'>
                    <form class="review-form" method="post" action="/home?action=comment">
                        <c:if test='${requestScope["userLogin"]!=null}'>
                            <input type="text" name="userId" value="${requestScope["userLogin"].id}" hidden="">
                        </c:if>
                        <input type="text" name="productId" value="${requestScope["detail"].id}" hidden=""><br>
                        <div class="form-group">
                            <label>Your rating</label>
                            <div class="reviews-counter">
                                <div class="rate">
                                    <input type="radio" id="star5" name="rate" value="5"/>
                                    <label for="star5" title="text">5 stars</label>
                                    <input type="radio" id="star4" name="rate" value="4"/>
                                    <label for="star4" title="text">4 stars</label>
                                    <input type="radio" id="star3" name="rate" value="3"/>
                                    <label for="star3" title="text">3 stars</label>
                                    <input type="radio" id="star2" name="rate" value="2"/>
                                    <label for="star2" title="text">2 stars</label>
                                    <input type="radio" id="star1" name="rate" value="1"/>
                                    <label for="star1" title="text">1 star</label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Your message</label>

                            <input type="text" name="comment" value="Your comment" class="form-control"
                                   rows="10">
                        </div>
                        <c:if test='${sessionScope["userLogin"]==null}'>
                            <button type="submit" disabled class="round-black-btn">SUBMIT</button>
                            <p style="color: #ccbb05">SUBMIT => Login to add a comment!</p>
                        </c:if>
                        <c:if test='${sessionScope["userLogin"]!=null}'>
                            <button type="submit" class="round-black-btn">SUBMIT REVIEW</button>
                        </c:if>
                    </form>
                </c:if>

            </div>

        </div>

        <div id="Paris" class="tabcontent">
            <span onclick="this.parentElement.style.display='none'" class="topright">&times</span>
            <div class="" id="description" role="tabpanel"
                 aria-labelledby="description-tab">
                <div class="">Description</div>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
                et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
                culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus
                error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.
            </div>

        </div>


    </div>
</div>


</body>


<jsp:include page='/layout/footer.jsp'>
    <jsp:param name="articleId" value=""/>
</jsp:include>

<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="	sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script>
    $(document).ready(function () {
        var slider = $("#slider");
        var thumb = $("#thumb");
        var slidesPerPage = 4; //globaly define number of elements per page
        var syncedSecondary = true;
        slider.owlCarousel({
            items: 1,
            slideSpeed: 2000,
            nav: false,
            autoplay: false,
            dots: false,
            loop: true,
            responsiveRefreshRate: 200
        }).on('changed.owl.carousel', syncPosition);
        thumb
            .on('initialized.owl.carousel', function () {
                thumb.find(".owl-item").eq(0).addClass("current");
            })
            .owlCarousel({
                items: slidesPerPage,
                dots: false,
                nav: true,
                item: 4,
                smartSpeed: 200,
                slideSpeed: 500,
                slideBy: slidesPerPage,
                navText: ['<svg width="18px" height="18px" viewBox="0 0 11 20"><path style="fill:none;stroke-width: 1px;stroke: #000;" d="M9.554,1.001l-8.607,8.607l8.607,8.606"/></svg>', '<svg width="18px" height="18px" viewBox="0 0 11 20" version="1.1"><path style="fill:none;stroke-width: 1px;stroke: #000;" d="M1.054,18.214l8.606,-8.606l-8.606,-8.607"/></svg>'],
                responsiveRefreshRate: 100
            }).on('changed.owl.carousel', syncPosition2);

        function syncPosition(el) {
            var count = el.item.count - 1;
            var current = Math.round(el.item.index - (el.item.count / 2) - .5);
            if (current < 0) {
                current = count;
            }
            if (current > count) {
                current = 0;
            }
            thumb
                .find(".owl-item")
                .removeClass("current")
                .eq(current)
                .addClass("current");
            var onscreen = thumb.find('.owl-item.active').length - 1;
            var start = thumb.find('.owl-item.active').first().index();
            var end = thumb.find('.owl-item.active').last().index();
            if (current > end) {
                thumb.data('owl.carousel').to(current, 100, true);
            }
            if (current < start) {
                thumb.data('owl.carousel').to(current - onscreen, 100, true);
            }
        }

        function syncPosition2(el) {
            if (syncedSecondary) {
                var number = el.item.index;
                slider.data('owl.carousel').to(number, 100, true);
            }
        }

        thumb.on("click", ".owl-item", function (e) {
            e.preventDefault();
            var number = $(this).index();
            slider.data('owl.carousel').to(number, 300, true);
        });

        $(".qtyminus").on("click", function () {
            var now = $(".qty").val();
            if ($.isNumeric(now)) {
                if (parseInt(now) - 1 > 0) {
                    now--;
                }
                $(".qty").val(now);
            }
        })
        $(".qtyplus").on("click", function () {
            var now = $(".qty").val();
            if ($.isNumeric(now)) {
                $(".qty").val(parseInt(now) + 1);
            }
        });
    });


    function openCity(evt, cityName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(cityName).style.display = "block";
        evt.currentTarget.className += " active";
    }

    // Get the element with id="defaultOpen" and click on it
    document.getElementById("defaultOpen").click();
</script>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cart Murach</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="bot.css" type="text/css">
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
    <div class="col-md-12">

        <h2>Trending <b>Products</b></h2>
        <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="0">
            <ol class="carousel-indicators">
                <c:forEach var="i" begin="0" end="2">
                    <li data-target="#myCarousel" data-slide-to="${i}" class="${i == 0 ? 'active' : ''}"></li>
                </c:forEach>
            </ol>

            <div class="carousel-inner">
                <c:forEach var="group" begin="0" end="2">
                    <div class="item ${group == 0 ? 'active' : ''}">
                        <div class="row">
                            <c:forEach var="product" items="${products}" begin="${group * 4}" end="${group * 4 + 3}">
                                <div class="col-sm-3">
                                    <div class="thumb-wrapper">
                                        <div class="img-box">
                                            <img src="${product.url}" class="img-responsive" alt="">
                                        </div>
                                        <div class="thumb-content">
                                            <h4><c:out value='${product.description}'/></h4>
                                            <p class="item-price"> <span>${product.priceCurrencyFormat}</span></p>
                                            <form action="cart" method="post">
                                                <input type="hidden" name="productCode" value="<c:out value='${product.code}'/>">
                                                <c:forEach var="LineItem" items="${LineItems}">
                                                    <input type="hidden" name="quantity" value="<c:out value='${LineItem.quantity}'/>">
                                                </c:forEach>
                                                    <input class="submit" type="submit" value="Add To Cart">
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- Carousel controls -->
            <a class="carousel-control left" href="#myCarousel" data-slide="prev">
                <i class="fa fa-angle-left"></i>
            </a>
            <a class="carousel-control right" href="#myCarousel" data-slide="next">
                <i class="fa fa-angle-right"></i>
            </a>
        </div>
    </div>
</div>
</body>
</html>

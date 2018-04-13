﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="buyList" value="${requestScope.buyList}" />
<c:set var="member" value="${sessionScope.member}" />

<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>buyList</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="shortcut icon" type="image/x-icon"
	href="img/icon/favicon.ico">
<!-- Place favicon.ico in the root directory -->


<!-- all css here -->
<link rel="stylesheet" href="/resources/css/eunsong.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/elegant-font.css">
<link rel="stylesheet"
	href="/resources/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="/resources/css/meanmenu.min.css">
<link rel="stylesheet" href="/resources/css/animate.css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/css/animate-heading.css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/css/shortcode/shortcodes.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/responsive.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="/resources/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<style>


</style>
<body class="other-page">




	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!-- Header Area Start -->
	<header></header>
	<!-- Header Area End -->
	<!-- Page Content Wraper Area Start -->
	<section class="page-content-wrapper pt-100 pb-40">

		<!-- checkout-area start -->
		<div class="checkout-area">
			<div class="container">
				<div class="row">
					<form action="#">

						<div class="checkbox-form">

					<!-- 결제 방법 창 -->
					<div class="row">
								<h2 style=" width:20%; display: inline-block; font-weight:500;">구매 내역</h2>
								<h3></h3>
							
								
					</div>
					<!-- 결제 방법 창 -->
			<br><br>
							<!-- 구매 내역 시작 -->
							<div class="row">
								<h3>구매 내역 정보</h3>
								<div class="col-md-12 col-sm-12 col-xs-12">
									<form action="#">
									
											
											
											
											
											<!-- 구매 내역 2 시작 -->
										<div class="table-content table-responsive">
										
											<table>
												<thead>
													<tr>
														<th class="product-thumbnail eceff8" colspan="5">구매 내역</th>
														
														<th class="product-subtotal eceff8">유효기한/배송상태</th>
														<th class="product-remove eceff8">관리</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach var="o" items="${buyList}" varStatus="status">
													<tr>
														<td ><a href="#"><img
																src="/resources/img/product/3.jpg" alt=""></a></td>
														<td class="product-name">
															<p style="font-weight: bold;">${o.mbBizName}</p>
															<span>${o.pbName}(구매수량 ${o.poCnt}개)</span>
															<br>
															상품 문구 : ${o.poText}
															<!-- 상품 문구 변경 버튼 시작 -->
														<c:if test="${o.s_num <4 }">
														<c:set var="pNum" scope="request" value="${o.poNum}"/>
														<div class="pink_button">
															<input type="button" value="상품문구 변경" 
															onclick='window.open("/poTextUpdateView.ca","상품 문구 변경","width=600,height=650,location=no,status=no,scrollbars=yes")'
															style="height:20px; width:100px; margin-top:5px; padding-left:10px; padding-right:10px;">
														</div>
														</c:if>
														<!-- 상품 문구 변경 버튼 끝 -->
															</td>
														
														<td >
														<p style="font-weight: bold;">주문 날짜</p>
															<span>${o.poDate}</span>
														</td>
														<td style=" width:10%">
															<p style="font-weight: bold;">총 금액</p>
															<span>${o.poPrice+o.poBizDelivery}원</span>
														
														</td>
														<td>
														<p style="font-weight: bold;">예약 날짜</p>
															<span>${o.poBookDate}</span>
													
														</td>
														<td class="product-price" ><span>
														${o.s_status}</span>
														<!-- 배송추적 버튼 시작 -->
														<c:if test="${o.s_num eq 5 }">
														<div class="pink_button">
															<input type="button" value="배송 추적" 
															onclick='window.open("/delivery.ca","배송","width=600,height=650,location=no,status=no,scrollbars=yes")'
															style="height:20px; width:100px; margin-top:5px; padding-left:10px; padding-right:10px;">
														</div>
														</c:if>
														<!-- 배송 추적 버튼 끝 -->
														</td>
														<td class="product-subtotal">
														
														<!-- 구매취소 버튼 시작 -->
														<c:if test="${o.s_num < 4}">
														<div class="pink_button">
															<input type="button" value="구매취소" style="height:20px; width:100px; margin-top:5px; padding-left:10px; padding-right:10px;">
														</div>
														</c:if>
														<!-- 구매취소 버튼 끝 -->
														
														</td>
													</tr>
													<tr style="border-bottom:solid grey 2px;">
														<td class="product-thumbnail">
														
														<p style="font-weight: bold;">주문번호</p>
															<span>${o.poNum}2034532</span>
														
														
														<td colspan="6">배송지 정보 : ${o.recName}, (${o.recPost})${o.recBasicAddr} ${o.recDetailAddr}<br>
														<!-- 배송지 수정 버튼 시작 -->
														<c:if test="${o.s_num < 5}">
														<div class="pink_button">
															<input type="button" value="배송지 수정" 
															onclick='window.open("/recPostUpdateView.ca","배송지 수정","width=600,height=650,location=no,status=no,scrollbars=yes")'
															style="height:20px; width:100px; margin-top:5px; padding-left:10px; padding-right:10px;">
														</div>
														</c:if>
														<!-- 배송지 수정 버튼 끝 -->
												
												</div>
												
														</td>
													</tr>
													</c:forEach>
													
													<tr>
														<td ><a href="#"><img
																src="/resources/img/product/3.jpg" alt=""></a></td>
														<td class="product-name">
															<p style="font-weight: bold;">똔똔씨의 케잌가게</p>
															<span>산타할아버지 초코케이크(구매수량 2개)</span><br>
															<span>상품 문구 : 엄마 사랑해요</span>
															</td>
														
														<td >
														<p style="font-weight: bold;">주문 날짜</p>
															<span>2018.03.44 12:34:33</span>
														</td>
														<td >
															<p style="font-weight: bold;">총 금액</p>
															<span>70,000</span>
														
														</td>
														<td>
														<p style="font-weight: bold;">예약 날짜</p>
															<span>2018.03.24 18:00</span>
													
														</td>
														<td class="product-price" ><span>
														<a href="#">배송 상태(택배 현황과 연결하기)</a></span></td>
														<td class="product-subtotal">
														
														<!-- 배송지 수정 버튼 시작 -->
														<div class="pink_button">
															<input type="button" value="구매취소" style="height:20px; width:100px; margin-top:5px; padding-left:10px; padding-right:10px;">
														</div>
														<!-- 배송지 수정 버튼 끝 -->
														
														</td>
													</tr>
													<tr>
														<td class="product-thumbnail">
														
														<p style="font-weight: bold;">주문번호</p>
															<span>2032626747</span>
														
														
														<td colspan="6">배송지 정보 : 김은송, (444-222)경기도 수원시 영통구 삼대 한보아파트
														<br>
														<!-- 배송지 수정 버튼 시작 -->
														<div class="pink_button">
															<input type="button" value="배송지 수정" style="height:20px; width:100px; margin-top:5px; padding-left:10px; padding-right:10px;">
														</div>
														<!-- 배송지 수정 버튼 끝 -->
												
												</div>
												
														</td>
													</tr>
													
													
												</tbody>
											</table>
										</div>
											<!-- 구매 내역 2 끝 -->
									
									</form>
								</div>
							</div>
							<!-- 장바구니 끝 -->
							<br> <br> <br>
							

							<br> <br> <br>
						

						</div>

					</form>
				</div>
			</div>
		</div>
		<!-- checkout-area end -->
	</section>
	<!-- Page Content Wraper Area End -->
	<!-- Fotter Area Start -->
	<footer>
		<!-- Footer Top Area End -->
		<div class="fotter-area dark-gray-bg ptb-100">
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-4 col-xs-12">
						<div class="address-area res-mb-sm-30">
							<a href="/resources/index.html">shopzon</a>
							<p>Lorem ipsum dolor sit amet, consemi cteta dipisi cing
								elit, sed do eiusmod tempor.</p>
							<div class="contact-social mt-40">
								<ul>
									<li><a href="#" class="social_facebook "></a></li>
									<li><a href="#" class="social_twitter "></a></li>
									<li><a href="#" class="social_googleplus"></a></li>
									<li><a href="#" class="social_linkedin "></a></li>
									<li><a href="#" class="social_instagram "></a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-4 col-xs-12 xs-res-mrbtm">
						<div class="footer-menu res-mb-sm-30">
							<h4>MY ACCOUNT</h4>
							<ul>
								<li><a href="#">FAQs</a></li>
								<li><a href="#">Payments</a></li>
								<li><a href="#">Track Your Order</a></li>
								<li><a href="#">Return Polcy</a></li>
								<li><a href="#">Warranty</a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-3 hidden-sm hidden-xs">
						<div class="footer-menu">
							<h4>SHOP GUIDE</h4>
							<ul>
								<li><a href="#">Hot Sale</a></li>
								<li><a href="#">Best Sellar</a></li>
								<li><a href="#">Suppliers</a></li>
								<li><a href="#">Our Store</a></li>
								<li><a href="#">Deal of The Day</a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-3 col-sm-4 col-xs-12 xs-res-mrbtm">
						<div class="footer-menu">
							<h4>CONTACT INFO</h4>
							<div class="contact-details">
								<ul>
									<li><span class="icon_pin"></span>
										<p>Lusmod tempor incididunt</p></li>
									<li><span class="icon_mail"></span>
										<p>Lusmod incidiunt wesbvu</p></li>
									<li><span class="icon_phone "></span>
										<p>(256) 987 654 321</p></li>
									<li><span class="icon_clock_alt"></span>
										<p>8.00 am-6.00 pm</p></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer Top Area End -->
		<!-- Footer Bottom Area Start -->
		<div class="footer-bottom-area black-bg">
			<div class="container">
				<div class="row ">
					<div class="col-md-6 col-sm-6 col-xs-12">
						<p>
							Copyright &copy; 2017.Company name All rights reserved.More
							Templates <a href="http://www.cssmoban.com/" target="_blank"
								title="模板之家">模板之家</a> - Collect from <a
								href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a><a
								target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
						</p>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<img src="/resources/img/icon/payment.png" alt="" />
					</div>
				</div>
			</div>
		</div>
		<!-- Footer Bottom Area End -->
	</footer>
	<!-- Fotter Area End -->

	<!-- all js here -->
	<script src="/resources/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/isotope.pkgd.min.js"></script>
	<script src="/resources/js/jquery.nivo.slider.js"></script>
	<script src="/resources/js/price-slider.js"></script>
	<script src="/resources/js/jquery.simpleLens.min.js"></script>
	<script src="/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/js/animated-heading.js"></script>
	<script src="/resources/js/jquery.ajaxchimp.min.js"></script>
	<script src="/resources/js/jquery.countdown.js"></script>
	<script src="/resources/js/jquery.meanmenu.js"></script>
	<script src="/resources/js/plugins.js"></script>
	<script src="/resources/js/main.js"></script>
</body>
</html>


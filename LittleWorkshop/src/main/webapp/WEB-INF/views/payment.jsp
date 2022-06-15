<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
	
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <meta charset="UTF-8">
    <!--공통 CD  N -->  
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"> 
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<!--공통 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap" rel="stylesheet">


    <script>
        window.onload = function() {
            totalPayment();

        };

        function totalPayment() {
            let paymentList = [];
            totalPaymentPrice = 0;
            Array.from(document.querySelectorAll('.optionBox')).forEach(function(item, index) {
                paymentList.push(parseInt(item.getAttribute("data-code")));
                totalPaymentPrice += parseInt(item.querySelector(".orderPrice").innerHTML.replace(/,/gi, ""));
            });

            document.querySelector("#paymentDelivery").innerHTML = 0 + "원";
            document.querySelector("#paymentAmount").innerHTML = paymentList.length + "개";
            document.querySelector("#paymentPrice").innerHTML = totalPaymentPrice.toLocaleString() + "원";
            document.querySelector("#totalPayment").innerHTML = (totalPaymentPrice + 0).toLocaleString() + "원";

        }

        function paymentBtn() {
            order = {};
            orderDetaile = [];
            basketList = [];

            // [주문 객체] 주소
            order['addressCode'] = parseInt(document.querySelector("#addressList").value);

            // [주문 객체] 결제정보
            Array.from(document.querySelectorAll("input[name='pay_chk']")).forEach(function(item, index) {
                if (item.checked)
                    order['orderPayment'] = item.value;
            });
            // [주문 객체] 결제금액
            order['paymentPrice'] = parseInt(document.querySelector("#totalPayment").innerHTML.replace(/,/gi, ""));

            // [주문 객체] 주문 유형 (바로구매, 장바구니구매 유형)
            Array.from(document.querySelectorAll('.optionBox')).forEach(function(item, index) {
                if (parseInt(item.getAttribute("data-code")) != 0)
                    basketList.push(item.getAttribute("data-code"));
            });



            // [주문 디테일 객체] 상품번호, 주문정보, 주문가격, 주문개수
            Array.from(document.querySelectorAll(".productBox")).forEach(function(item, index) {
                let productCode = item.getAttribute("data-productcode");
                Array.from(item.querySelectorAll(".optionBox")).forEach(function(item, index) {
                    orderDetaile.push({
                        "productCode": productCode,
                        "orderPrice": item.querySelector(".orderPrice").getAttribute("data-price"),
                        "orderInfo": item.querySelector(".orderInfo").innerHTML,
                        "orderAmount": parseInt(item.querySelector(".orderAmount").innerHTML)
                    });
                });
            });
            order['orderDetailList'] = orderDetaile;
            order['basketList'] = basketList;

            $.ajax({
                type: "POST",
                url: "/payment/orderRequest",
                contentType: "application/json; utf-8",
                data: JSON.stringify(order),
                success: function(result) {
                    location.href = "/";
                },
                error: function() {
                    console.log("실패");
                }
            });

        }

    </script>

    <link rel="stylesheet" href="/css/payment.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/footer.css">

</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
    <div id="wrap">
        <h1>주문결제</h1>
        <div>
            <div>
                <div id="buyerInfo">
                    <div>
                        <span>주문자 정보</span>
                        <div><span>이름</span><span>${sessionScope.account.accountName}</span></div>
                        <div><span>전화번호</span><span>${sessionScope.account.phone}</span></div>
                        <div><span>이메일</span><span>${sessionScope.account.email}</span></div>
                    </div>
                    <div>
                        <div>
                            <span>배송지</span>
                            <span><span class="material-symbols-rounded">add_circle</span>배송지 추가</span>
                        </div>
                        <c:if test="${addressList.size() > 0}">
                            <select id="addressList">
                                <c:forEach items="${addressList}" var="item">
                                    <option value="${item.addressCode}">[${item.addressName}] ${item.postcode} ${item.address} </option>
                                </c:forEach>
                            </select>
                        </c:if>
                        <c:if test="${addressList.size() < 1 }">
                            <p>배송지를 등록해주세요.</p>
                        </c:if>
                    </div>
                    <div>
                        <select>
                            <option value="" selected>배송시 요청사항 선택</option>
                            <option value="">부재 시 경비실에 맡겨주세요</option>
                            <option value="">부재 시 전화주세요.</option>
                            <option value="">부재 시 문앞에 놔주세요.</option>
                            <option value="">요청사항을 직접 입력합니다.</option>
                        </select>
                    </div>
                    <div>
                        <c:if test="${paymentItems.size() > 0}">
                            <span>작품 정보</span>
                            <div id="paymentList">
                                <c:forEach var="item" items="${paymentItems}">
                                    <div class="productBox" data-productcode="${item.productCode}">
                                        <c:forEach var="image" items="${item.productImageList}" end="0">
                                            <div class="productImage">
                                                <a href="product/view/${item.productCode}"><img src="/upload/productimage/${item.sellerId}/${item.productCode}_${item.productName}/${image.productImageUuid}"></a>
                                            </div>
                                        </c:forEach>
                                        <div class="productDetail">
                                            <div class="productName">${item.productName}</div>
                                            <div class="optionBoxList">
                                                <c:forEach var="info" items="${item.basketList}">
                                                    <div class="optionBox" data-code="${info.basketCode}">
                                                        <div class="txt4">
                                                            <div class="orderInfo">${info.orderInfo}</div>
                                                            <div class="orderAmount">${info.productAmount}개</div>
                                                            <div class="orderPrice" data-price="${item.productPrice}">
                                                                <fmt:formatNumber value="${info.productAmount * item.productPrice}"></fmt:formatNumber>원
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                        </c:if>
                    </div>
                </div>
                <div id="payChk">
                    <span>결제수단</span>
                    <div class="radios">

                        <input type="radio" name="pay_chk" value="card" checked><label>신용/체크카드</label>
                        <input type="radio" name="pay_chk" value="bankbook"><label>계좌입금</label>
                        <input type="radio" name="pay_chk" value="phone"><label>휴대폰결제</label>
                    </div>
                </div>
            </div>

            <div id="paymentInfo">
                <div class="txt1">결제정보</div>
                <div class="txt2">
                    <div>
                        <div>상품수</div>
                        <div id="paymentAmount"></div>
                    </div>
                    <div>
                        <div>상품금액</div>
                        <div id="paymentPrice"></div>
                    </div>
                    <div>
                        <div>배송비</div>
                        <div id="paymentDelivery"></div>
                    </div>
                </div>
                <div class="txt3">
                    <div>총 결제금액</div>
                    <div id="totalPayment"></div>
                </div>
                <button class="purchase_btn" type="button" onclick="paymentBtn();">결제하기</button>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>

</html>


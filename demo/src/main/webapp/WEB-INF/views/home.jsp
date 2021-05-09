<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>THE HABOUR COCKTAIL-LOUNGE</title>
    <meta name="Revisit-After" content="5 Days">
    <meta name="Distribution" content="Global">
    <meta name="THE-HABOUR" content="the habour">
    <link rel="stylesheet" href="${contextPath}/resources/css/magnific-popup.css" />
    <link rel="stylesheet" href="${contextPath}/resources/css/styles.css">
    <script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
    <script src="${contextPath}/resources/js/lazyload.min.js"></script>
    <script src="${contextPath}/resources/js/jquery.magnific-popup.js"></script>
    <script src="${contextPath}/resources/js/script.js"></script>
</head>
<body class="has-hero-intent index-template">
<div href="#top-nav" class="scroll-top scroll_to">
    <i class="fas fa-arrow-up"></i>
</div>
<header class="site-header">
    <div class="site-header-desktop">
        <div class="site-header-desktop-primary site-header-desktop-primary--floatable" data-header-sticky>
            <div class="container">
                <nav class="site-nav" id="top-nav">
                    <ul class="site-nav-menu" data-menu-type="desktop">
                        <li>
                            <a class="site-nav-link" href="#"><c:out value="${background.tieudeWelcome}" /></a>
                        </li>
                        <li>
                            <a class="site-nav-link" href="#"><c:out value="${background.sologanHabour}" /></a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</header>
<div class="site-content">
    <main class="site-content__main">
        <section id="hero" class="hero hero--gallery hero--fullheight revealable">
            <div class="hero__content container">
                <p><br></p>
                <p>
                    <img src="/user-photos/${background.logo}" data-alt_text="a close up of a sign"
                        class="fr-fic fr-dib hero-logo" alt="a close up of a sign" style="width: 595px;">
                </p>
                <p><br></p>
                <p><br></p>
                <p><br></p>
                <p><br></p>
                <p><br></p>
                <p><br></p>
                <p><br></p>
                <p><br></p>
                <p><br></p>
                <p><br></p>
                <p><br></p>
                <p><br></p>
            </div>
            <div class="gallery gallery--fit gallery--dimmed">
                <div>
                    <div class="gallery__item gallery__item-enhancement">
                        <picture>
                            <img src="/user-photos/${background.mainPhoto}" alt="The Habour Cocktail-Lounge">
                        </picture>
                    </div>

                </div>
            </div>
        </section>
        <section class="c-two-col--text content container revealable catalogue">
            <div class="row">
                <div class="col-md-12">
                    <h2>Category</h2>
                    <div class="catalogue-menu">
                        <c:forEach items="${listCatalogues}" var="catalogue" varStatus="s">
                            <spring:url
                                    value="#category${catalogue.idCatalogue}" var="jumid" />
                            <a href="${jumid}" class="scroll_to"><c:out value="${catalogue.ten}" /></a>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>

        <c:forEach items="${listCatalogues}" var="catalogue" varStatus="s">
            <c:choose>
                <c:when test="${fn:length(catalogue.menuList) == '0'}">
                    <p></p>
                </c:when>
                <c:otherwise>
                    <spring:url
                            value="category${catalogue.idCatalogue}" var="jumid" />
                    <label id="${jumid}" class="category-label"><c:out value="${catalogue.ten}" /></label>
                </c:otherwise>
            </c:choose>

        <c:forEach items="${catalogue.menuList}" var="menu" varStatus="c">
            <section class="c-split c-split--vcenter revealable">
                <div class="c-split__col c-split__col--empty">
                    <div class="c-split__col-inner">
                        <div class="c-split__image" role="img" aria-label="Habour Negroni over Menu"
                             style="background-image: url('/user-photos/${menu.photos}');">
                        </div>
                    </div>
                </div>
                <div class="c-split__col ">
                    <div class="c-split__col-inner">
                        <div class="c-split__content content">
                            <h2 id="bookmenu" class="h2 c-split__heading"><c:out value="${menu.title}" /></h2>
                            <c:choose>
                                <c:when test="${not empty menu.mota }">
                                    <c:forEach items="${menu.mota}" var="valueMota" >
                                        <c:out value="${valueMota}" /><br>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <p><c:out value="${menu.description}" /></p>
                                </c:otherwise>
                            </c:choose>
                            <p style="margin-top: 40px">Giá Item: <c:out value="${menu.price}" /></p>
                        </div>
                    </div>
                </div>
            </section>
        </c:forEach>
        </c:forEach>

        <section class="c-tout-overlay c-tout-overlay--dimmed revealable"
                 style="background-image: url('/user-photos/${background.footerPhoto}');">
            <div class="container">
                <h2 class="h1"><c:out value="${background.tieuDeCauCamOn}" /></h2>
                <p><c:out value="${background.noiDungCauCamOn}" /></p>
            </div>
        </section>
    </main>
</div>
<!-- Messenger Plugin chat Code -->
<div id="fb-root"></div>
<script>
    window.fbAsyncInit = function() {
        FB.init({
            xfbml            : true,
            version          : 'v10.0'
        });
    };

    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = 'https://connect.facebook.net/vi_VN/sdk/xfbml.customerchat.js';
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>

<!-- Your Plugin chat code -->
<div class="fb-customerchat"
     attribution="page_inbox"
     page_id="104861288250402">
</div>
<footer>
    <div class="site-footer-desktop">
        <div class="site-footer-desktop-primary" data-footer-sticky>
            <div class="site-footer-desktop-primary__container container">
                <ul class="social-accounts">
                    <li><a href="https://www.facebook.com/TheHabourCocktail/" target="_blank" rel="noopener" data-bb-track="button" data-bb-track-on="click" data-bb-track-category="Social Icons" data-bb-track-action="Click" data-bb-track-label="Facebook, Footer"><span class="fa fa-facebook-f" aria-hidden="true"></span><span class="sr-only">Facebook</span></a></li>
                    <li><a href="https://www.instagram.com/thehabour.cocktail_lounge/?igshid=c5gvbrnn6m0k&amp;fbclid=IwAR1dzpjBEKUBnje1I64cWgiMQaKsZGg-pU-So32CmkazlKbMyRcEOAQ2g4E" target="_blank" rel="noopener" data-bb-track="button" data-bb-track-on="click" data-bb-track-category="Social Icons" data-bb-track-action="Click" data-bb-track-label="Instagram, Footer"><span class="fa fa-instagram" aria-hidden="true"></span><span class="sr-only">Instagram</span></a></li>
                    <li><a href="#" target="_blank" rel="noopener" data-bb-track="button" data-bb-track-on="click" data-bb-track-category="Social Icons" data-bb-track-action="Click" data-bb-track-label="spotify, Footer"><span class="fa fa-spotify" aria-hidden="true"></span><span class="sr-only">spotify</span></a></li>
                </ul>
                <nav class="site-nav">
                    <ul class="site-nav-menu">
                        <li>
                            <a class="site-nav-link" href="https://goo.gl/maps/wguUB7TSATEfXrk68" target="_blank"
                               rel="noopener">22 khu tap the lam tuong, to hieu, Hai Phong</a>
                        </li>
                        <li>
                            <a class="site-nav-link" href="tel:2082 252 2922">082 252 2922</a>
                        </li>
                        <li>
                            <a class="site-nav-link" href=" ">Contact Us</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

</footer>

</body>

</html>
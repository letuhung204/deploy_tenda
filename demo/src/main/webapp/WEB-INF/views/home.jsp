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
    <link rel="stylesheet" href="${contextPath}/resources/css/magnific-popup.css" />
    <link rel="stylesheet" href="${contextPath}/resources/css/styles.css">
    <script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
    <script src="${contextPath}/resources/js/lazyload.min.js"></script>
    <script src="${contextPath}/resources/js/jquery.magnific-popup.js"></script>
    <script src="${contextPath}/resources/js/script.js"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/fontawesome.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/brands.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/solid.css">
</head>
<body class="has-hero-intent index-template">
<div href="#top-nav" class="scroll-top scroll_to">
    <i class="fas fa-arrow-up"></i>
</div>
<header class="site-header">
    <a href="#main-content" class="skip">Skip to main content</a>
    <div class="site-header-desktop">
        <div class="site-header-desktop-primary site-header-desktop-primary--floatable" data-header-sticky>
            <div class="container">
                <div class="site-logo">
                    <a class="site-logo__btn" href="/">
                        <img class="site-logo__expanded"
                             src="https://images.getbento.com/accounts/e8eee6aef7c2e8242e267a82a199ac35/media/images/18365dante-cream.png"
                             alt="Caffe Dante Home" />
                        <img class="site-logo__collapsed"
                             src="https://images.getbento.com/accounts/e8eee6aef7c2e8242e267a82a199ac35/media/images/31247Dante_-sticky.png"
                             alt="dante sticky logo" />
                    </a>
                </div>
                <nav class="site-nav" id="top-nav">
                    <ul class="site-nav-menu" data-menu-type="desktop">
                        <li>
                            <a class="site-nav-link " href="#">Welcome</a>
                        </li>
                        <li>
                            <a class="site-nav-link   " href="#">TO-GO · The Habour Cocktail-Lounge</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</header>
<div class="site-content">
    <main class="site-content__main">
        <h1 class="sr-only">Home</h1>
        <span id="main-content" class="sr-only">Main content starts here, tab to start navigating</span>
        <section id="hero" class="hero hero--gallery hero--fullheight revealable">
            <div class="hero__content container">
                <p><br></p>
                <p><img src="${contextPath}/resources/imgs/logo/The%20Habour_logo_white-05.png" data-alt_text="a close up of a sign"
                        class="fr-fic fr-dib hero-logo" alt="a close up of a sign" style="width: 595px;"></p>
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
                <p style="text-align: center;"><a href="https://dante-101040.square.site/" rel="noopener noreferrer"
                                                  target="_blank"></a></p>
            </div>
            <div class="gallery gallery--fit gallery--dimmed">
                <div>
                    <div class="gallery__item gallery__item-enhancement">
                        <picture>
                            <source media="(max-width: 559px)" sizes="100vw" srcset="${contextPath}/resources/imgs/bg/_MG_9796.jpg">
                            <source media="(min-width: 560px) and (max-width: 767px)" sizes="100vw"
                                    srcset="${contextPath}/resources/imgs/bg/_MG_9796.jpg">
                            <source media="(min-width: 767px) and (max-width: 1024px)" sizes="100vw"
                                    srcset="${contextPath}/resources/imgs/bg/_MG_9796.jpg">
                            <source media="(min-width: 1024px)" sizes="100vw" srcset="${contextPath}/resources/imgs/bg/_MG_9796.jpg">
                            <img src="${contextPath}/resources/imgs/bg/_MG_9796.jpg" alt="The Habour Cocktail-Lounge">
                        </picture>
                    </div>
                    <div class="gallery__item gallery__item-fallback" data-src="${contextPath}/resources/imgs/bg/_MG_9796.jpg">
                        <img class="sr-only" alt="The Habour Cocktail-Lounge">
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
                        <div class="c-split__image" role="img" aria-label="Dante Negroni over Menu"
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
                            <h3 style="margin-top: 40px">Giá Item: <c:out value="${menu.price}" /></h3>
                        </div>
                    </div>
                </div>
            </section>
        </c:forEach>
        </c:forEach>

        <section class="c-tout-overlay c-tout-overlay--dimmed revealable"
                 style="background-image: url('${contextPath}/resources/imgs/bg/_MG_9826.jpg');">
            <div class="container">
                <h2 class="h1">Thank You For Your Visiting</h2>
                <p>Hope to see you again</p>
            </div>
        </section>
    </main>
</div>
<footer>
    <div class="site-footer-desktop">
        <div class="site-footer-desktop-primary" data-footer-sticky>
            <div class="site-footer-desktop-primary__container container">
                <ul class="social-accounts">
                    <li><a href="https://www.facebook.com/TheHabourCocktail/" target="_blank" rel="noopener"
                           data-bb-track="button" data-bb-track-on="click" data-bb-track-category="Social Icons"
                           data-bb-track-action="Click" data-bb-track-label="Facebook, Footer"><span
                            class="fa fa-facebook-f" aria-hidden="true"></span><span
                            class="sr-only">Facebook</span></a></li>
                    <li><a href="#" target="_blank" rel="noopener"
                           data-bb-track="button" data-bb-track-on="click" data-bb-track-category="Social Icons"
                           data-bb-track-action="Click" data-bb-track-label="Instagram, Footer"><span
                            class="fa fa-instagram" aria-hidden="true"></span><span
                            class="sr-only">Instagram</span></a></li>
                    <li><a href="#" target="_blank"
                           rel="noopener" data-bb-track="button" data-bb-track-on="click"
                           data-bb-track-category="Social Icons" data-bb-track-action="Click"
                           data-bb-track-label="spotify, Footer"><span class="fa fa-spotify"
                                                                       aria-hidden="true"></span><span class="sr-only">spotify</span></a></li>
                </ul>
                <nav class="site-nav">
                    <ul class="site-nav-menu">
                        <li>
                            <a class="site-nav-link" href="https://goo.gl/maps/wguUB7TSATEfXrk68" target="_blank"
                               rel="noopener">22 Khu Tập Thể Lâm Tường ,Tô Hiệu ,Hải Phòng</a>
                        </li>
                        <li>
                            <a class="site-nav-link" href="tel:212-982-5275">(212) 982-5275</a>
                        </li>
                        <li>
                            <a class="site-nav-link" href=" ">Contact Us</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="site-footer-desktop-secondary">
            <div class="site-powered-by">
                <a href="https://getbento.com/?utm_source=footer&amp;utm_campaign=dante-nyc.com" target="_blank"
                   rel="noopener">powered by BentoBox</a>
            </div>
        </div>
    </div>
</footer>
</body>

</html>
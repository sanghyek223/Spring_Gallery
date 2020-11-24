<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>PTGK</title>
<meta content="" name="descriptison">
<meta content="" name="keywords">

<link rel="stylesheet"
	href="/resources/assets/web/assets/mobirise-icons2/mobirise2.css">
<link rel="stylesheet"
	href="/resources/assets/web/assets/mobirise-icons/mobirise-icons.css">
<link rel="stylesheet" href="/resources/assets/tether/tether.min.css">
<link rel="stylesheet"
	href="/resources/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/resources/assets/bootstrap/css/bootstrap-grid.min.css">
<link rel="stylesheet"
	href="/resources/assets/bootstrap/css/bootstrap-reboot.min.css">
<link rel="stylesheet" href="/resources/assets/dropdown/css/style.css">
<link rel="stylesheet" href="/resources/assets/socicon/css/styles.css">
<link rel="stylesheet" href="/resources/assets/theme/css/style.css">
<link rel="preload" as="style"
	href="/resources/assets/mobirise/css/mbr-additional.css">
<link rel="stylesheet"
	href="/resources/assets/mobirise/css/mbr-additional.css"
	type="text/css">


</head>


<body>

	<header>
		<tiles:insertAttribute name="siteTop" />
	</header>

	<main>
		<tiles:insertAttribute name="content" />
	</main>

	<footer>
		<tiles:insertAttribute name="siteBottom" />
	</footer>


</body>
</html>
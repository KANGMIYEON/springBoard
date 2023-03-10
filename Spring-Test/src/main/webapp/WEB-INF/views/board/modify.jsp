<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
<h1>Board Modify Page</h1>
	<form action="/board/modify" method="post" enctype="multipart/form-data">
		<div class="mb-3">
			<label for="formGroupExampleInput" class="form-label">Bno</label> <input
				type="text" class="form-control" id="formGroupExampleInput"
				name="bno" value="${board.bno}" readonly>
		</div>
		<div class="mb-3">
			<label for="formGroupExampleInput" class="form-label">Title</label> <input
				type="text" class="form-control" id="formGroupExampleInput"
				name="title" value="${board.title}">
		</div>
		<div class="mb-3">
			<label for="formGroupExampleInput2" class="form-label">Writer</label>
			<input type="text" class="form-control" id="formGroupExampleInput2"
				name="writer" value="${board.writer}" readonly>
		</div>
		<div class="mb-3">
			<label for="formGroupExampleInput" class="form-label">RegisterDate</label>
			<input type="text" class="form-control" id="formGroupExampleInput"
				name="registerDate" value="${board.registerDate}" readonly></input>
		</div>
		<div class="mb-3">
			<label for="formGroupExampleInput" class="form-label">Content</label>
			<textarea type="text" class="form-control" id="formGroupExampleInput"
				name="content">${board.content}</textarea>
		</div>
		
		<!-- file ???????????? -->
	<div class="form-group">
		<ul>
			<c:forEach items="${fList }" var="fvo">
				<!-- ????????? ????????? ??? ??? ??????????????? li ?????? -->
				<li class="list-group-item d-flex justify-content-between align-items-start">
					<li>
						<c:choose>
							<c:when test="${fvo.file_type > 0}">
								<div>
									<!-- D:~fileUpload/2022/12/28/sky.jpg -->
									<img src="/upload/${fn:replace(fvo.save_dir,'\\','/')}/${fvo.uuid}_th_${fvo.file_name}"> <!-- ?????????????????? ?????????????????? ??????, ???????????? ?????? ???????????? -->
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<!-- ???????????? ???????????? ????????? ?????? ???????????? ???????????? ??? -->
								</div>
							</c:otherwise>
						</c:choose>
						<!-- ????????????, ?????????, ????????? -->
						<div class="ms-2 me-auto">
						<div class="fw-bold">${fvo.file_name }</div>
						${fvo.reg_at }
						</div>
						<span class="badge bg-secondary reounded-pill">${fvo.file_size} Byte</span>
						<button type="button" data-uuid=${fvo.uuid } class="btn btn-sm btn-danger py-0 file-x">X</button>
					</li>
				
			</c:forEach>
		</ul>
	</div>
	
	<!-- ????????? ?????? ???????????? -->
	<!-- ?????? ????????? -->
		<div class="col-12 d-grid">
  			<input class="form-control" type="file" style="display: none;"
  				 id="files" name="files" multiple> <!-- multiple : ?????? ????????? ????????? ?????? -->
  			<button type="button" id="trigger" class="btn btn-outline-primary btn-block d-block">Files Upload</button>
		</div>
		<!-- ????????? ????????? ?????? -->	
		<div class="col-12" id="fileZone">

		</div>
		
		<button type="submit" class="btn btn-outline-dark" id="regBtn">??????</button>
	</form>
		<!-- js ?????? -->
	<script src="/resources/js/boardRegister.js"></script>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>
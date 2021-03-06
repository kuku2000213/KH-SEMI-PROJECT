<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ include file="/views/layout/import.jsp"%>
<style>
/*공통*/
	a:link{color: black;text-decoration: none;}
	a:visited{color: black; text-decoration: none;}
	a:hover{color: green; text-decoration: none;}

/*고민게시판*/
	.worry-board{padding: 0 20px;}
	.sub-title{font-size : small;
				color: #666;}
	
	.board-best-wrap, .wait-comment-wrap{
		height : 190px;
		vertical-align:center;
		display:none;}
	
	.board-best-wrap{display : block;} 
	
	#rank10>li, #old-list>li{
		display:inline-block; 
		width: 470px; 
		margin: 2px 15px;
		border-bottom:1px dotted #666;}
		
	#rank10>li>a, #old-list>li>a{  
		display:inline-block;
		width:370px;
		white-space: nowrap;
	  	overflow: hidden;
	  	text-overflow: ellipsis;
	  	margin-right:5px;}
	
	#rank10>li>span, #old-list>li>span{vertical-align:top;}
	
	.rank-num, .rank-dash{margin:2px 5px 2px 2px;}
			
	
	    
	.worry-board-top{position: relative;}
	    
	#worry-btn1, #worry-btn2{position: absolute;
							 bottom: -32px;}
	#worry-btn1{left:490px;}
	#worry-btn2{right:497px;}
	
	
	
	/*게시글*/
	.worry-list{/* background-color: orange; */
				position: relative;
				height: 400px;
				margin-top: 35px;}
				
	.list-order{display:flex;
				justify-content:flex-end;
				padding:5px 7px 0 0;
				margin-bottom:5px;}
				
	.worry-table{collapse:collapse;
			     border-top:1px solid #666;
			     border-bottom:1px solid #666;
				 width:1030px;}
		  
	.worry-table>thead>tr>th,
	.worry-table>tbody>tr>td{border-bottom : 1px solid #666;
		  					 text-align: center;}
		  					 
	.worry-table>tbody>tr>td{height:30px;}
		  					 
	.worry-table>tbody>tr>td>a{white-space: nowrap;
							  	overflow: hidden;
							  	text-overflow: ellipsis;}
	
	#write-btn{color:white;
			   background-color:black;
			   position:absolute;
			   bottom:0;
			   right:0;}
	
	#worry-table-btn{position:absolute;
					 bottom:0;
					 left:50%;}
	
	.worry-list-filter{display:flex;
					   justify-content:center;}
					   
	#worry-list-select{margin:36px 8px;}	
 
</style>


</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>
		<hr>
            <h2>고민 게시글 <span class="sub-title">여러분의 피부고민 다른 분들과 공유해보세요</span></h2>
			<hr>
			<div class="worry-board">
				<div class="worry-board-top">
					<section class="board-best">
						<div class="board-best-wrap">
	                    <h3>베스트 고민글</h3>
		                    <ol id="rank10">
		                        <li><span class="rank-num">01</span><a href="#">미백에 좋다는 화장품 다 써봤는데 효과가 없어요 도와주세요 제발제발</a><span>(1000)</span></li>
		                        <li><span class="rank-num">02</span><a href="#">제목</a><span>(조회수)</span></li>
		                        <li><span class="rank-num">03</span><a href="#">제목</a><span>(조회수)</span></li>
		                        <li><span class="rank-num">04</span><a href="#">제목</a><span>(조회수)</span></li>
		                        <li><span class="rank-num">05</span><a href="#">제목</a><span>(조회수)</span></li>
		                        <li><span class="rank-num">06</span><a href="#">제목</a><span>(조회수)</span></li>
		                        <li><span class="rank-num">07</span><a href="#">제목</a><span>(조회수)</span></li>
		                        <li><span class="rank-num">08</span><a href="#">제목</a><span>(조회수)</span></li>
		                        <li><span class="rank-num">09</span><a href="#">제목</a><span>(조회수)</span></li>
		                        <li><span class="rank-num">10</span><a href="#">제목</a><span>(조회수)</span></li>
		                    </ol>
	                    </div>
	                </section>
					<section class="wait-comment">
						<div class="wait-comment-wrap">
	                    <h3>답글을 기다리는 고민</h3>
		                    <ul id="old-list">
		                        <li><span class="rank-dash">-</span><a href="#">제목</a><span>(조회수)</span></li>
		                        <li><span class="rank-dash">-</span><a href="#">제목</a><span>(조회수)</span></li>
		                        <li><span class="rank-dash">-</span><a href="#">제목</a><span>(조회수)</span></li>
		                        <li><span class="rank-dash">-</span><a href="#">제목</a><span>(조회수)</span></li>
		                        <li><span class="rank-dash">-</span><a href="#">제목</a><span>(조회수)</span></li>
		                        <li><span class="rank-dash">-</span><a href="#">제목</a><span>(조회수)</span></li>
		                        <li><span class="rank-dash">-</span><a href="#">제목</a><span>(조회수)</span></li>
		                        <li><span class="rank-dash">-</span><a href="#">제목</a><span>(조회수)</span></li>
		                        <li><span class="rank-dash">-</span><a href="#">제목</a><span>(조회수)</span></li>
		                        <li><span class="rank-dash">-</span><a href="#">제목</a><span>(조회수)</span></li>
		                    </ul>
	                    </div>
	                </section>
	                <button id="worry-btn1" class="btn-standard" type="button" value="1">1</button>
	                <button id="worry-btn2" class="btn-standard" type="button" value="2">2</button>
	               </div>
                <section class="worry-list">
                	<div class="list-order">
	                    <select name="select-view">
	                        <option value="new">최신순</option>
	                        <option value="popular">인기순</option>
	                    </select>
                    </div>
                    <table class="worry-table">
                    	<thead>
                        <tr>
                            <th width="10%;" height="40px;">게시글 번호</th>
                            <th width="60%;">게시글 제목</th>
                            <th width="10%;">글쓴이</th>
                            <th width="10%;">작성일</th>
                            <th width="10%;">추천수</th>
                        </tr>
                        </thead>
                        <tbody>
                        	<tr>
                        		<td>1</td>
                        		<td><a href="<%= request.getContextPath() %>/views/worry/worryRead.jsp">얼굴에 좁쌀 여드름이 자꾸 나요</a></td>
                        		<td><a href="#">노홍철</a></td>
                        		<td>2020.03.28</td>
                        		<td>1</td>
                        	</tr>
                        </tbody>
                    </table>
                    <button id="write-btn" class="btn-standard" type="button" value="글쓰기" onclick="location.href='<%= request.getContextPath() %>/views/worry/worryWrite.jsp'">글쓰기</button>
               	 	<button id="worry-table-btn" class="btn-standard" type="button" value="1">1</button>
                </section>
                <form class="worry-list-filter" name="worry-board-form">
                    <div class="worry-list-filter-wrap">
		            <select id="worry-list-select" name="select-worry">
		                <option value="total">전체</option>
		                <option value="writer">작성자</option>
		                <option value="text">내용</option>
		            </select>
		                <span class="sch">
		                 <button type="button"><img src="<%= request.getContextPath() %>/resources/images/search_icon.png"></button>
		                 <input type="text">
		                </span>
		            </div>
                </form>
		</div>
	</div>

	<script>
	$(function(){
		$('#worry-btn1').click(function(){
			$('.board-best-wrap').css('display','block');
			$('.wait-comment-wrap').css('display','none');
		});
		$('#worry-btn2').click(function(){
			$('.wait-comment-wrap').css('display','block');
			$('.board-best-wrap').css('display','none');
		});
	});
	</script>
	<%@ include file="/views/layout/footer.jsp"%>

	<script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
	
</body>
</html>
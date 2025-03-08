<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%
var score_A = 0;
var score_B = 0;
%>

</head>

<body>
	<!-- game_screen -->
	<div style="margin:30px 30px;">
		<!-- 점수판, reset 버튼 div -->
		<div style="display:grid; grid-template-columns:3fr 1fr;">
			<!-- 점수판 -->
			<div style="display:grid; grid-template-columns:1fr 1fr 1fr; text-align:center; margin:0px 20px; font-weight:bold;">
				<div id="score_A" style="display:inline-block;"><%=score_A %></div>
				<div style="display:inline-block;">:</div>
				<div id="score_B" style="display:inline-block;"><%=score_B %></div>
			
			</div>

			<!-- reset 버튼 -->
			<div style="display:inline-block;">
				<button style="backgruond-color:lightgray; border-radius: 10px; width:70%;" onclick="reset()">reset</button>
			</div>
		</div>
		
		<br><br>
		
		<div style="margin:0px 20px; text-align:center;">
			<!-- 결과 출력 -->
			<div style="display:grid; grid-template-columns:1fr 1fr; gap:10px;">
				<div>Opponent</div>
				<div>Me</div>
				
				<div id="select_A" style="border:solid 1px black; border-radius:10px; padding:10px;">
				-
				</div>
				<div id="select_B" style="border:solid 1px black; border-radius:10px; padding:10px;">
				-
				</div>
				
			</div>
			
			<hr style="margin:20px 0px;">
			
			<!-- 가위 바위 보 선택 버튼-->
			<div style="display:grid; grid-template-columns:1fr 1fr 1fr; gap:10px; ">
				<button id="btn_S" onclick="select_option('rock')" style="border:solid 1px black; border-radius:10px; padding:10px; background-color:white;">
				rock
				</button>
				<button id="btn_P" onclick="select_option('paper')" style="border:solid 1px black; border-radius:10px; padding:10px; background-color:white;">
				paper
				</button>
				<button id="btn_R" onclick="select_option('scissor')" style="border:solid 1px black; border-radius:10px; padding:10px; background-color:white;">
				scissor
				</button>
			</div>
		</div>
	</div>

</body>
</html>
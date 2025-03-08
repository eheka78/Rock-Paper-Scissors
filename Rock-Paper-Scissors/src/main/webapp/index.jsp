<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body style="margin:auto; background-color:#95B2F7; padding:50px 0px;">

	<div id="notify_result" style="position:fixed; display:none; background-color:rgba(255, 255, 255, 0.5); width:100%; height:100%;
		top:0; left:0; z-index:1000; margin:auto; justify-content:center; align-items:center;">
		<div id="notify_result_text" style="text-align:center; font-size:24px; font-weight:bold; color:black;"></div>
	</div>

	<div style="width:35%; margin:auto; background-color:white; padding:30px;">
	
		<!-- 제목 -->
		<div style="text-align:center; padding-bottom:10px; font-size:30px; font-weight:bold;">Rock-Paper-Scissors</div>
	
	
		<!-- 게임 영역 선택 -->
		<div style="text-align:center; padding:10px;">
			<select id="game" name="game" style="height:30px; width:150px; text-align:center; border-radius:15px;">
				<option value="RPS_A">가위 바위 보</option>
				<option value="RPS_B">묵찌빠</option>
			</select>
		</div>
		
		
		<br><br>
		
		
		<!-- 게임 하는 영역 -->
		<!-- fetch되는 영역 -->
		<div id="game_screen" style="width:100%; margin:auto; border:solid 1px black;">
			
		</div>
		
		
		
		
		<script>
			var RPS_arr = new Array("rock", "paper", "scissor");
			var oponent_select = 0;
			var me_select = 0;
			
			function reset() {
				display_result();
					
				setTimeout(function() {
					document.getElementById("score_A").innerText = 0;
					document.getElementById("score_B").innerText = 0;
	            }, 1500);			
			}
			
			function select_option(op){
				if(op === "scissor"){
					console.log("select scissor");
					document.getElementById("select_B").innerText = "scissor";
					me_select = 2;
				} else if(op === "paper"){
					console.log("select paper");
					document.getElementById("select_B").innerText = "paper";
					me_select = 1;
				} else if(op === "rock"){
					console.log("select rock");
					document.getElementById("select_B").innerText = "rock";
					me_select = 0;
				}
				
				random_select_A();
				calculate_score();
			}
			
			function random_select_A(){
				var temp = Math.floor(Math.random() * 3);
				document.getElementById("select_A").innerText = RPS_arr[temp];
				oponent_select = temp;
			}
			
			function calculate_score(){
				if(me_select - oponent_select > 0){
					console.log("result: win");
					document.getElementById("score_B").innerText = parseInt(document.getElementById("score_B").innerText) + 1;
				} else if(me_select - oponent_select < 0){
					console.log("result: lose");
					document.getElementById("score_A").innerText = parseInt(document.getElementById("score_A").innerText) + 1;
				} else{
					console.log("result: draw");
				}
				
			}
			
			function display_result(){
				var temp1 = parseInt(document.getElementById("score_A").innerText);
				var temp2 = parseInt(document.getElementById("score_B").innerText);
				
	
				document.getElementById("notify_result").style.display = "none"; 
				
				if(temp1 - temp2 > 0){
					document.getElementById("notify_result_text").innerText = "YOU LOSE";
				} else if(temp1 - temp2 < 0){
					document.getElementById("notify_result_text").innerText = "YOU WIN!";
				} else{
					document.getElementById("notify_result_text").innerText = "DRAW";
				}
				
				document.getElementById("notify_result").style.display = "flex"; 
				
	            setTimeout(function() {
	            	document.getElementById("notify_result").style.display = "none"; 
	            }, 1500);
				
			}
	    </script>
		
		
		
		
		<script>
			// 선택된 값에 따라 서버에서 데이터를 받아와 화면을 업데이트하는 함수
			async function updateGameScreen(selectedValue) {
				console.log("선택된 값: " + selectedValue);
				if (selectedValue === "RPS_A") {
					try {
						const response = await fetch("RPS_A.jsp");
						if (!response.ok) {
							throw new Error("네트워크 응답에 문제가 있습니다.");
						}
						// 서버가 텍스트 데이터를 반환한다고 가정
						console.log("fetch 호출 시작");
						const data = await response.text();
						const gameScreen = document.getElementById("game_screen");
						if (gameScreen) {
							gameScreen.innerHTML = data;
						}
					} catch (error) {
						console.error("데이터 로딩 중 오류 발생:", error);
					}
				} else if (selectedValue === "RPS_B") {
					try {
						const response = await fetch("RPS_B.jsp");
						if (!response.ok) {
							throw new Error("네트워크 응답에 문제가 있습니다.");
						}
						// 서버가 텍스트 데이터를 반환한다고 가정
						console.log("fetch 호출 시작");
						const data = await response.text();
						const gameScreen = document.getElementById("game_screen");
						if (gameScreen) {
							gameScreen.innerHTML = data;
						}
					} catch (error) {
						console.error("데이터 로딩 중 오류 발생:", error);
					}
				}
			}
			
		    document.addEventListener("DOMContentLoaded", function() {
	    		console.log("DOM fully loaded");
		        const gameSelect = document.getElementById("game");
		        if (gameSelect) {
		        	// 페이지 로드시 현재 선택된 값에 대해 실행
		        	updateGameScreen(gameSelect.value);
		        	// select 요소의 change 이벤트 리스너 등록
		        	gameSelect.addEventListener("change", function() {
		        		updateGameScreen(this.value);
		        	});
		        }
		    });
		</script>
		
		
	</div>	
	

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>

<script>
var RPS_arr = new Array("rock", "paper", "scissor");
var cnt = 0;
var oponent_select = 0;
var me_select = 0;
var game_value = document.getElementById("game").value;
var middle_winner = "";
</script>
</head>
<body style="margin:auto; background-color:#95B2F7; padding:50px 0px;">

	<div id="notify_result" style="position:fixed; display:none; background-color:rgba(255, 255, 255, 0.5); width:100%; height:100%;
		top:0; left:0; z-index:1000; margin:auto; justify-content:center; align-items:center;">
		<div id="notify_result_text" style="text-align:center; font-size:24px; font-weight:bold; color:black;"></div>
	</div>
	
	<div id="notify_info_RPS_A" style="position:fixed; display:none; background-color:rgba(255, 255, 255, 0.5); width:100%; height:100%;
		top:0; left:0; z-index:1000; margin:auto; justify-content:center; align-items:center;">
		<div id="notify_info_RPS_A_text" style="text-align:center; font-size:20px; font-weight:bold; color:black; padding:0px 80px;">
		<button onclick="hide_info_RPS()" style="width:50px; height:30px; background-color:white; border-radius:15px;">X</button>
		<br><br>
		1. When more than two people shout "Rock, Paper, Scissors," they simultaneously throw either Rock, Paper, or Scissors when saying "Paper." It is also common to add a chant, such as "If you don’t throw, you lose, rock, paper, scissors," though this chant is not used if repeated more than twice.
		<br><br>
		2. In the game, Rock beats Scissors, Scissors beats Paper, and Paper beats Rock.
		<br><br>
		3. Paper can wrap Rock, Rock can crush Scissors, and Scissors can cut Paper, which is why these rules are established.
		<br><br>
		4. When two players play Rock, Paper, Scissors and both throw the same hand shape, it results in a tie.

		
		</div>
	</div>
	
	<div id="notify_info_RPS_B" style="position:fixed; display:none; background-color:rgba(255, 255, 255, 0.5); width:100%; height:100%;
		top:0; left:0; z-index:1000; margin:auto; justify-content:center; align-items:center;">
		<div id="notify_info_RPS_B_text" style="text-align:center; font-size:20px; font-weight:bold; color:black;  padding:0px 80px;">
		<button onclick="hide_info_RPS()" style="width:50px; height:30px; background-color:white; border-radius:15px;">X</button>
		<br><br>
		1. In general, Rock, Paper, Scissors is used to determine the starting player, and the game is repeated until a winner is determined. Once a winner is found, the game transitions to Muk-Jji-Ppa with the current state. (Sometimes, this process can be boring, so it's played in groups or rounds.)
		<br><br>
		2. Unless specified otherwise, the attacker (first player) must always announce the hand shape they are showing. The defender must either change their hand shape or stay still at the same time as the attacker's move. Changing the hand shape too early or too late is considered a foul.
		<br><br>
		3. If the attacker and defender tie, the outcome is decided based on the hand shapes shown by both, and the winner gets the attacking role.
		<br><br>
		4. Following these rules, the attack and defense roles switch back and forth and the game continues.
		</div>
	</div>

	<div style="width:35%; margin:auto; background-color:white; padding:30px;">
	
		<!-- 제목 -->
		<div style="text-align:center; padding-bottom:10px; font-size:30px; font-weight:bold;">Rock-Paper-Scissors</div>
	
	
		<!-- 게임 영역 선택 -->
		<div style="text-align:center; padding:10px;">
			<select id="game" name="game" style="height:30px; width:150px; text-align:center; border-radius:15px; font-weight:bold;">
				<option value="RPS_A">가위 바위 보</option>
				<option value="RPS_B">묵찌빠</option>
			</select>
		</div>
		
		<!-- information -->
		<div onclick="reveal_info_RPS()" style="text-decoration:underline solid 1px; font-size:10px; float:right;">
		information
		</div>
		
		<script>
		function reveal_info_RPS(){
			game_value = document.getElementById("game").value;
			if(game_value == "RPS_A"){
				document.getElementById("notify_info_RPS_A").style.display = "flex";
			}else if(game_value == "RPS_B"){
				document.getElementById("notify_info_RPS_B").style.display = "flex";
			}
		}
		
		function hide_info_RPS(){
			game_value = document.getElementById("game").value;
			if(game_value == "RPS_A"){
				document.getElementById("notify_info_RPS_A").style.display = "none";
			}else if(game_value == "RPS_B"){
				document.getElementById("notify_info_RPS_B").style.display = "none";
			}
		}
		</script>
		
		<br><br>
		
		
		<!-- 게임 하는 영역 -->
		<!-- fetch되는 영역 -->
		<div id="game_screen" style="width:100%; margin:auto; border:solid 1px black;">
			
		</div>
		
		
		
		
		<script>			
			function reset() {
				reset_value();
				display_result();
					
				setTimeout(function() {
					document.getElementById("score_A").innerText = 0;
					document.getElementById("score_B").innerText = 0;
	            }, 1500);
			}
			
			function select_option(op){
				cnt++;
				
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
				
				console.log("ASDD" + game_value);
				random_select_A();
				game_value = document.getElementById("game").value;
				if(game_value == "RPS_A"){
					console.log("AAAAAAAAAAAAAAAAAAAAAAAAAAA");
					calculate_score_1();
				} else if(game_value == "RPS_B"){
					calculate_score_2();

					console.log("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
				}
			}
			
			function reset_value(){
				cnt = 0;
				middle_winner = "";

				document.getElementById("select_A").style.border = "1px solid black";
				document.getElementById("select_B").style.border = "1px solid black";
			}
			
			
			function random_select_A(){
				var temp = Math.floor(Math.random() * 3);
				document.getElementById("select_A").innerText = RPS_arr[temp];
				oponent_select = temp;
			}
			
			/* 가위 바위 보 */
			function calculate_score_1(){
				if(me_select - oponent_select == 1 || me_select - oponent_select == -2){
					console.log("result: win");
					document.getElementById("score_B").style.textDecoration = "underline";
					document.getElementById("score_B").style.textDecorationThickness = "4px";
					document.getElementById("score_A").style.textDecoration = "none";
					document.getElementById("score_A").style.textDecorationThickness = "none";
					document.getElementById("score_B").innerText = parseInt(document.getElementById("score_B").innerText) + 1;
				} else if(me_select - oponent_select == -1 || me_select - oponent_select == 2){
					console.log("result: lose");
					document.getElementById("score_A").style.textDecoration = "underline";
					document.getElementById("score_A").style.textDecorationThickness = "4px";
					document.getElementById("score_B").style.textDecoration = "none";
					document.getElementById("score_B").style.textDecorationThickness = "none";
					document.getElementById("score_A").innerText = parseInt(document.getElementById("score_A").innerText) + 1;
				} else{
					console.log("result: draw");
				}
				reset_value();
			}
			
			/* 묵찌빠 */
			function calculate_score_2(){
				if(cnt == 1 && me_select == oponent_select){
					reset_value();
				} else {
					if(me_select - oponent_select == 1 || me_select - oponent_select == -2){
						middle_winner = "me";
						document.getElementById("select_B").style.border = "3px solid black";
						document.getElementById("select_A").style.border = "1px solid black";
					} else if(me_select - oponent_select == -1 || me_select - oponent_select == 2){
						middle_winner = "opponent";
						document.getElementById("select_A").style.border = "3px solid black";
						document.getElementById("select_B").style.border = "1px solid black";
					} else{
						if(middle_winner == "opponent"){
							console.log("result: lose");
							document.getElementById("score_A").style.textDecoration = "underline";
							document.getElementById("score_A").style.textDecorationThickness = "4px";
							document.getElementById("score_B").style.textDecoration = "none";
							document.getElementById("score_B").style.textDecorationThickness = "none";
							document.getElementById("score_A").innerText = parseInt(document.getElementById("score_A").innerText) + 1;
						} else if(middle_winner == "me"){
							console.log("result: win");
							document.getElementById("score_B").style.textDecoration = "underline";
							document.getElementById("score_B").style.textDecorationThickness = "4px";
							document.getElementById("score_A").style.textDecoration = "none";
							document.getElementById("score_A").style.textDecorationThickness = "none";
							document.getElementById("score_B").innerText = parseInt(document.getElementById("score_B").innerText) + 1;
						} else if(middle_winner == ""){
							console.log("console: error");
							alert("error");
						}
						reset_value();
					}
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
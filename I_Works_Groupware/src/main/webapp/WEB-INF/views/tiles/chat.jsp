<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!-- <style> -->
<!-- </style> -->

      <div class="support-chat-container">
      <sec:authentication property="principal.emp.empNo" var="empNo"/>
      <!-- 채팅방 내부 -->
        <div class="container-fluid support-chat">
          <div class="card bg-white">
            <div class="card-header d-flex flex-between-center px-4 py-3 border-bottom">
<!--             <button id="openChatModalBtn" class="btn p-0"><svg xmlns="http://www.w3.org/2000/svg" width="16px" height="16px" viewBox="0 0 24 24" fill="currutcolor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left text-900 fs-3"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg></button> -->
              <h5 class="mb-0 d-flex align-items-center gap-2" id="titleBox2">채팅방 제목
              	<span class="fa-solid fa-circle text-success fs--3"></span>
              </h5>
            	<div class="btn-reveal-trigger">
            		 <!-- 검색, 페이징 설정 -->
				    <button class="btn btn-link p-0 dropdown-toggle dropdown-caret-none transition-none d-flex" type="button" id="support-chat-dropdown" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true" aria-expanded="false" data-bs-reference="parent">
				        <span class="fas fa-ellipsis-h text-900"></span>
				    </button>
				    <div class="dropdown-menu dropdown-menu-end py-2" aria-labelledby="support-chat-dropdown">
				    <!-- 채팅폼 시작 -->
					<!-- 채팅 폼 끝 -->
				        <h6 class="dropdown-header">채팅방 목록</h6>
				        <div class="d-flex justify-content-center" >
				        <div class="search-chatBox" style="padding: 10px;">
					        <form  class="position-relative" action="/chatAtagSearch" method="post" data-bs-toggle="search" data-bs-display="static">
					        	<input class="form-control search-input search" type="text" name="chatUserSearch" id="chatUserSearch" aria-label="Search" placeholder="Search..."/>
					        </form>
				        </div>
				        </div>
				        <div id="chatUserList" ></div>
				    </div>
				</div>
            </div>
            <div class="card-body chat p-0">
              <div class="d-flex flex-column-reverse scrollbar h-100 p-3">
              <!-- 채팅방 채팅 부분 -->
                <div class="text-end mt-6" id="chatListContainer">
				</div>
				<!-- 채팅부분 끝 -->
                <div class="text-center mt-auto">
                </div>
              </div>
            </div>
            <div class="card-footer d-flex align-items-center gap-2 border-top ps-3 pe-4 py-3">
              <div class="d-flex align-items-center flex-1 gap-3 border rounded-pill px-4">
                <input class="form-control outline-none border-0 flex-1 fs--1 px-0" id="messageInput2" type="text" placeholder="Write message" />
<!--                 <label class="btn btn-link d-flex p-0 text-500 fs--1 border-0" for="supportChatPhotos"><span class="fa-solid fa-image"></span></label> -->
<!--                 <input class="d-none" type="file" accept="image/*" id="supportChatPhotos" /> -->
<!--                 <label class="btn btn-link d-flex p-0 text-500 fs--1 border-0" for="supportChatAttachment"> <span class="fa-solid fa-paperclip"></span></label> -->
<!--                 <input class="d-none" type="file" id="supportChatAttachment" /> -->
              </div>
              <!-- 입력버튼 -->
              <button class="btn p-0 border-0 send-btn" id="sendMessageBtn2"><span class="fa-solid fa-paper-plane fs--1"></span></button>
            </div>
          </div>
        </div>
		<!-- 채팅방 내부 끝 -->
        <button class="btn p-0 border border-200 btn-support-chat" id="chatIcon"><span class="fs-0 btn-text text-primary text-nowrap">채팅</span><span class="fa-solid fa-circle text-success fs--1 ms-2" id="notiColor"></span><span class="fa-solid fa-chevron-down text-primary fs-1"></span></button>
      </div>
<!-- 	<div class="card p-3 p-xl-1 mt-xl-n1 chat-sidebar me-3 phoenix-offcanvas phoenix-offcanvas-start" id="chatModal"> -->
<!-- 		<button class="btn d-none d-sm-block d-xl-none mb-2" data-bs-toggle="modal" data-bs-target="#chatSearchBoxModal"> -->
<!-- 			<span class="fa-solid fa-magnifying-glass text-600 fs-1"></span> -->
<!-- 		</button> -->
<!-- 		<div class="d-none d-sm-block d-xl-none mb-5"> -->
<!-- 			<button class="btn w-100 mx-auto" type="button" data-bs-toggle="dropdown" data-boundary="window" -->
<!-- 				aria-haspopup="true" aria-expanded="false" data-bs-reference="parent"> -->
<!-- 				<span class="fa-solid fa-bars text-600 fs-1"></span> -->
<!-- 			</button> -->
<!-- 		</div> -->
<!-- 		<div> -->
<!-- 			<button class="btn btn-primary me-1 mb-1 btn-sm align-items-end" type="button" style="width: 110px; float: right;" id="groupChatBtn">그룹채팅방 +</button> -->
<!-- 		</div> -->
<!-- 		<div class="form-icon-container mb-4 d-sm-none d-xl-block"> -->
<!-- 			<input class="form-control form-icon-input" type="text" placeholder="People, Groups and Messages" /> -->
<!-- 			<span class="fas fa-user text-900 fs--1 form-icon"></span> -->
<!-- 		</div> -->
<!-- 		<!-- aria-selected="true" = 버튼이 눌린상태 --> -->
<!-- 		<ul class="nav nav-phoenix-pills mb-5 d-sm-none d-xl-flex" id="contactListTab"  -->
<!-- 	    data-chat-thread-tab="data-chat-thread-tab" role="tablist"> -->
<!-- 	        <li class="nav-item" role="presentation"> -->
<!-- 	        <button class="custom-button" id="searchUser" role="tab" data-chat-thread-list="user" data-bs-toggle="tab" data-chat-thread-list="user">사원</button> -->
<!-- 	        </li> -->
<!-- 	        <li class="nav-item" role="presentation"> -->
<!-- 	        <button class="custom-button" id="searchRoom" role="tab" data-chat-thread-list="room" data-bs-toggle="tab" data-chat-thread-list="room">채팅방</button> -->
<!-- 	    	</li> -->
<!-- 	    </ul> -->
<!-- 	    <div class="scrollbar"> -->
<!-- 		    채팅방 리스트 범위 시작 -->
<!-- 		    <div class="tab-content" id="contactListTabContent"> -->
<!-- 			    <div data-chat-thread-tab-content="data-chat-thread-tab-content" id="chatListBox"> -->
<!-- 			        <ul class="nav chat-thread-tab flex-column list" id="chatUl"> -->
<%-- 			            <c:choose> --%>
<%-- 			                <c:when test="${empty chatList}"> --%>
<!-- 			                    <li class="nav-item read" role="presentation"> -->
<!-- 			                        <p>말하던 상대가 없네요...</p> -->
<!-- 			                    </li> -->
<%-- 			                </c:when> --%>
<%-- 			                <c:otherwise> --%>
<%-- 			                    <c:forEach var="chatList" items="${chatList}"> --%>
<!-- 			                        <li class="nav-item read" role="presentation" style="margin-bottom: 10px;"> -->
<%-- 			                            <a class="nav-link d-flex align-items-center p-2" data-bs-toggle="tab" data-chat-thread="data-chat-thread" href="#" role="tab" aria-selected="true" id="chatUser" data-crno="${chatList.crNo}" data-empno="${chatList.empNo}"> --%>
<!-- 			                                <div class="avatar avatar-xl status-online position-relative me-2 me-sm-0 me-xl-2"> -->
<%-- 			                                    <img class="rounded-circle border border-2 border-white" src="..${chatList.empPhoto}" alt="${chatList.empName}" /> --%>
<!-- 			                                </div> -->
<!-- 			                                <div class="flex-1 d-sm-none d-xl-block text-start" style="margin-left: 50px; line-height: 0px;"> -->
<!-- 			                                    <div class="d-flex flex-column justify-content-between"> -->
<%-- 			                                        <h5 class="text-1000 fw-normal name mb-1" style="font-size: 1rem;">${chatList.empName}</h5> --%>
<%-- 			                                        <p class="fs--2 text-600 mb-0 text-end" style="margin-top: -5px;">${chatList.deptName}</p> --%>
<%-- 			                                        <p class="fs--1 line-clamp-1 text-600 message" style="margin-top: 5px;">${chatList.chatMsg}</p> --%>
<!-- 			                                    </div> -->
<!-- 			                                </div> -->
<!-- 			                            </a> -->
<!-- 			                        </li> -->
<%-- 							        <input type="hidden" name="chatListBoxCrNo" id="chatListBoxCrNo" value="${chatList.crNo}"/>  --%>
<!-- 			                        <hr style="margin: 15px; border-color: #f1f2f6;"> -->
<%-- 			                    </c:forEach> --%>
<%-- 			                </c:otherwise> --%>
<%-- 			            </c:choose> --%>
<!-- 			        </ul> -->
<!-- 			    </div> -->
<!-- 			</div> -->
<!-- 		    유저리스트 범위 끝 -->
<!-- 		</div> -->
<!-- 	</div> -->
      
<script>


var chatEmpNo = "${empNo}";
console.log("실행여부 확인을 위한 chatEmpNo:{}",chatEmpNo);
selectUnreadChat(chatEmpNo);
var ChatEmpNoList = []; // 그룹채팅방 인원 사번(본인 제외)
$(document).ready(function () {
	
	// enter키 적용
	
	$('#messageInput2').on('keypress', function (e) {
        if (e.key === 'Enter') {
            $('#sendMessageBtn2').click();
//             scrollToBottom();
        }
    });
	$('#messageInput').on('keypress', function (e) {
        if (e.key === 'Enter') {
            $('#sendMessageBtn').click();
//             scrollToBottom();
        }
    });
    // 공통 메시지 전송 함수
    function sendMessage(messageInputId, chatMsgBoxesCrNoId) {
        var message = $("#" + messageInputId).val();
        var crNo = $("#" + chatMsgBoxesCrNoId).val();

        if (message && crNo) {
            var data = {
                message: message,
                crNo: crNo
            };
            chatSocket.send(JSON.stringify(data));
            $("#" + messageInputId).val("");
        }
    }

    // sendMessageBtn 클릭 이벤트
    $(document).on('click', '#sendMessageBtn', function () {
        sendMessage("messageInput", "chatMsgBoxesCrNo");
//         scrollToBottom();
    });

    // sendMessageBtn2 클릭 이벤트
    $(document).on('click', '#sendMessageBtn2', function () {
        sendMessage("messageInput2", "chatMsgBoxesCrNo2");
//         scrollToBottom();
    });
    chatSocket.onmessage = function (event) {
    	selectUnreadChat(chatEmpNo);
        var message = event.data;
        console.log("서버로부터 메시지를 받았습니다: " + message);
        // 메시지 처리 로직을 추가
        var messageData = JSON.parse(message);
        var chatMessage = messageData.message;
        var crNo = messageData.crNo;
        var sender = messageData.sender;
        var photo = messageData.photo;

        
        
        // chatListContainer 요소 가져오기
        var chatListContainer = document.getElementById("chatListContainer");
        // chatMain의 chatMessageBody 요소 가져오기
        var chatMessageBody = document.getElementById("chatMessageBody");
        
        const date = new Date();
        const options = { year: 'numeric', month: '2-digit', day: '2-digit', hour: 'numeric', minute: 'numeric', hour12: true };
        const formattedDate = new Intl.DateTimeFormat('en-US', options).format(date);
        // 새로운 채팅 메시지를 HTML로 만들어 추가
        var html = "";
        if (sender == chatEmpNo) {
        	console.log("empNo :"+chatEmpNo);
            html += '<div class="d-flex chat-message"  style = "flex-direction: column;">';
            html += '    <div class="d-flex mb-2 justify-content-end flex-1">';
            html += '        <div class="w-100 w-xxl-75">';
            html += '            <div class="d-flex flex-end-center hover-actions-trigger">';
            html += '                <div class="chat-message-content me-2">';
            html += '                    <div class="mb-1 sent-message-content light bg-primary rounded-2 p-3 text-white">';
            html += '                        <p class="mb-0">' + chatMessage + '</p>';
            html += '                    </div>';
            html += '            		<div class="text-end">';
            html += '                		<p class="mb-0 fs--2 text-600 fw-semi-bold">' + formattedDate + '</p>';
            html += '           		 </div>';
            html += '                </div>';
            html += '            </div>';
            html += '        </div>';
            html += '    </div>';
            html += '</div>';
        }else if (sender == "Y"){
        	html += '';
        }else {
            html += '<div class="d-flex chat-message"  style = "flex-direction: column;">';
            html += '    <div class="d-flex mb-2 flex-1">';
            html += '        <div class="w-100 w-xxl-75">';
            html += '            <div class="d-flex hover-actions-trigger">';
            html += '                <div class="avatar avatar-m me-3 flex-shrink-0" data-empno="' + sender + '"><img class="rounded-circle" src="..' + photo + '" alt=""></div>';
            html += '                <div class="chat-message-content received me-2">';
            html += '                    <div class="mb-1 received-message-content border rounded-2 p-3">';
            html += '                        <p class="mb-0">' + chatMessage + '</p>';
            html += '                    </div>';
            html += '                </div>';
            html += '            </div>';
            html += '            <div class="text-end">';
            html += '            	<p class="mb-0 fs--2 text-600 fw-semi-bold ms-7">' + formattedDate + '</p>';
            html += '            </div>';
            html += '        </div>';
            html += '    </div>';
            html += '</div>';
        }

        // chatMessageBody에 메시지 추가
        chatListContainer.innerHTML += html;
        chatMessageBody.innerHTML += html;
		// chatMessageBody.append();
     	// 스크롤을 가장 아래로 내림
//         scrollToBottom();
    };

//     function scrollToBottom() {
//         var chatListContainer = document.getElementById("chatListContainer");
//         chatListContainer.scrollTop = chatListContainer.scrollHeight;
//         var chatMessageBody = document.getElementById("chatMessageBody");
//         chatMessageBody.scrollTop = chatMessageBody.scrollHeight;
//     };
    document.getElementById("chatUserList").addEventListener("click", function (event) {
        if (event.target.tagName === "A") {
            var empNo = event.target.getAttribute("data-empNo");

            $.ajax({
                type: "POST",
                url: "/chatIconDetail",
                contentType: "application/json",
                data: JSON.stringify({ empNo: empNo }),
                success: function (response) {
                    console.log("받아온 채팅방 정보: ", response);

                    var chatRoomDtlList = response;
                    console.log("받아온 채팅방 chatRoomDtlList: ", chatRoomDtlList);
                    if (chatRoomDtlList != null && chatRoomDtlList.length > 0) {
                        $("#titleBox2").text(chatRoomDtlList[0].crcmTitle);

                        var html = ""; // chatHtml 초기화

                        $.each(chatRoomDtlList, function (index, chatRoomDtl) {
                            html += '<div class="d-flex chat-message" style="flex-direction: column;">';

                            if (chatRoomDtl.chatMsg != null) {
                                // chatRoomDtl.chatMsg가 null이 아닐 때만 채팅 내용 출력
                                if (chatRoomDtl.chatuser == chatRoomDtl.chasenderEmpno) {
                                    html += '<div class="d-flex mb-2 justify-content-end flex-1">';
                                    html += '<div class="w-100 w-xxl-75">';
                                    html += '<div class="d-flex flex-end-center hover-actions-trigger">';
                                    html += '<div class="chat-message-content me-2">';
                                    html += '<div class="mb-1 sent-message-content light bg-primary rounded-2 p-3 text-white">';
                                    html += '<p class="mb-0">' + chatRoomDtl.chatMsg + '</p>';
                                    html += '</div>';
                                    html += '</div>';
                                    html += '<div class="text-end">';
                                    html += '<p class="mb-0 fs--2 text-600 fw-semi-bold ms-7">' + chatRoomDtl.chatDate + '</p>';
                                    html += '</div>';
                                    html += '</div>';
                                    html += '</div>';
                                }else if(chatRoomDtl.chasenderEmpno == "Y"){
                                	html += '';
                                } else {
                                    html += '<div class="d-flex mb-2 flex-1">';
                                    html += '<div class="w-100 w-xxl-75">';
                                    html += '<div class="d-flex hover-actions-trigger">';
                                    html += '<div class="avatar avatar-m me-3 flex-shrink-0" data-crno="' + chatRoomDtl.crNo + '">';
                                    html += '<img class="rounded-circle" src="..' + chatRoomDtl.empPhoto + '" alt="">';
                                    html += '</div>';
                                    html += '<div class="chat-message-content received me-2">';
                                    html += '<div class="mb-1 received-message-content border rounded-2 p-3">';
                                    html += '<p class="mb-0">' + chatRoomDtl.chatMsg + '</p>';
                                    html += '</div>';
                                    html += '<p class="mb-0 fs--2 text-600 fw-semi-bold ms-7">' + chatRoomDtl.chatDate + '</p>';
                                    html += '</div>';
                                    html += '</div>';
                                    html += '</div>';
                                }
                            }

                            html += '</div>';
                            html += "<input type='hidden' name='chatMsgBoxesCrNo2' id='chatMsgBoxesCrNo2' value='" + chatRoomDtl.crNo + "'/>";
                        });

                        $("#chatListContainer").html(html);
                    } else {
                        // 채팅 내역이 없을 경우 처리
                        html += "<input type='hidden' name='chatMsgBoxesCrNo2' id='chatMsgBoxesCrNo2' value='" + chatRoomDtl.crNo + "'/>";
                        $("#chatListContainer").html('<p>채팅이 아직 없네요...</p>');
                    }
                },
                error: function (error) {
                    console.error("채팅방 정보를 가져오는 중 오류가 발생했습니다.", error);
                }
            });
        }
    });
});
//websocket을 지정한 URL로 연결
document.getElementById("chatIcon").addEventListener("click", function () {
// 	function formatDateTime(date) {
// 	    const options = {
// 	        month: '2-digit', // 월 (2자리 숫자)
// 	        day: '2-digit',   // 일 (2자리 숫자)
// 	        hour: '2-digit',  // 시간 (2자리 숫자)
// 	        minute: '2-digit', // 분 (2자리 숫자)
// 	        second: '2-digit'  // 초 (2자리 숫자)
// 	    };

// 	    return date.toLocaleString('en-US', options);
// 	}
	
	// 클릭 이벤트 처리
    
//     var socket = new WebSocket("ws://localhost:80/chat");

    // 웹 소켓 연결이 열리면 호출되는 함수
//     chatSocket.onopen = function (event) {
//         console.log("WebSocket 연결완료.");
//     };

    // 메시지를 받았을 때 호출되는 함수
    
//     // 에러가 발생했을 때 호출되는 함수
//     chatSocket.onerror = function (event) {
//         console.error("WebSocket 오류 발생: " + event);
        
//     };

//     // 웹 소켓 연결이 닫혔을 때 호출되는 함수
//     chatSocket.onclose = function (event) {
//         if (event.wasClean) {
//             console.log("WebSocket 연결이 정상적으로 닫혔습니다.");
//         } else {
//             console.error("WebSocket 연결이 오류로 인해 닫혔습니다.");
//         }
//     };

//     // 페이지를 닫을 때 웹 소켓 연결을 닫음
//     window.onbeforeunload = function () {
//     	chatSocket.close();
//     };
	console.log("ㅊ태차ㅣㅁㄴ차무파ㅓ무라ㅓㅍ무ㅏㅣㅓ" + chatEmpNo);
    selectUnreadChat(chatEmpNo);
    
    $(document).on('click', '#iconSendMsgBtn', function(){
    	var message = "메세지 전송함";
    	console.log(message);
    	chatSocket.send(message);
    	
    });
    
    $(document).on('click', '#chatIcon', function () {
        console.log("chatIcon 클릭됨");
        $.ajax({
            url: "/chatTiles.do", // 서버 엔드포인트
            type: "POST",
            contentType: "application/json",
            dataType: "json",
            success: function (data) {
                console.log("data :", data);

                var chatRoomDtlList = data.chatRoomDtlList;
                var chatuser = data.chatuser;
                var chatListContainer = $("#chatListContainer");
                var html = "";

                
                
                if (chatRoomDtlList && chatRoomDtlList.length > 0) {
                	$("#titleBox2").text(chatRoomDtlList[0].crcmTitle);
                	
                	$.each(chatRoomDtlList, function(index, chatRoomDtl) {
                		html += '<div class="d-flex chat-message"  style = "flex-direction: column;">';
                	    if (chatEmpNo == chatRoomDtl.chasenderEmpno) {
                	    	html += '<div class="d-flex mb-2 justify-content-end flex-1">';
                	        html += '<div class="w-100 w-xxl-75">';
                	        html += '<div class="d-flex flex-end-center hover-actions-trigger">';
                	        html += '<div class="chat-message-content me-2">';
                	        html += '<div class="mb-1 sent-message-content light bg-primary rounded-2 p-3 text-white">';
                	        html += '<p class="mb-0">' + chatRoomDtl.chatMsg + '</p>';
                	        html += '</div>';
                	        html += '</div>';
                	        html += '<div class="text-end">';
                	        html += '<p class="mb-0 fs--2 text-600 fw-semi-bold">' + chatRoomDtl.chatDate + '</p>';
                	        html += '</div>';
                	        html += '</div>';
                	        html += '</div>';
                	    }else if(chatRoomDtl.chasenderEmpno == 'Y'){
                	    	html += '';
                	    } else {
                	    	html += '<div class="d-flex mb-2 flex-1">';
                	        html += '<div class="w-100 w-xxl-75">';
                	        html += '<div class="d-flex hover-actions-trigger">';
                	        html += '<div class="avatar avatar-m me-3 flex-shrink-0" data-crno="' + chatRoomDtl.crNo + '">';
                	        html += '<img class="rounded-circle" src="..' + chatRoomDtl.empPhoto + '" alt="">';
                	        html += '</div>';
                	        html += '<div class="chat-message-content received me-2">';
                	        html += '<div class="mb-1 received-message-content border rounded-2 p-3">';
                	        html += '<p class="mb-0">' + chatRoomDtl.chatMsg + '</p>';
                	        html += '</div>';
                	        html += '<p class="mb-0 fs--2 text-600 fw-semi-bold ms-7">' + chatRoomDtl.chatDate + '</p>';
                	        html += '</div>';
                	        html += '</div>';
                	        html += '</div>';
                	    }
                	    html += '</div>';
                	    html += "<input type='hidden' name='chatMsgBoxesCrNo2' id='chatMsgBoxesCrNo2' value='"+chatRoomDtl.crNo+"'/>";
                    });
                } else {
                	html = '<p>채팅이 아직 없네요...</p>';
                	html += "<input type='hidden' name='chatMsgBoxesCrNo2' id='chatMsgBoxesCrNo2' value='"+chatRoomDtl.crNo+"'/>";
                }
                chatListContainer.html(html);
                $("#notiColor").removeClass("text-danger").addClass("text-success");
            },
            error: function (error) {
                console.error("채팅 아이콘 클릭 시 오류 발생: " + error);
            }
        });
    });


    document.getElementById("support-chat-dropdown").addEventListener("click", function () {
       // chatTilesList.do (endPoint)
       fetch("/chatTilesUserList.do")
           .then(response => response.json()) 
           .then(data => {
        	   var chatUserListDiv = document.getElementById("chatUserList");
        	   chatUserListDiv.innerHTML = "";

        	   data.forEach(userList => {
        	       var a = document.createElement("a");
        	       a.className = "dropdown-item chatName";
        	       a.href = "#";
        	       a.textContent = userList.empName;
//         	       console.log("empName: " + userList.empName);

        	       // 여기에서 empNo를 가져와야 합니다.
        	       var empNo = userList.id;
//         	       console.log("empNo: " + empNo);
					
        	       a.setAttribute("data-empNo", empNo);

        	       a.style.color = "skyblue";
        	       a.style.fontSize = "13px";

        	       chatUserListDiv.appendChild(a);
        	   });

        	   chatUserListDiv.style.overflowY = "auto";
        	   chatUserListDiv.style.maxHeight = "250px";
           })
           .catch(error => {
               console.error("채팅방 목록을 불러오는 중 오류가 발생했습니다.", error);
        });
    });

 // HTML 버튼 요소를 가져옵니다.
    const openChatModalBtn = document.getElementById("openChatModalBtn");
    const chatModal = document.getElementById("chatModal");

//     버튼 클릭 이벤트 리스너를 추가합니다.
//     openChatModalBtn.addEventListener("click", () => {
//       모달이 보이지 않으면 보이도록 토글합니다.
//       if (chatModal.style.display === "none" || chatModal.style.display === "") {
//         chatModal.style.display = "block";
//       } else {
//         chatModal.style.display = "none";
//       }
//     });
    var chatUserSearch = $('#chatUserSearch');
    var chatUserList = $('#chatUserList');
    
    // <a>태그로 구성된 채팅유저리스트 검색 기능
    $(document).on("keyup","#chatUserSearch", function(){
        // 입력된 검색어 가져오기
        var searchKeyword = chatUserSearch.val();
		console.log(searchKeyword);
		var html = "";
		var searchData = {
			"keyword" : searchKeyword
		}
        $.ajax({
            type: 'POST',
            url: '/searchChatAjax.do', 
            data : JSON.stringify(searchData),
            contentType : "application/json; charset=utf-8",
            success: function(result) {
            	console.log("result : " + result);
            	console.log('에이잭스 결과값 반환되었음.');
                // 검색 결과를 chatUserList에 출력
                chatUserList.html('');
                result.forEach(function(item){
                	html += '<a class="dropdown-item chatName" href="#" data-empNo="'+item.id+'" style="color: skyblue; font-size: 13px;">'+item.empName+'</a>';
                });
                chatUserList.html(html);
            }
        });
    });
    
});
// 미확인 알람 리스트 가져오기
function selectUnreadChat (empNo){
	console.log("실행여부 확인을 위한 empNo:{}",empNo);
	
	var data = {
			empNo : empNo
	}
	
 	$.ajax({
		type : "post",
		url : "/selectUnreadChat.do",
		contentType: "application/json; charset=utf-8",
		data : JSON.stringify(data),
		success : function(res){
			console.log("ajax 실행 여부 확인,,, ", res);
			if(res > 0){
 				 $("#notiColor").removeClass("text-success").addClass("text-danger");
				}else{
					$("#notiColor").removeClass("text-danger").addClass("text-success");
				}
			}
	 	});
 	
};

</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<script type="text/javascript" src="common.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
	function chkAgr() {
		//checkbox의 check상태를 얻어와서 하나라도 체크되지 않았다면 경고창
		var obj = document.agreeFrm;
		var ag1 = obj.agree1.checked; //true //false
		var ag2 = obj.agree2.checked;

		if (!ag1) {
			alert("이용약관에 동의해주세요 !!");
			return;
		}

		if (!ag2) {
			alert("개인정보 활용에 동의해주세요 !!");
			return;
		}

		location.href = "home_user_join.do";
	}

	$(document).ready(function() {

		var scOffset = $('.navbar-Menu').offset();
		$(window).scroll(function() {
			if ($(document).scrollTop() > scOffset.top) {
				$('.navbar').addClass('navbar-fixed-top');
			} else {
				$('.navbar').removeClass('navbar-fixed-top');
			}
		});

		var url = "chk_login.do";
		ajaxGet(url, function(rt) {

			// 로그인 실패시 : rt값 -> ("/main_html.do")에서 10002 return
			if (rt == "10002") {
				$("#login_nav").hide();
				$("#non_login_nav").show();
			}

			// 로그인 시 : rt값 -> user_name
			else if (rt != "") {
				$("#login_nav").show();
				$("#non_login_nav").hide();
				$("#user_name").text(rt + "님이 로그인하셨습니다.");
			}
		});

	});
</script>


<body>

	<div class="jbTitle">
		<h1>Multi Space</h1>
	</div>

	<!-- Fixed navbar -->
	<nav class="navbar navbar-default ">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="main.html">multi space</a>
		</div>

		<div id="navbar" class="navbar-collapse collapse navbar-Menu ">
			<ul class="nav navbar-nav ">
				<li><a href="space_home.do">공간</a></li>
				<li><a href="club_home.do">모임</a></li>
				<li><a href="community_list.do">커뮤니티</a></li>
				<li><a href="event_user_list.do">이벤트</a></li>
				<li><a href="notice_list.do">공지사항</a></li>
				<li><a href="faq_list.do">FAQ</a></li>
				<li><a href="admin_main.do">관리자</a></li>
			</ul>

			<ul id="login_nav" class="nav navbar-nav navbar-right">
				<li><a href="#" id="user_name"></a></li>
				<li><a href="mypage_moveMypageMainPage.do">마이페이지</a></li>
				<li><a href="home_logout.do">로그아웃</a></li>
			</ul>

			<ul id="non_login_nav" class="nav navbar-nav navbar-right">
				<li><a href="#">로그인</a></li>
			</ul>

		</div>
	</div>
	</nav>
	<!-- nav -->
	<div class="container">
		<div class="wrap">
			<div class="header">
				<div id="header_container"></div>
				<div id="navi_bar"></div>
			</div>

			<div id="container">

				<div id="agree">
					<form name="agreeFrm">
						<div
							style="width: 650px; height: 100px; border: 1px solid #333; overflow: auto">
							<p style="margin: 10px;">1. MultiSpace 홈페이지(이하 홈페이지라 함)는
								MultiSpace에서 운영하는 공간대여의 인터넷 서비스 사이트입니다. 홈페이지에 회원으로 가입하시는 분들은 회원
								주체에 따라 개인회원 혹은 법인회원으로 가입하실 수 있으며, 가입하신 회원들께는 홈페이지에서 제공하는 정보 및
								기능을 이용하실 수 있습니다. 약관에 동의함을 선택하시면 이 약관에 동의하는 것으로 간주하며 회원가입을 하실 수
								있게 됩니다.</p>
							<p style="margin: 10px;">2. 회원의 종류 홈페이지의 회원은 개인회원으로 구성됩니다.</p>
							<p style="margin: 10px;">가. 개인회원 - 개인회원은 회원가입신청서를 작성한 개인
								사용자로서 홈페이지의 서비스를 사용할 수 있습니다. - 개인회원도 교육신청시 고용보험적용을 선택하면 고용보험혜택을
								받으실 수 있습니다. - 홈페이지는 통합회원으로 운영하던 기존의 회원정책을 변경하여 독립적인 회원체계를 시행합니다.
								- 따라서 Multi Space 를 이용하기 위해서는 Multi Space를 통해서만 회원가입을 하여야 하며,
								회원가입을 하시면 Multi Space만의 회원으로 등록됩니다. - 다음의 기준에 의하여 회원 자격이 유지 또는
								소멸됩니다.</p>
							<p style="margin: 10px;"></p>
							<p style="margin: 10px;">
								3.회원등록정보<br /> 회원 가입 시 작성하는 모든 회원 정보들은 홈페이지의 서비스 제공에 필요한 경우를
								제외하고, 다른 목적으로 사용되지 않습니다. 허위정보를 기재하였을 경우 발생하는 불이익은 책임지지 않으며,
								홈페이지의 서비스 제한 조치를 받을 수 있습니다. 또한 회원정보는 언제든지 수정이 가능하지만, 이름과 ID,
								주민등록번호, 사업자등록번호 등 고유의 정보는 변경은 원칙적으로 불가능하므로 작성시 주의해야 합니다.
							</p>
							<p style="margin: 10px;">
								4. 홈페이지의 대회원 서비스<br /> 가. 홈페이지의 회원은 다음의 서비스를 받으실 수 있습니다.<br /> -
								공간대여<br /> - 커뮤니티 등록 및 관리<br /> - 공간등록<br /> - 문의게시판<br /> 나. 위의
								서비스를 받기 위해서는 사용자 로그인을 하셔야 합니다.<br /> 다. 홈페이지의 서비스는 지속적으로 추가 제공될
								것이며, 불가피한 사정에 의해 서비스의 내용을 변경하거나 중단할 수 있습니다.<br /> 라. 서비스가 변경되거나
								중단되는 경우 회원에게 홈페이지를 통해서 공지합니다.<br />
							</p>
							<p style="margin: 10px;">
								5. 회사는 다음 각 호에 해당하는 이용계약 신청에 대하여는 이를 승낙하지 아니 합니다.<br /> 가. 다른
								사람의 명의를 사용하여 신청하였을 때<br /> 나. 본인의 실명으로 신청하지 않았을 때<br /> 다. 이용 계약
								신청서의 내용을 허위로 기재하였을 때<br /> 라. 사회의 안녕과 질서 혹은 미풍양속을 저해할 목적으로 신청하였을
								때 6. ID와 비밀번호<br /> 가. ID와 비밀번호에 관한 모든 관리책임은 이용자에게 있습니다. 이용자에게
								부여된 ID 및 비밀번호의 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 책임은 이용자에게 있습니다.
								자신의 ID가 부정하게 사용된 경우 이용자는 반드시 홈페이지 웹마스터에게 전화나 이메일( 1588-3357 /
								webmaster@multicampus.co.kr)로 그 사실을 통보해야 합니다.<br /> 나. 비밀번호는 다음의
								사항을 준수하여 신청하여야 합니다.<br /> - 6자 이상으로 설정하셔야 합니다.<br /> - 영문자와 숫자를
								혼용하셔야 합니다.<br /> - ID가 포함되거나 동일하지 않아야 합니다.<br /> - 동일한 문자가 4회 이상
								연속되어서는 안됩니다.<br /> - 위 사항의 모든 사항에 부합되어야 정식으로 회원가입을 하실 수 있습니다.<br />
							</p>
							<p style="margin: 10px;">
								7. 회원의 게시물 관리<br /> 홈페이지 서비스에 회원이 게시하거나 등록한 내용물이 다음 사항에 해당된다고
								판단되는 경우에 사전 통지 없이 삭제할 수 있습니다. 가. 타인을 비방하거나 중상모략으로 개인 및 단체의 명예를
								손상시키는 내용인 경우 나. 공공질서 및 미풍양속에 위반되는 내용인 경우 다. 범죄적 행위에 부합된다고 인정되는
								내용인 경우 라. 타인의 저작권 등 기타의 권리를 침해하는 내용인 경우 마. 기타 관계 법령이나 회사에서 정한
								규정에 위배되는 내용인 경우
							</p>
							<p style="margin: 10px;">
								9. 약관의 수정<br /> Multi Space는 이 약관을 변경할 수 있으며 변경된 약관은 서비스 화면에
								게재하거나 기타 다른 방법으로 이용자에게 공지함으로써 효력을 발생합니다.
							</p>
							<p style="margin: 10px;">
								10. 약관 외 준칙<br /> 이 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법 및 기타 관련법령의
								규정에 의합니다. 이 약관은 2017년 10월 22일부터 시행합니다
							</p>

						</div>
						<div style="margin-top: 5px; margin-bottom: 10px">
							<input type="checkbox" name="agree1" /> 이용 약관에 동의합니다.
						</div>

						<div>
							<div
								style="width: 650px; height: 100px; border: 1px solid #333; overflow: auto">
								<p style="margin: 10px;">
									수집하는 목적/방법에 따라 수집하는 개인정보 항목은 다음과 같습니다.<br /> - 기본 개인정보 정보 <br />
									이름, 주민등록번호<br /> 로그인 ID, 비밀번호<br /> 자택전화번호, 자택주소, 휴대전화번호<br />
									이메일, 이메일 수신여부<br />
								</p>
								<p style="margin: 10px;">
									- 마케팅/서비스 이용을 위한 정보<br /> 회사명, 부서/직책, 회사전화번호, 주민등록번호<br />
								</p>
								<p style="margin: 10px;">
									- 서비스 이용 중 발생되는 정보<br /> 서비스 이용기록, 접속로그, 쿠키<br /> 결재수단에 대한
									기록여부(계좌), 결재기록<br />
								</p>

							</div>

						</div>
						<br />

						<div>
							<div
								style="width: 650px; height: 100px; border: 1px solid #333; overflow: auto">
								<p style="margin: 10px;">
									Multi Space는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br /> - 서비스 제공에 관한 계약
									이행 및 서비스 제공에 따른 요금정산 목적<br /> 학습진행, 컨텐츠 제공, 구매 및 요금 결제, 물품배송 또는
									청구지 등 발송<br /> - 회원 관리<br /> 회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의
									부정 이용 방지와<br /> 비인가사용 방지, 가입 의사 확인, 연령확인, 불만처리 등 민원처리, 고지사항 전달<br />
									- 마케팅 및 광고에 활용<br /> 신규 서비스(제품) 개발 및 특화, 이벤트 등 광고성 정보 전달,
									인구통계학적 특성에 따른<br /> 서비스 제공 및 광고 게재, 접속 빈도 파악 또는 회원의 서비스 이용에 대한
									통계 <br /> - 고용보험 과정의 노동부 신고 <br /> 회원이 신청한 과정이 고용보험 대상 과정인 경우
									고용보험 환급을 이유로 노동부에 신고하게 됩니다.<br />
								</p>

							</div>

						</div>
						<br />

						<div>
							<div
								style="width: 650px; height: 100px; border: 1px solid #333; overflow: auto">
								<p style="margin: 10px;">
									원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.<br /> 단, 다음의
									정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다. <br />
								</p>
								<p style="margin: 10px;">
									보존 항목 : 이름, 자택 전화번호, 자택주소, 휴대전화번호, 이메일, 회사명, 부서, 직책, 회사전화번호,
									주민등록번호<br /> 보존 근거 : 고용보험 환급 적정성 심의<br /> 보존 기간 : 3년 <br />
								</p>
								<p style="margin: 10px;">
									그리고 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안
									회원정보를 보관합니다.<br /> 1) 기타 법령에 따른 보유기간/관계법 안내<br /> - 계약 또는 청약철회
									등에 관한 기록 : 5년 (전자상거래 등에서의 소비자 보호에 관한 법률)<br /> - 대금결제 및 재화 등의
									공급에 관한 기록 : 5년 (전자상거래 등에서의 소비자 보호에 관한 법률)<br /> - 소비자의 불만 또는
									분쟁처리에 관한 기록 : 3년 (전자상거래 등에서의 소비자 보호에 관한 법률)<br /> - 본인확인에 관한 기록
									보존 이유 : 정보통신 이용촉진 및 정보보호 등에 관한 법률 보존 기간 : 6개월 <br /> - 방문에 관한
									기록 보존 이유 : 통신 비밀 보호법 보존 기간 : 3개월<br />
								</p>

							</div>

						</div>
						<div style="margin-top: 5px; margin-bottom: 10px">
							<input type="checkbox" name="agree2" /> 개인정보 수집 및 이용 약관에 동의합니다.
						</div>

						<input type="button" onclick="chkAgr()" value="동의하기" /> <input
							type="button" onclick="cancelAgr()" value="취소" />
					</form>

				</div>
			</div>
		</div>
	</div>
<body>

</body>
</html>

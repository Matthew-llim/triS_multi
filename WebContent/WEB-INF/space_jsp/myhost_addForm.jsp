<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
.account{
float: left;

}

.labelname{
text-align: center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<!-- Bootstrap Core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="./Resouces_admin/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="./Resouces_admin/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link href="./Resouces_admin/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="./Resouces_admin/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="./Resouces_admin/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
	
	<script type="text/javascript">
	function zipSearch(){
		window.open("find_zipcode.html", "zip", "width=600,height=450");
	}
	
	
	$(document).ready(function(){
		flag = 0;
		$("#primary_id").on("click",function(){
			var crn = $("#crn").val();
			
			var url = "crn_overlap.do?crn="+crn;
			
			ajaxGet(url,function(rt){
				if(rt==1){
					$("#lblContent").text("중복되었습니다.");
					$("#repleModal").modal("show");
					$("#crn").val("");
				} else if(crn==""){
					$("#lblContent").text("사업자번호를 입력하세요");
					$("#repleModal").modal("show");
				} else if(rt == 0 ){
					$("#lblContent").text("사용이 가능합니다.");
					$("#repleModal").modal("show");
					flag = 1;
				}
			});
		});
		
		
		$("#addhost").on("click",function(){
			var host_name = $("#host_name").val();
			var accont = $("#host_account").val();
			
			if(host_name==""){
				$("#lblContent").text("대표명을 입력하세요.");
			} else if(account=""){
				$("#lblContent").text("입금계좌를 입력하세요.");
			} else if(flag == 0){
				$("#lblContent").text("중복검사해주세요.");
			} else{
				$("#addhost").attr('type','submit');
			}
			$("#repelModal").modal("show");
		});
		
		$("#btnClose").on("click",function(){
			$("#repleModal").modal("hide");
		});
		
	});
	
	</script>
</head>
<body>
<br/>
     <!-- Horizontal Form -->
          <div class="box">
            <div class="box2">
            <br/>
            <p class="fa fa-pencil">  <label> 판매자 등록 </label></p>
           
           
              <br/>
              <br/>
            </div>
         
            <!-- /.box-header -->
            <!-- form start -->
            
	               <form action="myhost_addhost.do" method="POST" name="frm" class="form-horizontal" >
              <div class="box-body">
                <div class="form-group">
	                  <label for="name" class="col-sm-1 labelname">대표명</label>
	
	                  <div class="col-sm-2">
	                   <input type="text" name="host_name" id="host_name" class="form-control" />
	                  </div>
                </div>
                
                <div class="form-group">
                  <label for="password" class="col-sm-1 name">사업자번호</label>

                  <div class="col-sm-2">
                  <input type="text" name="crn" id="crn" class="form-control" maxlength="13"/>
                  </div>
                  
                    <div class="zip">
					<input type="button" id="primary_id" value="중복확인" class="btn btn-primary"/>
                  </div>
                  
                </div>
           
                  <label for="zipcode" class="account col-sm-1">입금계좌</label>
                  
                  <div class="form-group">
	                  <select class="form-control account" style="width: 200px" name="account_name">
	                  	<option value="kakao">카카오뱅크</option>
	                  	<option value="kb">국민은행</option>
	                  	<option value="ibk">기업은행</option>
	                  	<option value="nh">농협은행</option>
	                  	<option value="shinhan">신한은행</option>
	                  </select>

                  <div class="col-sm-2">
                		<input type="text" name="host_account"  id="host_account" class="form-control" />
                  </div>
                  
                </div>
                
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
              
				<input type="reset" value="취소하기" class="btn btn-default"/>
                <input type="button" class="btn btn-info" id="addhost" value="등록하기"/>
              </div>
              <!-- /.box-footer -->
            </form>
          </div>
            
            <form id="ck_total">
				<div id="repleModal" class="modal" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-body">
								<label id="lblContent"></label><br />
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary btn-sm"
									id="btnClose" data-dismiss="modal">확인</button>
							</div>
						</div>
					</div>
				</div>
			</form>
            
            

</body>
</html>
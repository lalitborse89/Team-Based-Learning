<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="model.User" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>Scratch Card Home</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <link href="../css/style2.css" rel="stylesheet">
    <script src="../js/jquery-ui.js"></script>
    <link rel="stylesheet" href="../css/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="../css/chatBox.css" />
	<link rel="stylesheet" type="text/css" href="../css/font-awesome.css" />
    <style type="text/css">
    .btn1{
        padding: 20px 40px 20px 40px;
    }
    </style>
    <% User user = (User) session.getAttribute("User");
    int memId = user.getMem_ID();
	int teamId = user.getTeam_ID();
	String role = user.getRole();
    //out.println("memId - "+memId);
    //out.println("teamId - "+teamId);
    //out.println("role - "+role);
    %>
  <script>
  
  var timeVar;
  
  function getMessages(){
	  //console.log("CALLED!")
	  //console.log("Before Clearing = "+timeVar)
	  try{
      	clearTimeout(timeVar);
	  }catch(e){
		  
	  }
	  //console.log("After Clearing = "+timeVar)
		$.ajax({
			  method: "POST",
			  url: "../ActionServlet",
			  data: { action: "getMessages", teamId : tId }
			}).done(function( msg ) {
				  console.log(msg);
				  console.log(msg[0].message);
				  
				  try{
					  $(".chat").empty();
				  }catch(e){
					  
				  }
				  
				  var text = "";
				  for(i=0;i<msg.length;i++){
					  if(msg[i].memId == mId){
						  text += '<li class="right clearfix"><span class="chat-img pull-right">';
						  text += '<img src="http://placehold.it/50/FA6F57/fff&text='+msg[i].name.charAt(0)+'" alt="User Avatar" class="img-circle" />';
						  text += '</span>';
						  text += '<div class="chat-body clearfix">';
						  text += '<div class="header">';
						  
						  text += '<small class=" text-muted"><span class="glyphicon glyphicon-time"></span>'+msg[i].time+'</small>';
						  text += '<strong class="pull-right primary-font">'+msg[i].name+'</strong>';
						  
						  text += '</div>';
						  text += '<p>';
						  text +=msg[i].message;
						  text += '</p>';
						  text += '</div>';
						  text += '</li>';  
					  }else{
						 // console.log(msg[i].name)
						  text += '<li class="left clearfix"><span class="chat-img pull-left">';
						  text += '<img src="http://placehold.it/50/FA6F57/fff&text='+msg[i].name.charAt(0)+'" alt="User Avatar" class="img-circle" />';
						  text += '</span>';
						  text += '<div class="chat-body clearfix">';
						  text += '<div class="header">';
						  
						  text += '<strong class="primary-font">'+msg[i].name+'</strong> <small class="pull-right text-muted">';
						  text += '<span class="glyphicon glyphicon-time"></span>'+msg[i].time+'</small>';
						  
						  text += '</div>';
						  text += '<p>';
						  text +=msg[i].message;
						  text += '</p>';
						  text += '</div>';
						  text += '</li>';
					  }
				  }
				  $(".chat").append(text);
				  
			});
	  	  
		  timeVar = setTimeout(function(){ reloadChat(); }, 10000);
		  //console.log("timer started -- "+timeVar)
	}
  
  	function reloadChat(){
  		//console.log("----------------->"+$(".chat").is(':visible'));
  		if($(".chat").is(':visible')){
  			getMessages();
  		}
  	}

	function addtext(){
		var msg = $("#btn-input").val().trim();
		//console.log(msg);
	 
		if(msg == ""){
			return false;
		}
		
	    $.ajax({
			  method: "POST",
			  url: "../ActionServlet",
			  data: { action: "sendMessage", message: msg, memId: mId, teamId : tId  }
			}).done(function( msg ) {
				  //console.log(msg);
				  
				    var text = "";
					text += '<li class="right clearfix"><span class="chat-img pull-right">';
					text += '<img src="http://placehold.it/50/FA6F57/fff&text='+msg.memId+'" alt="User Avatar" class="img-circle" />';
					text += '</span>';
					text += '<div class="chat-body clearfix">';
					text += '<div class="header">';
					text += '<small class=" text-muted"><span class="glyphicon glyphicon-time"></span>'+msg.time+'</small>';
					text += '<strong class="pull-right primary-font">'+msg.memId+'</strong>';
					text += '</div>';
					text += '<p>';
					text +=msg.message;
				    text += '</p>';
				    text += '</div>';
				    text += '</li>';
				    $(".chat").append(text);
				    $("#btn-input").val("");
			});
	    
	}
  
  //----------------------------------------------//
  
	$(function() {
		$("#tabs").tabs();
	});
	
	var mId = "";
	var tId = "";
	var role= "";
	
      function populate(){
    	  
    	mId = $("#memId").val();
    	tId = $("#teamId").val();
    	role = $("#role").val();
    	
    	var studentId;
    	
    	if(role == "student"){
    		for(i=0;i<teamMembers.length;i++){
    			if(teamMembers[i].role == "lead"){
    				studentId = teamMembers[i].memId;		
    			}
    		}
    		$("#completeTest").hide();
    	}else{
    		studentId = mId;	
    	}
    	
    	console.log("prev - "+mId);
    	console.log("now! - "+studentId);
    	
        var correctAns = [3,2,4,4,5,1,1,2,4,2];
        var optionsArray = ["A","B","C","D","E"];
        var ansArray = [];
    	var answers = "";
    	  $.ajax({
    		  method: "POST",
    		  url: "../ActionServlet",
    		  data: { action: "getAnswers", memId: studentId, teamId : tId }
    		}).done(function( msg ) {
    			 // console.log(msg.scoreId);
    			  //console.log(msg);
    			  //console.log(jQuery.isEmptyObject(msg));
    			  
    			  var disabledEle = [];
    			  
    			  var ans1 = msg.ans1;
    			  var ans2 = msg.ans2;
    			  var ans3 = msg.ans3;
    			  var ans4 = msg.ans4;
    			  var ans5 = msg.ans5;
    			  var ans6 = msg.ans6;
    			  var ans7 = msg.ans7;
    			  var ans8 = msg.ans8;
    			  var ans9 = msg.ans9;
    			  var ans10 = msg.ans10;
    		
    			  ansArray = [ans1,ans2,ans3,ans4,ans5,ans6,ans7,ans8,ans9,ans10];
    			  
    			 // console.log(ansArray)
    		        var questions = 10;
    		        var options = 5;
    		        
    		        var tableRow = "";
    		        tableRow += "<table align=\"center\" class=\"table table-striped table-bordered\" width=\"100%\">";   
    		        if(role == "student"){
    		        	console.log('ROLE ------------STUDENT---------------')
    		        	
    		        	for(i=0; i<questions;i++){
    			            var questionNo = i+1;
    			            tableRow += "<tr>";
    			            tableRow += "<td><b>Question "+questionNo+"<\/b><\/td><td>";
    			            tableRow += "<div class=\"btn-group\" data-toggle=\"buttons\">";
    			            var optionsAnswers = null;    			           
    			            optionsAnswers = ansArray[i];
    			            var opt;
    			            var qScore;
    			            var rightAnsSelected = false;
    			            if(optionsAnswers != undefined){
    			            	console.log(optionsAnswers)
        			            opt = optionsAnswers.split(",");
        			            qScore = 5 - opt.length;
        			            //console.log("=====score=====>"+qScore);
    			            }
    			            
    			            for(j=0; j<options;j++){  
    			                var optionNo = j+1;
    			      			var eleId = "option_"+optionNo+"_"+questionNo;
    							
    			      			var disabled = "";
    			      			if(optionsAnswers != undefined){	
	    			      			for(k=0;k<opt.length;k++){
	    			                	//console.log(opt[k])
	    			                	if(correctAns[i] == opt[k]){
	    			                		//row_"+questionNo+"
	    			                		disabled = "disabled=true";
	    			                		//console.log("##"+questionNo)
	    			                		//disabledEle.push("row_"+questionNo);
	    			                	}else if(opt[k] == optionNo){
	    			                		//console.log("alaaaaaaaaaaaa"+eleId)
	    			                		disabled = "disabled=true"
	    			                	}
	    			                }
    			      			}
    			      			
    			      			
    			      			
    			      			if(correctAns[i] == optionNo && disabled == ""){
    			      				tableRow += "<label disabled='true' class=\"btn btn1 btn-warning btn-flipped-warning row_"+questionNo+"\">";
    			                    tableRow += "<input type=\"radio\" id='option_"+optionNo+"_"+questionNo+"' class=\"row_"+questionNo+"\" question="+questionNo+" value="+optionNo+" onChange=\"disableAll(this);answerAttempted(this)\" name='radioQuestions_"+optionNo+"_"+questionNo+"' >"+optionsArray[j]+" <\/input>";
    			                    tableRow += "<\/label>";
    			                }else if(correctAns[i] == optionNo){
    			      				rightAnsSelected = true;
    			      				//console.log("rightAnsSelected --------->  "+rightAnsSelected);
    			      				tableRow += "<label "+disabled+" class=\"btn btn1 btn-success btn-flipped-success row_"+questionNo+"\">";
    			                    tableRow += "<input type=\"radio\" id='option_"+optionNo+"_"+questionNo+"' class=\"row_"+questionNo+"\" question="+questionNo+" value="+optionNo+" onChange=\"disableAll(this);answerAttempted(this)\" name='radioQuestions_"+optionNo+"_"+questionNo+"' >"+optionsArray[j]+" <\/input>";
    			                    tableRow += "<\/label>"; 
    			                    disabled="";
    			                }else if(optionsAnswers == ""){
    			                	tableRow += "<label disabled='true' class=\"btn btn1 btn-warning btn-flipped-warning row_"+questionNo+"\">";
    			                    tableRow += "<input type=\"radio\" id='option_"+optionNo+"_"+questionNo+"' class=\"row_"+questionNo+"\" question="+questionNo+" value="+optionNo+" onChange=\"disableAll(this);answerAttempted(this)\" name='radioQuestions_"+optionNo+"_"+questionNo+"' >"+optionsArray[j]+" <\/input>";
    			                    tableRow += "<\/label>";
    			                }else if(disabled == ""){
    			                	tableRow += "<label disabled='true' class=\"btn btn1 btn-warning btn-flipped-warning row_"+questionNo+"\">";
    			                    tableRow += "<input type=\"radio\" id='option_"+optionNo+"_"+questionNo+"' class=\"row_"+questionNo+"\" question="+questionNo+" value="+optionNo+" onChange=\"disableAll(this);answerAttempted(this)\" name='radioQuestions_"+optionNo+"_"+questionNo+"' >"+optionsArray[j]+" <\/input>";
    			                    tableRow += "<\/label>";
    			                }else{
    			                	//console.log("rightAnsSelected   "+rightAnsSelected);
    			                    tableRow += "<label "+disabled+" class=\"btn btn1 btn-danger btn-flipped-danger row_"+questionNo+"\">";
    			                    tableRow += "<input type=\"radio\" id='option_"+optionNo+"_"+questionNo+"' class=\"row_"+questionNo+"\" question="+questionNo+" value="+optionNo+" onChange=\"disable(this);answerAttempted(this)\" name='radioQuestions_"+optionNo+"_"+questionNo+"' >"+optionsArray[j]+" <\/input>";
    			                    tableRow += "<\/label>";
    			                    disabled="";
    			                }
    			      			
    			      			
    			                
    			            }    
    			            tableRow += "<\/div><\/td>";
    			            tableRow += "<td id='score_"+questionNo+"'>0<\/td><\/tr>";
    		        	}
    			        
    		        }else if(jQuery.isEmptyObject(msg)){
    		        	console.log("NEW TEST")
    		        	for(i=0; i<questions;i++){
    		        		//var rightAnsSelected = false;
    			            var questionNo = i+1;
    			            tableRow += "<tr>";
    			            tableRow += "<td><b>Question "+questionNo+"<\/b><\/td><td>";
    			            tableRow += "<div class=\"btn-group\" data-toggle=\"buttons\">";
    			            for(j=0; j<options;j++){  
    			                var optionNo = j+1;
    			                //console.log(correctAns[i]);
    							if( correctAns[i] == optionNo){
    			                    tableRow += "<label class=\"btn btn1 btn-success btn-flipped-success row_"+questionNo+"\">";
    			                    tableRow += "<input type=\"radio\" id='option_"+optionNo+"_"+questionNo+"' class=\"row_"+questionNo+"\" question="+questionNo+" value="+optionNo+" onChange=\"disableAll(this);answerAttempted(this)\" name='radioQuestions_"+optionNo+"_"+questionNo+"' >"+optionsArray[j]+" <\/input>";
    			                    tableRow += "<\/label>"; 
    			                }else{
    			                    tableRow += "<label class=\"btn btn1 btn-danger btn-flipped-danger row_"+questionNo+"\">";
    			                    tableRow += "<input type=\"radio\" id='option_"+optionNo+"_"+questionNo+"' class=\"row_"+questionNo+"\" question="+questionNo+" value="+optionNo+" onChange=\"disable(this);answerAttempted(this)\" name='radioQuestions_"+optionNo+"_"+questionNo+"' >"+optionsArray[j]+" <\/input>";
    			                    tableRow += "<\/label>";    
    			                } 
    			            }    
    			            tableRow += "<\/div><\/td>";
    			            tableRow += "<td id='score_"+questionNo+"'>0<\/td><\/tr>";
    			        }
    		        } else{
    		        	console.log("CONTINUE TEST")
    		        	for(i=0; i<questions;i++){
    			            var questionNo = i+1;
    			            tableRow += "<tr>";
    			            tableRow += "<td><b>Question "+questionNo+"<\/b><\/td><td>";
    			            tableRow += "<div class=\"btn-group\" data-toggle=\"buttons\">";
    			            var optionsAnswers = null;    			           
    			            optionsAnswers = ansArray[i];
    			            var opt;
    			            var qScore;
    			            var rightAnsSelected = false;
    			            if(optionsAnswers != undefined){
    			            	//console.log(optionsAnswers)
        			            opt = optionsAnswers.split(",");
        			            qScore = 5 - opt.length;
        			            //console.log("=====score=====>"+qScore);
    			            }
    			            
    			            for(j=0; j<options;j++){  
    			                var optionNo = j+1;
    			      			var eleId = "option_"+optionNo+"_"+questionNo;
    							
    			      			var disabled = "";
    			      			if(optionsAnswers != undefined){	
	    			      			for(k=0;k<opt.length;k++){
	    			                	//console.log(opt[k])
	    			                	if(correctAns[i] == opt[k]){
	    			                		//row_"+questionNo+"
	    			                		disabled = "disabled=true";
	    			                		//console.log("##"+questionNo)
	    			                		//disabledEle.push("row_"+questionNo);
	    			                	}else if(opt[k] == optionNo){
	    			                		//console.log("alaaaaaaaaaaaa"+eleId)
	    			                		disabled = "disabled=true"
	    			                	}
	    			                }
    			      			}
    			      			
    			      			if(correctAns[i] == optionNo){
    			      				rightAnsSelected = true;
    			      				//console.log("rightAnsSelected --------->  "+rightAnsSelected);
    			      				tableRow += "<label "+disabled+" class=\"btn btn1 btn-success btn-flipped-success row_"+questionNo+"\">";
    			                    tableRow += "<input type=\"radio\" id='option_"+optionNo+"_"+questionNo+"' class=\"row_"+questionNo+"\" question="+questionNo+" value="+optionNo+" onChange=\"disableAll(this);answerAttempted(this)\" name='radioQuestions_"+optionNo+"_"+questionNo+"' >"+optionsArray[j]+" <\/input>";
    			                    tableRow += "<\/label>"; 
    			                    disabled="";
    			                }else{
    			                	//console.log("rightAnsSelected   "+rightAnsSelected);
    			                    tableRow += "<label "+disabled+" class=\"btn btn1 btn-danger btn-flipped-danger row_"+questionNo+"\">";
    			                    tableRow += "<input type=\"radio\" id='option_"+optionNo+"_"+questionNo+"' class=\"row_"+questionNo+"\" question="+questionNo+" value="+optionNo+" onChange=\"disable(this);answerAttempted(this)\" name='radioQuestions_"+optionNo+"_"+questionNo+"' >"+optionsArray[j]+" <\/input>";
    			                    tableRow += "<\/label>";
    			                    disabled="";
    			                } 
    			                
    			            }    
    			            tableRow += "<\/div><\/td>";
    			            tableRow += "<td id='score_"+questionNo+"'>0<\/td><\/tr>";
    		        	}
    		        }
    		        $("#questions").html(tableRow);    			  
    		        /* var unique = disabledEle.filter( onlyUnique );
    		        console.log("==="+unique) */
    		        /* var uniqueDis = unique.split(",");
    		        for(l=0;l<uniqueDis.length;l++){
    		        	$("."+uniqueDis).attr("disabled","true");
    		        } */
    			  
    		        if(msg.isTestComplete == 1){
    		        	checkStudentScores(msg);
    		        	$("#completeTest").hide();
    		        }
    		        /* }else if(role == "lead" && msg.isTestComplete == 1){
    		        	$("#completeTest").hide();
    		        } */
    		        
    		        
    		}); 
      }
      
      function checkStudentScores(msg){
    	 // console.log(msg.scores.score1)
    	  $("#score_1").html(msg.scores.score1);
			$("#score_2").html(msg.scores.score2);
			$("#score_3").html(msg.scores.score3);
			$("#score_4").html(msg.scores.score4);
			$("#score_5").html(msg.scores.score5);
			$("#score_6").html(msg.scores.score6);
			$("#score_7").html(msg.scores.score7);
			$("#score_8").html(msg.scores.score8);
			$("#score_9").html(msg.scores.score9);
			$("#score_10").html(msg.scores.score10);
			
			$("#totalScore").html(msg.scores.score);
			$("#totalScoreDiv").show();
      }
      
      function onlyUnique(value, index, self) { 
    	    return self.indexOf(value) === index;
    	}
      
      function disable(ele){
    	  //console.log(ele.id);
    	  $(ele).parent().attr("disabled", "true");
      }
      
      function disableAll(ele){
    	  //console.log($(ele).attr("class"));
    	  var cls = $(ele).attr("class");
    	  $("."+cls).attr("disabled", "true");
      }
      
      function answerAttempted(ele){
    	  var id = ele.id;
    	  var value = $(ele).val();
    	  var questionNo = $(ele).attr("question");
    	  
    	  //console.log("----->"+id+"--------->"+value)
    	  
    	  $.ajax({
    		  method: "POST",
    		  url: "../ActionServlet",
    		  data: { action: "answerAttempted", qNo: questionNo, option: value, memId: mId, teamId : tId }
    		}).done(function( msg ) {
    			  //console.log(msg);
    		});
      }
      
      function completeTest(){
    	  $.ajax({
    		  method: "POST",
    		  url: "../ActionServlet",
    		  data: { action: "completeTest", memId: mId, teamId : tId }
    		}).done(function( msg ) {
    			//console.log(msg);
    			$("#score_1").html(msg.score1);
    			$("#score_2").html(msg.score2);
    			$("#score_3").html(msg.score3);
    			$("#score_4").html(msg.score4);
    			$("#score_5").html(msg.score5);
    			$("#score_6").html(msg.score6);
    			$("#score_7").html(msg.score7);
    			$("#score_8").html(msg.score8);
    			$("#score_9").html(msg.score9);
    			$("#score_10").html(msg.score10);
    			
    			$("#totalScore").html(msg.score);
    			$("#totalScoreDiv").show();
    			//console.log(msg.score);
    		});
      }
      
      var teamMembers = "";
      function getMemberDetails(){
    	  tId = $("#teamId").val();
    	  $.ajax({
    		  method: "POST",
    		  url: "../ActionServlet",
    		  data: { action: "getTeamMembers", teamId : tId }
    		}).done(function( msg ) {
    			//console.log(msg.length);
    			teamMembers = msg;
    			populate();
    		});
      }
  </script>
  </head>
  <body onload="getMemberDetails();" style="padding:2%">
  <div id="tabs">
		<ul>
			<li><a href="#tabs-1">Scratch Card</a></li>
			<li><a href="#tabs-2" onclick="getMessages()">Group Discussion</a></li>
		</ul>
		<div id="tabs-1">
			<div id="questions" style="text-align: center"></div>
			<div id="totalScoreDiv" style="float: right;display: none;">Total Score:<span id="totalScore"></span></div>
			<div style="text-align: center">
				<button class="btn btn-primary" id="completeTest" onclick="completeTest()">Submit</button>
			</div>
		</div>
		<div id="tabs-2">
		<div class="container">
    <div class="row">
        <div class="col-md-11" style="margin-top: 3%;margin-left: 3%">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-comment"></span> Chat
                    <div class="btn-group pull-right">
                    <i class="fa fa-refresh" style="cursor: pointer;" title="Reload Chat" onclick="getMessages()"></i>
                    </div>
                </div>
                <div class="panel-body">
                    <ul class="chat">
                      
                    </ul>
                </div>
                <div class="panel-footer">
                    <div class="input-group">
                        <!-- <input id="btn-input" type="text" class="form-control input-sm" placeholder="Type your message here..." /> -->
                        <textarea class="textwrapper" id="btn-input" rows="4"></textarea>
                        <span class="input-group-btn">
                            <button class="btn btn-warning btn-sm" id="btn-chat" style="line-height: 1.5;font-size: 12px" onclick="addtext()">Send</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        </div>
        </div>
		</div>
  </div>
  </body>
  <input type="hidden" id="memId" value=<%=memId %> />
  <input type="hidden" id="teamId" value=<%=teamId %> />
  <input type="hidden" id="role" value=<%=role %> />
  <script src="../js/bootstrap.min.js"></script>
</html>
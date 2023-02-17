$(document).ready(function () {
$(".dropdownMenu").dropdown();
            $(".nav-left-dropdown>a").click(function () {


                if ($(this).attr("d") != 1 && $(this).attr("d") != undefined) {
                    $(this).removeClass("nav-left-dropdown-a");
                    $this = $(this);
                    $(this).next("ul").slideUp(300, function () { $this.removeClass("nav-left-bottrom-border"); $this.removeClass("nav-left-dropdown-ul") });

                    $(this).attr("d", "1");

                } else {
                    $(this).addClass("nav-left-dropdown-a");
                    $(this).addClass("nav-left-bottrom-border");
                    $(this).next("ul").addClass("nav-left-dropdown-ul").slideDown(300);
                    $(this).attr("d", "2");

                }
            })
            var countCheckin = $(".countCheckin").attr("id");
            var countRoom = $(".countRoom").attr("id");
            $(".span1").html("入住率<br/>("+(countCheckin/countRoom*100).toFixed(1)+"%)");
            
            var i = 2;
            $(".openNav").click(function(){
            	if(i % 2 ==0){
            		$(".navbtn").css("display","none");
                	$(".navbtns").css("display","block");
                	            	
            	}else{
            		$(".navbtns").css("display","none");
                	$(".navbtn").css("display","block");
            	}  
            	i++;  
            })
            var a = 2;
            $(".openNav1").click(function(){
            	if(a % 2 ==0){
            		$(".navbtn1").css("display","none");
                	$(".navbtns1").css("display","block");
                	            	
            	}else{
            		$(".navbtns1").css("display","none");
                	$(".navbtn1").css("display","block");
            	}  
            	a++;  
            })
            $(".openNewRoomType").click(function(){
            	$(".newRoomType").css("display","block");
            })
            $(".closeNewRoomType").click(function(){
            	$(".newRoomType").css("display","none");
            })
            var roomTypeId;
            $(".openRoomDetail").click(function(){
            	var roomId = $(this).attr("id");
            	$.post("/showRoom/"+roomId,function(data){
            		$(".roomTypeNameDetail").val(data.roomTypeName); 
            		$(".roomNumberDetail").val(data.roomNumber);
            		if(data.roomStatus ==0){
            			$(".roomStatusDetail").val("空闲");
            		}else if(data.roomStatus ==1){
            			$(".roomStatusDetail").val("已预订");
            		}else if(data.roomStatus ==2){
            			$(".roomStatusDetail").val("已入住");
            		}   
            		if(data.roomSanitation ==0){
            			$(".roomSanitationDetail").val("已打扫");
            		}else if(data.roomSanitation ==1){
            			$(".roomSanitationDetail").val("脏房");
            		}else if(data.roomSanitation ==2){
            			$(".roomSanitationDetail").val("维修中");
            		}             		
            		$(".roomStoreyDetail").val(data.roomStorey); 
            		if(data.roomWindow ==0){
            			$(".roomWindowDetail").val("有窗");
            		}else if(data.roomWindow ==1){
            			$(".roomWindowDetail").val("无窗");
            		}           		
            		$(".roomBedDetail").val(data.roomBed); 
            		$(".roomGuestNumberDetail").val(data.roomGuestNumber);
            		$(".roomFacilityDetail").val(data.roomFacility);
            		$(".openUpdateRoom").attr("id",data.roomId)
            		$("#okDeleteRoom").attr("href","/deleteRoom/"+data.roomId+"/"+data.roomTypeId);
            	})
            	$(".roomDetail").css("display","block");
            })
            $(".closeRoomDetail").click(function(){
            	$(".roomDetail").css("display","none");
            })  
            $(".openUpdateRoom").click(function(){
            	var roomId = $(this).attr("id");
            	$.post("/showRoom/"+roomId,function(data){
            		$(".updateroomId").val(data.roomId); 
            		$(".updateroomTypeId").append("<option value='"+data.roomTypeId+"' class='updateroomTypeIdoption'>"+data.roomTypeName+"</option>");
            		$(".updateroomNumber").val(data.roomNumber);
            		if(data.roomStatus ==0){
            			$(".updateroomStatus").append("<option value='0' class='roomStatusoption'>空闲</option>");
            			$(".updateroomStatus").append("<option value='1' class='roomStatusoption'>已预订</option>");
            			$(".updateroomStatus").append("<option value='2' class='roomStatusoption'>已入住</option>");
            		}else if(data.roomStatus ==1){
            			$(".updateroomStatus").append("<option value='1' class='roomStatusoption'>已预订</option>");
            			$(".updateroomStatus").append("<option value='0' class='roomStatusoption'>空闲</option>");           			
            			$(".updateroomStatus").append("<option value='2' class='roomStatusoption'>已入住</option>");
            		}else if(data.roomStatus ==2){option
            			$(".updateroomStatus").append("<option value='2' class='roomStatusoption'>已入住</option>");
            			$(".updateroomStatus").append("<option value='0' class='roomStatusoption'>空闲</option>");
            			$(".updateroomStatus").append("<option value='1' class='roomStatusoption'>已预订</option>");            			
            		}   
            		if(data.roomSanitation ==0){
            			$(".updateroomSanitation").append("<option value='0' class='updateroomSanitationoption'>已打扫</option>");
            			$(".updateroomSanitation").append("<option value='1' class='updateroomSanitationoption'>脏房</option>");
            			$(".updateroomSanitation").append("< value='2' class='updateroomSanitationoption'>维修中</option>");
            		}else if(data.roomSanitation ==1){
            			$(".updateroomSanitation").append("<option value='1' class='updateroomSanitationoption'>脏房</option>");
            			$(".updateroomSanitation").append("<option value='0' class='updateroomSanitationoption'>已打扫</option>");
            			$(".updateroomSanitation").append("<option value='2' class='updateroomSanitationoption'>维修中</option>"); 
            		}else if(data.roomSanitation ==2){
            			$(".updateroomSanitation").append("<option value='2' class='updateroomSanitationoption'>维修中</option>"); 
            			$(".updateroomSanitation").append("<option value='0' class='updateroomSanitationoption'>已打扫</option>");
            			$(".updateroomSanitation").append("<option value='1' class='updateroomSanitationoption'>脏房</option>");            			
            		}             		
            		$(".updateroomStorey").val(data.roomStorey); 
            		if(data.roomWindow ==0){
            			$(".updateroomWindow").append("<option value='0' class='updateroomWindowoption'>有窗</option>");
            			$(".updateroomWindow").append("<option value='1' class='updateroomWindowoption'>无窗</option>");
            		}else if(data.roomWindow ==1){
            			$(".updateroomWindow").append("<option value='1' class='updateroomWindowoption'>无窗</option>");
            			$(".updateroomWindow").append("<option value='0' class='updateroomWindowoption'>有窗</option>");   			
            		}           		
            		$(".updateroomBed").val(data.roomBed); 
            		if(data.roomGuestNumber ==0){
            			$(".updateroomGuestNumber").append("<option value='0' class='updateroomGuestNumberoption'>不限</option>");
            			$(".updateroomGuestNumber").append("<option value='1' class='updateroomGuestNumberoption'>1</option>");
            			$(".updateroomGuestNumber").append("<option value='2' class='updateroomGuestNumberoption'>2</option>");
            			$(".updateroomGuestNumber").append("<option value='3' class='updateroomGuestNumberoption'>3</option>");
            			$(".updateroomGuestNumber").append("<option value='4' class='updateroomGuestNumberoption'>4</option>");
            		}else if(data.roomGuestNumber ==1){
            			$(".updateroomGuestNumber").append("<option value='1' class='updateroomGuestNumberoption'>1</option>");           			
            			$(".updateroomGuestNumber").append("<option value='2' class='updateroomGuestNumberoption'>2</option>");
            			$(".updateroomGuestNumber").append("<option value='3' class='updateroomGuestNumberoption'>3</option>");
            			$(".updateroomGuestNumber").append("<option value='4' class='updateroomGuestNumberoption'>4</option>"); 
            			$(".updateroomGuestNumber").append("<option value='0' class='updateroomGuestNumberoption'>不限</option>");
            		}else if(data.roomGuestNumber ==2){
            			$(".updateroomGuestNumber").append("<option value='2' class='updateroomGuestNumberoption'>2</option>");
            			$(".updateroomGuestNumber").append("<option value='1' class='updateroomGuestNumberoption'>1</option>");           					
            			$(".updateroomGuestNumber").append("<option value='3' class='updateroomGuestNumberoption'>3</option>");
            			$(".updateroomGuestNumber").append("<option value='4' class='updateroomGuestNumberoption'>4</option>"); 
            			$(".updateroomGuestNumber").append("<option value='0' class='updateroomGuestNumberoption'>不限</option>");
            		}else if(data.roomGuestNumber ==3){
            			$(".updateroomGuestNumber").append("<option value='3' class='updateroomGuestNumberoption'>3</option>");
            			$(".updateroomGuestNumber").append("<option value='1' class='updateroomGuestNumberoption'>1</option>");           			
            			$(".updateroomGuestNumber").append("<option value='2' class='updateroomGuestNumberoption'>2</option>");		
            			$(".updateroomGuestNumber").append("<option value='4' class='updateroomGuestNumberoption'>4</option>"); 
            			$(".updateroomGuestNumber").append("<option value='0' class='updateroomGuestNumberoption'>不限</option>");
            		}else if(data.roomGuestNumber ==4){
            			$(".updateroomGuestNumber").append("<option value='4' class='updateroomGuestNumberoption'>4</option>");
            			$(".updateroomGuestNumber").append("<option value='1' class='updateroomGuestNumberoption'>1</option>");           			
            			$(".updateroomGuestNumber").append("<option value='2' class='updateroomGuestNumberoption'>2</option>");
            			$(".updateroomGuestNumber").append("<option value='3' class='updateroomGuestNumberoption'>3</option>");            			 
            			$(".updateroomGuestNumber").append("<option value='0' class='updateroomGuestNumberoption'>不限</option>");
            		}  
            		$(".updateroomFacility").val(data.roomFacility);
            	})
            	$(".updateRoom").css("display","block");
	            })


	            $(".closeUpdateRoom").click(function(){
	            	$(".updateroomTypeIdoption").remove();
	            	$(".roomStatusoption").remove();
	            	$(".updateroomSanitationoption").remove();
	            	$(".updateroomWindowoption").remove();
	            	$(".updateroomGuestNumberoption").remove();
	            	$(".updateRoom").css("display","none");
	            })          
            $(".openDeleteRoom").click(function(){
				var v_id = $(this).attr("id");
				console.log(v_id);
				$("#okDeleteRoom").attr('href',"/deleteRoom?roomId="+v_id);
            	$(".deleteRoom").css("display","block");
            })
            $(".closeDeleteRoom").click(function(){
            	$(".deleteRoom").css("display","none");
            })
            $(".openLogistics").click(function(){
            	$(".roomIdRoomSanitation").val($(this).attr("id"));
            	$(".roomNumberRoomSanitationInp").val($(this).attr("d"));
            	setInterval(function(){
					var dates = new Date();
					var years = dates.getFullYear();
					var monhs = dates.getMonth()+1;
					var days = dates.getDate();
					var h = dates.getHours();
					var m = dates.getMinutes();
					var s = dates.getSeconds();
					$(".maintainFinishTime").val(years+"-"+monhs+"-"+days+" "+h+":"+m+":"+s);
				},1000)
            	$(".logistics").css("display","block");
            	$(".roomNumberRoomSanitationInp").val($(this).attr("c"));
            	if($(this).attr("b") == 2){
            		$(".from1").css("display","none");
	            	$(".from2").css("display","block");
            	}else if($(this).attr("b") == 1){
            		$(".from2").css("display","none");
	            	$(".from1").css("display","block"); 
            	}else if($(this).attr("b") == 0){
            		$(".maintainStatus0").css("display","none");
            		$(".maintainStatus2").css("display","block");  
            	}
	            $(".btns1").click(function(){
	            	$(".from2").css("display","none");
	            	$(".from1").css("display","block");   
	            })
	            $(".btns2").click(function(){     	
	            	$(".from1").css("display","none");
	            	$(".from2").css("display","block");
	            	$(".maintainStatus").on('change',function(){
	            	if($(".maintainStatus").val() == 0){
	            		$(".maintainStatus2").css("display","none");
	            		$(".maintainStatus0").css("display","block");           		
	            	}else if($(".maintainStatus").val() == 2){
	            		$(".maintainStatus0").css("display","none");
	            		$(".maintainStatus2").css("display","block");           		
	            	}
	            	})
	            })
            })
            $(".closeLogistics").click(function(){
            	$(".logistics").css("display","none");
            	$(".from2").css("display","none");
            	$(".from1").css("display","block");
            })
            
            $(".openReservation").click(function(){
            	$(".roomIdInp").val($(this).attr("id"));
            	$(".roomNumberInp").val($(this).attr("a"));
            	setInterval(function(){
					var dates = new Date();
					var years = dates.getFullYear();
					var monhs = dates.getMonth()+1;
					var days = dates.getDate();
					var h = dates.getHours();
					var m = dates.getMinutes();
					var s = dates.getSeconds();
					$(".reservationTime").val(years+"-"+monhs+"-"+days+" "+h+":"+m+":"+s);
				},1000)
            	$(".reservation").css("display","block");
            })
            $(".closeReservation").click(function(){
            	$(".reservation").css("display","none");
            })
            
            $(".openReservationDetail").click(function(){
            	var roomId = $(this).attr("id");
            	$.post("/showReservation/"+roomId,function(data){
            		$(".reservationIdUnsubscribeInp").val(data.reservationId);
			        $(".roomNumberDetail").val(data.roomNumber);
			        $(".reservationNameDetail").val(data.reservationName);
			        $(".reservationIdCardDetail").val(data.reservationIdCard);
			        $(".reservationPhoneNumberDetail").val(data.reservationPhoneNumber);
			        $(".reservationTimeDetail").val(data.reservationTime);
			        $(".expectedTimeOfArrivalDetail").val(data.expectedTimeOfArrival);
			        if(data.reservationStatus == 0){
			        	$(".reservationStatusDetail").val("未入住");
			        }				        
			        $(".reservationOccupancyDaysDetail").val(data.reservationOccupancyDays);
			        $(".reservationForegiftDetail").val(data.reservationForegift);	
            	})
            	$(".reservationDetail").css("display","block");
            })
            $(".closeReservationDetail").click(function(){
            	$(".reservationDetail").css("display","none");
            })
            var DefaultRatio = 0.8;
            $(".openUnsubscribe").click(function(){
            	var roomId = $(this).attr("id");
            	$(".roomIdUnsubscribeInp").val(roomId);
				$.post("/showReservation/"+roomId,function(data){					
					 	$(".reservationIdUnsubscribeInp").val(data.reservationId);
				        $(".roomNumberUnsubscribeInp").val(data.roomNumber);
				        $(".reservationNameUnsubscribeInp").val(data.reservationName);
				        $(".reservationIdCardUnsubscribeInp").val(data.reservationIdCard);
				        $(".reservationPhoneNumberUnsubscribeInp").val(data.reservationPhoneNumber);
				        $(".reservationTimeUnsubscribeInp").val(data.reservationTime);
				        $(".expectedTimeOfArrivalUnsubscribeInp").val(data.expectedTimeOfArrival);
				        if(data.reservationStatus == 0){
				        	$(".reservationStatusUnsubscribeInp").val("未入住");
				        }				        
				        $(".reservationOccupancyDaysUnsubscribeInp").val(data.reservationOccupancyDays);
				        $(".reservationForegiftUnsubscribeInp").val(data.reservationForegift);				        
				        $(".unsubscribeForegiftUnsubscribeInp").val(data.reservationForegift*DefaultRatio);	
				        $(".okDefaultRatio").click(function(){
				        	DefaultRatio = $(".updateUnsubscribeForegift").val();
				        	$(".unsubscribeForegiftUnsubscribeInp").val($(".reservationForegiftUnsubscribeInp").val()*DefaultRatio);	
				        	$(".defaultRatio").css("display","none");
				        })
				        
				  })
            	$(".unsubscribe").css("display","block");
            })
            $(".closeUnsubscribe").click(function(){
            	$(".unsubscribe").css("display","none");
            })
            $(".openDefaultRatio").click(function(){    
            	$(".updateUnsubscribeForegift").val(DefaultRatio)
            	$(".defaultRatio").css("display","block");
            })
            $(".closeDefaultRatio").click(function(){
            	$(".defaultRatio").css("display","none");
            })
            var individualPrice;
            var vipPrice;
            //入住登记
            var checkinTimes;
            $(".openCheckIn").click(function(){
            	$(".roomIdCheckInInp").val($(this).attr("id"));
            	var roomId = $(this).attr("id");
            	$(".roomNumberCheckInInp").val($(this).attr("a")); 
            	bool = $(this).attr("b");
            	roomTypeId = $(this).attr("c");
            	if($(this).attr("b") == 1){
            		$.post("/showReservation/"+roomId,function(data){					
    				 	$(".reservationIdInp").val(data.reservationId);
    			        $(".checkInNameInp").val(data.reservationName);
    			        $(".checkInIdCardInp").val(data.reservationIdCard);
    			        var IdCards = $(".checkInIdCardInp").val();    		
    	           		$.post("/showJudgeUsers/"+IdCards,function(date){
    	           			if(date >= 1){
    	           				$(".customerTypes").remove();
    	           				$(".customerType").append("<option value='0' class='customerTypes'>会员客户</option>");              			           			               		
    	           				$(".checkInRoomPrice").val(vipPrice);
    	           			}
    	           			if(date <1){
    	           				$(".customerTypes").remove();
    	   	    				$(".customerType").append("<option value='1' class='customerTypes'>普通客户</option>");
    	   	    				$(".checkInRoomPrice").val(individualPrice);
    	           			}
    	           		})
    			        $(".checkInPhoneInp").val(data.reservationPhoneNumber);  
    			        num = data.reservationForegift;
    			        $(".temporary").click(function(){  			        	
    			        	$(".reservationIdInp").val("0");
        			        $(".checkInNameInp").val("");
        			        $(".checkInIdCardInp").val("");
        			        $(".checkInPhoneInp").val("");
        			        var da = ((data.expectedTimeOfArrival).substr(8,2)-1);
        			        if(da == 0){
        			        	da =30;
        			        }
        			        $(".departureTimes").html((data.expectedTimeOfArrival).substring(0,8)+da+"前退房可入住");
    			        })
    			        $(".direct").click(function(){
    			        	$(".reservationIdInp").val(data.reservationId);
        			        $(".checkInNameInp").val(data.reservationName);
        			        $(".checkInIdCardInp").val(data.reservationIdCard);
        			        $(".checkInPhoneInp").val(data.reservationPhoneNumber);
        			        $(".departureTimes").html("");
    			        })
    			        $(".checkInBtn").css("display","block");   			        
            	})
            	
            	
            	}
            	
            	$.post("/showRoomType/"+roomTypeId,function(data){							
					individualPrice = data.individualPrice;
					vipPrice = data.vipPrice
				})
            	setInterval(function(){
					var dates = new Date();
					var years = dates.getFullYear();
					var monhs = dates.getMonth()+1;
					var days = dates.getDate();
					var h = dates.getHours();
					var m = dates.getMinutes();
					var s = dates.getSeconds();
					$(".checkinTime").val(years+"-"+monhs+"-"+days+" "+h+":"+m);
					checkinTimes = years+"-"+monhs+"-"+days;					
				},1000)
				$(".checkInIdCardInp").on("input propertychange",function(){
					var IdCards = $(".checkInIdCardInp").val();    		
	           		$.post("/showJudgeUsers/"+IdCards,function(date){
	           			if(date >= 1){
	           				$(".customerTypes").remove();
	           				$(".customerType").append("<option value='0' class='customerTypes'>会员客户</option>");              			           			               		
	           				$(".checkInRoomPrice").val(vipPrice);
	           			}
	           			if(date <1){
	           				$(".customerTypes").remove();
	   	    				$(".customerType").append("<option value='1' class='customerTypes'>普通客户</option>");
	   	    				$(".checkInRoomPrice").val(individualPrice);
	           			}
	           		})
				})
				$(".departureTime").on("change",function(){
					var a = $(".departureTime").val();
					var b = checkinTimes;
					var date1 = new Date(b); 
				    var date2 = new Date(a); 
				    var date3 = date2.getTime() - date1.getTime(); 
				    var days=Math.floor(date3 / (24*3600*1000));
				    if(days <=0){
				    	days=1;
				    }
					$(".checkinDay").val(days);
					if(bool == 1){																
	    			        $(".checkInForegift").val($(".checkInRoomPrice").val()*$(".checkinDay").val()-num);  		        
	            	} 
					if(bool != 1){																
    			        $(".checkInForegift").val($(".checkInRoomPrice").val()*$(".checkinDay").val());  		        
            	} 
				})					 
            	$(".checkIn").css("display","block"); 
        	
            })
            $(".closeCheckIn").click(function(){
            	$(".customerTypes").remove;
            	$(".departureTimes").html("");
            	$(".checkInBtn").css("display","none"); 
            	$(".checkIn").css("display","none");
            })
            
            
             $(".openShowCheckIn").click(function(){
            	var roomId = $(this).attr("id");
            		$.post("/showCheckIn/"+roomId,function(data){
                		$(".roomNumberShowCheckIn").val(data.roomNumber);
                		$(".checkInNameShowCheckIn").val(data.checkInName);
                		$(".checkInIdCardShowCheckIn").val(data.checkInIdCard);
                		$(".checkInPhoneShowCheckIn").val(data.checkInPhone);
                		if(data.usersId == 0){
                			$(".customerTypes").remove();
            				$(".customerType").append("<option value='1' class='customerTypes'>普通客户</option>");
                		}
                		if(data.clientId == 0){
                			$(".customerTypes").remove();
            				$(".customerType").append("<option value='0' class='customerTypes'>会员客户</option>");
                		}
                		$(".checkinTimeShowCheckIn").val(data.checkinTime);
                		$(".departureTimeShowCheckIn").val(data.departureTime);
                		$(".checkinDayShowCheckIn").val(data.checkinDay);
                		$(".checkinForegiftShowCheckIn").val(data.checkinForegift);
                	})            							
            	$(".showCheckIn").css("display","block");
            	
            })
            $(".closeShowCheckIn").click(function(){
            	$(".showCheckIn").css("display","none");
            })
            
            $(".openContinued").click(function(){
            	var roomId = $(this).attr("id");
            	$(".roomIdContinuedInp").val(roomId);
            	var roomTypeId = $(this).attr("c")
            	$.post("/showRoomType/"+roomTypeId,function(data){							
					individualPrice = data.individualPrice;
					vipPrice = data.vipPrice
				})
            		$.post("/showCheckIn/"+roomId,function(data){
                		$(".roomNumberShowCheckIn").val(data.roomNumber);
                		$(".checkInNameShowCheckIn").val(data.checkInName);
                		$(".checkInIdCardShowCheckIn").val(data.checkInIdCard);
                		$(".checkInPhoneShowCheckIn").val(data.checkInPhone);
                		if(data.usersId == 0){
                			$(".customerTypes").remove();
            				$(".customerType").append("<option value='1' class='customerTypes'>普通客户</option>");
            				$(".price").val(individualPrice);
                		}
                		if(data.clientId == 0){
                			$(".customerTypes").remove();
            				$(".customerType").append("<option value='0' class='customerTypes'>会员客户</option>");
            				$(".price").val(vipPrice);
                		}
                		$(".checkinTimes").val(data.checkinTime);
                		$(".departureTimes").val(data.departureTime);
                		$(".checkinForegiftShowCheckIn").val(data.checkinForegift);
                		$(".departureTimec").on("change",function(){
        					var a = $(".departureTimec").val().substring(0,10);
        					var b = $(".checkinTimes").val().substring(0,10);
        					var date11 = new Date(b); 
        				    var date22 = new Date(a); 
        				    var date33 = date22.getTime() - date11.getTime(); 
        				    var dayss = Math.floor(date33 / (24*3600*1000));
        					$(".continuedDays").val(dayss);
        					$(".continuedForegift").val($(".price").val()*dayss-$(".checkinForegiftShowCheckIn").val());
        				})
                		
                		
                	})            							
            	$(".continued").css("display","block");
            	
           		 })
            $(".closeContinued").click(function(){
            	$(".continued").css("display","none");
            })      
            setInterval(function(){
					var dates = new Date();
					var years = dates.getFullYear();
					var monhs = dates.getMonth()+1;
					var days = dates.getDate();
					var h = dates.getHours();
					var m = dates.getMinutes();
					var s = dates.getSeconds();
					$(".checkOutTimeInps").val(years+"-"+monhs+"-"+days+" "+h+":"+m);
					checkinTimes = years+"-"+monhs+"-"+days;
				},1000)
            $(".openCheckOut").click(function(){  
            	var roomTypeId = $(this).attr("c");
            	$.post("/showRoomType/"+roomTypeId,function(data){							
					individualPrice = data.individualPrice;
					vipPrice = data.vipPrice
				})
            	var roomId = $(this).attr("id"); 
            	$(".roomIdCheckOutInp").val(roomId);
        		$.post("/showCheckIn/"+roomId,function(data){
        			if(data.usersId == 0){
        				$(".checkOutForm").append("<input type='hidden' name='clientId' value='"+data.clientId+"'>")
        			}
        			if(data.clientId == 0){
        				$(".checkOutForm").append("<input type='hidden' name='usersId' value='"+data.usersId+"'>")
        			}
            		$(".roomNumberCheckOutInp").val(data.roomNumber);
            		$(".checkOutNameInp").val(data.checkInName);
            		$(".checkOutIdCardInp").val(data.checkInIdCard);
            		$(".checkOutPhoneInp").val(data.checkInPhone);
            		if(data.usersId == 0){
            			$(".customerTypes").remove();
        				$(".customerType").append("<option value='1' class='customerTypes'>普通客户</option>");
            			$(".roomPrice").val(individualPrice);
            		}
            		if(data.clientId == 0){
            			$(".customerTypes").remove();
        				$(".customerType").append("<option value='0' class='customerTypes'>会员客户</option>");
        				$(".roomPrice").val(vipPrice);
            		}
            		$(".checkInTimeInps").val(data.checkinTime);

 						var a = $(".checkInTimeInps").val().substring(0,10);
     					var b = new Date();
     					var date1 = new Date(b); 
     				    var date2 = new Date(a);
     				    var date3 = date1.getTime() - date2.getTime(); 
     				    var das = Math.floor(date3 / (24*3600*1000)); 
     				    if(das <=0){
     				    	das = 1;
     				    }
     				   $(".checkInDayss").val(das);
            		$(".checkinForegifts").val(data.checkinForegift);
            		$(".amountReceiveds").val($(".roomPrice").val()*das-$(".checkinForegifts").val());
            	}) 
            	$(".checkOut").css("display","block");
            })
            $(".closeCheckOut").click(function(){
            	$(".checkOut").css("display","none");
            })
});
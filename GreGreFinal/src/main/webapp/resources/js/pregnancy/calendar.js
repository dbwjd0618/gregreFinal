   $(document).ready(function () { 
            var result_url = '';
            var mydate = new Date();

            var year = mydate.getFullYear();
            var month = mydate.getMonth()+1;
            var daym = mydate.getDate();
            var cnt = '';
        
            //if (year < 1000)
            //	year += 1900;
        
            if (month < 10)
                month = "0" + month;
        
            if (daym < 10)
                daym = "0" + daym;
        
            //var f_year = mydate.getFullYear();
            var result_url = '';
            var i = '';
            
            $('#s_year option').remove();
            $('#s_month option').remove();
            
            
            for(i=0; i < 4; i++){
                if(i==0){
                    $('#s_year').append('<option value="'+(year-1)+'" selected>'+(year-1)+'</option>');
                    $('#s_year').append('<option value="'+(year+i)+'" selected>'+(year+i)+'</option>');
                }else $('#s_year').append('<option value="'+(year+i)+'">'+(year+i)+'</option>');
            }
            
            for(i=1; i <= 12; i++){
                if(i==month) $('#s_month').append('<option value="'+i+'" selected>'+i+'</option>');
                else $('#s_month').append('<option value="'+i+'">'+i+'</option>');
            }
            fnChoiceDt(month);
            
            $('#s_month').change(function(){
                
                var val = $(this).val();
                fnChoiceDt(val);
                
            });
            
            function fnChoiceDt(val){
                $('#s_day option').remove();
                if(val == '1' || val == '3' || val == '5' || val == '7' || val == '8' || val == '10' || val == '12'){
                    cnt = 31;
                }else if(val == '2'){
                    if ((year % 4 != 0) || (year % 100 == 0) && (year % 400 != 0)) cnt = 28;
                    else cnt = 29;
                }else{
                    cnt = 30;
                }
                   
                for(i=1; i <= cnt; i++){
                    if(i==daym) $('#s_day').append('<option value="'+i+'" selected>'+i+'</option>');
                    else $('#s_day').append('<option value="'+i+'">'+i+'</option>');
                }
            
            }
            
            $(".sub003_001").click(function () {
            	console.log("채팅");
                var y = $("#s_year").val();
                var m = $("#s_month").val();
                var d = $("#s_day").val();
                var s_type = $(':radio[name="s_type"]:checked').val();
                var s_day1 = $("#s_day1").val();
                var s_day2 = $("#s_day2").val();
                
                var frm = document.sfrm;
                var g_date = '';
                var g_year = '';
                var g_month = '';
                var g_Day = '';
        
                y = parseInt(y, 10);
                m = parseInt(m, 10);
                d = parseInt(d, 10);
                
        
                if (isDate(y, m, d) == false) {
                    alert("날짜오류입니다.");
                    return false;
                }
                
                if(m >= 1 &&  m <= 3){
                    g_month = m + 9;
                    g_year = y;
                }else{
                    g_month = m - 3;
                    g_year = y + 1; 
                }
                
                g_Day = d + 7;
                g_date = g_year + "-" + g_month + "-" + g_Day;
                
        
                if(m < 10) m = "0" + m;
                if(d < 10) d = "0" + d;
                
                var s_day = y + "-" + m + "-" + d;				
                g_day = year + "-" + month + "-" + daym;
        
                if (s_day > g_day) {
                    alert("생리시작일자는 현재일자부터 이전일로 선택하세요.");
                    return false;
                }
        
                 
        
                if (s_type == "A") {
                    if (s_day1 =="") {
                        alert("주기 일자를 입력하세요.");
                        frm.s_day1.focus();
                        return false;
                    }
        
                    if (s_day1.length > 2) {
                        alert("주기 일자를 확인하세요.(최대 2자리)");
                        frm.s_day1.focus();
                        return false;
                    }
                
                    fnDiffDay(s_type,s_day,s_day1,""); 
                    result_url = 'http://www.childcare.go.kr/cpin/contents/010204000000_result.jsp?b1='+b1+'&b2='+b2+'&baeranil='+baeranil+'&baeranil2=';
                    
      
             
                } else {
             
                    if (s_day1=="") {
                        alert("주기 일자를 입력하세요.");
                        frm.s_day1.focus();
                        return false;
                    }
                    
                    if (s_day2=="") {
                        alert("주기 일자를 입력하세요.");
                        frm.s_day2.focus();
                        return false;
                    }
                    
                    if (s_day1.length > 2) {
                        alert("주기 일자를 확인하세요.(최대 2자리)");
                        frm.s_day1.focus();
                        return false;
                    }
                    
                    if (s_day2.length > 2) {
                        alert("주기 일자를 확인하세요.(최대 2자리)");
                        frm.s_day2.focus();
                        return false;
                    }
             
             
                    if (eval(frm.s_day1.value) >= eval(frm.s_day2.value)) {
                        alert("주기 일자를 확인하세요.(시작 주기일자가 종료 주기일자보다 작아야 합니다)");
                        frm.s_day1.focus();
                        return false;
                    }
                    
                    fnDiffDay(s_type,s_day,s_day1,s_day2); 
                    result_url = 'http://www.childcare.go.kr/cpin/contents/010204000000_result.jsp?b1='+b1+'&b2='+b2+'&baeranil='+baeranil+'&baeranil2='+baeranil2;
             
                }
                
                
                
                var form=document.createElement("form");
                form.name='tempPost';
                form.id="menseForm"
                form.method='post';
                form.action='./menses.do'; 
               
                var input1=document.createElement("input");
                input1.type="hidden";
                input1.name='ageStart';
                input1.value= b1;
                
                console.log(form.action);
                console.log(input1);
                var input2=document.createElement("input");
                input2.type="hidden";
                input2.name='ageEnd';
                input2.value= b2;
                console.log(input2);
                var input3=document.createElement("input");
                input3.type="hidden";
                input3.name='cycle';
                input3.value= s_day1;
                console.log(input3);
                var input4=document.createElement("input");
                input4.type="hidden";
                input4.name='startDay';
                input4.value= start_day	;
                console.log(input4);
                
                
             
                $(form).append(input1);
                $(form).append(input2);
                $(form).append(input3);
                $(form).append(input4);
                document.body.appendChild(form);
                
                
                
                $.ajax({
    				url:"${pageContext.request.contextPath}/pregnancy/menses.do",
    				type:"post",
    				data: $("#menseForm").serialize(),
    				success: data =>{
    					console.log(data);
    				
    				},
    					error: (x,s,e) => {
    						console.log(x,s,e);
    					}
    			});
        
        
            //	$("#div_result").show();
                //result_url = '/cpin/contents/100500000000_1_result1.jsp';//?g_month='+g_month+'&g_Day='+g_Day+'&diffDt='+diffDt;
                //frm.flag.value = 'SlL';
                //frm.diffDt.value = diffDt;
            //	frm.g_month.value = g_month;
            //	frm.g_Day.value = g_Day;
            //	frm.target = 'i_result_area';
            //	frm.action = result_url;
              //  frm.submit();
                $("#i_result_area").attr("src", result_url);
                //window.showModalDialog(encodeURI(openpage), "result", "dialogWidth:600px;dialogHeight:580px;center:yes;help:no;status:no;scroll:no;resizable:no");
                //window.open(url);
            });
         
            $('input[name="s_type"]').change(function(){
                var chk_opt = $(this).val();
                
                jugi_info.innerHTML = "";
                    
                   var str = "";
                if(chk_opt == "A"){
                    str = "<input name='s_day1' id='s_day1'  type='text' class='input numchk' style='width:50px;height:19px;font-size:9pt; color:#555555;' onKeyDown='fnOnlyNumber();'>&nbsp;&nbsp;<label for='s_day1'>일</label>"; 
                }else{
                    str = "<input name='s_day1' id='s_day1' type='text' class='input numchk' style='width:50px;height:19px;font-size:9pt; color:#555555;' onKeyDown='fnOnlyNumber();'>&nbsp;&nbsp;<label for='s_day1'>일</label> ~ <input name='s_day2' id='s_day2' type='text' class='input numchk' style='width:50px;height:19px;font-size:9pt; color:#555555;' onKeyDown='fnOnlyNumber();'>&nbsp;&nbsp;<label for='s_day2'>일</label>"; 
                }
                
                   jugi_info.innerHTML += str;
            });
            
            //회원 캘린더 저장
            $(".sub003_002").click(function () {
                var y = $("#s_year").val();
                var m = $("#s_month").val();
                var d = $("#s_day").val();
                var s_type = $(':radio[name="s_type"]:checked').val();
                var s_day1 = $("#s_day1").val();
                var s_day2 = $("#s_day2").val();
                
                var frm = document.sfrm;
                var g_date = '';
                var g_year = '';
                var g_month = '';
                var g_Day = '';
        
                y = parseInt(y, 10);
                m = parseInt(m, 10);
                d = parseInt(d, 10);
                
        
                if (isDate(y, m, d) == false) {
                    alert("날짜오류입니다.");
                    return false;
                }
                
                if(m >= 1 &&  m <= 3){
                    g_month = m + 9;
                    g_year = y;
                }else{
                    g_month = m - 3;
                    g_year = y + 1; 
                }
                
                g_Day = d + 7;
                g_date = g_year + "-" + g_month + "-" + g_Day;
                
        
                if(m < 10) m = "0" + m;
                if(d < 10) d = "0" + d;
                
                var s_day = y + "-" + m + "-" + d;				
                g_day = year + "-" + month + "-" + daym;
        
                if (s_day > g_day) {
                    alert("생리시작일자는 현재일자부터 이전일로 선택하세요.");
                    return false;
                }
        
                 
        
                if (s_type == "A") {
                    if (s_day1 =="") {
                        alert("주기 일자를 입력하세요.");
                        frm.s_day1.focus();
                        return false;
                    }
        
                    if (s_day1.length > 2) {
                        alert("주기 일자를 확인하세요.(최대 2자리)");
                        frm.s_day1.focus();
                        return false;
                    }
                
                    fnDiffDay(s_type,s_day,s_day1,""); 
                    result_url = 'http://www.childcare.go.kr/cpin/contents/010204000000_result.jsp?b1='+b1+'&b2='+b2+'&baeranil='+baeranil+'&baeranil2=';
                    
      
             
                } else {
             
                    if (s_day1=="") {
                        alert("주기 일자를 입력하세요.");
                        frm.s_day1.focus();
                        return false;
                    }
                    
                    if (s_day2=="") {
                        alert("주기 일자를 입력하세요.");
                        frm.s_day2.focus();
                        return false;
                    }
                    
                    if (s_day1.length > 2) {
                        alert("주기 일자를 확인하세요.(최대 2자리)");
                        frm.s_day1.focus();
                        return false;
                    }
                    
                    if (s_day2.length > 2) {
                        alert("주기 일자를 확인하세요.(최대 2자리)");
                        frm.s_day2.focus();
                        return false;
                    }
             
             
                    if (eval(frm.s_day1.value) >= eval(frm.s_day2.value)) {
                        alert("주기 일자를 확인하세요.(시작 주기일자가 종료 주기일자보다 작아야 합니다)");
                        frm.s_day1.focus();
                        return false;
                    }
                    
                    fnDiffDay(s_type,s_day,s_day1,s_day2); 
                    result_url = 'http://www.childcare.go.kr/cpin/contents/010204000000_result.jsp?b1='+b1+'&b2='+b2+'&baeranil='+baeranil+'&baeranil2='+baeranil2;
             
                }
                
                
                
                var form=document.createElement("form");
                form.name='tempPost';
                form.method='post';
                form.action='./menses.do'; 
               
                var input1=document.createElement("input");
                input1.type="hidden";
                input1.name='ageStart';
                input1.value= b1;
                
                console.log(form.action);
                console.log(input1);
                var input2=document.createElement("input");
                input2.type="hidden";
                input2.name='ageEnd';
                input2.value= b2;
                console.log(input2);
                var input3=document.createElement("input");
                input3.type="hidden";
                input3.name='cycle';
                input3.value= s_day1;
                console.log(input3);
                var input4=document.createElement("input");
                input4.type="hidden";
                input4.name='startDay';
                input4.value= start_day	;
                console.log(input4);
                
                
             
                $(form).append(input1);
                $(form).append(input2);
                $(form).append(input3);
                $(form).append(input4);
                document.body.appendChild(form);
                form.submit();
        
        
            //	$("#div_result").show();
                //result_url = '/cpin/contents/100500000000_1_result1.jsp';//?g_month='+g_month+'&g_Day='+g_Day+'&diffDt='+diffDt;
                //frm.flag.value = 'SlL';
                //frm.diffDt.value = diffDt;
            //	frm.g_month.value = g_month;
            //	frm.g_Day.value = g_Day;
            //	frm.target = 'i_result_area';
            //	frm.action = result_url;
              //  frm.submit();
                $("#i_result_area").attr("src", result_url);
                //window.showModalDialog(encodeURI(openpage), "result", "dialogWidth:600px;dialogHeight:580px;center:yes;help:no;status:no;scroll:no;resizable:no");
                //window.open(url);
            });
         
            $('input[name="s_type"]').change(function(){
                var chk_opt = $(this).val();
                
                jugi_info.innerHTML = "";
                    
                   var str = "";
                if(chk_opt == "A"){
                    str = "<input name='s_day1' id='s_day1'  type='text' class='input numchk' style='width:50px;height:19px;font-size:9pt; color:#555555;' onKeyDown='fnOnlyNumber();'>&nbsp;&nbsp;<label for='s_day1'>일</label>"; 
                }else{
                    str = "<input name='s_day1' id='s_day1' type='text' class='input numchk' style='width:50px;height:19px;font-size:9pt; color:#555555;' onKeyDown='fnOnlyNumber();'>&nbsp;&nbsp;<label for='s_day1'>일</label> ~ <input name='s_day2' id='s_day2' type='text' class='input numchk' style='width:50px;height:19px;font-size:9pt; color:#555555;' onKeyDown='fnOnlyNumber();'>&nbsp;&nbsp;<label for='s_day2'>일</label>"; 
                }
                
                   jugi_info.innerHTML += str;
            });
            
        
            
            
            function isDate(y, m, d) {
        
                switch (m) {
                    case 1:
                        if (d > 31) return false;
                        break;
                    case 2:        // 2월의 경우
                        if (d > 29) return false;
                        if (d == 29) {
                            // 2월 29의 경우 당해가 윤년인지를 확인
                            if ((y % 4 != 0) || (y % 100 == 0) && (y % 400 != 0))
                                return false;
                        }
                        break;
                    case 3:
                        if (d < 1 || d > 31) return false;
                        break;
                    case 4:
                        if (d < 1 || d > 30) return false;
                        break;
                    case 5:
                        if (d < 1 || d > 31) return false;
                        break;
                    case 6:
                        if (d < 1 || d > 30) return false;
                        break;
                    case 7:
                        if (d < 1 || d > 31) return false;
                        break;
                    case 8:
                        if (d < 1 || d > 31) return false;
                        break;
                    case 9:
                        if (d < 1 || d > 30) return false;
                        break;
                    case 10:
                        if (d < 1 || d > 31) return false;
                        break;
                    case 11:
                        if (d < 1 || d > 30) return false;
                        break;
                    case 12:
                        if (d < 1 || d > 31) return false;
                        break;
        
                }
                // 큰 달의 경우
                return true;
            }
            
            function fnDiffDay(s_type,s_day,s_day1,s_day2){
        
                var target_dt = new Date(s_day);
                var target_StDt;
                var b1_Dt;
                var b2_Dt;
                s_day1 = parseInt(s_day1);
                target_dt.setDate(target_dt.getDate());
                start_day = target_dt.getFullYear() +"-"+  fnDateSet(target_dt.getMonth() + 1) +"-" + fnDateSet(target_dt.getDate());		
        
                target_StDt = new Date(start_day);
                target_StDt.setDate(target_StDt.getDate()+(s_day1-14));
                baeranil = target_StDt.getFullYear() +"-"+  fnDateSet(target_StDt.getMonth() + 1) +"-" + fnDateSet(target_StDt.getDate());
        
                b1_Dt = new Date(baeranil);
                b1_Dt.setDate(b1_Dt.getDate()-3);
                b1 = b1_Dt.getFullYear() +"-"+  fnDateSet(b1_Dt.getMonth() + 1) +"-" + fnDateSet(b1_Dt.getDate());
                
                if(s_type == "A"){
                    b2_Dt = new Date(baeranil);
                }else{
                     target_EndDt = new Date(start_day);
                     target_EndDt.setDate(target_EndDt.getDate()+(s_day2-14));
                     baeranil2 = target_EndDt.getFullYear() +"-"+  fnDateSet(target_EndDt.getMonth() + 1) +"-" + fnDateSet(target_EndDt.getDate());
        
                     b2_Dt = new Date(baeranil2);
                }
                
                b2_Dt.setDate(b2_Dt.getDate()+3);
                b2 = b2_Dt.getFullYear() +"-"+  fnDateSet(b2_Dt.getMonth() + 1) +"-" + fnDateSet(b2_Dt.getDate());
                
            }
            
            function fnDateSet(dt){
                if(dt < 10)
                    return "0" + dt;
                else 
                    return dt;
            }
        });
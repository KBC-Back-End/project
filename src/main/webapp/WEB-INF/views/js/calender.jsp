<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>달력</title>
    <style type="text/css">
    .week{
    		font-weight:900;
    	}
        td{
            width: 55px;
            height: 35px;
            text-align: center;
            font-size: 15px;
            border:2px border-color:#red;
           
        }
    </style>
<script type="text/javascript">
        var today = new Date();
        var date = new Date();
        function prevCalendar() {
        
         today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
         buildCalendar(); 
        }
 
        function nextCalendar() {
           
             today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
             buildCalendar();
        }
        function buildCalendar(){
            var doMonth = new Date(today.getFullYear(),today.getMonth(),1);
            
            var lastDate = new Date(today.getFullYear(),today.getMonth()+1,0);
           
            var tbCalendar = document.getElementById("calendar");
           
            var tbCalendarYM = document.getElementById("tbCalendarYM");
          
             tbCalendarYM.innerHTML = today.getFullYear() + "년  " + (today.getMonth() + 1) + "월"; 
 
            
            while (tbCalendar.rows.length > 2) {
        
                  tbCalendar.deleteRow(tbCalendar.rows.length-1);
               
             }
             var row = null;
             row = tbCalendar.insertRow();
             
             var cnt = 0;
           
             for (i=0; i<doMonth.getDay(); i++) {
         
                  cell = row.insertCell();
                  cnt = cnt + 1;
             }
          
             for (i=1; i<=lastDate.getDate(); i++) { 
             
                  cell = row.insertCell();
                  cell.innerHTML = i;
                  cnt = cnt + 1;
              if (cnt % 7 == 1) {
               
                cell.innerHTML = "<font color=red>" + i
                
            }    
              if (cnt%7 == 0){
               
                  cell.innerHTML = "<font color=blue>" + i
                 
                   row = calendar.insertRow();
                 
              }
             
              if (today.getFullYear() == date.getFullYear()
                 && today.getMonth() == date.getMonth()
                 && i == date.getDate()) {
                 
                cell.bgColor = "yellow";
               }
             }
        }
    </script>
</head>
<body>
    <p></p>
<table id="calendar" border="3" align="center" style="border-color:#3131311f;background:ffd700;">
    <tr>
        <td><label onclick="prevCalendar()"><</label></td>
        <td align="center" id="tbCalendarYM" colspan="5">
        yyyy년 m월</td>
        <td><label onclick="nextCalendar()">>
            
        </label></td>
    </tr>
    <tr class="week">
        <td align="center"><font color ="red">일</td>
        <td align="center">월</td>
        <td align="center">화</td>
        <td align="center">수</td>
        <td align="center">목</td>
        <td align="center">금</td>
        <td align="center"><font color ="blue">토</td>
    </tr> 
</table>
<script language="javascript" type="text/javascript">
    buildCalendar();
</script>
</body>
</html>

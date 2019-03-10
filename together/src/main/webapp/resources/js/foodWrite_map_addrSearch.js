/**
 * map 마커표시와 주소검색에 필요한 검색기능
 */
//카카오 맵 api
document.write('<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5bf9ccbd97a21e86fc6689488b54cd2e&libraries=services"></script>');
   /* 지도 추가 개수 확인 cntLocation   */
   var cntLocation=0;
   /* 지도 추가 위해 marker를 담기위한 배열   */
   var positions=[];
   /* 주소를 좌표로 변경하여 저장*/ 
   var markerInfo={};
   // 지도에 표시된 마커 객체를 가지고 있을 배열입니다
   var markers = [];
   /* 지도 추가 확인 cntLocation   */
   var cntLocation=0;
   /* 추가되는 맵주소 개수 */
   var num=0; 
   /* 지도 추가 위해 marker를 담기위한 배열   */
   var positions=[];
   /* 지도 주소를 저장하기 위한 변수  */
   var korAddrs=[];
   var engAddrs=[];
   
   function addLocationList(korAddr, roadAddr){
         //console.log("addLocationList 진입 ok:"+ korAddr, roadAddr);
     
//         $('#korLocations').append('<div class=btn'+(num)+'>' + korAddr + '<button type="button" class="icon icon-remove location_list_btn"></button></div>');
         $('#korLocations').append('<input type="text" name="kAddress" readonly="readonly" value="'+ korAddr +'" />');
         
         //console.log($('#korLocations').value);
         $('#engLocations').append('<input type="text" name="address" readonly="readonly" value="'+ roadAddr +'" />'); 
         num++;
         
         //마커에 찍어주기 위한 한글 주소를 배열에 담음 
         korAddrs.push(korAddr);
         engAddrs.push(roadAddr);
         //마커표시할 함수 호출 
         makeMarker(korAddrs, engAddrs);
    }
   
   function makeMarker(korAddrs, engAddrs){
      console.log("koraddrs:"+ korAddrs);
      // 주소-좌표 변환 객체를 생성합니다
      var geocoder = new daum.maps.services.Geocoder();
      
      //console.log(markerInfo);
      
      for(var i=0;i<korAddrs.length;i++){
         //console.log("korAddrs[i]:"+korAddrs[i]); //값확인
         geocoder.addressSearch(korAddrs[i], function(result, status) {
            // 정상적으로 검색이 완료됐으면
            //console.log(result[0].address_name); // result에서 얻은 korAddr 주소값
            if (status === daum.maps.services.Status.OK) {
               
               var coords = new daum.maps.LatLng(result[0].y, result[0].x);
               //좌표 저장
               markerInfo.position = coords;
               //markerInfo에서 position을 addr속성 추가보다 늦게 처리하기 때문에 매개변수를 위해 addMarker를 여기서 호출 
               addMarker(markerInfo);
            } 
         });
         //영문 주소 저장
         markerInfo.addr=engAddrs[i];
         //addMarker(markerInfo);   
      }
   }   
   
   function addMarker(markerInfo) {
      
      //console.log(markerInfo);
      //console.log(korAddrs);
      //console.log(engAddrs);
      // 마커 생성
      var marker = new daum.maps.Marker({
         position : markerInfo.position,
         title : markerInfo.addr
      });
      // 마커가 지도 위에 표시되도록 설정
      marker.setMap(map);
      // 마커를 맵 센터로 이동
      map.setCenter(markerInfo.position);
      // 생성된 마커를 배열에 추가
      markers.push(marker);
   }
   
   //배열에 추가된 마커를 지도에서 안보이게하는 함수
   function hideMarkers() {
      setMarkers(null);    
   }
   
   function setMarkers(map) {
       for (var i = 0; i < markers.length; i++) {
           markers[i].setMap(map);
       }            
   }
   
   $(document).ready(function () {
      $('.location_list').on('click', '.location_list_btn', function(){
          
         /* 주소목록 제거 */
         console.log($(this).parent()[0].innerText);
         var delLocationName = $(this).parent()[0].innerText;
          
         var del = $(this).parent().attr("class");
         $(this).parent().parent().parent().find('.' + del).remove();
         
         //find()에서 .location_list div 는 .location_list 하부에 div를 찾는다는 의미. 둘의 간격이 하부임을 의미.
         //console.log($(this).parent().parent().parent().find('.location_list div'));

         //지도에 보이는 마커 초기화
         hideMarkers();
         //console.log("delLocationName:"+delLocationName );
         //console.log("before Addrs:"+korAddrs);
         
         //한국어든 영어 주소든 처리하는 인덱스 
         var KorIdx = korAddrs.indexOf(delLocationName);
         var EngIdx = engAddrs.indexOf(delLocationName);
         
         if (KorIdx > -1 || EngIdx > -1) {
            if(KorIdx > -1){
               korAddrs.splice(KorIdx, 1);
               engAddrs.splice(KorIdx, 1);
            }else if(EngIdx > -1){
               korAddrs.splice(EngIdx, 1);
               engAddrs.splice(EngIdx, 1);
            }   
            cntLocation--;
         }
         //console.log("cntLocation:"+cntLocation);
         //console.log("after:"+korAddrs);
         makeMarker(korAddrs, engAddrs);   
      });

   });
   
   function inputInfo(){
      
      if($('#engLocations div').text() == ""){
         $('.locaAlert span').html('&nbsp;&nbsp;<h7 style="color:red;font-weight:bold">Please Enter the place you want</h7>');
         return false;  
      }
      
      if($('input[name=title]').val() == ""){
         $('.titleAlert').html('<h7 style="color:red;font-weight:bold">Please Enter title you want</h7>')
         return false;
      }
      
      if($('#datepicker1').val() == ""){
         $('.dateAlert').html('<h7 style="color:red;font-weight:bold">Please Enter your date</h7>')
         return false;
      }
      
      if($('#timepicker').val() == ""){
         $('.timeAlert').html('<h7 style="color:red;font-weight:bold">Please Enter your Time</h7>');
         return false;
      }
      
      if($('textArea[name=matchingMsg]').val() == ""){
         $('.msgAlert').html('<h7 style="color:red;font-weight:bold">Please Enter your message</h7>');
         return false;
      }
      
      /* 언어 체크 여부를 파악하기 위한 변수 */
      /*
      var langCnt=0;
      $('input[name=language]').each(function(index,data){
         if($(data).prop('checked') == false){
            langCnt ++;
         }
      })
      
      if(langCnt == 3){
         $('.remarkAlert span').html('&nbsp;&nbsp;<h7 style="color:red;font-weight:bold">Please Enter your Languages</h7>');
         return false;
      }*/
       /*채식 유무 체크를 파악하기 위한 변수 */
      /*
      var vegeCnt =0;
      
      $('input[name=remarks]').each(function(index, data){
         console.log($(data).prop('checked'));
         if($(data).prop('checked') == false ){
            vegeCnt ++;
         }
      })
      
      if(vegeCnt == 2){
         $('.vegeAlert span').html('&nbsp;&nbsp;<h7 style="color:red;font-weight:bold">Please Enter your preference</h7>');
         return false;
      }*/
      
       /*한글, 영문 장소와 language 체크박스 배열 정리하기*/ 
      var korLoca="";
      var engLoca="";
      var language="";
      
      $('#korLocations div').each(function(index, data){
         if(index==0){
            korLoca +=data.innerText;
         }else{
            korLoca +=("/"+data.innerText);
         }
      });
      
      $('#engLocations div').each(function(index, data){
         if(index==0){
            engLoca +=data.innerText;
         }else{
            engLoca +=("/"+data.innerText);
         }
      });
      
      $('#kor').val(korLoca);
      $('#eng').val(engLoca);
      
      
      return true; 
   }
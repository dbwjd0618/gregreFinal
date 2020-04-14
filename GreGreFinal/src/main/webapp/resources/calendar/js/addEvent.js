var eventModal = $('#eventModal');
	
var modalTitle = $('.modal-title');
var editAllDay = $('#edit-allDay');
var editTitle = $('#edit-title');
var editType = $('#edit-type');
var editColor = $('#edit-color');
var editDesc = $('#edit-desc');


var memberId = $('#memberId');
var editStart = $('#edit-start');
var editEnd = $('#edit-end');
var mensesCycle = $('#mensesCycle');
var mensesNext = $('#mensesNext');
var childbearingAgeStart = $('#childbearingAgeStart');
var childbearingAgeEnd = $('#childbearingAgeEnd');
var pregnancyDate = $('#pregnancyDate');


var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');


/* ****************
 *  새로운 일정 생성
 * ************** */
var newEvent = function (start, end, eventType) {

    $("#contextMenu").hide(); //메뉴 숨김

    modalTitle.html('새로운 일정');
    editType.val(eventType).prop('selected', true);
    editTitle.val('');
    editStart.val(start);
    editEnd.val(end);
    editDesc.val('');

    
    addBtnContainer.show();
    modifyBtnContainer.hide();
    eventModal.modal('show');

    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
    var eventId = 1 + Math.floor(Math.random() * 1000);
    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/

    //새로운 일정 저장버튼 클릭
    $('#save-event').unbind();
    $('#save-event').on('click', function () {

    	console.log(mensesCycle.val());
        var eventData = {
            title: editTitle.val(),
            start: editStart.val(),
            end: editEnd.val(),
            mensescycle:mensesCycle.val(),
            next:mensesNext.val(),
            agestart:childbearingAgeStart.val(),
            ageend:childbearingAgeEnd.val(),
            predate:pregnancyDate.val(),           
//            memberId:memberId.val(),
            backgroundColor: editColor.val(),
            textColor: '#ffffff',
            allDay: false
        };

        console.log(eventData);
        if (eventData.start > eventData.end) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (eventData.title === '') {
            alert('일정명은 필수입니다.');
            return false;
        }

//        var realEndDay;

//        if (editAllDay.is(':checked')) {
//            eventData.start = moment(eventData.start).format('YYYY-MM-DD');
//            //render시 날짜표기수정
//            eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
//            //DB에 넣을때(선택)
//            realEndDay = moment(eventData.end).format('YYYY-MM-DD');
//
//            eventData.allDay = true;
//        }

        $("#calendar").fullCalendar('renderEvent', eventData, true);
        eventModal.find('input, textarea').val('');
        editAllDay.prop('checked', false);
        eventModal.modal('hide');
        
        console.log(start);
        console.log(eventData.start);
        console.log(eventData.mensescycle);
        var forwarding = {"mensesStart":eventData.start,
					    	"mensesEnd":eventData.end,
					    	"mensesCycle":eventData.mensescycle,
					    	"mensesNext":eventData.next,
					    	"childbearingAgeStart":eventData.agestart,
					    	"childbearingAgeEnd":eventData.ageend,
					    	"pregnancyDate":eventData.predate}
        console.log(forwarding);
        //새로운 일정 저장
        $.ajax({
            type: "post",
            url: "/Igre/myPage/periodAdd.do",
            data: {
            	"mensesStart":eventData.start,
		    	"mensesEnd":eventData.end,
		    	"mensesCycle":eventData.mensescycle, 
            },
            
            success: function (response) {
                //DB연동시 중복이벤트 방지를 위한
                $('#calendar').fullCalendar('removeEvents');
                $('#calendar').fullCalendar('refetchEvents');
            },
            error: (x,s,e) => {
				console.log(x,s,e);
			}
        });
    });
};
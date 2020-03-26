/**
 * @type : intro
 * @desc : common.js는 프로젝트 전반에 걸쳐 전 시스템에서 공통으로 사용하는 자바 스크립트를 기술한
 * 자바스크립트 파일이다. 빈번히 사용되는 자바스크립트들이 화면마다 반복적으로 개발되지
 * 않도록 미리 정의되어 있어서 common.js를 업무화면에 import시키기만 하면 common.js에 정의되어
 * 있는 스크립트들에 대해서는 각 개발자가 별도로 개발할 필요가 없다.
 * common.js 소스는 2개의 영역으로 구성되었다.
 * <pre>
 *     1. 공통 메세지 영역   : 화면에 사용되는 공통된 메세지들을 선언한 영역
 *     2. 공통 스크립트 영역 : 화면에 사용되는 공통 스크립트들이 기술된 영역
 * </pre>
 * 함수 Naming Rule은 다음과 같다.
 * <pre>
 *     - cf  : common function
 *     - co  : common object
 *     - cov : common object for validation
 * </pre>
 * @version : 1.0
 * @change  : <font color="blue">V1.0</font><br>
 *            - 최초작성
 */

/** 이 부분은 document로 generate되지 않습니다.
 * @JScript 참고자료
 * - isNaN : 다음은 모두 숫자로 본다. - "001", "0", "", null
 * - substr(index[, length]) -> index부터 끝까지 혹은 length갯수만큼.
 * - substring(start, end)  -> start index부터 end index전까지의 string
 * Date 오브젝트 생성자들 - dateObj = new Date()
 *                        - dateObj = new Date(dateVal)
 *                        - dateObj = new Date(year, month, date[, hours[, minutes[, seconds[,ms]]]])
 */


//----------------------------- 1. 공통 메세지 영역입니다. -------------------------------//


// common message
/**
 * @type   : var
 * @access : public
 * @desc   : 로그인 성공시 보여줄 공통 메세지
 */
var MSG_SUCCESS_LOGIN    = "@님 안녕하세요?";

/**
 * @type   : var
 * @access : public
 * @desc   : 저장할지의 여부를 확인받는 공통 메세지
 */
var MSG_CONFIRM_SAVE     = "저장하시겠습니까?";

/**
 * @type   : var
 * @access : public
 * @desc   : 저장완료를 알리는 공통 메세지
 */
var MSG_COMPLETE_SAVE     = "성공적으로 저장하였습니다.";

/**
 * @type   : var
 * @access : public
 * @desc   : 등록할지의 여부를 확인받는 공통 메세지
 */
var MSG_CONFIRM_REGIST     = "등록하시겠습니까?";

/**
 * @type   : var
 * @access : public
 * @desc   : 등록완료를 알리는 공통 메세지
 */
var MSG_COMPLETE_REGIST     = "성공적으로 등록하였습니다.";

/**
 * @type   : var
 * @access : public
 * @desc   : 수정할지의 여부를 확인받는 공통 메세지
 */
var MSG_CONFIRM_UPDATE     = "수정하시겠습니까?";

/**
 * @type   : var
 * @access : public
 * @desc   : 수정완료를 알리는 공통 메세지
 */
var MSG_COMPLETE_UPDATE     = "성공적으로 수정하였습니다.";

/**
 * @type   : var
 * @access : public
 * @desc   : 삭제할지의 여부를 확인받는 공통 메세지
 */
var MSG_CONFIRM_DELETE     = "삭제하시겠습니까?";

/**
 * @type   : var
 * @access : public
 * @desc   : 삭제완료를 알리는 공통 메세지
 */
var MSG_COMPLETE_DELETE     = "성공적으로 삭제하였습니다.";

/**
 * @type   : var
 * @access : public
 * @desc   : 변경사항이 없음을 알리는 공통 메세지.
 */
var MSG_NO_CHANGED        = "변경된 사항이 없습니다.";
/**
 * @type   : var
 * @access : public
 * @desc   : 파라미터 테스트 메세지
 */
var MSG_PARAM_TEST        = "전달된 3개의 파라미터는 @, @, @ 입니다.";

/**
 * @type   : var
 * @access : public
 * @desc   : 중복값 존재 알림 메세지
 */
var MSG_DUP_KEY        = "중복된 값이 존재합니다.";

/**
 * @type   : var
 * @access : public
 * @desc   : from to 날짜 크기 비교 메세지
 */
var MSG_FTDATE_NOTVALID    = "@ 는 @ 이후여야 합니다.";


/**
 * @type   : var
 * @access : public
 * @desc   : 특정 행위후 작업이 이루어 져야 하는 경우
 */
var MSG_AFTER_ACTVALID    = "@ 후 @(을)를 수행하여야 합니다.";


/**
 * @type   : var
 * @access : public
 * @desc   : 확정할지 여부를 확인받는 공통 메세지
 */
var MSG_CONFIRM_CONFIRM     = "@(을)를 확정하시겠습니까?";

/**
 * @type   : var
 * @access : public
 * @desc   : 초기화 할지 여부를 확인받는 공통 메세지
 */
var MSG_CONFIRM_INIT     = "@(을)를 초기화하시겠습니까?";



/**
 * @type   : var
 * @access : public
 * @desc   : 데이터 없음 알림
 */
var MSG_INFO_NODATA     = "@ 데이터가 없습니다.";

/**
 * @type   : var
 * @access : public
 * @desc   : 권한 조회 후 추가
 */
var MSG_ADM_AFTSCHADD     = "@ 조회 후 추가하시기 바랍니다";

/**
 * @type   : var
 * @access : public
 * @desc   : 권한 조히후 삭제
 */
var MSG_ADM_AFTSCHDEL    = "@ 조회 후 삭제하시기 바랍니다";


/**
 * @type   : var
 * @access : public
 * @desc   : 권한 조회후 삭제
 */
var MSG_ADM_MODSCH    = "조회조건이 변경되었습니다. 시스템 검색을 먼저 수행해 주시기 바랍니다.";


/**
 * @type   : var
 * @access : public
 * @desc   : 유저-권한 사용자 추가 화면 메세지
 */
var MSG_ADM_DUPDR    = "삭제항목에 이미 중복된 값이 존재하여 조회상태로 변경합니다.";

/**
 * @type   : var
 * @access : public
 * @desc   : 유저-권한 사용자 추가화면 메세지
 */
var MSG_ADM_DUPI    = "이미 동일한 값이 추가되어 있습니다.";


/**
 * @type   : var
 * @access : public
 * @desc   : 유저-권한 사용자 추가 화면 메세지
 */
var MSG_ADM_DUP    = "이미 동일한 값이 존재합니다.";

/**
 * @type   : var
 * @access : public
 * @desc   : 유저-권한 사용자 추가 화면 메세지
 */
var MSG_SESSION_TIMEOUT    = "인가되지 않은 접근이거나 세션이 종료되어 로그아웃됩니다.";

/* 실명인증 */
var MSG_SUCCESS_RESIDENT        = "실명인증되었습니다.";
var MSG_ERROR_RESIDENT          = "주민등록자료와 일치하지 않습니다.";
var MSG_ERROR_RESIDENT_SYSTEM   = "실명인증 통신 장애가 발생하였습니다.";

/* 계좌진위 */
var MSG_SUCCESS_ACCTCHECK       = "계좌번호를 정상확인 하였습니다.";
var MSG_ERROR_ACCTCHECK         = "계좌번호를 확인할 수 없습니다.";

// validation message
var VMSG_VALID            = "유효합니다.";
var VMSG_ITEMNAME         = "@ 은(는) ";
var VMSG_GRID             = "@의 @번째 데이터에서 ";
var VMSG_ERR_DUPLICATE    = "중복될 수 없습니다.";
var VMSG_ERR_LENGTH       = "@자리수만큼 입력하십시오.";
var VMSG_ERR_BYTE_LENGTH       = "@자리수만큼 입력하십시오. (한글은 @자리수)";
var VMSG_ERR_MIN_LENGTH   = "@자 이상으로 입력하십시오.";
var VMSG_ERR_MIN_BYTE_LENGTH   = "@자 이상으로 입력하십시오. (한글은 @자 이상)";
var VMSG_ERR_MAX_LENGTH   = "@자 이하로 입력하십시오.";
var VMSG_ERR_MAX_BYTE_LENGTH   = "@자 이하로 입력하십시오. (한글은 @자 이하)";
var VMSG_ERR_MIN_NUM      = "@ 이상으로 입력하십시오.";
var VMSG_ERR_MAX_NUM      = "@ 이하로 입력하십시오.";
var VMSG_ERR_IN_NUM       = "@부터 @사이로 입력하십시오.";
var VMSG_ERR_NUMBER       = "숫자만을 입력하십시오.";
var VMSG_ERR_ALPHA        = "문자만을 입력하십시오.";
var VMSG_ERR_REQUIRED     = "필수 입력 항목입니다.";
var VMSG_ERR_SSN          = "유효한 주민등록번호가 아닙니다.";
var VMSG_ERR_CSN          = "유효한 고유번호가 아닙니다.";
var VMSG_ERR_FILTER       = "@ 문자는 사용할 수 없습니다.";
var VMSG_ERR_DATE         = "유효한 날짜가 아닙니다.";
var VMSG_ERR_YEAR         = "년도(Year)가 정확하지 않습니다.";
var VMSG_ERR_MONTH        = "월(Month)이 정확하지 않습니다.";
var VMSG_ERR_DAY          = "일(Day)이 정확하지 않습니다.";
var VMSG_ERR_HOUR         = "시(Hour)가 정확하지 않습니다.";
var VMSG_ERR_MINUTE       = "분(Minute)이 정확하지 않습니다.";
var VMSG_ERR_SECOND       = "초(Second)가 정확하지 않습니다.";
var VMSG_ERR_MIN_DATE     = "@년 @월 @일 이후이어야 합니다.";
var VMSG_ERR_MAX_DATE     = "@년 @월 @일 이전이어야 합니다.";
var VMSG_ERR_FORMAT       = "'@' 형식이어야 합니다.\n" +
                            "  - # : 문자 혹은 숫자\n" +
                            "  - A, Z : 문자(Z는 공백포함)\n" +
                            "  - 0, 9 : 숫자(9는 공백포함)";
var VMSG_ERR_ITEM_INSERT  = "@을(를) 입력하십시오.";
var VMSG_ERR_ITEM_SELECT  = "@을(를) 선택하십시오.";
var VMSG_ERR_ACCESS       = "인가되지 않은 접근이거나, @ 정보 전달시 오류가 발생하였습니다. \n다시한번 시도해 주십시오. ";

/* 행정지원 */
var VMSG_INFO_CTS         = "겸직을 선택해 주십시오.";         //종사자 등록 및 수정시 종사자의 겸직임을 체크하고 겸직을 선택하지 않았을 경우
var VMSG_INFO_SRCHWRD     = "검색어를 입력하십시오.";         //검색 조건을 선택후 검색어를 입력하지 않았을 경우
var VMSG_INFO_SEARCH_GB   = "검색구분을 선택하십시오.";        //검색어를 입력후 검색조건을 선택하지 않았을 경우
var VMSG_INFO_CTPRVN      = "시도를 선택하십시오.";            //시설 검색시, 시군구만을 선택후 시도를 선택하지 않았을 경우
var VMSG_INFO_RSGST_GB    = "주민등록 구분을 선택하십시오..";  //아동 등록 및 수정시 아동의 주민등록번호 종류를 선택하지 않았을 경우
var VMSG_INFO_RESDNC      = "거주지를 입력하십시오.";          //아동 등록 및 수정시 아동의 거주지 및 행정동을 선택하지 않았을 경우
var VMSG_INFO_TROBL_GRAD  = "장애등급을 선택하십시오.";        //아동 등록 및 수정시 아동의 장애등급을 선택하지 않았을 경우
var VMSG_INFO_TROBL_CN    = "장애내용을 입력하십시오.";        //아동 등록 및 수정시 아동의 장애등급만을 선택하고, 장애 내용을 입력하지 않았을 경우
var VMSG_INFO_CHCARE_SVC  = "보육시간을 선택하십시오.";        //아동 등록 및 수정시 아동의 보육시간을 선택하지 않았을 경우
var VMSG_INFO_STS         = "상태를 선택하십시오.";            //아동 등록 및 수정시 아동의 상태를 선택하지 않았을 경우
var VMSG_INFO_ACINSR_YN   = "상해보험 여부를 선택하십시오.";   //아동 등록 및 수정시 아동의 상해보험 가입 여부를 선택하지 않았을 경우
var VMSG_INFO_RSGST_LEN   = "주민등록번호 13자리를 입력하여 주십시오.";  //종사자 등록시 주민등록번호를 모두 입력하지 않았을 경우
var VMSG_INFO_CR          = "시설을 선택하여 주십시오."        //아동 신규 등록 버튼 클릭시 시설을 선택하지 않았을 경우
var VMSG_INFO_CARE_MAX    = "입력하신 보육일수는 해당 월에 최대 보육일수를 초과하셨습니다."  //각각의 월에 일수를 초과하였을 경우

/* 바우처 관리 */
var VMSG_INFO_CARD_REQ          = "이미 등록한 정보가 존재합니다.";
var VMSG_INFO_CARD_REQ_JUMIN    = "@년 @월 @일에 @에서 카드발급 '@'으로 등록하였습니다. \n정보를 다시 한번 확인하시고, 등록버튼을 클릭해주십시오.";
var VMSG_WRN_CARD_REQ           = "이전 신청정보 주민번호와 일치하지 않습니다.\n이전 신청정보를 삭제하고 새로 신청하시겠습니까?";
var VMSG_WRN_REQGB              = "이전에 카드발급 '@'으로 등록하였습니다.\n이전 @내역을 삭제해야 @등록이 가능합니다. ";
var VMSG_WRN_WFTGTERRNUM        = "새올행정시스템에서 다음 항목이 누락되었는지 확인하신 후 다시 실행하여 주십시오.\n(보장급여신청접수번호, 신청인성명, 신청인주민등록번호, 신청인자택주소-상세주소포함)";
var VMSG_WRN_TELNO_LENGTH       = "전화번호 끝자리는 4자리로 채우셔야 합니다.";
var VMSG_WRN_DETAILADDR         = "주소 입력시 상세주소까지 입력하셔야 합니다.";
var VMSG_WRN_PRICRQESTSE01      = "청구서수령지가 직장인 경우 직장 주소는 필수 입력 항목입니다.";
var VMSG_WRN_PRICRQESTSE02      = "청구서수령지가 email인 경우 email 주소는 필수 입력 항목입니다.";
var VMSG_WRN_CARDRECPTEARTHMIN  = "카드수령지가 직장인 경우 직장 주소는 필수 입력 항목입니다.";
var VMSG_WRN_SMSSVCYN           = "문자알림서비스를 신청하시면 핸드폰 번호는 필수 입력 항목입니다.";
var VMSG_WRN_EMAILSVCYN         = "바우처사용내역 e-mail 발송 서비스를 신청하시면 email 주소는 필수 입력 항목입니다.";
var VMSG_WRN_ISSUERENGNM        = "영문명 입력시 성과 이름 사이에 공백이 반드시 입력되어야 합니다.\n(공백 연속 입력은 금지)";
var VMSG_WRN_SPOUSEJUMINNO      = "카드발급신청인 주민등록번호와 배우자 주민등록번호가 동일합니다.\n다시 입력하여 주십시오.";
var VMSG_WRN_ISSUINFOERRYN      = "신청정보 오류내역을 수정하셨습니까?\n'예'를 클릭하면 수정하신 내용으로 카드발급심사가 다시 진행됩니다.";
var VMSG_WRN_ISSUDELERRYN       = "해당 보육료지원접수번호로 이미 i-사랑카드 발급이 진행중에 있거나 완료되었습니다.\n새올행정시스템에서 보육료지원신청을 다시 하십시오.";
var VMSG_WRN_SLREALNMCHKERR     = "신청인의 실명인증 결과 주민등록자료와 일치하지 않습니다.\n새올행정시스템에서 신청자 성명, 주민등록번호를 다시 확인하십시오.";
var VMSG_WRN_SLREALNMCHKSYSERR  = "신청인의 실명인증시 통신 장애가 발생하였습니다.\n잠시 후에 카드발급신청을 다시 실행하여 주십시오.";
var VMSG_WRN_SPOUSERLNMCHK      = "배우자 실명확인 체크를 실행하여 주십시오.";
var VMSG_ERR_ACCTCHECK          = "신청인과 결제계좌의 예금주가 일치하지 않습니다.\n예금주는 반드시 신청인과 동일하여야 합니다.";
var VMSG_WRN_ACCTCHECK          = "결제계좌 계좌확인을 실행하여 주십시오.";
var MSG_CONFIRM_ACCTCHECK       = "신청인과 계좌의 예금주[@]가 일치하지 않습니다.\n계좌번호를 정상확인 하시겠습니까?";
var VMSG_WRN_RTNACCTCHECK       = "급여(환급)계좌 계좌확인을 실행하여 주십시오.";
var VMSG_WRN_PRCSCHECK          = "처리중입니다.\n잠시만 기다리십시오.";
var VMSG_WRN_AGE                = "신청인이 만18세 미만인 경우 카드발급이 이루어지지 않습니다. \n'미대상'으로 등록하여 주십시오.";
var VMSG_CONFIRM_DELETE         = "기존의 카드신청정보를 모두 삭제하고 미대상등록화면으로 이동합니다. 진행하시겠습니까?";
var VMSG_INFO_NOCHANGE          = "@할 내역이 없습니다.";
var VMSG_CONFIRM_CNFIRM         = "@하시겠습니까?";
var VMSG_WRN_PRCSNG             = "@중입니다.\n잠시후 다시 조회하여 주십시오.";

var MSG_WRN_SEARCHPERIOD        = "검색기간을 @일 이내로 입력해주십시오.";

var MSG_ERROR_INVALID1   = "유효한 @ (이)가 아닙니다.";
var MSG_ERROR_INVALID2   = "유효한 @ (이)가 아닙니다.\n[@]";

//----------------------------- 2. 공통 스크립트 영역입니다. -----------------------------//

// Global 변수선언
var GLB_MONTH_IN_YEAR   = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
var GLB_DAY_IN_WEEK     = ["Sunday", "Monday", "Tuesday", "Wednesday","Thursday", "Friday", "Saturday"];
var GLB_DAYS_IN_MONTH   = [31,28,31,30,31,30,31,31,30,31,30,31];
var GLB_PAGING_INFO; // paging 관련 정보를 담는 변수. coMap 객체 타입. 초기화는 cfResetDataSet 변수에서 사용.;
var GLB_URL_COMMON_PAGE = "/common/";
var GLB_REPORT_MAXPAGE  = 50;  // 출력가능한 최대 페이지 수

/**
 * @type   : prototype_function
 * @access : public
 * @desc   : 자바스크립트의 내장 객체인 String 객체에 simpleReplace 메소드를 추가한다. simpleReplace 메소드는
 *           스트링 내에 있는 특정 스트링을 다른 스트링으로 모두 변환한다. String 객체의 replace 메소드와 동일한
 *           기능을 하지만 간단한 스트링의 치환시에 유용하게 보다 간편하게 있다.
 * <pre>
 *     var str = "abcde"
 *     str = str.simpleReplace("cd", "xx");
 * </pre>
 * 위의 예에서 str는 "abxxe"가 된다.
 * @sig    : oldStr, newStr
 * @param  : oldStr - 바뀌어야 될 기존의 스트링
 * @param  : newStr - 바뀌어질 새로운 스트링
 * @return : replaced String.
 * @author : 박성진
 */
String.prototype.simpleReplace = function(oldStr, newStr) {
  var rStr = oldStr;

  rStr = rStr.replace(/\\/g, "\\\\");
  rStr = rStr.replace(/\^/g, "\\^");
  rStr = rStr.replace(/\$/g, "\\$");
  rStr = rStr.replace(/\*/g, "\\*");
  rStr = rStr.replace(/\+/g, "\\+");
  rStr = rStr.replace(/\?/g, "\\?");
  rStr = rStr.replace(/\./g, "\\.");
  rStr = rStr.replace(/\(/g, "\\(");
  rStr = rStr.replace(/\)/g, "\\)");
  rStr = rStr.replace(/\|/g, "\\|");
  rStr = rStr.replace(/\,/g, "\\,");
  rStr = rStr.replace(/\{/g, "\\{");
  rStr = rStr.replace(/\}/g, "\\}");
  rStr = rStr.replace(/\[/g, "\\[");
  rStr = rStr.replace(/\]/g, "\\]");
  rStr = rStr.replace(/\-/g, "\\-");

    var re = new RegExp(rStr, "g");
    return this.replace(re, newStr);
}

// alert("abcde\.()-fgh$$?J+".simpleReplace("\\", ""));

/**
 * @type   : prototype_function
 * @access : public
 * @desc   : 자바스크립트의 내장 객체인 String 객체에 trim 메소드를 추가한다. trim 메소드는 스트링의 앞과 뒤에
 *           있는 white space 를 제거한다.
 * <pre>
 *     var str = " abcde "
 *     str = str.trim();
 * </pre>
 * 위의 예에서 str는 "abede"가 된다.
 * @return : trimed String.
 * @author : 박성진
 */
String.prototype.trim = function() {
    return this.replace(/(^\s*)|(\s*$)/g, "");
}

/**
 * @type   : prototype_function
 * @access : public
 * @desc   : 자바스크립트의 내장 객체인 String 객체에 trimAll 메소드를 추가한다. trim 메소드는 스트링 내에
 *           있는 white space 를 모두 제거한다.
 * <pre>
 *     var str = " abc de "
 *     str = str.trimAll();
 * </pre>
 * 위의 예에서 str는 "abcde"가 된다.
 * @return : trimed String.
 * @author : 박성진
 */
String.prototype.trimAll = function() {
    return this.replace(/\s*/g, "");
}

// alert(" a b  d ".trimAll());

/**
 * @type   : prototype_function
 * @access : public
 * @desc   : 자바스크립트의 내장 객체인 String 객체에 cut 메소드를 추가한다. cut 메소드는 스트링의 특정 영역을
 *           잘라낸다.
 * <pre>
 *     var str = "abcde"
 *     str = str.cut(2, 2);
 * </pre>
 * 위의 예에서 str는 "abe"가 된다.
 * @sig    : start, length
 * @param  : start  - start index to cut
 * @param  : length - length to cut
 * @return : cutted String.
 * @author : 박성진
 */
String.prototype.cut = function(start, length) {
    return this.substring(0, start) + this.substr(start + length);
}

/**
 * @type   : prototype_function
 * @access : public
 * @desc   : String.split() 와 같지만 여러가지 옵션을 줄 수 있다.
 * <pre>
 *     option list
 *
 *     - i : ignored split
 *         앞에 "\" 가 붙은 문자는 deliminate시키지 않는다. ('\' 문자를 string으로 표현할 때는 "\\" 로 해야함)
 *             var str = "abc,de\\,fg"
 *             var strArr = str.advancedSplit(",", "i");
 *         위의 예에서 strArr[0]는 "abc", strArr[1]는 "de,fg"가 된다.
 *
 *     - t : trimed split
 *         split 후에 splited string 들을 trim 시킨다.
 *             var str = "abc,  de,fg"
 *             var strArr = str.advancedSplit(",", "t");
 *         위의 예에서 strArr[0]는 "abc", strArr[1]는 "de", strArr[2]는 "fg"가 된다.
 * </pre>
 * 옵션들은 복합적으로 사용될 수 있다.
 * <pre>
 *     var str = "abc,  de\\,fg"
 *     var strArr = str.advancedSplit(",", "it");
 * </pre>
 * 위의 예에서 strArr[0]는 "abc", strArr[1]는 "de,fg"가 된다.
 * @sig    : delim, options
 * @param  : delim   - delimenator
 * @param  : options - 옵션을 나타내는 문자들을 나열한 스트링
 * @return : splited string array.
 * @author : 박성진
 */
String.prototype.advancedSplit = function(delim, options) {
  if (options == null || options.trim() == "") {
    return this.split(delim);
  }

  var optionI = false;
  var optionT = false;

  options = options.trim().toUpperCase();

  for (var i = 0; i < options.length; i++) {
    if (options.charAt(i) == 'I') {
      optionI = true;
    } else if (options.charAt(i) == 'T') {
      optionT = true;
    }
  }

  var arr = new Array();
  var cnt = 0;
  var startIdx = 0;
  var delimIdx = -1;
  var str = this;
  var temp = 0;

  while ( (delimIdx = (str == null) ?
           -1 : str.indexOf(delim, startIdx)
          ) != -1
        ) {

    if (optionI && str.charAt(delimIdx - 1) == '\\') {
      str = str.cut(delimIdx - 1, 1);
      startIdx = delimIdx;
      continue;
    }

    arr[cnt++] = optionT ? str.substring(0, delimIdx).trim() :
                           str.substring(0, delimIdx);

    str = str.substr(delimIdx + 1);
    startIdx = 0;
  }

  arr[cnt] = (str == null) ? "" : str;

  return arr;
}

/*
var splitTestStr = "abc  , de\\,  fg , f d".advancedSplit(",", "it");
for (var i = 0; i < splitTestStr.length; i++) {
  alert("'" + splitTestStr[i] + "'");
}
*/

/**
 * @type   : prototype_function
 * @access : public
 * @desc   : 자바스크립트의 내장 객체인 String 객체에 toDate 메소드를 추가한다. toDate 메소드는 날짜를 표현하는
 *           스트링 값을 자바스크립트의 내장 객체인 Date 객체로 변환한다.
 * <pre>
 *     var date = "2002-03-05".toDate("YYYY-MM-DD")
 * </pre>
 * 위의 예에서 date 변수는 실제로 2002년 3월 5일을 표현하는 Date 오브젝트를 가르킨다.
 * @sig    : [pattern]
 * @param  : pattern - optional. Date를 표현하고 있는 현재의 String을 pattern으로 표현한다. (default : YYYYMMDD)
 * <pre>
 *     # syntex
 *
 *       YYYY : year(4자리)
 *       YY   : year(2자리)
 *       MM   : month in year(number)
 *       DD   : day in month
 *       HH   : hour in day (0~23)
 *       mm   : minute in hour
 *       ss   : second in minute
 *       SS   : millisecond in second
 *
 *     <font color=red>주의)</font> YYYY(YY)는 반드시 있어야 한다. YYYY(YY) 만 사용할 경우는 1월 1일을 기준으로
 *     하고 YYYY와 MM 만사용할 경우는 1일을 기준으로 한다.
 * </pre>
 * @return : 변환된 Date Object.
 * @author : 박성진
 */
String.prototype.toDate = function(pattern) {
  var index = -1;
  var year;
  var month;
  var day;
  var hour = 0;
  var min  = 0;
  var sec  = 0;
  var ms   = 0;

  if (pattern == null) {
    pattern = "YYYYMMDD";
  }

  if ((index = pattern.indexOf("YYYY")) == -1 ) {
    index = pattern.indexOf("YY");
    year = "20" + this.substr(index, 2);
  } else {
    year = this.substr(index, 4);
  }

  if ((index = pattern.indexOf("MM")) != -1 ) {
    month = this.substr(index, 2);
  } else {
    month = 1;
  }

  if ((index = pattern.indexOf("DD")) != -1 ) {
    day = this.substr(index, 2);
  } else {
    day = 1;
  }

  if ((index = pattern.indexOf("HH")) != -1 ) {
    hour = this.substr(index, 2);
  }

  if ((index = pattern.indexOf("mm")) != -1 ) {
    min = this.substr(index, 2);
  }

  if ((index = pattern.indexOf("ss")) != -1 ) {
    sec = this.substr(index, 2);
  }

  if ((index = pattern.indexOf("SS")) != -1 ) {
    ms = this.substr(index, 2);
  }

  return new Date(year, month - 1, day, hour, min, sec, ms);
}

/**
 * @type   : prototype_function
 * @object : Date
 * @access : public
 * @desc   : 자바스크립트의 내장 객체인 Date 객체에 format 메소드를 추가한다. format 메소드는 Date 객체가 가진 날짜를
 *           지정된 포멧의 스트링으로 변환한다.
 * <pre>
 *     var dateStr = new Date().format("YYYYMMDD");
 *
 *     참고 : Date 오브젝트 생성자들 - dateObj = new Date()
 *                                   - dateObj = new Date(dateVal)
 *                                   - dateObj = new Date(year, month, date[, hours[, minutes[, seconds[,ms]]]])
 * </pre>
 * 위의 예에서 오늘날짜가 2002년 3월 5일이라면 dateStr의 값은 "20020305"가 된다.
 * default pattern은 "YYYYMMDD"이다.
 * @sig    : [pattern]
 * @param  : pattern - optional. 변환하고자 하는 패턴 스트링. (default : YYYYMMDD)
 * <pre>
 *     # syntex
 *
 *       YYYY : hour in am/pm (1~12)
 *       MM   : month in year(number)
 *       MON  : month in year(text)  예) "January"
 *       DD   : day in month
 *       DAY  : day in week  예) "Sunday"
 *       hh   : hour in am/pm (1~12)
 *       HH   : hour in day (0~23)
 *       mm   : minute in hour
 *       ss   : second in minute
 *       SS   : millisecond in second
 *       a    : am/pm  예) "AM"
 * </pre>
 * @return : Date를 표현하는 변환된 String.
 * @author : 박성진
 */
Date.prototype.format = function(pattern) {
    var year      = this.getFullYear();
    var month     = this.getMonth() + 1;
    var day       = this.getDate();
    var dayInWeek = this.getDay();
    var hour24    = this.getHours();
    var ampm      = (hour24 < 12) ? 0 : 1;
    var hour12    = (hour24 > 12) ? (hour24 - 12) : hour24;
    var min       = this.getMinutes();
    var sec       = this.getSeconds();
    var YYYY = "" + year;
    var YY   = YYYY.substr(2);
    var MM   = (("" + month).length == 1) ? "0" + month : "" + month;
    var MON  = GLB_MONTH_IN_YEAR[month-1];
    var DD   = (("" + day).length == 1) ? "0" + day : "" + day;
    var DAY  = GLB_DAY_IN_WEEK[dayInWeek];
    var HH   = (("" + hour24).length == 1) ? "0" + hour24 : "" + hour24;
    var hh   = (("" + hour12).length == 1) ? "0" + hour12 : "" + hour12;
    var mm   = (("" + min).length == 1) ? "0" + min : "" + min;
    var ss   = (("" + sec).length == 1) ? "0" + sec : "" + sec;
    var SS   = "" + this.getMilliseconds();
    var a    = (a == 0) ? "AM" : "PM";

    var dateStr;
    var index = -1;

    if (typeof(pattern) == "undefined") {
      dateStr = "YYYYMMDD";
    } else {
      dateStr = pattern;
    }

  dateStr = dateStr.replace(/a/g,    a);
  dateStr = dateStr.replace(/YYYY/g, YYYY);
  dateStr = dateStr.replace(/YY/g,   YY);
  dateStr = dateStr.replace(/MM/g,   MM);
  dateStr = dateStr.replace(/MON/g,  MON);
  dateStr = dateStr.replace(/DD/g,   DD);
  dateStr = dateStr.replace(/DAY/g,  DAY);
  dateStr = dateStr.replace(/hh/g,   hh);
  dateStr = dateStr.replace(/HH/g,   HH);
  dateStr = dateStr.replace(/mm/g,   mm);
  dateStr = dateStr.replace(/ss/g,   ss);

  return dateStr;
}

/**
 * @type   : prototype_function
 * @object : Date
 * @access : public
 * @desc   : 현재 Date 객체의 날짜보다 이후날짜를 가진 Date 객체를 리턴한다.
 *           예를 들어 내일 날짜를 얻으려면 다음과 같이 하면 된다.
 * <pre>
 *     var oneDayAfter = new Date.after(0, 0, 1);
 * </pre>
 * @sig    : [years[, months[, dates[, hours[, minutes[, seconds[, mss]]]]]]]
 * @param  : years   - optional. 이후 년수
 * @param  : months  - optional. 이후 월수
 * @param  : dates   - optional. 이후 일수
 * @param  : hours   - optional. 이후 시간수
 * @param  : minutes - optional. 이후 분수
 * @param  : seconds - optional. 이후 초수
 * @param  : mss     - optional. 이후 밀리초수
 * @return : 이후날짜를 표현하는 Date 객체
 * @author : 박성진
 */
Date.prototype.after = function(years, months, dates, hours, miniutes, seconds, mss) {
    if (years == null)    years    = 0;
    if (months == null)   months   = 0;
    if (dates == null)    dates    = 0;
    if (hours == null)    hours    = 0;
    if (miniutes == null) miniutes = 0;
    if (seconds == null)  seconds  = 0;
    if (mss == null)      mss      = 0;

  return new Date(this.getFullYear() + years,
                  this.getMonth() + months,
                  this.getDate() + dates,
                  this.getHours() + hours,
                  this.getMinutes() + miniutes,
                  this.getSeconds() + seconds,
                  this.getMilliseconds() + mss
                 );
}
// alert(new Date().after(1, 1, 1, 1, 1, 1).format("YYYYMMDD HHmmss"));

/**
 * @type   : prototype_function
 * @object : Date
 * @access : public
 * @desc   : 현재 Date 객체의 날짜보다 이전날짜를 가진 Date 객체를 리턴한다.
 *           예를 들어 어제 날짜를 얻으려면 다음과 같이 하면 된다.
 * <pre>
 *     var oneDayBefore = new Date.before(0, 0, 1);
 * </pre>
 * @sig    : [years[, months[, dates[, hours[, minutes[, seconds[, mss]]]]]]]
 * @param  : years   - optional. 이전으로 돌아갈 년수
 * @param  : months  - optional. 이전으로 돌아갈 월수
 * @param  : dates   - optional. 이전으로 돌아갈 일수
 * @param  : hours   - optional. 이전으로 돌아갈 시간수
 * @param  : minutes - optional. 이전으로 돌아갈 분수
 * @param  : seconds - optional. 이전으로 돌아갈 초수
 * @param  : mss     - optional. 이전으로 돌아갈 밀리초수
 * @return : 이전날짜를 표현하는 Date 객체
 * @author : 박성진
 */
Date.prototype.before = function(years, months, dates, hours, miniutes, seconds, mss) {
    if (years == null)    years    = 0;
    if (months == null)   months   = 0;
    if (dates == null)    dates    = 0;
    if (hours == null)    hours    = 0;
    if (miniutes == null) miniutes = 0;
    if (seconds == null)  seconds  = 0;
    if (mss == null)      mss      = 0;

  return new Date(this.getFullYear() - years,
                  this.getMonth() - months,
                  this.getDate() - dates,
                  this.getHours() - hours,
                  this.getMinutes() - miniutes,
                  this.getSeconds() - seconds,
                  this.getMilliseconds() - mss
                 );
}
//alert(new Date().before(1, 1, 1, 1, 1, 1).format("YYYYMMDD HHmmss"));

/**
 * @type   : function
 * @access : public
 * @desc   : 공통메세지에 정의된 메세지를 alert box로 보여준 후 리턴한다. cfGetMsg 참조.
 * @sig    : msgId[, paramArray]
 * @param  : msgId - common.js의 공통 메세지 영역에 선언된 메세지 ID
 * @param  : paramArray - optional. 메세지에서 '@' 문자와 치환될 데이터 Array. Array의 index와 메세지 내의 '@' 문자의 순서가 일치한다.
             치환될 데이터는 [] 사이에 콤마를 구분자로 하여 기술하면 Array 로 인식된다.
 * @return : 치환된 메세지 스트링
 * @author : 박성진
 */
function cfAlertMsg(msgId, paramArray) {
  var msg = new coMessage().getMsg(msgId, paramArray);
  alert(msg);
  return msg;
}





/**
 * @type   : function
 * @access : public
 * @desc   : 공통메세지에 정의된 메세지를 confirm box로 보여준 후 리턴한다. cfGetMsg 참조.
 * @sig    : msgId[, paramArray]
 * @param  : msgId      - common.js의 공통 메세지 영역에 선언된 메세지 ID
 * @param  : paramArray - optional. 메세지에서 '@' 문자와 치환될 스트링 Array. (Array의 index와
 *           메세지 내의 '@' 문자의 순서가 일치한다.)
 * @return : 치환된 메세지 스트링
 * @author : 박성진
 */
function cfConfirmMsg(msgId, paramArray) {
  return confirm(new coMessage().getMsg(msgId, paramArray));
}



/**
 * @type   : function
 * @access : public
 * @desc   : 자바스크립트의 숫자 앞에 지정된 자릿수만큼 zero character 를 삽입한다.
 * <pre>
 *     cfDigitalNumber(5, 123);
 * </pre>
 * 위와같이 사용했을 경우 "00123" 이라는 String을 리턴한다.
 * @sig    : length, number
 * @param  : length - 숫자를 표현하는 길이
 * @param  : number - 변환될 숫자
 * @return : 변환된 스트링
 * @author : 박성진
 */
function cfDigitalNumber(length, number) {
  var numStr = number+ "";
  var zeroChars = "";

  for (var i = 0; i < (length - numStr.length); i++) {
    zeroChars = zeroChars + "0";
  }

  return (zeroChars + numStr);
}

/**
 * @type   : function
 * @access : public
 * @desc   : element를 disable 시킨다.
 * <pre>
 *     cfDisable(oRegistBtn);
 * </pre>
 * @sig    : oElement
 * @param  : oElement - disable 하고자 하는 element
 * @author : 박성진
 */
function cfDisable(oElement) {
  switch (cfGetElementType(oElement)) {
    case "BUTTON" :
    case "CHECKBOX" :
    case "FILE" :
    case "PASSWORD" :
    case "RADIO" :
    case "RESET" :
    case "SUBMIT" :
    case "TEXT" :
      oElement.disabled = true;
      break;

    default :
      break;
  }
}

/**
 * @type   : function
 * @access : public
 * @desc   : element를 enable 시킨다.
 * <pre>
 *     cfEnable(oRegistBtn);
 * </pre>
 * @sig    : oElement
 * @param  : oElement - enable 하고자 하는 element
 * @author : 박성진
 */
function cfEnable(oElement) {
  switch (cfGetElementType(oElement)) {
    case "BUTTON" :
    case "CHECKBOX" :
    case "FILE" :
    case "PASSWORD" :
    case "RADIO" :
    case "RESET" :
    case "SUBMIT" :
    case "TEXT" :
      oElement.disabled = false;
      break;

    default :
      break;
  }
}


/**
 * @type   : function
 * @access : public
 * @desc   : Element의 type을 알려준다. 리턴되는 element type string은 다음과 같다.
 * <pre>
 *     BUTTON   : html button input tag
 *     CHECKBOX : html checkbox input tag
 *     FILE     : html file input tag
 *     HIDDEN   : html hidden input tag
 *     IMAGE    : html image input tag
 *     PASSWORD : html password input tag
 *     RADIO    : html radio input tag
 *     RESET    : html reset input tag
 *     SUBMIT   : html submit input tag
 *     TEXT     : html text input tag
 *     SELECT   : html select tag
 *     TEXTAREA : html textarea tag
 *     null     : 기타
 * </pre>
 * @sig    : oElement
 * @param  : oElement - element
 * @return : element의 type을 표현하는 string
 * @author : 박성진
 */
function cfGetElementType(oElement) {
  if (oElement == null) {
    return null;
  }

  switch (oElement.tagName) {
    case "INPUT":
      switch (oElement.type) {
        case "button" :
          return "BUTTON";
        case "checkbox" :
          return "CHECKBOX";
        case "file" :
          return "FILE";
        case "hidden" :
          return "HIDDEN";
        case "image" :
          return "IMAGE";
        case "password" :
          return "PASSWORD";
        case "radio" :
          return "RADIO";
        case "reset" :
          return "RESET";
        case "submit" :
          return "SUBMIT";
        case "text" :
          return "TEXT";
        default :
          return null;
      }
    case "SELECT":
      return "SELECT"
    case "TEXTAREA":
      return "TEXTAREA"
    default :
      return null;
  }
}

/**
 * @type   : function
 * @access : public
 * @desc   : 스트링의 자릿수를 Byte 단위로 환산하여 알려준다. 영문, 숫자는 1Byte이고 한글은 2Byte이다.(자/모 중에 하나만 있는 글자도 2Byte이다.)
 * @sig    : value
 * @param  : value - 스트링
 * @return : 스트링의 길이
 * @author : 박성진
 */
function cfGetByteLength(value){
  var byteLength = 0;

  if ( value == null ) {
    return 0;
  }

  var c;

  for(var i = 0; i < value.length; i++) {
    c = escape(value.charAt(i));

    if (c.length == 1) {
      byteLength ++;
    } else if (c.indexOf("%u") != -1)  {
      byteLength += 2;
    } else if (c.indexOf("%") != -1)  {
      byteLength += c.length/3;
    }
  }

  return byteLength;
}

/**
 * @type   : function
 * @access : public
 * @desc   : 공통메세지에 정의된 메세지를 리턴한다.
 * <pre>
 * // 공통 메세지 영역
 * var MSG_NO_CHANGED        = "변경된 사항이 없습니다.";
 * var MSG_SUCCESS_LOGIN     = "@님 안녕하세요?";
 * ...
 * var message1 = cfGetMsg(MSG_NO_CHANGED);
 * var message2 = cfGetMsg(MSG_SUCCESS_LOGIN, ["홍길동"]);
 * </pre>
 * 위의 예에서 message2 의 값은 "홍길동님 안녕하세요?" 가 된다.
 * @sig    : msgId[, paramArray]
 * @param  : msgId      - common.js의 공통 메세지 영역에 선언된 메세지 ID
 * @param  : paramArray - optional. 메세지에서 '@' 문자와 치환될 데이터 Array. Array의 index와
 *           메세지 내의 '@' 문자의 순서가 일치한다. 치환될 데이터는 [] 사이에 콤마를 구분자로 하여 기술하면 Array 로 인식된다.
 * @return : 치환된 메세지 스트링
 * @author : 박성진
 */
function cfGetMsg(msgId, paramArray) {
  return new coMessage().getMsg(msgId, paramArray);
}


/**
 * @type   : function
 * @access : private
 * @desc   : Object를 초기화한다.
 * @sig    : obj[, iniVal]
 * @param  : parentObj - 초기화할 대상 오브젝트
 * @param  : iniVal    - optional. 초기값
 * @author : 박성진
 */
function cfIniObject(obj, iniVal) {

  if (typeof(iniVal) == "undefined") {
    iniVal = "";
  }

  switch (obj.tagName) {
    case "DIV":

    case "TABLE":

    case "FIELDSET":
      cfReset(obj, iniVal);
      break;

    case "INPUT":
      switch (obj.type) {
        case "checkbox":
          if (typeof(iniVal) == "undefined")  {
            obj.checked = 0;
          } else {
            obj.checked = iniVal;
          }

          break;

        case "button" :
          break;

        case "image" :
          break;

        default :
          obj.value = iniVal;
          break;
      }

      break;

    case "SELECT":
    case "TEXTAREA":
      obj.value = iniVal;
      break;
  }
}

/**
 * @type   : function
 * @access : public
 * @desc   : 사용자가 누른 key가 enter key 인지 여부를 알려준다.
 * <pre>
 *     function fncOnKeyPress() {
 *         ...
 *         if (cfIsEnterKey()) {
 *             ...
 *         }
 *     }
 *     ...
 *     &lt;input type="text" onkeypress="fncOnKeyPress()"&gt;
 * </pre>
 * @return : enter key 여부
 * @author : 박성진
 */
function cfIsEnterKey() {
  if (event.keyCode == 13) {
    return true;
  }

  return false;
}

/**
 * @type   : function
 * @access : public
 * @desc   : 값이 null 이거나 white space 문자로만 이루어진 경우 true를 리턴한다.
 * <pre>
 *     cfIsNull("  ");
 * </pre>
 * 위와같이 사용했을 경우 true를 리턴한다.
 * @sig    : value
 * @param  : value - 입력값
 * @return : boolean. null(혹은 white space) 여부
 * @author : 박성진
 */
function cfIsNull(value) {
  if (value == null ||
      (typeof(value) == "string" && value.trim() == "")
     ) {
    return true;
  }

  return false;
}

/**
 * @type   : function
 * @access : public
 * @desc   : window.open으로 서브창을 띄울 때 서브창의 위치를 간단하게 지정할 수 있다.
 * @sig    : width, height, position, [sURL] [, sName] [, sFeatures] [, bReplace]
 * @param  : width - 서브창의 넓이
 * @param  : height - 서브창의 높이
 * @param  : position  - 서브창의 위치 (default : 5) <br><br>
 * <table border='1'>
 *     <tr>
 *         <td>1</td>
 *         <td>2</td>
 *         <td>3</td>
 *     </tr>
 *     <tr>
 *         <td>4</td>
 *         <td>5</td>
 *         <td>6</td>
 *     </tr>
 *     <tr>
 *         <td>7</td>
 *         <td>8</td>
 *         <td>9</td>
 *     </tr>
 * </table>
 * @param  : sURL      - window.open의 sURL 파라미터와 동일
 * @param  : sName     - window.open의 sName 파라미터와 동일
 * @param  : sFeatures - window.open의 sFeatures 파라미터와 동일
 * @param  : bReplace  - window.open의 bReplace 파라미터와 동일
 * @author : 박성진
 */
function cfOpen(width, height, position, sURL, sName, sFeatures, bReplace) {
  var left = 0;
  var top = 0;

/*
  var featureNames  = ["status", "menubar", "toolbar"];
  var featureValues = ["no", "no", "no"];
  var featureTypes  = ["boolean", "boolean", "boolean"];

  if (sFeatures != null) {
    cfParseFeature(sFeatures, featureNames, featureValues, featureTypes);
  }

  var status = featureValues[0];
  var menubar = featureValues[1];
  var toolbar = featureValues[2];
*/
  if (width != null && height != null) {
    width = width + 10; // window의 좌우 border 5px씩 감안.
    height = height + 29; // titlebar는 기본으로 감안.
/*
    if (status) {
      height = height + 20;
    }

    if (menubar) {
      height = height + 48;
    }

    if (toolbar) {
      height = height + 27;
    }
*/
    switch (position) {
      case 1 :
        left = 0;
        top = 0;
        break;

      case 2 :
        left = (screen.availWidth - width) / 2;
        top = 0;
        break;

      case 3 :
        left = screen.availWidth - width;
        top = 0;
        break;

      case 4 :
        left = 0;
        top = (screen.availHeight - height) / 2;
        break;

      case 5 :
        left = (screen.availWidth - width) / 2;
        top = (screen.availHeight - height) / 2;
        break;

      case 6 :
        left = screen.availWidth - width;
        top = (screen.availHeight - height) / 2;
        break;

      case 7 :
        left = 0;
        top = screen.availHeight - height;
        break;

      case 8 :
        left = (screen.availWidth - width) / 2;
        top = screen.availHeight - height;
        break;

      case 9 :
        left = screen.availWidth - width;
        top = screen.availHeight - height;
        break;

      default :
        left = (screen.availWidth - width) / 2;
        top = (screen.availHeight - height) / 2;
        break;
    }

    if (cfIsNull(sFeatures)) {
      sFeatures = "left=" + left + ",top=" + top + ",height=" + height + ",width=" + width;
    } else {
      sFeatures = sFeatures + ",left=" + left + ",top=" + top+ ",height=" + height + ",width=" + width;
    }
  }
  window.open(sURL, sName, sFeatures, bReplace);
}

/**
 * @type   : function
 * @access : private
 * @desc   : features 스트링을 파싱하여 array에 셋팅하는 내부 함수
 * @sig    : features, fNameArray, fValueArray, fTypeArray
 * @param  : features    - features를 표현한 스트링
 * @param  : fNameArray  - 추출해야 할 feature의 이름에 대한 array
 * @param  : fValueArray - 추출해야 할 feature의 기본값에 대한 array
 * @param  : fTypeArray  - 추출해야 할 feature의 데이터타입에 대한 array
 * @author : 박성진
 */
function cfParseFeature(features, fNameArray, fValueArray, fTypeArray) {
  if (features == null) {
    return;
  }

  var featureArray = features.split(",");
  var featurePair;

  for (var i = 0; i < featureArray.length; i++) {
    featurePair = featureArray[i].trim().split("=");

    for (var j = 0; j < fNameArray.length; j++) {
      if (featurePair[0] == fNameArray[j]) {
        switch (fTypeArray[j]) {
          case "string" :
            fValueArray[j] = featurePair[1];
            break;
          case "number" :
            fValueArray[j] = Number(featurePair[1]);
            break;
          case "boolean" :
            if (featurePair[1].toUpperCase() == "YES" || featurePair[1].toUpperCase() == "TRUE" || featurePair[1] == "1") {
              fValueArray[j] = true;
            } else {
              fValueArray[j] = false;
            }
            break;
        }
      }
    }
  }
}


/**
 * @type   : function
 * @access : public
 * @desc   : 공통메세지에 정의된 메세지를 prompt box 로 보여준다. 만약 패스워드를 입력받는 prompt box를
 *           띄우면서 공통메세지에 정의된 메세지를 보여주고 싶다면 다음과 같이 하면 된다.
 * <pre>
 *     // 공통메세지 영역
 *     var MSG_INPUT_PASSWORD = "@님, 패스워드를 입력하십시오.";
 *     ...
 *     cfPromptMsg(MSG_INPUT_PASSWORD, ["홍길동"], "입력하세요.");
 * </pre>
 * @sig    : msgId[, paramArray[, defaultVal]]
 * @param  : msgId      - common.js의 공통 메세지 영역에 선언된 메세지 ID
 * @param  : paramArray - optional. 메세지에서 '@' 문자와 치환될 스트링 Array. (Array의 index와
 *           메세지 내의 '@' 문자의 순서가 일치한다.)
 * @param  : defaultVal - optional. prompt box 의 입력필드에 보여줄 기본값.
 * @return : 입력받은 String 혹은 Integer 타입의 패스워드 데이터
 * @author : 박성진
 */
function cfPromptMsg(msgId, paramArray, defaultVal) {
  return prompt(new coMessage().getMsg(msgId, paramArray), defaultVal);
}

/**
 * @type   : function
 * @access : public
 * @desc   : parent object (Div, Table, FieldSet 태그)에 속한 모든 child object의 값을 초기화한다.
 * @sig    : parentObj[, iniVal]
 * @param  : parentObj - 초기화할 부모 오브젝트
 * @param  : iniVal    - optional. 초기값
 * @author : 박성진
 */
function cfReset(parentObj, iniVal) {
  if (typeof(iniVal) == "undefined") {
    iniVal = "";
  }

  switch (parentObj.tagName) {
    case "TABLE":
      for (i in parentObj.all) {
        cfIniObject(parentObj.all[i], iniVal);
      }

      break;

    case "DIV":
      for (i in parentObj.children) {
        cfIniObject(parentObj.children[i], iniVal);
      }

      break;

    case "FIELDSET":
      for (i in parentObj.children) {
        cfIniObject(parentObj.children[i], iniVal);
      }

      break;

    default:
      cfIniObject(parentObj, iniVal);
  }
}


/**
 * @type   : function
 * @access : public
 * @desc   : 화면상의 입력과 관련된 오브젝트에 대한 유효성 검사를 실시한다. 해당 오브젝트에 대한 child 오브젝트들까지도 검사한다. 예를들어,
 *           검사받을 오브젝트들을 &lt;div&gt; 태그로 감싸고 &lt;div&gt; 태그의 id를 파라미터로 준다면 &lt;div&gt; 태그내의 모든 오브젝트들이 자동으로
 *           검사받게 된다. &lt;table&gt;안에 입력필드들은 &lt;table&gt;의 id를 파라미터로 주면 된다.<br>
 *           유효성 검사를 받는 오브젝트들은 "validExp" 라는 속성값을 설정해야 한다. "validExp" 라는 속성은 원래 html 객체에는
 *           정의되어 있지 않은 속성이지만 다른 속성들을 설정하는 것과 같은 방법으로 설정하면 자동으로 해당 오브젝트의 속성으로
 *           인식된다.<br>
 *           (입력값의 앞과 뒤의 공백은 유효성 검사를 하면서 자동으로 trim된다.)
 * <pre>
 *    예1)
 *    ...
 *    function fncSave() {
 *      if (<b>cfValidate([oRecevInfo])</b>) {
 *      oDomRegiRecevGTR.post();
 *      }
 *    }
 *    ...
 *
 *    &lt;table id="oRecevInfo" ....&gt;
 *        ...
 *        &lt;object id="oRecevNo" classid="CLSID:E6876E99-7C28-43AD-9088-315DC302C05F" width="50" <b>validExp="접수번호:yes:length=6"</b>&gt;
 *            &lt;param name="Format"    value="000000"&gt;
 *        &lt;/object&gt;
 *        ...
 *    &lt;/table&gt;
 *    ...
 * </pre>
 * validExp 속성값은 정해진 형식에 맞게 작성되어야 하는데 형식은 오브젝트의 종류에 따라 두 가지로 나뉜다.<br>
 * <pre>
 *    1. 일반 오브젝트의 경우 (예1 참조)
 *        "item_name:필수여부:valid_expression"
 *
 *        - "item_name"에는 해당 항목에 대한 이름을 기술한다.
 *        - "필수여부"에는 해당 오브젝트가 필수 항목인지 여부를 yes|true|1 혹은 no|false|0 타입으로 기술한다.
 *        - "valid_expression" 은  cfValidateValue 함수의 설명을 참조하기 바란다.
 *        - 필수항목인지만 체크하려면 "valid_expression" 을 표기하지 않으면 된다.
 *          예)
 *          &lt;object id="oDelivYmd" classid="CLSID:E6876E99-7C28-43AD-9088-315DC302C05F" width="80" <b>validExp="배달일자:yes"</b>&gt;
 *              ...
 *      &lt;/object&gt;
 *        - validExp 내에 임의로 ",", ":", "=", "&", 문자를 사용하고자 한다면 "\\,", "\\:", "\\=", "\\&" 라고 표기해야 한다.<br>
 *
 *
 *    2. 가우스 Grid 오브젝트의 경우
 *        "column_id:item_name:필수여부[:valid_expression[:key]][,column_name:item_name:필수여부[:valid_expression[:key]]]..."
 *
 *        - column_id 에는  Grid와 연결된 DataSet의 실제 컬럼 id 를 적어준다.
 *
 *        - <font color=red><b>dataName</b></font>이라는 속성도 기술해 주어야 한다. dataName은 해당 DataSet
 *        을 표현하는 이름을 기술해 주면 된다.
 *
 *        예)
 *
 *        cfValidate([oDomRegiRecevGG]);
 *        ...
 *        &ltobject id="oDomRegiRecevGG" classid="CLSID:1F57AEAD-DB12-11D2-A4F9-00608CEBEE49"
 *           width="174" height="233" style="position:absolute; left:10; top:73;"  <b>dataName="배달결과리스트"</b>
 *         <b>validExp="regiNo:등기번호:yes:length=13:key,
 *                  sendPrsnZipNo:발송인우편번호:yes:length=6,
 *                  recPrsnZipNo:수취인우편번호:yes:length=6
 *                 "</b>
 *        &gt;
 *
 *        - 만약 item_name을 기술하지 않았을 경우에는 Grid의 column_id에 해당하는 컬럼의 컬럼명으로 자동으로 대체된다.
 *          예) validExp="regiNo::yes:length=13, ..."
 *
 *        - 만약 컬럼이 key컬럼일 경우에는 끝에 key라고 명시해 준다. key라고 명시해 주면 다른 Row와 데이터가 중복되었을 때
 *          에러를 발생시킨다. 단, key를 명시해 줄 경우에는 valid_expression 을 반드시 기입해 주고 기입해 줄 내용이 없더라도
 *          ':' 을 삽입해야 한다.
 *          예) validExp="regiNo:등기번호:yes::key, ...
 *
 *        - 나머지는 1의 경우와 같다.
 * </pre>
 * @sig    : obj
 * @param  : obj - 유효성검사를 하고자 하는 오브젝트
 * @return : boolean. 유효성 여부.
 * @author : 박성진
 */
function cfValidate(obj) {
  if (cfIsNull(obj)) {
    return;
  }

  var objArr;
  var oElement;
  var validYN = false;

  if (obj.length == null) {
    objArr = new Array(1);
    objArr[0] = obj;
  } else {
    objArr = obj;
  }

  for (var objArrIdx = 0; objArrIdx < objArr.length; objArrIdx++) {
    oElement = objArr[objArrIdx];

    switch (oElement.tagName) {
      case "TABLE":
      case "DIV":
      case "FIELDSET":
        for (var i = 0; i < oElement.all.length; i++) {
          if (!cfValidateElement(oElement.all[i])) {
            return false;
          }
        }

        break;

      default:
        if (!cfValidateElement(oElement)) {
          return false;
        }
    }
  }

  return true;
}

/**
 * @type   : function
 * @access : private
 * @desc   : html 의 모든 오브젝트에 대해 유효성 검사를 한다.
 * @sig    : oElement
 * @param  : oElement - 검사 대상 Element.
 * @return : boolean. 유효성 여부.
 * @author : 박성진
 */
function cfValidateElement(oElement) {
    return cfValidateItem(oElement);
}


/**
 * @type   : function
 * @access : private
 * @desc   : html의 모든 오브젝트에 대해 유효성 검사를 한다.
 * @sig    : oElement
 * @param  : oElement - 검사 대상 Element.
 * @return : boolean. 유효성 여부.
 * @author : 박성진
 */
function cfValidateItem(oElement) {
  if (cfIsNull(oElement.validExp)) {
    return true;
  }

  var value;
  var itemValidExp = new covItemValidExp(oElement.validExp);


  switch (oElement.tagName) {
    case "INPUT":

    case "SELECT":

    case "TEXTAREA":
      oElement.value = oElement.value.trim();  // element의 값을 trim 시켜준다.
      value = oElement.value;
      break;

    default:
      return true;
  }

  if (!itemValidExp.validate(value)) {
    alert(new coMessage().getMsg(VMSG_ITEMNAME, [itemValidExp.itemName]) + itemValidExp.errMsg);
    oElement.focus();
    return false;
  }

  return true;
}

/**
 * @type   : function
 * @access : public
 * @desc   : 사용자의 입력값이 Byte로 환산된 최대길이를 넘을 경우 입력이 안되도록 하는 함수. 오브젝트 선언시 onkeydown 이벤트에 다음과
 *           같이 기술해 주어야만 한다.
 * <pre>
 *     onkeydown="return cfValidateMaxByteLength(this, max_byte_length)"
 *     (여기서 max_byte_length 자리에는 Byte로 환산시 최대길이를 숫자로 적어준다.)
 *
 *     예)
 *     &lt;input type="text" size="10" onkeydown="return cfValidateMaxByteLength(this, 10)"&gt;
 * </pre>
 *           현재는 html의 text input, textarea에만 적용된다.
 * @sig    : oElement, length
 * @param  : oElement - 입력필드 객체
 * @param  : length - max byte length
 * @author : 박성진
 */
function cfValidateMaxByteLength(oElement, length) {
  var value = "";

  if (event.keyCode == 8 ||
      event.keyCode == 37 ||
      event.keyCode == 38 ||
      event.keyCode == 39 ||
      event.keyCode == 40 ||
      event.keyCode == 46
     ) {
      return true;
  }

  switch (cfGetElementType(oElement)) {
    case "TEXT" :
    case "TEXTAREA" :
      value = oElement.value;
      break;

    default :
      break;
  }

  if (cfGetByteLength(value) + 1 > length ) {
    return false;
  }

  return true;
}

/**
 * @type   : function
 * @access : public
 * @desc   : 특정 값에 대한 유효성검사를 수행한다.
 * <pre>
 *     cfValidateValue(50, "minNumber=100");
 * </pre>
 * 위의 경우 50은 최소값 100을 넘지 않으므로 false가 리턴된다.<br>
 * 유효성 검사를 수행하기 위해서는 검사조건을 명시해야 하는데
 * 검사조건은 'valid expression' 이라고 불리우는 String 값으로 표현된다. valid expression에 대한 표기형식은
 * 다음과 같다.
 * <pre>
 *    validator_name=valid_value[&validator_name=valid_value]..
 *
 *    예) "minNumber=100"
 * </pre>
 * - validator_name은 검사유형을 의미하며 valid_value는 기준 값이 된다. <br>
 * - 검사항목은 하나 이상일 수 있으며 검사항목간에는 "&" 문자로 구분하여 필요한 만큼 나열하면 된다. <br>
 * - valid_value에 ",", ":", "=", "&", 문자를 사용하고자 한다면 "\\,", "\\:", "\\=", "\\&" 라고 표기해야 한다.<br>
 * - 위의 예에서는 "minNumber" (최소값)라는 유효성 검사항목을 명시하였고 minNumber 에대한 기준값으로 "100" 이 설정되어 있다.
 * 만일 100보다 작은 값을 입력했을 때는 100 이상의 값을 입력하라는 alert box가 뜨게 된다.
 * - validator_name은 미리 정의되어 있는 것만 사용할 수 있고 각 검사유형마다 valid_value의 형태도 다르다.(valid_value가 없는 것도 있다.)
 * 현재 정의된 검사유형은 다음과 같다.
 * <br><br>
 * <table border=1 style="border-collapse:collapse; border-width:1pt; border-style:solid; border-color:000000;">
 *    <tr>
 *      <td align="center" bgcolor="#CCCCFFF">검사유형</td>
 *      <td align="center" bgcolor="#CCCCFFF">기준값 형태</td>
 *      <td align="center" bgcolor="#CCCCFFF">설명</td>
 *      <td align="center" bgcolor="#CCCCFFF">예</td>
 *    </tr>
 *    <tr>
 *      <td>length</td>
 *      <td>0보다 큰 정수</td>
 *      <td>자릿수 검사. 입력값의 자릿수가 기준값과 일치하는지를 검사한다. 일반적으로 HTML에서는 한글, 영문, 숫자 모두 1자리씩 인식된다.</td>
 *      <td>length=6</td>
 *    </tr>
 *    <tr>
 *      <td>byteLength</td>
 *      <td>0보다 큰 정수</td>
 *      <td>Byte로 환산된 자릿수 검사. 입력값의 자릿수를 byte로 환산하여 자릿수가 기준값과 일치하는지를 검사한다.(숫자 및 영문은 1byte, 한글은 2byte이다.)</td>
 *      <td>length=6</td>
 *    </tr>
 *    <tr>
 *      <td>minLength</td>
 *      <td>0보다 큰 정수</td>
 *      <td>최소자릿수 검사. 입력값의 자릿수가 기준값 이상이 되는지를 검사한다.</td>
 *      <td>minLength=6</td>
 *    </tr>
 *    <tr>
 *      <td>minByteLength</td>
 *      <td>0보다 큰 정수</td>
 *      <td>Byte로 환산된 최소자릿수 검사. 입력값의 자릿수를 byte로 환산하여 자릿수가 기준값 이상이 되는지를 검사한다.(숫자 및 영문은 1byte, 한글은 2byte이다.)</td>
 *      <td>minByteLength=6</td>
 *    </tr>
 *    <tr>
 *      <td>maxLength</td>
 *      <td>0보다 큰 정수</td>
 *      <td>최대자릿수 검사. 입력값의 자릿수가 기준값 이하가 되는지를 검사한다.</td>
 *      <td>maxLength=6</td>
 *    </tr>
 *    <tr>
 *      <td>maxByteLength</td>
 *      <td>0보다 큰 정수</td>
 *      <td>Byte로 환산된 최대자릿수 검사. 입력값의 자릿수를 byte로 환산하여 자릿수가 기준값 이하가 되는지를 검사한다.(숫자 및 영문은 1byte, 한글은 2byte이다.)</td>
 *      <td>maxByteLength=6</td>
 *    </tr>
 *    <tr>
 *      <td>number</td>
 *      <td>None</td>
 *      <td>숫자검사. 입력값이 숫자인지를 검사한다.</td>
 *      <td>number</td>
 *    </tr>
 *    <tr>
 *      <td>minNumber</td>
 *      <td>숫자</td>
 *      <td>최소수 검사. 입력값이 최소한 기준값 이상이 되는지를 검사한다.</td>
 *      <td>minNumber=100</td>
 *    </tr>
 *    <tr>
 *      <td>maxNumber</td>
 *      <td>숫자</td>
 *      <td>최대수 검사. 입력값이 기준값 이하인지를 검사한다.</td>
 *      <td>maxNumber=300</td>
 *    </tr>
 *    <tr>
 *      <td>inNumber</td>
 *      <td>"숫자~숫자" 형식으로 표기.</td>
 *      <td>범위값 검사. 입력값이 기준이 되는 두 수와 같거나 혹은 두 수 사이에 존재하는 값인지를 검사한다.</td>
 *      <td>inNumber=100~300</td>
 *    </tr>
 *    <tr>
 *      <td>minDate</td>
 *      <td>YYYYMMDD 형식의 날짜 스트링.</td>
 *      <td>최소날짜 검사. 입력된 날짜가 기준날짜이거나 기준날짜 이후인지를 검사한다.</td>
 *      <td>minDate=20020305</td>
 *    </tr>
 *    <tr>
 *      <td>maxDate</td>
 *      <td>YYYYMMDD 형식의 날짜 스트링. 예) maxDate=20020305</td>
 *      <td>최대날짜 검사. 입력된 날짜가 기준날짜이거나 기준날짜 이전인지를 검사한다.</td>
 *      <td>maxDate=20020305</td>
 *    </tr>
 *    <tr>
 *      <td>format</td>
 *      <td>format character들과 다른 문자들을 조합한 스트링.<br>
 *        <table>
 *          <tr>
 *            <td><b>format character</b></td>
 *            <td><b>desc</b></td>
 *          </tr>
 *          <tr>
 *            <td>#</td>
 *            <td>문자와 숫자</td>
 *          </tr>
 *          <tr>
 *            <td>A, Z</td>
 *            <td>문자 (Z는 공백포함)</td>
 *          </tr>
 *          <tr>
 *            <td>0, 9</td>
 *            <td>숫자 (9는 공백포함)</td>
 *          </tr>
 *        </table>
 *      </td>
 *      <td>형식 검사. 입력된 값이 지정된 형식에 맞는지를 검사한다.</td>
 *      <td>format=000-000</td>
 *    </tr>
 *    <tr>
 *      <td>ssn</td>
 *      <td>주민등록번호 13자리</td>
 *      <td>주민등록번호 검사. 입력한 주민등록번호가 유효한지를 검사한다.</td>
 *      <td>ssn</td>
 *    </tr>
 *    <tr>
 *      <td>csn</td>
 *      <td>사업자등록번호 10자리</td>
 *      <td>사업자등록번호 검사. 입력한 사업자등록번호가 유효한지를 검사한다.
 *              (예, 2019009930)
 *          </td>
 *      <td>csn</td>
 *    </tr>
 *    <tr>
 *      <td>filter</td>
 *      <td>필터링하고 싶은 스트링을 ";"문자를 구분자로 사용하여 나열한다.(단 ";" 문자를 필터링하고 싶을 땐 "\\;"라고 표기한다.
 *          </td>
 *      <td>입력값에 특별한 문자나 스트링이 있는지를 검사한다.
 *              (예, 2019009930)
 *          </td>
 *      <td>filter=%;<;박성진;\\;;haha<br>(입력값 내에 "%","<","박성진",";","haha" 중에 하나라도 있는지 검사한다.)
 *          </td>
 *    </tr>
 *    <tr>
 *      <td>date</td>
 *      <td>format character의 조합으로 이루어진 날자에 대한 패턴 스트링.<br>
 *        <table>
 *          <tr>
 *            <td><b>format character</b></td>
 *            <td><b>desc</b></td>
 *          </tr>
 *          <tr>
 *            <td>YYYY</td>
 *            <td>4자리 년도</td>
 *          </tr>
 *          <tr>
 *            <td>YY</td>
 *            <td>2자리 년도. 2000년 이후</td>
 *          </tr>
 *          <tr>
 *            <td>MM</td>
 *            <td>2자리 숫자의 달</td>
 *          </tr>
 *          <tr>
 *            <td>DD</td>
 *            <td>2자리 숫자의 일</td>
 *          </tr>
 *          <tr>
 *            <td>hh</td>
 *            <td>2자리 숫자의 시간. 12시 기준</td>
 *          </tr>
 *          <tr>
 *            <td>HH</td>
 *            <td>2자리 숫자의 시간. 24시 기준 </td>
 *          </tr>
 *          <tr>
 *            <td>mm</td>
 *            <td>2자리 숫자의 분</td>
 *          </tr>
 *          <tr>
 *            <td>ss</td>
 *            <td>2자리 숫자의 초</td>
 *          </tr>
 *        </table>
 *      </td>
 *      <td>날짜 검사. 입력된 스트링값을 날짜로 환산하여 유효한 날짜인지를 검사한다.</td>
 *      <td>date=YYYYMMDD  일 때 입력값이 '20020328' 일 경우 -> 유효<br>
 *              date=YYYYMMDD  일 때 입력값이 '20020230' 일 경우 -> 오류<br>
 *              date=Today is YY-MM-DD' 일 때 입력값이 'Today is 02-03-28' 일 경우 -> 유효<br><br>
 *        참고) format문자가 중복해서 나오더라도 처음 나온 문자에 대해서만 format문자로 인식된다.
 *                    YYYY와 YY, hh와 HH 도 중복으로 본다. 날짜는 년,월이 존재할 때만 정확히 체크하고
 *                    만일 년, 월이 없다면 1 ~ 31 사이인지만 체크한다.
 *      </td>
 *    </tr>
 * </table>
 * @sig    : value, validExp
 * @param  : value    - 검사 대상이 되는 값.
 * @param  : validExp - 사용자가 지정한 Valid Expression String.
 * @return : boolean. 유효성 여부.
 * @author : 박성진
 */
function cfValidateValue(value, validExp) {
  var valueValidExp = new covValueValidExp(validExp);

  if (!valueValidExp.validate(value)) {
    return false;
  }

  return true;
}

/**
 * @type   : function
 * @access : public
 * @desc   : 달력 팝업을 띠운다.
 * <pre>
 *     cfCalendar(start_date, "-");
 * </pre>
 * 위와같이 사용했을 경우 html내에서 name 이 start_date 인것을 찾고 달력에서 값을 선택시 입력한 mask를 삽입한다.
 * 반드시 화면 하단에  <%@ include file="/common/include/Tail.jspf" %> 태그를 먼저 추가한후 사용해야 한다.
 * @sig    : obj , maskStr[,Row,Col]
 * @param  : obj - 달력클릭시 값을 전달받을 html객체
 * @param  : maskStr - 달력클릭시 날짜 값 사이에 들어갈 mask String
 * @param  : Row - IBSheet에서 달력 팝업 실행시 이벤트가 발생한 Sheet의 Row
 * @param  : Col - IBSheet에서 달력 팝업 실행시 이벤트가 발생한 Sheet의 Col
 * @return : 없음
 * @author : 박성진
 */

function cfCalendar(obj,maskStr,Row,Col) {

  // IBSheet 일때
  if (null != obj.codeBase && obj.codeBase.indexOf("IBSheet3") >= 0)
  {
     var gleft = obj.ColLeft(Col);
     var gtop =  obj.RowTop(Row) + obj.RowHeight(Row) ;
     if (obj.CountPosition == 1 || obj.CountPosition == 2) gtop +=  13;
     popFrame.sheetPopCalendar(obj, gleft, gtop, popCal,maskStr);

  } else { // 일반  객체 일때
       popFrame.fPopCalendar(obj, obj, popCal, maskStr);

  }

}




//---------------------------------------- 이하 객체선언 ---------------------------------------------//

///////////////////////////// coMessage /////////////////////////////
/**
 * @type   : object
 * @access : private
 * @desc   : 메세지를 관리하는 객체이다.
 * @author : 박성진
 */
function coMessage() {
  // method
  this.getMsg = coMessage_getMsg;
}

/**
 * @type   : method
 * @access : public
 * @object : coMessage
 * @desc   : 공통메세지에 정의된 메세지를 치환하여 알려준다.
 * @sig    : message[, paramArray]
 * @param  : message    - common.js의 공통 메세지 영역에 선언된 메세지 ID
 * @param  : paramArray - optional. 메세지에서 '@' 문자와 치환될 스트링 Array. (Array의 index와
 *           메세지 내의 '@' 문자의 순서가 일치한다.)
 * @return : 치환된 메세지 스트링
 */
function coMessage_getMsg(message, paramArray) {
  var index = -1;
  var re = /@/g;
  var count = 0;

  if (paramArray == null) {
    return message;
  }

  while ( (index = message.indexOf("@")) != -1) {
    message = message.substr(0, index + 1).replace(re, paramArray[count++]) +
              message.substring(index + 1);
  }

  return message;
}

///////////////////////////// coMap /////////////////////////////
/**
 * @type   : object
 * @access : private
 * @desc   : key와 value 쌍을 가진 객체
 * @author : 박성진
 */
function coMap() {
  // fields
  this.keys = new Array();
  this.values = new Array();
  this.count = 0;

  // methods
  this.get           = coMap_get;
  this.put           = coMap_put;
  this.containsKey   = coMap_containsKey;
  this.containsValue = coMap_containsValue;
  this.size          = coMap_size;
}

/**
 * @type   : method
 * @access : public
 * @object : coMap
 * @desc   : key에 맞는 파라미터값을 리턴한다.
 * @sig    : key
 * @param  : key - map의 key로 사용할 값
 * @return : 파라미터값
 */
function coMap_get(key) {
  for (var i = 0; i < this.count; i++) {
    if (this.keys[i] == key) {
      return this.values[i];
    }
  }

  return null;
}

/**
 * @type   : method
 * @access : public
 * @object : coMap
 * @desc   : 새로운 map을 추가한다. 같은 key가 존재할 경우 overwrite한다.
 * @sig    : key, value
 * @param  : key   - map의 key로 사용할 값
 * @param  : value - map의 value로 사용할 값
 * @return : 파라미터값
 */
function coMap_put(key, value) {
  for (var i = 0; i < this.count; i++) {
    if (this.keys[i] == key) {
      this.values[i] = value;
      return;
    }
  }

  this.keys[this.count + 1] = Key;
  this.values[this.count + 1] = value;
}

/**
 * @type   : method
 * @access : public
 * @object : coMap
 * @desc   : key가 map내에 있는지 여부를 알려준다.
 * @sig    : key
 * @param  : key - map의 key
 * @return : boolean. key가 map내에 있는지 여부.
 */
function coMap_containsKey(key) {
  for (var i = 0; i < this.count; i++) {
    if (this.keys[i] == key) {
      return true;
    }
  }

  return false;
}

/**
 * @type   : method
 * @access : public
 * @object : coMap
 * @desc   : value가 map내에 있는지 여부를 알려준다.
 * @sig    : value
 * @param  : value - map의 value
 * @return : boolean. value가 map내에 있는지 여부.
 */
function coMap_containsValue(value) {
  for (var i = 0; i < this.count; i++) {
    if (this.values[i] == value) {
      return true;
    }
  }

  return false;
}

/**
 * @type   : method
 * @access : public
 * @object : coMap
 * @desc   : map의 key-value 쌍의 갯수를 알려준다.
 * @return : key-value 쌍의 갯수
 */
function coMap_size() {
  return this.count;
}

///////////////////////////// coParameterMap /////////////////////////////
/**
 * @type   : object
 * @access : public
 * @desc   : String parameter 에 대한 name과 value 쌍들을 가진 객체
 * @author : 박성진
 */
function coParameterMap() {
  // fields

  /**
   * @type   : field
   * @access : private
   * @object : coParameterMap
   * @desc   : 파라미터 이름을 담고있는 array
   */
  this.names = new Array();

  /**
   * @type   : field
   * @access : private
   * @object : coParameterMap
   * @desc   : 파라미터 값을 담고있는 array
   */
  this.values = new Array();

  /**
   * @type   : field
   * @access : private
   * @object : coParameterMap
   * @desc   : 파라미터의 개수
   */
  this.count = 0;

  // methods
  this.getValue          = coParameterMap_getValue;
  this.put               = coParameterMap_put;
  this.getNameAt         = coParameterMap_getNameAt;
  this.getValueAt        = coParameterMap_getValueAt;
  this.size              = coParameterMap_size;
  this.getMaxNameLength  = coParameterMap_getMaxNameLength;
  this.getMaxValueLength = coParameterMap_getMaxValueLength;
}

/**
 * @type   : method
 * @access : public
 * @object : coParameterMap
 * @desc   : name에 맞는 파라미터값을 리턴한다.
 * @sig    : name
 * @param  : name - map의 name으로 사용할 값
 * @return : 파라미터값
 */
function coParameterMap_getValue(name) {
  for (var i = 0; i < this.count; i++) {
    if (this.names[i] == name) {
      return this.values[i];
    }
  }

  return null;
}

/**
 * @type   : method
 * @access : public
 * @object : coParameterMap
 * @desc   : 새로운 map을 추가한다. 같은 name가 존재할 경우 overwrite한다.
 * @sig    : name, value
 * @param  : name   - map의 name로 사용할 값
 * @param  : value - map의 value로 사용할 값
 * @return : 파라미터값
 */
function coParameterMap_put(name, value) {
  for (var i = 0; i < this.count; i++) {
    if (this.names[i] == name) {
      this.values[i] = value;
      return;
    }
  }

  this.names[this.count] = name;
  this.values[this.count++] = value;
}

/**
 * @type   : method
 * @access : public
 * @object : coParameterMap
 * @desc   : 지정된 index에 있는 map의 name을 알려준다.
 * @sig    : index
 * @param  : index - map의 index
 * @return : name
 */
function coParameterMap_getNameAt(index) {
  return this.names[index];
}

/**
 * @type   : method
 * @access : public
 * @object : coParameterMap
 * @desc   : 지정된 index에 있는 map의 value를 알려준다.
 * @sig    : index
 * @param  : index - map의 index
 * @return : value
 */
function coParameterMap_getValueAt(index) {
  return this.values[index];
}

/**
 * @type   : method
 * @access : public
 * @object : coParameterMap
 * @desc   : map의 name-value 쌍의 갯수를 알려준다.
 * @return : name-value 쌍의 갯수
 */
function coParameterMap_size() {
  return this.count;
}

/**
 * @type   : method
 * @access : public
 * @object : coParameterMap
 * @desc   : map 내의 name 값들을 String으로 환산하여 최대길이를 알려준다.
 * @return : max name length
 */
function coParameterMap_getMaxNameLength() {
  var maxLength = 0;

  for (var i = 0; i < this.count; i++) {
    if (String(this.names[i]).length > maxLength) {
      maxLength = String(this.names[i]).length;
    }
  }

  return maxLength;
}

/**
 * @type   : method
 * @access : public
 * @object : coParameterMap
 * @desc   : map 내의 value 값들을 String으로 환산하여 최대길이를 알려준다.
 * @return : max value length
 */
function coParameterMap_getMaxValueLength() {
  var maxLength = 0;

  for (var i = 0; i < this.count; i++) {
    if (String(this.values[i]).length > maxLength) {
      maxLength = String(this.values[i]).length;
    }
  }

  return maxLength;
}


//-------------------------- 유효성 검사를 위한 객체 선언 -----------------------------//
/*
 * @Validator 객체의 구조
 *   - 속성 : exception,   -> validity의 sub속성이다. validity가 true면 exception은 무조건 false이고
 *                            validity가 false인 경우 false의 원인이 exception인지 여부를 알려준다.
 *                            exception은 사용자 입력에 대한 실제 validation과는 무관한 에러를 의미한다.
 *                            true/false 중 하나.
 *            message,     -> 오류메세지를 담고 있다.
 *            validity,    -> 유효성검사결과를 담고 있다. true/false 중 하나.
 *            value        -> 유효성 검사 대상 값.
 *
 *   - 메소드 : validate() -> 유효성 검사를 수행한다.
 *                            유효할 경우, validity를 true로하고 true를 return하고
 *                            유효하지 않을 경우,  validity를 false로하고 false를 return하고
 *                            message에 오류메세지를 기술한다.
 *                            exception의 경우는 exception을 true로 하고 message에 메세지를 기술한다.
 *
 *   - 추가시 할일 :
 *     1) validator객체를 정의한다.
 *     2) covValidExp 객체의 getValidators 메소드에 validator객체를 등록한다.
 */

///////////////////////////// covValueValidExp /////////////////////////////
/**
 * @type   : object
 * @access : private
 * @desc   : 유효성 검사에 대한 표현(expression)을 객체화 하였다.
 *             - expression 형식<br>
 *               항목이름:필수항목여부:유효성항목<br>
 *               예) "접수번호:yes:length=6"
 *             - 유효성 항목 형식
 *               유효성항목명=유효값[&유효성항목명=유효값]..
 *               예) "length=13&ssn"
 * @sig    : expression
 * @param  : expression - valid expression string.
 * @author : 박성진
 */
function covValueValidExp(expression) {
    // data;
    this.validItems = new Array();
    this.errMsg = "";

    // method
    this.init = covValueValidExp_init;
    this.parse = covValueValidExp_parse;
    this.validate = covValueValidExp_validate;

    // initialize
    this.init(expression);
}

/**
 * @type   : method
 * @access : private
 * @object : covValueValidExp
 * @desc   : 초기화를 수행한다.
 * @sig    : expression
 * @param  : expression - valid expression string.
 * @author : 박성진
 */
function covValueValidExp_init(expression) {
  this.parse(expression);
}

/**
 * @type   : method
 * @access : private
 * @object : covValueValidExp
 * @desc   : covValidExp 객체의 parse 메소드.
 *           valid expression을 parsing한다.
 * @sig    : expression
 * @param  : expression - valid expression string.
 */
function covValueValidExp_parse(expression) {
  if (cfIsNull(expression)) {
    return;
  }

  var validItemExps = expression.advancedSplit("&", "i");
  var validItem;

  for (var i = 0; i < validItemExps.length; i++) {
    validItemPair = validItemExps[i].trim().advancedSplit("=", "i");
    validItem = new Object();
    validItem.name  = validItemPair[0].trim();
    validItem.value = validItemPair[1];  // parsedExp[1] 은 존재하지 않을 수도 있지만 자바스크립트에서는
    this.validItems[i] = validItem;      // 이런 경우 "undefined" 라는 값을 리턴한다.
  }
}

/**
 * @type   : method
 * @access : private
 * @object : covValueValidExp
 * @desc   : validation을 수행한다.
 * @sig    : value
 * @param  : value - 검사대상값
 */
function covValueValidExp_validate(value) {
  var validators = new Array();
  var count = 0;

  for (var i = 0; i < this.validItems.length; i++) {
    switch (this.validItems[i].name) {
      case "length" :
        validators[count++] = new covLengthValidator(this.validItems[i].value);
        break;

      case "byteLength" :
        validators[count++] = new covByteLengthValidator(this.validItems[i].value);
        break;

      case "minLength" :
        validators[count++] = new covMinLengthValidator(this.validItems[i].value);
        break;

      case "minByteLength" :
        validators[count++] = new covMinByteLengthValidator(this.validItems[i].value);
        break;

      case "maxLength" :
        validators[count++] = new covMaxLengthValidator(this.validItems[i].value);
        break;

      case "maxByteLength" :
        validators[count++] = new covMaxByteLengthValidator(this.validItems[i].value);
        break;

      case "number" :
        validators[count++] = new covNumberValidator();
        break;

      case "minNumber" :
        validators[count++] = new covMinNumberValidator(this.validItems[i].value);
        break;

      case "maxNumber" :
        validators[count++] = new covMaxNumberValidator(this.validItems[i].value);
        break;

      case "inNumber" :
        validators[count++] = new covInNumberValidator(this.validItems[i].value);
        break;

      case "minDate" :
        validators[count++] = new covMinDateValidator(this.validItems[i].value);
        break;

      case "maxDate" :
        validators[count++] = new covMaxDateValidator(this.validItems[i].value);
        break;

      case "format" :
        validators[count++] = new covFormatValidator(this.validItems[i].value);
        break;

      case "ssn" :
        validators[count++] = new covSsnValidator(this.validItems[i].value);
        break;

      case "csn" :
        validators[count++] = new covCsnValidator(this.validItems[i].value);
        break;

      case "filter" :
        validators[count++] = new covFilterValidator(this.validItems[i].value);
        break;

      case "date" :
        validators[count++] = new covDateValidator(this.validItems[i].value);
        break;

      default :
        break;
    }
  }

  for (var i = 0; i < validators.length; i++) {
    if (!validators[i].validate(value)) {
      this.errMsg = validators[i].message;
      return false;
    }
  }

  return true;
}

///////////////////////////// covItemValidExp /////////////////////////////
/**
 * @type   : object
 * @access : private
 * @desc   : 유효성 검사에 대한 표현(expression)을 객체화 하였다.
 *             - expression 형식<br>
 *               항목이름:필수항목여부:유효성항목<br>
 *               예) "접수번호:yes:length=6"
 *             - 유효성 항목 형식
 *               유효성항목명=유효값[&유효성항목명=유효값]..
 *               예) "length=13&ssn"
 * @sig    : expression, itemName
 * @param  : expression - valid expression string.
 * @param  : itemName   - 아이템명
 * @author : 박성진
 */
function covItemValidExp(expression, itemName) {
    // data;
    this.itemName;
    this.required;
    this.valueValidExp;

    // method
    this.parse = covItemValidExp_parse;
    this.validate = covItemValidExp_validate;

    // initialize
    this.parse(expression, itemName);
}

/**
 * @type   : method
 * @access : public
 * @object : covItemValidExp
 * @desc   : valid expression을 parsing한다.
 * @sig    : expression, itemName
 * @param  : expression - valid expression string.
 * @param  : itemName   - 아이템명
 */
function covItemValidExp_parse(expression, itemName) {
  if (cfIsNull(expression)) {
    return;
  }

  var columns = expression.advancedSplit(":", "i");

  if (cfIsNull(columns[1])) {
    return;
  }

  if (cfIsNull(columns[0])) {
    if (!cfIsNull(itemName)) {
      this.itemName = itemName.trim();
    } else {
      return;
    }
  } else {
    this.itemName = columns[0].trim();
  }

  this.required = (columns[1].trim().toUpperCase() == "YES" ||
                   columns[1].trim().toUpperCase() == "TRUE" ||
                   columns[1].trim() == "1"
                  ) ? true : false;

  if ((columns[2]) != null) {
    this.valueValidExp = new covValueValidExp(columns[2].trim());
  }
}

/**
 * @type   : method
 * @access : public
 * @object : covItemValidExp
 * @desc   : validation을 수행한다.
 * @sig    : value
 * @param  : value - 검사할 값
 */
function covItemValidExp_validate(value) {
  // 표현식에 필수항목들(아이템명, 필수여부)을 기술하지 않을 경우는 표현식이 없다고 간주.
  if (cfIsNull(this.itemName) || cfIsNull(this.required)) {
    return true;
  }

  if (this.required && cfIsNull(value)) {
    this.errMsg = VMSG_ERR_REQUIRED;
    return false;
  }

  if (!this.required && cfIsNull(value)) {
    return true;
  }

  if (this.valueValidExp == null) {
    return true;
  }

  if (!this.valueValidExp.validate(value)) {
    this.errMsg = this.valueValidExp.errMsg;
    return false;
  }

  return true;
}


///////////////////////////// covLengthValidator /////////////////////////////
/**
 * @type   : object
 * @access : private
 * @desc   : 'length' 항목에 대한 validator. 값이 지정된 길이를 가지고 있는지 검사한다.
 * @param  : length - 유효한 기준길이.
 * @author : 박성진
 */
function covLengthValidator(length) {
    // data;
    this.message = "";
    this.validity = false;
    this.length = length;

    // method
    this.validate = covLengthValidator_validate;
}

/**
 * @type   : method
 * @access : public
 * @object : covLengthValidator
 * @desc   : validation을 수행한다.
 * @sig    : value
 * @param  : value   - 유효성 검사 대상값.
 * @return : boolean - 유효성 여부.
 */
function covLengthValidator_validate(value) {
  if (value.length != this.length) {
    this.message = new coMessage().getMsg(VMSG_ERR_LENGTH, [this.length]);
    return false;
  }

  this.validity = true;
  return true;
}

///////////////////////////// covByteLengthValidator /////////////////////////////
/**
 * @type   : object
 * @access : private
 * @desc   : 'byteLength' 항목에 대한 validator. 값이 지정된 byte단위의 길이를 가지고 있는지 검사한다.
 * @param  : length - 유효한 기준길이.
 * @author : 박성진
 */
function covByteLengthValidator(length) {
    // data;
    this.message = "";
    this.validity = false;
    this.length = length;

    // method
    this.validate = covByteLengthValidator_validate;
}

/**
 * @type   : method
 * @access : public
 * @object : covByteLengthValidator
 * @desc   : validation을 수행한다.
 * @sig    : value
 * @param  : value   - 유효성 검사 대상값.
 * @return : boolean - 유효성 여부.
 */
function covByteLengthValidator_validate(value) {
  if (cfGetByteLength(value) != this.length) {
    this.message = new coMessage().getMsg(VMSG_ERR_BYTE_LENGTH, [this.length, Math.floor(this.length / 2)]);
    return false;
  }

  this.validity = true;
  return true;
}

///////////////////////////// covMinLengthValidator /////////////////////////////
/**
 * @type   : object
 * @access : private
 * @desc   : 'minLength' 항목에 대한 validator. 값이 지정된 길이 이상인지를 검사한다.
 * @sig    : length
 * @param  : length - 유효한 기준길이.
 * @author : 박성진
 */
function covMinLengthValidator(length) {
    // data;
    this.message = "";
    this.validity = false;
    this.length = length;

    // method
    this.validate = covMinLengthValidator_validate;
}

/**
 * @type   : method
 * @access : public
 * @object : covMinLengthValidator
 * @desc   : validation을 수행한다.
 * @sig    : value
 * @param  : value   - 유효성 검사 대상값.
 * @return : boolean - 유효성 여부.
 */
function covMinLengthValidator_validate(value) {
  if (value.length < this.length) {
    this.message = new coMessage().getMsg(VMSG_ERR_MIN_LENGTH, [this.length]);
    return false;
  }

  this.validity = true;
  return true;
}

///////////////////////////// covMinByteLengthValidator /////////////////////////////
/**
 * @type   : object
 * @access : private
 * @desc   : 'minByteLength' 항목에 대한 validator. 값이 지정된 byte단위의 길이 이상인지를 검사한다.
 * @sig    : length
 * @param  : length - 유효한 기준길이.
 * @author : 박성진
 */
function covMinByteLengthValidator(length) {
    // data;
    this.message = "";
    this.validity = false;
    this.length = length;

    // method
    this.validate = covMinByteLengthValidator_validate;
}

/**
 * @type   : method
 * @access : public
 * @object : covMinByteLengthValidator
 * @desc   : validation을 수행한다.
 * @sig    : value
 * @param  : value   - 유효성 검사 대상값.
 * @return : boolean - 유효성 여부.
 */
function covMinByteLengthValidator_validate(value) {
  if (cfGetByteLength(value) < this.length) {
    this.message = new coMessage().getMsg(VMSG_ERR_MIN_BYTE_LENGTH, [this.length, Math.floor(this.length / 2)]);
    return false;
  }

  this.validity = true;
  return true;
}

///////////////////////////// covMaxLengthValidator /////////////////////////////
/**
 * @type   : object
 * @access : private
 * @desc   : 'maxLength' 항목에 대한 validator. 값이 지정된 길이 이상인지를 검사한다.
 * @sig    : length
 * @param  : length - 유효한 기준길이.
 * @author : 박성진
 */
function covMaxLengthValidator(length) {
    // data;
    this.message = "";
    this.validity = false;
    this.length = length;

    // method
    this.validate = covMaxLengthValidator_validate;
}

/**
 * @type   : method
 * @access : public
 * @object : covMaxLengthValidator
 * @desc   : validation을 수행한다.
 * @sig    : value
 * @param  : value   - 유효성 검사 대상값.
 * @return : boolean - 유효성 여부.
 */
function covMaxLengthValidator_validate(value) {
  if (value.length > this.length) {
    this.message = new coMessage().getMsg(VMSG_ERR_MAX_LENGTH, [this.length]);
    return false;
  }

  this.validity = true;
  return true;
}

///////////////////////////// covMaxByteLengthValidator /////////////////////////////
/**
 * @type   : object
 * @access : private
 * @desc   : 'maxByteLength' 항목에 대한 validator. 값이 지정된 byte단위의 길이 이하인지를 검사한다.
 * @sig    : length
 * @param  : length - 유효한 기준길이.
 * @author : 박성진
 */
function covMaxByteLengthValidator(length) {
    // data;
    this.message = "";
    this.validity = false;
    this.length = length;

    // method
    this.validate = covMaxByteLengthValidator_validate;
}

/**
 * @type   : method
 * @access : public
 * @object : covMaxByteLengthValidator
 * @desc   : validation을 수행한다.
 * @sig    : value
 * @param  : value   - 유효성 검사 대상값.
 * @return : boolean - 유효성 여부.
 */
function covMaxByteLengthValidator_validate(value) {
  if (cfGetByteLength(value) > this.length) {
    this.message = new coMessage().getMsg(VMSG_ERR_MAX_BYTE_LENGTH, [this.length, Math.floor(this.length / 2)]);
    return false;
  }

  this.validity = true;
  return true;
}

///////////////////////////// covNumberValidator /////////////////////////////
/**
 * @type   : object
 * @access : private
 * @desc   : 'number' 항목에 대한 validator. 값이 숫자인지를 검사한다.
 * @author : 박성진
 */
function covNumberValidator() {
    // data;
    this.message = "";
    this.validity = false;

    // method
    this.validate = covNumberValidator_validate;
}

/**
 * @type   : method
 * @access : public
 * @object : covNumberValidator
 * @desc   : validation을 수행한다.
 * @sig    : value
 * @param  : value   - 유효성 검사 대상값.
 * @return : boolean - 유효성 여부.
 */
function covNumberValidator_validate(value) {
  if (isNaN(value)) {
    this.message = new coMessage().getMsg(VMSG_ERR_NUMBER);
    return false;
  }

  this.validity = true;
  return true;
}

///////////////////////////// covMinNumberValidator /////////////////////////////
/**
 * @type   : object
 * @access : private
 * @desc   : 'minNumber' 항목에 대한 validator. 값이 지정된 최소값을 넘는지를 검사한다.
 * @sig    : minNumber
 * @param  : minNumber - 유효한 기준 최소값.
 * @author : 박성진
 */
function covMinNumberValidator(minNumber) {
    // data;
    this.message = "";
    this.validity = false;
    this.minNumber = minNumber;

    // method
    this.validate = covMinNumberValidator_validate;
}

/**
 * @type   : method
 * @access : public
 * @object : covMinNumberValidator
 * @desc   : validation을 수행한다.
 * @sig    : value
 * @param  : value   - 유효성 검사 대상값.
 * @return : boolean - 유효성 여부.
 */
function covMinNumberValidator_validate(value) {
  // 기준값이 숫자가 아닌경우 무조건 true;
  if (isNaN(this.minNumber)) {
    this.validity = true;
    return true;
  }

  if (isNaN(value)) {
    this.message = new coMessage().getMsg(VMSG_ERR_NUMBER);
    return false;
  }

  this.minNumber = Number(this.minNumber);
  value          = Number(value);

  if (value < this.minNumber) {
    this.message = new coMessage().getMsg(VMSG_ERR_MIN_NUM, [this.minNumber]);
    return false;
  }

  this.validity = true;
  return true;
}

///////////////////////////// covMaxNumberValidator /////////////////////////////
/**
 * @type   : object
 * @access : private
 * @desc   : 'maxNumber' 항목에 대한 validator. 값이 지정된 최대값을 넘지 않는지를 검사한다.
 * @sig    : maxNumber
 * @param  : maxNumber - 유효한 기준 최대값.
 * @author : 박성진
 */
function covMaxNumberValidator(maxNumber) {
    // data;
    this.message = "";
    this.validity = false;
    this.maxNumber = (maxNumber == null) ? "" : maxNumber.trim();

    // method
    this.validate = covMaxNumberValidator_validate;
}

/**
 * @type   : method
 * @access : public
 * @object : covMaxNumberValidator
 * @desc   : validation을 수행한다.
 * @sig    : value
 * @param  : value   - 유효성 검사 대상값.
 * @return : boolean - 유효성 여부.
 */
function covMaxNumberValidator_validate(value) {
  // 기준값이 숫자가 아닌경우 무조건 true;
  if (isNaN(this.maxNumber)) {
    this.validity = true;
    return true;
  }

  if (isNaN(value)) {
    this.message = new coMessage().getMsg(VMSG_ERR_NUMBER);
    return false;
  }

  this.maxNumber = Number(this.maxNumber);
  value          = Number(value);

  if (value > this.maxNumber) {
    this.message = new coMessage().getMsg(VMSG_ERR_MAX_NUM, [this.maxNumber]);
    return false;
  }

  this.validity = true;
  return true;
}


///////////////////////////// covInNumberValidator /////////////////////////////
/**
 * @type   : object
 * @access : private
 * @desc   : 'inNumber' 항목에 대한 validator. 값이 지정된 범위 내의 값인지를 검사한다.
 * @sig    : inNumber
 * @param  : inNumber - 숫자의 범위를 나타내는 스트링. 예) "1~100"
 * @author : 박성진
 */
function covInNumberValidator(inNumber) {
    // data;
    this.message = "";
    this.validity = false;
    this.minNumber;
    this.maxNumber;

    // method
    this.validate = covInNumberValidator_validate;

    // initialize
  this.minNumber = inNumber.substring(0, inNumber.indexOf("~"));
  this.maxNumber = inNumber.substr(inNumber.indexOf("~") + 1);

  this.minNumber = (this.minNumber == null) ? "" : this.minNumber.trim();
  this.maxNumber = (this.maxNumber == null) ? "" : this.maxNumber.trim();
}

/**
 * @type   : method
 * @access : public
 * @object : covInNumberValidator
 * @desc   : validation을 수행한다.
 * @sig    : value
 * @param  : value   - 유효성 검사 대상값.
 * @return : boolean - 유효성 여부.
 */
function covInNumberValidator_validate(value) {
  // 기준값이 숫자가 아닌경우 무조건 true;
  if (isNaN(this.minNumber) || isNaN(this.maxNumber)) {
    this.validity = true;
    return true;
  }

  if (isNaN(value)) {
    this.message = new coMessage().getMsg(VMSG_ERR_NUMBER);
    return false;
  }

  this.minNumber = Number(this.minNumber);
  this.maxNumber = Number(this.maxNumber);
  value     = Number(value);

  if (value < this.minNumber || value > this.maxNumber) {
    this.message = new coMessage().getMsg(VMSG_ERR_IN_NUM, [this.minNumber, this.maxNumber]);
    return false;
  }

  this.validity = true;
  return true;
}

///////////////////////////// covMinDateValidator /////////////////////////////
/**
 * @type   : object
 * @access : private
 * @desc   : 'minDate' 항목에 대한 validator. 값이 지정된 날짜를 넘는지를 검사한다.
 *           'YYYYMMDD' 형식으로 날짜를 표기해야 한다.
 *             예) minDate=20020315
 * @sig    : minDate
 * @param  : minDate - 유효한 기준 최소값.
 * @author : 박성진
 */
function covMinDateValidator(minDate) {
    // data;
    this.message = "";
    this.validity = false;
    this.minDate = minDate;

    // method
    this.validate = covMinDateValidator_validate;
}

/**
 * @type   : method
 * @access : public
 * @object : covMinDateValidator
 * @desc   : validation을 수행한다.
 * @sig    : value
 * @param  : value   - 유효성 검사 대상값.
 * @return : boolean - 유효성 여부.
 */
function covMinDateValidator_validate(value) {
  if (!(new covDateValidator("YYYYMMDD").validate(value))) {
    this.message = new coMessage().getMsg(VMSG_ERR_DATE);
    return false;
  }

  if (value < this.minDate) {
    var msgParams = new Array(3);
    msgParams[0] = this.minDate.substring(0,4);
    msgParams[1] = this.minDate.substring(4,5) == "0" ? this.minDate.substring(5,6) : this.minDate.substring(4,6);
    msgParams[2] = this.minDate.substring(6,7) == "0" ? this.minDate.substring(7,8) : this.minDate.substring(6,8)
    this.message = new coMessage().getMsg(VMSG_ERR_MIN_DATE, msgParams);
    return false;
  }

  this.validity = true;
  return true;
}

///////////////////////////// covMaxDateValidator /////////////////////////////
/**
 * @type   : object
 * @access : private
 * @desc   : 'maxDate' 항목에 대한 validator. 값이 지정된 최대값을 넘지 않는지를 검사한다.
 * @sig    : maxDate
 * @param  : maxDate - 유효한 최대날짜값.
 * @author : 박성진
 */
function covMaxDateValidator(maxDate) {
    // data;
    this.message = "";
    this.validity = false;
    this.maxDate = maxDate;

    // method
    this.validate = covMaxDateValidator_validate;
}

/**
 * @type   : method
 * @access : public
 * @object : covMaxDateValidator
 * @desc   : validation을 수행한다.
 * @sig    : value
 * @param  : value   - 유효성 검사 대상값.
 * @return : boolean - 유효성 여부.
 */
function covMaxDateValidator_validate(value) {
  if (!(new covDateValidator("YYYYMMDD").validate(value))) {
    this.message = new coMessage().getMsg(VMSG_ERR_DATE);
    return false;
  }

  if (value > this.maxDate) {
    var msgParams = new Array(3);
    msgParams[0] = this.maxDate.substring(0,4);
    msgParams[1] = this.maxDate.substring(4,5) == "0" ? this.maxDate.substring(5,6) : this.maxDate.substring(4,6);
    msgParams[2] = this.maxDate.substring(6,7) == "0" ? this.maxDate.substring(7,8) : this.maxDate.substring(6,8)
    this.message = new coMessage().getMsg(VMSG_ERR_MAX_DATE, msgParams);
    return false;
  }

  this.validity = true;
  return true;
}

///////////////////////////// covFormatValidator /////////////////////////////
/**
 * @type   : object
 * @access : private
 * @desc   : 'format' 항목에 대한 validator. 값이 마스크로 표현된 형식과 일치하는지 검사한다.
 *             - format characters
 *               #    : 문자와 숫자
 *               A, Z : 문자 (Z는 공백포함)
 *               0, 9 : 숫자 (9는 공백포함)
 * @sig    : format
 * @param  : format - 포멧 스트링.
 * @author : 박성진
 */
function covFormatValidator(format) {
    // data;
    this.message  = "";
    this.validity = false;
    this.format   = format

    // method
    this.validate = covFormatValidator_validate;
}

/**
 * @type   : method
 * @access : public
 * @object : covFormatValidator
 * @desc   : validation을 수행한다.
 * @sig    : value
 * @param  : value - 유효성 검사 대상값.
 * @return : boolean - 유효성 여부.
 */
function covFormatValidator_validate(value) {
  if (value.length != this.format.length) {
    this.message = new coMessage().getMsg(VMSG_ERR_FORMAT, this.format);
    return false;
  }

  for (var i = 0; i < this.format.length; i++) {
    switch(this.format.charAt(i)) {
      case '0' :
        if (isNaN(value.charAt(i)) || value.charAt(i) == " ") {
          this.message = new coMessage().getMsg(VMSG_ERR_FORMAT, [this.format]);
          return false;
        }
        break;

      case '9' :
        if (isNaN(value.charAt(i))) {
          if (value.charAt(i) != " ") {
            this.message = new coMessage().getMsg(VMSG_ERR_FORMAT, [this.format]);
            return false;
          }
        }
        break;

      case 'A' :
        if ( (value.charAt(i) == " ") || !isNaN(value.charAt(i)) ) {
          this.message = new coMessage().getMsg(VMSG_ERR_FORMAT, [this.format]);
          return false;
        }
        break;

      case 'Z' :
        if ( (value.charAt(i) != " ") && !isNaN(value.charAt(i)) ) {
          this.message = new coMessage().getMsg(VMSG_ERR_FORMAT, [this.format]);
          return false;
        }
        break;

      case '#' :
        break;

      default :
        if (value.charAt(i) != this.format.charAt(i)) {
          this.message = new coMessage().getMsg(VMSG_ERR_FORMAT, [this.format]);
          return false;
        }
        break;
    }
  }

  this.validity = true;
  return true;
}

///////////////////////////// covSsnValidator /////////////////////////////
/**
 * @type   : object
 * @access : private
 * @desc   : 'ssn' 항목에 대한 validator. 입력된 주민등록번호가 유효한지 검사한다.
 * @author : 박성진
 */
function covSsnValidator() {
    // data;
    this.message = "";
    this.validity = false;

    // method
    this.validate = covSsnValidator_validate;
}

/**
 * @type   : method
 * @access : public
 * @object : covSsnValidator
 * @desc   : validation을 수행한다.
 * @sig    : ssn
 * @param  : ssn - 유효성 검사 대상값.
 * @return : boolean - 유효성 여부.
 */
function covSsnValidator_validate(ssn) {
  if ( ssn == null || ssn.trim().length != 13 || isNaN(ssn) )  {
    this.message = new coMessage().getMsg(VMSG_ERR_SSN);
    return false;
  }

  var jNum1 = ssn.substr(0, 6);
  var jNum2 = ssn.substr(6);

  /*
    잘못된 생년월일을 검사합니다.
    2000년도부터 성구별 번호가 바뀌였슴으로 구별수가 2보다 작다면
    1900년도 생이되고 2보다 크다면 2000년도 이상생이 됩니다.
    단 1800년도 생은 계산에서 제외합니다.
  */
  bYear = (jNum2.charAt(0) <= "2") ? "19" : "20";

  // 주민번호의 앞에서 2자리를 이어서 4자리의 생년을 저장합니다.
  bYear += jNum1.substr(0, 2);

  // 달을 구합니다. 1을 뺀것은 자바스크립트에서는 1월을 0으로 표기하기 때문입니다.
  bMonth = jNum1.substr(2, 2) - 1;

  bDate = jNum1.substr(4, 2);

  bSum = new Date(bYear, bMonth, bDate);

  // 생년월일의 타당성을 검사하여 거짓이 있을시 에러메세지를 나타냄
  if ( bSum.getYear() % 100 != jNum1.substr(0, 2) || bSum.getMonth() != bMonth || bSum.getDate() != bDate) {
    this.message = new coMessage().getMsg(VMSG_ERR_SSN);
    return false;
  }

  total = 0;
  temp = new Array(13);

  for (i = 1; i <= 6; i++) {
    temp[i] = jNum1.charAt(i-1);
  }

  for (i = 7; i <= 13; i++) {
    temp[i] = jNum2.charAt(i-7);
  }

  for (i = 1; i <= 12; i++) {
    k = i + 1;

    // 각 수와 곱할 수를 뽑아냅니다. 곱수가 만일 10보다 크거나 같다면 계산식에 의해 2로 다시 시작하게 됩니다.
    if(k >= 10) k = k % 10 + 2;

    // 각 자리수와 계산수를 곱한값을 변수 total에 누적합산시킵니다.
    total = total + (temp[i] * k);
  }

  // 마지막 계산식을 변수 last_num에 대입합니다.
  last_num = (11- (total % 11)) % 10;

	//2013.12.13 -수정↓
  // laster_num이 주민번호의마지막수와 같은면 참을 틀리면 거짓을 반환합니다.
//  if(last_num != temp[13]) {
//    this.message = new coMessage().getMsg(VMSG_ERR_SSN);
//    return false;
//  }

	var strAt7 = jNum2.substr(0, 1);
	if(!(strAt7 == '5' || strAt7 == '6' || strAt7 == '7' || strAt7 == '8'))
	{
		if(last_num != temp[13])
		{
			this.message = new coMessage().getMsg(VMSG_ERR_SSN);
			return false;
		}
	}
	//2013.12.13 -수정↑

  this.validity = true;
  return true;
}

///////////////////////////// covCsnValidator /////////////////////////////
/**
 * @type   : object
 * @access : private
 * @desc   : 'csn' 항목에 대한 validator. 입력된 사업자등록번호가 유효한지 검사한다.
 * @author : 박성진
 */
function covCsnValidator() {
    // data;
    this.message = "";
    this.validity = false;

    // method
    this.validate = covCsnValidator_validate;
}

/**
 * @type   : method
 * @access : public
 * @object : covCsnValidator
 * @desc   : validation을 수행한다.
 * @sig    : csn
 * @param  : csn - 유효성 검사 대상값.
 * @return : boolean - 유효성 여부.
 */
function covCsnValidator_validate(csn) {
  if ( csn == null || csn.length != 10 || isNaN(csn) )  {
    this.message = new coMessage().getMsg(VMSG_ERR_CSN);
    return false;
  }

  var sum = 0;
  var nam = 0;
  var checkDigit = -1;
  var checkArray = [1,3,7,1,3,7,1,3,5];

  for(i=0 ; i < 9 ; i++)
    sum += csn.charAt(i) * checkArray[i];

  sum = sum + ((csn.charAt(8) * 5 ) / 10);

  nam = Math.floor(sum) % 10;

  checkDigit = ( nam == 0 ) ? 0 : 10 - nam;

  if ( csn.charAt(9) != checkDigit) {
    this.message = new coMessage().getMsg(VMSG_ERR_CSN);
    return false;
  }

  this.validity = true;
  return true;
}

///////////////////////////// covFilterValidator /////////////////////////////
/**
 * @type   : object
 * @access : private
 * @desc   : 지정된 스트링들이 들어있을 경우 유효하지 않은것으로 판단한다.
 *           분리자는 ";"를 사용한다. ";" 혹은 ";"문자가 들어간 스트링을 필터링하려 할 경우는
 *           "\\;"라고 표기해야 한다.
 * @sig    : fStr
 * @param  : fStr - filter에 대한 표현
 * @author : 박성진
 */
function covFilterValidator(fStr) {
    // data;
    this.message = "";
    this.validity = false;
    this.fStrArr = fStr.advancedSplit(";", "i");

    // method
    this.validate = covFilterValidator_validate;
}

/**
 * @type   : method
 * @access : public
 * @object : covFilterValidator
 * @desc   : validation을 수행한다.
 * @sig    : value
 * @param  : value - 유효성 검사 대상값.
 * @return : boolean - 유효성 여부.
 */
function covFilterValidator_validate(value) {
  for (var i = 0; i < this.fStrArr.length; i++) {
    if (value.indexOf(this.fStrArr[i]) != -1) {
      this.message = new coMessage().getMsg(VMSG_ERR_FILTER, [this.fStrArr.toString()]);
      return false;
    }
  }

  this.validity = true;
  return true;
}

///////////////////////////// covDateValidator /////////////////////////////
/**
 * @type   : object
 * @access : private
 * @desc   : 값이 Date형식인지를 검사한다.
 *
 *            format문자 :  YYYY,  -> 4자리 년도
 *                          YY,    -> 2자리 년도. 2000년 이후.
 *                          MM,    -> 2자리 숫자의 달.
 *                          DD,    -> 2자리 숫자의 일.
 *                          hh,    -> 2자리 숫자의 시간. 12시 기준
 *                          HH,    -> 2자리 숫자의 시간. 24시 기준
 *                          mm,    -> 2자리 숫자의 분.
 *                          ss     -> 2자리 숫자의 초.
 *
 *            예)
 *                'YYYYMMDD' -> '20020328'
 *                'YYYY/MM/DD' -> '2002/03/28'
 *                'Today : YY-MM-DD' -> 'Today : 02-03-28'
 *
 *            참고)
 *                  format문자가 중복해서 나오더라도 처음 나온 문자에 대해서만
 *                  format문자로 인식된다. YYYY와 YY, hh와 HH 도 중복으로 본다.
 *                  날짜는 년,월이 존재할 때만 정확히 체크하고 만일 년, 월이 없다면
 *                  1 ~ 31 사이인지만 체크한다.
 *
 * @sig    : dateExp
 * @param  : dateExp - Date Format expression.
 *             예) 2002년 3월 12일 -> "YYYY-MM-DD"(Date Format Expression) -> "2002-03-12"
 * @author : 박성진
 */
function covDateValidator(dateExp) {
    // data;
    this.message = "";
    this.validity = false;
    this.dateExp = dateExp;
    this.year = null;
    this.month = null;

    // method
    this.validate = covDateValidator_validate;
    this.checkLength = covDateValidator_checkLength;
    this.checkYear = covDateValidator_checkYear;
    this.checkMonth = covDateValidator_checkMonth;
    this.checkDay = covDateValidator_checkDay;
    this.checkHour = covDateValidator_checkHour;
    this.checkMin = covDateValidator_checkMin;
    this.checkSec = covDateValidator_checkSec;
    this.checkRest = covDateValidator_checkRest;
}

/**
 * @type   : method
 * @access : public
 * @object : covDateValidator
 * @desc   : validation을 수행한다.
 * @sig    : value
 * @param  : value   - 검사대상이 되는 Date 스트링 값.
 * @return : boolean - 유효성 여부
 */
function covDateValidator_validate(value) {
  this.value = value;

  if ( this.checkLength(value) &&
     this.checkYear(value) &&
     this.checkMonth(value) &&
     this.checkDay(value) &&
     this.checkHour(value) &&
     this.checkMin(value) &&
     this.checkSec(value) &&
     this.checkRest(value)
     ) {
    this.validity = true;
    return true;
  } else {
    this.validity = false;
    return false;
  }
}

function covDateValidator_checkLength() {
  if (this.value.length == this.dateExp.length) {
    return true;
  } else {
    this.message = new coMessage().getMsg(VMSG_ERR_LENGTH, [this.dateExp.length]);
    return false;
  }
}

function covDateValidator_checkYear() {
  var index = -1;

  if ( (index = this.dateExp.indexOf("YYYY")) != -1 ) {
    subValue = this.value.substr(index, 4);
    if ( !isNaN(subValue) &&
       (subValue > 0)
       ) {
      this.dateExp = this.dateExp.cut(index, 4);
      this.value = this.value.cut(index, 4);
      this.year = subValue;
      return true;
    } else {
      this.message = new coMessage().getMsg(VMSG_ERR_YEAR);
      return false;
    }
  }

  if ( (index = this.dateExp.indexOf("YY")) != -1 ) {
    subValue = "20" + this.value.substr(index, 2);
    if ( !isNaN(subValue) &&
       (subValue > 0)
       ) {
      this.dateExp = this.dateExp.cut(index, 2);
      this.value = this.value.cut(index, 2);
      this.year = subValue;
      return true;
    } else {
      this.message = new coMessage().getMsg(VMSG_ERR_YEAR);
      return false;
    }
  }

  return true;
}

function covDateValidator_checkMonth() {
  var index = -1;

  if ( (index = this.dateExp.indexOf("MM")) != -1 ) {
    subValue = this.value.substr(index, 2);
    if ( !isNaN(subValue) &&
         (subValue > 0) &&
         (subValue <= 12)
       ) {
      this.dateExp = this.dateExp.cut(index, 2);
      this.value = this.value.cut(index, 2);
      this.month = subValue;
      return true;
    } else {
      this.message = new coMessage().getMsg(VMSG_ERR_MONTH);
      return false;
    }
  }

  return true;
}

function covDateValidator_checkDay() {
  var index = -1;
  var days = 0;

  if ( (index = this.dateExp.indexOf("DD")) != -1 ) {
    if ( (this.year != null) && (this.month != null) ) {
      days = (this.month != 2) ? GLB_DAYS_IN_MONTH[this.month-1] : (( (this.year % 4) == 0 && (this.year % 100) != 0 || (this.year % 400) == 0 ) ? 29 : 28 );
    } else {
      days = 31;
    }

    subValue = this.value.substr(index, 2);
    if ( (!isNaN(subValue)) &&
         (subValue > 0) &&
         (subValue <= days)
       ) {
      this.dateExp = this.dateExp.cut(index, 2);
      this.value = this.value.cut(index, 2);
      return true;
    } else {
      this.message = new coMessage().getMsg(VMSG_ERR_DAY);
      return false;
    }
  }

  return true;
}

function covDateValidator_checkHour() {
  var index = -1;

  if ( (index = this.dateExp.indexOf("hh")) != -1 ) {
    subValue = this.value.substr(index, 2);
    if ( !isNaN(subValue) &&
         (subValue >= 0) &&
         (subValue <= 12)
       ) {
      this.dateExp = this.dateExp.cut(index, 2);
      this.value = this.value.cut(index, 2);
      return true;
    } else {
      this.message = new coMessage().getMsg(VMSG_ERR_HOUR);
      return false;
    }
  }

  if ( (index = this.dateExp.indexOf("HH")) != -1 ) {
    subValue = this.value.substr(index, 2);
    if ( !isNaN(subValue) &&
         (subValue >= 0) &&
         (subValue < 24)
       ) {
      this.dateExp = this.dateExp.cut(index, 2);
      this.value = this.value.cut(index, 2);
      return true;
    } else {
      this.message = new coMessage().getMsg(VMSG_ERR_HOUR);
      return false;
    }
  }

  return true;
}

function covDateValidator_checkMin() {
  var index = -1;

  if ( (index = this.dateExp.indexOf("mm")) != -1 ) {
    subValue = this.value.substr(index, 2);
    if ( !isNaN(subValue) &&
         (subValue >= 0) &&
         (subValue < 60 )
       ) {
      this.dateExp = this.dateExp.cut(index, 2);
      this.value = this.value.cut(index, 2);
      this.month = subValue;
      return true;
    } else {
      this.message = new coMessage().getMsg(VMSG_ERR_MINUTE);
      return false;
    }
  }

  return true;
}

function covDateValidator_checkSec() {
  var index = -1;

  if ( (index = this.dateExp.indexOf("ss")) != -1 ) {
    subValue = this.value.substr(index, 2);
    if ( (!isNaN(subValue)) &&
         (subValue >= 0) &&
         (subValue < 60 )
       ) {
      this.dateExp = this.dateExp.cut(index, 2);
      this.value = this.value.cut(index, 2);
      this.month = subValue;
      return true;
    } else {
      this.message = new coMessage().getMsg(VMSG_ERR_SECOND);
      return false;
    }
  }

  return true;
}

function covDateValidator_checkRest() {
  if (this.value == this.dateExp) {
    return true;
  }

  return false;
}


///////////////////////////// covNullValidator /////////////////////////////
/**
 * @type   : object
 * @access : private
 * @desc   : 무조건 valid한 결과를 가진 validator.
 * @author : 박성진
 */
function covNullValidator() {
    // data;
    this.message = "";
    this.validity = true;

    // method
    this.validate = covNullValidator_validate;
}

/**
 * @type   : method
 * @access : public
 * @object : covNullValidator
 * @desc   : validation을 수행한다.
 * @return : boolean - 무조건 true.
 */
function covNullValidator_validate() {
  this.message = new coMessage().getMsg(VMSG_VALID);
  return true;
}

/**
 * @type   : method
 * @access : public
 * @object : cfPopupSetting
 * @desc   : 팝업의 IBSheet Grid에서 더블클릭하면 open의 해당항목에 값을 자동으로 셋팅한다.
 * @sig    : value, paramArray
 * @param  : value      - 팝업의 IBSheet Grid데이터(key=value 매핑 스트링)
 * @param  : paramArray - 값 셋팅에서 제외하고자하는 key
 */
function cfPopupSetting(data, paramArray,formNm) {
  var strArr = data.advancedSplit("&", "t");

  var str;
  for(var j=0; j<strArr.length; j++) {
    str = strArr[j].advancedSplit("=", "t");
    if(paramArray.trim().indexOf(str[0]) == -1) {
      if( typeof( eval("opener.document."+formNm+"."+str[0]) ) != "undefined"  ){
        eval("opener.document."+formNm+"."+str[0]).value = str[1];
      }
    }
  }
}


/**
 * @type   : method
 * @access : public
 * @object : cfPopupSetting
 * @desc   : IBSheet Grid에서 클릭하였을때 RowSaveStr() 에서 넘겨 주는 값을 form 에 자동으로 세팅
 * @sig    : value, paramArray
 * @param  : value      - 팝업의 IBSheet Grid데이터(key=value 매핑 스트링)
 * @param  : paramArray - 값 셋팅에서 제외하고자하는 key
 * @param  : formName - 세팅하고자 하는 값이 있는 form
 */
function cfGridSetting(data, paramArray,formNm) {
  var strArr = data.advancedSplit("&", "t");

  var str;
  for(var j=0; j<strArr.length; j++) {
    str = strArr[j].advancedSplit("=", "t");
    if(paramArray.trim().indexOf(str[0]) == -1) {
      if( typeof( eval("document."+formNm+"."+str[0]) ) != "undefined"  ){
        eval("document."+formNm+"."+str[0]).value = str[1];
      }
    }
  }
}


/**
 * @type   : method
 * @access : public
 * @object : cfValidFTDate
 * @desc   : 조회 조건에서 from , to date의 값을 비교 to date  값이 작으면 메세지를 보이고 false 를 return
 * @sig    : fromDateStr,toDateStr,dateFormat,fromName,toName
 * @param  : fromDateStr - from Date의 str ex) 2008-12-12
 * @param  : toDateStr - to Date의 str ex) 2008-12-12
 * @param  : dateFormat - 날짜간의 계산을 위한 날짜 포맷 ex) "YYYY-MM-DD"
 * @param  : fromName - 메세지를 표시 하기 위해 사용되는 조회조건의 이름
 * @param  : toName - 메세지를 표시 하기 위해 사용되는 조회조건의 이름
 */
function cfValidFTDate(fromDateStr,toDateStr,dateFormat,fromName,toName) {

  if ((fromDateStr == null || fromDateStr.trim() =="") && toDateStr == null || toDateStr.trim() =="") {
    return true;
  }

  if (fromDateStr == null || fromDateStr =="") {
      fromDateStr = "10000101";
  }

  if (toDateStr == null || toDateStr =="") {
      toDateStr = "99991231";
  }

  var fromDate = fromDateStr.toDate(dateFormat);
  var toDate = toDateStr.toDate(dateFormat);

  var msgs = new Array(fromName, toName);

  if ((toDate - fromDate) < 0  ) {

    cfAlertMsg(MSG_FTDATE_NOTVALID, msgs);

    return false;
  } else return true;


}

/**
  * 임시 복호화 function
  * input tag 의 value 에 enc text 가 있을 경우 깨짐 현상 방지.
  * todo : 따옴표(') 변환 스크립트 추가.
  * 김진현D
  */
function enc_form( type, name, vaule) {
  var dec_val = document.IssacWebDec.issacweb_decrypt_s(vaule, keyname2);
  var out_frm = "<input type='" + type + "' name='" + name + "' value= '" + dec_val +"'>";
  document.write( out_frm );
}

/**
 * @type   : method
 * @access : public
 * @object : cfGetZipCode
 * @desc   : 우편번호를 조회해서 오프너 페이지에 세팅한다.
 * @sig    : zipcode1,zipcode2,addr1,addr2
 * @param  : zipcode1 - 첫번째 우편번호 필드명
 * @param  : zipcode2 - 두번째 우편번호 필드명
 * @param  : addr1 - 첫번째 주소 필드명
 * @param  : addr2 - 두번째 주소 필드명
 * @author : 한현주
 */
function cfGetZipCode(zipcode1, zipcode2, addr1, addr2){

  var width     = 390;
  var height    = 400;
  var sURL      = "/common/util/SeachZipcodePu.jsp?field1="+zipcode1+"&field2="+zipcode2+"&field3="+addr1+"&field4="+addr2;
  var sName     = "zipcode";
  var sFeatures = "";
  var bReplace  = "";

  cfOpen(width, height, 5, sURL, sName, sFeatures, bReplace);
}

/**
 * @type   : method
 * @access : public
 * @object : cfGetZipCode
 * @desc   : 우편번호를 조회해서 오프너 페이지에 세팅한다.(카드등록신청용)
 * @sig    : zipcode1,zipcode2,addr1,addr2
 * @param  : zipcode1 - 첫번째 우편번호 필드명
 * @param  : zipcode2 - 두번째 우편번호 필드명
 * @param  : addr1 - 첫번째 주소 필드명
 * @param  : addr2 - 두번째 주소 필드명
 * @author : 한현주
 */
function cfGetZipCode2(zipcode1, zipcode2, addr1, addr2){

  var width     = 390;
  var height    = 400;
  var sURL      = "/common/util/SeachZipcodePu_Link.jsp?field1="+zipcode1+"&field2="+zipcode2+"&field3="+addr1+"&field4="+addr2;
  var sName     = "zipcode";
  var sFeatures = "";
  var bReplace  = "";

  cfOpen(width, height, 5, sURL, sName, sFeatures, bReplace);
}


/**
 * @type   : method
 * @access : public
 * @object : cfGetZipCodeSheet
 * @desc   : 우편번호를 조회해서 오프너 Sheet 페이지에 세팅한다.
 * @sig    : sheet,sheetRow,zipcode1,zipcode2,addr1,addr2
 * @param  : sheet - IBSheet명
 * @param  : sheetRow - IBSheet Row
 * @param  : zipcode1 - 첫번째 우편번호 Col
 * @param  : zipcode2 - 두번째 우편번호 Col
 * @param  : addr1 - 첫번째 주소 Col
 * @param  : addr2 - 두번째 주소 Col
 * @author : YKJ
 */
function cfGetZipCodeSheet(sheet, sheetRow, zipcode1, zipcode2, addr1, addr2){

  var width     = 390;
  var height    = 400;
  var sURL      = "/common/util/SeachZipcodeSheetPu.jsp?sheet=" +sheet +"&sheetRow="+sheetRow+"&field1="+zipcode1+"&field2="+zipcode2+"&field3="+addr1+"&field4="+addr2;
  var sName     = "zipcode";
  var sFeatures = "";
  var bReplace  = "";

  cfOpen(width, height, 5, sURL, sName, sFeatures, bReplace);
}



/**
 * @type   : method
 * @access : public
 * @object : cfGetNationSheet
 * @desc   : 국가명을를 조회해서 오프너 Sheet 페이지에 세팅한다.
 * @sig    : sheet,sheetRow,cocode,cdname
 * @param  : sheet - IBSheet명
 * @param  : sheetRow - IBSheet Row
 * @param  : cocode - 공통코드 Col
 * @param  : cdname - 공통코드명 Col
 * @author : YKJ
 */
function cfGetNationSheet(sheet, sheetRow, cocode, cdname){

  var width     = 390;
  var height    = 400;
  var sURL      = "/common/util/SeachNationPu.jsp?sheet=" +sheet +"&sheetRow="+sheetRow+"&field1="+cocode+"&field2="+cdname;
  var sName     = "nationcode";
  var sFeatures = "";
  var bReplace  = "";

  cfOpen(width, height, 5, sURL, sName, sFeatures, bReplace);
}


/**
 * @type   : method
 * @access : public
 * @object : cfIsForeign
 * @desc   : 유효한 외국인 등록번호인지 체크
 * @sig    : fsn
 * @param  : fsn - 외국인등록번호
 * @author : 한현주
 */
function cfIsForeign(fsn){

    if(cfIsNull(fsn)){
      cfAlertMsg(VMSG_ERR_ITEM_INSERT,"주민등록번호");
      return false;
    }

     var jumin = fsn.match(/[0-9]{2}[01]{1}[0-9]{1}[0123]{1}[0-9]{1}[5678]{1}[0-9]{1}[02468]{1}[0-9]{2}[6789]{1}[0-9]{1}$/);

     if(jumin == null) {
         return false;
     }else{
         //jumin = jumin.toString().num().toString();
         jumin = jumin.toString();
     }

     // 생년월일 체크
     var birthYY = (parseInt(jumin.charAt(6)) == (5 || 6)) ? "19" : "20";
     birthYY += jumin.substr(0, 2);
     var birthMM = jumin.substr(2, 2) - 1;
     var birthDD = jumin.substr(4, 2);
     var birthDay = new Date(birthYY, birthMM, birthDD);

     if(birthDay.getYear() % 100 != jumin.substr(0,2) || birthDay.getMonth() != birthMM || birthDay.getDate() != birthDD) {
         return false;
     }

     if((parseInt(jumin.charAt(7)) * 10 + parseInt(jumin.charAt(8))) % 2 != 0) {
         return false;
     }

     var sum = 0;
     var num = [2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5]
     var last = parseInt(jumin.charAt(12));

     for(var i = 0; i < 12; i++) {
         sum += parseInt(jumin.charAt(i)) * num[i];
     }

     return (((11 - sum % 11) % 10) + 2 == last) ? true : false;
 }

/**
 * @type   : method
 * @access : public
 * @object : cfGetDayBetweenDate
 * @desc   : 두 날짜의 차이를 날(日)수로 리턴한다
 * @sig    : basicDate, compareDate
 * @param  : basicDate   - 시작날짜
 * @param  : compareDate - 종료날짜
 * @author : 한현주
 */
function cfGetDayBetweenDate(basicDate, compareDate) {

  basicDate = basicDate.simpleReplace("-", "");       // '-'가 있다면 제거
  compareDate   = compareDate.simpleReplace("-", "");

  if(!cfValidateValue(basicDate, "date=YYYYMMDD") ||!cfValidateValue(compareDate, "date=YYYYMMDD")) return false;   //날짜 형식이 아니라면

  var date1  = new Date(basicDate.substring(0,4), basicDate.substring(4,6)-1, basicDate.substring(6,8) );
  var date2  = new Date(compareDate.substring(0,4), compareDate.substring(4,6)-1,compareDate.substring(6,8));

  return Math.floor(( date1 - date2 )*(1/(1000*60*60*24)));
}

/**
 * @type   : method
 * @access : public
 * @object : cfResidentCheck
 * @desc   : 이름과 주민번호로 실명인증 페이지를 호출한다.
 * @sig    : oName, oJumin
 * @param  : oName  - 이름
 * @param  : oJumin - 주민번호(13자리)
 * @author :
 */
function cfResidentCheck(oName, oJumin, oForm, oFrame){

  if(cfIsNull(oForm)){
    var vFrm = document.getElementById("residentchk_form");
  } else {
    var vFrm = document.getElementById(oForm);
  }

  var result;

   //입력값 not null 확인
  if (cfIsNull(oName)) {
    cfAlertMsg(VMSG_ERR_ITEM_INSERT, ['이름']);
    return;
  }
  if (cfIsNull(oJumin)) {
    cfAlertMsg(VMSG_ERR_ITEM_INSERT, ['주민번호']);
    return;
  }
  if ( !cfIsNull(oName) && !cfIsNull(oJumin) ) {
    //주민번호 유효여부 체크
    if( !covSsnValidator_validate(oJumin) ) {
      cfAlertMsg(VMSG_ERR_SSN);
      return;
    }
  }

  var item = vFrm.getElementsByTagName("input");
  item["rscuname"].value = oName;
  item["rscujumin"].value = oJumin;

  vFrm.action = "/common/jsp/ResidentCheckSlL.jsp";

  if(cfIsNull(oFrame)){
    vFrm.target = document.getElementById("residentchkFrame").name;
  } else {
    vFrm.target = document.getElementById(oFrame).name;
  }

  vFrm.submit();
}

/**
 * 숫자만 입력가능 (ex : 0123456789)
 *
 * @author : 전두선
 */
function fnOnlyNumber() {
  if((escape(event.keyCode) < 48 || escape(event.keyCode) > 57) && (escape(event.keyCode) < 96 || escape(event.keyCode) > 105) && escape(event.keyCode) != 8 && escape(event.keyCode) != 9) {
    event.returnValue = false;
  }
}

/**
 * 숫자만 입력가능 (ex : 0123456789)
 *
 * @author : 전두선
 */
function fnOnlyNumber2() {
  if(escape(event.keyCode) < 48 || escape(event.keyCode) > 57) {
    event.returnValue = false;
  }
}

/**
 * 데이터 검증 ( 기존의 cfValidate 이 잘 동작하지 않을 경우 사용 )
 * 사용법은 cfValidate 와 같으며 페이지 안의 모든 Form Tag 들을 검사함
 * Radio , CheckBox , SelectBox등은 잘 안되는듯 ....
 */
function fnDoValidate() {
  var objInput = document.getElementsByTagName("INPUT") ;
  var objSelect = document.getElementsByTagName("SELECT") ;
  var objTextArea = document.getElementsByTagName("TEXTAREA") ;
  var arrObj = new Array ( objInput , objSelect , objTextArea ) ;
  for ( var a = 0 ; a < arrObj.length ; a ++ ) {
    for ( var i = 0 ; i < arrObj[a].length ; i ++ ) {
      if (!cfValidateElement(arrObj[a][i])) {
        return false;
      }
  }
  }
  return true ;
}




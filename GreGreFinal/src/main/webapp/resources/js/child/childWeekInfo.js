    $(()=>{
        var swiper = new Swiper('.swiper-container', { 
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
        },
            mousewheel: true,
            keyboard: true,
        });

        console.log(swiper.navigation.prevEl);
    });



$(function(){
        $(".btn-month").on("click", function(){
            $(".row").removeClass("is-hide");
            $(".info").addClass("is-hide");
            console.log(this.id);
                
            let babyData = babyDatas[this.id];
            let option = options[this.id];
            let image = images[this.id];
            
            
            $(".week").text(babyData.week.week); //신생아 주차
            $("#boy_cm").text(babyData.boy.cm); //남아 키
            $("#boy_kg").text(babyData.boy.kg); //남아 몸무게
            $("#girl_cm").text(babyData.girl.cm); //여아 키
            $("#girl_kg").text(babyData.girl.kg); //여아 몸무게
            $("#way1").text(option.option1); //컨텐츠명1
            $("#way2").text(option.option2); //컨텐츠명2
            $("#image1").attr("src", image.image1); //컨텐츠 이미지1
            $("#image2").attr("src", image.image2); //컨텐츠 이미지2
        });
    });
    
    function BabyData(id,week,boy,girl){
        this.id = id;
        this.week = week;
        this.boy = boy;
        this.girl = girl;
    }

    function Baby(cm,kg){
        this.cm = cm; //키
        this.kg = kg; //몸무게
    }
    
    function Week(week){
        this.week = week; //시기별
    }
    
    function Option(option1, option2){
        this.option1 = option1; //컨텐츠명1
        this.option2 = option2; //컨텐츠명2
    }

    function Image(image1, image2){
        this.image1 = image1;
        this.image2 = image2;
    }

    

    let babyDatas = {};
    //신생아 1주~4주차
    babyDatas['0_1'] = new BabyData('0_1', new Week("1"), new Baby(49.9, 3.3), new Baby(49.1, 3.2));
    babyDatas['0_2'] = new BabyData('0_2', new Week("2"), new Baby(49.9, 3.3), new Baby(49.1, 3.2));
    babyDatas['0_3'] = new BabyData('0_3', new Week("3"), new Baby(49.9, 3.3), new Baby(49.1, 3.2));
    babyDatas['0_4'] = new BabyData('0_4', new Week("4"), new Baby(49.9, 3.3), new Baby(49.1, 3.2));
    //신생아 1개월
    babyDatas['1_1'] = new BabyData('1_1', new Week("1개월 1"), new Baby(55.2, 4.6), new Baby(54.2, 4.4));
    babyDatas['1_2'] = new BabyData('1_2', new Week("2개월 2"), new Baby(55.2, 4.6), new Baby(54.2, 4.4));
    babyDatas['1_3'] = new BabyData('1_3', new Week("3개월 3"), new Baby(55.2, 4.6), new Baby(54.2, 4.4));
    babyDatas['1_4'] = new BabyData('1_4', new Week("4개월 4"), new Baby(55.2, 4.6), new Baby(54.2, 4.4));
    //신생아 2개월
    babyDatas['2_1'] = new BabyData('2_1', new Week("2개월 1"), new Baby(59, 5.8), new Baby(58, 5.5));
    babyDatas['2_2'] = new BabyData('2_2', new Week("2개월 2"), new Baby(59, 5.8), new Baby(58, 5.5));
    babyDatas['2_3'] = new BabyData('2_3', new Week("2개월 3"), new Baby(59, 5.8), new Baby(58, 5.5));
    babyDatas['2_4'] = new BabyData('2_4', new Week("2개월 4"), new Baby(59, 5.8), new Baby(58, 5.5));
    //신생아 3개월
    babyDatas['3_1'] = new BabyData('3_1', new Week("3개월 1"), new Baby(62.5, 6.8), new Baby(61.1, 6.3));
    babyDatas['3_2'] = new BabyData('3_2', new Week("3개월 2"), new Baby(62.5, 6.8), new Baby(61.1, 6.3));
    babyDatas['3_3'] = new BabyData('3_3', new Week("3개월 3"), new Baby(62.5, 6.8), new Baby(61.1, 6.3));
    babyDatas['3_4'] = new BabyData('3_4', new Week("3개월 4"), new Baby(62.5, 6.8), new Baby(61.1, 6.3));
    //신생아 4개월
    babyDatas['4_1'] = new BabyData('4_1', new Week("4개월 1"), new Baby(65.1, 7.6), new Baby(63.8, 7.1));
    babyDatas['4_2'] = new BabyData('4_2', new Week("4개월 2"), new Baby(65.1, 7.6), new Baby(63.8, 7.1));
    babyDatas['4_3'] = new BabyData('4_3', new Week("4개월 3"), new Baby(65.1, 7.6), new Baby(63.8, 7.1));
    babyDatas['4_4'] = new BabyData('4_4', new Week("4개월 4"), new Baby(65.1, 7.6), new Baby(63.8, 7.1));
    //신생아 5개월
    babyDatas['5_1'] = new BabyData('5_1', new Week("5개월 1"), new Baby(49.9, 3.33), new Baby(49.1, 3.22));
    babyDatas['5_2'] = new BabyData('5_2', new Week("5개월 2"), new Baby(49.9, 3.33), new Baby(49.1, 3.22));
    babyDatas['5_3'] = new BabyData('5_3', new Week("5개월 3"), new Baby(49.9, 3.33), new Baby(49.1, 3.22));
    babyDatas['5_4'] = new BabyData('5_4', new Week("5개월 4"), new Baby(49.9, 3.33), new Baby(49.1, 3.22));
    //신생아 6개월
    babyDatas['6_1'] = new BabyData('6_1', new Week("6개월 1"), new Baby(66.8, 7.9), new Baby(65.7, 7.5));
    babyDatas['6_2'] = new BabyData('6_2', new Week("6개월 2"), new Baby(66.8, 7.9), new Baby(65.7, 7.5));
    babyDatas['6_3'] = new BabyData('6_3', new Week("6개월 3"), new Baby(66.8, 7.9), new Baby(65.7, 7.5));
    babyDatas['6_4'] = new BabyData('6_4', new Week("6개월 4"), new Baby(66.8, 7.9), new Baby(65.7, 7.5));
    //신생아 7개월
    babyDatas['7_1'] = new BabyData('7_1', new Week("7개월 1"), new Baby(70.4, 8.7), new Baby(69.1, 8.3));
    babyDatas['7_2'] = new BabyData('7_2', new Week("7개월 2"), new Baby(70.4, 8.7), new Baby(69.1, 8.3));
    babyDatas['7_3'] = new BabyData('7_3', new Week("7개월 3"), new Baby(70.4, 8.7), new Baby(69.1, 8.3));
    babyDatas['7_4'] = new BabyData('7_4', new Week("7개월 4"), new Baby(70.4, 8.7), new Baby(69.1, 8.3));
    //신생아 8개월
    babyDatas['8_1'] = new BabyData('8_1', new Week("8개월 1"), new Baby(71.9, 9), new Baby(70.5, 8.5));
    babyDatas['8_2'] = new BabyData('8_2', new Week("8개월 2"), new Baby(71.9, 9), new Baby(70.5, 8.5));
    babyDatas['8_3'] = new BabyData('8_3', new Week("8개월 3"), new Baby(71.9, 9), new Baby(70.5, 8.5));
    babyDatas['8_4'] = new BabyData('8_4', new Week("8개월 4"), new Baby(71.9, 9), new Baby(70.5, 8.5));
    //신생아 9개월
    babyDatas['9_1'] = new BabyData('9_1', new Week("9개월 1"), new Baby(73.5, 9.5), new Baby(72.2, 8.9));
    babyDatas['9_2'] = new BabyData('9_2', new Week("9개월 2"), new Baby(73.5, 9.5), new Baby(72.2, 8.9));
    babyDatas['9_3'] = new BabyData('9_3', new Week("9개월 3"), new Baby(73.5, 9.5), new Baby(72.2, 8.9));
    babyDatas['9_4'] = new BabyData('9_4', new Week("9개월 4"), new Baby(73.5, 9.5), new Baby(72.2, 8.9));
  

    //컨텐츠명 1,2
    let options = {};
    options['0_1'] = new Option("휴식을 취해주세요", "출산 1주일 꼼꼼 플랜!");
    options['0_2'] = new Option("산후관리를 철저히 해주세요", "산후조리 몸관리 원칙!");
    options['0_3'] = new Option("분만 상처가 아물어요", "산후 금기사항 언제부터 가능할까?");
    options['0_4'] = new Option("치골과 성기가 거의 회복돼요", "산후에 생길 수 있는 병?");

    options['1_1'] = new Option("[0~1개월 아이가 성장해요]", "올바른 젖먹이 자세");  
    options['1_2'] = new Option("엄마가 알아두어야 할 신생아 대변의 특징", "신생아 검사의 종류와 특징");  
    options['1_3'] = new Option("신생아 변비, 비켜!", "1개월 무렵에 꼭 해야 할 교육 프로그램");  
    options['1_4'] = new Option("포동포동 아기들이 귀여워져요", "어떻게 잘 먹이지?");

    options['2_1'] = new Option("월령별, 육아 실천기", "무슨 말을 하려는거니?");  
    options['2_2'] = new Option("말하기 전 아기와의 대화법", "아기 키우기 포인트");   
    options['2_3'] = new Option("장난감 이야기", "구석구석 아기 몸 돌보기"); 
    options['2_4'] = new Option("아기의 치아가 발달해요", "모유 먹는 아기도 트림이 필요해요");
    
    options['3_1'] = new Option("아기가 우는 이유는?", "3개월 월령별 육아 미션");  
    options['3_2'] = new Option("이유식이 너무 빠르면?", "아기에게 필요한 장난감?");  
    options['3_3'] = new Option("수유는 어떻게 할까요?", "두뇌가 쑥쑥");  
    options['3_4'] = new Option("편안한 아기 안기", "1세 육아");
    
    options['4_1'] = new Option("육아상식, 잘 알고 있나요?", "초보 엄마들이 겁먹는 증상");  
    options['4_2'] = new Option("아기- 수면의 과학", "이렇게 먹여보자");  
    options['4_3'] = new Option("기저귀 발진 예방법", "잘못된 수면 자세");  
    options['4_4'] = new Option("아이 운동 발달 놀이", "발달검사, 제때 정확히!");
    
    options['5_1'] = new Option("시기별 쌀죽 끓이기", "세균전쟁에서 승리하는 방법!"); 
    options['5_2'] = new Option("영유아 변비?", "아기말 사용설명서"); 
    options['5_3'] = new Option("똑똑한 아이 만드는 이유식", "젖니 관리법"); 
    options['5_4'] = new Option("아이 외모 가꾸기 속설", "오늘은 아이와 뭐하고 놀까?");
    
    options['6_1'] = new Option("부엌 놀이를 해볼까요?", "출산 후 가슴탄력");  
    options['6_2'] = new Option("5~6개월의 수유", "예방접종 FAQ");  
    options['6_3'] = new Option("질병 및 사고를 예방하는 스케줄 짜기", "젖병대신 컵!");  
    options['6_4'] = new Option("아이의 행동", "애착 육아 실천기"); 
    
    options['7_1'] = new Option("이유식의 관한 엄마들의 오해", "모유에 부족한 영양소?");  
    options['7_2'] = new Option("할머니 육아법에 딴죽걸기", "낯가림을 없애는 법?");  
    options['7_3'] = new Option("다양한 아기 칫솔", "올바른 영양 섭취 가이드");  
    options['7_4'] = new Option("천연 조미료 만들기", "운동 발달 클리닉"); 
    options['8_2'] = new Option("우리 아이 소화기 건강을 부탁해", "배냇머리 밀까 말까?"); 
    
    options['8_1'] = new Option("안아주면 손탄다 VS 안아줄수록 좋다", "아기치아, 관리법은?"); 
    options['8_3'] = new Option("낯가림과 분리불안", "아기 버릇 고치기"); 
    options['8_4'] = new Option("정서 발달 단계", "주의해야할 질병 BEST5");
    
    options['9_1'] = new Option("아이와 하는 스킨십", "아이 잠투정과의 전쟁");  
    options['9_2'] = new Option("대,소 근육 발달 가이드", "아이 잘 키우는 엄마들의 노하우");  
    options['9_4'] = new Option("아이 마음 읽기", "병원 사용 설명서");  
    options['9_3'] = new Option("감기치료의 첫 단추 꿰매기", "울음으로 말해요"); 
    
    
  

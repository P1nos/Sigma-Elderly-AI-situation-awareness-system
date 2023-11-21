$(function () {
    var dateData = []; // 서버에서 가져온 날짜 데이터를 저장할 배열
    var imageMap = {}; // 날짜별 이미지 데이터를 저장할 객체

    // AJAX 요청 보내서 데이터 가져오기
    $.ajax({
        url: './calendar.jsp', // 실제 서버 데이터를 제공하는 JSP 파일로 바꿔야 합니다.
        method: 'GET',
        dataType: 'json',
        success: function (data) {
            // 서버에서 가져온 데이터를 배열에 저장
            dateData = data;
            console.log(dateData);
            // 캘린더 데이터를 업데이트하고 화면 갱신
            updateCalendar();
        },
        error: function (xhr, status, error) {
            console.error('데이터 가져오기 실패:', error);
        }
    });

    function updateCalendar() {
        // 캘린더의 날짜를 업데이트하는 함수

        // 예시: dateData 배열을 순회하며 해당 날짜를 스타일링하고 이미지를 추가
        $('#calendar_content div:not(.blank)').each(function () {
            var dateText = $(this).text();
            for (var i = 0; i < dateData.length; i++) {
                if (dateText === dateData[i].date) {
                    $(this).css('background-color', dateData[i].color);
                    var date = dateData[i].date;

                    // 이미지 정보를 저장한 JSON 데이터에서 이미지를 가져옴
                    var image = dateData[i].image;
                    imageMap[date] = image; // 이미지를 날짜를 키로 매핑

                    if (image) {
                        // 이미지 엘리먼트 추가
                        var imgElement = $('<img class="calendar-image">');
                        imgElement.attr('src', 'data:image/jpeg;base64,' + image);
                        $(this).append(imgElement);
                    }
                    break;
                }
            }
        });
    }
    
	function c() {
		p();
		var e = h();
		var r = 0;
		var u = false;
		l.empty();
		while (!u) {
			if (s[r] == e[0].weekday) {
				u = true
			} else {
				l.append('<div class="blank"></div>');
				r++
			}
		}
		for (var c = 0; c < 42 - r; c++) {
			if (c >= e.length) {
				l.append('<div class="blank"></div>')
			} else {
				var v = e[c].day;
				var m = g(new Date(t, n - 1, v)) ? '<div class="today">' : "<div>";
				l.append(m + "" + v + "</div>")
			}
		}
		var y = o[n - 1];
		a.css("background-color", y).find("h1").text(i[n - 1] + " " + t);
		f.find("div").css("color", y);
		l.find(".today").css("background-color", y);
		d()
	}
	function h() {
		var e = [];
		for (var r = 1; r < v(t, n) + 1; r++) {
			e.push({
				day: r,
				weekday: s[m(t, n, r)]
			})
		}
		return e
	}
	function p() {
		f.empty();
		for (var e = 0; e < 7; e++) {
			f.append("<div>" + s[e].substring(0, 3) + "</div>")
		}
	}
	function d() {
		var t;
		var n = $("#calendar").css("width", e + "px");
		n.find(t = "#calendar_weekdays, #calendar_content").css("width", e + "px").find("div").css({
			width: e / 7 + "px",
			height: e / 7 + "px",
			"line-height": e / 7 + "px"
		});
		n.find("#calendar_header").css({
			height: e * (1 / 7) + "px"
		}).find('i[class^="fa-chevron"]').css("line-height", e * (1 / 7) + "px")
	}
	function v(e, t) {
		return (new Date(e, t, 0)).getDate()
	}
	function m(e, t, n) {
		return (new Date(e, t - 1, n)).getDay()
	}
	function g(e) {
		return y(new Date) == y(e)
	}
	function y(e) {
		return e.getFullYear() + "/" + (e.getMonth() + 1) + "/" + e.getDate()
	}
	function b() {
		var e = new Date;
		t = e.getFullYear();
		n = e.getMonth() + 1
	}



	var e = 480;
	var t = 2013;
	var n = 9;
	var r = [];
	var i = ["JANUARY", "FEBRUARY", "MARCH", "APRIL", "MAY", "JUNE", "JULY", "AUGUST", "SEPTEMBER", "OCTOBER", "NOVEMBER", "DECEMBER"];
	var s = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
	var o = ["#16a085", "#1abc9c", "#c0392b", "#27ae60", "#FF6860", "#f39c12", "#f1c40f", "#e67e22", "#2ecc71", "#e74c3c", "#d35400", "#2c3e50"];
	var u = $("#calendar");
	var a = u.find("#calendar_header");
	var f = u.find("#calendar_weekdays");
	var l = u.find("#calendar_content");

	b();
	c();
	a.find('i[class^="fas fa-chevron"]').on("click", function() {
		var e = $(this);
		var r = function(e) {
			n = e == "next" ? n + 1 : n - 1;
			if (n < 1) {
				n = 12;
				t--
			} else if (n > 12) {
				n = 1;
				t++
			}
			c()
		};
		if (e.attr("class").indexOf("left") != -1) {
			r("previous")
		} else {
			r("next")
		}
	})


    $('#calendar_content').on('click', 'div', function () {
        // 캘린더 날짜를 클릭할 때 이미지 및 날짜 정보 업데이트 코드

        var selectedDate = $(this).text();
        $('#selected-date-info').text('선택한 날짜: ' + selectedDate);
        $('#selected-date-info').addClass('selected-date-info');

        // 이미지 표시
        var selectedImage = imageMap[selectedDate];
        if (selectedImage) {
            // 선택한 날짜에 이미지가 있을 경우 이미지 엘리먼트 업데이트
            $('#selected-image').attr('src', 'data:image/jpeg;base64,' + selectedImage);
        } else {
            // 이미지가 없는 경우 메시지 출력 또는 이미지를 숨김
            $('#selected-image').attr('src', ''); // 이미지 제거
            // 또는 이미지가 없는 메시지를 표시할 수 있습니다.
        }
    });
});
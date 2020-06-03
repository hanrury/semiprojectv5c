$('#ybdregbtn').on('click', function () {
    if ($('#title2').val() == '') {
        alert('제목을 입력하세요!!');
        $('#title2').focus();

    } else if ($('#userid').val() == '') {
        alert('작성자를 입력하세요!!');
        $('#userid').focus();

    } else if ($('#contents').val() == '') {
        alert('본문을 입력하세요!!');
        $('#contents').focus();

    } else {
        $('#ybdfrm').submit();
    }
}); // 새글등록

$('#newybd').on('click', function () {
    location.href = '/yboard/write.do';
}); // 새글쓰기

$('#lstybd').on('click', function () {
    location.href = '/yboard/list.do';
}); // 목록으로

$('#ybdnobtn').on('click', function () {
    location.href = '/yboard/list.do';
}); // 취소하기

$('#delybd').on('click', function () {
    location.href =
        '/yboard/delete.do?yno=${param.yno}';
}); // 삭제하기

$('#updybd').on('click', function () {
    location.href =
        '/yboard/update.do?yno=${param.yno}';
}); // 수정하기
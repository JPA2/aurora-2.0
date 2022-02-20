$('div#memberListControl a').click(function(){
    let listType = $("div#memberListControl").attr("data-listType");
    let page = $(this).parent().attr("data-id");
    $.ajax({
        url:"/user/widgets/list-data/" + listType + "/" + page,
        dataType:"html",
    }).done(function(response){
        $('tbody#list-data').html(response);
    });
    return false;
});

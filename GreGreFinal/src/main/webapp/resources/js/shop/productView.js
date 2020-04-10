$(function () {
    $(".fold-table tr.view").on("click", function () {
        $(this).toggleClass("open").next(".fold").toggleClass("open");
    });
});
$(function () {
    $(".prd-option .btn-sel-option ").on("click", function () {
        $(this).toggleClass("open").next(".dropdown-cont").toggleClass("open");
    });
});
/*$(function(){
    $("label.rating-input__star").on("click",function(){
        $(this).parent().children("label").removeClass("selected").children('i').addClass("fa-star-o"); 
        $(this).addClass("selected").prevAll("label").addClass("selected").children('i').removeClass("fa-star-o").addClass("fa-star");
        $(this).children("i").removeClass("fa-star-o").addClass("fa-star"); 
        $("input:radio[name='starPoint']").prop('checked', true); 
        return false;
    })
})*/
$(function () {
    var proQty = $('.pro-qty');
    proQty.prepend('<span class="dec qtybtn">-</span>');
    proQty.append('<span class="inc qtybtn">+</span>');
    $(".btn-option-delete").on("click", function () {
        var $button = $(this);
        var oldValue = $button.parent().find('input').val();
        if ($button.hasClass('inc')) {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            // Don't allow decrementing below zero
            if (oldValue > 0) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 0;
            }
        }
        $button.parent().find('input').val(newVal);
    });

})




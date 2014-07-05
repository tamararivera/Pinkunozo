$(document).bind('page:change', function(){

    var $selected_milestone;
    $('#topics').on('click', '.add-parent-milestone', function(){
        $selected_milestone = $(this).closest('.nested-fields');
    });

    $('body').on('click', '#modal-act .select-parent', function(e){
        e.preventDefault();
        if ($selected_milestone.length) {
            var milestone_id = $(this).attr('href');
            var milestone_name = $(this).attr('data-name');
            $selected_milestone.find('.parent-milestone').children().first().val(milestone_id);
            $selected_milestone.find('.parent-info').html(
                "<div class='col-sm-11 field'><label class='control-label'>Elemento padre</div><div class='parent-name'>"+ milestone_name +"</div></div>");
        }
    })

});
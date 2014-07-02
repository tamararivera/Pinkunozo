$(function(){

    var $selected_milestone;
    $('#topics').on('click', '.add-parent-milestone', function(){
        $selected_milestone = $(this).closest('.nested-fields');
    });

    $('body').on('click', '#modal-act .select-parent', function(e){
        e.preventDefault();
        if ($selected_milestone.length) {
            var milestone_id = $(this).attr('href');
            $selected_milestone.find('.parent-milestone').val(milestone_id);
        }
    })

});
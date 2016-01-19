# jQuery ->
#   $('form').on 'click', '.remove_fields', (event) ->
#     event.preventDefault()
#     $(this).prev('input[type=hidden]').val('1')
#     $(this).closest('fieldset').animate({'max-height': '80px'})
#     $(this).closest('fieldset').find('.removed-notice').show()
#     $(this).closest('fieldset').find('h4.title-of-nested-object').hide()
#     $(this).closest('fieldset').find('h4.removed-note').show()
#     $(this).closest('.removed-notice').prev('fieldset').show()

#   $('form').on 'click', '.restore-fields', (event) ->
#     event.preventDefault()
#     $(this).closest('.removed-notice').prev('fieldset').find('input[type=hidden]').val('false')
#     $(this).closest('fieldset').animate({'max-height': '500px'})
#     $(this).closest('fieldset').find('h4.title-of-nested-object').show()
#     $(this).closest('fieldset').find('h4.removed-note').hide()
#     $(this).closest('.removed-notice').hide()

#   $('form').on 'click', '.add_fields', (event) ->
#     event.preventDefault()
#     time = new Date().getTime()
#     regexp = new RegExp($(this).data('id'), 'g')
#     $(this).before($(this).data('fields').replace(regexp, time))
#     $('fieldset.nested-object-fieldset:last').effect( "highlight", 'green' )

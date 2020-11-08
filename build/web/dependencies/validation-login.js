$(document).ready(function() {
    $('#form-login').validate({
        rules: {
            cpf: { required: true, minlength: 14 },
            senha: { required: true, maxlength: 255 }
        }, messages: {
            cpf: { required: 'CPF é obrigatório.', minlength: 'Mínimo de 14 dígitos.' },
            senha: { required: 'Senha é obrigatória.', maxlength: 'Máximo de 255 dígitos.' }
        },
        submitHandler: function(form) {
          form.submit();
        }
    });
});
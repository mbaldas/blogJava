$(document).ready(function() {
    $('#form-cadastro').validate({
        rules: {
            cpf: { required: true, minlength: 14 },
            nome: { required: true, maxlength: 45 },
            email: { required: true, maxlength: 255  },
            senha: { required: true, maxlength: 255 },
            papel: { required: true }
        }, messages: {
            cpf: { required: 'CPF é obrigatório.', minlength: 'Mínimo de 14 dígitos.' },
            nome: { required: 'Nome obrigatório.', maxlength: 'Máximo de 45 dígitos.' },
            email: { required: 'Email é obrigatório.', maxlength: 'Máximo de 255 dígitos.' },
            senha: { required: 'Senha é obrigatória.', maxlength: 'Máximo de 255 dígitos.' },
            papel: { required: 'Funcao é obrigatória.' }
        },
        submitHandler: function(form) {
          form.submit();
        }
    });
});
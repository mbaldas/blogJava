$(document).ready(function() {
    $('#form-postagem').validate({
        rules: {
            titulo: { required: true, maxlength: 255 },
            conteudo: { required: true }
        }, messages: {
            titulo: { required: 'Titulo é obrigatório.', maxlength: 'Máximo de 255 dígitos.' },
            conteudo: { required: 'Conteúdo é obrigatório.' }
        },
        submitHandler: function(form) {
          form.submit();
        }
    });
});
$(document).ready(data => {
    $('section').load('pages/vctbr.html')
    $('#menuVCTBR').addClass('active')

    function removeClassMenu(){
        $('#menuVCTBR').removeClass('active')
        $('#menuNoticias').removeClass('active')
        $('#menuMasters').removeClass('active')
        $('#menuContatos').removeClass('active')
    }

    $('#menuVCTBR').click(()=>{
        removeClassMenu
        $('section').load('pages/vctbr.html')
        $('#menuVCTBR').addClass('active')  
    })
    $('#menuNoticias').click(()=>{
        removeClassMenu
        $('section').load('pages/noticias.html')
        $('#menuNoticias').addClass('active')  
    })
    $('#menuMasters').click(()=>{
        removeClassMenu
        $('section').load('pages/masters.html')
        $('#menuMasters').addClass('active')  
    })
    $('#menuContatos').click(()=>{
        removeClassMenu
        $('section').load('pages/contatos.html')
        $('#menuContatos').addClass('active')  
    })
})

function enviar(){
    const nome = document.querySelector('#nome')
    const email = document.querySelector('#email')
    const telefone = document.querySelector('#telefone')

    if (nome.value == '' ) {
        alert('Preenchimento do NOME obrigatório!')
    }
    else{
        alert('Olá sr(a) ' + nome.value + ' os seus dados foram encaminhados com sucesso!')
    }
    if (email.value == '' ) {
        alert('Preenchimento de EMAIL obrigatório!')
    }
    else{
        alert('Olá sr(a) ' + nome.value + ' os seus dados foram encaminhados com sucesso!')
    }
    if (telefone.value == '' ) {
        alert('Preenchimento do campo TELEFONE obrigatório!')
    }
    else{
        alert('Olá sr(a) ' + nome.value + ' os seus dados foram encaminhados com sucesso!')
    }
}


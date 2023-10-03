/* var consultaCEP = fetch('https://viacep.com.br/ws/20720310/json').then(res=>res.json()).then(r=> {
    if(r.erro){
        throw Error('Esse cep não existe')
    }else{
        console.log(r)
    }
}).catch(erro => console.log(erro)).finally(mensagem => console.log('Processamento concluído: '+ mensagem)); */

async function buscaEndereco(cep){
    var mensagemErro = document.getElementById('erro')
    mensagemErro.innerHTML = "";
    try {
        var consultaCEP = await fetch(`https://viacep.com.br/ws/${cep}/json`);
        var consultaCepConvertido = await consultaCEP.json()
        if(consultaCepConvertido.error){
            throw Error('CEP não existente')
        }
        var cidade = document.getElementById('cidade')
        var logradouro = document.getElementById('endereco')
        var estado = document.getElementById('estado')
        var bairro = document.getElementById('bairro')

        cidade.value = consultaCepConvertido.localidade;
        logradouro.value = consultaCepConvertido.logradouro;
        estado.value = consultaCepConvertido.uf;
        bairro.value = consultaCepConvertido.bairro

        console.log(consultaCepConvertido)
        return consultaCepConvertido
    } catch (error) {
        mensagemErro.innerHTML = `<p>CEP inválido. Tente novamente!</p>`
        console.log(error)
    }
}

var cep = document.getElementById('cep');
cep.addEventListener("focusout", () => {
    buscaEndereco(cep.value)
});


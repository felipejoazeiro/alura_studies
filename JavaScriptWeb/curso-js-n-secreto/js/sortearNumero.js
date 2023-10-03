const menorValor = 1;
const maiorValor = 12;
const numeroSecreto = gerarNumeroAleatorio();

function gerarNumeroAleatorio(){
    return parseInt(Math.random()*maiorValor+1);
}

console.log(numeroSecreto)

const elementoMaiorValor = document.getElementById('maior-valor')
elementoMaiorValor.innerHTML = maiorValor;

const elementoMenorValor = document.getElementById('menor-valor')
elementoMenorValor.innerHTML = menorValor;
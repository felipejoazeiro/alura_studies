function tocaSom(id){
    document.querySelector(id).play();
}

const listaDeTeclas = document.querySelectorAll('.tecla');

let contador = 0;

for(let contador = 0; contador < listaDeTeclas.length; contador++){
    const tecla = listaDeTeclas[contador]
    const instrumento = tecla.classList[1]

    tecla.onclick = ()=>{
        tocaSom(`#som_${instrumento}`);
    }
    tecla.onkeydown = (e)=>{
        if(e.code == 'Space' || e.code == 'Enter'){
            tecla.classList.add('ativa')
        }
    }
    tecla.onkeyup = ()=>{
        if(e.code == 'Space' || e.code == 'Enter'){
            tecla.classList.remove('ativa')
        }
    }

}
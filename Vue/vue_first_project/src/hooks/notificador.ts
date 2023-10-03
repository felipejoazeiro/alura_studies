import { store } from '@/store';
import { TipoNotificacao } from '../interfaces/INotificacao';
import { NOTIFICAR } from '../store/tipo-mutacoes';

type Notificador = {
    notificar: (tipo: TipoNotificacao, titulo: string, texto: string) => void
}

export default () : Notificador => {
    const notificar = (tipo: TipoNotificacao, titulo: string, texto: string) : void=>{
        store.commit(NOTIFICAR, {
            titulo,
            texto,
            tipo
        })
    }

    return {
        notificar
    }
}
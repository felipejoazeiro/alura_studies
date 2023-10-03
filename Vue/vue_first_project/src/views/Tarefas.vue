<template>
  <Formulario @aoSalvarTarefa="salvarTarefa"/>
  <div class="lista">
    <Box v-if="semTarefas">
        Você não está muito produtivo hoje <span class="has-text-weight-bold">:(</span>
    </Box>
    <div class="field">
      <p class="control has-icons-left">
        <input type="text" class="input" placeholder="Digite para filtrar" v-model="filtro">
        <span class="icon is-small is-left">
          <i class="fas fa-search"></i>
        </span>
      </p>
    </div>
    <Tarefa v-for="(tarefa, index) in tarefas" class="clicavel" :tarefa="tarefa" :key="index" @aoTarefaClicada="selecionarTarefa"  />
    <Modal :mostrar="tarefaSelecionada != null">
      <template v-slot:cabecalho>
        <p class="modal-card-title">Editando uma tarefa</p>
        <button class="delete" aria-label="close" @click="fecharModal"></button>
      </template>
      <template v-slot:corpo>
        <div class="field" v-if="tarefaSelecionada != null">
          <label for="descricaoDaTarefa" class="label">Descrição da Tarefa</label>
          <input type="text" v-model="tarefaSelecionada.descricao" name="" id="nomeDaTarefa" class="input">
        </div>
      </template>
      <template v-slot:rodape>
        <button @click="alterarTarefa" class="button is-success">Salvar Alterações</button>
        <button @click="fecharModal" class="button">Cancelar</button>
      </template>
    </Modal>
  </div>
</template>

<script lang="ts">
import { computed, defineComponent, ref, watchEffect } from "vue";
import Formulario from "../components/Formulario.vue";
import Tarefa from "../components/Tarefa.vue";
import Box from "../components/Box.vue";
import Modal from "../components/Modal.vue";
import ITarefa from "../interfaces/ITarefa"
import { ALTERAR_TAREFA, CADASTRAR_TAREFA, OBTER_PROJETOS, OBTER_TAREFAS } from "@/store/tipo-acoes";
import { useStore } from "@/store";

export default defineComponent({
  name: "App",
  components: {
    Formulario,
    Tarefa,
    Box,
    Modal
  },
  data(){
    return {
      tarefaSelecionada: null as ITarefa | null
    }
  },
  methods: {
    salvarTarefa (tarefa:ITarefa) : void {
      this.store.dispatch(CADASTRAR_TAREFA, tarefa)
    },
    selecionarTarefa(tarefa: ITarefa){
      this.tarefaSelecionada = tarefa
    },
    fecharModal(){
      this.tarefaSelecionada = null
    },
    alterarTarefa(){
      this.store.dispatch(ALTERAR_TAREFA, this.tarefaSelecionada).then(()=> this.fecharModal())
    }
  },
  computed: {
    semTarefas () :boolean {
      return this.tarefas.length == 0
    }
  },
  setup () {
    const store = useStore()
    store.dispatch(OBTER_TAREFAS)
    store.dispatch(OBTER_PROJETOS)

    //const tarefas = computed(() => store.state.tarefa.tarefas.filter(t=>!filtro.value||t.descricao.includes(filtro.value))) Filtro diretamente pela aplicação, sem acesso à API

    const filtro = ref('')

    watchEffect(()=>{
      store.dispatch(OBTER_TAREFAS, filtro.value) //filtro através da API 
    })

    return {
      tarefas: computed(() => store.state.tarefa.tarefas),
      store,
      filtro
    }
  }
});
</script>

<style>
  .clicavel{
    cursor: pointer;
  }
</style>

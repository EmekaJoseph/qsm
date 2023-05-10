import { computed, ref, } from 'vue'
import { defineStore } from 'pinia'
import { TrainingsAPI } from './functions/axiosManager'

export const useTrainings = defineStore('Trainings', () => {
    const list = ref<any>([])
    const loading = ref<boolean>(true)
    const detailsShow = ref<any>({})

    const cart = computed(() => {
        return list.value.filter((x: any) => x.inCart);
    })


    async function getList() {
        const trainings_api = new TrainingsAPI()
        const { data } = await trainings_api.activeTrainings();
        list.value = data
        loading.value = false
    }

    return {
        list,
        loading,
        cart,
        detailsShow,
        getList
    }
})

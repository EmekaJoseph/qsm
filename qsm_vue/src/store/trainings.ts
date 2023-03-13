import { computed, ref, } from 'vue'
import { defineStore } from 'pinia'

export const useTrainings = defineStore('Trainings', () => {
    // const list = ref<any>([])
    const loading = ref<boolean>(true)
    const detailsShow = ref<any>({})
    const cart = computed(() => {
        return list.value.filter((x: any) => x.inCart);
    })



    async function getList() {
        // let { data } = await apiCall();
        // list.value = data
        loading.value = false
    }


    // #############################################################
    const list = ref<any[]>([
        {
            id: '1',
            title: 'Economic Trainings for newbies',
            venue: ' along Masha round about, Surulere',
            image: 'image.jpg',
            info: `Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt necessitatibus perspiciatis
            dignissimos, cupiditate, modi impedit ratione similique sapiente ad vitae, est suscipit alias
            hic maiores dolor illum aliquid nisi minus.`,
            start_date: '23/12/2023',
            end_date: '23/12/2023'

        },

        {
            id: '2',
            title: 'The Best Training of the year',
            venue: ' 55, Ajose Street Lawanson, Lagos',
            image: 'image.jpg',
            info: `Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt necessitatibus perspiciatis
            dignissimos, cupiditate, modi impedit ratione similique sapiente ad vitae, est suscipit alias
            hic maiores dolor illum aliquid nisi minus.`,
            start_date: '2/2/2023',
            end_date: '2/2/2023'
        }
    ])






    return {
        list,
        loading,
        cart,
        detailsShow,
        getList
    }
})

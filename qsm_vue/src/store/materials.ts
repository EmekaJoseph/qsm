import { ref } from 'vue'
import { defineStore } from 'pinia'
import { UsersAPI } from './functions/axiosManager'

export const useCourseMaterials = defineStore('CourseMaterials', () => {
    const list = ref<any>([])
    const categories = ref<any[]>([])
    const loading = ref<boolean>(true)
    const searchLoading = ref<boolean>(false)
    const noSearchResults = ref(false)
    const users_api = new UsersAPI()

    async function getLatestMaterials() {
        const materialsList = await users_api.latestMaterials()
        list.value = materialsList.data

        const categoryList = await users_api.availableCategories()
        categories.value = categoryList.data

        loading.value = false
        searchLoading.value = false

    }

    async function materialsByCaterogy(category_id: any) {
        const { data } = await users_api.materialsByCategory(category_id)
        list.value = data
        searchLoading.value = false
    }

    async function materialsByName(name: string) {
        const { data } = await users_api.materialsByName(name)
        noSearchResults.value = !data.length ? true : false
        console.log(data);

        list.value = data
        searchLoading.value = false
    }

    return {
        list,
        loading,
        searchLoading,
        categories,
        getLatestMaterials,
        materialsByCaterogy,
        materialsByName,
    }
})

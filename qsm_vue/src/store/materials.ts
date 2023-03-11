import { ref, } from 'vue'
import { defineStore } from 'pinia'

export const useCourseMaterials = defineStore('CourseMaterials', () => {
    const list = ref<any>([])






    return {
        list,
    }
})

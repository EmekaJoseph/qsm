import { ref } from 'vue'
import { defineStore } from 'pinia'

export const useCourseMaterials = defineStore('CourseMaterials', () => {
    // const list = ref<any>([])
    // const categories = ref<string[]>([])
    const loading = ref<boolean>(true)

    async function getList(name = '', category = 'All') {
        // let { data } = await apCall();
        // list.value = data
        console.log(name, category);

        getCategories()
        loading.value = false

    }

    function getCategories() {
        // categories.value = data
    }





    // ##################################################################

    const categories = ref<string[]>([
        'Laboratory',
        'Food',
        'Pharmaceutical',
        'SMEs',
        'Water',
        'ICT/Accounting',
        'Administration',
        'Microbiology/Chemistry',
        'Regulatory Requirements',
        'Methods and Specifications',
        'Miscellaneous',
    ])


    const list = ref<any>([
        {
            id: '1',
            name: 'The Concept of Biology',
            category: ' Microbiology/Chemistry',
            pages: '27'
        },
        {
            id: '2',
            name: 'Terminologies of faith in Christ',
            category: 'Miscellaneous',
            pages: '45'
        },
        {
            id: '3',
            name: 'The 79 Rules of using computer in the Country of apes in uniform',
            category: 'ICT/Accounting',
            pages: '100'
        }
    ])


    return {
        list,
        loading,
        categories,
        getList
    }
})

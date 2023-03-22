import { ref } from 'vue'
import { defineStore } from 'pinia'
import { useStorage } from '@vueuse/core'

export const useAccount = defineStore('account', () => {
    const nullState = {
        id: null,
        username: null,
        role: null,
    }

    const state = ref<any>(useStorage('qsm_id', nullState, localStorage))
    const token = ref<any>(useStorage('kue_es_em__tk', '', localStorage))

    return {
        state,
        nullState,
        token,
    }

})

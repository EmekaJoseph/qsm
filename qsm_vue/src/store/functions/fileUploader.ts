import { ref, watch, reactive, computed } from 'vue'

export function fileUploader() {
    const newFile = ref<any>('')
    const fileURL = ref<any>('')

    const fileSize: any = reactive({
        kb: computed(() => {
            return (newFile.value.size / 1024).toFixed(2)
        }),
        mb: computed(() => {
            return (fileSize.kb / 1024).toFixed(2)
        })
    })

    function fileUploadFn(event: any) {
        if (event.target.files.length === 0) {
            newFile.value = ''
            fileURL.value = ''
            return
        }
        newFile.value = event.target.files[0]
    }

    watch(newFile, (newFile) => {
        if (!(newFile instanceof File)) {
            return;
        }
        let fileReader = new FileReader
        fileReader.readAsDataURL(newFile)
        fileReader.addEventListener('load', () => {
            fileURL.value = fileReader.result
        })
    })

    return { fileUploadFn, fileURL, newFile, fileSize }
}
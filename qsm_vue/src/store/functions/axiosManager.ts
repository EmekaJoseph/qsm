import axios from 'axios'


const hostURL = 'http://127.0.0.1:8000' //dev
// const hostURL = '' //build

const apiURL = `${hostURL}/api/`

const $instance = axios.create({
    baseURL: apiURL,
    headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json;charset=UTF-8;text/json',
        withCredentials: true,
    },
})

const $instanceForm = axios.create({
    baseURL: apiURL,
    headers: {
        Accept: 'application/json',
        "Content-Type": "multipart/form-data",
        withCredentials: true,
    },
})



class UsersAPI {
    visitor() {
        return $instance.post(`visitor`)
    }

    registerTraining(data: object) {
        return $instance.post(`trainings/register`, JSON.stringify(data))
    }

    latestMaterials() {
        return $instance.get(`latestMaterials`)
    }

    materialsByCategory(category_id: any) {
        return $instance.get(`materialsByCategory/${category_id}`)
    }

    materialsByName(name: any) {
        return $instance.get(`materialsByName/${name}`)
    }

    downloadMaterial(code: any) {
        return $instance.get(`downloadMaterial/${code}`)
    }

    availableCategories() {
        return $instance.get(`availableCategories`)
    }
}


class TrainingsAPI {
    list() {
        return $instance.get(`trainings`)
    }

    addNew(form: FormData) {
        return $instanceForm.post(`trainings`, form)
    }

    updateDetail(id: string, data: any) {
        return $instanceForm.post(`updateTraining/${id}`, data)
    }

    remove(id: string) {
        return $instance.delete(`trainings/${id}`)
    }

    registrationList(id: any) {
        return $instance.get(`registrationList/${id}`)
    }

    deleteRegistration(id: string) {
        return $instance.delete(`deleteRegistration/${id}`)
    }
}

class MaterialsAPI {
    addNew(form: FormData) {
        return $instanceForm.post(`materials`, JSON.stringify(form))
    }

    listForAdmin() {
        return $instance.get(`materials`)
    }

    remove(id: any) {
        return $instance.delete(`materials/${id}`)
    }

    generate_pin(material_id: any, ref: string) {
        return $instance.get(`generate_pin/${material_id}/${ref}`)
    }

    delete_pin(id: any) {
        return $instance.delete(`delete_pin/${id}`)
    }

    view_pins() {
        return $instance.get(`view_pins`)
    }

    getCategories() {
        return $instance.get(`getCategories`)
    }

    addCategory(data: object) {
        return $instance.post(`addCategory`, JSON.stringify(data))
    }

    renameCategory(data: object) {
        return $instance.post(`renameCategory`, JSON.stringify(data))
    }

    deleteCategory(category_id: any) {
        return $instance.delete(`deleteCategory/${category_id}`)
    }
}

class ArchiveAPI {
    create(data: any) {
        return $instance.post(`archive`, JSON.stringify(data))
    }

    list() {
        return $instance.get(`archive`)
    }

    updateDetails(archive_id: string, data: any) {
        return $instance.put(`archive/${archive_id}`, JSON.stringify(data))
    }

    remove(archive_id: string) {
        return $instance.delete(`archive/${archive_id}`)
    }

    materialToArchive(data: any) {
        return $instance.post(`materialToArchive`, JSON.stringify(data))
    }

    archiveDetails(id: any) {
        return $instance.post(`archiveDetails/${id}`)
    }
}


export {
    hostURL,
    UsersAPI,
    TrainingsAPI,
    MaterialsAPI,
    ArchiveAPI
}
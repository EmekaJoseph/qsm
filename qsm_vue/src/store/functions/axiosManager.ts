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

// create interceptor for renewing token
$instance.interceptors.request.use(
    (config: any) => {
        const token = localStorage.getItem('kue_es_em__tk');
        if (token) config.headers.Authorization = `Bearer ${token}`;
        return config;
    }
);

$instanceForm.interceptors.request.use(
    (config: any) => {
        const token = localStorage.getItem('kue_es_em__tk');
        if (token) config.headers.Authorization = `Bearer ${token}`;
        return config;
    }
);

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

    sendDownloadRequest(data: any) {
        return $instance.post(`sendDownloadRequest`, JSON.stringify(data))
    }

    availableCategories() {
        return $instance.get(`availableCategories`)
    }

    sendMessage(data: object) {
        return $instance.post(`sendMessage`, JSON.stringify(data))
    }

    newsLetterSub(email: string) {
        return $instance.get(`newsLetterSub/${JSON.stringify(email)}`)
    }

    newsLetterUnsub(email: string) {
        return $instance.get(`newsLetterUnsub/${JSON.stringify(email)}`)
    }
}

class AdminAPI {
    login(data: object) {
        return $instance.post(`login`, JSON.stringify(data))
    }

    logout(id: any) {
        return $instance.post(`logout/${id}`,)
    }

    overview(data: object) {
        return $instance.post(`overview`, JSON.stringify(data))
    }

    newUser(data: object) {
        return $instance.post(`newUser`, JSON.stringify(data))
    }

    changePassword(data: object) {
        return $instance.post(`changePassword`, JSON.stringify(data))
    }

    getMessages() {
        return $instance.get(`getMessages`)
    }

    deleteMessage(id: any) {
        return $instance.delete(`deleteMessage/${id}`,)
    }

    newslettersList() {
        return $instance.get(`newslettersList`)
    }
}


class TrainingsAPI {
    list() {
        return $instance.get(`trainings`)
    }

    details(id: any) {
        return $instance.get(`trainings/${id}`)
    }

    activeTrainings() {
        return $instance.get(`activeTrainings`)
    }

    nextComingTraining() {
        return $instance.get(`nextComingTraining`)
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
        return $instanceForm.post(`materials`, form)
    }

    listForAdmin() {
        return $instance.get(`materials`)
    }

    updateDetails(id: any, obj: any) {
        return $instance.put(`materials/${id}`, JSON.stringify(obj))
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
        return $instance.get(`archive/${id}`)
    }
}

class BlogAPI {
    create(data: any) {
        return $instanceForm.post(`blog`, data)
    }

    list() {
        return $instance.get(`blog`)
    }

    updateBlog(blog_id: string, data: any) {
        return $instanceForm.post(`updateBlog/${blog_id}`, data)
    }

    remove(blog_id: any) {
        return $instance.delete(`blog/${blog_id}`)
    }

    blogDetails(blog: any) {
        return $instance.get(`blog/${blog}`)
    }
}

class NewsLetterAPI {
    create(data: any) {
        return $instanceForm.post(`newsletter`, data)
    }

    list() {
        return $instance.get(`newsletter`)
    }

    updateNewsletter(id: string, data: any) {
        return $instance.put(`newsletter/${id}`, data)
    }

    remove(id: any) {
        return $instance.delete(`newsletter/${id}`)
    }

    details(id: any) {
        return $instance.get(`newsletter/${id}`)
    }
}


export {
    hostURL,
    UsersAPI,
    AdminAPI,
    TrainingsAPI,
    MaterialsAPI,
    ArchiveAPI,
    BlogAPI,
    NewsLetterAPI
}
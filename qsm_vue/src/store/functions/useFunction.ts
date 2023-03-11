import { reactive } from 'vue'
import Swal from 'sweetalert2'

const fx = reactive({

    isEmail: (email: string) => {
        // eslint-disable-next-line no-useless-escape
        const regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        return regex.test(email)
    },


    isExtension: (fileName: string, requiredFormats: string[]) => {
        const regex = new RegExp('[^.]+$');
        const ext: any = fileName.match(regex);
        // get the extension
        const fileExtension = ext[0].toLowerCase()
        //make sure the file is a valid  format
        if (!(requiredFormats.some(x => x == fileExtension.toLowerCase()))) return false
        else return true
    },

    truncateStr(str: string, num: number) {
        if (str.length > num) {
            return str.slice(0, num) + "...";
        } else {
            return str;
        }
    },

    Toast: (text: string, icon: any) => {
        Swal.fire({
            toast: true,
            icon: `${icon}`,
            text: `${text}`,
            position: 'top-right',
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: false,
            padding: 10,
            iconColor: '#2c3e50',
        })
    },

    Confirm: (text: string, btnText: string, icon: string) => {
        return Swal.fire({
            // title: `${title}`,
            text: `${text}`,
            icon: `${icon}`,
            iconColor: '#2c3e50',
            showCancelButton: true,
            confirmButtonText: `${btnText}`,
            cancelButtonText: 'cancel',
            confirmButtonColor: '#f15825',
            reverseButtons: true,
            width: '350px',
            // position: 'bottom',
        })
    },
})

export default {
    fx
}
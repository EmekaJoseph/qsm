<template>
    <div class="services-section pt-70 pb-80">
        <div class="container">
            <div class="section-head pb-65">
                <div class="row align-items-center">
                    <div class="col-sm-12 col-md-12 col-lg-4">
                        <div class="section-title">
                            <h5>// FAQS</h5>
                            <h3>Freqently Asked Questions</h3>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-8">
                        <div class="section-head-content">
                            <p class="pt-0 pb-0">Our Frequently Asked Questions that make help you understand some of our
                                modes of operations.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section-slide">
                <!-- <img class="codeImg" src="@/assets/images/dots.png" alt="" /> -->
                <div class="container">
                    <div class="row justify-content-center gy-3 gx-lg-4">
                        <div class="animate__animated animate__slideInUp  col-md-12">
                            <div class="mb-3">
                                <div class="text">
                                    <div class="accordion accordion-flush" id="accordionExample">
                                        <div v-for="(faq, index) in faqs" :key="index" class="accordion-item">
                                            <h2 @click="showing = faq.question" class="accordion-header"
                                                :id="'heading' + index">
                                                <button class="accordion-button headTopic"
                                                    :class="{ 'collapsed': faq.question != showing }" type="button"
                                                    data-bs-toggle="collapse" :data-bs-target="'#collapse_' + index"
                                                    aria-expanded="true" :aria-controls="'#collapse_' + index">
                                                    {{ faq.question }}
                                                </button>
                                            </h2>
                                            <div :id="'#collapse_' + index" class="accordion-collapse collapse"
                                                :class="{ 'show': faq.question == showing }"
                                                :aria-labelledby="'heading' + index" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p class=" fst-italic text-muted">
                                                        {{ faq.answer }}
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'


const faqs: any = [
    {
        question: `Which trainings do you offer?`,
        answer: `We offer trainings, seminars, workshops and facility audit for Food, Pharmaceutical, Water and Cosmetic Manufacturers, as well as Managerial training and Accounting Services.`,
    },
    {
        question: `Are your classes virtual only?`,
        answer: `No, we offer both physical (on-site and off-site) and virtual classes. `,
    },
    {
        question: `Do you have course materials for your trainings?`,
        answer: `Yes, we do. it will be sent to your email after each training session in line with our Terms and Conditions. `,
    },
    {
        question: `How do I subscribe to your newsletters?`,
        answer: `Kindly sign up using the link to start receiving our newsletters.`,
    },
    {
        question: `How do I get update of upcoming trainings?`,
        answer: `Once you are signed up, you will definitely get an updates of our trainings. We feature up coming training in our monthly QSM Newsletter and you can access them on our website under Event menu. `,
    },
    {
        question: `How can I pay my training fee?`,
        answer: `When you register for your training(s), you will receive a confirmation e-mail with all the details of payment. Check the website and training flier for Bank details. You will also see our WhatsApp platform details (QSM Register) where you can post your payment details. If you prefer WhatsApp contact, then provide your WhatsApp number.`,
    },
    {
        question: `What happens if I register and do not make it to the training?`,
        answer: `If you register and make the corresponding payment, and then for any reason you cannot make it to the training, you must formally communicate this via email, or the phone number three (3) days prior to the training otherwise you will forfeit the amount paid if nothing was reported. Therefore, it is important to know that the amount already paid for a training course is not refundable in any case.`,
    },
    {
        question: `What happens if I do not complete/ finish up the training course?`,
        answer: `If for any reason you couldn’t complete/ finish the training course, you may have to re-enroll under special conditions if you let us know in due time. If the reason is beyond your control, we will review it and find a solution for you`,
    },
    {
        question: `Can I pay installment payments on any preferred training?`,
        answer: `No, we do not accept installment payment.`,
    },
    {
        question: `Will certificate be issued after each training course?`,
        answer: `Yes a hard copy certificate would be issued and a soft copy sent to your email. The Training fee paid covers for the training certificate, and the training materials.`,
    },
    {
        question: `Can I contact the facilitator after each training course?`,
        answer: `The company policy does not allow this.`,
    },
    {
        question: `Do I have to install any software on my computer?`,
        answer: `Yes, for training on Bookkeeping and Accounting Software.`,
    },
    {
        question: `Can I download course materials/ other resources from the website?`,
        answer: `Yes, you can. All course materials/ resources associated with the course subject matter (videos, power point presentations, links, etc.) are available on the website. A password would be given to you by the administrator after payment is made. The type of material (s) varies depending on the course, subject matter, etc.`,
    },
    {
        question: `Can I cancel or apply for a refund after payment?`,
        answer: `Payment already made for a training course is not refundable in any case.`,
    },
    {
        question: `Is QSM Training and Consulting limited a certified learning institute?`,
        answer: `Yes, we are certified member of the Nigerian Institute of Training and Development (NITAD).`,
    },
    {
        question: `What skills and experience does your facilitators have? `,
        answer: `We are a team of professionals with great wealth of experience, skills and proven track records of delivering results.  You can view our facilitators’ profile. `,
    },
]

const showing = ref(faqs[0].question)

</script>

<style scoped>
.headTopic {
    font-size: 20px;
    font-weight: 400;
}

.accordion-collapse {
    font-style: italic;
}


@media screen and (max-width: 900px) {

    .accordion-collapse p,
    .headTopic {
        font-size: 16px;
    }
}

.accordion-button,
.accordion-button:hover,
.accordion-button:focus,
.accordion-button:active {
    background-color: transparent !important;
    box-shadow: none;
}

.accordion-button:not(.collapsed) {
    color: #FF3C00 !important;
    /* color: #111 !important; */
    font-weight: bold;
}

/* .accordion-button:hover {
    color: #FF3C00 !important;
} */

.accordion-button.collapsed::after {
    background: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%232c3e50'%3e%3cpath fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/%3e%3c/svg%3e");
}

.accordion-button:not(.collapsed)::after {
    background: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%232c3e50'%3e%3cpath fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/%3e%3c/svg%3e");
}
</style>
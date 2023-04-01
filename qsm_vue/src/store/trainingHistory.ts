import { ref, } from 'vue'
import { defineStore } from 'pinia'

export const useTraningsHistory = defineStore('TraningsHistoty', () => {
    const list = ref<any[]>([
        {
            title: 'Free Online Training Via Zoom Network ',
            list: [
                {
                    name: 'Standard Operating Procedure (SOP) & Good Documentation Practice in the Healthcare & Food Sector',
                    date: '1st August, 2020'
                }
            ],
        },

        {
            title: 'Richygold International Ltd. -103c, Amuwo Odofin Industrial Scheme, Oshodi, Apapa, Expressway, Lagos.',
            list: [
                {
                    name: 'Good Manufacturing Practices in a Pharmaceutical Plant',
                    date: 'Aug, 2019'
                },
                {
                    name: 'Regulatory Requirements for Product Licencing',
                    date: 'Aug, 2019'
                },
                {
                    name: 'Materials Systems Management in Pharmaceutical Plant ',
                    date: 'Aug, 2019'
                },
                {
                    name: 'Good Documentation Practices ',
                    date: 'Aug, 2019'
                },
                {
                    name: 'Water Quality Management ',
                    date: 'Aug, 2019'
                },
                {
                    name: 'Water Treatment management',
                    date: 'Sept., 2019'
                },
                {
                    name: 'Achieving Quality & Regulatory Compliance   ',
                    date: 'Sept., 2019'
                },
            ],
        },

        {
            title: '3rd Microbiology Training 2019 ',
            list: [
                {
                    name: `Innovative practical approach to today's challenges in food and drink manufacturing, pharmaceuticals and retail sectors`,
                    date: 'July, 2019.'
                }
            ],
        },

        {
            title: `In-House training for Chi Pharmaceuticals Ltd – 14, Chivita Avenue, Ajao Estate, Lagos, Nigeria `,
            list: [
                {
                    name: 'Introduction to Stress Testing in Medicinal Plants ',
                    date: 'May 2018'
                }
            ],
        },

        {
            title: `In-House training Aboniki Nigeria Ltd. – 10 – 12, Izu Osayogue Road, Iduwinna Iguosa, Edo, 	Nigeria`,
            list: [
                {
                    name: 'Good Manufacturing Practice',
                    date: 'August, 2018'
                }
            ],
        },

        {
            title: `2nd Microbiology Training 2018 
            Covenant University In-conjunction with QSM Training & Consulting Ltd        `,
            list: [
                {
                    name: ' Practices and Standards in Food and Medicinal Products ',
                    date: ' October, 2018 '
                }
            ],
        },

        {
            title: `In-House training for West African Seasoning Company Ltd – 37 Creek Road, Apapa, Lagos, Nigeria.`,
            list: [
                {
                    name: 'Regulatory Requirement for Food Product Licencing',
                    date: ' April, 2017 '
                }
            ],
        },

        {
            title: `Richygold International Ltd. – 103c, Amuwo Odofin Industrial Scheme, Oshodi, Apapa, Expressway, Lagos, Nigeria `,
            list: [
                {
                    name: 'Quality Assurance',
                    date: 'Aug., 2017'
                },
                {
                    name: 'Good Manufacturing Practice in Pharmaceutical Industry  ',
                    date: 'Sept., 2017'
                },
            ],
        },

        {
            title: `In-House training for Goko Herbs West African Ltd – 7/9 Olushola Ogundipe Street, Ago-Okota, 	Isolo, Lagos.`,
            list: [
                {
                    name: "Good Manufacturing Practice",
                    date: 'Sept., 2017'
                }
            ],
        },

        {
            title: 'In-house training for Butchers & Bakers Ltd – 11, Olanrewaju Street, Oregun, Lagos, Nigeria ',
            list: [
                {
                    name: ' Good manufacturing Practices and Hazard Analysis Critical Control',
                    date: 'Nov., 2017'
                }
            ],
        },

        {
            title: 'Adonko Bitters Ltd – Plot 32, Kronum – Abouhia, Kumasi, Ghana',
            list: [
                {
                    name: 'Good Practices for Quality Control Laboratories',
                    date: 'December, 2017'
                }
            ],
        },

        {
            title: `In-House training for Chi Pharmaceuticals Ltd – 14, Chivita Avenue, Ajao Estate, Lagos, Nigeria `,
            list: [
                {
                    name: 'Good Practices for Quality Control Laboratories',
                    date: 'November, 2017.'
                }
            ],
        },

        {
            title: `Good Manufacturing Practices for 3 companies`,
            list: [
                {
                    name: 'Tasty Time Nigeria Ltd.,',
                    date: 'July 2016'
                },
                {
                    name: 'Petadis Ent.,',
                    date: 'July 2016'
                },
                {
                    name: 'Emerald.',
                    date: 'July 2016'
                },
            ],
        },

        {
            title: `In-House training for West African Seasoning Company Ltd – 37 Creek Road, Apapa, Lagos, Nigeria.`,
            list: [
                {
                    name: 'Food Safety through Risk Assessment of the Value Chain',
                    date: ' July, 2016'
                },
            ],
        },

        {
            title: "NAFDAC In-collaboration with QSM Training & Consulting Ltd ",
            list: [
                {
                    name: 'Water Quality Management',
                    date: 'November, 2016'
                },
            ],
        },

        {
            title: "1st Microbiology Training 2012",
            list: [
                {
                    name: 'Workshop on System Development for Microbiologists in the Pharmaceutical, Cosmetics and Food Industries  ',
                    date: 'July, 2012.'
                },
            ],
        },
    ])

    return {
        list,
    }
})

import { ref, } from 'vue'
import { defineStore } from 'pinia'

export const useTranings = defineStore('Tranings', () => {
    const list = ref<any[]>([
        {
            title: 'Onsite Training @ 68, Randle Avenue, Surulere, Lagos.',
            list: [
                {
                    name: 'Good Documentation Practice',
                    date: '24th - 25th March, 2022.'
                }
            ],
        },

        {
            title: 'In-House training for Goko Herbs West African Limited @ 79, Olushola Ogundipe Street, Ago-Okota, Isolo, Lagos.',
            list: [
                {
                    name: 'Managing Food Safety Through Risk Assessment - HACCP (Module 1)',
                    date: '23rd - 24th September, 2021. '
                }
            ],
        },

        {
            title: 'In-House training for Thislerock Enterprise Ltd @ 256, Etim Inyang Crescent, Victoria Island, Lagos. ',
            list: [
                {
                    name: 'Good Manufacturing Practice',
                    date: '30th September, 2021. '
                }
            ],
        },

        {
            title: 'Onsite Training @ Lagos Chamber of Commerce & Industry – 10, Nurudeen Olowopopo Drive, Beside MKO Abiola Garden, Alausa, Ikeja, Lagos.',
            list: [
                {
                    name: 'Good Documentation Practice for Alcoholic Bitters Manufacturers',
                    date: '28th October, 2021'
                }
            ],
        },

        {
            title: 'Onsite Training @ Lagos Chamber of Commerce & Industry – 10, Nurudeen Olowopopo Drive, Beside MKO Abiola Garden, Alausa, Ikeja, Lagos.',
            list: [
                {
                    name: 'Good Documentation Practice for Alcoholic Bitters Manufacturers',
                    date: '23rd September, 2020'
                }
            ],
        },

        {
            title: 'Online training on Standard Operating Procedure (SOP) & Good Documentation Practice (GDP)',
            list: [
                {
                    name: ' FREE via ZOOM NETWORK',
                    date: ' 1st August, 2020'
                }
            ],
        },

        {
            title: 'In-House training for West African Seasoning Company Ltd @ 37 Creek Road, Apapa, Lagos, Nigeria.',
            list: [
                {
                    name: ' Quality Assurance',
                    date: ' 30th November, 2019'
                }
            ],
        },

        {
            title: "In-House & Onsite training for Richygold International Ltd. @ 103c, Amuwo Odofin Industrial Scheme, Oshodi, Apapa, Expressway, Lagos.",
            list: [
                {
                    name: 'Good Manufacturing Practices in a Pharmaceutical Plant',
                    date: '8th – 9th Aug, 2019'
                },
                {
                    name: 'Regulatory Requirements for Product Licencing ',
                    date: '15th Aug., 2019'
                },
                {
                    name: 'Materials Systems Management in Pharmaceutical Plant ',
                    date: ' 16th Aug., 2019'
                },
                {
                    name: 'Good Documentation Practices ',
                    date: '23rd Aug., 2019'
                },
                {
                    name: 'Water Quality Management',
                    date: '31st Aug., 2019'
                },
                {
                    name: 'Water Treatment Management',
                    date: '6th Sept., 2019'
                },
                {
                    name: 'Achieving Quality & Regulatory Compliance',
                    date: '13th Sept., 2019'
                },

            ],
        },

        {
            title: '3rd Microbiology Training 2019 @ Lagos Chamber of Commerce & Industry – 10, Nurudeen Olowopopo Drive, Beside MKO Abiola Garden, Alausa, Ikeja, Lagos. (Onsite)',
            list: [
                {
                    name: "Innovative practical approach to today's challenges in food and drink manufacturing, pharmaceuticals and retail sectors ",
                    date: ' 30th – 31st August, 2019.'
                }
            ],
        },

        {
            title: 'In-House training for Chi Pharmaceuticals Ltd @ 14, Chivita Avenue, Ajao Estate, Lagos, Nigeria',
            list: [
                {
                    name: ' Introduction to Stress Testing in Medicinal Plants',
                    date: '25th May, 2018.'
                }
            ],
        },

        {
            title: 'In-House training Aboniki Nigeria Ltd. @ 10 – 12, Izu Osayogue Road, Iduwinna Iguosa, Edo, Nigeria',
            list: [
                {
                    name: 'Good Manufacturing Practice',
                    date: '28th - 29th August, 2018'
                }
            ],
        },

        {
            title: "2nd Microbiology Training 2018 @Covenant University In-conjunction with QSM Training & Consulting Ltd",
            list: [
                {
                    name: 'Practices and Standards in Food and Medicinal Products',
                    date: '22nd - 25th October, 2018'
                }
            ],
        },

        {
            title: "In-House training for West African Seasoning Company Ltd @ 37 Creek Road, Apapa, Lagos, Nigeria.",
            list: [
                {
                    name: 'Regulatory Requirement for Food Product Licencing',
                    date: '1st April, 2017'
                }
            ],
        },

        {
            title: "Onsite training for Richygold International Ltd. @ @ 103c, Amuwo Odofin Industrial Scheme, Oshodi, Apapa, Expressway, Lagos.",
            list: [
                {
                    name: 'Good Manufacturing Practice in Pharmaceutical Industry',
                    date: ' 31st August, 2017'
                },
                {
                    name: 'Quality Assurance',
                    date: ' 1st Sept., 2017'
                }
            ],
        },

        {
            title: "In-House training for Goko Herbs West African Ltd @ 7/9 Olushola Ogundipe Street, Ago-Okota, Isolo, Lagos.",
            list: [
                {
                    name: 'Good Manufacturing Practice',
                    date: ' 23rd September, 2017'
                },
            ],
        },

        {
            title: "In-house training for Butchers & Bakers Ltd @ 11, Olanrewaju Street, Oregun, Lagos, Nigeria ",
            list: [
                {
                    name: 'Good manufacturing Practices and Hazard Analysis Critical Control',
                    date: '19th - 20th November, 2017'
                },
            ],
        },

        {
            title: "Onsite Training for Adonko Bitters Ltd @ White Brooks Hotel & Suite ",
            list: [
                {
                    name: 'Good Practices for Quality Control Laboratories',
                    date: '18th - 20th December, 2017'
                },
            ],
        },

        {
            title: "In-House training for Chi Pharmaceuticals Ltd @ 14, Chivita Avenue, Ajao Estate, Lagos, Nigeria ",
            list: [
                {
                    name: 'Good Practices for Quality Control Laboratories',
                    date: '9th – 10th November, 2017.'
                },
            ],
        },

        {
            title: "Onsite training on Good Manufacturing Practices for 3 companies  @68, Randle Avenue, Surulere, Lagos. ",
            list: [
                {
                    name: 'Tasty Time Nigeria Ltd.',
                    date: '19th July 2016'
                },
                {
                    name: 'Petadis Ent.',
                    date: '19th July 2016'
                },
                {
                    name: 'Emerald',
                    date: '19th July 2016'
                },
            ],
        },

        {
            title: "In-House training for West African Seasoning Company Ltd @ 37 Creek Road, Apapa, Lagos, Nigeria. ",
            list: [
                {
                    name: 'Food Safety through Risk Assessment of the Value Chain',
                    date: ' 3rd September, 2016'
                },

            ],
        },

        {
            title: "NAFDAC In-collaboration with QSM Training & Consulting Ltd @ 2019 @ Lagos Chamber of Commerce & Industry – 10, Nurudeen Olowopopo Drive, Beside MKO Abiola Garden, Alausa, Ikeja, Lagos ",
            list: [
                {
                    name: 'Water Quality Management',
                    date: ' 9th - 10th November, 2016'
                },

            ],
        },

        {
            title: "1st Microbiology Training 2012 @ Federal Place Hotel, Ikeja, Lagos. ",
            list: [
                {
                    name: 'Workshop on System Development for Microbiologists in the Pharmaceutical, Cosmetics and Food Industries',
                    date: ' 26th July, 2012. '
                },

            ],
        },
    ])






    return {
        list,
    }
})

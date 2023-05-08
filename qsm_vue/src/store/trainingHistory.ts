import { ref, } from 'vue'
import { defineStore } from 'pinia'

export const useTraningsHistory = defineStore('TraningsHistoty', () => {
    const list = ref<any[]>([

        {
            title: `Microbiology Training @Federal Place Hotel, Ikeja, Lagos`,
            list: [
                {
                    name: 'Workshop on System Development for Microbiologists in the Pharmaceutical, Cosmetics and Food Industries',
                    date: 'July, 2012.'
                }
            ]
        },


        {
            title: `In-House training on Good Manufacturing Practices for 3 companies`,
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
            title: `In-House training for West African Seasoning Company Ltd`,
            list: [
                {
                    name: 'Food Safety through Risk Assessment of the Value Chain',
                    date: ' July, 2016'
                },
            ],
        },

        {
            title: `NAFDAC In-collaboration with QSM Training & Consulting Ltd @ Lagos Chamber of Commerce & Industry – Beside MKO Abiola Garden, Alausa, Ikeja`,
            list: [
                {
                    name: 'Water Quality Management',
                    date: 'November, 2016'
                },
            ],
        },

        {
            title: `In-House training for West African Seasoning Company Ltd – 37 Creek Road, Apapa`,
            list: [
                {
                    name: 'Regulatory Requirement for Food Product Licensing',
                    date: 'April, 2017'
                },
            ],
        },

        {
            title: `Richygold International Ltd. – 103c, Amuwo Odofin Industrial Scheme, Oshodi, Apapa.`,
            list: [
                {
                    name: 'Quality Assurance',
                    date: 'Aug., 2017'
                },
                {
                    name: 'Good Manufacturing Practice in Pharmaceutical ',
                    date: 'Sept., 2017'
                },
            ],
        },

        {
            title: `In-House training for Goko Herbs West African Ltd – 7/9 Olushola Ogundipe Street, Ago-Okota, Isolo.`,
            list: [
                {
                    name: 'Good Manufacturing Practice  ',
                    date: 'Sept., 2017'
                },
            ],
        },

        {
            title: `In-house training for Butchers & Bakers Ltd – 11, Olanrewaju Street, Oregun.`,
            list: [
                {
                    name: 'Good manufacturing Practices and Hazard Analysis Critical Control ',
                    date: 'November., 2017'
                },
            ],
        },

        {
            title: `Adonko Bitters Ltd – Plot 32, Kronum – Abouhia, Kumasi, Ghana.`,
            list: [
                {
                    name: 'Good Practices for Quality Control Laboratories',
                    date: 'December., 2017'
                },
            ],
        },

        {
            title: `In-House training for Chi Pharmaceuticals Ltd – 14, Chivita Avenue, Ajao Estate, Lagos, Nigeria `,
            list: [
                {
                    name: 'Good Practices for Quality Control Laboratories ',
                    date: 'November, 2017 '
                },
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
            title: `Microbiology Training @Lagos Chamber of Commerce & Industry.`,
            list: [
                {
                    name: 'on Innovative practical approach to today’s challenges in food and drink manufacturing, pharmaceuticals and retail sectors ',
                    date: 'July, 2019'
                },
            ],
        },

        {
            title: `In-House training for West African Seasoning Company Ltd – 37 Creek Road, Apapa, Lagos, Nigeria.`,
            list: [
                {
                    name: 'Quality Assurance',
                    date: 'November, 2019 '
                }
            ],
        },

        {
            title: 'Free Online Training Via Zoom Network ',
            list: [
                {
                    name: 'Standard Operating Procedure (SOP) & Good Documentation Practice in the Healthcare & Food Sector',
                    date: 'August, 2020'
                }
            ],
        },

        {
            title: 'Onsite Training @ Lagos Chamber of Commerce & Industry  ',
            list: [
                {
                    name: 'Good Documentation Practice for Alcoholic Bitters Manufacturers',
                    date: 'September, 2020'
                }
            ],
        },

        {
            title: 'In-House training for Goko Herbs West African Limited @ 79, Olushola, Ogundipe Street, Ago-Okota. ',
            list: [
                {
                    name: 'Managing Food Safety through Risk Assessment – HACCP (Module 1)',
                    date: 'September, 2021'
                }
            ],
        },

        {
            title: 'In-House training for Thislerock Enterprise Ltd @ 256, Etim Inyang Crescent, VI. ',
            list: [
                {
                    name: 'Good Manufacturing Practice',
                    date: 'September, 2021'
                }
            ],
        },

        {
            title: 'Onsite Training @ Lagos Chamber of Commerce & Industry. ',
            list: [
                {
                    name: 'Good Documentation Practice for Alcoholic Bitters Manufacturers',
                    date: 'October, 2021'
                }
            ],
        },

        {
            title: 'Onsite Training @ QSM Training center, 68, Randle Avenue. ',
            list: [
                {
                    name: 'Good Documentation Practice',
                    date: 'March 2022'
                }
            ],
        },

        {
            title: 'Onsite Training @ QSM Training center, 68, Randle Avenue. ',
            list: [
                {
                    name: 'Practical Application to Quality Risk Management',
                    date: 'August 2022'
                }
            ],
        },

        {
            title: 'Onsite Training @ QSM Training center, 68, Randle Avenue. ',
            list: [
                {
                    name: 'Housekeeping, Cleaning & Sanitation',
                    date: 'August 2022'
                }
            ],
        },

        {
            title: 'Onsite Training @ QSM Training center, 68, Randle Avenue. ',
            list: [
                {
                    name: 'Best Practices for Laboratory assistants',
                    date: 'September 2022'
                },
                {
                    name: 'Leadership and Productivity in Workplace and the importance of Ethics and Moral behavior in career development',
                    date: 'September 2022'
                },
                {
                    name: 'Good Manufacturing Practice [ Module 1], ',
                    date: 'September 2022'
                },
                {
                    name: 'Best Practices for Water Treatment & Management',
                    date: 'September 2022'
                },
            ],
        },

        {
            title: 'Onsite Training @ QSM Training center, 68, Randle Avenue. ',
            list: [
                {
                    name: 'Good Manufacturing Practice [Module 1],  and  Good Practices in Warehouse Management',
                    date: 'October 2022'
                }
            ],
        },

        {
            title: 'Onsite Training on @ QSM Training Palace, 1 Ekololu street.  ',
            list: [
                {
                    name: 'Good Manufacturing Practice [Module 1]',
                    date: 'November 2022'
                }
            ],
        },

        {
            title: 'Onsite Training on @ QSM Training Palace, 1 Ekololu street.  ',
            list: [
                {
                    name: 'GMP in Pharmaceutical Manufacturing',
                    date: 'December 2022'
                }
            ],
        },

        {
            title: 'Onsite Training on @ QSM Training Palace, 1 Ekololu street.  ',
            list: [
                {
                    name: 'GMP in Pharmaceutical Manufacturing (module 1)',
                    date: 'January, 2023'
                }
            ],
        },

        {
            title: 'Onsite Training on @ QSM Training Palace, 1 Ekololu street.  ',
            list: [
                {
                    name: 'Water Quality Parameters and Water Treatment Module 1',
                    date: 'March 2023'
                }
            ],
        },

        {
            title: 'Onsite Training on @ QSM Training Palace, 1 Ekololu street.  ',
            list: [
                {
                    name: 'Good practice of Bookkeeping and Use of QuickBooks Accounting Software',
                    date: 'March 2023'
                }
            ],
        },

        {
            title: 'Onsite Training on @ QSM Training Palace, 1 Ekololu street.  ',
            list: [
                {
                    name: 'Good Manufacturing Practice',
                    date: 'April 2023'
                }
            ],
        },

        {
            title: 'Onsite Training on @ QSM Training Palace, 1 Ekololu street.',
            list: [
                {
                    name: 'Water Treatment And Pathogen Control, And Waste Water Treatment',
                    date: 'April 2023'
                }
            ],
        }
    ])

    return {
        list,
    }
})

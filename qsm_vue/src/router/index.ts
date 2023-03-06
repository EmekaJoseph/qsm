import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomePage.vue'
import AboutView from '../views/AboutPage.vue'
// import HomeLayout from '../views/HomeLayout.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  linkActiveClass: 'active',
  routes: [
    {
      path: '/',
      name: 'Home',
      component: HomeView
    },

    {
      path: '/about',
      name: 'About',
      component: AboutView
    },

    // {
    //   path: '/',
    //   component: HomeLayout,
    //   children: [
    //     { path: '', name: 'Home', component: HomeView },
    //   ],
    // },




    // {
    //   path: '/about',
    //   name: 'about',

    //   component: () => import('../views/AboutPage.vue')
    // }
  ]
})

export default router

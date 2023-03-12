import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomePage.vue'
import AboutView from '../views/AboutPage.vue'
// import ArchivePage from '../views/ArchivePage.vue'
import TrainingsPage from '../views/TrainingsPage.vue'
import MaterialsPage from '../views/MaterialsPage.vue'
import BlogsPage from '../views/BlogPage.vue'



import PageNotFound from '../views/PageNotFound.vue'









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
    //   path: '/archive',
    //   name: 'Archive',
    //   component: ArchivePage
    // },

    {
      path: '/trainings',
      name: 'Trainings',
      component: TrainingsPage
    },

    {
      path: '/materials',
      name: 'Course Materials',
      component: MaterialsPage
    },

    {
      path: '/blog',
      name: 'Blog',
      component: BlogsPage
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




    {
      path: '/:pathMatch(.*)*',
      name: '404',
      component: PageNotFound
    },
  ],

  scrollBehavior(to) {
    const page: any = {}
    page.top = 0;
    page.behavior = 'smooth';
    if (to.hash) {
      page.el = to.hash
    }
    return page
  },
})

export default router

import { createRouter, createWebHistory } from 'vue-router'
import { useAccount } from '@/store/Account'


import HomeView from '../views/HomePage.vue'
import AboutView from '../views/AboutPage.vue'
import TrainingsPage from '../views/TrainingsPage.vue'
import MaterialsPage from '../views/MaterialsPage.vue'
// import BlogsPage from '../views/BlogPage.vue'


import AdminLogin from '../views/Admin/AdminLogin.vue'
import AdminLayout from '../views/Admin/AdminLayout.vue'
import AdminDashboard from '../views/Admin/AdminDashboard.vue'
import AdminTrainings from '../views/Admin/AdminTrainings.vue'
import AdminArchive from '../views/Admin/AdminArchive.vue'
import AdminMaterials from '../views/Admin/AdminMaterials.vue'
import AdminSettings from '../views/Admin/AdminSettings.vue'
// import AdminRegistrations from '../views/Admin/AdminRegistrations.vue'

import PageNotFound from '../views/PageNotFound.vue'



const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),

  linkActiveClass: 'active',
  routes: [
    { path: '/', name: 'Home', component: HomeView },

    { path: '/about', name: 'About', component: AboutView },

    { path: '/trainings', name: 'Trainings', component: TrainingsPage },

    { path: '/materials', name: 'Course Materials', component: MaterialsPage },

    { path: '/blog', name: 'Blog', component: () => import('../views/BlogPage.vue') },

    {
      beforeEnter: (to, from, next) => {
        const account = useAccount()
        if (account.state.id) {
          next({ path: '/admin/dashboard' });
        }
        else {
          next();
        }
      },
      path: '/admin/login',
      name: 'Login',
      alias: '/admin',
      component: AdminLogin
    },


    {

      path: '/admin',
      beforeEnter: (to, from, next) => {
        const account = useAccount()
        if (!account.state.id) {
          next({ path: '/admin/login' });
        }
        else {
          next();
        }
      },
      component: AdminLayout,
      children: [
        { path: 'dashboard', name: 'Dashboard', component: AdminDashboard },
        { path: 'trainings', name: 'Trainings__', component: AdminTrainings },
        { path: 'archive', name: 'Archive', component: AdminArchive },
        { path: 'materials', name: 'Materials', component: AdminMaterials },
        { path: 'settings', name: 'Settings', component: AdminSettings },
        // { path: 'registrations', name: 'Registrations', component: AdminRegistrations },
      ],
    },





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

router.afterEach((to) => {
  document.title = 'QSM | ' + to.name?.toString();
})

export default router

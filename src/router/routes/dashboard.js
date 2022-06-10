export default [
  {
    path: '/dashboard/statistics',
    name: 'dashboard-statistics',
    component: () => import('@/views/dashboard/statistics/Analytics.vue'),
    meta: {
      action: 'read',
      resource: 'Marketing' || 'Test',
    },
  },
  {
    path: '/dashboard/show_pdf',
    name: 'dashboard-show-pdf',
    component: () => import('@/views/dashboard/show-pdf/Ecommerce.vue'),
    meta: {
      action: 'read',
      resource: 'Marketing',
    },
  },
  {
    path: '/dashboard/management_sales',
    name: 'dashboard-management-sales',
    component: () => import('@/views/dashboard/management-sales/ManagementSales.vue'),
  },
  {
    path: '/dashboard/dashboard_marketing',
    name: 'dashboard-dashboard-marketing',
    component: () => import('@/views/dashboard/dashboard-marketing/DashboardMarketing.vue'),
  },
]

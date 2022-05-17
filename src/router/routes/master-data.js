export default [
  // *===============================================---*
  // *--------- Pengguna ---------------------------------------*
  // *===============================================---*
  {
    path: '/masterdata/users/list',
    name: 'masterdata-users-list',
    component: () => import('@/views/master-data/user/UsersList.vue'),
  },
  {
    path: '/masterdata/users/add',
    name: 'masterdata-users-add',
    component: () => import('@/views/master-data/user/UsersAdd.vue'),
  },
  // *===============================================---*
  // *--------- SYSTEM ---------------------------------------*
  // *===============================================---*
  {
    path: '/masterdata/group-menu/list',
    name: 'masterdata-group-menu-list',
    component: () => import('@/views/dashboard/show-pdf/Ecommerce.vue'),
  },
  // *===============================================---*
  // *--------- ORGANISASI ---------------------------------------*
  // *===============================================---*
  {
    path: '/masterdata/branch/list',
    name: 'masterdata-branch-list',
    component: () => import('@/views/dashboard/show-pdf/Ecommerce.vue'),
  },
  {
    path: '/masterdata/branch-office/list',
    name: 'masterdata-branch-office-list',
    component: () => import('@/views/dashboard/management-sales/ManagementSales.vue'),
  },
  {
    path: '/masterdata/employees/list',
    name: 'masterdata-employees-list',
    component: () => import('@/views/dashboard/management-sales/ManagementSales.vue'),
  },
  {
    path: '/masterdata/coverage-area/list',
    name: 'masterdata-coverage-area-list',
    component: () => import('@/views/dashboard/management-sales/ManagementSales.vue'),
  },
  {
    path: '/masterdata/courier/list',
    name: 'masterdata-courier-list',
    component: () => import('@/views/dashboard/management-sales/ManagementSales.vue'),
  },
  {
    path: '/masterdata/helper/list',
    name: 'masterdata-helper-list',
    component: () => import('@/views/dashboard/management-sales/ManagementSales.vue'),
  },
  {
    path: '/masterdata/vehicle/list',
    name: 'masterdata-vehicle-list',
    component: () => import('@/views/dashboard/management-sales/ManagementSales.vue'),
  },
  {
    path: '/masterdata/pic-invoice/list',
    name: 'masterdata-pic-invoice-list',
    component: () => import('@/views/dashboard/management-sales/ManagementSales.vue'),
  },
  // *===============================================---*
  // *--------- VENDOR ---------------------------------------*
  // *===============================================---*
  {
    path: '/masterdata/vendor/list',
    name: 'masterdata-vendor-list',
    component: () => import('@/views/dashboard/dashboard-marketing/DashboardMarketing.vue'),
  },
  // *===============================================---*
  // *--------- PELANGGAN ---------------------------------------*
  // *===============================================---*
  {
    path: '/masterdata/customer/list',
    name: 'masterdata-customer-list',
    component: () => import('@/views/dashboard/dashboard-marketing/DashboardMarketing.vue'),
  },
  {
    path: '/masterdata/customer-contract/list',
    name: 'masterdata-customer-contract-list',
    component: () => import('@/views/dashboard/dashboard-marketing/DashboardMarketing.vue'),
  },
  // *===============================================---*
  // *--------- PERFORMA MARKETING ---------------------------------------*
  // *===============================================---*
  {
    path: '/masterdata/customer-target',
    name: 'masterdata-customer-target-list',
    component: () => import('@/views/dashboard/dashboard-marketing/DashboardMarketing.vue'),
  },
  {
    path: '/masterdata/sales-target',
    name: 'masterdata-sales-target-list',
    component: () => import('@/views/dashboard/dashboard-marketing/DashboardMarketing.vue'),
  },
]

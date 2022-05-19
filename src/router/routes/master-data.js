export default [
  // *===============================================---*
  // *--------- User ---------------------------------------*
  // *===============================================---*
  {
    path: '/masterdata/users',
    name: 'masterdata-users-list',
    component: () => import('@/views/master-data/user/UserList.vue'),
  },
  {
    path: '/masterdata/users/add',
    name: 'masterdata-users-add',
    component: () => import('@/views/master-data/user/UserAdd.vue'),
    meta: {
      navActiveLink: 'masterdata-users-list',
    },
  },
  {
    path: '/masterdata/users/edit',
    name: 'masterdata-users-edit',
    component: () => import('@/views/master-data/user/UserEdit.vue'),
    meta: {
      navActiveLink: 'masterdata-users-list',
    },
  },
  // *===============================================---*
  // *--------- SYSTEM ---------------------------------------*
  // *===============================================---*
  {
    path: '/masterdata/roles-mapping',
    name: 'masterdata-roles-mapping-list',
    component: () => import('@/views/master-data/system/RoleList.vue'),
  },
  {
    path: '/masterdata/roles-mapping/add',
    name: 'masterdata-roles-mapping-add',
    component: () => import('@/views/master-data/system/RoleAdd.vue'),
    meta: {
      navActiveLink: 'masterdata-roles-mapping-list',
    },
  },
  {
    path: '/masterdata/roles-mapping/edit',
    name: 'masterdata-roles-mapping-edit',
    component: () => import('@/views/master-data/system/RoleEdit.vue'),
    meta: {
      navActiveLink: 'masterdata-roles-mapping-list',
    },
  },
  {
    path: '/masterdata/roles-mapping/edit-detail',
    name: 'masterdata-roles-mapping-edit-detail',
    component: () => import('@/views/master-data/system/RoleEditDetail.vue'),
    meta: {
      navActiveLink: 'masterdata-roles-mapping-list',
    },
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

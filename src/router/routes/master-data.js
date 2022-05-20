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

  // *--------- BRANCH ---------------------------------------*
  {
    path: '/masterdata/branch',
    name: 'masterdata-branch-list',
    component: () => import('@/views/master-data/organization/branch/BranchList.vue'),
  },
  {
    path: '/masterdata/branch/add',
    name: 'masterdata-branch-add',
    component: () => import('@/views/master-data/organization/branch/BranchAdd.vue'),
    meta: {
      navActiveLink: 'masterdata-branch-list',
    },
  },
  {
    path: '/masterdata/branch/edit',
    name: 'masterdata-branch-edit',
    component: () => import('@/views/master-data/organization/branch/BranchEdit.vue'),
    meta: {
      navActiveLink: 'masterdata-branch-list',
    },
  },

  // *--------- BRANCH OFFICE ---------------------------------------*
  {
    path: '/masterdata/branch-office',
    name: 'masterdata-branch-office-list',
    component: () => import('@/views/master-data/organization/branch-office/BranchOfficeList.vue'),
  },
  {
    path: '/masterdata/branch-office/add',
    name: 'masterdata-branch-office-add',
    component: () => import('@/views/master-data/organization/branch-office/BranchOfficeAdd.vue'),
    meta: {
      navActiveLink: 'masterdata-branch-office-list',
    },
  },
  {
    path: '/masterdata/branch-office/edit',
    name: 'masterdata-branch-office-edit',
    component: () => import('@/views/master-data/organization/branch-office/BranchOfficeEdit.vue'),
    meta: {
      navActiveLink: 'masterdata-branch-office-list',
    },
  },

  // *--------- EMPLOYEE ---------------------------------------*
  {
    path: '/masterdata/employees',
    name: 'masterdata-employee-list',
    component: () => import('@/views/master-data/organization/employee/EmployeeList.vue'),
  },
  {
    path: '/masterdata/employees/add',
    name: 'masterdata-employee-add',
    component: () => import('@/views/master-data/organization/employee/EmployeeAdd.vue'),
    meta: {
      navActiveLink: 'masterdata-employee-list',
    },
  },
  {
    path: '/masterdata/employees/edit',
    name: 'masterdata-employee-edit',
    component: () => import('@/views/master-data/organization/employee/EmployeeEdit.vue'),
    meta: {
      navActiveLink: 'masterdata-employee-list',
    },
  },

  // *--------- COVERAGE AREA ---------------------------------------*
  {
    path: '/masterdata/coverage-area',
    name: 'masterdata-coverage-area-list',
    component: () => import('@/views/master-data/organization/coverage-area/CoverageArea.vue'),
  },

  // *--------- COURIER ---------------------------------------*
  {
    path: '/masterdata/courier',
    name: 'masterdata-courier-list',
    component: () => import('@/views/master-data/organization/courier/CourierList.vue'),
  },
  {
    path: '/masterdata/courier/add',
    name: 'masterdata-courier-add',
    component: () => import('@/views/master-data/organization/courier/CourierAdd.vue'),
    meta: {
      navActiveLink: 'masterdata-courier-list',
    },
  },
  {
    path: '/masterdata/courier/edit',
    name: 'masterdata-courier-edit',
    component: () => import('@/views/master-data/organization/courier/CourierEdit.vue'),
    meta: {
      navActiveLink: 'masterdata-courier-list',
    },
  },

  // *--------- HELPER ---------------------------------------*
  {
    path: '/masterdata/helper/list',
    name: 'masterdata-helper-list',
    component: () => import('@/views/dashboard/management-sales/ManagementSales.vue'),
  },

  // *--------- VEHICLE ---------------------------------------*
  {
    path: '/masterdata/vehicle/list',
    name: 'masterdata-vehicle-list',
    component: () => import('@/views/dashboard/management-sales/ManagementSales.vue'),
  },

  // *--------- PIC-INVOICE ---------------------------------------*
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

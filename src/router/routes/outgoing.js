export default [
  // *===============================================---*
  // *--------- User ---------------------------------------*
  // *===============================================---*
  {
    path: '/outgoing/users',
    name: 'outgoing-users-list',
    component: () => import('@/views/master-data/user/UserList.vue'),
  },
  {
    path: '/outgoing/users/add',
    name: 'outgoing-users-add',
    component: () => import('@/views/master-data/user/UserAdd.vue'),
    meta: {
      navActiveLink: 'masterdata-users-list',
    },
  },
  {
    path: '/outgoing/users/edit',
    name: 'outgoing-users-edit',
    component: () => import('@/views/master-data/user/UserEdit.vue'),
    meta: {
      navActiveLink: 'masterdata-users-list',
    },
  },
  // *===============================================---*
  // *--------- SYSTEM ---------------------------------------*
  // *===============================================---*
  {
    path: '/outgoing/roles-mapping',
    name: 'outgoing-roles-mapping-list',
    component: () => import('@/views/master-data/system/RoleList.vue'),
  },
  {
    path: '/outgoing/roles-mapping/add',
    name: 'outgoing-roles-mapping-add',
    component: () => import('@/views/master-data/system/RoleAdd.vue'),
    meta: {
      navActiveLink: 'masterdata-roles-mapping-list',
    },
  },
  {
    path: '/outgoing/roles-mapping/edit',
    name: 'outgoing-roles-mapping-edit',
    component: () => import('@/views/master-data/system/RoleEdit.vue'),
    meta: {
      navActiveLink: 'masterdata-roles-mapping-list',
    },
  },
  {
    path: '/outgoing/roles-mapping/edit-detail',
    name: 'outgoing-roles-mapping-edit-detail',
    component: () => import('@/views/master-data/system/RoleEditDetail.vue'),
    meta: {
      navActiveLink: 'masterdata-roles-mapping-list',
    },
  },
]

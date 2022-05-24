export default [
  // *===============================================---*
  // *--------- User ---------------------------------------*
  // *===============================================---*
  {
    path: '/outgoing/shipping-bag',
    name: 'outgoing-users-list',
    component: () => import('@/views/master-data/user/UserList.vue'),
  },
  {
    path: '/outgoing/shipping-bag/list',
    name: 'outgoing-users-add',
    component: () => import('@/views/master-data/user/UserAdd.vue'),
  },
  {
    path: '/outgoing/shipping-bag/reprint',
    name: 'outgoing-users-edit',
    component: () => import('@/views/master-data/user/UserEdit.vue'),
  },


  {
    path: '/outgoing/entri',
    name: 'outgoing-users-edit',
    component: () => import('@/views/master-data/user/UserEdit.vue'),
  },
  {
    path: '/outgoing/reprint',
    name: 'outgoing-users-list',
    component: () => import('@/views/master-data/user/UserList.vue'),
  },
  {
    path: '/outgoing/void',
    name: 'outgoing-users-add',
    component: () => import('@/views/master-data/user/UserAdd.vue'),
  },
  {
    path: '/outgoing/booking',
    name: 'outgoing-users-edit',
    component: () => import('@/views/master-data/user/UserEdit.vue'),
  },


  {
    path: '/outgoing/shipping-bag',
    name: 'outgoing-users-list',
    component: () => import('@/views/master-data/user/UserList.vue'),
  },
  {
    path: '/outgoing/consol',
    name: 'outgoing-users-add',
    component: () => import('@/views/master-data/user/UserAdd.vue'),
  },
  {
    path: '/outgoing/reprint',
    name: 'outgoing-users-edit',
    component: () => import('@/views/master-data/user/UserEdit.vue'),
  },
  {
    path: '/outgoing/shipping',
    name: 'outgoing-users-edit',
    component: () => import('@/views/master-data/user/UserEdit.vue'),
  },


  {
    path: '/outgoing/report/outstanding',
    name: 'outgoing-users-edit',
    component: () => import('@/views/master-data/user/UserEdit.vue'),
  },
  {
    path: '/outgoing/report/disbag-manifest',
    name: 'outgoing-users-edit',
    component: () => import('@/views/master-data/user/UserEdit.vue'),
  },
  {
    path: '/outgoing/report/deposit-goods',
    name: 'outgoing-users-edit',
    component: () => import('@/views/master-data/user/UserEdit.vue'),
  },
  {
    path: '/outgoing/report/disbag-manifest-v2',
    name: 'outgoing-users-edit',
    component: () => import('@/views/master-data/user/UserEdit.vue'),
  },
]

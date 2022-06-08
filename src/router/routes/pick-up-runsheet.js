export default [
  // *===============================================---*
  // *--------- Pick Up Runsheet ---------------------------------------*
  // *===============================================---*
  {
    path: '/pickup-runsheet',
    name: 'pick-up-runsheet-entry',
    component: () => import('@/views/pick-up-runsheet/pick-up-request-runsheet/EntryPickupRunsheet.vue'),
  },
  {
    path: '/pickup-runsheet/booking',
    name: 'pick-up-runsheet-booking',
    component: () => import('@/views/pick-up-runsheet/pick-up-request-runsheet/BookingPickupRunsheet.vue'),
  },
  {
    path: '/pickup-runsheet/reprint',
    name: 'pick-up-runsheet-reprint',
    component: () => import('@/views/pick-up-runsheet/pick-up-request-runsheet/ReprintPickupRunsheet.vue'),
  },
  {
    path: '/pickup-runsheet/void',
    name: 'pick-up-runsheet-void',
    component: () => import('@/views/pick-up-runsheet/pick-up-request-runsheet/VoidPickupRunsheet.vue'),
  },
  {
    path: '/pickup-runsheet/assignment',
    name: 'pick-up-runsheet-assignment',
    component: () => import('@/views/pick-up-runsheet/pick-up-request-runsheet/AssignmentPickupRunsheet.vue'),
  },
]
